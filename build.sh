#!/bin/sh
cvInputName='cv.tex'
cvInputNameTmp='tmp_cv.tex'
jobOutputName='cv'

echo "Create temporary working file: ${cvInputNameTmp}"
cp ${cvInputName} ${cvInputNameTmp}

# Replace sensitive fields
read -p "Address:" address
address=${address:-${__CV_ADDRESS}}
sed -i "s/ADDRESS/${address}/g" ${cvInputNameTmp}

read -p "City:" city
city=${city:-${__CV_CITY}}
sed -i "s/CITY/${city}/g" ${cvInputNameTmp}

read -p "State:" state
state=${state:-${__CV_STATE}}
sed -i "s/STATE/${state}/g" ${cvInputNameTmp}

read -p "phoneNumber:" phoneNumber
phoneNumber=${phoneNumber:-${__CV_PHONENUMBER}}
sed -i "s/PHONENUMBER/${phoneNumber}/g" ${cvInputNameTmp}

read -p "mails:" mail
mail=${mail:-${__CV_MAILADDRESS}}
sed -i "s/MAIL/${mail}/g" ${cvInputNameTmp}

echo "Generating PDF..."
pdflatex -jobname=${jobOutputName} ${cvInputNameTmp}
xdg-open ${jobOutputName}.pdf

echo "Cleaning temporary working file"
rm ${jobInputNameTmp}

echo "Done !"

exit 0
