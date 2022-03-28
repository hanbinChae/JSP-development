function check(){
	
	if (document.action.saleno.value ==""){
		alert("판매번호가 입력되지 않았습니다.")
		return false;
	}
	if (document.action.pcode.value ==""){
		alert("상품코드가 입력되지 않았습니다.")
		return false;
	}
	if (document.action.saledate.value ==""){
		alert("판매날짜가 입력되지 않았습니다.")
		return false;
	}
	if (document.action.scode.value ==""){
		alert("매장코드가 입력되지 않았습니다.")
		return false;
	}
	if (document.action.amount.value ==""){
		alert("판매수량이 입력되지 않았습니다.")
		return false;
	}
	
	alert("판매등록이 완료되었습니다.");
}
function re(){
	alert("초기화되었습니다.");
}