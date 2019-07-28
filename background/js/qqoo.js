//用户登陆时判断用户是否输入内容
function check()
{
	if(document.getElementById("username").value=="")
	{
		alert("用户名不能为空");
		return false;
	}
	if(document.getElementById("passwd").value=="")
	{
		alert("密码不能为空");
		return false;
	}
	
    if(document.getElementById("username"))
    {
    	alert("请不要输入特殊字符")
    }
	
	return true;
	
}
//跳转到ftp资源站点
function ftpconon()
{
	window.location="ftp://101.132.67.176";
}

function stripscript(s) {
    var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]")
        var rs = "";
    for (var i = 0; i < s.length; i++) {
        rs = rs + s.substr(i, 1).replace(pattern, '');
    }
    alert(rs+"请输入正确的")
    return rs;
}


/*鼠标特效 */
	  /*这个方法用来随机一个十六进制颜色代码，让每一次点击浮动文字的杨色不同*/
	  function co(){
	        var colorElements = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f";
	    var colorArray = colorElements.split(",");
	    var color ="#";
	    for(var i =0;i<6;i++){
	    color+=colorArray[Math.floor(Math.random()*16)];
	    }
	    return color;
	};
	
