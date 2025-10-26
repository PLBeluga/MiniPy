#!/bin/bash
# MiniPy Linux Build Script
# Run this on a Linux system to build the Linux version

set -e  # Exit on any error

echo "🐧 MiniPy Linux Builder"
echo "======================"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Check if Python 3 is available
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python 3 is required but not installed${NC}"
    exit 1
fi

echo -e "${BLUE}📍 Using Python: $(python3 --version)${NC}"

# Install pip if not available
if ! python3 -m pip --version &> /dev/null; then
    echo -e "${YELLOW}📦 Installing pip...${NC}"
    sudo apt-get update
    sudo apt-get install -y python3-pip
fi

# Install required packages
echo -e "${BLUE}📦 Installing required packages...${NC}"

# Try different installation methods for different systems
if python3 -m pip install --user pyinstaller colorama 2>/dev/null; then
    echo -e "${GREEN}✅ Packages installed with pip --user${NC}"
elif python3 -m pip install --break-system-packages pyinstaller colorama 2>/dev/null; then
    echo -e "${GREEN}✅ Packages installed with --break-system-packages${NC}"
elif command -v apt-get >/dev/null 2>&1; then
    echo -e "${YELLOW}📦 Using system package manager...${NC}"
    sudo apt-get update
    sudo apt-get install -y python3-pip python3-venv
    
    # Create virtual environment
    echo -e "${BLUE}🔧 Creating virtual environment...${NC}"
    python3 -m venv minipy-build-env
    source minipy-build-env/bin/activate
    pip install pyinstaller colorama
    echo -e "${GREEN}✅ Virtual environment created and packages installed${NC}"
else
    echo -e "${RED}❌ Could not install required packages${NC}"
    echo "Please install pyinstaller and colorama manually:"
    echo "  sudo apt install python3-pip python3-venv"
    echo "  python3 -m venv venv && source venv/bin/activate"
    echo "  pip install pyinstaller colorama"
    exit 1
fi

# Build the executable
echo -e "${BLUE}🔨 Building MiniPy executable...${NC}"

# Use PyInstaller from virtual environment if it was created
if [ -f "minipy-build-env/bin/activate" ]; then
    source minipy-build-env/bin/activate
    echo -e "${BLUE}Using virtual environment${NC}"
fi

python3 -m PyInstaller --onefile --name=minipy --console \
    --add-data="examples:examples" \
    --hidden-import=colorama \
    minipy_interpreter.py

# Check if build was successful
if [ -f "dist/minipy" ]; then
    chmod +x dist/minipy
    size=$(du -h dist/minipy | cut -f1)
    echo -e "${GREEN}✅ Build successful! Size: $size${NC}"
else
    echo -e "${RED}❌ Build failed - executable not found${NC}"
    exit 1
fi

# Create package directory
echo -e "${BLUE}📦 Creating package...${NC}"
rm -rf minipy-linux
mkdir -p minipy-linux/examples

# Copy files to package
cp dist/minipy minipy-linux/
cp LICENSE minipy-linux/ 2>/dev/null || echo "⚠️  LICENSE not found"
cp README-GITHUB.md minipy-linux/README.md 2>/dev/null || echo "⚠️  README not found"
cp DOCUMENTATION.md minipy-linux/ 2>/dev/null || echo "⚠️  DOCUMENTATION.md not found"
cp QUICK-REFERENCE.md minipy-linux/ 2>/dev/null || echo "⚠️  QUICK-REFERENCE.md not found"
cp TROUBLESHOOTING.md minipy-linux/ 2>/dev/null || echo "⚠️  TROUBLESHOOTING.md not found"

