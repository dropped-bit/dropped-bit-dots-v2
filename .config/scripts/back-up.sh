# back-up homefolder

setdate="$(date +%F)"
echo "Back-up generated on $setdate"

sleep 5

tar --exclude=".local" --exclude=".cache" -czvf /tmp/backup_$setdate.tar.gz $HOME
