#! /bin/zsh
export LC_NUMERIC=C # Forzar locale c (decimal con punto)
# File name and duration vars
echo "Enter the file name"
read file_name
echo "Enter the narration duration in the format H:M:S"
read duration
# Process file
words_count=$(wc -w < $file_name) # Using < to display just the first column
# Process narration time
split_duration=("${(@f)$(tr ':' '\n' <<< "$duration")}") # split lines by ':'
hours="$split_duration[1]"
minutes="$split_duration[2]"
seconds="$split_duration[3]".0
# Calculate WPM
duration_in_minutes=$(printf "%.2f\n" "$(($hours*60+$minutes+$seconds/60))")
wpm=$(($words_count/$duration_in_minutes))
printf "%.2f\n" "$wpm"
