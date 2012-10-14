<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<%@ include file="/WEB-INF/pages/common/back-common.jsp"%>
<%@ include file="/WEB-INF/pages/common/taglib.jsp"%>
<%@ taglib uri="/WEB-INF/tld/options.tld" prefix="option" %>
<html>
    <head>
        <title>创建标签</title>
         <script type='text/javascript' src="<ls:templateResource item='/common/js/jquery.js'/>"></script>
         <script type='text/javascript' src="<ls:templateResource item='/common/js/jquery.validate.js'/>" /></script>
        <script type='text/javascript' src="<ls:templateResource item='/dwr/engine.js'/>"></script>
		<script type='text/javascript' src="<ls:templateResource item='/dwr/util.js'/>"></script>
		 <script type='text/javascript' src="<ls:templateResource item='/dwr/interface/CommonService.js'/>"></script>
		<script type='text/javascript' src="<ls:templateResource item='/dwr/interface/optionService.js'/>"></script>

        <link rel="stylesheet" type="text/css" media="screen" href="<ls:templateResource item='/common/default/css/indexJpgForm.css'/>" />
        <script language="javascript">
		    $.validator.setDefaults({
		    });

    $(document).ready(function() {
    jQuery("#form1").validate({
            rules: {
            name: {
                required: true
            },
            sortId: "required",
            newsCategoryId: "required"
            
        },
        messages: {
            name: {
                required: "请输入名称"
            },
            sortId: {
                required: "请选择商品分类"
            },
            newsCategoryId:{
            	required: "请选择商品分类"
            }
        }
    });
 
      $("#col1 tr").each(function(i){
      if(i>0){
         if(i%2 == 0){
             $(this).addClass('even');
         }else{    
              $(this).addClass('odd'); 
         }   
    }
     });   
         $("#col1 th").addClass('sortable'); 
});
</script>
</head>
    <body>
        <form action="<ls:url address='/admin/tag/save'/>" method="post" id="form1">
            <input id="tagId" name="tagId" value="${tag.tagId}" type="hidden">
   <table class="${tableclass}" style="width: 100%">
    <thead>
    	<tr><td>
    			<a href="<ls:url address='/admin/index'/>" target="_parent">首页</a> &raquo; 商城管理  &raquo; 
				<a href="<ls:url address='/admin/tag/query'/>">标签管理</a>
    	</td></tr>
    </thead>
    </table>
            <div align="center">
            <table border="0" align="center" class="${tableclass}" id="col1">
                <thead>
                    <tr class="sortable">
                        <th colspan="2">
                            <div align="center">
                                创建标签
                            </div>
                        </th>
                    </tr>
                </thead>
     			     <tr>
        <td>
          <div align="center">名称 <font color="ff0000">*</font></div>
       </td>
        <td>
           <p><input type="text" name="name" id="name" value="${tag.name}" /></p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">商品类型<font color="ff0000">*</font></div>
       </td>
        <td>
           <p><select id="sortId" name="sortId" >
			<c:if test="${sessionScope.SPRING_SECURITY_LAST_USERNAME != null && sessionScope.SPRING_SECURITY_LAST_USERNAME !=''}">
	            <option:optionGroup type="select" required="false" cache="fasle"
	                defaultDisp="-- 一级类型 --" 
	                hql="select t.sortId, t.sortName from Sort t where t.sortType = 'P' and t.userName = ?" param="${tag.userName}" selectedValue="${tag.sortId}"/>
             </c:if>
		</select>
           </p>
        </td>
      </tr>
     <tr>
        <td>
          <div align="center">新闻栏目<font color="ff0000">*</font></div>
       </td>
        <td>
           <p>
	           <select id="newsCategoryId" name="newsCategoryId">
	                 <option:optionGroup type="select" required="false" cache="fasle"
	                beanName="NewsCategory" beanId="newsCategoryId" beanDisp="newsCategoryName" 
	                hql="select t.newsCategoryId, t.newsCategoryName from NewsCategory t where t.status = 1 and t.userName = ?" param="${tag.userName}" selectedValue="${tag.newsCategoryId}"/>
	            </select>
           </p>
        </td>
      </tr>
      <tr>
      <td>
          <div align="center">状态<font color="ff0000">*</font></div>
       </td>
        <td>
           <p><select id="status" name="status">
	        <option:optionGroup type="select" required="true" cache="true"
	                beanName="YES_NO" selectedValue="${tag.status}"/>
		</select>
           </p>
        </td>
      </tr>
      <tr>
                    <td colspan="2">
                        <div align="center">
                            <input type="submit" value="提交" />
                            <input type="reset" value="重置" />
                            <input type="button" value="返回"
                                onclick="window.location='<ls:url address="/admin/tag/query"/>'" />
                        </div>
                    </td>
                </tr>
            </table>
           </div>
        </form>
    </body>
</html>

