echo off
:start

SET currentpath=%~dp0

:: Change the path to the script folder here
E: 
cd %currentpath%

:: Ask for Project Name
SET /P _project_name= Please enter project name:
echo Project Name: %_project_name%


:: Create MySQL Database
call mysql -u root  -e "CREATE DATABASE IF NOT EXISTS %_project_name%";

:: Create Project Directory
mkdir %_project_name%
cd %_project_name%

:: Install Wordpress
call wp core download
call wp config create --dbname="%_project_name%" --dbuser="root"
call wp core install --url=%_project_name%.local --title="My Wordpress Project" --admin_user=admin --admin_password=admin123 --admin_email=aslam.doctor@gmail.com

:: Install Plugins
call wp plugin install all-in-one-wp-migration --activate

:: delete wp-content folder from root


:: copy the boilerplate version of wp-content folder


:: restore db from boilerplate version


:: search replace db data



:: Add Entry to Apache Hosts File & System Hosts File
call node %currentpath%/genhost/genhost.js %_project_name%

:: Move Project to Root folder
cd ..
move %_project_name% ../
echo Moved Project folder to Root folder


pause