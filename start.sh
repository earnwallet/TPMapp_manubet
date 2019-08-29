clear
echo "==== manubet ====";
echo "Select method";
echo " (1) Manual";
#echo " (2) Automatic";
echo " (x) Exit";
read choi
if [ "$choi" == "1" -o "$choi" == "x" ];
then
    echo "OK!";
else
    echo "Wrong choice.";
    exit 1;
fi
if [ "$choi" == "1" ];
then
    echo "Starting manual.sh";
    cd /home/`whoami`/TPM/apps/manubet/
    echo "==== START ====";
    bash manual.sh
    echo "==== STOP ====";
    echo " [ExitCode]: $?";
    sleep 3
    exit $?
fi
if [ "$choi" == "x" ];
then
    echo "Bye";
    exit 0;
fi
