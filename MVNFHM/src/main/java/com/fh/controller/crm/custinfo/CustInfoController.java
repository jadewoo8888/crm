package com.fh.controller.crm.custinfo;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.crm.custinfo.CustInfoManager;

/** 
 * 说明：客户基本信息
 * 创建人：FH Q313596790
 * 创建时间：2017-06-03
 */
@Controller
@RequestMapping(value="/custinfo")
public class CustInfoController extends BaseController {
	
	String menuUrl = "custinfo/list.do"; //菜单地址(权限用)
	@Resource(name="custinfoService")
	private CustInfoManager custinfoService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增CustInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("CUSTINFO_ID", this.get32UUID());	//主键
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);		
		pd.put("CREATE_USER_ID", user.getUSER_ID());
		pd.put("UPDATE_USER_ID", user.getUSER_ID());
		pd.put("CUSTOMER_MANAGER_ID", user.getUSER_ID());
		pd.put("CREATE_TIME", new Date());
		pd.put("UPDATE_TIME", new Date());
		
		custinfoService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除CustInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		custinfoService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CustInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		custinfoService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表CustInfo");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = custinfoService.list(page);	//列出CustInfo列表
		mv.setViewName("crm/custinfo/custinfo_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("crm/custinfo/custinfo_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = custinfoService.findById(pd);	//根据ID读取
		mv.setViewName("crm/custinfo/custinfo_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除CustInfo");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			custinfoService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出CustInfo到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("姓名");	//1
		titles.add("身份证");	//2
		titles.add("年龄");	//3
		titles.add("生日");	//4
		titles.add("户口地址");	//5
		titles.add("家庭情况");	//6
		titles.add("喜好");	//7
		titles.add("手机");	//8
		titles.add("微信");	//9
		titles.add("qq");	//10
		titles.add("邮箱");	//11
		titles.add("工作单位");	//12
		titles.add("小区名字");	//13
		titles.add("客户经理id");	//14
		titles.add("融资经理id");	//15
		titles.add("公开人id");	//16
		titles.add("户口是否本地");	//17
		titles.add("房");	//18
		titles.add("车");	//19
		titles.add("工资");	//20
		titles.add("社保");	//21
		titles.add("公积金");	//22
		titles.add("代发工资");	//23
		titles.add("有没买商业保险");	//24
		titles.add("创建人id");	//25
		titles.add("更新人id");	//26
		titles.add("创建时间");	//27
		titles.add("更新时间");	//28
		titles.add("公开时间");	//29
		dataMap.put("titles", titles);
		List<PageData> varOList = custinfoService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("ID_CARD_NO"));	//2
			vpd.put("var3", varOList.get(i).getString("AGE"));	//3
			vpd.put("var4", varOList.get(i).getString("BIRTHDAY"));	//4
			vpd.put("var5", varOList.get(i).getString("REGISTER_ADDR"));	//5
			vpd.put("var6", varOList.get(i).getString("FAMILY_INFO"));	//6
			vpd.put("var7", varOList.get(i).getString("HOBBY"));	//7
			vpd.put("var8", varOList.get(i).getString("MOBILE"));	//8
			vpd.put("var9", varOList.get(i).getString("WEIXIN"));	//9
			vpd.put("var10", varOList.get(i).getString("QQ"));	//10
			vpd.put("var11", varOList.get(i).getString("E_MAIL"));	//11
			vpd.put("var12", varOList.get(i).getString("WORK_UNIT"));	//12
			vpd.put("var13", varOList.get(i).getString("HOUSE_NAME"));	//13
			vpd.put("var14", varOList.get(i).get("CUSTOMER_MANAGER_ID").toString());	//14
			vpd.put("var15", varOList.get(i).get("FINANCING_MANAGER_ID").toString());	//15
			vpd.put("var16", varOList.get(i).get("OPEN_USER_ID").toString());	//16
			vpd.put("var17", varOList.get(i).get("IS_LOCAL_ACCOUNT").toString());	//17
			vpd.put("var18", varOList.get(i).getString("HOUSE_INFO"));	//18
			vpd.put("var19", varOList.get(i).getString("CAR_INFO"));	//19
			vpd.put("var20", varOList.get(i).getString("SALARY_INFO"));	//20
			vpd.put("var21", varOList.get(i).getString("SOCIAL_SEC_INFO"));	//21
			vpd.put("var22", varOList.get(i).getString("ACCUM_FUND_INFO"));	//22
			vpd.put("var23", varOList.get(i).getString("PAYROLL"));	//23
			vpd.put("var24", varOList.get(i).get("IS_COMMERCIAL INSURANCE").toString());	//24
			vpd.put("var25", varOList.get(i).get("CREATE_USER_ID").toString());	//25
			vpd.put("var26", varOList.get(i).get("UPDATE_USER_ID").toString());	//26
			vpd.put("var27", varOList.get(i).getString("CREATE_TIME"));	//27
			vpd.put("var28", varOList.get(i).getString("UPDATE_TIME"));	//28
			vpd.put("var29", varOList.get(i).getString("OPEN_TIME"));	//29
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
