# Kmeans-
Kmeans in Delphi

Example: 128 twopixel clusters.

-------------------------------------------------------
procedure TForm1.Button1Click(Sender: TObject); <br>
var <br>
  x,y,grey,width,height:integer; <br>
  kmeans:TKmeans ; <br>
  values:TArrayOfDouble; <br>
  NCanvas:Tncanvas; <br>
  clusterdata1,Clusterdata2:TMultiDouble ; <br>
begin <br>
  Image1.Picture.Bitmap.LoadFromFile('Kawasaki_Valencia_2007_09_160x120 - grey.bmp'); <br>
  height:=Image1.Picture.Bitmap.Height; <br>
  width:=Image1.Picture.Bitmap.width; <br>
  kmeans:=TKmeans.Create(height*width div 2,2,128); <br>
  NCanvas:=TNCanvas( Image1.Picture.Bitmap.Canvas); <br>
  for y:=0 to height-1 do <br>
  begin <br>
    for x:=0 to (Width div 2)-1 do <br>
    begin <br>
     with NCanvas do <br>
     begin <br>
       moveto(x*2,y); <br>
        kmeans.setValue(x+y*Width div 2,[ <br>
        getpixel2(0,0) and 255, <br>
        getpixel2(1,0) and 255] <br>
       ); <br>
     end; <br>
    end; <br>
  end; <br>
  // initialize <br>
  kmeans.doKmeans(40,5000) ; <br>
  label1.Caption:=floattostr(error); <br>
  grey:=(1+256+65536); <br>
  for y:=0 to height-1 do <br>
  begin <br>
    for x:=0 to (Width div 2)-1 do <br>
    begin <br>
     with NCanvas do <br>
     begin <br>
       moveto(x*2,y); <br>
       values:= kmeans.getValue(x+y*Width div 2); <br>
       setpixel2(0,0,round(values[0])*grey); <br>
       setpixel2(1,0,round(values[1])*grey); <br>
     end; <br>
    end; <br>
  end; <br>
end; <br>
