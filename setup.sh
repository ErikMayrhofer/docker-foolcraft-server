#!/bin/bash



download_url=$1
download_temp_name=serverfiles.zip

init() {
    echo "==DETECTED FIRST START=="
    echo "Running setup code."
    echo "Downloading Serverfiles from ${download_url}"
    test -f ${download_temp_name} || wget ${download_url} -O ${download_temp_name}

    echo "Unzipping Serverfiles."
    unzip serverfiles.zip

    echo "Done."

    echo "Overwriting eula."
    echo "eula=true" > eula.txt

    touch init
}

if [ ! -f init ]; then
    init
fi

java -jar forge-1.12.2-14.23.5.2768-universal.jar nogui