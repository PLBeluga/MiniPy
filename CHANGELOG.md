# MiniPy Changelog

All notable changes to the MiniPy programming language will be documented in this file.

## [1.0.4] - 2025-10-26

### 🎉 Major Features Added
- **Built-in Time Module**: Added comprehensive time functionality with 18+ functions
  - `time_now()` - Get current Unix timestamp
  - `time_sleep(seconds)` - Pause execution
  - `time_date()`, `time_clock()`, `time_datetime()` - Date/time formatting
  - `time_year()`, `time_month()`, `time_day()` - Time components
  - `time_hour()`, `time_minute()`, `time_second()` - Time components
  - `time_weekday()`, `time_weekday_name()`, `time_month_name()` - Calendar info
  - `time_format(timestamp, format)` - Custom time formatting
  - `time_measure()`, `time_since(start)` - Timing operations

### ✨ Enhanced Features
- **Improved Standalone Installer**: Enhanced `MiniPy-Installer.exe` with better command-line support
  - Added `--help`, `--version`, `--uninstall` options
  - Better error handling and user feedback
  - Automatic PATH management
  - Colorama dependency handling

### 🎨 User Interface Improvements
- **Updated Interactive Banner**: Shows v1.0.4 with time module highlight
- **Enhanced Syntax Highlighting**: Added time functions to syntax highlighter
- **Improved Help System**: Updated interactive help with time functions
- **Better Examples List**: Updated examples command with new time-based examples

### 📚 Documentation Updates
- **Comprehensive Time Module Documentation**: Added complete reference for all time functions
- **New Example Programs**: 
  - `time_example.minpy` - Comprehensive time module demonstration
  - `digital_clock.minpy` - Interactive digital clock with countdown
  - `standalone_test.minpy` - Verification script for standalone installation
- **Updated Language Reference**: Added time functions to built-in functions list

### 🔧 Build System Improvements
- **Fixed Build Scripts**: Updated `build_exe.bat` to handle missing files gracefully
- **System Update Script**: Added `update_system.bat` for updating global installations
- **Local Launcher**: Created `minipy.bat` for local development

### 📝 Examples & Demos
- **Time-Based Examples**: Added practical examples showcasing time functions
- **Interactive Clock**: Digital clock with countdown timer functionality
- **Timing Demonstrations**: Examples showing performance measurement

### 🐛 Bug Fixes
- Fixed build script dependency issues with missing documentation files
- Resolved version synchronization between local and system installations
- Improved error handling in standalone installer

### 🚀 Performance & Compatibility
- **Standalone Distribution**: 7.08 MB self-contained executable
- **Zero Dependencies**: Works on any Windows machine without Python
- **Fast Startup**: 1-2 second initialization time
- **Memory Efficient**: ~15-20 MB runtime memory usage

## [1.0.0] - 2025-10-26

### 🎉 Initial Release
- **Core Language Features**:
  - Python-inspired syntax with indentation-based blocks
  - Variables and basic data types (numbers, strings, booleans)
  - Arithmetic and logical operations
  - Control flow (if/else, while loops)
  - Functions with parameters and return values
  - Comments with # syntax

### 🎨 Color System
- **30+ Color Functions**: Complete ANSI color support
  - Text colors: `red()`, `green()`, `blue()`, `yellow()`, `magenta()`, `cyan()`, `white()`, `black()`
  - Bright colors: `bright_red()`, `bright_green()`, `bright_blue()`, etc.
  - Background colors: `bg_red()`, `bg_green()`, `bg_blue()`, etc.
  - Text styles: `bold()`, `italic()`, `underline()`, `strikethrough()`, `dim()`

### 🛠️ Built-in Functions
- **Core Functions**: `print()`, `input()`, `len()`, `str()`, `int()`, `float()`, `type()`, `clear()`
- **Type Conversion**: Automatic and manual type conversion support
- **String Operations**: Length calculation and basic string manipulation

### 🎮 Interactive Features
- **REPL Mode**: Interactive Read-Eval-Print Loop
- **Syntax Highlighting**: Optional colorized code display
- **Error Messages**: Clear, helpful error reporting with line numbers
- **Command System**: Built-in help, examples, and utility commands

### 📚 Documentation & Examples
- **Complete Documentation**: Comprehensive reference guide
- **Example Programs**: 
  - `hello_world.minpy` - Basic introduction
  - `calculator.minpy` - Interactive calculator
  - `color_showcase.minpy` - Color system demonstration
  - Tutorial lessons 1-6 for learning progression

### 🏗️ Build System
- **Cross-Platform**: Support for Windows and Linux builds
- **Standalone Executables**: PyInstaller-based distribution
- **Universal Installer**: One-click installation system
- **VS Code Extension**: Syntax highlighting and file association

### 🎯 Target Audience
- **Educational**: Perfect for teaching programming concepts
- **Beginner-Friendly**: Simple syntax with immediate visual feedback
- **Creative Projects**: Built-in colors make output engaging
- **Rapid Prototyping**: Quick setup and execution

---

## 🔮 Planned Features (Future Versions)

### 1.1.0 (Planned)
- **Data Structures**: Lists/arrays and dictionaries
- **File I/O**: Reading and writing files
- **Import System**: Module support
- **Exception Handling**: try/catch blocks

### 1.2.0 (Planned)
- **Networking**: Basic HTTP requests
- **JSON Support**: Parse and generate JSON
- **Regular Expressions**: Pattern matching
- **Math Module**: Advanced mathematical functions

### 2.0.0 (Planned)
- **Object-Oriented Programming**: Enhanced class system
- **Package Management**: MiniPy package repository
- **Debugging Tools**: Step-through debugger
- **IDE Integration**: Enhanced development tools

---

## 📊 Version History Summary

| Version | Release Date | Major Features | Size (MB) |
|---------|-------------|----------------|-----------|
| 1.0.4   | 2025-10-26  | Time Module, Enhanced Installer | 7.08 |
| 1.0.0   | 2025-10-26  | Initial Release, Color System | ~6.5 |

---

## 🤝 Contributing

We welcome contributions! Please see our contributing guidelines for:
- Bug reports and feature requests
- Code contributions and pull requests
- Documentation improvements
- Example programs and tutorials

## 📄 License

MiniPy is released under the MIT License. See LICENSE file for details.

---


**Happy coding with MiniPy! 🐍✨🎨**
