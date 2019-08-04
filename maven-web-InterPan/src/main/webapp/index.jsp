<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>InterPan</title>
<!--标题图片-->
<link rel="icon" sizes="any" mask="" href="img/pan.ico">
<!--bootstap引用-->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<!--自定义css引用-->
<link rel="stylesheet" type="text/css" href="css/qqoo.css"/>
<!--vue链接使用-->
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<!--本地vue-->
<script src="js/vue.min.js"></script>
<!--本地js效果-->
<script src="js/qqoo.js"></script>
<!--jquery引用-->
<script src="js/swiper-3.4.2.jquery.min.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
</head>


<body>
<canvas id="canv"></canvas>

<!--脚本部分-->
<script type="text/javascript">
  var canvas = document.querySelector("canvas");
  var c = canvas.getContext('2d');

  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;

  var mouse = {
    x: canvas.width / 2,
    y: canvas.height / 2 
  }

  window.addEventListener("resize", function() {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;		
  });

  window.addEventListener("mousemove", function(e) {
    mouse.x = e.clientX;	
    mouse.y = e.clientY;	
  });

  var colors = [
    {r: 255, g: 71, b: 71},
    {r: 0, g: 206, b: 237},
    {r: 255, g: 255, b: 255}
  ];

  function Particle(x, y, dx, dy, r, ttl) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.r = r;
    this.opacity = 1;
    this.shouldRemove = false;
    this.timeToLive = ttl;
    this.randomColor = Math.floor(Math.random() * colors.length);


    this.update = function() {
      this.x += this.dx
      this.y += this.dy

      if (this.x + this.r >= canvas.width || this.x - this.r <= 0)
          this.dx = -this.dx

      if (this.y + this.r >= canvas.height || this.y - this.r <= 0)
          this.dy = -this.dy

      // Ensure that particles cannot be spawned past canvas boundaries
      this.x = Math.min(Math.max(this.x, 0 + this.r), canvas.width - this.r)
      this.y = Math.min(Math.max(this.y, 0 + this.r), canvas.height - this.r)

      c.beginPath()
      c.arc(this.x, this.y, this.r, 0, Math.PI * 2, false)
      c.strokeStyle =
          'rgba(' +
          colors[this.randomColor].r +
          ',' +
          colors[this.randomColor].g +
          ',' +
          colors[this.randomColor].b +
          ',' +
          this.opacity +
          ')'
      c.fillStyle =
          'rgba(' +
          colors[this.randomColor].r +
          ',' +
          colors[this.randomColor].g +
          ',' +
          colors[this.randomColor].b +
          ',' +
          this.opacity +
          ')'
      c.stroke()
      c.closePath()

      this.opacity -= 1 / (ttl / 0.1)
      this.r -= r / (ttl / 0.1)

      if (this.r < 0) this.r = 0 // Thank you Akash for the conditional!

      this.timeToLive -= 0.1
  }


    this.remove = function() {
      // If timeToLive expires, return a true value.
      // This signifies that the particle should be removed from the scene.
      return this.timeToLive <= 0;
    }
  }

  function Explosion(x, y) {
    this.particles = [];	

    this.init = function() {
      for (var i = 1; i <= 1; i++) {
        var randomVelocity = {
          x: (Math.random() - 0.5) * 3.5,
          y: (Math.random() - 0.5) * 3.5,
        }
        this.particles.push(new Particle(x, y, randomVelocity.x, randomVelocity.y, 30, 8));				
      }
    }

    this.init();

    this.draw = function() {
      for (var i = 0; i < this.particles.length; i++) {
        this.particles[i].update();	

        if (this.particles[i].remove() == true) {
          this.particles.splice(i, 1);	
        };
      }	
    }
  }

  var explosions = [];

  function animate() {
    window.requestAnimationFrame(animate);

    c.fillStyle = "#1e1e1e";
    c.fillRect(0, 0, canvas.width, canvas.height);

    explosions.push(new Explosion(mouse.x, mouse.y));

    for (var i = 0; i < explosions.length; i++) {
      explosions[i].draw();
    }
  }
  animate();
</script>
<!--脚本部分-->
<!--点击字体显示效果-->
<script type="text/javascript">
	
	var a_idx = 0;
	$(document).ready(function(){
	$("body").click(function(e) {
	    /*这个数组中的每一个字符是你要浮动显示的词或句子，每次点击鼠标后按顺序出现*/
	   var a = new Array("❤富强❤", "❤民主❤", "❤文明❤", "❤和谐❤", "❤自由❤", "❤平等❤", "❤公正❤" ,"❤法治❤", "❤爱国❤", "❤敬业❤", "❤诚信❤", "❤友善❤");
	    var $i = $("<span></6>").text(a[a_idx]);
	    a_idx = (a_idx + 1) % a.length;
	    var x = e.pageX,
	    y = e.pageY;
	    $i.css({
	         "z-index": 999999,
	        "top": y - 20,
	        "left": x,
	        "position": "absolute",
	        "font-weight": "bold",
	        "color": co(),
               "font-size":"20px"
	    });
	    $("body").append($i);
	    $i.animate({
	        "top": y - 180,
	        "opacity": 0
	    },
	    1500,
	    function() {
	        $i.remove();
	    });
	});
	});
	
	
</script>
<!--个人代码编写部分-->


<!--外框架部分 隐式显示背景图片-->
<div id="outside">
	<!--登陆窗体部分-->
	<div id="loginpanel">

			<form action="" method="post">			
			<table style="margin:0 auto;" border="0" >
      <tr>
     	<td colspan="2"><p class="text-center" title="一切都是新的 都是未知 让我们一起去探索吧！" onclick="ftpconon()">萌新网盘</p> </td>
     </tr>
     <tr>
     	<td title="系统会自动判断你是否注册，若注则会进行登录，若没有，会带你去注册">用户名：</td>
     	<td ><input id="username" type="text" title="请输入用户名"/> </td>
     </tr>
     <tr>
     	<td>密码：</td>
     	<td><input id="passwd" type="password" title="请输入密码"/> </td>
     </tr>
     
     <tr>
     	<td colspan="2"><input id="login" type="button" value="登陆" title="点击登陆" onclick="return check()"/></td>
     </tr>
		</table>
     	</form>		
	
		
	</div>
		<!--登陆窗体部分-->
</div>
<!--外框架部门 隐式显示背景图片-->

    



<!--个人代码编写部分-->
</body>
</html>
