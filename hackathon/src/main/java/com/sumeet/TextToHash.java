package com.sumeet;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class TextToHash {
    public static void main(String[] args) {
    }
    public static String hash(String t) { 
        String text = t; 
        String r="";
        try {
            // Create a MessageDigest instance for the SHA-256 algorithm
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");

            // Update the message digest with the input text
            messageDigest.update(text.getBytes());

            // Generate the hash value
            byte[] digest = messageDigest.digest();

            // Convert the byte array to a hexadecimal string
            StringBuilder hexString = new StringBuilder();
            for (byte b : digest) {
                hexString.append(String.format("%02x", b));
            }

            System.out.println("Original Text: " + text);
            System.out.println("SHA-256 Hash: " + hexString.toString());
            r=hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            System.err.println("SHA-256 algorithm not found.");
        }
        return r;
    }
}