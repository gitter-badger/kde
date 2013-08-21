<?php
require_once('class.GitHubHook.php');

// Initiate the GitHub Deployment Hook
$hook = new GitHubHook;

// Enable the debug log, kindly make `log/hook.log` writable
$hook->enableDebug();

// Adding `stage` branch to deploy for `staging` to path `/var/www/testhook/stage`
$hook->addBranch('master', 'master', '/opt/KDE-Taiwan/kde/');

// Adding `prod` branch to deploy for `production` to path `/var/www/testhook/prod` limiting to only `user@gmail.com`
//$hook->addBranch('prod', 'production', '/opt/KDE-Taiwan/kde/prod', array('franklin@goodhorse.idv.tw'));

// Deploy the commits
$hook->deploy();
