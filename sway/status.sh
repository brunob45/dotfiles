
checkpkgupdate() {
    #echo "󰑐"
    pkgs=$(checkupdates 2>/dev/null)
    code=$?

    if [ "$code" -eq 0 ]; then
        # Updates available
        echo "󰏖$(echo "$pkgs" | wc -l)"

    elif [ "$code" -eq 2 ]; then
        # No update available
        echo "󰏗"

    else
        # Error
        echo "󰜺"
    fi
}

count=0
while true; do
    dateformatted=$(date +'%d %B %Y %l:%M')

    # Check for package updates every 15 minutes (900 seconds)
    count=$(( (count+1) % 900 ))
    if [[ $count -eq 1 ]]; then
        pkgsformatted=$(checkpkgupdate)
    fi

    echo "$pkgsformatted · $dateformatted"
    sleep 1
done