awk '{print}' "${MODPATH}/common/rtks_banner"
ui_print " "
ui_print "VERSION: 4.5.4 - 15/08/2022"
ui_print " "
ui_print "CODENAME: S1R1U5"
sleep 2
ui_print " "
ui_print "With this module you can choose one of"
ui_print "his profiles and improve your user experience."
sleep 3
ui_print " "
sleep 0.5
ui_print "[*] Do you want to fstrim the partitions? [Recommended]"
sleep 3
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

ui_print "[*] Checking for possible conflicts..."
ui_print " "

if [ -d $MODDIR/FDE ]; then
ui_print "[!] FDE.AI Module detected, removing for security reasons."
touch $MODDIR/FDE/disable

elif [ -d $MODDIR/ktweak ]; then
ui_print "[!] KTweak Module detected, removing for security reasons."
touch $MODDIR/ktweak/disable

elif [ -d $MODDIR/ZeetaaTweaks ]; then
ui_print "[!] ZeetaaTweaks Module detected, removing for security reasons."
touch $MODDIR/ZeetaaTweaks/disable

elif [ -d $MODDIR/lv-gpu-performance ]; then
ui_print "[!] Lv-gpu-performance Module detected, removing for security reasons."
touch $MODDIR/lv-gpu-performance/disable

elif [ -d $MODDIR/R.kashyap ]; then
ui_print "[!] Gamers Edition Module detected, removing for security reasons."
touch $MODDIR/R.kashyap/disable

elif [ -d $MODDIR/ZTS ]; then
ui_print "[!] ZTS Module detected, removing for security reasons."
touch $MODDIR/ZTS/disable

elif [ -d $MODDIR/MAGNETAR ]; then
ui_print "[!] MAGNETAR Module detected, removing for security reasons."
touch $MODDIR/MAGNETAR/disable

elif [ -d $MODDIR/Apollon ]; then
ui_print "[!] Apollon Module detected, removing for security reasons."
touch $MODDIR/Apollon/disable

elif [ -d $MODDIR/Apollon-plus ]; then
ui_print "[!] Apollon Plus Module detected, removing for security reasons."
touch $MODDIR/Apollon-plus/disable

elif [ -d $MODDIR/gameexp ]; then
ui_print "[!] Improve Game Xperience Module detected, removing for security reasons."
touch $MODDIR/gameexp/disable

elif [ -d $MODDIR/lspeed ]; then
ui_print "[!] LSpeed Module detected, removing for security reasons."
touch $MODDIR/lspeed/disable

elif [ -d $MODDIR/fkm_spectrum_injector ]; then
ui_print "[!] FKM Injector Module detected, removing for security reasons."
touch $MODDIR/fkm_spectrum_injector/disable

elif [ -d $MODDIR/KTSR ]; then
ui_print "[!] KTSR Module detected, removing for security reasons."
touch $MODDIR/KSTR/disable

elif [ -d $MODDIR/lazy ]; then
ui_print "[!] Lazy Tweaks Module detected, removing for security reasons."
touch $MODDIR/lazy/disable

elif [ -d $MODDIR/injector ]; then
ui_print "[!] NFS Injector Module detected, removing for security reasons."
touch $MODDIR/injector/disable

elif [ "$(pm list package magnetarapp)" ]; then
ui_print "[!] MAGNETAR App has been detected, I recommend removing the app to avoid conflicts."

elif [ "$(pm list package ktweak)" ]; then
ui_print "[!] KTweak App has been detected, I recommend removing the app to avoid conflicts."

elif [ "$(pm list package lsandroid)" ]; then
ui_print "[!] LSpeed App has been detected, I recommend removing the app to avoid conflicts."

elif [ "$(pm list package feravolt)" ]; then
ui_print "[!] FDE.AI App has been detected, I recommend removing the app to avoid conflicts."

elif [ "$(pm list package kitana)" ]; then
ui_print "[!] Kitana Tweak App has been detected, I recommend removing the app to avoid conflicts."

elif [ "$(pm list package nfs)" ]; then
ui_print "[!] NFS Manager App has been detected, I recommend removing the app to avoid conflicts."

    fi
sleep 1.5

 # Credit for all script below goes to king unlocker.

