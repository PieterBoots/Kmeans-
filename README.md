# Kmeans-
Kmeans in Delphi

Example: 128 twopixel clusters.

-------------------------------------------------------
<pre style='color:#000000;background:#ffffff;'><span style='color:#800000; font-weight:bold; '>procedure</span> TForm1<span style='color:#808030; '>.</span>Button1Click<span style='color:#808030; '>(</span>Sender<span style='color:#808030; '>:</span> TObject<span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
<span style='color:#800000; font-weight:bold; '>var</span>
  x<span style='color:#808030; '>,</span>y<span style='color:#808030; '>,</span>grey<span style='color:#808030; '>,</span>width<span style='color:#808030; '>,</span>height<span style='color:#808030; '>:</span><span style='color:#bb7977; '>integer</span><span style='color:#800080; '>;</span>
  kmeans<span style='color:#808030; '>:</span>TKmeans <span style='color:#800080; '>;</span>
  values<span style='color:#808030; '>:</span>TArrayOfDouble<span style='color:#800080; '>;</span>
  NCanvas<span style='color:#808030; '>:</span>Tncanvas<span style='color:#800080; '>;</span>
  clusterdata1<span style='color:#808030; '>,</span>Clusterdata2<span style='color:#808030; '>:</span>TMultiDouble <span style='color:#800080; '>;</span>
<span style='color:#800000; font-weight:bold; '>begin</span>
  Image1<span style='color:#808030; '>.</span>Picture<span style='color:#808030; '>.</span>Bitmap<span style='color:#808030; '>.</span>LoadFromFile<span style='color:#808030; '>(</span><span style='color:#0000e6; '>'Kawasaki_Valencia_2007_09_160x120 - grey.bmp'</span><span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
 <span style='color:#696969; '>//Image1.Picture.Bitmap.LoadFromFile('C:\Users\admin\Desktop\IMG_20170609_160214242.bmp');</span>
  height<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span>Image1<span style='color:#808030; '>.</span>Picture<span style='color:#808030; '>.</span>Bitmap<span style='color:#808030; '>.</span>Height<span style='color:#800080; '>;</span>
  width<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span>Image1<span style='color:#808030; '>.</span>Picture<span style='color:#808030; '>.</span>Bitmap<span style='color:#808030; '>.</span>width<span style='color:#800080; '>;</span>
  kmeans<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span>TKmeans<span style='color:#808030; '>.</span>Create<span style='color:#808030; '>(</span>height<span style='color:#808030; '>*</span>width <span style='color:#800000; font-weight:bold; '>div</span> <span style='color:#008c00; '>2</span><span style='color:#808030; '>,</span><span style='color:#008c00; '>2</span><span style='color:#808030; '>,</span><span style='color:#008c00; '>128</span><span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
  NCanvas<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span>TNCanvas<span style='color:#808030; '>(</span> Image1<span style='color:#808030; '>.</span>Picture<span style='color:#808030; '>.</span>Bitmap<span style='color:#808030; '>.</span>Canvas<span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
  <span style='color:#800000; font-weight:bold; '>for</span> y<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span><span style='color:#008c00; '>0</span> <span style='color:#800000; font-weight:bold; '>to</span> height<span style='color:#808030; '>-</span><span style='color:#008c00; '>1</span> <span style='color:#800000; font-weight:bold; '>do</span>
  <span style='color:#800000; font-weight:bold; '>begin</span>
    <span style='color:#800000; font-weight:bold; '>for</span> x<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span><span style='color:#008c00; '>0</span> <span style='color:#800000; font-weight:bold; '>to</span> <span style='color:#808030; '>(</span>Width <span style='color:#800000; font-weight:bold; '>div</span> <span style='color:#008c00; '>2</span><span style='color:#808030; '>)</span><span style='color:#808030; '>-</span><span style='color:#008c00; '>1</span> <span style='color:#800000; font-weight:bold; '>do</span>
    <span style='color:#800000; font-weight:bold; '>begin</span>
     <span style='color:#800000; font-weight:bold; '>with</span> NCanvas <span style='color:#800000; font-weight:bold; '>do</span>
     <span style='color:#800000; font-weight:bold; '>begin</span>
       moveto<span style='color:#808030; '>(</span>x<span style='color:#808030; '>*</span><span style='color:#008c00; '>2</span><span style='color:#808030; '>,</span>y<span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
        kmeans<span style='color:#808030; '>.</span>setValue<span style='color:#808030; '>(</span>x<span style='color:#808030; '>+</span>y<span style='color:#808030; '>*</span>Width <span style='color:#800000; font-weight:bold; '>div</span> <span style='color:#008c00; '>2</span><span style='color:#808030; '>,</span><span style='color:#808030; '>[</span>
        getpixel2<span style='color:#808030; '>(</span><span style='color:#008c00; '>0</span><span style='color:#808030; '>,</span><span style='color:#008c00; '>0</span><span style='color:#808030; '>)</span> <span style='color:#800000; font-weight:bold; '>and</span> <span style='color:#008c00; '>255</span><span style='color:#808030; '>,</span>
        getpixel2<span style='color:#808030; '>(</span><span style='color:#008c00; '>1</span><span style='color:#808030; '>,</span><span style='color:#008c00; '>0</span><span style='color:#808030; '>)</span> <span style='color:#800000; font-weight:bold; '>and</span> <span style='color:#008c00; '>255</span><span style='color:#808030; '>]</span>
       <span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
     <span style='color:#800000; font-weight:bold; '>end</span><span style='color:#800080; '>;</span>
    <span style='color:#800000; font-weight:bold; '>end</span><span style='color:#800080; '>;</span>
  <span style='color:#800000; font-weight:bold; '>end</span><span style='color:#800080; '>;</span>
  <span style='color:#696969; '>// initialize</span>
  kmeans<span style='color:#808030; '>.</span>doKmeans<span style='color:#808030; '>(</span><span style='color:#008c00; '>40</span><span style='color:#808030; '>,</span><span style='color:#008c00; '>5000</span><span style='color:#808030; '>)</span> <span style='color:#800080; '>;</span>
  label1<span style='color:#808030; '>.</span>Caption<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span>floattostr<span style='color:#808030; '>(</span>error<span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
  grey<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span><span style='color:#808030; '>(</span><span style='color:#008c00; '>1</span><span style='color:#808030; '>+</span><span style='color:#008c00; '>256</span><span style='color:#808030; '>+</span><span style='color:#008c00; '>65536</span><span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
  <span style='color:#800000; font-weight:bold; '>for</span> y<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span><span style='color:#008c00; '>0</span> <span style='color:#800000; font-weight:bold; '>to</span> height<span style='color:#808030; '>-</span><span style='color:#008c00; '>1</span> <span style='color:#800000; font-weight:bold; '>do</span>
  <span style='color:#800000; font-weight:bold; '>begin</span>
    <span style='color:#800000; font-weight:bold; '>for</span> x<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span><span style='color:#008c00; '>0</span> <span style='color:#800000; font-weight:bold; '>to</span> <span style='color:#808030; '>(</span>Width <span style='color:#800000; font-weight:bold; '>div</span> <span style='color:#008c00; '>2</span><span style='color:#808030; '>)</span><span style='color:#808030; '>-</span><span style='color:#008c00; '>1</span> <span style='color:#800000; font-weight:bold; '>do</span>
    <span style='color:#800000; font-weight:bold; '>begin</span>
     <span style='color:#800000; font-weight:bold; '>with</span> NCanvas <span style='color:#800000; font-weight:bold; '>do</span>
     <span style='color:#800000; font-weight:bold; '>begin</span>
       moveto<span style='color:#808030; '>(</span>x<span style='color:#808030; '>*</span><span style='color:#008c00; '>2</span><span style='color:#808030; '>,</span>y<span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
       values<span style='color:#808030; '>:</span><span style='color:#808030; '>=</span> kmeans<span style='color:#808030; '>.</span>getValue<span style='color:#808030; '>(</span>x<span style='color:#808030; '>+</span>y<span style='color:#808030; '>*</span>Width <span style='color:#800000; font-weight:bold; '>div</span> <span style='color:#008c00; '>2</span><span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
       setpixel2<span style='color:#808030; '>(</span><span style='color:#008c00; '>0</span><span style='color:#808030; '>,</span><span style='color:#008c00; '>0</span><span style='color:#808030; '>,</span>round<span style='color:#808030; '>(</span>values<span style='color:#808030; '>[</span><span style='color:#008c00; '>0</span><span style='color:#808030; '>]</span><span style='color:#808030; '>)</span><span style='color:#808030; '>*</span>grey<span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
       setpixel2<span style='color:#808030; '>(</span><span style='color:#008c00; '>1</span><span style='color:#808030; '>,</span><span style='color:#008c00; '>0</span><span style='color:#808030; '>,</span>round<span style='color:#808030; '>(</span>values<span style='color:#808030; '>[</span><span style='color:#008c00; '>1</span><span style='color:#808030; '>]</span><span style='color:#808030; '>)</span><span style='color:#808030; '>*</span>grey<span style='color:#808030; '>)</span><span style='color:#800080; '>;</span>
     <span style='color:#800000; font-weight:bold; '>end</span><span style='color:#800080; '>;</span>
    <span style='color:#800000; font-weight:bold; '>end</span><span style='color:#800080; '>;</span>
  <span style='color:#800000; font-weight:bold; '>end</span><span style='color:#800080; '>;</span>
<span style='color:#800000; font-weight:bold; '>end</span><span style='color:#800080; '>;</span>
</pre>
