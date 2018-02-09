unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,Kmeans,NCanvas,
  Vcl.Imaging.jpeg;

  type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  x,y,grey,width,height:integer;
  kmeans:TKmeans ;
  values:TArrayOfDouble;
  NCanvas:Tncanvas;
  clusterdata1,Clusterdata2:TMultiDouble ;
begin

  Image1.Picture.Bitmap.LoadFromFile('Kawasaki_Valencia_2007_09_160x120 - grey.bmp');
 //Image1.Picture.Bitmap.LoadFromFile('C:\Users\admin\Desktop\IMG_20170609_160214242.bmp');
  height:=Image1.Picture.Bitmap.Height;
  width:=Image1.Picture.Bitmap.width;

  kmeans:=TKmeans.Create(height*width div 8,8,128);

  NCanvas:=TNCanvas( Image1.Picture.Bitmap.Canvas);
  for y:=0 to (height div 2)-1 do
  begin
    for x:=0 to (Width div 4)-1 do
    begin
     with NCanvas do
     begin
       moveto(x*4,y*2);
        kmeans.setValue(x+y*Width div 4,[
        getpixel2(0,0) and 255,
        getpixel2(1,0) and 255,
        getpixel2(2,0) and 255,
        getpixel2(3,0) and 255,
        getpixel2(0,1) and 255,
        getpixel2(1,1) and 255,
        getpixel2(2,1) and 255,
        getpixel2(3,1) and 255]
       );
     end;
    end;
  end;
  // initialize
  kmeans.doKmeans(40,5000) ;
  label1.Caption:=floattostr(error);
  grey:=(1+256+65536);
  for y:=0 to height div 2-1 do
  begin
    for x:=0 to Width div 4-1 do
    begin
     with  NCanvas do
     begin
       moveto(x*4,y*2);
       values:= kmeans.getValue(x+y*Width div 4);
       setpixel2(0,0,round(values[0])*grey);
       setpixel2(1,0,round(values[1])*grey);
       setpixel2(2,0,round(values[2])*grey);
       setpixel2(3,0,round(values[3])*grey);
       setpixel2(0,1,round(values[4])*grey);
       setpixel2(1,1,round(values[5])*grey);
       setpixel2(2,1,round(values[6])*grey);
       setpixel2(3,1,round(values[7])*grey);
     end;
    end;
  end;

  clusterdata1:= kmeans.getClusterData(0);
  Clusterdata2:=kmeans.getClusterData(1);
  ShowMessage(inttostr(length(clusterdata1)));
  ShowMessage(inttostr(length(clusterdata2)));
 ShowMessage(inttostr(length(clusterdata2)+length(clusterdata1)));
end;


end.