FTN="/data/data/com.epicgames.fortnite/files/UE4Game/FortniteGame/FortniteGame/Saved/Config/Android/GameUserSettings.ini"
DBD="/data/data/com.bhvr.deadbydaylight/files/UE4Game/DeadByDaylight/DeadByDaylight/Saved/Config/Android/GameUserSettings.ini"
SC="/data/media/0/Android/data/com.lnrgame.roguelike/files/SettingDatas.dat"
NS="/data/data/com.pubg.newstate/files/UE4Game/Extreme/Extreme/Saved/Config/Android/GameUserSettings.ini"
WR="H+vs4DOggQi7ygb7biEG29+ee0AT3YUrUUmFwfzaAweezd+i0T2OeYM9la0wt1RM/vyNFDXYA71W99xcn7nFBWr/K1bnzYZ6XSfbg7m/7SrVCHUeW/OX4d+6QBD9+rtaElCIyoWuaGEWDf1Q2WDjYH3cxkm8AGwl/OCuwMt/BsQHOSZtKDF/nL8DX2gt3ZSckQJl9SNEzt4GL9PShRE/bB+/WX+qPIWgBTUcLb9HBChgMNMHIAvnObvXhAntpej+T6KOl3GVGDZGA6m14Nf0pm74RI1opbaWuGU9/WMG9+vEdV3e7reQwR1AKmzeExTw3gOQgI0sZoGa/oEsLmVtnIKF4wBnkkEUVdnOaIVVcU5cSw6Y5E6O0sN9f+yJHdsC0Ki8+81TTt5r6ol7qNPX8vEJ70qAn6xdHqm02pSwqm7bXx15LLfYlp1tbd5+hHOWb/PtL20Vc7YXUHssWIzRFEgBr1SieqolbhNXnlCCJ2Iz3OstFvgtEgB6HSYMEKBg0Oyi7fjdpymO3Hve6WL/dgEiK4rybIV9oc4ySirx46OUkE/UrE7lh1A2/j2z5WmAtWGcivDnOqPPpDKLRXFj40Ds/iAC175JT4UNsRc/fs6huhEIGzlkxujuVsJ/f2o2Ciu28okSlTKOyRs/gSARTEkt45GO/wnVZfrxDd9NSsLXeF52IG6BDUkG9aV3ABMuF7cj5yZcB90eEkh/uLBdS5y+BBjpq9yq8t2ai6VRp0kY3YeCPLwJv2fK/6Is7BC+gHxV8pVomvZ/sonAT9Ta2ZoP92motacbaWMGK7MGLpw+qAvLh4AKZD9qCwjIBjLQDhhFCRlaPyr2iKx7ZMXo9cLIfcjaCNsx5CbyrYL7L07z19KI6TBzEIkMEwSjWwXMM1KEiXQpbWK6DAZPBAH8pwVJfdRz8kC5BLoVJbbYKtu9oFRbUISu9luFqg1nUX8Qh82BQAMyQyNHqilzbYwgRnMN0uqD/AbTeW6Mou1WOAjwg9rwG2fT28lNqE0GAl9Ud34Ez895ltVHi22NMizvxNth8rZay0CzjnMI+g4BpiztCx09+qgi4s7KZo4LP7l1Wu4by0WxQCdXdxdcU7VeC/45M9YaFcO/Srl/gFv4mrNlP958GJ4lkXDlWch2eUx2wVgNpQkffvcv+dHgH41mZlBAoEc7y734nHTsvjthbaO/oRXO0EdgKZqSksWnKI9fHDL47JxR2rN9jqn8B3SJMorarPSqa8RTqvw2CWVagupPhDlbZk5Naj2DyvllLSLDLZC/fW9dmVUb9Cu7cHDWDYSFhG/HTVZHcpk16+7fvw4ib37kJ1zKrfCCcJFaQQak3aX93iK+l50JTRywysUWbKImCjIOmMZZoyBcMp5P2X9dzOhb/kC+CUICh+s5GkrzOlAKIyr1cEtegYWzHVezeUEtbX9n9CXM6wB+e3LWaoffMh6EegbKrUnxpmxdRHu3clI3F+IAtXtz5NcH9gOwPgdHbUh1H3xkt7nNiBS3224fQyJzhLgD6TkyZeCdm7QQEHbsSoQC+n57LJQ9gyOMtDxCQN8JJIeWmPk8egHY3XIaAQP5UiaYxc6uE6Fnhu5TXoXtkFyGndccqIVAQtaaIcPpdRimQ5+EaBAUDQmCZvYuoFo9tsWDdsPZCYDFYsgNMG9HEeqA6nDtzzgw5kdgogMjchoMmTYOdCgaPkkgPNx8S5DCC5rpSR9x1O7MiquoCQhSBdLGWpYWi80rheP0WQfnmVbIjFJpoWTFOQ3T/7H3DzYaniPox+gXDvhZaB0i9ksSWiXlXklfPsO4X2QK/HfNyVV+1aA4ONRuMTdVan2jn+meBjraWlniUBe1Hs54"


