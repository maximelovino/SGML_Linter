import java.util.Vector;
import java.io.FileReader;

class Test {
	public static void main(String[] args) {
		try {
			FileReader reader = new FileReader(args[0]);
			SGML myLexer = new SGML(reader);
			parser myParser = new parser(myLexer);
			try {
				System.out.println("===========PARSING THE FILE===========");
				myParser.parse();
			}catch (Exception e){
				System.out.println("(Error)");
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Invalid file");
		}
	}
}
