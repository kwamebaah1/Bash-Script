#!/bin/bash

# Function to display the calculator menu
show_menu() {
    echo "***************************"
    echo "  Simple Calculator"
    echo "***************************"
    echo "1. Add"
    echo "2. Subtract"
    echo "3. Multiply"
    echo "4. Divide"
    echo "5. Exit"
    echo "***************************"
    echo -n "Choose an option [1-5]: "
}

# Function to perform addition
add() {
    echo -n "Enter the first number: "
    read num1
    echo -n "Enter the second number: "
    read num2
    result=$(echo "$num1 + $num2" | bc -l)
    echo "Result: $num1 + $num2 = $result"
}
# Function to perform subtraction
subtract() {
    echo -n "Enter the first number: "
    read num1
    echo -n "Enter the second number: "
    read num2
    result=$(echo "$num1 - $num2" | bc -l)
    echo "Result: $num1 - $num2 = $result"
}

# Function to perform multiplication
multiply() {
    echo -n "Enter the first number: "
    read num1
    echo -n "Enter the second number: "
    read num2
    result=$(echo "$num1 * $num2" | bc -l)
    echo "Result: $num1 * $num2 = $result"
}
# Function to perform division
divide() {
    echo -n "Enter the first number: "
    read num1
    echo -n "Enter the second number: "
    read num2
    if [ "$num2" == "0" ]; then
        echo "Error: Division by zero is not allowed!"
    else
        result=$(echo "scale=2; $num1 / $num2" | bc -l)
        echo "Result: $num1 / $num2 = $result"
    fi
}

# Main calculator loop
while true
do
    show_menu
    read choice
    case $choice in
        1) add ;;
        2) subtract ;;
        3) multiply ;;
        4) divide ;;
        5) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid option! Please select between 1 and 5." ;;
    esac
    echo ""
done
