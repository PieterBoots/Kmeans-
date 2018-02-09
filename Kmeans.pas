unit Kmeans;

interface

type
  TMultiDouble = array of array of double;
  TArrayOfDouble =  array of double;


   TKmeans = class
  private
    { Private declarations }
    totals:array of array of double;
    counts:array of integer;
    Datalength:LongInt;
    DataDimensions:integer;
    multiArray:TMultiDouble;
  public
    Centroids : TMultiDouble;
    GroupTo:array of integer;
    Clusters:integer;
   constructor create(aDatalength:Integer;aDataDimensions:Integer;aClusters:integer);
   function  doKmeans(iteration:integer;NSamples:integer=0):TMultiDouble ;
   procedure setValue(itemposition:integer;Value:array of double);
   function  getValue(aPosition:integer):TArrayOfDouble;
   function  getClusterData(CentroidIndex:integer):TMultiDouble ;

    { Public declarations }
  end;

implementation

function  TKmeans.getClusterData(CentroidIndex:integer):TMultiDouble ;
var i,j,dim:integer;
    Clusterdata:TMultiDouble ;
begin
  j:=0;
  for i:=0 to datalength-1 do
  begin
     if groupto[i]=CentroidIndex then
     begin
       j:=j+1;
     end;
  end;
  setlength(Clusterdata,j);
  j:=0;
  for i:=0 to datalength-1 do
  begin
     if groupto[i]=CentroidIndex then
     begin
       setlength(Clusterdata[j],DataDimensions);
       for dim:=0 to DataDimensions-1 do
         Clusterdata[j][dim]:=centroids[GroupTo[i]][dim];
       j:=j+1;
     end;
  end;
  result:=Clusterdata;
end;

function  TKmeans.getValue(aPosition:integer):TArrayOfDouble ;
var dim:integer;
begin
   setlength(result, DataDimensions);
    for dim:=0 to DataDimensions-1 do
  result[dim]:=centroids[GroupTo[aPosition]][dim];
end;



constructor TKmeans.create(aDatalength:LongInt;aDataDimensions:Integer;aClusters:integer);
var i,dim:integer;
begin
  Datalength:= aDatalength;
  DataDimensions:=aDataDimensions;
  Clusters:=aClusters;

  SetLength(multiArray,Datalength);
  for i:=0 to datalength-1 do
  begin
     SetLength(multiArray[i],DataDimensions);
  end;

  SetLength(Centroids, Clusters);
  SetLength(totals, Clusters);
  SetLength(counts, Clusters);
  SetLength(GroupTo, Datalength);

  for i:=0 to clusters-1 do
  begin
     SetLength(Centroids[i], DataDimensions);
     SetLength(totals[i], DataDimensions);
     for dim:=0 to DataDimensions-1 do
    begin
     Centroids[i][dim]:=multiArray[random(datalength-1)][dim];
    end;
  end;
end;

procedure TKmeans.setValue(itemposition:integer;Value:array of double);
var dim:integer;
begin
  for dim:=0 to DataDimensions-1 do
  multiArray[itemposition][dim]:=Value[dim];

end;

function TKmeans.doKmeans (iteration:integer;NSamples:integer=0):TMultiDouble ;
var
 l,i,j,n,position,dim,samples:integer;
 error,minimum,sum,ref:double;
 pick:integer;
 Distance:double;
begin
 for l:=0 to iteration do
  begin
    for i:=0 to clusters-1 do
    begin
      for dim:=0 to DataDimensions-1 do
         totals[i][dim]:=0;
      counts[i]:=0;
    end;
    error:=0;
    if NSamples>0 then
       samples:=NSamples
    else
       samples:=Datalength-1;
    for i:=0 to samples do
    begin
      if NSamples>0 then
        position:=random(datalength-1)
      else
        position:=i;
      minimum:=9999;
      pick:=0;
      for j:=0 to Clusters-1 do
      begin
        sum:=0;
        for dim:=0 to DataDimensions-1 do
          sum:=sum+Sqr(Centroids[j][dim]-multiArray[position][dim]);
        Distance := Sqrt(sum) ;
        if Distance<minimum then
        begin
          pick:=j;
          minimum:=Distance;
        end ;
      end;
        error:=error+minimum;
      GroupTo[position]:=pick;
    end;
    for i:=0 to Datalength-1 do
    begin
      pick:= GroupTo[i];
      counts[pick]:=counts[pick]+1;
      for dim:=0 to DataDimensions-1 do
        totals[pick][dim]:=totals[pick][dim]+multiArray[i][dim];
    end;
    for j:=0 to Clusters-1 do
    begin
      if (counts[j]>0) then
      begin
        for dim:=0 to DataDimensions-1 do
          Centroids[j][dim]:= totals[j][dim]/counts[j]  ;
      end
      else
      begin
        for dim:=0 to DataDimensions-1 do
          Centroids[j][dim]:=multiArray[random(datalength-1)][dim];
      end;
    end;
  end;
  result:=Centroids;
end;


end.
