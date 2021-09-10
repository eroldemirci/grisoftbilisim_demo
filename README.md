# grisoftware_demo

Projemiz, verilen uzun linkleri https://app.shrtco.de/docs sitesinin API sistemini kullanarak kısa linke çeviren, bu linkleri bir sayfada listelediğimiz ve bu linkleri kopyalayabildiğimiz bir demo uygulaması.


- Tasarımlar responsive bir şekilde tasarlanmıştır.
- State management olarak GetX tercih edilmiştir.
- MVVM mimarisi kullanılmıştır.
- Locale Database olarak Sqflite tercih edilmiştir.

## Kullanılan paketler :
- flutter_svg 
- fluttertoast 
- get 
- http 
- path 
- shared_preferences 
- smooth_page_indicator 
- sqflite

Service bağlantı mimarisi, ui -> controller -> repository -> service -> api   olarak dizaynlanmıştır.



