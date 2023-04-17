import java.util.ArrayList;
import java.util.Arrays;

public class Calculate {
    static boolean isPrime(int n) {
        if (n <= 1) {
            return false;
        }

        for (int i = 2; i <= n / 2; i++) {
            if (n % i == 0) {
                return false;
            }
        }

        return true;
    }

    public static ArrayList<Integer> calculate(int n) {
        if (n % 2 != 0) {
            return new ArrayList<Integer>();
        }

        if (isPrime(n)) {
            return new ArrayList<Integer>(Arrays.asList(1, n / 2));
        }

        ArrayList<Integer> numbers = new ArrayList<Integer>();

        for (int groupingSize = 1; groupingSize < n / 2 + 1; groupingSize++) {
            if (n % groupingSize == 0 && (n / groupingSize) % 2 == 0) {
                numbers.add(groupingSize);
            }
        }

        return numbers;
    }

    public static void main(String[] args) {
        int count = Integer.parseInt(args[0]);

        for (int i = 2; i <= count; i += 2) {
            System.out.format("%d: %s%n", i, calculate(i).toString());
        }
    }
}
