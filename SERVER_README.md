# 🎮 Minecraft Server with Authentication & File Manager

A complete Minecraft server setup with user authentication, welcome messages, and web-based file management.

## 🚀 Features

### 🔐 Authentication System
- **AuthMe Reloaded** plugin for secure user registration and login
- Support for both premium and cracked Minecraft accounts
- MySQL database for user data storage
- **Centered welcome messages** with titles, subtitles, and sound effects
- Session management to avoid repeated logins

### 🎉 Welcome Messages
- **Login Welcome**: Animated title and subtitle with sound effects
- **Registration Welcome**: Special message for new users
- **Chat Messages**: Formatted welcome messages in chat
- **Sound Effects**: Level-up sound when logging in

### 🗂️ File Manager
- **Web-based file manager** accessible at `http://localhost:8080`
- **Default credentials**: `admin` / `admin123`
- **Full access** to server files, plugins, configs, logs, and backups
- **Dark theme** with Minecraft branding

## 📋 Quick Start

### 1. Start the Server
```bash
docker-compose up -d
```

### 2. Check Server Status
```bash
docker-compose ps
docker-compose logs mc
```

### 3. Access Services
- **Minecraft Server**: `localhost:25565`
- **File Manager**: `http://localhost:8080`
- **MySQL Database**: `localhost:3306`

## 🎮 Player Experience

### For New Players
1. Connect to the server: `localhost:25565`
2. Register with: `/register <password> <password>`
3. See animated welcome message with title and sound
4. Start playing!

### For Returning Players
1. Connect to the server
2. Login with: `/login <password>`
3. See personalized welcome back message
4. Continue playing!

## 🔧 Management

### File Manager Access
- URL: `http://localhost:8080`
- Username: `admin`
- Password: `admin123`
- Access: Full server file management

### Database Management
```bash
# Run SQL commands
./database/run_sql.sh "SELECT COUNT(*) FROM authme;"

# Check user statistics
./database/run_sql.sh "SELECT username, total_logins, last_login FROM users ORDER BY last_login DESC LIMIT 10;"
```

### Server Commands
```bash
# View logs
docker-compose logs -f mc

# Restart server
docker-compose restart mc

# Stop all services
docker-compose down
```

## 📊 Database Information

### Connection Details
- **Host**: `localhost:3306`
- **Database**: `minecraft-abusaker`
- **Username**: `hamza`
- **Password**: `Hh@#2021`

### Tables
- **authme**: Main authentication data
- **users**: Extended user statistics and data
- **player_sessions**: Session management
- **login_attempts**: Security logging

## 🎨 Welcome Message Features

### Login Messages
- **Title**: "WELCOME BACK!" in gold and bold
- **Subtitle**: Personalized greeting with player name
- **Sound**: Level-up sound effect
- **Chat**: Formatted welcome message with decorative borders

### Registration Messages
- **Title**: "WELCOME!" in green and bold
- **Subtitle**: Thank you message for new registration
- **Sound**: Higher-pitched level-up sound
- **Chat**: Registration success message with celebration emojis

## 🛠️ Troubleshooting

### Server Won't Start
```bash
# Check logs
docker-compose logs mc

# Restart services
docker-compose restart
```

### Database Connection Issues
```bash
# Check database status
docker-compose logs db

# Test connection
./database/run_sql.sh "SELECT 1;"
```

### File Manager Access Issues
```bash
# Check file manager logs
docker-compose logs filemanager

# Restart file manager
docker-compose restart filemanager
```

Enjoy your Minecraft server! 🎮✨
