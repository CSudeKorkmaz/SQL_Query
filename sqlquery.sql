USE sudek;

-- 1. BackupHistory tablosu oluşturma
CREATE TABLE IF NOT EXISTS BackupHistory (
    BackupID INT AUTO_INCREMENT PRIMARY KEY,
    DatabaseName VARCHAR(128),
    BackupDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    BackupFile VARCHAR(260),
    Success BOOLEAN
);

-- 2. Yedekleme sonucunu loglamak için prosedür
DELIMITER //
CREATE PROCEDURE usp_LogBackupResult (
    IN p_DatabaseName VARCHAR(128), 
    IN p_BackupFile VARCHAR(260), 
    IN p_Success BOOLEAN
)
BEGIN
    INSERT INTO BackupHistory (DatabaseName, BackupDate, BackupFile, Success)
    VALUES (p_DatabaseName, NOW(), p_BackupFile, p_Success);
END;
//
DELIMITER ;

-- 3. Son yedek kaydını getiren prosedür
DELIMITER //
CREATE PROCEDURE usp_CheckLastBackup()
BEGIN
    SELECT * FROM BackupHistory
    WHERE DatabaseName = 'AdventureWorks2016'
    ORDER BY BackupDate DESC
    LIMIT 1;
END;
//
DELIMITER ;

-- 4. Günlük 01:00'de çalışacak event oluşturma
-- NOT: STARTS için CONCAT() MySQL sürümüne bağlı sorun çıkarabilir. Eğer hata alırsan doğrudan datetime gir.

CREATE EVENT IF NOT EXISTS DailyBackupEvent
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURDATE()) + INTERVAL 1 HOUR  -- bugün saat 01:00'e ayarlar, örnek
DO
BEGIN
    -- Burada yedek alma komutu MySQL içinde yok.
    -- Dış betiği tetiklemek ya da prosedür çağırmak için uygun yöntem aranmalı.
    -- Örnek prosedür çağrısı:
    -- CALL usp_PerformBackup();
END;

-- Event Scheduler'ı açmak için:
SET GLOBAL event_scheduler = ON;
