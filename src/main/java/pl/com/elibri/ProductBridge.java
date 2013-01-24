package pl.com.elibri;

import java.util.Date;

public class ProductBridge {
    protected String record_reference;

    public ProductBridge(String record_reference) {
      this.record_reference = record_reference;
      System.out.println("Creating product with record_reference = " + record_reference);
    }
    public void setIsbn13(String isbn13) {
      System.out.println("Setting isbn13 = " + isbn13);
    }

    public void setTitle(String collection_title, String collection_part, String title, String subtitle, String original_title) {
      System.out.println("Setting titles:");
      System.out.println("collection_title = " + collection_title);
      System.out.println("collection_part = " + collection_part);
      System.out.println("title = " + title);
      System.out.println("subtitle = " + subtitle);
      System.out.println("original_title = " + original_title);
    }
    public void setSuggestedRetailPrice(String cover_price) {
      System.out.println("setting suggested retail price = " + cover_price);
    }

    public void setCover(String front_cover_link) {
      System.out.println("setting cover link = " + front_cover_link);
    }
    public void setVat(int vat) {
      System.out.println("setting vat to " + vat);
    }
    public void setUnlimitedLicence(boolean flag) {
      System.out.println("setting unlimited licence to " + flag);
    }
    public void setLicenceEnd(Date licence_limited_to) {
      System.out.println("setting licence_limited_to to " + licence_limited_to);
    }

    public void addFormat(String format) {
      System.out.println("adding format: " + format);
    }
    public void addContributor(String role_name, String person_name) {
      System.out.println("adding " + role_name + ": " + person_name);
    }
    public void addDescription(String description) {}
    public void setStatus(String current_state) {
      System.out.println("setting state to " + current_state);
    }
    public void setPremiere(Date premiere) {
      System.out.println("setting premiere to " + premiere);
    }

    public static void main(String[] args) {
        System.out.println("Ten projekt jest demonstracją możliwości integracji modułu elibri_api_client z javą");
    }
}
