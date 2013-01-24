# encoding: utf-8

if ENV['ELIBRI_API_LOGIN'].nil? || ENV['ELIBRI_API_LOGIN'].size == 0
  puts "proszę ustawić zmienną środowiskową ELIBRI_API_LOGIN"
  exit
end

if ENV['ELIBRI_API_PASSWORD'].nil? || ENV['ELIBRI_API_PASSWORD'].size == 0
  puts "proszę ustawić zmienną środowiskową ELIBRI_API_PASSWORD"
  exit
end

require 'rubygems'
require 'elibri_api_client'
require 'java'
require 'pp'

#maskowanie nazwy klasy
ProductBridge =  Java::Pl::com::elibri::ProductBridge


client = Elibri::ApiClient.new(:login => ENV['ELIBRI_API_LOGIN'], :password => ENV['ELIBRI_API_PASSWORD'], :api_version => 'v1', :onix_dialect => '3.0.1')

#konwersja daty pomiędzy jruby, a javą
def convert_date(date)
  if date.nil?
    nil
  else
    java.util.Date.new(date.to_time.to_i*1000)
  end
end

##pobierz produkt po record reference
product = client.get_product("77c841a6527983c082de")

#wyświelt na konsoli reprezentację produktu
pp product

#zapełnij kolejkę wszystkimi dostępnymi danymi
#client.refill_all_queues!

while true
   #response = client.pop_from_queue("meta", :count => 10)                  #wersja usuwająca z kolejki
   response = client.pop_from_queue("meta", :count => 10, :testing => true) #testing => true - nie usuwa produktu z kolejki
   if response.onix.nil?
     puts 
     puts "no more products in the queue, exiting..."
     exit() 
   end
   response.onix.products.each do |product|
     puts
     br = ProductBridge.new(product.record_reference)
     br.setIsbn13(product.isbn13)
     br.setTitle(product.collection_title, product.collection_part, product.title, product.subtitle, product.original_title)
     br.setSuggestedRetailPrice(product.cover_price.to_s)
     br.setCover(product.front_cover.link) if product.front_cover
     br.setVat(product.vat)
     if product.unlimited_licence?
       br.setUnlimitedLicence(true)
     else
       br.setUnlimitedLicence(false)
       br.setLicenceEnd(convert_date(product.licence_limited_to))
     end
     if product.digital_formats
       product.digital_formats.each do |format|
         br.addFormat(format)
       end
     end
     product.contributors.each do |contributor|
       br.addContributor(contributor.role_name, contributor.person_name)
     end
     br.addDescription(product.description.text) if product.description
     br.setStatus(product.current_state)
     br.setPremiere(convert_date(product.premiere))
   end
end

