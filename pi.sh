# This script launches a docker instance

laptop_ip=$(ping -c 1 benny-HP-EliteBook-840-G5.local | sed -nE 's/^PING[^(]+\(([^)]+)\).*/\1/p')
pi_ip=$(ping -c 1 $HOSTNAME | sed -nE 's/^PING[^(]+\(([^)]+)\).*/\1/p')

echo Laptop IP is $laptop_ip
echo Pi IP is $pi_ip

docker-compose -f docker-compose.yaml run raspberrypi
docker-compose -f docker-compose.yaml stop raspberrypi
