#set -o history
#HISTFILESIZE=5000
#HISTSIZE=5000
#
# JIC [ Just in case ]-> of something going deeply wrong or just pushing randomly
#
#
#
#-----------------------------------------------------------#
# FileName: QMC_autobuilder.sh                              #
# Desc: Should allow running qmc project with one click     #
# Author: Slavko V.                                         #
# Date: 2021.01.08                                          #
#-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-#
echo -e '< \e[1mWelcome to QMC autobuilder\e[0m >'
echo ''
echo -e '\e[2mDescription\e[22m  : This will clone repositories required for running QMC containers.'
echo -e '\e[2mRequirements\e[22m : docker, composer [in your local os] and missing_files folder'
echo ''
echo -e "Press \e[1m[enter] \e[0mto BEGIN the setup"
read -p ''
declare -i errorNumb=0
errMSG='ErrorMSG List: [ '
echo  
# << SO 1.Check Missing files section SO >> #
echo 'Looking for a missing files'
# << SO 1.1.looking for folder named 'missing_files' SO >> #
if [ -d "missing_files" ] 
then
    echo -e "[ \e[32mSuccess\e[39m: Directory < missing_files > exists. ]"
else
    errorNumb=errorNumb+1
    errMSG=$errMSG"|> ERROR: Directory < missing_files > does not exists. <"
    echo -e "[ \033[31mERROR\e[0m Directory < missing_files > does not exists. ]"
fi
# << EO 1.1. looking for folder named 'missing_files' EO >> #
#
# << SO 1.2. Looking for config.php file SO >> #
FILE=missing_files/config.php
if [ -f "$FILE" ]; then
    echo -e "[ \e[32mSuccess\e[39m: File < $FILE > exists. ]"
else 
    errorNumb=errorNumb+1
    errMSG=$errMSG"|> ERROR: File $FILE does not exist. <|"
    echo -e "[ \033[31mERROR\e[0m File $FILE does not exist. ]"
fi
# << EO 1.2. Looking for config.php file EO >> #
#
# << SO 1.3. Looking for database.php file SO >> #
FILE=missing_files/database.php
if [ -f "$FILE" ]; then
    echo -e "[ \e[32mSuccess\e[39m: File < $FILE > exists. ]"
else 
    errorNumb=errorNumb+1
    errMSG=$errMSG"|> ERROR: File $FILE does not exist. <|"
    echo -e "[ \033[31mERROR\e[0m File $FILE does not exist. ]"
fi
# << EO 1.3. Looking for database.php file EO >> #
#
# << SO 1.4. Looking for phinx.yml file SO >> #
FILE=missing_files/phinx.yml
if [ -f "$FILE" ]; then
    echo -e "[ \e[32mSuccess\e[39m: File < $FILE > exists. ]"
else 
    errorNumb=errorNumb+1
    errMSG=$errMSG"|> ERROR: File $FILE does not exist. <|"
    echo -e "[ \033[31mERROR\e[0m File $FILE does not exist. ]"
fi
# << EO 1.4. Looking for phinx.yml file EO >> #
#
# << SO 1.5. Looking for instacraft.sql file SO >> #
FILE=missing_files/instacraft.sql
if [ -f "$FILE" ]; then
    echo -e "[ \e[32mSuccess\e[39m: File < $FILE > exists. ]"
else 
    errorNumb=errorNumb+1
    errMSG=$errMSG"|> ERROR: File $FILE does not exist. <|"
    echo -e "[ \033[31mERROR\e[0m File $FILE does not exist. ]"
fi
# << EO 1.5. Looking for instacraft.sql file EO >> #
#
# << SO 1.5. Looking for htaccess file SO >> #
FILE=missing_files/htaccess
if [ -f "$FILE" ]; then
    echo -e "[ \e[32mSuccess\e[39m: File < $FILE > exists. ]"
else 
    errorNumb=errorNumb+1
    errMSG=$errMSG"|> ERROR: File $FILE does not exist. <|"
    echo -e "[ \033[31mERROR\e[0m File $FILE does not exist. ]"
fi
# << EO 1.5. Looking for htaccess file EO >> #
# << EOmissing files sectionEO >> #
echo
# << SO error check if run build SO >> #
#read -p "Press [enter] to CONTINUE the setup"    
if [ "$errorNumb" -gt 0 ]; then    
    errMSG=$errMSG" ]"
    echo 'Number of Errors: '$errorNumb
    echo "$errMSG"
