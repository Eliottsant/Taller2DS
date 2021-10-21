package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;

import org.aspectj.lang.Signature;

public aspect Register {
	    LocalDateTime fecha= LocalDateTime.now();
	    File file = new File("log.txt");
	    pointcut transaccion() : call(* com.bank.Bank.money*(..) );
	    after() :transaccion() {
	    	 Signature sig = thisJoinPoint.getSignature();
	         if(sig.toString().equals("void com.bank.Bank.moneyMakeTransaction()")) {
	    	try{
	    		FileWriter fw = new FileWriter(file, true);
	    		BufferedWriter bw = new BufferedWriter(fw);
	    		bw.write("Transaccion Bancaria"+fecha);
	    		bw.newLine();
	    		bw.close();
	    		} catch (Exception e) {
	    		System.out.println(e.getMessage());
	    			}
	         }else {
	        	 try{
	 	    		FileWriter fw = new FileWriter(file, true);
	 	    		BufferedWriter bw = new BufferedWriter(fw);
	 	    		bw.write("Retiro dinero"+fecha);
	 	    		bw.newLine();
	 	    		bw.close();
	 	    		} catch (Exception e) {
	 	    		System.out.println(e.getMessage());
	 	    			}
	         }
	        		
	    
	   

}
}
