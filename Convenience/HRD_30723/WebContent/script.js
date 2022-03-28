function check(){
	if(document.action.goods_nm.value==""){
		alert("상품명를 입력해주세요.");
		document.action.goods_nm.focus();
		return false;
	}
	if(document.action.goods_price.value==""){
		alert("단가를 입력해주세요.");
		document.action.goods_price.focus();
		return false;
	}
	if(document.action.cost.value==""){
		alert("원가를 입력해주세요.");
		document.action.cost.focus();
		return false;
	}
	if(document.action.in_date.value==""){
		alert("입고일자를 입력해주세요.");
		document.action.in_date.focus();
		return false;
	}
	alert("등록되었습니다.")
	
}
function rst(){
	alert("등록이 취소되었습니다.");
}