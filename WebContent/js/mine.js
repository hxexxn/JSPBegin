$(function(){
	

	var idCheck = false;
	var idCheckResult = false;

	$('#homeBtn').click(function(){
		
		location.href = "index.jsp";
	})

	$('#idCheckBtn').click(function (e) { 
		
		idCheck = true;
		var user_id = $('#user_id').val();
		
		$.ajax({
			url : "idCheckProccess.jsp",
			type : "post",
			data : {user_id, user_id},
			success : function(data){
				
				if (data.trim() == 'Dup') {
					alert("아이디가 중복됩니다.");
				} else {
					alert("사용 가능한 아이디임.");
					idCheckResult = true;
				}
			},
			error: function(request, status, error) {
				consol.log("code : " + request.status + "\n" +
							"message : " + request.responseText + "\n" +
							"error : " + error);
			}
		})
	})
	
	$('#userRegForm').submit(function (e) { 
		
		var user_id = $('#user_id').val();
		var user_pw = $('#user_pw').val();
		var user_re_pw = $('#user_re_pw').val();

		if (user_id == null || user_id.trim() == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if (user_pw == null || user_pw.trim() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		if (user_re_pw == null || user_re_pw.trim() == "") {
			alert("비밀번호 확인란을 입력해주세요.");
			return;
		}
		
		if (user_pw != user_re_pw) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}

		if (idCheck == false) {
			alert("아이디 중복 체크 해주세요.");
			return;
		}
		
		if (idCheckResult == false) {
			alert("아이디가 중복됩니다.");
			return;
		}
		
		$('#userRegForm').attr('action', 'loginProcess.jsp');
		$('#userRegForm').attr('method', 'post');

	});


	$('#loginBtn').click(function (e){
		
		var formTag = $('#loginForm');
		
		var user_id = $('#user_id').val();
		var user_pw = $('#user_pw').val();
		
		if (user_id == null || user_id.trim() == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		
		if (user_pw == null || user_pw.trim() == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		loginForm.submit();
		
		/*$.ajax({
			url : "newLoginProccess.jsp",
			type : "post",
			data : {abc:user_id,
					user_pw:user_pw},
			success : function(data){

				if (data.trim() == "Success") {
					location.href = "index.jsp";
				} else {
					alert("아이디나 비밀번호를 다시 확인해주세요.");
				}
			},
			error: function(request, status, error) {
				consol.log("code : " + request.status + "\n" +
							"message : " + request.responseText + "\n" +
							"error : " + error);
			}
		});*/
			
		
	})
	
	/* 게시판 JS */
	
	$('#boardRegBtn').click(function(){
		
		var boardRegForm = $('#boardRegForm');
		
		var bTitle = $('#bTitle').val();
		var bContent = $('#bContent').val();
		var bWriter = $('#bWriter').val();
		
		
		if (bTitle == null || bTitle.trim() == "") {
			alert('제목을 입력해주세요.');
			return;
		}
		
		if (bContent == null || bContent.trim() == "") {
			alert('내용을 입력해주세요.');
			return;
		}
		
		if (bWriter == null || bWriter.trim() == "") {
			alert('작성자 명을 입력해주세요.');
			return;
		}
		
		boardRegForm.submit();
	})
	
	/* 게시판 삭제 */
	
/*	$('#delBtn').click(function(){
		
		
	})*/
	
	/* 게시판 수정 */
	
	$('#boardModifyBtn').click(function(){
		
		var modiForm = $('#modiForm');
		
		var modibTitle = $('#bTitle').val();
		var modibContent = $('#bContent').val();
		
		if (modibTitle == null || modibTitle.trim() == "") {
			alert ('제목을 입력해주세요.');
			return;
		}
		
		if (modibContent == null || modibContent.trim() == "") {
			alert ('내용을 입력해주세요.');
			return;
		}
		
		modiForm.submit();
		
	})
	
	
		
})