awk '{print}' "${MODPATH}/common/ru_banner" 
sleep 3
ui_print " [!] Important: These settings can cause  "
ui_print "                errors in system applications.  "
sleep 0.5
ui_print " "
ui_print "     Might not work if you are using "
ui_print "     magiskhideprops or other like module. "
ui_print " "
ui_print " "
sleep 0.5
ui_print " 1 - None "
ui_print ""
ui_print " 2 - Apply CODM 120 FPS "
ui_print ""
ui_print " 3 - Apply Asphalt and BDM Max Settings "
ui_print ""
ui_print " 4 - Apply LOL WR Max Settings "
ui_print ""
ui_print " 5 - Apply Fortnite 60 FPS (Override all FPS modes lower than 60 and doesn't change device model) "
ui_print ""
ui_print " 6 - Apply PUBGM 90 FPS and Fortnite 60 FPS "
ui_print ""
ui_print " 7 - Apply CODM 120 FPS and Fortnite 60 FPS "
ui_print ""
ui_print " 8 - Apply LOL WR Max Settings and Fortnite 60 FPS "
ui_print ""
ui_print " 9 - Apply PUBGM 90 FPS, LOL WR 120 FPS and Fortnite 60 FPS "
ui_print ""
ui_print " 10 - Apply CODM 120 FPS, LOL WR 120 FPS and Fortnite 60 FPS "
ui_print ""
ui_print " 11 - Asphalt, CODM, BDM Max Settings and Fortnite 60 FPS "
ui_print ""
ui_print " 12 - Apply Asphalt, CODM, BDM Max Settings and Fortnite 60 FPS "
ui_print ""
ui_print " 13 - Apply LOL WR 120 FPS "
ui_print ""
ui_print " 14 - Apply PUBGM (Global) 90 FPS "
ui_print ""
ui_print " 15 - Apply ML Max Settings "
ui_print ""
ui_print " 16 - Apply Asphalt 9 and Sky Children of the Light 60 FPS "
ui_print ""
ui_print " 17 - Apply Game for Peace 90 FPS "
ui_print ""
ui_print " 18 - Apply Forsaken World 60 FPS "
ui_print ""
ui_print " 19 - Apply LifeAfter 120 FPS "
ui_print ""
ui_print " 20 - Apply Super Clone 120 FPS "
ui_print ""
ui_print " 21 - Apply Dead by Daylight 120 FPS "
ui_print ""
ui_print " 22 - Apply PUBG: NS 90 FPS "
ui_print ""
ui_print " 23 - Apply BGMI 90 FPS "
ui_print ""
ui_print " 24 - Apply better quality on streaming services (Amazon Prime, Netflix, etc.)"
ui_print ""
ui_print " 25 - Apply Free Fire / Shadowgun Legends 90 FPS"
ui_print ""
ui_print "[*] Select which you want: "
ui_print ""
    KU=1
	while true; do
		ui_print "  $KU"
		if "$VKSEL"; then
			KU=$((KU + 1))
		else
			break
		fi
		if [[ "$KU" -gt "25" ]]; then
			KU=1
		fi
	done

	for GS in /data/media/0/Android/data/com.riotgames.league.wildrift/files/SaveData/Local/*/Setting; do
		case "$KU" in
1 ) 
FCTEXTAD2="None"
;;
2)
FCTEXTAD2="CODM 120 FPS"
sed -i '/ro.product.model/s/.*/ro.product.model=XQ-AS72/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=XQ-AS72/' "${modpath}system1.prop"
;;
3)
FCTEXTAD2="Asphalt 9, CODM and BDM Max Settings"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G965F/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G965F/' "${modpath}system1.prop"
;;
4)FCTEXTAD2="LOL WR Max Settings"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G9880/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G9880/' "${modpath}system1.prop"
;;
5)
FCTEXTAD2="Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
;;
6)
FCTEXTAD2="PUBGM 90 FPS and Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${modpath}system1.prop"
;;
7)
FCTEXTAD2="CODM 120 FPS and Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i '/ro.product.model/s/.*/ro.product.model=SO-52A/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=SO-52A/' "${modpath}system1.prop"
;;
8)
FCTEXTAD2="LOL WR Max Settings and Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i '/ro.product.model/s/.*/ro.product.model=A2218/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=A2218/' "${modpath}system1.prop"
;;
9)
FCTEXTAD2="PUBGM 90 FPS, LOL WR 120 FPS and Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
am force-stop com.riotgames.league.wildrift
echo "$WR" >"$GS"
sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${modpath}system1.prop"
;;
10)
FCTEXTAD2="CODM 120 FPS, LOL WR 120 FPS and Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
am force-stop com.riotgames.league.wildrift
echo "$WR" >"$GS"
sed -i '/ro.product.model/s/.*/ro.product.model=SO-52A/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=SO-52A/' "${modpath}system1.prop"
;;
11)
FCTEXTAD2="Asphalt, CODM, BDM Max Settings and Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G965F/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G965F/' "${modpath}system1.prop"
;;
12)
FCTEXTAD2="Fortnite 60 FPS"
am force-stop com.epicgames.fortnite
sed -i 's/MobileFPSMode=Mode_20Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_30Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
sed -i 's/MobileFPSMode=Mode_45Fps/MobileFPSMode=Mode_60Fps/g' "$FTN"
;;
13)
FCTEXTAD2="LOL WR 120 FPS"
am force-stop com.riotgames.league.wildrift
echo "$WR" >"$GS"
;;
14)
FCTEXTAD2="PUBGM 90 FPS"
sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=IN2023/' "${modpath}system1.prop"
;;
15)
FCTEXTAD2="ML Max Settings"
sed -i '/ro.product.model/s/.*/ro.product.model=umi/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=umi/' "${modpath}system1.prop"
;;
16)
FCTEXTAD2="Asphalt 9 and Sky Children of the Light 60 FPS"
sed -i '/ro.product.model/s/.*/ro.product.model=GM1917/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=GM1917/' "${modpath}system1.prop"
;;
17)
FCTEXTAD2="Game For Peace 90 FPS"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G9880/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=SM-G9880/' "${modpath}system1.prop"
;;
18)
FCTEXTAD2="Forsaken World 120 FPS"
sed -i '/ro.product.model/s/.*/ro.product.model=ZS673KS-1B063IN/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=ZS673KS-1B063IN/' "${modpath}system1.prop"
;;
19)
FCTEXTAD2="LifeAfter 120 FPS"
am force-stop com.netease.mrzhna 2>/dev/null
sed -i 's/"frame": 1,/"frame": 4,/g' "$LIFE"
sed -i 's/"frame": 2,/"frame": 4,/g' "$LIFE"
sed -i 's/"frame": 3,/"frame": 4,/g' "$LIFE"
;;
20)
FCTEXTAD2="Super Clone 120 FPS"
am force-stop com.lnrgame.roguelike 2>/dev/null
sed -i 's/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":30,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":120,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/g' "$SC"
sed -i 's/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":45,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":120,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/g' "$SC"
sed -i 's/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":60,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/{"isFPSOn":true,"isEffectSoundOn":true,"isMusicSoundOn":true,"targetFPS":120,"isFixTouchJoystickPosition":true,"isFixTouchJoystickCompletely":true}/g' "$SC"
;;
21)
FCTEXTAD2="Dead by Daylight 120 FPS"
am force-stop com.bhvr.deadbydaylight 2>/dev/null
sed -i 's/FrameRateLimit=30/FrameRateLimit=120/g' "$DBD"
sed -i 's/FrameRateLimit=60/FrameRateLimit=120/g' "$DBD"
;;
22)
FCTEXTAD2="PUBG: NS 90 FPS"
am force-stop com.pubg.newstate 2>/dev/null
sed -i 's/FrameRateLimit=30.000000/FrameRateLimit=90.000000/g' "$NS"
sed -i 's/FrameRateLimit=60.000000/FrameRateLimit=90.000000/g' "$NS"
sed -i 's/AudioQualityLevel=2/AudioQualityLevel=0/g' "$NS"
sed -i 's/AudioQualityLevel=1/AudioQualityLevel=0/g' "$NS"
sed -i 's/LastConfirmedAudioQualityLevel=2/LastConfirmedAudioQualityLevel=0/g' "$NS"
sed -i 's/LastConfirmedAudioQualityLevel=1/LastConfirmedAudioQualityLevel=0/g' "$NS"
;;
23)
FCTEXTAD2="BGMI 90 FPS"
sed -i '/ro.product.model/s/.*/ro.product.model=M2102K1C/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=M2102K1C/' "${modpath}system1.prop"
;;
24)
FCTEXTAD2="Better quality on streaming services (Amazon Prime, Netflix, etc.)"
sed -i '/ro.product.model/s/.*/ro.product.model=oriole/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.device/s/.*/ro.product.device=oriole/' "${modpath}system.prop"
sed -i '/ro.product.device/s/.*/ro.product.device=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.brand/s/.*/ro.product.brand=Google/' "${modpath}system.prop"
sed -i '/ro.product.brand/s/.*/ro.product.brand=Google/' "${modpath}system1.prop"
sed -i '/ro.product.manufacturer/s/.*/ro.product.manufacturer=Google/' "${modpath}system.prop"
sed -i '/ro.product.manufacturer/s/.*/ro.product.manufacturer=Google/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.model/s/.*/ro.product.vendor.model=Pixel 6/' "${modpath}system.prop"
sed -i '/ro.product.vendor.model/s/.*/ro.product.vendor.model=Pixel 6/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.device/s/.*/ro.product.vendor.device=oriole/' "${modpath}system.prop"
sed -i '/ro.product.vendor.device/s/.*/ro.product.vendor.device=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.brand/s/.*/ro.product.vendor.brand=google/' "${modpath}system.prop"
sed -i '/ro.product.vendor.brand/s/.*/ro.product.vendor.brand=google/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.manufacturer=Google/' "${modpath}system.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.manufacturer=Google/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.name=oriole/' "${modpath}system.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.name=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.odm.model/s/.*/ro.product.odm.model=Pixel 6/' "${modpath}system.prop"
sed -i '/ro.product.odm.model/s/.*/ro.product.odm.model=Pixel 6/' "${modpath}system1.prop"
sed -i '/ro.product.odm.device/s/.*/ro.product.odm.device=oriole/' "${modpath}system.prop"
sed -i '/ro.product.odm.device/s/.*/ro.product.odm.device=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.odm.brand/s/.*/ro.product.odm.brand=google/' "${modpath}system.prop"
sed -i '/ro.product.odm.brand/s/.*/ro.product.odm.brand=google/' "${modpath}system1.prop"
sed -i '/ro.product.odm.manufacturer/s/.*/ro.product.odm.manufacturer=Google/' "${modpath}system.prop"
sed -i '/ro.product.odm.manufacturer/s/.*/ro.product.odm.manufacturer=Google/' "${modpath}system1.prop"
sed -i '/ro.product.odm.name/s/.*/ro.product.odm.name=oriole/' "${modpath}system.prop"
sed -i '/ro.product.odm.name/s/.*/ro.product.odm.name=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.model/s/.*/ro.product.system_ext.model=Pixel 6/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.model/s/.*/ro.product.system_ext.model=Pixel 6/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.device/s/.*/ro.product.system_ext.device=oriole/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.device/s/.*/ro.product.system_ext.device=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.brand/s/.*/ro.product.system_ext.brand=google/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.brand/s/.*/ro.product.system_ext.brand=google/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.manufacturer/s/.*/ro.product.system_ext.manufacturer=Google/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.manufacturer/s/.*/ro.product.system_ext.manufacturer=Google/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.name/s/.*/ro.product.system_ext.name=oriole/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.name/s/.*/ro.product.system_ext.name=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.system.model/s/.*/ro.product.system.model=Pixel 6/' "${modpath}system.prop"
sed -i '/ro.product.system.model/s/.*/ro.product.system.model=Pixel 6/' "${modpath}system1.prop"
sed -i '/ro.product.system.device/s/.*/ro.product.system.device=oriole/' "${modpath}system.prop"
sed -i '/ro.product.system.device/s/.*/ro.product.system.device=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.system.brand/s/.*/ro.product.system.brand=google/' "${modpath}system.prop"
sed -i '/ro.product.system.brand/s/.*/ro.product.system.brand=google/' "${modpath}system1.prop"
sed -i '/ro.product.system.manufacturer/s/.*/ro.product.system.manufacturer=Google/' "${modpath}system.prop"
sed -i '/ro.product.system.manufacturer/s/.*/ro.product.system.manufacturer=Google/' "${modpath}system1.prop"
sed -i '/ro.product.system.name/s/.*/ro.product.system.name=oriole/' "${modpath}system.prop"
sed -i '/ro.product.system.name/s/.*/ro.product.system.name=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.product.model/s/.*/ro.product.product.model=Pixel 6/' "${modpath}system.prop"
sed -i '/ro.product.product.model/s/.*/ro.product.product.model=Pixel 6/' "${modpath}system1.prop"
sed -i '/ro.product.product.device/s/.*/ro.product.product.device=oriole/' "${modpath}system.prop"
sed -i '/ro.product.product.device/s/.*/ro.product.product.device=oriole/' "${modpath}system1.prop"
sed -i '/ro.product.product.brand/s/.*/ro.product.product.brand=google/' "${modpath}system.prop"
sed -i '/ro.product.product.brand/s/.*/ro.product.product.brand=google/' "${modpath}system1.prop"
sed -i '/ro.product.product.manufacturer/s/.*/ro.product.product.manufacturer=Google/' "${modpath}system.prop"
sed -i '/ro.product.product.manufacturer/s/.*/ro.product.product.manufacturer=Google/' "${modpath}system1.prop"
sed -i '/ro.product.product.name/s/.*/ro.product.product.name=oriole/' "${modpath}system.prop"
sed -i '/ro.product.product.name/s/.*/ro.product.product.name=oriole/' "${modpath}system1.prop"
sed -i '/ro.build.fingerprint/s/.*/ro.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system.prop"
sed -i '/ro.build.fingerprint/s/.*/ro.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system1.prop"
sed -i '/ro.odm.build.fingerprint/s/.*/ro.odm.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system.prop"
sed -i '/ro.odm.build.fingerprint/s/.*/ro.odm.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system1.prop"
sed -i '/ro.system.build.fingerprint/s/.*/ro.system.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system.prop"
sed -i '/ro.system.build.fingerprint/s/.*/ro.system.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system1.prop"
sed -i '/ro.vendor.build.fingerprint/s/.*/ro.vendor.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system.prop"
sed -i '/ro.vendor.build.fingerprint/s/.*/ro.vendor.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system1.prop"
sed -i '/ro.product.build.fingerprint/s/.*/ro.product.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system.prop"
sed -i '/ro.product.build.fingerprint/s/.*/ro.product.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system1.prop"
sed -i '/ro.bootimage.build.fingerprint/s/.*/ro.bootimage.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system.prop"
sed -i '/ro.bootimage.build.fingerprint/s/.*/ro.bootimage.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system1.prop"
sed -i '/ro.system_ext.build.fingerprint/s/.*/ro.system_ext.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system.prop"
sed -i '/ro.system_ext.build.fingerprint/s/.*/ro.system_ext.build.fingerprint=google\/oriole\/oriole:12\/SP2A.220305.013.A3\/8229987:user\/release-keys/' "${modpath}system1.prop"
sed -i '/ro.build.product/s/.*/ro.build.product=oriole/' "${modpath}system.prop"
;;
25)
FCTEXTAD2="Free Fire / Shadowgun Legends 90 FPS"
sed -i '/ro.product.model/s/.*/ro.product.model=ASUS_Z01QD/' "${modpath}system.prop"
sed -i '/ro.product.model/s/.*/ro.product.model=ASUS_Z01QD/' "${modpath}system1.prop"
sed -i '/ro.product.device/s/.*/ro.product.device=ASUS_Z01QD_1/' "${modpath}system.prop"
sed -i '/ro.product.device/s/.*/ro.product.device=ASUS_Z01QD_1/' "${modpath}system1.prop"
sed -i '/ro.product.manufacturer/s/.*/ro.product.manufacturer=asus/' "${modpath}system.prop"
sed -i '/ro.product.manufacturer/s/.*/ro.product.manufacturer=asus/' "${modpath}system1.prop"
sed -i '/ro.product.product.device/s/.*/ro.product.product.device=ASUS_Z01QD_1/' "${modpath}system.prop"
sed -i '/ro.product.product.device/s/.*/ro.product.product.device=ASUS_Z01QD_1/' "${modpath}system1.prop"
sed -i '/ro.product.product.brand/s/.*/ro.product.product.brand=asus/' "${modpath}system.prop"
sed -i '/ro.product.product.brand/s/.*/ro.product.product.brand=asus/' "${modpath}system1.prop"
sed -i '/ro.product.product.manufacturer/s/.*/ro.product.product.manufacturer=asus/' "${modpath}system.prop"
sed -i '/ro.product.product.manufacturer/s/.*/ro.product.product.manufacturer=asus/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.device/s/.*/ro.product.vendor.device=ASUS_Z01QD_1/' "${modpath}system.prop"
sed -i '/ro.product.vendor.device/s/.*/ro.product.vendor.device=ASUS_Z01QD_1/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.brand/s/.*/ro.product.vendor.brand=asus/' "${modpath}system.prop"
sed -i '/ro.product.vendor.brand/s/.*/ro.product.vendor.brand=asus/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.manufacturer=asus/' "${modpath}system.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.manufacturer=asus/' "${modpath}system1.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.name=ASUS_Z01QD/' "${modpath}system.prop"
sed -i '/ro.product.vendor.manufacturer/s/.*/ro.product.vendor.name=ASUS_Z01QD/' "${modpath}system1.prop"
sed -i '/ro.product.odm.device/s/.*/ro.product.odm.device=ASUS_Z01QD_1/' "${modpath}system.prop"
sed -i '/ro.product.odm.device/s/.*/ro.product.odm.device=ASUS_Z01QD_1/' "${modpath}system1.prop"
sed -i '/ro.product.odm.brand/s/.*/ro.product.odm.brand=asus/' "${modpath}system.prop"
sed -i '/ro.product.odm.brand/s/.*/ro.product.odm.brand=asus/' "${modpath}system1.prop"
sed -i '/ro.product.odm.manufacturer/s/.*/ro.product.odm.manufacturer=asus/' "${modpath}system.prop"
sed -i '/ro.product.odm.manufacturer/s/.*/ro.product.odm.manufacturer=asus/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.device/s/.*/ro.product.system_ext.device=ASUS_Z01QD_1/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.device/s/.*/ro.product.system_ext.device=ASUS_Z01QD_1/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.brand/s/.*/ro.product.system_ext.brand=asus/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.brand/s/.*/ro.product.system_ext.brand=asus/' "${modpath}system1.prop"
sed -i '/ro.product.system_ext.manufacturer/s/.*/ro.product.system_ext.manufacturer=asus/' "${modpath}system.prop"
sed -i '/ro.product.system_ext.manufacturer/s/.*/ro.product.system_ext.manufacturer=asus/' "${modpath}system1.prop"
sed -i '/ro.product.system.device/s/.*/ro.product.system.device=ASUS_Z01QD_1/' "${modpath}system.prop"
sed -i '/ro.product.system.device/s/.*/ro.product.system.device=ASUS_Z01QD_1/' "${modpath}system1.prop"
sed -i '/ro.product.system.brand/s/.*/ro.product.system.brand=asus/' "${modpath}system.prop"
sed -i '/ro.product.system.brand/s/.*/ro.product.system.brand=asus/' "${modpath}system1.prop"
sed -i '/ro.product.system.manufacturer/s/.*/ro.product.system.manufacturer=asus/' "${modpath}system.prop"
sed -i '/ro.product.system.manufacturer/s/.*/ro.product.system.manufacturer=asus/' "${modpath}system1.prop"
sed -i '/ro.product.product.device/s/.*/ro.product.product.device=ASUS_Z01QD_1/' "${modpath}system.prop"
sed -i '/ro.product.product.device/s/.*/ro.product.product.device=ASUS_Z01QD_1/' "${modpath}system1.prop"
sed -i '/ro.product.product.brand/s/.*/ro.product.product.brand=asus/' "${modpath}system.prop"
sed -i '/ro.product.product.brand/s/.*/ro.product.product.brand=asus/' "${modpath}system1.prop"
sed -i '/ro.product.product.manufacturer/s/.*/ro.product.product.manufacturer=asus/' "${modpath}system.prop"
sed -i '/ro.product.product.manufacturer/s/.*/ro.product.product.manufacturer=asus/' "${modpath}system1.prop"
sed -i '/ro.build.product/s/.*/ro.build.product=ZS600KL/' "${modpath}system.prop"
sed -i '/ro.build.product/s/.*/ro.build.product=ZS600KL/' "${modpath}system1.prop"
;;
		esac
		break
	done

	ui_print ""
	ui_print "Selected: $FCTEXTAD2 "
	ui_print ""
	sleep 2
