function check(){
	if(document.action.custname.value==""){
		document.action.custname.focus();
		alert("회원성명이 입력되지 않았습니다.");
		return false;
	}
	if(document.action.phone.value==""){
		document.action.phone.focus();
		alert("회원번호가 입력되지 않았습니다.");
		return false;
	}
	if(document.action.address.value==""){
		document.action.address.focus();
		alert("회원주소가 입력되지 않았습니다.");
		return false;
	}
	if(document.action.joindate.value==""){
		document.action.joindate.focus();
		alert("가입일자가 입력되지 않았습니다.");
		return false;
	}
	if(document.action.grade.value==""){
		document.action.grade.focus();
		alert("고객등급이 입력되지 않았습니다.");
		return false;
	}
	if(document.action.city.value==""){
		document.action.city.focus();
		alert("도시코드가 입력되지 않았습니다.");
		return false;
	}
	alert("회원등록이 완료 되었습니다!");
}