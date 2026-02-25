#!/bin/bash
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="/backup"
FILENAME="backup_$DATE.tar.gz"

TMP_DIR="/tmp/backup_proses"
mkdir -p $TMP_DIR

cp -r /etc/nginx $TMP_DIR/nginx
cp -r /var/www $TMP_DIR/www_data

tar -czf $BACKUP_DIR/$FILENAME -C $TMP_DIR .

rm -rf $TMP_DIR
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "Backup berhasil disimpan di $BACKUP_DIR/$FILENAME"
