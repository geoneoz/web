# web
execute file {chmod +x filename.sh} | {./filename.sh} | {history -c && history -w} | chown -R www-data:www-data /var/www/moodle && moodledata | chown -R 0755 /var/www/moodle && 777 for moodledata | 0 2 * * * /backup/backup_web.sh >> /var/log/backup_web.log 2>&1 (cronjob) |
