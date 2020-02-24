alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

templates=( bathasu corsham-science microgenetics pharmaxo )
resolutions=( 1024x768 1280x720 1280x800 1280x960 1280x1024 1366x768 1440x900 1600x900 1680x1050 1920x1080 1920x1200 2560x1440 3440x1440 3840x1600 3840x2160 5120x1440 5120x2160 5120x2880 6016x3384 7680x4320 )

rm -r output
mkdir -p output

rm -r logs
mkdir -p logs

for template in "${templates[@]}"
do
    for resolution in "${resolutions[@]}"
    do
        chrome --headless --disable-gpu --crash-dumps-dir=logs --screenshot=output/$template-$resolution.png --window-size=${resolution/x/,} --default-background-color=0 $template.html
    done
done

rm -r logs