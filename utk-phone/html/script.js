var lib = "utkphone";

window.addEventListener('message', function (event) {


if(event.data.action == "hud") {
	
 
	 $("body").css("display", event.data.show ? "block" : "none");
 

}

if(event.data.action == "twitter_post") {
	
	// document.getElementById("twitterpostarea").value = event.data.value;
	 $('#twitter_foto').attr('src', event.data.value);
     document.getElementById("twitter_foto").style.display = "block";
}



	
});





function TwitterFoto() { 
 
      $.post("http://"+lib+"/TwitterFoto", JSON.stringify({}));
	
 
}



var twitterUSING = false;
 var sira = 1;

window.onkeydown = function(e) { 
 if(e.keyCode == 112) { $.post("http://utkphone/kapat", JSON.stringify({})); }
if(twitterUSING == true){

 var kcd = document.getElementById("twitterpostarea").value;
 
 if(kcd.length < 50){  if(e.key.length == 1) {kcd = kcd + e.key;}}
 if(e.keyCode == 8) { kcd = kcd.slice(0, -1);   }
 document.getElementById("twitterpostarea").value = kcd;
 if(e.keyCode == 27) {  twitter(); twitterUSING = false;  tema("saydam");  }
}
 
 
  if(twitterUSING == true) {
	 
	 
	 
	 if(e.keyCode == 38) { sira = sira - 1;  }
	 if(e.keyCode == 40) { sira = sira + 1; }
     
	 if(sira == 5) { sira = 1; }
	 if(sira == -1) { sira = 5; }
	 
	 twitter_kapat_hepsini();
	 
	 document.getElementById("tmenu_"+sira).style.outline = "4px dotted black";
	 
 
	 
 }
 if(e.keyCode == 37) { kcd = kcd.slice(0, -1);   }
 
}




 
	
var d_twitter = false;

function twitter() {
	 
	document.getElementById("twitter_app").style.transition = "0.7s";
	document.getElementById("twitter_app").style.position = "absolute";
	document.getElementById("twitter_app").style.width = "170%";
	document.getElementById("twitter_app").style.left = "-111px";
	document.getElementById("twitter_app").style.zIndex = "5";
	
		 setTimeout(function(){ 
		
	
 
		 if(d_twitter == false) {

		 document.getElementById("twitter").style.display = "block";
		 
 tema("uygulama", "#28aae1", "#fafafa");
		 document.getElementById("twitter_loading").style.display = "block";
	 document.getElementById("twitter_Frame").style.display = "none";
		 setTimeout(function(){ 
		  
 tema("acik");
		 document.getElementById("twitter_loading").style.display = "none";
		 document.getElementById("twitter_Frame").style.display = "block";
		  twitterUSING = true;
		  	 clearTimeout();

		 }, 2000);


		 d_twitter = true;
		 
	 }else {
		 document.getElementById("twitter").style.display = "none";
		 d_twitter = false;
		 twitterUSING = false;
		 tema("saydam");
		 document.getElementById("twitter_app").style.removeProperty("transition");
		 document.getElementById("twitter_app").style.removeProperty("position");
		 document.getElementById("twitter_app").style.removeProperty("left");
		 document.getElementById("twitter_app").style.removeProperty("z-index");
	     document.getElementById("twitter_app").style.width = "20%";
	 }
	 
 
		clearTimeout();
		 
	}, 700);
}






function tema(str, b, c) {
	
	if(str == "koyu") {
		document.getElementById("ustbar").style.background = "#fff";
		document.getElementById("ustbar").style.color = "#000";
	}
	
	if(str == "saydam") {
		document.getElementById("ustbar").style.background = "rgb(0, 0, 0, 0.0)";
		document.getElementById("ustbar").style.color = "#fafafa";
	}
	
	if(str == "acik") {
		document.getElementById("ustbar").style.background = "#fafafa";
		document.getElementById("ustbar").style.color = "#000";
	}
	
	if(str == "uygulama") {
		document.getElementById("ustbar").style.background = b;
		document.getElementById("ustbar").style.color = c;
	}
	
}

 

 