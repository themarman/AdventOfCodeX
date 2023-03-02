import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws FileNotFoundException {
        // Read the input file
        File inputFile = new File("input.txt");
        Scanner scanner = new Scanner(inputFile);
        String instructions = scanner.nextLine();
        scanner.close();
        
        // Follow the instructions and determine the final floor
        int floor = 0;
        for (int i = 0; i < instructions.length(); i++) {
            if (instructions.charAt(i) == '(') {
                floor++;
            } else if (instructions.charAt(i) == ')') {
                floor--;
            }
        }
        
        // Print the final floor where Santa ended up
        System.out.println("Santa ended up on floor " + floor);
    }
}
