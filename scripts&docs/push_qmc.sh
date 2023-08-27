cd instacraft
echo ""
echo "Pushing Instacraft..."
echo ""
echo "> Swamping database.php and database_old.php to get [ORIGINAL] back."
echo ""
cd application/config/
mv database_old.php database_n.php
mv database.php database_old.php
mv database_n.php database.php
echo "> Done Swamping files." 
echo ""
cd ..
cd ..
while true; do
    echo "Instacraft branch: "  
    echo "   -> $(git branch --show-current)"
    echo " "
    read -p "Confirm Push[y/n]: " yn
    case $yn in
        [Yy]* ) echo "Pushing to $(git branch --show-current)"; git push origin $( git branch --show-current ); break;;
        [Nn]* ) break;;
        * ) echo "[ Input Empty >> exiting ] Please answer yes or no."; break;
    esac
done
echo ""
echo "> Swamping database.php and database_old.php to get [DEVELOPMENT] one into use."  
cd application/config/
mv database_old.php database_n.php  
mv database.php database_old.php  
mv database_n.php database.php  
echo "> Done Swamping files."   
cd .. 
cd ..
cd ..