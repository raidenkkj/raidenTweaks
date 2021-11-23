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
ui_print "VERSION: 3.3.3 - 23/11/2021"
ui_print " "
ui_print " "
ui_print "CODENAME: BETA-TESTER"
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
SC="/storage/emulated/0/Android/data/com.lnrgame.roguelike/files/SettingDatas.dat"
LIFE="/storage/emulated/0/Android/data/com.netease.mrzhna/files/netease/g66/Documents/configs/qualityconfig"
APEX="/data/data/com.ea.gp.apexlegendsmobilefps/files/UE4Game/AClient/AClient/Saved/Config/Android/UserCustom.ini"

awk '{print}' "${MODPATH}/common/ru_banner" 
sleep 3
ui_print " [!] Important: These settings can cause  "
ui_print "                errors in system applications.  "
ui_print " "
ui_print "     Might not work if you are using "
ui_print "     magiskhideprops or other like module. "
ui_print " "
ui_print " "
ui_print " 1- None"
ui_print " "
ui_print " 2- CODM 120 FPS Settings"
ui_print " "
ui_print " 3- PUBGM 90 FPS Settings "
ui_print " "
ui_print " 4- ML Max Settings "
ui_print " "
ui_print " 5- Asphalt 9 and Sky Children of the Light 60 FPS Settings"
ui_print " "
ui_print " 6- Game for Peace 90 FPS Settings"
ui_print " "
ui_print " 7- LifeAfter 120 FPS Settings"
ui_print " "
ui_print " 8- Apex Legends 120 FPS Settings"
ui_print " "
ui_print " 9- Super Clone 120 FPS Settings"
ui_print " "
ui_print "[*] Select which you want: "
ui_print " "
KU=1
while true
do
  ui_print "  ${KU}"
  if "${VKSEL}"; then
      KU=$((KU + 1))
  else 
      break
  fi
if [[ "${KU}" -gt "9" ]]; then
    KU=1
fi
done

for dir in /sdcard/Android/data/com.riotgames.league.wildrift/files/SaveData/Local/*; do
case "${KU}" in
1 ) FCTEXTAD2="None";;
2 ) FCTEXTAD2="CODM 120 FPS"; sed -i '/ro.product.model/s/.*/ro.product.model=XQ-AS72/' "${MODPATH}/system.prop"; sed -i '/ro.product.model/s/.*/ro.product.model=XQ-AS72/' "${MODPATH}/system1.prop";;
3 ) FCTEXTAD2="PUBGM 90 FPS"; sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${MODPATH}/system.prop"; sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${MODPATH}/system1.prop";;
4 ) FCTEXTAD2="ML Max Settings"; sed -i '/ro.product.model/s/.*/ro.product.model=umi/' "${MODPATH}/system.prop"; sed -i '/ro.product.model/s/.*/ro.product.model=umi/' "${MODPATH}/system1.prop";;
5 ) FCTEXTAD2="Asphalt 9 and Sky Children of the Light 60 FPS"; sed -i '/ro.product.model/s/.*/ro.product.model=GM1917/' "${MODPATH}/system.prop"; sed -i '/ro.product.model/s/.*/ro.product.model=GM1917/' "${MODPATH}/system1.prop";;
6 ) FCTEXTAD2="Game For Peace 90 FPS"; sed -i '/ro.product.model/s/.*/ro.product.model=SM-G9880/' "${MODPATH}/system.prop"; sed -i '/ro.product.model/s/.*/ro.product.model=SM-G9880/' "${MODPATH}/system1.prop";;
7 ) FCTEXTAD2="LifeAfter 120 FPS"; sed -i 's/"frame": 1,/"frame": 4,/g' "${LIFE}"; sed -i 's/"frame": 2,/"frame": 4,/g' "${LIFE}"; sed -i 's/"frame": 3,/"frame": 4,/g' "${LIFE}";;
8 ) FCTEXTAD2="Apex Legends 120 FPS"; sed -i 's/SpecialFPS=30/SpecialFPS=120/g' "${APEX}"; sed -i 's/BRFPS=40/BRFPS=120/g' "${APEX}"; sed -i 's/SpecialFPS=60/SpecialFPS=120/g' "${APEX}"; sed -i 's/BRFPS=30/BRFPS=120/g' "${APEX}";;
9 ) FCTEXTAD2="Super Clone 120 FPS"; sed -i 's/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":30,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":120,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/g' "${SC}"; sed -i 's/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":45,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":120,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/g' "${SC}"; sed -i 's/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":60,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":120,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/g' "${SC}";;
esac
break
done
ui_print " "
ui_print "Selected: ${FCTEXTAD2} "
ui_print " "
sleep 3
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
ui_print " - ThermodX dev: imUsiF12 @ (Telegram)"
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
