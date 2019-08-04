package com.nan.InterPan.control;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class logtest {
	
	public static Log log = LogFactory.getLog(logtest.class);

	public static void main(String[] args) {
		 String test="This Log Test!";
         log.info("this is normal info:"+test);
         log.error("this is error info:"+test);
         log.debug("this is debug info:"+test);

	}

}
