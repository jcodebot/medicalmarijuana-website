cd instacraft-med
while true; do
    echo "Instacraft branch: "  
    echo "   -> $(git branch --show-current)"
    echo " "
    read -p "Confirm Push[y/n]: " yn
    case $yn in
        [Yy]* ) echo "Pushing to $(git branch --show-current)"; git push origin $( git branch --show-current ); break;;
        [Nn]* ) exit;;
        * ) echo "[ Input Empty >> exiting ] Please answer yes or no."; exit;
    esac
done
cd ..