

#!/bin/sh
t=$(figlet "Thapar Banking System")
echo -e "\033[1m${t}\033[0m"
echo -e "\n\n is loading"
a=0
while [ $a -lt 10 ]
do rand=$( shuf -i 2600-2700 -n 1)
	echo -en "  \u$rand"
	a=$(( $a + 1 )) 
	sleep 0.5
done
echo -e " \n\n\n \t " 

WITHDRAW=0;
BALANCE=5000;
DEPOSIT=0;
AMOUNT=0;


echo "Select your options...

1.Cash Withdraw

2.Deposit

3.Check Balance"



while :

do


read INPUT_INTEGER

case $INPUT_INTEGER in

		1)


echo "Enter the amount"


read AMOUNT



if [ "$AMOUNT" -gt "$BALANCE" ]; then

{

echo "Insufficient Funds"

}


else


{

BALANCE=$(($BALANCE - $AMOUNT));

echo "Your current balance is ${BALANCE}"

} fi

;;



		2)


			echo "Enter the amount"


			read AMOUNT;


			BALANCE=$(($AMOUNT + $BALANCE))


			echo "Your current balance is ${BALANCE}"

;;

		3)

			echo "YOur current balance is ${BALANCE}"

;;


		*)

			echo "Sorry, I don't Understand"

;;


esac

done

done

