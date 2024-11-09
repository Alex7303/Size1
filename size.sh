#!/bin/bash

get_size() {
    local path="$1"
    local size=$(du -h -s "$path" 2>/dev/null | cut -f1)
    echo $size
}

items=$(ls -A)
size=0

for items in $items; do
## do while    
    size=$(get_size "$items")
##    size=size1+size
##  done  
    echo -e "$size\t\t$items"
    result+=("$size	$items")
done | sort -rh -k1,1


printf "%s\n" "${result[@]}" | sort -rh -k1,1 | column