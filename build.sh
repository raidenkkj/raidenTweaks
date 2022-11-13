#!/system/bin/sh

# Colors
yellow=$(tput setaf 3)
green=$(tput setaf 2)
boldgreen=${bold}${green}
boldred=${bold}${red}
red=$(tput setaf 1)
blue=$(tput setaf 4)
bold=$(tput bold)
blink=$(tput blink)
default=$(tput sgr0)

# Utilities
rname=raidenTweaks
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
hour=$(date +%H)
minute=$(date +%M)
bddate=$(date +%Y-%m-%d)
outdir=$HOME/storage/downloads/builds

printf "\033c"
echo "${bold}${green}"
echo "|  raidenTweaks module builder  |"
echo "|      raidenkk @ telegram      |"
echo "${bold}"
read -r -p ${boldgreen}'Codename: '${blue} cdnm
read -r -p ${boldgreen}'Version: '${blue} vers
read -r -p ${boldgreen}'Version code: '${blue} vcode

init=$(date +%s)

[ "$(grep bdate $(pwd)/module.prop)" ] && sed -i -e "/bdate=/s/=.*/=$bddate/" "$(pwd)/module.prop"

[ ! "$(grep bdate $(pwd)/module.prop)" ] && echo "bdate=$bddate" >>"$(pwd)/module.prop"

sed -i -e "/version=/s/=.*/=$vers/" "$(pwd)/module.prop"
sed -i -e "/versionCode=/s/=.*/=$vcode/" "$(pwd)/module.prop"
sed -i -e "/codename=/s/=.*/=$cdnm/" "$(pwd)/module.prop"

echo "${bold}"
echo "${boldgreen}Build starting at $(date)"
echo ""

echo "${default}${bold}Zipping ${blink}$rname-$cdnm-$year$month$day$hour$minute..."
echo ""


zip -0 -r9 -ll "$rname-$cdnm-$year$month$day$hour$minute.zip" . -x '*.git*' -x '*RaidenTweaks.apk*' -x '*RDToast.apk*' -x '*mod-util.sh*' -x '*fstrim*' -x '*lmkmenu*' -x '*cleaner*' -x '*changelog.md*' -x '*raidenauto*' -x '*raidentweaks*' -x '*rtksmenu*' -x '*images*' -x '*build.sh*'

if [ -d "$outdir" ]
then
mv -f "$rname-$cdnm-$year$month$day$hour$minute.zip" $outdir
else
`mkdir $outdir`
mv -f "$rname-$cdnm-$year$month$day$hour$minute.zip" $outdir
fi

exit=$(date +%s)

exec_time=$((exit - init))

[ $? -ne "1" ] && {
    echo ""
	echo "${boldgreen}Build done in "$((exec_time / 60))" minutes and $exec_time seconds!${blue} Check the out folder to the finished build."
	exit 0
} || {
    echo ""
	echo "${boldred}Build failed in "$((exec_time / 60))" minutes and $exec_time seconds!${yellow} Please fix the error(s) and try again."
	exit 1
}
