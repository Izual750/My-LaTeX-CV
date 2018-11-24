#!/bin/sh
cvInputName='cv.tex'
cvInputNameTmp='tmp_cv.tex'
jobOutputName='cv'

echo "Create temporary working file: ${cvInputName}"
cp ${cvInputName} ${cvInputNameTmp}

# Replace sensitive fields
echo "Address:"
read -r address
sed -i "s/ADDRESS/${address}/g" ${cvInputNameTmp}

echo "City:"
read -r city
sed -i "s/CITY/${city}/g" ${cvInputNameTmp}

echo "State:"
read -r state
sed -i "s/STATE/${state}/g" ${cvInputNameTmp}

echo "phoneNumber:"
read -r phoneNumber
sed -i "s/PHONENUMBER/${phoneNumber}/g" ${cvInputNameTmp}

echo "mailAdress:"
read -r mailAdress
sed -i "s/MAILADRESS/${mailAdress}/g" ${cvInputNameTmp}

echo "Generating PDF..."
pdflatex --jobname=${jobOutputName} ${cvInputNameTmp}
xdg-open ${cvOutputName}

echo "Cleaning temporary working file"
rm ${jobOutputName}.pdf

echo "Done !"

exit 0
