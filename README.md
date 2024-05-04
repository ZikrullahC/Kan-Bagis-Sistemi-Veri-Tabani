# Veritabanı Projesi

Bu proje, MySQL Workbench kullanılarak tasarlanmış bir veritabanı şemasını içermektedir. Proje, sağlık sektöründe kullanılmak üzere tasarlanmıştır ve kimlik, adres, doktor, kan bankası ve bağış işlemlerini yönetmek için çeşitli tablolar içerir.

## Kurulum

Projeyi kullanmadan önce, MySQL sunucunuzda `mydb` ve `proje_deneme` adında iki şema oluşturmanız gerekmektedir. SQL scripti, bu şemaları otomatik olarak oluşturacak şekilde tasarlanmıştır.

### Adımlar

1. MySQL Workbench'i açın.
2. Menü çubuğundan 'File' > 'Open SQL Script...' seçeneğini kullanarak bu SQL dosyasını açın.
3. SQL scriptini çalıştırmak için 'Execute' (yıldırım simgesi) butonuna tıklayın.

## Şema Detayları

- `mydb`: Kişisel kimlik bilgilerini içeren tabloları barındırır.
- `proje_deneme`: Bağışçılar, doktorlar, kan bankası ve bağış işlemleri ile ilgili tabloları barındırır.

### Tablolar

- `Kimlik`: Kişilerin temel kimlik bilgilerini içerir.
- `Bagisci`: Bağışçıların kişisel ve bağış geçmişi ile ilgili bilgileri içerir.
- `Doktor`: Doktorların çalıştıkları şubeler ile ilgili bilgileri içerir.
- `Kan`: Kan tipleri ve stok bilgilerini içerir.
- `Bagis_islemi`: Bağış işlemlerinin detaylarını içerir.
- `Iletisim`: Kişilerin iletişim bilgilerini içerir.
- `Sube_adres`: Şubelerin adres bilgilerini içerir.

- ![image](https://github.com/ZikrullahC/Kan-Bagis-Sistemi-Veri-Tabani/assets/122087836/c5be1cdc-c25f-4a61-bf66-d2ff10509271)


## Geliştirme

Bu şema, sağlık sektöründeki uygulamalar için bir temel olarak kullanılabilir. İhtiyaca göre tablolar ve ilişkiler genişletilebilir veya modifiye edilebilir.
