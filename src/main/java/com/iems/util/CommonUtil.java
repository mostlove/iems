package com.iems.util;

import java.util.UUID;

/**
 * Created by Eric Xie on 2017/1/8.
 */
public class CommonUtil {


    /**
     *  判断 String集合是否为空
     * @param args
     * @return
     */
    public static boolean isEmpty(String... args){
        for (String string : args) {
            if(null == string || string.trim().length() == 0 || "null".equals(string)){
                return true;
            }
        }
        return false;
    }

    public static boolean isEmpty(Integer... args){
        for (Integer arg : args){
            if(null == arg){
                return true;
            }
        }
        return false;
    }

    public static boolean isEmpty(Long... args){
        for (Long arg : args){
            if(null == arg){
                return true;
            }
        }
        return false;
    }

    public static String get32UUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

}
