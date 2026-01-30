# ⚙️ How to use these scripts
The end of each script file contains instructions for executing this script.

## Make scripts executable
```
# Linux/Mac
chmod +x scripts/*.sh

# Windows (if you use Git Bash or WSL)
chmod +x scripts/*.sh
```

## 🔍 What will be in the backups folder after use
```
backups/
├── db/
│   ├── 20240115_143022_wordpress_backup.sql
│   └── 20240115_154510_wordpress_backup.sql
└── files/
    ├── 20240115_143025_wp-content_backup.tar.gz
    └── 20240115_154515_wp-content_backup.tar.gz
```

## Automatic backups
Add to cron (Linux/Mac) or Task Scheduler (Windows):
```
## Every day at 2 a.m.
0 2 * * * /path/to/project/scripts/backup-db.sh
0 2 * * * /path/to/project/scripts/backup-files.sh
```

## Full backup with one command
Create `backup-all.sh `:
```
./scripts/backup-db.sh
./scripts/backup-files.sh
echo "✅ Full backup completed!"
```

## Cleaning up old backups
Add backups older than 30 days to the scripts:
```
## Delete backups older than 30 days
find backups/db -name "*.sql" -mtime +30 -delete
find backups/files -name "*.tar.gz" -mtime +30 -delete
```
## Backup before major changes
Before installing new plugins or updates:
```
./scripts/backup-all.sh
# Now you can safely experiment!
```