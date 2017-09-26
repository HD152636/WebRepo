<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>숫자 합 계산</title>
</head>
<body>
<form>
<input type="number" name="num" min ="1" required>
<button type="submit">계산</button> 
</form>
<%-- 스크립틀릿 tag로 1~입력받은 숫 자까지의 합 구하기 --%>

<% String num = request.getParameter("num");
	int sum=0; 
	if(num!=null){
	int a= Integer.parseInt(num);
	for(int i=1; i<=a; i++){
		sum+=i;
	}
	
%>
<h1>1 ~ <%=num%>까지의 합은 <%=sum%>입니다. </h1>
<%
	}
	// 현재 일시 구하기 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
	
%>
현재 일시는 <%= sdf.format(new Date()) %>

</body>
</html>