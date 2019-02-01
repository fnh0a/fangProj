package com.hou.erp.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hou.erp.pojo.Page;
import com.hou.erp.pojo.WorkInfo;
import com.hou.erp.service.IUserService;
  
@Controller  
@RequestMapping("/user")  
public class UserController {  
	private static Logger logger = Logger.getLogger(UserController.class);  
    @Resource  
    private IUserService userService;  
      
    @RequestMapping("/showUser")  
    public String toIndex(HttpServletRequest request,Model model,Page page){  
       // int userId = Integer.parseInt(request.getParameter("id"));  
       // User user = this.userService.getUserById(userId);  
       // List<WorkInfo> wlist = this.userService.getInfoList();
    	SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM");
    	Date date=new Date();
    	//String montString=sdFormat.format(date);
    	String year=request.getParameter("year");
    	String month=request.getParameter("month");
    	String clearStatus=request.getParameter("clearStatus");
    	String month1=month;
    	if(month!=null&&month.length()==1&&Integer.parseInt(month)<10){
    		month1="0"+month;
    	}
    		
    	String workername=request.getParameter("workername");
    	String tableNo=request.getParameter("tableNo");
    	String isclear=request.getParameter("isclear");
    	
    	String montString=null;
    	if (year!=null&&month!=null) {
    		montString=year+"-"+month1+"%";
		}
    	if (year==null&&month!=null) 
		{

    		clearStatus= "year";
    		 //model.addAttribute("clearStatus", ""); 
			montString="%-"+month1+"%";
		}
    	if (year!=null&&month==null) 
		{
    		clearStatus= "month";
    		// model.addAttribute("clearStatus", "month"); 
    		montString="%"+year+"-%";
		}
    	if (year==null&&month==null) 
		{
    		if (isclear!=null&&isclear.equals("clear")) {
    			logger.info("clear");
    			clearStatus= "yearmonth";
    			// model.addAttribute("clearStatus", "yearmonth"); 
    			montString=null;
    		}else {
    			
    			logger.info("morennnn");
    			montString=sdFormat.format(date);
    			year=montString.split("-")[0];
    			month=montString.split("-")[1];
    			montString=montString+"%";
			}
		}
    	logger.info("tableNo"+tableNo);
    	logger.info("montString"+montString);
    	WorkInfo workInfo=new WorkInfo();
    	workInfo.setTime(montString);
    	workInfo.setWorkername(workername);
    	workInfo.setTableNo(tableNo);
    	 List<WorkInfo> wlist = this.userService.getInfoListByMonth(workInfo,page);
    	 logger.info("wlist"+wlist.size());
        //user.setUserName("fangni");
        
     /*try {
		//	String des = new String(user.getUserName().getBytes("ISO-8859-1"),"GBK");
	        //user.setUserName(des);
        } catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
       // model.addAttribute("user", user);   
        model.addAttribute("mcList", wlist); 
        model.addAttribute("year", year); 
        model.addAttribute("month", month); 
        model.addAttribute("workername", workername); 
        model.addAttribute("tableNo", tableNo); 
       
        model.addAttribute("clearStatus", clearStatus); 
        int total = this.userService.totalselect(workInfo);
        page.caculateLast(total);
        page.setTotal(total);
        return "showUser";  
    }  
    
    
    @RequestMapping("/showAll")  
    public String showAll(HttpServletRequest request,Model model,Page page){
    	List<WorkInfo> wlist = this.userService.getInfoList(page);
    	 model.addAttribute("mcList", wlist); 
    	 String year=request.getParameter("year");
     	String month=request.getParameter("month");
     	 model.addAttribute("year", year); 
         model.addAttribute("month", month); 
         int total = this.userService.total();
         page.caculateLast(total);
         page.setTotal(total);
         //model.addAttribute("page", page); 
    	return "showAll";
    }
    @RequestMapping("/toAddData")  
    public String toAddDataPage(HttpServletRequest request,Model model){
    	return "addData";
    }
    
    @RequestMapping("/addData")  
    public String addData(HttpServletRequest request,Model model){
    	WorkInfo workInfo = setWorkInfo(request);
        this.userService.insertWorker(workInfo);
        String year=request.getParameter("year");
    	String month=request.getParameter("month");
    	return "redirect:showUser?year="+year+"&month="+month;
    }
	private WorkInfo setWorkInfo(HttpServletRequest request) {
		WorkInfo workInfo = new WorkInfo();
        workInfo.setWorkername(request.getParameter("workername"));
        workInfo.setTableNo(request.getParameter("tableNo"));
        workInfo.setTime(request.getParameter("time"));
        workInfo.setStartCode(request.getParameter("startCode"));
        workInfo.setEndCode(request.getParameter("endCode"));
        workInfo.setWeight(request.getParameter("weight"));
        workInfo.setPrice(request.getParameter("price"));
        workInfo.setTotal(request.getParameter("total"));
        workInfo.setRemark(request.getParameter("remark"));
        workInfo.setCreateTime(new Date().getTime()+"");
		return workInfo;
	}
    
    @RequestMapping("/delete")  
    public String deleteData(HttpServletRequest request,Model model){
    	int id = Integer.parseInt(request.getParameter("id"));
    	 this.userService.deleteData(id);
    	 String year=request.getParameter("year");
     	String month=request.getParameter("month");
     	String clearStatus=request.getParameter("clearStatus");
     	String all=request.getParameter("all");
     	
     	if(all!=null){
     		return "redirect:showAll?year="+year+"&month="+month+"&clearStatus="+clearStatus;
     	}else {
     		return "redirect:showUser?year="+year+"&month="+month+"&clearStatus="+clearStatus;
		}
     	
    	
    }
    
    @RequestMapping("/viewData")  
    public String viewData(HttpServletRequest request,Model model){
    	int id = Integer.parseInt(request.getParameter("id"));
    	
    	WorkInfo workInfo = this.userService.getDataById(id);
    	model.addAttribute("workInfo", workInfo); 
		return "viewData";
    	
    }
    @RequestMapping("/toUpdateData")  
    public String toUpdateData(HttpServletRequest request,Model model){
    	int id = Integer.parseInt(request.getParameter("id"));
    	WorkInfo workInfo = this.userService.getDataById(id);
    	model.addAttribute("workInfo", workInfo); 
    	 String all=request.getParameter("all");
     	 model.addAttribute("all", all); 
		return "updateData";
    }
    
    @RequestMapping("/updateData")  
    public String updateData(HttpServletRequest request,Model model){
    	WorkInfo workInfo = setWorkInfo(request);
    	workInfo.setId(Integer.parseInt(request.getParameter("id").trim()));
    	logger.info(workInfo);
    	this.userService.updateWorker(workInfo);
    	String year=request.getParameter("year");
    	String month=request.getParameter("month");
    	String all=request.getParameter("all");
    	String clearStatus=request.getParameter("clearStatus");
     	if(all!=null&&all.equals("1")){
     		return "redirect:showAll?year="+year+"&month="+month+"&clearStatus="+clearStatus;
     	}else {
     		return "redirect:showUser?year="+year+"&month="+month+"&clearStatus="+clearStatus;
		}
    }
    @RequestMapping("/toCreateInvoice")  
    public String toCreateInvoice(HttpServletRequest request,Model model){
    	int id = Integer.parseInt(request.getParameter("id"));
    	WorkInfo workInfo = this.userService.getDataById(id);
    	model.addAttribute("workInfo", workInfo); 
		return "createInvoice";
    }
    @RequestMapping("/login")  
    public String login(HttpServletRequest request,Model model){
    	//int id = Integer.parseInt(request.getParameter("id"));
    	//WorkInfo workInfo = this.userService.getDataById(id);
    	//model.addAttribute("workInfo", workInfo); 
		return "login";
    }
    
}  
