#!/usr/bin/env python3
"""
MiniPy Linux Build Script
Creates a standalone executable for Linux systems
"""

import subprocess
import sys
import os
import shutil

def install_pyinstaller():
    """Install PyInstaller if not available"""
    try:
        import PyInstaller
        print("✅ PyInstaller already installed")
    except ImportError:
        print("📦 Installing PyInstaller...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pyinstaller"])
        print("✅ PyInstaller installed successfully")

def build_linux_executable():
    """Build Linux executable using PyInstaller"""
    print("🔨 Building MiniPy Linux executable...")
    
    # PyInstaller command for Linux
    cmd = [
        "pyinstaller",
        "--onefile",
        "--name=minipy",
        "--console",
        "--add-data=examples:examples",
        "--hidden-import=colorama",
        "minipy_interpreter.py"
    ]
    
    try:
        subprocess.check_call(cmd)
        print("✅ Linux executable built successfully!")
        
        # Check if executable exists
        exe_path = "dist/minipy"
        if os.path.exists(exe_path):
            size = os.path.getsize(exe_path) / (1024 * 1024)  # MB
            print(f"📦 Executable size: {size:.1f} MB")
            print(f"📍 Location: {os.path.abspath(exe_path)}")
            
            # Make executable
            os.chmod(exe_path, 0o755)
            print("✅ Made executable (+x permission)")
            
            return True
        else:
            print("❌ Executable not found after build")
            return False
            
    except subprocess.CalledProcessError as e:
        print(f"❌ Build failed: {e}")
        return False

def create_installer_script():
    """Create Linux installer script"""
    installer_content = '''#!/bin/bash
# MiniPy Linux Installer
# Auto-installs MiniPy programming language

set -e  # Exit on any error

echo "🚀 MiniPy Linux Installer v1.0.0"
echo "=================================="

# Colors for output
RED='\\033[0;31m'
GREEN='\\033[0;32m'
BLUE='\\033[0;34m'
YELLOW='\\033[1;33m'
NC='\\033[0m' # No Color

# Check if running as root
if [ "$EUID" -eq 0 ]; then
    INSTALL_DIR="/usr/local/bin"
    CONFIG_DIR="/etc/minipy"
    echo "${BLUE}Installing system-wide (requires root)${NC}"
else
    INSTALL_DIR="$HOME/.local/bin"
    CONFIG_DIR="$HOME/.config/minipy"
    echo "${BLUE}Installing for current user${NC}"
    
    # Create .local/bin if it doesn't exist
    mkdir -p "$INSTALL_DIR"
fi

echo "📍 Installation directory: $INSTALL_DIR"

# Create config directory
mkdir -p "$CONFIG_DIR"
mkdir -p "$CONFIG_DIR/examples"

# Copy executable
echo "📦 Installing MiniPy executable..."
if [ -f "./minipy" ]; then
    cp "./minipy" "$INSTALL_DIR/minipy"
    chmod +x "$INSTALL_DIR/minipy"
    echo "${GREEN}✅ MiniPy executable installed${NC}"
else
    echo "${RED}❌ MiniPy executable not found in current directory${NC}"
    exit 1
fi

# Copy examples
echo "📚 Installing examples..."
if [ -d "./examples" ]; then
    cp -r ./examples/* "$CONFIG_DIR/examples/"
    echo "${GREEN}✅ Examples installed${NC}"
else
    echo "${YELLOW}⚠️  No examples directory found${NC}"
fi

# Add to PATH if not already there
PATH_ADDED=false

# Check common shell config files
for config_file in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile"; do
    if [ -f "$config_file" ] && ! grep -q "$INSTALL_DIR" "$config_file"; then
        echo "🔧 Adding to PATH in $config_file..."
        echo "" >> "$config_file"
        echo "# MiniPy Programming Language" >> "$config_file"
        echo "export PATH=\\"\\$PATH:$INSTALL_DIR\\"" >> "$config_file"
        PATH_ADDED=true
        break
    fi
done

# Test installation
echo "🧪 Testing installation..."
if "$INSTALL_DIR/minipy" --version > /dev/null 2>&1; then
    echo "${GREEN}✅ MiniPy installed successfully!${NC}"
else
    echo "${RED}❌ Installation test failed${NC}"
    exit 1
fi

echo ""
echo "🎉 Installation Complete!"
echo "========================="
echo ""
echo "📋 What was installed:"
echo "   • MiniPy executable: $INSTALL_DIR/minipy"
echo "   • Examples: $CONFIG_DIR/examples/"
echo "   • Added to PATH: $([ "$PATH_ADDED" = true ] && echo "Yes" || echo "Manual required")"
echo ""
echo "🚀 Getting Started:"
echo "   1. Restart your terminal or run: source ~/.bashrc"
echo "   2. Test: minipy --version"
echo "   3. Try: minipy $CONFIG_DIR/examples/hello_world.minpy"
echo "   4. Interactive mode: minipy"
echo ""
echo "📚 Documentation:"
echo "   • Language guide: https://github.com/yourusername/minipy"
echo "   • Examples: ls $CONFIG_DIR/examples/"
echo ""
echo "${GREEN}Happy coding with MiniPy! 🐍✨${NC}"

# Final PATH check
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
    echo ""
    echo "${YELLOW}⚠️  Note: You may need to restart your terminal or run:${NC}"
    echo "   source ~/.bashrc"
    echo "${YELLOW}   for the 'minipy' command to work.${NC}"
fi
'''
    
    with open("install_linux.sh", "w") as f:
        f.write(installer_content)
    
    # Make installer executable
    os.chmod("install_linux.sh", 0o755)
    print("✅ Linux installer script created: install_linux.sh")

