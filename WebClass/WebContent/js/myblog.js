function menu_over(e) {
	e.setAttribute("class", "nav-item active"); //<li class = "nav-item active">

}
function menu_out(e) {
	e.setAttribute("class", "nav-item"); //<li class = "nav-item">

}

$(document).ready(
		function() {
			$('#loginForm').submit(
					function(event) {
						//자동으로 submit되는 것 막기
						event.preventDefault();
						//id, pwd 가져오기
						var id = $('#id').val();
						var pwd = $('#pwd').val();
						console.log(id, pwd);

						$.post("http://httpbin.org/post", {
							"id" : id,
							"pwd" : pwd
						}, function(data) {
							var myModal = $('#myModal');
							myModal.modal();
							myModal.find('.modal-body').text(
									"<" + data.form.id + "님> 로그인 되었습니다.");

						});
					});
		});

$(document).ready(
		function() {
			$('#Submitform').submit(
					function(event) {
						//자동으로 submit되는 것 막기
						event.preventDefault();

						var grade = $('#grade').val();
						var class_ = $('#class').val();
						var num = $('#num').val();
						var name = $('#name').val();
						console.log(grade, class_, num, name);

						$.post("http://httpbin.org/post", {
							"grade" : grade,
							"class" : class_,
							"num" : num,
							"name" : name
						}, function(data) {
							var myModal = $('#myModal');
							myModal.modal();
							myModal.find('.modal-body').text(
									"<" + data.form.name + "님> 회원가입 되었습니다.");

						});
					});
		});
