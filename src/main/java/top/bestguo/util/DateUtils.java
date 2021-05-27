package top.bestguo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 字符串与Date对象的互转工具类
 */
public class DateUtils {

    /**
     * 字符串格式日期转Date
     *
     * @param format 日期格式，比如：yyyy-MM-dd HH:mm:ss
     * @param source 日期字符串，比如：2021-5-25 12:34:56
     * @return 返回格式
     * @throws ParseException 可能导致日期解析异常
     */
    public static Date parseToDate(String format, String source) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.parse(source);
    }

    /**
     * Date转字符串格式日期
     *
     * @param format 日期格式，比如：yyyy-MM-dd HH:mm:ss
     * @param source 日期对象
     * @return 格式化后的日期，比如：2021-5-25 12:34:56
     */
    public static String dateFormat(String format, Date source){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(source);
    }

}
