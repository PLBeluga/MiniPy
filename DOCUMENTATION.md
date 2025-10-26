# MiniPy Programming Language Documentation

*Complete reference guide for MiniPy - A Python-inspired language with beautiful colors*

---

## 📋 Table of Contents

1. [Getting Started](#getting-started)
2. [Basic Syntax](#basic-syntax)
3. [Data Types](#data-types)
4. [Variables](#variables)
5. [Operators](#operators)
6. [Control Flow](#control-flow)
7. [Functions](#functions)
8. [Built-in Functions](#built-in-functions)
9. [Color System](#color-system)
10. [Comments](#comments)
11. [Error Handling](#error-handling)
12. [Best Practices](#best-practices)
13. [Examples](#examples)
14. [Troubleshooting](#troubleshooting)

---

## 🚀 Getting Started

### Installation
Download and run `MiniPy-Installer.exe` - no Python installation required!

### Your First Program
```minipy
# hello.minpy
print("Hello, MiniPy!")
print(green("Welcome to colorful programming!"))
```

### Running Programs
```bash
minipy hello.minpy              # Run program
minipy --highlight hello.minpy  # Run with syntax highlighting
minipy                          # Interactive mode
```

---

## 📝 Basic Syntax

### Code Structure
- **Indentation-based blocks** (like Python)
- **4 spaces** for indentation (recommended)
- **Case-sensitive** identifiers
- **No semicolons** required

```minipy
# This is proper MiniPy structure
if condition:
    print("Indented block")
    if nested_condition:
        print("Nested indented block")
```

### Line Endings
- Statements end at line breaks
- No semicolons needed
- Long lines can be broken with proper indentation

---

## 🔤 Data Types

### Numbers
```minipy
# Integers
age = 25
count = -10
big_number = 1000000

# Floats
height = 5.8
temperature = -2.5
pi = 3.14159
```

### Strings
```minipy
# String literals
name = "Alice"
message = 'Hello World'

# String operations
full_name = "Alice" + " " + "Smith"
repeated = "Hi! " * 3  # "Hi! Hi! Hi! "
```

### Booleans
```minipy
# Boolean values
is_student = True
is_graduated = False

# Boolean operations
result = True and False  # False
result = True or False   # True
result = not True        # False
```

---

## 📦 Variables

### Variable Declaration
```minipy
# Variables are created by assignment
name = "John"
age = 30
height = 6.2
is_tall = True
```

### Variable Naming Rules
- Start with letter or underscore: `name`, `_private`
- Can contain letters, numbers, underscores: `user_name`, `level2`
- Case-sensitive: `Name` ≠ `name`
- Cannot use keywords: `if`, `while`, `def`, etc.

### Dynamic Typing
```minipy
# Variables can change type
value = 42        # Integer
value = "Hello"   # Now string
value = True      # Now boolean
```

---

## ⚡ Operators

### Arithmetic Operators
```minipy
# Basic math
result = 10 + 5   # Addition: 15
result = 10 - 5   # Subtraction: 5
result = 10 * 5   # Multiplication: 50
result = 10 / 5   # Division: 2.0
result = 10 % 3   # Modulo: 1
```

### Comparison Operators
```minipy
# Comparisons return True/False
result = 10 > 5    # Greater than: True
result = 10 < 5    # Less than: False
result = 10 >= 10  # Greater or equal: True
result = 10 <= 5   # Less or equal: False
result = 10 == 10  # Equal: True
result = 10 != 5   # Not equal: True
```

### Logical Operators
```minipy
# Boolean logic
result = True and False  # False
result = True or False   # True
result = not True        # False

# With conditions
if age >= 18 and has_license:
    print("Can drive!")
```

---

## 🔀 Control Flow

### If Statements
```minipy
# Basic if
if age >= 18:
    print("Adult")

# If-else
if score >= 60:
    print("Passed")
else:
    print("Failed")

# If-elif-else
if grade >= 90:
    print("A")
elif grade >= 80:
    print("B")  
elif grade >= 70:
    print("C")
else:
    print("F")
```

### While Loops
```minipy
# Basic while loop
count = 0
while count < 5:
    print("Count:", count)
    count = count + 1

# While with condition
password = ""
while password != "secret":
    password = input("Enter password: ")
    
print("Access granted!")
```

### Loop Control
```minipy
# Break - exit loop early
count = 0
while True:
    if count >= 5:
        break
    print(count)
    count = count + 1

# Continue - skip to next iteration
count = 0
while count < 10:
    count = count + 1
    if count % 2 == 0:
        continue
    print("Odd:", count)
```

---

## 🔧 Functions

### Function Definition
```minipy
# Basic function
def greet():
    print("Hello!")

# Function with parameters
def greet_person(name):
    print("Hello, " + name + "!")

# Function with return value
def add_numbers(a, b):
    result = a + b
    return result
```

### Function Calls
```minipy
# Call functions
greet()                    # Hello!
greet_person("Alice")      # Hello, Alice!
sum = add_numbers(5, 3)    # sum = 8
```

### Multiple Parameters
```minipy
def calculate_area(width, height):
    area = width * height
    return area

def greet_full(first, last, age):
    message = "Hello, " + first + " " + last
    message = message + "! You are " + str(age) + " years old."
    return message

# Usage
area = calculate_area(10, 20)
greeting = greet_full("John", "Doe", 25)
```

### Default Parameters
```minipy
def greet_with_title(name, title="Mr."):
    return title + " " + name

# Usage
print(greet_with_title("Smith"))           # Mr. Smith
print(greet_with_title("Johnson", "Dr."))  # Dr. Johnson
```

---

## 🛠️ Built-in Functions

### Input/Output
```minipy
# Output
print("Hello")              # Print text
print("Value:", 42)         # Print with variable
print("A", "B", "C")        # Print multiple items

# Input
name = input("Enter name: ")        # Get string input
age = int(input("Enter age: "))     # Get integer input
height = float(input("Enter height: "))  # Get float input
```

### Type Conversion
```minipy
# Convert between types
str_num = str(42)        # "42"
int_num = int("42")      # 42
float_num = float("3.14") # 3.14

# Check types
print(type(42))          # int
print(type("hello"))     # str
print(type(3.14))        # float
print(type(True))        # bool
```

### Utility Functions
```minipy
# String length
length = len("Hello")    # 5
length = len("MiniPy")   # 6

# Screen clearing
clear()                  # Clear terminal screen
```

### Time Functions
```minipy
# Current time and date
current_time = time_now()           # Unix timestamp
today = time_date()                 # "2025-10-26"
now = time_clock()                  # "14:30:25"
full_time = time_datetime()         # "2025-10-26 14:30:25"

# Time components
year = time_year()                  # 2025
month = time_month()                # 10
day = time_day()                    # 26
hour = time_hour()                  # 14
minute = time_minute()              # 30
second = time_second()              # 25

# Weekday information
weekday_num = time_weekday()        # 6 (0=Monday, 6=Sunday)
weekday_name = time_weekday_name()  # "Sunday"
month_name = time_month_name()      # "October"

# Custom formatting
formatted = time_format(time_now(), "%B %d, %Y")  # "October 26, 2025"
twelve_hour = time_format(time_now(), "%I:%M %p") # "02:30 PM"

# Timing operations
time_sleep(2)                       # Wait 2 seconds
start = time_measure()              # Start timing
# ... do something ...
elapsed = time_since(start)         # Get elapsed time
```

---

## 🎨 Color System

MiniPy's most exciting feature - built-in colors!

### Text Colors
```minipy
# Basic colors
print(red("Error message"))
print(green("Success message"))
print(blue("Information"))
print(yellow("Warning"))
print(magenta("Special text"))
print(cyan("Highlighted"))
print(white("White text"))
print(black("Black text"))
```

### Bright Colors
```minipy
# Bright variants
print(bright_red("Bright red"))
print(bright_green("Bright green"))
print(bright_blue("Bright blue"))
print(bright_yellow("Bright yellow"))
print(bright_magenta("Bright magenta"))
print(bright_cyan("Bright cyan"))
print(bright_white("Bright white"))
```

### Background Colors
```minipy
# Background colors
print(bg_red("Red background"))
print(bg_green("Green background"))
print(bg_blue("Blue background"))
print(bg_yellow("Yellow background"))
print(bg_magenta("Magenta background"))
print(bg_cyan("Cyan background"))
print(bg_white("White background"))
print(bg_black("Black background"))
```

### Text Styles
```minipy
# Text formatting
print(bold("Bold text"))
print(italic("Italic text"))
print(underline("Underlined text"))
print(strikethrough("Strikethrough text"))
print(dim("Dimmed text"))
```

### Color Combinations
```minipy
# Combine colors and styles
print(bold(red("Bold red text")))
print(bg_blue(white("White on blue")))
print(underline(green("Underlined green")))
print(bg_yellow(bold(black("Bold black on yellow"))))
```

### Advanced Color Usage
```minipy
# Colors in variables
error_style = red
success_style = bold(green)

print(error_style("Something went wrong!"))
print(success_style("Operation completed!"))

# Colors in functions
def format_message(text, is_error):
    if is_error:
        return bg_red(white(bold(" ERROR: " + text + " ")))
    else:
        return bg_green(black(bold(" SUCCESS: " + text + " ")))

print(format_message("File not found", True))
print(format_message("File saved", False))
```

---

## 💬 Comments

### Single-line Comments
```minipy
# This is a comment
print("Hello")  # Comment at end of line

# Comments can explain code
age = 25  # User's age in years
```

### Multi-line Comments
```minipy
# This is a longer comment
# that spans multiple lines
# to explain complex logic

def complex_function():
    # Step 1: Initialize variables
    count = 0
    total = 0
    
    # Step 2: Process data
    # This loop calculates the sum
    while count < 10:
        total = total + count
        count = count + 1
    
    # Step 3: Return result
    return total
```

---

## ⚠️ Error Handling

### Common Errors

#### Syntax Errors
```minipy
# Wrong indentation
if True:
print("This will cause an error")  # Missing indentation

# Missing colon
if True  # Missing :
    print("Error")
```

#### Runtime Errors
```minipy
# Division by zero
result = 10 / 0  # Error: Division by zero

# Type errors
result = "hello" + 5  # Error: Cannot add string and number

# Undefined variables
print(unknown_variable)  # Error: Variable not defined
```

### Error Messages
MiniPy provides helpful error messages:
```
Line 5, Column 12: Division by zero
Line 8: Undefined variable: unknown_variable
Line 3: Expected indentation after ':'
```

---

## ✨ Best Practices

### Code Style
```minipy
# Good variable names
user_name = "Alice"
total_score = 95
is_game_over = False

# Good function names
def calculate_tax(income):
    return income * 0.1

def display_welcome_message():
    print("Welcome to MiniPy!")
```

### Code Organization
```minipy
# Organize code logically

# 1. Constants at top
MAX_ATTEMPTS = 3
DEFAULT_COLOR = blue

# 2. Function definitions
def validate_input(value):
    return len(value) > 0

def display_error(message):
    print(bg_red(white(bold(" ERROR: " + message + " "))))

# 3. Main program logic
def main():
    name = input("Enter your name: ")
    
    if validate_input(name):
        print(green("Hello, " + name + "!"))
    else:
        display_error("Name cannot be empty")

# 4. Run main program
main()
```

### Using Colors Effectively
```minipy
# Create consistent color scheme
ERROR_STYLE = bg_red(white)
SUCCESS_STYLE = bg_green(black)  
WARNING_STYLE = bg_yellow(black)
INFO_STYLE = blue

# Use consistently throughout program
def show_status(message, status_type):
    if status_type == "error":
        print(ERROR_STYLE(" ❌ " + message + " "))
    elif status_type == "success":
        print(SUCCESS_STYLE(" ✅ " + message + " "))
    elif status_type == "warning":
        print(WARNING_STYLE(" ⚠️  " + message + " "))
    else:
        print(INFO_STYLE("ℹ️  " + message))
```

---

## 📚 Examples

### Complete Programs

#### Simple Calculator
```minipy
# calculator.minpy
print(bold(blue("🔢 MiniPy Calculator")))
print("=" * 25)

def get_number(prompt):
    while True:
        try:
            return float(input(prompt))
        except:
            print(red("Please enter a valid number!"))

def calculate(num1, operator, num2):
    if operator == "+":
        return num1 + num2
    elif operator == "-":
        return num1 - num2
    elif operator == "*":
        return num1 * num2
    elif operator == "/":
        if num2 == 0:
            return None  # Division by zero
        return num1 / num2
    else:
        return None  # Invalid operator

# Main program
while True:
    print()
    first_input = input("First number (or 'quit'): ")
    
    if first_input == "quit":
        break
    
    try:
        num1 = float(first_input)
    except:
        print(red("Invalid number!"))
        continue
    
    operator = input("Operator (+, -, *, /): ")
    if operator not in ["+", "-", "*", "/"]:
        print(red("Invalid operator!"))
        continue
    
    num2 = get_number("Second number: ")
    
    result = calculate(num1, operator, num2)
    
    if result is None:
        if operator == "/" and num2 == 0:
            print(red("Error: Division by zero!"))
        else:
            print(red("Error: Invalid operation!"))
    else:
        print(green(str(num1) + " " + operator + " " + str(num2) + " = " + str(result)))

print(cyan("Thanks for using MiniPy Calculator! 👋"))
```

#### Number Guessing Game
```minipy
# guessing_game.minpy
import random

print(bold(magenta("🎯 Number Guessing Game")))
print("=" * 30)
print(blue("I'm thinking of a number between 1 and 100!"))

# Generate random number
secret_number = random.randint(1, 100)
attempts = 0
max_attempts = 7

while attempts < max_attempts:
    attempts = attempts + 1
    remaining = max_attempts - attempts + 1
    
    print(f"\n{yellow('Attempt')} {attempts}/{max_attempts}")
    
    try:
        guess = int(input("Enter your guess: "))
    except:
        print(red("Please enter a valid number!"))
        attempts = attempts - 1  # Don't count invalid input
        continue
    
    if guess == secret_number:
        print(bg_green(black(bold(f" 🎉 CORRECT! You won in {attempts} attempts! 🎉 "))))
        break
    elif guess < secret_number:
        print(yellow(f"Too low! {remaining} attempts remaining."))
    else:
        print(yellow(f"Too high! {remaining} attempts remaining."))
else:
    print(bg_red(white(bold(f" 💀 Game Over! The number was {secret_number} 💀 "))))

print(cyan("\nThanks for playing! 🎮"))
```

#### Interactive Story
```minipy
# story.minpy
print(bold(cyan("📖 MiniPy Interactive Story")))
print("=" * 35)

# Get user input for story
name = input("Enter your name: ")
color = input("Enter your favorite color: ")
animal = input("Enter an animal: ")
place = input("Enter a place: ")

print("\n" + bold("📚 Your Story:"))
print("=" * 20)

# Tell the story with colors
print(f"Once upon a time, there was a brave adventurer named {green(bold(name))}.")
print(f"They had a magical {color} cloak that sparkled in the sunlight.")
print(f"\nOne day, {name} met a talking {yellow(animal)} in the {blue(place)}.")
print(f"The {animal} said:", end=" ")
print(italic(f"'{name}, I need your help to save our {place}!'"))

print(f"\n{name} nodded bravely and said:", end=" ")
print(bold(red("'I will help you, noble " + animal + "!'")))

print(f"\nTogether, they embarked on an amazing adventure...")
print(f"And they all lived {bg_yellow(black(' happily ever after! '))} ✨")

print(f"\n{magenta('The End')} 📖")
print(f"\nThank you for creating this story, {bold(name)}! 🎉")
```

#### Digital Clock
```minipy
# digital_clock.minpy
print(bold(green("🕐 MiniPy Digital Clock")))
print("=" * 30)

# Show current time information
print(blue("Current Date & Time:"))
print("📅 Date:", time_date())
print("🕐 Time:", time_clock())
print("📆 Full:", time_datetime())

print("\n" + yellow("Today is:"))
print("📋 Day:", time_weekday_name())
print("📅 Month:", time_month_name())
print("🗓️  Year:", time_year())

# Simple countdown timer
print("\n" + red("5-Second Countdown:"))
count = 5
while count > 0:
    print(bright_yellow("⏰ " + str(count) + " seconds remaining..."))
    time_sleep(1)
    count = count - 1

print(bright_green("✅ Timer finished at " + time_clock()))

# Measure execution time
print("\n" + cyan("Timing Test:"))
start_time = time_measure()
time_sleep(1)
execution_time = time_since(start_time)
print("⏱️  Execution took " + str(execution_time) + " seconds")

print("\n" + magenta("Clock program completed! ⌚"))
```

---

## 🐛 Troubleshooting

### Common Issues

#### Installation Problems
```
Problem: "minipy command not found"
Solution: Restart your terminal or run: refreshenv
```

#### Syntax Errors
```
Problem: "Expected indentation after ':'"
Solution: Add proper indentation (4 spaces) after if/while/def statements

# Wrong:
if True:
print("Hello")

# Correct:
if True:
    print("Hello")
```

#### Color Issues
```
Problem: Colors not displaying
Solution: Make sure your terminal supports ANSI colors
- Windows: Use PowerShell or Windows Terminal
- Install colorama if needed: pip install colorama
```

#### File Not Found
```
Problem: "File 'program.minpy' not found"
Solution: Check file path and extension
- Use: minipy examples\color_showcase.minpy
- Not: minipy color_showcase (missing .minpy extension)
```

### Getting Help
```bash
minipy --help              # Show help
minipy                     # Interactive mode with help commands
```

In interactive mode:
- Type `help` for assistance
- Type `examples` to list example programs
- Type `syntax` to toggle syntax highlighting
- Type `exit` to quit

---

## 🎯 Advanced Features

### Working with Files
```minipy
# Reading files (if implemented in future versions)
def read_file(filename):
    # This would be a built-in function
    pass

# Writing files (if implemented in future versions)  
def write_file(filename, content):
    # This would be a built-in function
    pass
```

### Future Enhancements
MiniPy is designed to grow! Future versions may include:
- File I/O operations
- List/array data structures
- Dictionary/map support
- More built-in functions
- Module/import system
- Exception handling

---

## 📖 Language Reference Summary

### Keywords
```
if, elif, else, while, def, return, True, False, pass, break, continue, and, or, not
```

### Built-in Functions
```
print(), input(), len(), str(), int(), float(), type(), clear()
time_now(), time_sleep(), time_format(), time_date(), time_clock(), time_datetime()
time_year(), time_month(), time_day(), time_hour(), time_minute(), time_second()
time_weekday(), time_weekday_name(), time_month_name(), time_since(), time_measure()
```

### Color Functions
```
# Text colors
red(), green(), blue(), yellow(), magenta(), cyan(), white(), black()
bright_red(), bright_green(), bright_blue(), bright_yellow(), 
bright_magenta(), bright_cyan(), bright_white()

# Background colors
bg_red(), bg_green(), bg_blue(), bg_yellow(), bg_magenta(), 
bg_cyan(), bg_white(), bg_black()

# Text styles
bold(), italic(), underline(), strikethrough(), dim()
```

### Operators
```
# Arithmetic: +, -, *, /, %
# Comparison: ==, !=, <, >, <=, >=
# Logical: and, or, not
# Assignment: =
```

---

*This documentation covers MiniPy v1.0.4. For the latest updates and examples, visit the MiniPy repository.*

**New in v1.0.4: Built-in time module with 18+ time functions! ⏰**

**Happy coding with MiniPy! 🐍✨🎨**