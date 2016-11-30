all: run

cup: sgml.flex sgml.cup Test.java
	java -jar java-cup-11b.jar sgml.cup
	javac -classpath .:java-cup-11b.jar sym.java
	javac -classpath .:java-cup-11b.jar parser.java
	#SGML is my equivalent of Lexer
	javac -classpath .:java-cup-11b.jar SGML.java
	javac -classpath .:java-cup-11b.jar Test.java

sgml: sgml.flex
	jflex sgml.flex

run: sgml cup
	java -classpath .:java-cup-11b.jar Test example.sgml

clean:
	rm *.class sym.java parser.java SGML.java\~ SGML.java
