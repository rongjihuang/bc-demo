<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- <%@ taglib prefix="bc" uri="/bc-tags"%> --%>
<div title='<s:text name="bulletin.title"/>' data-type='form' class="bc-page"
	data-saveUrl='<s:url value="/bc/bulletin/save" />'
	data-js='<s:url value="/bc/bulletin/form.js" />'
	data-initMethod='bc.bulletinForm.init'
	data-option='{
		"buttons":[{"text":"<s:text name="label.save"/>","action":"save"}],
		"width":618,"minWidth":250,"minHeight":250,"modal":false
	}'>
	<s:form name="bulletinForm" theme="simple">
		<div class="formInfo">
			<s:if test="%{e.issuerName == null}">
				<s:property value="e.authorName" />(<s:property value="e.departName" />) 创建于  <s:date name="e.fileDate" format="yyyy-MM-dd HH:mm:ss"/>
			</s:if>
			<s:else>
				<s:property value="e.issuerName" /> 发布于  <s:date name="e.issueDate" format="yyyy-MM-dd HH:mm:ss"/>
			</s:else>
		</div>
		<table class="formTable2 ui-widget-content" cellspacing="2" cellpadding="0">
			<tbody>
				<tr>
					<td class="label"><s:text name="bulletin.scope"/>:</td>
					<td class="value"><s:radio name="e.scope" list="#{'0':'本单位','1':'全系统'}" 
						value="e.scope" cssStyle="width:auto;"/></td>
					<td class="label"><s:text name="bulletin.unitName"/>:</td>
					<td class="value" colspan="3"><s:textfield name="e.unitName" readonly="true" cssClass="ui-state-disabled"/></td>
				</tr>
				<tr>
					<td class="label"><s:text name="bulletin.status"/>:</td>
					<td class="value"><s:radio name="e.status" list="#{'0':'待发布','1':'已发布','2':'已过期'}" 
						value="e.status" cssStyle="width:auto;"/></td>
					<td class="label"><s:text name="bulletin.overdueDate"/>:</td>
					<td class="value"><input type="text" name="e.overdueDate" data-validate="date"
						value='<s:date format="yyyy-MM-dd" name="e.overdueDate" />'/></td>
				</tr>
				<tr>
					<td class="label">* <s:text name="bulletin.subject"/>:</td>
					<td class="value" colspan="3"><s:textfield name="e.subject" data-validate="required"/></td>
				</tr>
			</tbody>
		</table>
		<div class="formTable2 ui-widget-content">
			<div class="bc-font-medium" style="font-weight: bold;margin:0 4px 4px;">附加附件:</div>
<%-- 			<bc:docs id="DOCS" cssStyle="border:1px solid #ccc;margin:0;height:100px;"/> --%>
			<div class="bc-font-medium" style="font-weight: bold;margin:10px 4px 4px;">详细内容:</div>
			<s:textarea name="e.content" cssClass="xheditor" rows="12" 
				style="margin:4px;width: 97%;height:200px;" cols="80" data-validate="required"></s:textarea>
		</div>
		<s:hidden name="e.inner" />
		<s:hidden name="e.uid" />
		<s:hidden name="e.id" />
		<s:hidden name="e.author.id" />
		<s:hidden name="e.author.name" />
		<s:hidden name="e.departId" />
		<s:hidden name="e.departName" />
		<s:hidden name="e.unitId" />
		<s:hidden name="e.issueDate" />
		<s:hidden name="e.issuer.id" />
		<input type="hidden" name="e.fileDate" value='<s:date format="yyyy-MM-dd HH:mm:ss" name="e.fileDate" />'/>
	</s:form>
</div>