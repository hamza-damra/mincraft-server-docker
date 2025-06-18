-- AuthMe Authentication Tables for Minecraft Server
-- Database: minecraft-abusaker
-- This script creates the necessary tables for AuthMe authentication system

USE `minecraft-abusaker`;

-- Create the main AuthMe authentication table
CREATE TABLE IF NOT EXISTS `authme` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `realname` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(40) DEFAULT NULL,
    `lastlogin` BIGINT(20) DEFAULT NULL,
    `x` DOUBLE NOT NULL DEFAULT 0,
    `y` DOUBLE NOT NULL DEFAULT 0,
    `z` DOUBLE NOT NULL DEFAULT 0,
    `world` VARCHAR(255) NOT NULL DEFAULT 'world',
    `regdate` BIGINT(20) NOT NULL DEFAULT 0,
    `regip` VARCHAR(40) DEFAULT NULL,
    `yaw` FLOAT DEFAULT NULL,
    `pitch` FLOAT DEFAULT NULL,
    `email` VARCHAR(255) DEFAULT NULL,
    `isLogged` SMALLINT(6) NOT NULL DEFAULT 0,
    `hasSession` SMALLINT(6) NOT NULL DEFAULT 0,
    `totp` VARCHAR(32) DEFAULT NULL,
    `uuid` VARCHAR(36) DEFAULT NULL,
    `salt` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    KEY `idx_uuid` (`uuid`),
    KEY `idx_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create the users table for additional player data and statistics
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NOT NULL,
    `uuid` VARCHAR(36) DEFAULT NULL,
    `registration_ip` VARCHAR(40) DEFAULT NULL,
    `first_join_date` DATETIME NOT NULL,
    `last_login` DATETIME DEFAULT NULL,
    `last_login_ip` VARCHAR(40) DEFAULT NULL,
    `total_logins` INT(11) NOT NULL DEFAULT 0,
    `total_playtime` BIGINT(20) NOT NULL DEFAULT 0,
    `is_premium` BOOLEAN NOT NULL DEFAULT FALSE,
    `is_banned` BOOLEAN NOT NULL DEFAULT FALSE,
    `ban_reason` TEXT DEFAULT NULL,
    `ban_date` DATETIME DEFAULT NULL,
    `ban_expires` DATETIME DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    KEY `idx_uuid` (`uuid`),
    KEY `idx_last_login` (`last_login`),
    KEY `idx_is_banned` (`is_banned`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create a table for player sessions (optional, for advanced session management)
CREATE TABLE IF NOT EXISTS `player_sessions` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `session_id` VARCHAR(255) NOT NULL,
    `ip_address` VARCHAR(40) NOT NULL,
    `login_time` DATETIME NOT NULL,
    `last_activity` DATETIME NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT TRUE,
    `user_agent` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `session_id` (`session_id`),
    KEY `idx_username` (`username`),
    KEY `idx_is_active` (`is_active`),
    KEY `idx_last_activity` (`last_activity`),
    FOREIGN KEY (`username`) REFERENCES `authme` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create a table for login attempts and security logging
CREATE TABLE IF NOT EXISTS `login_attempts` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) DEFAULT NULL,
    `ip_address` VARCHAR(40) NOT NULL,
    `attempt_time` DATETIME NOT NULL,
    `success` BOOLEAN NOT NULL DEFAULT FALSE,
    `failure_reason` VARCHAR(255) DEFAULT NULL,
    `user_agent` TEXT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_username` (`username`),
    KEY `idx_ip_address` (`ip_address`),
    KEY `idx_attempt_time` (`attempt_time`),
    KEY `idx_success` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert some example data (optional - remove if not needed)
-- This shows the structure and can be used for testing

-- Example AuthMe user (password is 'password123' hashed with BCrypt)
INSERT IGNORE INTO `authme` (`username`, `realname`, `password`, `regdate`, `regip`, `world`) VALUES
('testuser', 'TestUser', '$2a$10$example.hash.here.for.password123', UNIX_TIMESTAMP(), '127.0.0.1', 'world');

-- Example user data
INSERT IGNORE INTO `users` (`username`, `display_name`, `registration_ip`, `first_join_date`) VALUES
('testuser', 'TestUser', '127.0.0.1', NOW());

-- Create indexes for better performance (using ALTER TABLE for compatibility)
ALTER TABLE `authme` ADD INDEX `idx_authme_lastlogin` (`lastlogin`);
ALTER TABLE `authme` ADD INDEX `idx_authme_regdate` (`regdate`);
ALTER TABLE `users` ADD INDEX `idx_users_first_join` (`first_join_date`);
ALTER TABLE `users` ADD INDEX `idx_users_total_logins` (`total_logins`);

-- Show table structures
DESCRIBE `authme`;
DESCRIBE `users`;
DESCRIBE `player_sessions`;
DESCRIBE `login_attempts`;
