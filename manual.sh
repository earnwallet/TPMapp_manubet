echo "Starting...";
clear;
echo "=== LOAD INFO ===";
echo "Okay, now listen to me. I'll list all modules, tell me which one do you want to use.";
echo "-------------";
cd /home/`whoami`/TPM/mods/
for f in *;
do
     echo " (x) $f";
     sleep 0.5;
done
echo "-------------";
read mod;
cd $mod
if [ "$?" == 0 ];
then
    echo "Success";
    echo "Looking for important files";
    echo "+++++++++++++";
    list="info.txt port.txt readme.txt";
    for l in $list;
    do
        for f in *;
        do
            echo " > $l";
            if [ "$f" == "$l" ];
            then
                echo "File: $l";
                if [ "$f" == "port.txt" ];
                then
                    echo "Trying to setup port varible";
                    portauto=`cat port.txt`
                    if [ "$?" == "0" ];
                    then
                        echo "Success!";
                    else
                        echo "Sad. Unable to get port info";
                    fi
                fi
                echo "_____________";
                cat "$l";
                echo "_____________";
                echo "To continue press enter";
                read q;
                clear;
            fi
        done
    done
    echo "+++++++++++++";
else
    echo "404: not found";
    exit 1;
fi
echo "Port [$portauto]:";
read port;
if [ "$port" == "" ];
then
    echo " (+) No port defined, using $portauto";
    port="$portauto";
fi
echo "Host [127.0.0.1]:";
read host;
if [ "$host" == "" ];
then
    echo " (+) No host defined, using 127.0.0.1";
    host="127.0.0.1";
fi
cd /home/`whoami`/TPM/mods/manubet;
cd config;
if [ "$?" == 0 ];
then
    echo "OK!";
else
    echo "Oups! I need to fixie it UwU"
    mkdir mods;
    cd mods;
    echo "Done";
fi
echo "$port" > port.txt;
echo "$host" > host.txt;
echo "===    END    ===";
sleep 5;
clear;
echo "Configuration finished, starting...";
echo "   Commands  ";
echo "=============";
cd /home/`whoami`/TPM/mods/manubet/commands/
for f in *;
do
    echo " ---- $f ";
    cd "/home/`whoami`/TPM/mods/manubet/commands/$f"
    cat usage.txt
    cd /home/`whoami`/TPM/mods/manubet/commands
done
echo "=============";
while [ 1 ];
do
    echo "`whoami`@manubet>";
    read command
    cd "/home/`whoami`/TPM/mods/manubet"
    bash cmd.sh $command;
done
