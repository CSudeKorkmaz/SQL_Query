MySQL Veritabanı Yedekleme ve Geri Yükleme Projesi
📌 Proje Amacı
Bu proje, MySQL Workbench kullanılarak veritabanı yedekleme, geri yükleme, loglama ve zamanlanmış görev (event) sistemlerinin nasıl kullanılacağını göstermeyi amaçlamaktadır. Ayrıca, işlemlerin doğruluğunu test etmek için örnek tablolar ve prosedürler üzerinden uygulamalı bir anlatım sunulmuştur.

🔧 Kullanılan Teknolojiler
Veritabanı: MySQL 8.x

Arayüz: MySQL Workbench

Komutlar: SQL (DDL & DML)

İsteğe bağlı: mysqldump, event_scheduler

📂 Proje İçeriği
1. Veritabanı ve Tablo Oluşturma
sudek adında bir veritabanı oluşturuldu.

kisiler adlı örnek bir tablo oluşturularak veri eklendi.

2. Yedekleme ve Geri Yükleme
MySQL Workbench ile veritabanı dışa aktarıldı.

Yedek dosyası kullanılarak geri yükleme işlemi test edildi.

Gerektiğinde mysqldump ile komut satırından yedek alma yöntemine değinildi.

3. Yedekleme Kayıt Tablosu
BackupHistory tablosu ile yedek kayıtları tutuldu.

Yedekleme sonucu kaydeden usp_LogBackupResult prosedürü yazıldı.

En son yedeği getiren usp_CheckLastBackup prosedürü oluşturuldu.

4. Otomatik Görev (Event)
Her gün saat 01:00’de çalışacak örnek bir event tanımlandı.

Bu yapı ile yedekleme işlemleri zamanlanabilir hale getirildi.

▶️ Video Sunumu
Projede yapılan tüm işlemleri anlatan kısa video kaydı aşağıdaki bağlantıda yer almaktadır:

🔗 https://drive.google.com/file/d/1rriZFiha9mTlotTIo9OUL2f9Untmzrfs/view?usp=drive_link

Not: Video bağlantısı "gizli" ya da "paylaşımlı" modda ayarlanmalıdır.

⚠️ Notlar
Event Scheduler aktif değilse aşağıdaki komutla açılabilir:
SET GLOBAL event_scheduler = ON;

MySQL’in native yedekleme sisteminde BACKUP DATABASE komutu bulunmadığı için, yedekleme dış araçlar veya GUI (Workbench) ile yapılmaktadır.

👤 Hazırlayan
Ad Soyad: Sude Korkmaz
Ders: Ağ Tabanlı Paralel Dağıtım Sistemleri
Tarih: Haziran 2025

