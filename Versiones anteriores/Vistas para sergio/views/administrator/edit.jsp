<%--
 * edit.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%-- Stored message variables --%>

<spring:message code="administrator.edit" var="edit" />
<spring:message code="administrator.userAccount.username" var="username" />
<spring:message code="administrator.userAccount.password" var="password" />
<spring:message code="administrator.name" var="name" />
<spring:message code="administrator.middleName" var="middleName" />
<spring:message code="administrator.surname" var="surname" />
<spring:message code="administrator.photo" var="photo" />
<spring:message code="administrator.email" var="email" />
<spring:message code="administrator.phone" var="phone" />
<spring:message code="administrator.address" var="address" />
<spring:message code="administrator.save" var="save" />
<spring:message code="administrator.cancel" var="cancel" />
<spring:message code="administrator.confirm" var="confirm" />
<spring:message code="administrator.phone.pattern1" var="phonePattern1" />
<spring:message code="administrator.phone.pattern2" var="phonePattern2" />
<spring:message code="administrator.phone.note" var="phoneNote" />

<security:authorize access="hasRole('ADMIN')">

	<form:form id="form" action="${requestURI}"
		modelAttribute="administrator">

		<%-- Forms --%>

		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="boxes" />
		<form:hidden path="socialProfiles" />
		<form:hidden path="spammer" />


		<jstl:if test="${administrator.id == 0}">

			<form:hidden path="userAccount.banned" />
			<form:hidden path="userAccount.authorities" />

			<form:label path="userAccount.username">
				<jstl:out value="${username}" />:
	</form:label>
			<form:input path="userAccount.username" />
			<form:errors cssClass="error" path="userAccount.username" />
			<br />

			<form:label path="userAccount.password">
				<jstl:out value="${password}" />:
	</form:label>
			<form:password path="userAccount.password" />
			<form:errors cssClass="error" path="userAccount.password" />
			<br />
		</jstl:if>

		<jstl:if test="${administrator.id != 0}">
			<form:hidden path="userAccount" />
		</jstl:if>

		<form:label path="name">
			<jstl:out value="${name}" />:
	</form:label>
		<form:input path="name" />
		<form:errors cssClass="error" path="name" />
		<br />

		<form:label path="middleName">
			<jstl:out value="${middleName}" />:
	</form:label>
		<form:input path="middleName" />
		<form:errors cssClass="error" path="middleName" />
		<br />

		<form:label path="surname">
			<jstl:out value="${surname}" />:
	</form:label>
		<form:input path="surname" />
		<form:errors cssClass="error" path="surname" />
		<br />

		<form:label path="photo">
			<jstl:out value="${photo}" />:
	</form:label>
		<form:input path="photo" />
		<form:errors cssClass="error" path="photo" />
		<br />

		<form:label path="email">
			<jstl:out value="${email}" />:
	</form:label>
		<form:input path="email" placeholder="mail@" />
		<form:errors cssClass="error" path="email" />
		<br />

		<form:label path="phone">
			<jstl:out value="${phone}" />:
	</form:label>
		<form:input id="phone" path="phone" placeholder="+CC 654654654" />
		<form:errors cssClass="error" path="phone" />
		<jstl:out value="${phoneNote}" />
		<br />

		<form:label path="address">
			<jstl:out value="${address}" />:
	</form:label>
		<form:input path="address" />
		<form:errors cssClass="error" path="address" />
		<br />
		<br />
		<jstl:out value="${phonePattern1}" />
		<br />
		<jstl:out value="${phonePattern2}" />
		<br />
		<br />


		<%-- Buttons --%>

		<input type="submit" name="save" value="${save}"
			onclick="return confirm('${confirm}')" />&nbsp;
		
		
	<input type="button" name="cancel" value="${cancel}"
			onclick="javascript: relativeRedir('welcome/index.do');" />

	</form:form>
</security:authorize>

<script type="text/javascript">
	function phoneCheck() {
		var form = document.getElementById("form");
		var phone = form["phone"].value;
		var regx1 = "^$|^\\+([1-9][0-9]{0,2}) (\\([1-9][0-9]{0,2}\\)) ([a-zA-Z0-9 -]{4,})$";
		var regx2 = "^$|^\\+([1-9][0-9]{0,2}) ([a-zA-Z0-9 -]{4,})$";
		var regx3 = "^$|^\\([a-zA-Z0-9 -]{4,})$";
		if (!phone.match(regx1) && !phone.match(regx2) && !phone.match(regx3))
			confirm('${check}');
	}
</script>