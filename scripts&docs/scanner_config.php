<?php                      
$projectPath = __DIR__ ;
//Declare directories which contains php code
$scanDirectories = [
   $projectPath . '/api_v2/',
   $projectPath . '/application/',
   $projectPath . '/assets/',
   $projectPath . '/db/',
   $projectPath . '/favicons/',
   $projectPath . '/js/',
   $projectPath . '/nbproject/',
   $projectPath . '/public/',
   $projectPath . '/system/'
];
//Optionally declare standalone files
$scanFiles = [
     $projectPath . '/cron.php',
     $projectPath . '/index.php'
];
return [
'composerJsonPath' => $projectPath . '/composer.json',
'vendorPath' => $projectPath . '/vendor/',
'scanDirectories' => $scanDirectories,
'scanFiles'=>$scanFiles
];