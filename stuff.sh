source_dir="."
destination_dir="./stuff"

for file in "$source_dir"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        extension="${filename##*.}"
       
        if [ "$extension" == "txt" ]; then
            new_filename="text_file_${filename}"
        elif [ "$extension" == "jpg" ] || [ "$extension" == "jpeg" ]; then
            new_filename="image_${filename}"
        else
            new_filename="${filename}"
        fi

        mkdir -p "$destination_dir/$extension"
        mv "$file" "$destination_dir/$extension/$new_filename"
       
        echo "File $filename moved to $destination_dir/$extension/$new_filename"
    fi
done

