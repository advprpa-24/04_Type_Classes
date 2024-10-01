// Typeclass Show
interface Show<A> {
  String show(A a);
}

// Show instance for type Integer
class IntShow implements Show<Integer> {
  static IntShow instance = new IntShow();

  public String show(Integer i) {
    return i.toString();
  }
}

//Show instance for type String
class StringShow implements Show<String> {
  static StringShow instance = new StringShow();

  public String show(String s) {
    return s;
  }
}

public class ShowExample {

  // Show a => a -> String
  static <A> String printNice(/*This corresponds to the class constraint*/ Show<A> instance, A a) {
    return "..:"+ instance.show(a) + ":..";
  }

  public static void main(String[] args) {
    System.out.println(printNice(/*Automatically provided*/ IntShow.instance, 3));
    System.out.println(printNice(/*Automatically provided*/ StringShow.instance, "nice"));
  }
}
