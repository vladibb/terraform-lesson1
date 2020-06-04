#!/bin/sh
echo Retrieving public dns name of the terraform constructed EC2 host with HTML app deployed
echo Ouput of echo '$?' means:
echo   O = YES, success
echo   1 = Computer says NO

if [ -f ./result.json ]; then
    export MY_EC2=$(cat result.json | jq -r '.ec2_public_dns_name.value')
    echo Using EC2 DNS info from "'result.json'"
else
    export MY_EC2=$(terraform output | grep ec2_public_dns_name | awk -F'= ' '{print $2}')
    echo Using EC2 DNS info from "'terraform output'"
fi

curl http://$MY_EC2/ 2>&1 | grep 'Hallo World!' > /dev/null && echo YES
exit $?

