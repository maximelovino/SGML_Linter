all: run

sgml: sgml.flex
	jflex sgml.flex
	javac SGML.java

run: sgml
	java SGML example.sgml
