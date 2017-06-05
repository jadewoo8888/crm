<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="custinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="CUSTINFO_ID" id="CUSTINFO_ID" value="${pd.CUSTINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="255" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">身份证:</td>
								<td><input type="text" name="ID_CARD_NO" id="ID_CARD_NO" value="${pd.ID_CARD_NO}" maxlength="255" placeholder="这里输入身份证" title="身份证" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年龄:</td>
								<td><input type="text" name="AGE" id="AGE" value="${pd.AGE}" maxlength="255" placeholder="这里输入年龄" title="年龄" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">生日:</td>
								<td><input type="text" name="BIRTHDAY" id="BIRTHDAY" value="${pd.BIRTHDAY}" maxlength="255" placeholder="这里输入生日" title="生日" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">户口地址:</td>
								<td><input type="text" name="REGISTER_ADDR" id="REGISTER_ADDR" value="${pd.REGISTER_ADDR}" maxlength="255" placeholder="这里输入户口地址" title="户口地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">家庭情况:</td>
								<td><input type="text" name="FAMILY_INFO" id="FAMILY_INFO" value="${pd.FAMILY_INFO}" maxlength="255" placeholder="这里输入家庭情况" title="家庭情况" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">喜好:</td>
								<td><input type="text" name="HOBBY" id="HOBBY" value="${pd.HOBBY}" maxlength="255" placeholder="这里输入喜好" title="喜好" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">手机:</td>
								<td><input type="text" name="MOBILE" id="MOBILE" value="${pd.MOBILE}" maxlength="255" placeholder="这里输入手机" title="手机" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">微信:</td>
								<td><input type="text" name="WEIXIN" id="WEIXIN" value="${pd.WEIXIN}" maxlength="255" placeholder="这里输入微信" title="微信" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">qq:</td>
								<td><input type="text" name="QQ" id="QQ" value="${pd.QQ}" maxlength="255" placeholder="这里输入qq" title="qq" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮箱:</td>
								<td><input type="text" name="E_MAIL" id="E_MAIL" value="${pd.E_MAIL}" maxlength="255" placeholder="这里输入邮箱" title="邮箱" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">工作单位:</td>
								<td><input type="text" name="WORK_UNIT" id="WORK_UNIT" value="${pd.WORK_UNIT}" maxlength="255" placeholder="这里输入工作单位" title="工作单位" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">小区名字:</td>
								<td><input type="text" name="HOUSE_NAME" id="HOUSE_NAME" value="${pd.HOUSE_NAME}" maxlength="255" placeholder="这里输入小区名字" title="小区名字" style="width:98%;"/></td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">客户经理id:</td>
								<td><input type="number" name="CUSTOMER_MANAGER_ID" id="CUSTOMER_MANAGER_ID" value="${pd.CUSTOMER_MANAGER_ID}" maxlength="32" placeholder="这里输入客户经理id" title="客户经理id" style="width:98%;"/></td>
							</tr> --%>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">融资经理id:</td>
								<td><input type="number" name="FINANCING_MANAGER_ID" id="FINANCING_MANAGER_ID" value="${pd.FINANCING_MANAGER_ID}" maxlength="32" placeholder="这里输入融资经理id" title="融资经理id" style="width:98%;"/></td>
							</tr> --%>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公开人id:</td>
								<td><input type="number" name="OPEN_USER_ID" id="OPEN_USER_ID" value="${pd.OPEN_USER_ID}" maxlength="32" placeholder="这里输入公开人id" title="公开人id" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">户口是否本地:</td>
								<td><input type="number" name="IS_LOCAL_ACCOUNT" id="IS_LOCAL_ACCOUNT" value="${pd.IS_LOCAL_ACCOUNT}" maxlength="32" placeholder="这里输入户口是否本地" title="户口是否本地" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">房:</td>
								<td><input type="text" name="HOUSE_INFO" id="HOUSE_INFO" value="${pd.HOUSE_INFO}" maxlength="255" placeholder="这里输入房" title="房" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">车:</td>
								<td><input type="text" name="CAR_INFO" id="CAR_INFO" value="${pd.CAR_INFO}" maxlength="255" placeholder="这里输入车" title="车" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">工资:</td>
								<td><input type="text" name="SALARY_INFO" id="SALARY_INFO" value="${pd.SALARY_INFO}" maxlength="255" placeholder="这里输入工资" title="工资" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">社保:</td>
								<td><input type="text" name="SOCIAL_SEC_INFO" id="SOCIAL_SEC_INFO" value="${pd.SOCIAL_SEC_INFO}" maxlength="255" placeholder="这里输入社保" title="社保" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公积金:</td>
								<td><input type="text" name="ACCUM_FUND_INFO" id="ACCUM_FUND_INFO" value="${pd.ACCUM_FUND_INFO}" maxlength="255" placeholder="这里输入公积金" title="公积金" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">代发工资:</td>
								<td><input type="text" name="PAYROLL" id="PAYROLL" value="${pd.PAYROLL}" maxlength="255" placeholder="这里输入代发工资" title="代发工资" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">有没买商业保险:</td>
								<td><input type="number" name="IS_COMMERCIAL_INSURANCE" id="IS_COMMERCIAL_INSURANCE" value="${pd.IS_COMMERCIAL_INSURANCE}" maxlength="32" placeholder="这里输入有没买商业保险" title="有没买商业保险" style="width:98%;"/></td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建人id:</td>
								<td><input type="number" name="CREATE_USER_ID" id="CREATE_USER_ID" value="${pd.CREATE_USER_ID}" maxlength="32" placeholder="这里输入创建人id" title="创建人id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">更新人id:</td>
								<td><input type="number" name="UPDATE_USER_ID" id="UPDATE_USER_ID" value="${pd.UPDATE_USER_ID}" maxlength="32" placeholder="这里输入更新人id" title="更新人id" style="width:98%;"/></td>
							</tr> --%>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">创建时间:</td>
								<td><input class="span10 date-picker" name="CREATE_TIME" id="CREATE_TIME" value="${pd.CREATE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">更新时间:</td>
								<td><input class="span10 date-picker" name="UPDATE_TIME" id="UPDATE_TIME" value="${pd.UPDATE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="更新时间" title="更新时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">公开时间:</td>
								<td><input class="span10 date-picker" name="OPEN_TIME" id="OPEN_TIME" value="${pd.OPEN_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="公开时间" title="公开时间" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#ID_CARD_NO").val()==""){
				$("#ID_CARD_NO").tips({
					side:3,
		            msg:'请输入身份证',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID_CARD_NO").focus();
			return false;
			}
			if($("#AGE").val()==""){
				$("#AGE").tips({
					side:3,
		            msg:'请输入年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGE").focus();
			return false;
			}
			if($("#BIRTHDAY").val()==""){
				$("#BIRTHDAY").tips({
					side:3,
		            msg:'请输入生日',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BIRTHDAY").focus();
			return false;
			}
			if($("#REGISTER_ADDR").val()==""){
				$("#REGISTER_ADDR").tips({
					side:3,
		            msg:'请输入户口地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REGISTER_ADDR").focus();
			return false;
			}
			if($("#FAMILY_INFO").val()==""){
				$("#FAMILY_INFO").tips({
					side:3,
		            msg:'请输入家庭情况',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAMILY_INFO").focus();
			return false;
			}
			if($("#HOBBY").val()==""){
				$("#HOBBY").tips({
					side:3,
		            msg:'请输入喜好',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOBBY").focus();
			return false;
			}
			if($("#MOBILE").val()==""){
				$("#MOBILE").tips({
					side:3,
		            msg:'请输入手机',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MOBILE").focus();
			return false;
			}
			if($("#WEIXIN").val()==""){
				$("#WEIXIN").tips({
					side:3,
		            msg:'请输入微信',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WEIXIN").focus();
			return false;
			}
			if($("#QQ").val()==""){
				$("#QQ").tips({
					side:3,
		            msg:'请输入qq',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QQ").focus();
			return false;
			}
			if($("#E_MAIL").val()==""){
				$("#E_MAIL").tips({
					side:3,
		            msg:'请输入邮箱',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#E_MAIL").focus();
			return false;
			}
			if($("#WORK_UNIT").val()==""){
				$("#WORK_UNIT").tips({
					side:3,
		            msg:'请输入工作单位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WORK_UNIT").focus();
			return false;
			}
			if($("#HOUSE_NAME").val()==""){
				$("#HOUSE_NAME").tips({
					side:3,
		            msg:'请输入小区名字',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOUSE_NAME").focus();
			return false;
			}
			if($("#CUSTOMER_MANAGER_ID").val()==""){
				$("#CUSTOMER_MANAGER_ID").tips({
					side:3,
		            msg:'请输入客户经理id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CUSTOMER_MANAGER_ID").focus();
			return false;
			}
			if($("#FINANCING_MANAGER_ID").val()==""){
				$("#FINANCING_MANAGER_ID").tips({
					side:3,
		            msg:'请输入融资经理id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FINANCING_MANAGER_ID").focus();
			return false;
			}
			if($("#OPEN_USER_ID").val()==""){
				$("#OPEN_USER_ID").tips({
					side:3,
		            msg:'请输入公开人id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPEN_USER_ID").focus();
			return false;
			}
			if($("#IS_LOCAL_ACCOUNT").val()==""){
				$("#IS_LOCAL_ACCOUNT").tips({
					side:3,
		            msg:'请输入户口是否本地',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_LOCAL_ACCOUNT").focus();
			return false;
			}
			if($("#HOUSE_INFO").val()==""){
				$("#HOUSE_INFO").tips({
					side:3,
		            msg:'请输入房',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOUSE_INFO").focus();
			return false;
			}
			if($("#CAR_INFO").val()==""){
				$("#CAR_INFO").tips({
					side:3,
		            msg:'请输入车',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CAR_INFO").focus();
			return false;
			}
			if($("#SALARY_INFO").val()==""){
				$("#SALARY_INFO").tips({
					side:3,
		            msg:'请输入工资',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SALARY_INFO").focus();
			return false;
			}
			if($("#SOCIAL_SEC_INFO").val()==""){
				$("#SOCIAL_SEC_INFO").tips({
					side:3,
		            msg:'请输入社保',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SOCIAL_SEC_INFO").focus();
			return false;
			}
			if($("#ACCUM_FUND_INFO").val()==""){
				$("#ACCUM_FUND_INFO").tips({
					side:3,
		            msg:'请输入公积金',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACCUM_FUND_INFO").focus();
			return false;
			}
			if($("#PAYROLL").val()==""){
				$("#PAYROLL").tips({
					side:3,
		            msg:'请输入代发工资',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PAYROLL").focus();
			return false;
			}
			if($("#IS_COMMERCIAL_INSURANCE").val()==""){
				$("#IS_COMMERCIAL_INSURANCE").tips({
					side:3,
		            msg:'请输入有没买商业保险',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_COMMERCIAL_INSURANCE").focus();
			return false;
			}
			if($("#CREATE_USER_ID").val()==""){
				$("#CREATE_USER_ID").tips({
					side:3,
		            msg:'请输入创建人id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_USER_ID").focus();
			return false;
			}
			if($("#UPDATE_USER_ID").val()==""){
				$("#UPDATE_USER_ID").tips({
					side:3,
		            msg:'请输入更新人id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_USER_ID").focus();
			return false;
			}
			if($("#CREATE_TIME").val()==""){
				$("#CREATE_TIME").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATE_TIME").focus();
			return false;
			}
			if($("#UPDATE_TIME").val()==""){
				$("#UPDATE_TIME").tips({
					side:3,
		            msg:'请输入更新时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#UPDATE_TIME").focus();
			return false;
			}
			if($("#OPEN_TIME").val()==""){
				$("#OPEN_TIME").tips({
					side:3,
		            msg:'请输入公开时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#OPEN_TIME").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>