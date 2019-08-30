lo='lo';
if [ "$3" == 'lo' ];
then
    lo='lo';
else
    lo='hi';
fi
cd /home/`whoami`/TPM/apps/manubet/config
url="`cat host.txt`:`cat port.txt`;
resp=$(curl "$url/?action=bet&amount=`echo "$1 * 100000000" | bc -l `&chance=$2&bethi=$hi");
ec=$?
echo $resp;
exit $ec;
