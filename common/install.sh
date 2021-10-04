set_perm_recursive "$MODPATH/system/bin" root root 0777 0755

ui_print " _______ _________ _        _______ "

ui_print "(  ____ )\__   __/| \    /\(  ____ \ "

ui_print "| (    )|   ) (   |  \  / /| (    \/ "

ui_print "| (____)|   | |   |  (_/ / | (_____ "

ui_print "|     __)   | |   |   _ (  (_____  ) "

ui_print "| (\ (      | |   |  ( \ \       ) | "

ui_print "| ) \ \__   | |   |  /  \ \/\____) | "

ui_print "|/   \__/   )_(   |_/    \/\_______) "

ui_print " "

ui_print "VERSION: 3.2.2 - 04/10/2021"

sleep 3

ui_print " "

ui_print "CODENAME: T4K4H4SH1"

sleep 2

ui_print " "

ui_print "With this module you can choose one of his profiles and improve your user experience."

sleep 3

ui_print " "

ui_print "[*] Do you want to optimize application packages?"

sleep 2

ui_print " "

ui_print "[!] Important warning! This process may take a while to complete."

ui_print "Wait as long as necessary."

sleep 5

ui_print " "

ui_print " Vol + = Switch option"

ui_print ""

sleep 0.2

ui_print " Vol - = Select option"

sleep 1

ui_print " "

ui_print " 1- Yes "

ui_print ""

sleep 0.5

ui_print " 2- No "

ui_print " "

sleep 0.5

ui_print "[!] Select the desired option: "

ui_print " "

AO=1

while true

do

ui_print "  $AO"

if $VKSEL 

then

AO=$((AO + 1))

else 

break

fi

if [ $AO -gt 2 ]

then

AO=1

fi

done

case $AO in

1 ) FCTEXTAD2="Yes";;

2 ) FCTEXTAD2="No";;

esac

ui_print " "

ui_print "[*] Selected: $FCTEXTAD2 "

ui_print " "

if [[ $FCTEXTAD2 == "Yes" ]]

then

ui_print "Wait, process in progress..."

sleep 1

cmd package bg-dexopt-job

ui_print " "

fi

sleep 2

ui_print "[*] Do you want to fstrim the partitions?"

sleep 5

ui_print " "

ui_print " Vol + = Switch option"

ui_print ""

sleep 0.2

ui_print " Vol - = Select option"

sleep 1

ui_print " "

ui_print " 1- Yes "

ui_print ""

sleep 0.5

ui_print " 2- No "

ui_print " "

sleep 0.5

ui_print "[!] Select the desired option: "

ui_print " "

AO=1

while true

do

ui_print "  $AO"

if $VKSEL 

then

AO=$((AO + 1))

else 

break

fi

if [ $AO -gt 2 ]

then

AO=1

fi

done

case $AO in

1 ) FCTEXTAD2="Yes";;

2 ) FCTEXTAD2="No";;

esac

ui_print " "

ui_print "[*] Selected: $FCTEXTAD2 "

ui_print " "

if [[ $FCTEXTAD2 == "Yes" ]]

then

ui_print "Wait, process in progress..."

ui_print " "

sleep 1

fstrim -v /system

fstrim -v /data

fstrim -v /cache

ui_print " "

fi

ui_print " "

ui_print " - [*] Created by raidenkk @ (Telegram)"

sleep 3

ui_print " "

ui_print " - Contributors, credits:"

sleep 2

ui_print " "

ui_print " - King Tweaks dev: pedro3z0 @ (Telegram)"

sleep 2

ui_print " "

ui_print " - Spectrum dev: frap129 @ (GitHub)"

sleep 2

ui_print " "

ui_print " - Zeus Tweaks dev: KiraaDeath @ (Telegram)"

sleep 2

ui_print " "

ui_print " - Apollon dev: Haxis_Lancelot @ (Telegram)"

sleep 2

ui_print " "

ui_print " - [!] Join my support group: @rtksgroup (Telegram)"

sleep 2

ui_print " "

ui_print " - Thanks to everyone for the feedback, it helps a lot. ❤️"

sleep 2

ui_print " "

ui_print " - Logs are at the root of internal memory RTKS/RTKS.log"

sleep 2

ui_print " "

ui_print " - [*] RTKS Module has been installed successfuly!"

ui_print " "

sleep 2


