cd /home/`whoami`/TPM/apps/manubet/commands/$1/
bash cmd.sh $2 $3 $4 $5 $6 $7 $8 $9
ec=$?;
if [ "$ec" == "0" ];
then
    echo "[[[SUCCESS]]]";
else
    echo "Non-zero exit code occured, [$ec]";
fi
#TODO: make it better...
