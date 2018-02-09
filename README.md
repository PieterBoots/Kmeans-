# Kmeans-
Kmeans in Delphi

Example: 128 twopixel clusters.

-------------------------------------------------------
procedure TForm1.Button1Click(Sender: TObject);
var
  x,y,grey,width,height:integer;
  kmeans:TKmeans ;
  values:TArrayOfDouble;
  NCanvas:Tncanvas;
  clusterdata1,Clusterdata2:TMultiDouble ;
begin
  Image1.Picture.Bitmap.LoadFromFile('Kawasaki_Valencia_2007_09_160x120 - grey.bmp');
  height:=Image1.Picture.Bitmap.Height;
  width:=Image1.Picture.Bitmap.width;
  kmeans:=TKmeans.Create(height*width div 2,2,128);
  NCanvas:=TNCanvas( Image1.Picture.Bitmap.Canvas);
  for y:=0 to height-1 do
  begin
    for x:=0 to (Width div 2)-1 do
    begin
     with NCanvas do
     begin
       moveto(x*2,y);
        kmeans.setValue(x+y*Width div 2,[
        getpixel2(0,0) and 255,
        getpixel2(1,0) and 255]
       );
     end;
    end;
  end;
  // initialize
  kmeans.doKmeans(40,5000) ;
  label1.Caption:=floattostr(error);
  grey:=(1+256+65536);
  for y:=0 to height-1 do
  begin
    for x:=0 to (Width div 2)-1 do
    begin
     with NCanvas do
     begin
       moveto(x*2,y);
       values:= kmeans.getValue(x+y*Width div 2);
       setpixel2(0,0,round(values[0])*grey);
       setpixel2(1,0,round(values[1])*grey);
     end;
    end;
  end;
end;