# Copy examples
if [ -d "examples" ]; then
    cp examples/*.minpy minipy-linux/examples/ 2>/dev/null || echo "⚠️  No .minpy examples found"
fi

# Create installer script
cat > minipy-linux/install.sh << 'EOF'
#!/bin/bash
# MiniPy Linux Installer

set -e

echo "🚀 MiniPy Linux Installer v1.0.4"
echo "=================================="

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Determine install location
if [ "$EUID" -eq 0 ]; then
    INSTALL_DIR="/usr/local/bin"
    CONFIG_DIR="/etc/minipy"
    echo -e "${BLUE}Installing system-wide (root access detected)${NC}"
else
    INSTALL_DIR="$HOME/.local/bin"
    CONFIG_DIR="$HOME/.config/minipy"
    echo -e "${BLUE}Installing for current user${NC}"
    mkdir -p "$INSTALL_DIR"
fi

echo "📍 Installation directory: $INSTALL_DIR"

# Create directories
mkdir -p "$CONFIG_DIR/examples"

# Install executable
echo "📦 Installing MiniPy executable..."
if [ -f "./minipy" ]; then
    cp "./minipy" "$INSTALL_DIR/minipy"
    chmod +x "$INSTALL_DIR/minipy"
    echo -e "${GREEN}✅ MiniPy executable installed${NC}"
else
    echo -e "${RED}❌ MiniPy executable not found${NC}"
    exit 1
fi

# Install examples
if [ -d "./examples" ]; then
    cp -r ./examples/* "$CONFIG_DIR/examples/" 2>/dev/null || true
    echo -e "${GREEN}✅ Examples installed${NC}"
fi

# Add to PATH
PATH_UPDATED=false
for config_file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
    if [ -f "$config_file" ] && ! grep -q "$INSTALL_DIR" "$config_file" 2>/dev/null; then
        echo "" >> "$config_file"
        echo "# MiniPy Programming Language" >> "$config_file"
        echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$config_file"
        PATH_UPDATED=true
        echo -e "${GREEN}✅ Added to PATH in $config_file${NC}"
        break
    fi
done

# Test installation
echo "🧪 Testing installation..."
if "$INSTALL_DIR/minipy" --version >/dev/null 2>&1; then
    echo -e "${GREEN}✅ Installation successful!${NC}"
else
    echo -e "${RED}❌ Installation test failed${NC}"
    exit 1
fi

echo ""
echo "🎉 MiniPy v1.0.4 Installed Successfully!"
echo "======================================"
echo ""
echo "📋 Installed:"
echo "   • Executable: $INSTALL_DIR/minipy"
echo "   • Examples: $CONFIG_DIR/examples/"
echo "   • Documentation: Included"
echo ""
echo "✨ New in v1.0.4:"
echo "   • Built-in time module (18+ functions)"
echo "   • Enhanced color system"
echo "   • Interactive examples"
echo ""
echo "🚀 Quick Start:"
echo "   1. Restart terminal or run: source ~/.bashrc"
echo "   2. Test: minipy --version"
echo "   3. Interactive: minipy"
echo "   4. Run example: minipy $CONFIG_DIR/examples/hello_world.minpy"
echo "   5. Try time demo: minipy $CONFIG_DIR/examples/time_example.minpy"
echo ""
echo -e "${GREEN}Happy coding! 🐍✨${NC}"

if [ "$PATH_UPDATED" = true ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Restart your terminal for 'minipy' command to work${NC}"
fi
EOF

chmod +x minipy-linux/install.sh

# Create tarball
echo -e "${BLUE}🗜️  Creating distribution tarball...${NC}"
tar -czf minipy-linux-v1.0.4.tar.gz minipy-linux/
size=$(du -h minipy-linux-v1.0.4.tar.gz | cut -f1)

# Build DEB package if on Debian/Ubuntu
if command -v dpkg-deb >/dev/null 2>&1; then
    echo -e "${BLUE}📦 Building DEB package...${NC}"
    if [ -f "./build_deb.sh" ]; then
        chmod +x ./build_deb.sh
        ./build_deb.sh
        echo -e "${GREEN}✅ DEB package created${NC}"
    else
        echo -e "${YELLOW}⚠️  build_deb.sh not found, skipping DEB build${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  dpkg-deb not found, skipping DEB build${NC}"
fi

echo ""
echo -e "${GREEN}🎉 MiniPy v1.0.4 Linux Build Complete!${NC}"
echo "======================================"
echo "📦 Package: minipy-linux/"
echo "📦 Tarball: minipy-linux-v1.0.4.tar.gz ($size)"
if [ -f "minipy_1.0.4_amd64.deb" ]; then
    deb_size=$(du -h minipy_1.0.4_amd64.deb | cut -f1)
    echo "📦 DEB Package: minipy_1.0.4_amd64.deb ($deb_size)"
fi
echo ""
echo "🚀 Distribution Options:"
echo "1. Generic Linux: Upload tarball to GitHub"
echo "2. Ubuntu/Debian: Upload DEB package to GitHub"
echo "3. Users download appropriate package for their system"
echo ""
echo -e "${BLUE}Test locally:${NC}"
echo "  Generic: cd minipy-linux && ./install.sh"
echo "  DEB: sudo dpkg -i minipy_1.0.4_amd64.deb"

# Cleanup virtual environment if created
if [ -d "minipy-build-env" ]; then
    echo -e "${BLUE}🧹 Cleaning up build environment...${NC}"
    rm -rf minipy-build-env
fi