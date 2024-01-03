package com.sumeet;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class RandomNumberGenerator {
    
    // Set to keep track of the generated numbers
    private static Set<Long> generatedNumbers = new HashSet<>();
    
    public static void main(String[] args) {
//            System.out.println(generateUnique12DigitNumber());
        
    }
    
    public static long generateUnique12DigitNumber() {
        Random rand = new Random();
        long twelveDigitNumber;
        
        do {
            long firstDigit = 1 + rand.nextInt(9);  // Ensure the first digit isn't 0
            long nextElevenDigits = (long)(rand.nextDouble() * 1_000_000_000_000L);
            twelveDigitNumber = firstDigit * 1_000_000_000_000L + nextElevenDigits;
        } while (generatedNumbers.contains(twelveDigitNumber));
        
        generatedNumbers.add(twelveDigitNumber);
        return twelveDigitNumber;
    }
}
