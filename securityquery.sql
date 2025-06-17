USE sudek;

-- 1. BackupHistory tablosu (MySQL tipleriyle)
CREATE TABLE BackupHistory (
    BackupID INT AUTO_INCREMENT PRIMARY KEY,
    DatabaseName VARCHAR(128),
    BackupDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    BackupFile VARCHAR(260),
    Success BOOLEAN
);

-- 2. Log yedekleme sonucu için prosedür (MySQL DELIMITER kullanımıyla)
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

-- 3. Son yedek kaydını alma prosedürü
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

-- 4. MySQL’de job scheduling için EVENT kullanılır.
-- Örneğin her gün saat 01:00'de çalışacak örnek event:
-- Bu event örneği yedeği otomatik almaz, sadece bir prosedürü çağırabilir.
-- Gerçek yedek alma genellikle dış betiklerle yapılır.

CREATE EVENT DailyBackupEvent
ON SCHEDULE EVERY 1 DAY
STARTS CONCAT(CURDATE(), ' 01:00:00')
DO
BEGIN
    -- Yedek alma komutu MySQL içinde yoktur,
    -- Burada dış komutlar veya prosedür çağrılabilir.
    -- Örnek: CALL usp_PerformBackup();
END;

-- Event Scheduler'ın aktif olduğundan emin olun:
-- SET GLOBAL event_scheduler = ON;
