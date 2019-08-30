clear
echo "= manubet deposit =";
echo "Do you want to deposit money? [Y/n]";
read cho;
if [ "$cho" == "Y" -o "$cho" == "y" ];
then
    port=$(cat /home/`whoami`/TPM/apps/manubet/config/port.txt)
    host=$(cat /home/`whoami`/TPM/apps/manubet/config/host.txt)
    serv="$host:$port";
    echo "OK!";
    echo "Your balance [TPM] : `dogecoin-cli getbalance`";
    echo "Your balance [SITE]: `curl "$serv/?action=balance"`";
    echo "How much do you want to send to site?";
    read amt
    echo "Getting deposit address";
    add=`curl "$serv/?action=deposit"`;
    if [ "$?" == "0" ];
    then
        echo "Success: $add";
    else
        echo "Oh no.. server returned error :'( error code: $?";
        exit 1;
    fi
    echo "Sending money...";
    sleep 10;
    dogecoin-cli sendtoaddress "$add" $amt;
    echo "Complete";
    exit 0;
else
    echo "Uh.. Okay.. Call me when you need me honey";
    exit 0;
fi
