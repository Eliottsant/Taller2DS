import java.io.File;
import java.util.Calendar;
public aspect Logger {

	pointcut success() : call(* com.bank.Bank.create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
}
