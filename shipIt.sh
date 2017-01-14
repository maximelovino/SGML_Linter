#!/bin/sh

#This is used to generate the folder and zip structure required for handing out the project to the teacher
ACCOUNT=lovinom

if [[ -f $ACCOUNT-labo2.tar.gz ]]; then
	rm $ACCOUNT-labo2.tar.gz
fi

mkdir -p $ACCOUNT/labo2

cp README.md $ACCOUNT/labo2/
cp makefile $ACCOUNT/labo2/
cp sgml.cup $ACCOUNT/labo2/
cp sgml.flex $ACCOUNT/labo2/
cp Test.java $ACCOUNT/labo2/
cp java-cup-11b.jar $ACCOUNT/labo2/
cp example.sgml $ACCOUNT/labo2/
cp report/report.pdf $ACCOUNT/labo2/

tar -cvzf $ACCOUNT-labo2.tar.gz $ACCOUNT

rm -r $ACCOUNT
