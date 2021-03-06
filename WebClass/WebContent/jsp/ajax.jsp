<%@page import="org.dimigo.vo.UserVO"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="org.omg.CORBA.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SignUp</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
   integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
   crossorigin="anonymous">
<link rel="stylesheet" href="/WebClass/css/signin.css">
</head>
<body>
   <div class="container">

      <form id="signupForm" class="form-signin" action="" method="post">
         <h2 class="form-signin-heading">Please sign up</h2>

                  <label for="inputEmail" class="sr-only">Email address</label> <input
            type="email" name="id" id="inputEmail" class="form-control"
            placeholder="Email address" required autofocus> <label
            for="inputPassword" class="sr-only">Password</label> <input
            type="password" name="pwd" id="inputPassword" class="form-control"
            placeholder="Password" required> <label for="inputName"
            class="sr-only">Name</label> <input type="text" name="name"
            id="inputName" class="form-control" placeholder="Name" required>

         <label for="inputNickName" class="sr-only">Nick Name</label> <input
            type="text" name="nickname" id="inputNickName" class="form-control"
            placeholder="Nickname" required>



         <%-- <%
            if (request.getAttribute("user") == null) {
         %>
         <label for="inputEmail" class="sr-only">Email address</label> <input
            type="email" name="id" id="inputEmail" class="form-control"
            placeholder="Email address" required autofocus> <label
            for="inputPassword" class="sr-only">Password</label> <input
            type="password" name="pwd" id="inputPassword" class="form-control"
            placeholder="Password" required> <label for="inputName"
            class="sr-only">Name</label> <input type="text" name="name"
            id="inputName" class="form-control" placeholder="Name" required>

         <label for="inputNickName" class="sr-only">Nick Name</label> <input
            type="text" name="nickname" id="inputNickName" class="form-control"
            placeholder="Nickname" required>
         <%
            } else {
               UserVO user = (UserVO) request.getAttribute("user");
         %>
         <label for="inputEmail" class="sr-only">Email address</label>
         <input type="email" name="id" id="inputEmail" class="form-control"
            placeholder="Email address" value="<%=user.getId()%>" autofocus>

         <label for="inputPassword" class="sr-only">Password</label>
         <input type="password" name="pwd" id="inputPassword" class="form-control"
            placeholder="Password" value="<%=request.getAttribute("pwd")%>"
            required>

         <label for="inputName" class="sr-only">Name</label>
         <input value="<%=user.getName()%>" type="text" name="name"
            id="inputName" class="form-control" placeholder="Name" required>

         <label for="inputNickName" class="sr-only">Nick Name</label>
         <input type="text" name="nickname" id="inputNickName"
            value="<%=user.getNickname()%>" class="form-control"
            placeholder="Nickname" required>
         <%
            }
         %>  --%>
         <br>
         <button type="submit" id="goBtn" class="btn btn-lg btn-primary btn-block">Sign
            up</button>
      </form>
   </div>

   <%@ include file="modal.jsp"%>

   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
      integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
      crossorigin="anonymous"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
      integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
      crossorigin="anonymous"></script>


<script>
   <%-- 회원 가입이 실패한 경우 처리 추가 --%>
   <%--
      var myModal = $('#myModal');
      myModal.find('.modal-title').text('Sign Up Error');
      myModal.find('.modal-body').text('회원 가입 시 오류가 발생하였습니다.');
      myModal.modal();
   --%>
    $(document).ready(function () {
        $('#signupForm').submit(function (event) {
           event.preventDefault();
         var email = $('#inputEmail').val();
         var pwd = $('#inputPassword').val();
         var name = $('#inputName').val();
         var nickName = $('#inputNickName').val();
         var result;
         console.log(email,pwd,name,nickName);
         $.post("/WebClass/signup",
               {"email" : email, "pwd" : pwd, "name" : name, "nickName" : nickName, "result" : result},
               function(data) {
                  console.log(data);
                  if(data.result){
                     location.href='jsp/login.jsp';   
                  }
                  else{
                     console.log(data.email,data.pwd,data.name,data.nickName,data.result);
                     var myModal = $('#myModal');
                     myModal.find('.modal-title').text('Sign Up Error');
                     myModal.find('.modal-body').text('회원 가입 시 오류가 발생하였습니다.');
                     myModal.modal();
                  }
               });
        });
     });
</script>

</body>
</html>