-- 1. Veritabanı Oluşturma (Eğer yoksa)
CREATE DATABASE IF NOT EXISTS sudek;
USE sudek;

-- 2. Örnek bir tablo oluşturma (yedek ve geri yükleme testfavoritesleri için)
CREATE TABLE IF NOT EXISTS kisiler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ad VARCHAR(100),
    soyad VARCHAR(100),
    email VARCHAR(150),
    kayit_tarihi DATE
);

-- 3. Örnek veriler ekleme
INSERT INTO kisiler (ad, soyad, email, kayit_tarihi) VALUES
('Sude', 'Korkmaz', 'sude@example.com', '2024-06-01'),
('Ali', 'Demir', 'ali@example.com', '2024-06-02'),
('Zeynep', 'Yılmaz', 'zeynep@example.com', '2024-06-03');

-- 4. Veritabanı Durumunu Kontrol Etme
SHOW DATABASES;
SHOW TABLES;
SHOW TABLE STATUS FROM sudek;

-- 5. Veritabanı içeriğini dışa aktarma (manuel olarak yapılmalı):
-- Bu SQL komut ile yapılamaz, terminalde çalıştırılır:
-- mysqldump -u root -p sudek > sudek_full_backup.sql

-- 6. Veritabanını geri yükleme (manuel olarak yapılmalı):
-- mysql -u root -p sudek < sudek_full_backup.sql

-- 7. Binary Log aktifse belirli zamana kadar geri yükleme (manuel):
-- mysqlbinlog --stop-datetime="2025-04-20 13:30:00" /var/lib/mysql/binlog.000001 | mysql -u root -p sudek

-- 8. Binary Log aktifse kontrol (bilgi için)
SHOW VARIABLES LIKE 'log_bin';
SHOW BINARY LOGS;

-- 9. Yedeklenmiş verilerin bulunduğu tabloyu kontrol et
SELECT * FROM kisiler;

-- 10. Geri yükleme sonrası tüm verileri silme (test amaçlı)
-- DELETE FROM kisiler;
