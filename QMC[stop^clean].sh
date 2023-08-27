#-----------------------------------------------------------#
# FileName: QMC_auto[stop^clean].sh                         #
# Desc: Should allow stopping containers in one click       #
# Author: jcodenot                                         #
# Date: 2021.01.08                                          #
#-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-#
echo -e '< \e[1mWelcome to QMC auto[stop^clean]\e[0m >'
echo ''
echo -e '\e[2mDescription\e[22m  : This will stop and remove containers.'
echo ""
echo -e "Press \e[1m[enter] \e[0mto BEGIN the setup"
read -p ''
# Create .htaccess files
echo "SO: Stopping QMC project containers "
echo "stopping -> icc_container"
docker stop icc_container
echo "stopping -> qmc_container"
docker stop qmc_container
echo "stopping -> mysql_container"
docker stop mysql_container
echo "stopping -> qmc_phpmyadmin"
docker stop qmc_phpmyadmin
echo "EO: Stopping QMC project containers "
echo ""
echo "SO: Removing QMC project containers "
echo "removing -> icc_container"
docker rm icc_container
echo "removing -> qmc_container"
docker rm qmc_container
echo "removing -> mysql_container"
docker rm mysql_container
echo "removing -> qmc_phpmyadmin"
docker rm qmc_phpmyadmin
echo "EO: Removing QMC containers "
# DONE -> .htaccess files
echo ""
echo "Doing a system prune of unused stuff {not a whole docker prune...only minor one}"
yes Y |docker system prune
echo "[Done -> docker system prune ]"
echo ""
echo ""
read -p "Press [enter] to FINISH/EXIT the QMC_stopper"
echo ''
