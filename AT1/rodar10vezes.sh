#!/bin/bash

for i in {1..20}; do
    mv input_${i}.txt input.txt
    start=$(date +%s.%N)

    # run the Go program
    ./a.out

    end=$(date +%s.%N)
    runtime=$(echo "$end - $start" | bc)
    mv input.txt input_${i}.txt
    mv output.txt output_${i}.txt
    echo "Execution time for input${i}.txt: $runtime seconds." >> tempo.txt
done
