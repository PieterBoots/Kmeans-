unit NCanvas;



interface

uses Graphics;

type

  TNCanvas = class(TCanvas)
  private
  public

    procedure setpixel2(x,y,value:integer);
    function  getpixel2(x,y:integer):integer;
  end;

implementation



 procedure TNCanvas.setpixel2(x,y,value:integer);
 begin
   Pixels[x+PenPos.x,y+penpos.y]:=value;
 end;

 function TNCanvas.getpixel2(x,y:integer):integer;
 begin
   result:=Pixels[x+PenPos.x,y+penpos.y];
 end;


end.