def create_package_structure():
    """Create complete Linux package structure"""
    print("📦 Creating Linux package structure...")
    
    # Create package directory
    pkg_dir = "minipy-linux"
    if os.path.exists(pkg_dir):
        shutil.rmtree(pkg_dir)
    
    os.makedirs(pkg_dir)
    os.makedirs(f"{pkg_dir}/examples")
    
    # Copy files
    files_to_copy = [
        ("dist/minipy", f"{pkg_dir}/minipy"),
        ("install_linux.sh", f"{pkg_dir}/install.sh"),
        ("LICENSE", f"{pkg_dir}/LICENSE"),
        ("README-GITHUB.md", f"{pkg_dir}/README.md"),
        ("DOCUMENTATION.md", f"{pkg_dir}/DOCUMENTATION.md"),
        ("QUICK-REFERENCE.md", f"{pkg_dir}/QUICK-REFERENCE.md"),
        ("TROUBLESHOOTING.md", f"{pkg_dir}/TROUBLESHOOTING.md"),
    ]
    
    for src, dest in files_to_copy:
        if os.path.exists(src):
            shutil.copy2(src, dest)
            if src.endswith("minipy") or src.endswith(".sh"):
                os.chmod(dest, 0o755)
            print(f"✅ Copied: {src} → {dest}")
        else:
            print(f"⚠️  Missing: {src}")
    
    # Copy examples
    if os.path.exists("examples"):
        for file in os.listdir("examples"):
            if file.endswith(".minpy"):
                shutil.copy2(f"examples/{file}", f"{pkg_dir}/examples/{file}")
        print("✅ Copied examples")
    
    print(f"📦 Linux package created in: {pkg_dir}/")
    return pkg_dir

def create_tarball(pkg_dir):
    """Create compressed tarball for distribution"""
    print("🗜️  Creating distribution tarball...")
    
    tarball_name = "minipy-linux-v1.0.0.tar.gz"
    
    try:
        import tarfile
        with tarfile.open(tarball_name, "w:gz") as tar:
            tar.add(pkg_dir, arcname="minipy-linux")
        
        size = os.path.getsize(tarball_name) / (1024 * 1024)  # MB
        print(f"✅ Tarball created: {tarball_name} ({size:.1f} MB)")
        return tarball_name
        
    except Exception as e:
        print(f"❌ Failed to create tarball: {e}")
        return None

def main():
    """Main build process"""
    print("🐧 MiniPy Linux Build Process")
    print("=============================")
    
    # Step 1: Install PyInstaller
    install_pyinstaller()
    
    # Step 2: Build executable
    if not build_linux_executable():
        print("❌ Build failed, exiting...")
        return False
    
    # Step 3: Create installer script
    create_installer_script()
    
    # Step 4: Create package structure
    pkg_dir = create_package_structure()
    
    # Step 5: Create tarball
    tarball = create_tarball(pkg_dir)
    
    print("\n🎉 Linux Build Complete!")
    print("========================")
    print(f"📦 Package directory: {pkg_dir}/")
    if tarball:
        print(f"📦 Distribution file: {tarball}")
    print("\n🚀 Distribution Instructions:")
    print("1. Upload tarball to GitHub releases")
    print("2. Users download and extract")
    print("3. Users run: ./install.sh")
    print("4. MiniPy is ready to use!")
    
    return True

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)