	function CheckClick(id){
		Swal.fire({
			  title: '삭제하시겠습니까?',
			  text: "삭제 버튼을 누르시면 되돌릴 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Delete'
			}).then((result) => {
			  if (result.isConfirmed) {
			   	document.location.href = "/Paging/Action/delete_action.jsp?id="+id;
			  }
			})
			
			 return false;
	}
	function goUpdate(id){
		var updated = $(".updated_content").val(); //클래스의 값 가져오는 jquery
		var title = $(".title").val();
		
		$(".updated_content").css("color","red"); //클래스의 css를 수정하는 jquery
		//$("#test").attr("disabled",false); //id의 속성을 사용여부 비활성화 == false;
		
		
		
		Swal.fire({
			  title: '수정하시겠습니까?',
			  text: "수정한 내용이 반영됩니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Update'
			}).then((result) => {
			  if (result.isConfirmed) {
			   	document.location.href = "../Paging/Action/update_action.jsp?id="+id+"&content="+updated+"&title="+title;
			  }
			})
			
			 return false;
	}