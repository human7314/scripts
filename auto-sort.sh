#!/bin/bash

while true; do
    # 1. Define source (Your main Downloads folder)
    SOURCE_DIR="$HOME/Downloads"
    
    # 2. Define sub-folders (Inside Downloads)
    DOCS_DIR="$SOURCE_DIR/Documents"
    MOVIES_DIR="$SOURCE_DIR/Movies"
    IMGS_DIR="$SOURCE_DIR/Images"
    ARCHIVE_DIR="$SOURCE_DIR/Compressed"
    MUSIC_DIR="$SOURCE_DIR/Music"
    PROGRAMS_DIR="$SOURCE_DIR/Programs"
    
    # 3. Create directories if missing
    mkdir -p "$DOCS_DIR" "$MOVIES_DIR" "$IMGS_DIR" "$ARCHIVE_DIR" "$MUSIC_DIR" "$PROGRAMS_DIR"
    
    # 4. Enable case-insensitive matching (e.g., .jpg matches .JPG)
    shopt -s nocasematch
    
    # 5. Navigate to Downloads
    cd "$SOURCE_DIR" || exit
    
    # 6. Start the loop
    for file in *; do
        # Check if it is a file (ignore folders like 'Documents', 'Movies', etc.)
        if [ -f "$file" ]; then
    
            # ============================================================
            # 🛑 SAFETY GUARD: IGNORE ACTIVE DOWNLOADS
            # ============================================================
            # Thorium/Chrome use .crdownload
            # Firefox uses .part
            # General temp files use .tmp
            if [[ "$file" == *.crdownload ]] || [[ "$file" == *.part ]] || [[ "$file" == *.tmp ]]; then
                # Optional: Print a message saying we are leaving it alone
                # echo ">> ACTIVE DOWNLOAD DETECTED: Leaving '$file' alone."
                continue
            fi
            # ============================================================
    
            # Get file extension
            extension="${file##*.}"
    
            case "$extension" in
                # Documents
                pdf|doc|docx|xls|xlsx|ppt|pptx|txt|md|csv|epub)
                    mv -n "$file" "$DOCS_DIR/"
                    ;;
                # Movies
                mp4|mkv|mov|avi|flv|webm|m4v)
                    mv -n "$file" "$MOVIES_DIR/"
                    ;;
                # Images
                jpg|jpeg|png|gif|webp|svg|bmp|tiff|heic)
                    mv -n "$file" "$IMGS_DIR/"
                    ;;
                # Archives
                zip|rar|7z|tar|gz|bz2|xz|iso)
                    mv -n "$file" "$ARCHIVE_DIR/"
                    ;;
                # Music
                mp3|wav|flac|aac|ogg|m4a|wma)
                    mv -n "$file" "$MUSIC_DIR/"
                    ;;
                # Programs/Executables
                exe|msi|deb|rpm|appimage|dmg|sh)
                    mv -n "$file" "$PROGRAMS_DIR/"
                    ;;
            esac
        fi
    done
    
    # Disable case-insensitive matching
    shopt -u nocasematch
    sleep 2
done