fi
sleep 1
ui_print " - [*] Created by raidenkk @ (Telegram)"
sleep 2
ui_print " "
ui_print " - Contributors, credits:"
sleep 1
ui_print " "
ui_print " - King Tweaks dev: pedro3z0 @ (Telegram)"
sleep 1
ui_print " "
ui_print " - Spectrum dev: frap129 @ (GitHub)"
sleep 1
ui_print " "
ui_print " - Zeus Tweaks dev: KiraaDeath @ (Telegram)"
sleep 1
ui_print " "
ui_print " - Apollon dev: Haxis_Lancelot @ (Telegram)"
sleep 1
ui_print " "
ui_print " - ThermodX dev: imUsiF12 @ (Telegram)"
sleep 1
ui_print " "
ui_print " - Mod Utils dev: Veez21 @ (GitHub)"
sleep 1
ui_print " "
ui_print " - MMT-Extended dev: Zackptg5 @ (GitHub)"
sleep 1
ui_print " "
ui_print " - [!] Join my support group: @rtksgroup (Telegram)"
sleep 1
ui_print " "
ui_print " - Thanks to everyone for the feedback, it helps a lot. ❤️"
sleep 1
ui_print " "
ui_print "[*] Downloading the latest script(s) / application from Github..."
ui_print " "
wget -O "${MODPATH}/system/bin/raidentweaks" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/main/system/bin/raidentweaks"
wget -O "${MODPATH}/system/bin/rtksmenu" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/main/system/bin/rtksmenu"
wget -O "${MODPATH}/system/bin/cleaner" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/main/cleaner"
wget -O "${MODPATH}/system/bin/cleaner" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/main/fstrim"
wget -O "${MODPATH}/mod-util.sh" "https://raw.githubusercontent.com/raidenkkj/Raiden-Tweaks/main/mod-util.sh"
wget -O "/data/local/tmp/RaidenTweaks.apk" "https://github.com/raidenkkj/Raiden-Tweaks/blob/main/RaidenTweaks.apk?raw=true"
wget -O "/data/local/tmp/RDToast.apk" "https://github.com/raidenkkj/Raiden-Tweaks/blob/main/RDToast.apk?raw=true"

ui_print "[*] Okay, all necessary files have been successfully installed."
ui_print " "
ui_print "[*] Installing main application..."
pm install /data/local/tmp/RaidenTweaks.apk
ui_print " "
ui_print "[*] Installing toasts app..."
pm install /data/local/tmp/RDToast.apk
ui_print " "
ui_print " - The logs are in a hidden place"
ui_print "   if you want the logs, get it using rtksmenu."
sleep 1
ui_print " "
ui_print "- [*] Raiden Tweaks Module has been installed successfuly!"
ui_print " "
sleep 2
