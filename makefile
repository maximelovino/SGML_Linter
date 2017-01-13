FILE=example.sgml
all: run

Test.class: SGML.java sgml.cup Test.java
	java -jar java-cup-11b.jar sgml.cup
	javac -classpath .:java-cup-11b.jar sym.java
	javac -classpath .:java-cup-11b.jar parser.java
	#SGML is my equivalent of Lexer
	javac -classpath .:java-cup-11b.jar SGML.java
	javac -classpath .:java-cup-11b.jar Test.java

SGML.java: sgml.flex
	jflex sgml.flex

run: Test.class
	java -classpath .:java-cup-11b.jar Test $(FILE)

clean:
	rm *.class sym.java parser.java SGML.java\~ SGML.java
