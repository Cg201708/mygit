package com.lfbdc.bank.util;

import java.util.UUID;

public class CreateUtil {
	
	//将1-9999转换成0001-9999的字符串
	public String CreateBean(String str){
		
		for(int i =1;i<10000;i++){
			str = String.format("%04d", i);
		}
		
		return str;
	}
	
	//随机生成固定id
	public static String getUUID(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString(); 
        String uuidStr=str.replace("-", "");
        return uuidStr;
      }
}