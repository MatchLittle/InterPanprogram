package com.nan.InterPan.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RestController
@RequestMapping("/test")
public class test {
 
	@RequestMapping(value = "nihao", method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView helloWorld() {
		//查询数据库 用户是否存在的逻辑判断
		
		System.out.println("successful");
		//声明一个视图  用户可以直接返回视图
		ModelAndView mav=new ModelAndView();
		mav.setViewName("success");
        return mav;
   }
	

//    public String getIpAddress(HttpServletRequest request) {  
//        String ip = request.getHeader("x-forwarded-for");  
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//            ip = request.getHeader("Proxy-Client-IP");  
//        }  
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//            ip = request.getHeader("WL-Proxy-Client-IP");  
//        }  
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//            ip = request.getHeader("HTTP_CLIENT_IP");  
//        }  
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
//        }  
//        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
//            ip = request.getRemoteAddr();  
//        }  
//        System.out.println("我是用户的真实ip地址"+ip);
//        return ip;  
//    }  

  
/** 
 * 自定义访问对象工具类 
 *  
 * 获取对象的IP地址等信息 
 * @author X-rapido 
 * 
 */  

    /** 
     * 获取用户真实IP地址，不使用request.getRemoteAddr();的原因是有可能用户使用了代理软件方式避免真实IP地址, 
*  
     * 可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值，究竟哪个才是真正的用户端的真实IP呢？ 
     * 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。 
     *  
     * 如：X-Forwarded-For：192.168.1.110, 192.168.1.120, 192.168.1.130, 
     * 192.168.1.100 
     *  
     * 用户真实IP为： 192.168.1.110 
     *  
     * @param request 
     * @return 
     */  


	
}
