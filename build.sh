echo "Torghost[MAC PORT] installer v3.0"
echo "Installing brew prerequisites "

brew install tor
brew install pyinstaller

echo "Installing dependencies"

sudo pip3 install -r requirements.txt 
pyinstaller --onefile torghost.py --clean
if [ $? -eq 0 ]; then
    echo [SUCCESS] generated torghost binary!
else
    echo [ERROR] Build failed. Unable to create torghost binary using pyinstaller
    exit 1
fi

echo Moving torghost binary to the /usr/bin directory

cd dist 
sudo cp torghost /usr/local/bin
if [ $? -eq 0 ]; then
    echo [SUCCESS] moved torghost binary to the /usr/bin directory
else
    echo [FAILURE] could not move torghost binary to the /usr/bin directory
fi
