# Kmeans-
Kmeans in Delphi

Example: 128 twopixel clusters.

-------------------------------------------------------
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">procedure</span> <span style="color: #BB0066; font-weight: bold">TForm1</span><span style="color: #333333">.</span><span style="color: #0066BB; font-weight: bold">Button1Click</span>(Sender<span style="color: #333333">:</span> <span style="color: #333399; font-weight: bold">TObject</span>)<span style="color: #333333">;</span>
<span style="color: #008800; font-weight: bold">var</span>
  x<span style="color: #333333">,</span>y<span style="color: #333333">,</span>grey<span style="color: #333333">,</span>width<span style="color: #333333">,</span>height<span style="color: #333333">:</span><span style="color: #333399; font-weight: bold">integer</span><span style="color: #333333">;</span>
  kmeans<span style="color: #333333">:</span>TKmeans <span style="color: #333333">;</span>
  values<span style="color: #333333">:</span>TArrayOfDouble<span style="color: #333333">;</span>
  NCanvas<span style="color: #333333">:</span>Tncanvas<span style="color: #333333">;</span>
  clusterdata1<span style="color: #333333">,</span>Clusterdata2<span style="color: #333333">:</span>TMultiDouble <span style="color: #333333">;</span>
<span style="color: #008800; font-weight: bold">begin</span>
  Image1<span style="color: #333333">.</span>Picture<span style="color: #333333">.</span>Bitmap<span style="color: #333333">.</span>LoadFromFile(<span style="background-color: #fff0f0">&#39;Kawasaki_Valencia_2007_09_160x120 - grey.bmp&#39;</span>)<span style="color: #333333">;</span>
 <span style="color: #888888">//Image1.Picture.Bitmap.LoadFromFile(&#39;C:\Users\admin\Desktop\IMG_20170609_160214242.bmp&#39;);</span>
  height<span style="color: #333333">:=</span>Image1<span style="color: #333333">.</span>Picture<span style="color: #333333">.</span>Bitmap<span style="color: #333333">.</span>Height<span style="color: #333333">;</span>
  width<span style="color: #333333">:=</span>Image1<span style="color: #333333">.</span>Picture<span style="color: #333333">.</span>Bitmap<span style="color: #333333">.</span>width<span style="color: #333333">;</span>
  kmeans<span style="color: #333333">:=</span>TKmeans<span style="color: #333333">.</span>Create(height<span style="color: #333333">*</span>width <span style="color: #008800; font-weight: bold">div</span> <span style="color: #0000DD; font-weight: bold">2</span><span style="color: #333333">,</span><span style="color: #0000DD; font-weight: bold">2</span><span style="color: #333333">,</span><span style="color: #0000DD; font-weight: bold">128</span>)<span style="color: #333333">;</span>
  NCanvas<span style="color: #333333">:=</span>TNCanvas( Image1<span style="color: #333333">.</span>Picture<span style="color: #333333">.</span>Bitmap<span style="color: #333333">.</span>Canvas)<span style="color: #333333">;</span>
  <span style="color: #008800; font-weight: bold">for</span> y<span style="color: #333333">:=</span><span style="color: #0000DD; font-weight: bold">0</span> <span style="color: #008800; font-weight: bold">to</span> height<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span> <span style="color: #008800; font-weight: bold">do</span>
  <span style="color: #008800; font-weight: bold">begin</span>
    <span style="color: #008800; font-weight: bold">for</span> x<span style="color: #333333">:=</span><span style="color: #0000DD; font-weight: bold">0</span> <span style="color: #008800; font-weight: bold">to</span> (Width <span style="color: #008800; font-weight: bold">div</span> <span style="color: #0000DD; font-weight: bold">2</span>)<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span> <span style="color: #008800; font-weight: bold">do</span>
    <span style="color: #008800; font-weight: bold">begin</span>
     <span style="color: #008800; font-weight: bold">with</span> NCanvas <span style="color: #008800; font-weight: bold">do</span>
     <span style="color: #008800; font-weight: bold">begin</span>
       moveto(x<span style="color: #333333">*</span><span style="color: #0000DD; font-weight: bold">2</span><span style="color: #333333">,</span>y)<span style="color: #333333">;</span>
        kmeans<span style="color: #333333">.</span>setValue(x<span style="color: #333333">+</span>y<span style="color: #333333">*</span>Width <span style="color: #008800; font-weight: bold">div</span> <span style="color: #0000DD; font-weight: bold">2</span><span style="color: #333333">,</span>[
        getpixel2(<span style="color: #0000DD; font-weight: bold">0</span><span style="color: #333333">,</span><span style="color: #0000DD; font-weight: bold">0</span>) <span style="color: #008800; font-weight: bold">and</span> <span style="color: #0000DD; font-weight: bold">255</span><span style="color: #333333">,</span>
        getpixel2(<span style="color: #0000DD; font-weight: bold">1</span><span style="color: #333333">,</span><span style="color: #0000DD; font-weight: bold">0</span>) <span style="color: #008800; font-weight: bold">and</span> <span style="color: #0000DD; font-weight: bold">255</span>]
       )<span style="color: #333333">;</span>
     <span style="color: #008800; font-weight: bold">end</span><span style="color: #333333">;</span>
    <span style="color: #008800; font-weight: bold">end</span><span style="color: #333333">;</span>
  <span style="color: #008800; font-weight: bold">end</span><span style="color: #333333">;</span>
  <span style="color: #888888">// initialize</span>
  kmeans<span style="color: #333333">.</span>doKmeans(<span style="color: #0000DD; font-weight: bold">40</span><span style="color: #333333">,</span><span style="color: #0000DD; font-weight: bold">5000</span>) <span style="color: #333333">;</span>
  label1<span style="color: #333333">.</span>Caption<span style="color: #333333">:=</span><span style="color: #007020">floattostr</span>(error)<span style="color: #333333">;</span>
  grey<span style="color: #333333">:=</span>(<span style="color: #0000DD; font-weight: bold">1</span><span style="color: #333333">+</span><span style="color: #0000DD; font-weight: bold">256</span><span style="color: #333333">+</span><span style="color: #0000DD; font-weight: bold">65536</span>)<span style="color: #333333">;</span>
  <span style="color: #008800; font-weight: bold">for</span> y<span style="color: #333333">:=</span><span style="color: #0000DD; font-weight: bold">0</span> <span style="color: #008800; font-weight: bold">to</span> height<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span> <span style="color: #008800; font-weight: bold">do</span>
  <span style="color: #008800; font-weight: bold">begin</span>
    <span style="color: #008800; font-weight: bold">for</span> x<span style="color: #333333">:=</span><span style="color: #0000DD; font-weight: bold">0</span> <span style="color: #008800; font-weight: bold">to</span> (Width <span style="color: #008800; font-weight: bold">div</span> <span style="color: #0000DD; font-weight: bold">2</span>)<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span> <span style="color: #008800; font-weight: bold">do</span>
    <span style="color: #008800; font-weight: bold">begin</span>
     <span style="color: #008800; font-weight: bold">with</span> NCanvas <span style="color: #008800; font-weight: bold">do</span>
     <span style="color: #008800; font-weight: bold">begin</span>
       moveto(x<span style="color: #333333">*</span><span style="color: #0000DD; font-weight: bold">2</span><span style="color: #333333">,</span>y)<span style="color: #333333">;</span>
       values<span style="color: #333333">:=</span> kmeans<span style="color: #333333">.</span>getValue(x<span style="color: #333333">+</span>y<span style="color: #333333">*</span>Width <span style="color: #008800; font-weight: bold">div</span> <span style="color: #0000DD; font-weight: bold">2</span>)<span style="color: #333333">;</span>
       setpixel2(<span style="color: #0000DD; font-weight: bold">0</span><span style="color: #333333">,</span><span style="color: #0000DD; font-weight: bold">0</span><span style="color: #333333">,</span><span style="color: #007020">round</span>(values[<span style="color: #0000DD; font-weight: bold">0</span>])<span style="color: #333333">*</span>grey)<span style="color: #333333">;</span>
       setpixel2(<span style="color: #0000DD; font-weight: bold">1</span><span style="color: #333333">,</span><span style="color: #0000DD; font-weight: bold">0</span><span style="color: #333333">,</span><span style="color: #007020">round</span>(values[<span style="color: #0000DD; font-weight: bold">1</span>])<span style="color: #333333">*</span>grey)<span style="color: #333333">;</span>
     <span style="color: #008800; font-weight: bold">end</span><span style="color: #333333">;</span>
    <span style="color: #008800; font-weight: bold">end</span><span style="color: #333333">;</span>
  <span style="color: #008800; font-weight: bold">end</span><span style="color: #333333">;</span>
<span style="color: #008800; font-weight: bold">end</span><span style="color: #333333">;</span>
</pre></div>
