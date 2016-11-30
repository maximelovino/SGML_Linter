import java.util.Vector;
import java.io.FileReader;

class Test {
	public static void main(String[] args) {
		try {
			FileReader reader = new FileReader(args[0]);
			SGML myLexer = new SGML(reader);
			parser myParser = new parser(myLexer);
			try {
				myParser.parse();
			}catch (Exception e){
				e.printStackTrace();
				System.out.println("parse error");
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("Invalid file");
		}
	}
}
