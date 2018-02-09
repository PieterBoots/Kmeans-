# Kmeans-
Kmeans in Delphi

Example: 128 twopixel clusters.

-------------------------------------------------------
<p><span style="font-family:Arial,Helvetica,sans-serif">procedure TForm1.Button1Click(Sender: TObject);<br />
var<br />
&nbsp; x,y,grey,width,height:integer;<br />
&nbsp; kmeans:TKmeans ;<br />
&nbsp; values:TArrayOfDouble;<br />
&nbsp; NCanvas:Tncanvas;<br />
&nbsp; clusterdata1,Clusterdata2:TMultiDouble ;<br />
begin<br />
&nbsp; Image1.Picture.Bitmap.LoadFromFile(&#39;Kawasaki_Valencia_2007_09_160x120 - grey.bmp&#39;);<br />
&nbsp; height:=Image1.Picture.Bitmap.Height;<br />
&nbsp; width:=Image1.Picture.Bitmap.width;<br />
&nbsp; kmeans:=TKmeans.Create(height*width div 2,2,128);<br />
&nbsp; NCanvas:=TNCanvas( Image1.Picture.Bitmap.Canvas);<br />
&nbsp; for y:=0 to height-1 do<br />
&nbsp; begin<br />
&nbsp; &nbsp; for x:=0 to (Width div 2)-1 do<br />
&nbsp; &nbsp; begin<br />
&nbsp; &nbsp; &nbsp;with NCanvas do<br />
&nbsp; &nbsp; &nbsp;begin<br />
&nbsp; &nbsp; &nbsp; &nbsp;moveto(x*2,y);<br />
&nbsp; &nbsp; &nbsp; &nbsp; kmeans.setValue(x+y*Width div 2,[<br />
&nbsp; &nbsp; &nbsp; &nbsp; getpixel2(0,0) and 255,<br />
&nbsp; &nbsp; &nbsp; &nbsp; getpixel2(1,0) and 255]<br />
&nbsp; &nbsp; &nbsp; &nbsp;);<br />
&nbsp; &nbsp; &nbsp;end;<br />
&nbsp; &nbsp; end;<br />
&nbsp; end;<br />
&nbsp; // initialize<br />
&nbsp; kmeans.doKmeans(40,5000) ;<br />
&nbsp; label1.Caption:=floattostr(error);<br />
&nbsp; grey:=(1+256+65536);<br />
&nbsp; for y:=0 to height-1 do<br />
&nbsp; begin<br />
&nbsp; &nbsp; for x:=0 to (Width div 2)-1 do<br />
&nbsp; &nbsp; begin<br />
&nbsp; &nbsp; &nbsp;with NCanvas do<br />
&nbsp; &nbsp; &nbsp;begin<br />
&nbsp; &nbsp; &nbsp; &nbsp;moveto(x*2,y);<br />
&nbsp; &nbsp; &nbsp; &nbsp;values:= kmeans.getValue(x+y*Width div 2);<br />
&nbsp; &nbsp; &nbsp; &nbsp;setpixel2(0,0,round(values[0])*grey);<br />
&nbsp; &nbsp; &nbsp; &nbsp;setpixel2(1,0,round(values[1])*grey);<br />
&nbsp; &nbsp; &nbsp;end;<br />
&nbsp; &nbsp; end;<br />
&nbsp; end;<br />
end;</span></p>

