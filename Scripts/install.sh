#!/bin/bash

COMPRESSED_FILE="${1:-../ConsoleMode.tar.gz}"
TARGET_DIR="/media/fat"

echo "Pakage: $COMPRESSED_FILE"
echo "Target dir: $TARGET_DIR"
echo ""
echo "--------------------------------------------"
echo "=== Install ConsoleMode ==="
echo "--------------------------------------------"
echo ""

if [[ ! -f "$COMPRESSED_FILE" ]]; then
    echo "file not exist： '$COMPRESSED_FILE'"    
    exit 1
fi

# back
SRC_DIR="/media/fat"
DEST_DIR="/media/fat/back"

FILES="MiSTer menu.rbf MiSTer.ini"

if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
fi

for f in $FILES; do
    if [ -f "$SRC_DIR/$f" ]; then
        cp "$SRC_DIR/$f" "$DEST_DIR/"
        echo "copy: $f"
    else
        echo "find not $SRC_DIR/$f"
    fi
done

sudo tar -xzvf "$COMPRESSED_FILE" -C /


if [ -f "/media/fat/ConsoleMode/lib/libSDL-1.2.so" ]; then    
    rm /media/fat/ConsoleMode/lib/libSDL-1.2.so
fi	
ln -s /media/fat/ConsoleMode/lib/libSDL-1.2.so.0.11.4 /media/fat/ConsoleMode/lib/libSDL-1.2.so

if [ -f "/media/fat/ConsoleMode/lib/libSDL-1.2.so.0" ]; then    
    rm /media/fat/ConsoleMode/lib/libSDL-1.2.so.0
fi	
ln -s /media/fat/ConsoleMode/lib/libSDL-1.2.so.0.11.4 /media/fat/ConsoleMode/lib/libSDL-1.2.so.0

if [ -f "/media/fat/ConsoleMode/lib/libfuse3.so.3" ]; then    
    rm /media/fat/ConsoleMode/lib/libfuse3.so.3
fi	
ln -s /media/fat/ConsoleMode/lib/libfuse3.so.3.14.0 /media/fat/ConsoleMode/lib/libfuse3.so.3


STARTUP_FILE="/media/fat/linux/user-startup.sh"
ZAPAROO_SCRIPT="/media/fat/Scripts/zaparoo.sh"
LINE='[[ -e /media/fat/Scripts/zaparoo.sh ]] && /media/fat/Scripts/zaparoo.sh -service $1'

# 1. 检查 zaparoo.sh 是否存在
if [[ ! -f "$ZAPAROO_SCRIPT" ]]; then
    echo "Error：find not $ZAPAROO_SCRIPT"
    echo "Please put zaparoo.sh into /media/fat/Scripts/"
    exit 1
fi

# 2. 创建 user-startup.sh（如果不存在）
if [[ ! -f "$STARTUP_FILE" ]]; then
    echo "Create $STARTUP_FILE ..."
    echo "#!/bin/bash" > "$STARTUP_FILE"
    chmod +x "$STARTUP_FILE"
fi

# 3. 检查是否已存在该行，避免重复添加
if grep -Fxq "$LINE" "$STARTUP_FILE"; then
    echo "The zaparoo startup item already exists."
else
    echo "Add zaparoo startup item user-startup.sh ..."
    echo "$LINE" >> "$STARTUP_FILE"
fi

# 4. 设置 zaparoo.sh 可执行权限
chmod +x "$ZAPAROO_SCRIPT"

cp /media/fat/ConsoleMode/evtest  /bin
echo "cp evtest ok."

echo "--------------------------------------------"
echo "Installation successful!"
echo "--------------------------------------------"
echo "The system is about to reboot..." 
sleep 1 
sudo reboot


