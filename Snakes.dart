#import('dart:html');

num posx=0,posy=0;
num x=0;
num flag=3,fl=0;
double bonusx,bonusy;
num score=0;
CanvasRenderingContext2D ctx;
void draw()
{
  ctx.clearRect(0, 0, 450, 300);
  ctx.fillStyle="#FF0000";
  ctx.fillRect(posx*10,posy*10,10,10);
  ctx.fillStyle="#FFFF00";
  ctx.fillRect(bonusx*10,bonusy*10,10,10);
  var ms = document.query("#msg");
  ms.innerHTML="SCORE: "+score.toString();
}

void func()
{
switch(flag)
{
case 1: 
            posx--;
            draw();
            break;
case 2:  
            posx++;
            draw();
            break;
case 3:  
            posy++;
            draw();   
            break;
case 4:  
            posy--;
            draw();  
            break;
}
if(((posx==bonusx && posy==bonusy)) && fl==0)
{
  bonusx = ((Math.random() * 100 ).floor() % 46);
  bonusy=(Math.random() * 100 ).floor() % 31;

  score+=10;
x+=5;
}
//document.on.keyDown
if(posx<0 || posx>=46 || posy<0 || posy>=31)
{ 
 var msg_score = document.query("#msg");
fl=1;
 msg_score.innerHTML = "Thank you for playing the game.<br /> Your Score : <b>"+score+"</b><br /><br /><input type='button' value='Play Again' id='play' />";
 document.query("#play").on.click.add((Event e){
   //window.location.reload();
   print("hi");
 });
 document.query("#playArea").style.display = 'none';
 window.clearInterval(value);
}
}
var value;
void main()
{
   
  CanvasElement canvas = document.query("#playArea");

  ctx = canvas.getContext("2d");
  bonusx = ((Math.random() * 100 ).floor() % 46);
  bonusy=(Math.random() * 100 ).floor() % 31;

value=window.setInterval(func,70-x);
if(fl==0)
{
document.on.keyDown.add((Event e){
  KeyboardEvent ke=e;
  //print(ke.keyIdentifier);
  if (ke.keyIdentifier=="U+0061" ||ke.keyIdentifier=="U+0041")
  {
  posx--;
  draw();
  flag=1;
  }
  else if (ke.keyIdentifier=="U+0064" ||ke.keyIdentifier=="U+0044")
  {
  posx++;
  draw();
  flag=2;
  }
  else if (ke.keyIdentifier=="U+0053" ||ke.keyIdentifier=="U+0073")
  {
  posy++;
  draw();
  flag=3;
  }
  else if (ke.keyIdentifier=="U+0077" ||ke.keyIdentifier=="U+0057")
  {
  posy--;
  draw();
  flag=4;
  }
 
});
}

}