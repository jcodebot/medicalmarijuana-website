## QMC_auto[runner/builder/cleaner]

Rune-and-wait project build for development...similar to plug-and-play idea behind many of todays devices. Since we had troubles rebuilding and successfully running the code required for quickmedcars project this script was created. Idea is of a single run to handle all the things that had to be done manually in the right order...till now. 

# HOW TO RUN DEV:
>
>__1.__ Start the file called __< QMC_autobuilder.sh >__....now just wait for a little while 
>
>__2.__ Start the file called __< QMC_migration.sh >__...press enter once it's done.
>_that's all_

>>DEV NOTE:
>>
>>1. Running it for the first time will take more time...sometimes up to 30....if slower connection or pc with HDD...so... Much shorter when just rebuilding without full prune of docker....not downloading everything and installing composer and stuff._[go make a coffee...something short and refreshing :D]_ 
>>
>>2. Migrations take between 1 and 5min depending on exact system.
>>
___

### Requirements/Prerequisites/Dependencies
Requirements:
>- BASH - git-bash for windows for example...it's .sh file
>- Docker - installed and running
>- Composer
>

### Files and Folders
>
>- File: __QMC_autobuilder.sh__  _>=>_ Handles the process of build...just press enter once asked to start.
>- File: __QMC[stop^clean].sh__  _>=>_  Stops and Removes containers for qmc_project and does "soft" docker system prune __[does NOT use -a]__
>- File: __QMC_migrations.sh__  _>=>_ This file will run your migrations and retry them and do the seeding after.
>- File: __QMC_deep_CLEAN.sh__ _>=>_ __WARNING__: for a real f*ck up situation where it will do __docker system prune -a__ with auto __yes__...and also remove repositories [instacraft and instacraft-med folders]...so you can have a fully clean rebuild of everthing in those 2 repositories.
>- File: __missing_files__  _>=>_  This is where you will put given files....should contain: config.php, database.php, phinx.yml, htaccess and instacraft.sql
>- File: __sh_includes__  _>=>_  Additional Shell scipt files that we might use
>- File: __.gitignore__ _>=>_  No description...really.
>

### What it does
>- Check if files missing from missing_files folder >> if yes >> will exit [ if NO >> will build ]
>- Clone both repositories 'instacraft' and 'instacraft-med'
>- Run composer install inside
>- Copy missing files where needed...and create .env file from dev sample file
>- Run docker-compose
>- Migrate phinx and do seeds
>


## Useful stuff...

folder: scripts&docs

filename: scanner_config.php
description: 
    Install <  composer global require insolita/unused-scanner  >
    Copy that file into root of project that is using composer.
    Setup the file to current project folders and files.
    Run < unused_scanner scanner_config.php > to get what's unused.







## Some additional details and notes.....
>
>- Why does it exist?
>- Cuts down on problems with running the build. 
>- NOTE: In January 2020 we had Slavko and Felipe trying to rebuild the system and falling into problems that Jeff made video in loom about...Which only covers build of instacraft-med[qmc_container] and doesn't fall into any trouble at all while doing so.
>

### Author
>- Name: Slavko V.
>- Email: slavko.vuletic92@gmail.com
>- Date: 2021.01.08|@|21:14
>

### License
Under QuickMedCards.com licence [Not-sure which we have....should know if you should use it!!!]