else 
    echo "[ START: Developer Setup Process ]"
    # Clone Instacraft-med
    echo "[ CLONE: Cloning Instacraft-Med repo. ]"
    git clone https://bitbucket.org/bloomcraft/instacraft-med.git
    echo "[ DONE_CLONE: Cloning Instacraft-Med repo. ]"
    # Done -> Clone Instacraft-med
    echo ""
    # Clone Instacraft
    echo "[ CLONE: Cloning Instacraft repo... ]"
    git clone https://bitbucket.org/bloomcraft/instacraft.git
    echo "[ DONE_CLONE: cloning Instacraft repo. ]"
    # Done -> Clone Instacraft
    # JIC -> checking you out to dev branches...
    #echo ""
    #echo "[ JIC: Checking you out to dev ]"
    #cd instacraft
    #git checkout dev
    #cd ..
    #cd instacraft-med
    #git checkout dev
    #cd ..
    echo ""
    echo "[ DONE_JIC: Checking you out to dev ]"
    # EOJIC
    # Handle .database/instacraft.sql
    echo ""
    echo "[ COPY: Database make folder and copy over ]"
    cd instacraft-med 
    mkdir '.database'
    cd ..
    cp missing_files/instacraft.sql instacraft-med/.database/instacraft.sql
    echo "[ DONE_COPY: Database make folder and copy over ]"
    # Done -> Handle .database/instacraft.sql
    # Handle -> exiting db config file in instacraft folder
    echo ""
    # Create .env files
    echo "[ CREATE: Create env files ]"
    cp instacraft-med/.env.development instacraft-med/.env
    cp instacraft/.env.development instacraft/.env
    echo "[ DONE_CREATE: Create env files ]"
    # DONE -> .env files
    echo ""
    # Create .htaccess files
    echo "[ COPY: Adding .htaccess files ]"
    cp missing_files/htaccess instacraft-med/.htaccess
    cp missing_files/htaccess instacraft/.htaccess
    echo "[ DONE_COPY: Adding .htaccess files ]"
    # DONE -> .htaccess files
    echo ""
    # Create phinx.yml
    echo "[ COPY: Adding phinx.yml files ]"
    cp missing_files/phinx.yml instacraft-med/phinx.yml
    cp missing_files/phinx.yml instacraft/phinx.yml
    echo "[ DONE_COPY: Adding phinx.yml files ]"
    # DONE -> phinx.yml files
    echo ""
    # Adding missing PHP files
    echo "[ COPY: Adding missing PHP files ]"
    cp missing_files/config.php instacraft-med/application/config/config.php
    cp missing_files/database.php instacraft-med/application/config/database.php
    echo "[ DONE_COPY: Adding missing PHP files ]"
    # DONE -> Adding missing PHP files
    # ADDITIONAL FIX FOR INSTACRAFT REPO DATABASE CONFIG FILE...
    #### RENAMING -> instacraft db config file
    ####echo ""
    ####echo "[ FIX: renaming DB access file in instacraft repo. <<NEEDED FOR PROCUCTION>> ]"
    ####mv instacraft/application/config/database.php instacraft/application/config/database_old.php
    ####cp missing_files/database.php instacraft/application/config/database.php
    ####echo "[ DONE_ FIX: renaming DB access file in instacraft repo. <<NEEDED FOR PROCUCTION>> ]"
    echo ""
    # Install Composer in both directories
    echo "[ INSTALL: Install Composer [BOTH] ]"
    cd instacraft
    composer install
    cd ..
    cd instacraft-med
    composer install
    echo "[ DONE_INSTALL: Install Composer [BOTH] ]"
    echo ""
    echo "[ BUILD: docker-compose in [BOTH] ]"
    docker-compose up --build -d
    cd ..
    cd instacraft
    docker-compose up --build -d
    cd ..
    echo "[ DONE_BUILD: docker-compose in [BOTH] ]"
    # DONE -> Install Composer in both directories
    echo ""
    echo "[ DONE: Developer Setup Process ]"
fi  # << EO error check if run build EO >> #    
echo ""
read -p "Press [enter] to FINISH/EXIT the setup"
echo ''
##########
####LOGGER = >!! KEEP AS COMMENT !! <= Heavy memory usage####
#now=$(date +'%Y-%m-%d@%H.%M.%S') && username=$(git config --global user.email) && history > 'included_files/logs/'$now'_'$username'_hist_cleaner'.txt
#echo '' 
#########