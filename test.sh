clear
read -e -p "Please enter your Tech DNA email:" TDNAID
TDNAID=$(sed 's/[@].*$//' <<< $TDNAID)
echo "***"
echo "*** Setting up: $TDNAID"
echo $TDNAID@tech-dna.net

