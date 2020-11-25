#!/bin/bash

# 29/07/2008 - Fabio M. Lopes
# script de backup do HP OpenView 

DATA=`date +%d%m%Y`

echo "`date '+%d/%m/%Y - %H:%M:%S'` - INICIO DO SCRIPT"

mkdir -p /opt/backup/$DATA/cfg2html
mkdir /opt/backup/$DATA/scripts
mkdir /opt/backup/$DATA/logs

echo "`date '+%d/%m/%Y - %H:%M:%S'` - Removendo arquivos antigos (+30 dias)..."

find /opt/backup -type f -mtime +30 -exec rm -f {} \;

echo "`date '+%d/%m/%Y - %H:%M:%S'` - Executando ovbackup.ovpl..."

/opt/OV/bin/ovbackup.ovpl -d /opt/backup/$DATA

echo "`date '+%d/%m/%Y - %H:%M:%S'` - Executando cfg2html..."

/usr/bin/cfg2html/cfg2html_sun.sh -x -o /opt/backup/$DATA/cfg2html

echo "`date '+%d/%m/%Y - %H:%M:%S'` - Copiando os scripts..."

cp /app/scripts/* /opt/backup/$DATA/scripts

echo "`date '+%d/%m/%Y - %H:%M:%S'` - Copiando os logs..."

cp /app/logs/* /opt/backup/$DATA/logs

echo "`date '+%d/%m/%Y - %H:%M:%S'` - Empacotando / compactando os arquivos..."

cd /opt/backup
tar cf $DATA.tar $DATA
rm -rf $DATA
gzip $DATA.tar

echo "`date '+%d/%m/%Y - %H:%M:%S'` - Transferindo para svuxbge2..."

scp $DATA.tar.gz backup@10.200.17.246:/app/backup/servers/svuxhov4

echo "`date '+%d/%m/%Y - %H:%M:%S'` - FIM DO SCRIPT"
