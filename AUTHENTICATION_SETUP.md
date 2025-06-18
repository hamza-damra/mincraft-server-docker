# Minecraft Server Authentication & Welcome Messages Setup

This setup provides a complete authentication system with welcome messages for your Minecraft server, supporting both premium and cracked accounts.

## Features

### 🔐 Authentication System
- **AuthMe Reloaded** plugin for user registration and login
- Support for both premium (paid) and cracked (free) Minecraft accounts
- MySQL database for secure user data storage
- Session management to avoid repeated logins
- Password security with BCrypt hashing

### 🎉 Welcome Messages
- **Custom welcome messages** for new and returning players
- **Title and subtitle animations** when players join
- **Sound effects** for better user experience
- **MOTD (Message of the Day)** system
- **EssentialsX integration** for additional features

### 🛡️ Security Features
- Anti-bot protection
- IP-based registration limits
- Login attempt limits
- Session timeout management
- Secure password requirements

## Quick Start

1. **Start the server:**
   ```bash
   docker-compose up -d
   ```

2. **Check logs:**
   ```bash
   docker-compose logs -f mc
   ```

3. **Connect to your server:**
   - Server IP: `localhost:25565` (or your server IP)
   - Version: Minecraft Java Edition 1.21.4

## Player Commands

### For New Players
```
/register <password> <confirmPassword>
```
- Creates a new account
- Password must be at least 4 characters
- Shows welcome message and tutorial

### For Returning Players
```
/login <password>
```
- Login to existing account
- Shows welcome back message

### Additional Commands
```
/changepassword <oldPassword> <newPassword>  # Change password
/logout                                      # Logout from account
/help                                        # Show help commands
/rules                                       # Show server rules
```

## Admin Commands

### Server Management
```
/authme reload          # Reload AuthMe configuration
/authme register <player> <password>  # Register player as admin
/authme unregister <player>          # Unregister player
/authme changepassword <player> <password>  # Change player password
/authme purge <days>    # Remove inactive accounts
```

### Database Management
```
/authme converter       # Convert from other auth plugins
/authme backup         # Backup user database
```

## Configuration Files

### AuthMe Configuration
- **Location:** `plugins/AuthMe/config.yml`
- **Database:** MySQL connection to dedicated database container
- **Security:** BCrypt password hashing, session management
- **Features:** Registration, login, password changes, email recovery

### Welcome Messages
- **Location:** `plugins/WelcomeMessages/config.yml`
- **Features:** Custom titles, chat messages, sounds
- **Types:** First join, returning player, login success, registration success

### EssentialsX
- **Location:** `plugins/Essentials/config.yml`
- **Features:** Basic server commands, economy, teleportation
- **Integration:** Works with AuthMe for complete server experience

## Database Information

### Connection Details
- **Host:** `db` (internal Docker network)
- **Port:** `3306`
- **Database:** `authme`
- **Username:** `authme`
- **Password:** `authme_pass`

### Tables
- **authme:** Main user authentication table
- Stores usernames, passwords, IPs, last login, location data

## Customization

### Welcome Messages
Edit `plugins/WelcomeMessages/config.yml` to customize:
- Welcome titles and subtitles
- Chat message content and formatting
- Sound effects and timing
- MOTD messages

### Authentication Settings
Edit `plugins/AuthMe/config.yml` to modify:
- Password requirements (length, complexity)
- Session timeout duration
- Registration limits per IP
- Login attempt limits

### Server Messages
Edit `plugins/AuthMe/messages_en.yml` to change:
- Login/register command messages
- Error messages
- Success notifications
- Help text

## Security Recommendations

1. **Change Default Passwords:**
   ```bash
   # Update docker-compose.yml with secure passwords
   MYSQL_ROOT_PASSWORD: your_secure_root_password
   MYSQL_PASSWORD: your_secure_authme_password
   RCON_PASSWORD: your_secure_rcon_password
   ```

2. **Enable SSL/TLS:**
   - Add SSL certificates for web interfaces
   - Use secure database connections

3. **Regular Backups:**
   - Backup user database regularly
   - Backup server world data
   - Store backups securely

4. **Monitor Logs:**
   ```bash
   # Check for suspicious activity
   docker-compose logs mc | grep -i "failed\|error\|banned"
   ```

## Troubleshooting

### Common Issues

1. **Players can't register/login:**
   - Check database connection
   - Verify AuthMe configuration
   - Check server logs for errors

2. **Welcome messages not showing:**
   - Verify plugin is loaded
   - Check configuration syntax
   - Ensure proper permissions

3. **Database connection failed:**
   - Wait for database container to fully start
   - Check network connectivity
   - Verify credentials

### Useful Commands

```bash
# Check container status
docker-compose ps

# View server logs
docker-compose logs -f mc

# Access database
docker-compose exec db mysql -u authme -pauthme_pass authme

# Restart specific service
docker-compose restart mc

# Update plugins
docker-compose down
docker-compose pull
docker-compose up -d
```

## Plugin Information

### AuthMe Reloaded
- **Version:** Latest from Spiget (ID: 6269)
- **Features:** Registration, login, password management
- **Database:** MySQL with BCrypt hashing
- **Documentation:** [AuthMe Wiki](https://github.com/AuthMe/AuthMeReloaded/wiki)

### EssentialsX
- **Version:** Latest from Spiget (ID: 9089)
- **Features:** Basic commands, economy, teleportation
- **Integration:** Works seamlessly with AuthMe
- **Documentation:** [EssentialsX Wiki](https://essentialsx.net/wiki/)

## Support

For issues or questions:
1. Check the server logs first
2. Review configuration files
3. Consult plugin documentation
4. Check Minecraft server compatibility

## License

This configuration is provided as-is for educational and server administration purposes.
