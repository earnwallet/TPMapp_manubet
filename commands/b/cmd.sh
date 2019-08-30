lo='lo';
if [ "$3" == 'lo' ];
then
    lo='lo';
else
    lo='hi';
fi
cd /home/`whoami`/TPM/apps/manubet/config
url="`cat host.txt`:`cat port.txt`";
amt="`echo "$1 * 100000000" | bc -l `";
resp=$(curl "$url/?action=bet&amount=$amt&chance=$2&bethi=$hi");
ec=$?
cd /home/`whoami`/TPM/apps/manubet/commands/b/
php pp.php $resp;
exit $ec;
