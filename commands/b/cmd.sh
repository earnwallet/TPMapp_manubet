resp=$(curl /?action=bet&amount=`echo "$1 * 100000000" | bc -l `&chance=$2&bethi=$3);
ec=$?
echo $resp;
exit $ec;
