elibri_api_client_java_bridge
=============================

Jest to demonstacja, w jaki sposób można użyć biblioteki [elibri_api_client](https://github.com/elibri/elibri_api_client) w środowisku javy.
W tym celu proponujemy użycie jruby, który jest implementacją języka ruby na maszynie wirtualnej javy (JVM). Za komunikację i parsowanie wiadomości 
jest odpowiedzialny skrypt api_client.rb, który przekazuje dane do klasy ProductBridge (src/main/java/pl/com/elibri/ProductBridge.java)

Żeby wypróbować skrypt należy:

1. Zainstalować [jruby](http://jruby.org/). 
2. Zainstalować bibliotekę elibri_api_client: `jgem install elibri_api_client`. Zostaną też zainstalowane wszystkie biblioteki zależne
3. Wyeksportować dane dostępowe do api elibri do zmiennych środowiskowych:
    `export ELIBRI_API_LOGIN=xxx`
    `export ELIBRI_API_PASSWORD=xxx`

4. W razie potrzeby proszę zainstalować [maven](http://maven.apache.org/)
5. Wykonać `./api_client` - zostaje skompilowana klasa ProductBridge, oraz uruchomiony skrypt api_client.rb z odpowiednimi parametrami.



