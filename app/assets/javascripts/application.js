// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
 require 'jquery'
//= require jquery_ujs
//= require turbolinks
//= require_tree .

<title>Image Mover</title>
<style>
DIV.movable { position:absolute; }
</style>

<body onload="moveImage()">
<div id="hey" class="movable">
<img src="plane.gif" alt="plane">
</div>
<script language="javascript">
var x = 5; //Starting Location - left
var y = 5; //Starting Location - top
var dest_x = 300;  //Ending Location - left
var dest_y = 100;  //Ending Location - top
var interval = 10; //Move 10px every initialization

function moveImage() {
	//Keep on moving the image till the target is achieved
	if(x<dest_x) x = x + interval; 
	if(y<dest_y) y = y + interval;
	
	//Move the image to the new location
	document.getElementById("hey").style.top  = y+'px';
	document.getElementById("hey").style.left = x+'px';

	if ((x+interval < dest_x) && (y+interval < dest_y)) {
		//Keep on calling this function every 100 microsecond 
		//	till the target location is reached
		window.setTimeout('moveImage()',100);
	}
}
</script>