#!/bin/bash

for i in {1..20}
do
    # Define the input and output filenames
    input_file="lista.txt"
    output_file="input_$i.txt"

    # Generate the list of integers
    seq 1 600000 > $input_file

    # Shuffle the list
    shuf $input_file > $output_file

    # Print the number of integers and the output filename
    echo "Shuffled $((i * 1000)) integers to $output_file"
done
