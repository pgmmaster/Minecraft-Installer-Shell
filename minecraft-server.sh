#!/bin/sh

# Start of the script
clear

# Intro to the shell script
echo "Welcome to Minecraft Server Maker By PGMMaster"
echo ""
echo "This script is new meaning there will be bugs!"
echo ""
echo "Github: https://github.com/pgmmaster/Minecraft-Installer-Shell"
echo "Youtube: https://youtube.com/PGMMaster"
echo ""
echo ""
# Set vars
NOT_JAVA="0"
SERVER_PATH=""
STEP_CHOOSE_TYPE="0"
STEP_CHOOSE_VERSION="0"
STEP_CHOOSE_MCVER="0.0.0"

# Loop and the heart of the script
n=1

# continue until $n equals 5
echo "Enter Version For Minecraft Server: "
echo "1) Minecraft Java Edition"
echo "2) Minecraft Bedrock Edition"

read -p "Enter An Value: " READ_CHOOSE_TYPE
if [ $READ_CHOOSE_TYPE -gt 0 ]
then
  if [ $READ_CHOOSE_TYPE -lt 3 ]
  then
    echo ""
    if [ $READ_CHOOSE_TYPE -et 1 ]
    then
      clear
      echo "You have chosen: Minecraft Java Edition"
      echo ""
      STEP_CHOOSE_TYPE="1"
    else
      clear
      echo "You have chosen: Minecraft Bedrock Edition"
      echo ""
      STEP_CHOOSE_TYPE="2"
    fi
  else
    echo ""
    echo "Please enter a correct number!" && exit 0
  fi
else
  echo ""
  echo "Please enter a correct number!" && exit 0
fi


if [ $READ_CHOOSE_TYPE -lt 2 ]
then
  echo "1) Vanilla"
  echo "2) Spigot"
  echo "3) Paperspigot"
  echo "4) Craftbukkit"
  echo "5) Forge (Coming Soon!)"
  echo ""
  read -p "Enter A Version: " READ_CHOOSE_VERSION
else
  NOT_JAVA="1"
  echo "1) Nukkit (Expermental)"
  echo "2) Pocketmine (Coming Soon!)"
  echo ""

  read -p "Enter A Version: " READ_CHOOSE_VERSION
fi

if [ $NOT_JAVA -eq 1 ]
then
  if [ $READ_CHOOSE_VERSION -lt 3 ]
  then
    if [ $READ_CHOOSE_VERSION -gt 0 ]
    then
      if [ $READ_CHOOSE_VERSION -eq 1 ]
      then
        echo "Grabbing the latest version of nukkit..."
        mkdir Nukkit\ Server
        cd Nukkit\ Server
        wget https://repo.opencollab.dev/artifactory/cn/nukkit/nukkit/1.0-SNAPSHOT/nukkit-1.0-SNAPSHOT.jar
        touch start.sh
        touch eula.txt
        sleep 1
        echo "eula=true" >> eula.txt
        read -p "Desiered Ram: " RAM
        echo "java -jar server-$STEP_CHOOSE_MCVER.jar -Xmx$RAM -Xms$RAM" >> start.sh
        echo "Done :), use >sh start.sh< to start your server!"

      elif [ $READ_CHOOSE_VERSION -eq 2 ]
      then
        echo "This Version Has Not Released Yet, Please Wait for the developer to implement it!" && exit 0
      fi
    else
      echo ""
      echo "Please enter a correct number!" && exit 0
    fi
  else
    echo ""
    echo "Please enter a correct number!" && exit 0
  fi
else
  if [ $READ_CHOOSE_VERSION -lt 6 ]
  then
    if [ $READ_CHOOSE_VERSION -gt 0 ]
    then
      if [ $READ_CHOOSE_VERSION -eq 1 ]
      then
        echo "Making A Directory For The Server, Next we will specify the version!"
        sleep 3
        clear
        echo "Waiting."
        sleep 1
        clear
        echo "Waiting.."
        sleep 1
        clear
        echo "Waiting..."
        sleep 1
        clear
        mkdir Vanilla\ Server
        cd Vanilla\ Server
        echo "Created Directory..."
        sleep 2
        read -p "Enter Minecraft Server Version (EXAMPLE 1.8.9)" READ_CHOOSE_MCVER
        wget https://s3.amazonaws.com/Minecraft.Download/versions/$READ_CHOOSE_MCVER/minecraft_server.$READ_CHOOSE_MCVER.jar
        STEP_CHOOSE_MCVER=$READ_CHOOSE_MCVER
        mv ./minecraft_server.*.jar ./server-$STEP_CHOOSE_MCVER.jar
        touch start.sh
        touch eula.txt
        sleep 1
        echo "eula=true" >> eula.txt
        read -p "Desiered Ram: " RAM
        echo "java -jar server-$STEP_CHOOSE_MCVER.jar -Xmx$RAM -Xms$RAM -nogui" >> start.sh
        echo "Done :), use >sh start.sh< to start your server!"
      elif [ $READ_CHOOSE_VERSION -eq 2 ]
      then
        echo "This Version Has Not Released Yet, Please Wait for the developer to implement it!" && exit 0
      elif [ $READ_CHOOSE_VERSION -eq 3 ]
      then
        echo "This Version Has Not Released Yet, Please Wait for the developer to implement it!" && exit 0
      elif [ $READ_CHOOSE_VERSION -eq 4 ]
      then
        echo "This Version Has Not Released Yet, Please Wait for the developer to implement it!" && exit 0
      elif [ $READ_CHOOSE_VERSION -eq 5 ]
      then
        echo "This Version Has Not Released Yet, Please Wait for the developer to implement it!" && exit 0
      fi
    fi
  fi
fi
