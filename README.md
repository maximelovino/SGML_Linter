# SGML Linter JFlex/Cup project

## How it works?
We use JFlex and Cup to detect the conformity of SGML files, as well as extended SGML files.
An example of such file is
```
<A>
	<C>
		<B/>
	</C>
	<D>
	</D>
</A>
```

## How to use it?
To compile and run the program, you can just use the `make` target called `run` with the file that you want to check.
The syntax is
```
make run FILE=<filename>
```
For example, if you want to run the program on a file called `part2.sgml` you type
```
make run FILE=part2.sgml
```
If you don't specify a file and just use `make run`, the program will run on the file `example.sgml`
