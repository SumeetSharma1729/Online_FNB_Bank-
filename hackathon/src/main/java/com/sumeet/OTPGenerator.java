package com.sumeet;
import java.security.SecureRandom;

public class OTPGenerator {

    public static void main(String[] args) {
        System.out.println(generateOTP());
    }

    public static int generateOTP() {
        SecureRandom secureRandom = new SecureRandom();
        return 100000 + secureRandom.nextInt(900000); // This will generate a 6 digit number between 100000 to 999999
    }
}
