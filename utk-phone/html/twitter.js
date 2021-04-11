function twitter_paylas(str){
	
	var img = 'bos';
    if(document.getElementById("twitter_foto").src.length > 5) {
		
		img = document.getElementById("twitter_foto").src;
		
	} 
	
     $.post("http://"+lib+"/twitterSendPost", JSON.stringify({
		 visibility: str,
		 message: document.getElementById("twitterpostarea").value,
		 image: img
	 }));

	
}

function twitter_kapat_hepsini(){
	document.getElementById("tmenu_1").style.removeProperty("outline");
	document.getElementById("tmenu_2").style.removeProperty("outline");
	document.getElementById("tmenu_3").style.removeProperty("outline");
	document.getElementById("tmenu_4").style.removeProperty("outline");
	//document.getElementById("tmenu_4").style.outline = "2px solid black";
	
}