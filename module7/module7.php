<?php

// Welcome message
echo "=== Number Analyzer ===\n";

while (true) {
    echo "\nEnter a list of numbers separated by spaces (or type 'exit' to quit): ";
    $input = trim(fgets(STDIN));

    if (strtolower($input) === 'exit') {
        echo "Exiting program. Goodbye!\n";
        break;
    }

    // Split input and validate numbers
    $numbers = explode(' ', $input);
    $validNumbers = [];

    foreach ($numbers as $num) {
        if (is_numeric($num)) {
            $validNumbers[] = floatval($num);
        } else {
            echo "Invalid input detected. Please enter only numbers separated by spaces.\n";
            continue 2; // Go back to input prompt
        }
    }

    // Perform calculations
    $max = max($validNumbers);
    $min = min($validNumbers);
    $sum = array_sum($validNumbers);
    $avg = $sum / count($validNumbers);

    // Display results
    echo "\n=== Results ===\n";
    echo "Maximum: {$max}\n";
    echo "Minimum: {$min}\n";
    echo "Sum: {$sum}\n";
    echo "Average: " . number_format($avg, 2) . "\n";
}
