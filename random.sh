#Random generator ipv6 addresses within your ipv6 network prefix.
#!/usr/local/bin/bash

# Copyright
# Vladislav V. Prodan
# universite@ukr.net
# 2011

echo -e "İpv6 girin";read ipv61
echo -e "kaç adet proxy istiyorsunuz";read adet

array=( 1 2 3 4 5 6 7 8 9 0 a b c d e f )
MAXCOUNT=$adet #количество прокси
count=1
network=$ipv6 # Ваша сеть

rnd_ip_block ()
{
    a=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    b=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    c=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    d=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    e=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
#Для настройки /64 сети требуется добавить к подсети 4 блока:a, b, c, d
#Если сеть /48, то 5 блоков, то есть + e блок через двоеточие
    echo $network:$a:$b:$c:$d
}

#echo "$MAXCOUNT случайных IPv6:"
#echo "-----------------"
while [ "$count" -le $MAXCOUNT ]        # Генерация 20 ($MAXCOUNT) случайных чисел.
do
        rnd_ip_block
        let "count += 1"                # Нарастить счетчик.
        done
#echo "-----------------"
