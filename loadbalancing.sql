USE sudek;

-- 1. Tablo oluşturma (AUTO_INCREMENT MySQL'de IDENTITY yerine)
CREATE TABLE NewFeatureTable (
    FeatureID INT AUTO_INCREMENT PRIMARY KEY,
    FeatureName VARCHAR(100) NOT NULL,
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Sütun ekleme
ALTER TABLE Person
ADD MiddleName VARCHAR(50) NULL;

-- 3. Schema değişikliklerini loglama tablosu oluşturma
CREATE TABLE SchemaChangesLog (
    ChangeID INT AUTO_INCREMENT PRIMARY KEY,
    EventType VARCHAR(100),
    ObjectName VARCHAR(256),
    TSQLCommand TEXT,
    ChangeDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 4. MySQL'de database seviyesinde DDL trigger desteklenmez, 
-- bu yüzden DDL değişikliklerini loglamak için MySQL'de EVENT veya dış uygulama gerekir.
-- Trigger örneği tablo bazında olabilir ama DDL trigger (veritabanı düzeyi) MySQL'de yok.

-- 5. MySQL'de RESTORE DATABASE komutu yok,
-- yedeği geri yüklemek için genelde komut satırı aracı (mysql veya mysqldump) kullanılır.
-- Örnek komut satırı (terminalde çalıştırılır):

-- mysql -u kullanıcıadı -p sudek < /path/to/backup.sql

-- veya yedeğin formatına göre uygun araçla geri yüklenir.
