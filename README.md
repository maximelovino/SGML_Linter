# SGML Linter JFlex/Cup project

## How it works?
We use JFlex and Cup to detect the conformity of SGML files, as well as extended SGML files.
An example of SGML file is
```
<A>
	<C>
		<B/>
	</C>
	<D>
	</D>
</A>
```
An example of an extended SGML file is
```
<#set id="12"/>
<C>
	<#if id=="13">
		<Q>
			tata
		</Q>
	<#if/>
	<#if id=="12">
		<D t="1,32">
		titi
		</D>
	<#if/>
</C>
```
## How to use it?
To compile and run the program, you can just use the `make` target called `run` with the file that you want to check. Note that `jflex` must be installed on your machine and be in your `PATH`.
The syntax is
```
make run FILE=<filename>
```
For example, if you want to run the program on a file called `part2.sgml` you type
```
make run FILE=part2.sgml
```
If you don't specify a file and just use `make run`, the program will run on the file `example.sgml`
