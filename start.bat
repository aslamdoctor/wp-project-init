echo off
:start
:: Ask for Project Name
SET /P _project_name= Please enter an input:
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

:: Add Entry to Apache Hosts File

:: Add Entry to System Hosts File

pause