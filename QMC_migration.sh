
echo -e "RESTART: mysql_container [reason: won't connect to rest of system before restart <slavko_v>]"
docker restart $(docker ps -aq)
echo 'waiting 30s before doing migration' && sleep 30
echo 'START: PHINX migrations and seeds'
winpty docker exec -it qmc_container bash -c 'ls -ak ;vendor/bin/phinx migrate -e testing ; exit '
winpty docker exec -it icc_container bash -c 'ls -al ;vendor/bin/phinx migrate -e testing ; exit '
winpty docker exec -it qmc_container bash -c 'ls -al ;vendor/bin/phinx migrate -e testing ; exit '
winpty docker exec -it icc_container bash -c 'ls -al ;vendor/bin/phinx migrate -e testing ; exit '
winpty docker exec -it qmc_container bash -c 'ls -ak ;vendor/bin/phinx seed:run -e testing ; exit '
winpty docker exec -it icc_container bash -c 'ls -al ;vendor/bin/phinx seed:run -e testing ; exit '
echo "DONE: PHINX migrations and seeds"
echo ""
#read -p "Press [enter] to FINISH/EXIT the setup"
echo ''