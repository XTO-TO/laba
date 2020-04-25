{Построить такой многоугольник (не обязательно выпуклый) с вершинами
в заданном множестве, периметр которого максимален.}
unit UBacktrack;

interface

uses
  Windows,
  SysUtils,
  Math;

const
  N=100;

type
  TTop = record
            x,y:Integer;
          end;
  TTopsArray = array [0..N-1] of TTop;

procedure process(k:integer;Tops: TTopsArray; TopsCount: Integer;var TempTops: TTopsArray;
                   var ResTops: TTopsArray;var Max: real);

implementation

const EPS = 1E-9;
//проверка на повторяющиеся точки
function twins(Tops:TTopsArray;TopsCount:Integer):boolean;
var i,k,u:Integer;
begin
  u:=0;
  for i:=0 to TopsCount do
    begin
      k:=1;
      while k+i < TopsCount+1 do
        begin
          if (Tops[i].x = Tops[i+k].x) and (Tops[i].y = Tops[i+k].y) then
            inc(u);
          inc(k);
        end;

    end;
  if u > 1 then
    Result:=True
  else
    Result:=False;
end;

function det (a:Integer; b:Integer; c:Integer; d:Integer):Integer;
begin
  Result:=a*d -b*c;
end;   

function between (a:Integer; b:Integer; c:Real):Boolean;
begin
  Result:=(min(a,b) <= (c + EPS)) and (c <= (max(a,b) + EPS));
end;  

function intersect_1 (a:Integer; b:Integer; c:Integer; d:Integer):Boolean;
var f:Integer;
begin
  if (a > b) then
    begin
      F:=a;
      a:=b;
      b:=f;
    end;
  if (c > d) then
    begin
      F:=c;
      c:=d;
      d:=f;
    end;
  Result:=max(a,c) <= min(b,d);
end;
//проверка на пересечение отрезков
function intersect (a:TTop; b:TTop; c:TTop; d:TTop):Boolean;
var
  A1,A2,B1,B2,C1,C2,zn:Integer;
  x,y:Real;
begin
  A1 := a.Y - b.Y;
  A2 := C.Y - D.Y;
  B1 := B.X - A.X;
  B2 := D.X - C.X;
  C1 := -A1*A.X - B1*A.Y;
  C2 := -A2*C.X - B2*C.Y;
  zn := det(A1,B1,A2,B2);
  if zn <> 0 then
    begin
      x := - det (C1, B1, C2, B2) * 1. / zn;
      y := - det (A1, C1, A2, C2) * 1. / zn;
      result:= between (a.X, b.X, x) and between (a.Y, b.Y, y)
        and between (c.X, d.X, x) and between (c.Y, d.Y, y);
    end
  else
    result:= (det (A1, C1, A2, C2) = 0) and (det (B1, C1, B2, C2) = 0)
			and intersect_1 (a.X, b.X, c.X, d.X)
			and intersect_1 (a.Y, b.Y, c.Y, d.Y);
end;

function perimeter(Tops: TTopsArray; TopsCount: Integer):Real;
var i:Integer;
begin
  Result:=0;
  for i:=0 to TopsCount-1 do
    Result:=Result+(Sqr(Tops[i+1].X - Tops[i].X)+
                    Sqr(Tops[i+1].Y - Tops[i].Y));
end;  

procedure process(k:integer; Tops: TTopsArray;
                  TopsCount: Integer;var TempTops: TTopsArray; var ResTops: TTopsArray;var Max: real);
var
  a,i,j,m:Integer;
begin
  if k = 0 then
    begin
      TempTops[0]:=Tops[0];
      process(k+1,Tops,TopsCount,TempTops,ResTops,max);
    end
  else
    if k = TopsCount then
      begin
        TempTops[TopsCount]:=Tops[0];
        a:=0;
        i:=0;
        J:=1;
        while (i<TopsCount+1) and (j<TopsCount+1) do
          begin
            m:=2;
            while (m+i<TopsCount+1) and (m+j<TopsCount+1) do
              begin
                if intersect(TempTops[i],TempTops[j],TempTops[i+m],TempTops[j+m]) then
                  Inc(a);
                Inc(m)
              end;
            if i = 0 then
              Dec(a);
            inc(i);
            inc(j);
          end;

           if twins(TempTops, TopsCount) then
             inc(a);

          if a=0 then
            if Max < perimeter(TempTops, TopsCount) then
              begin
                Max:=perimeter(TempTops, TopsCount);
                ResTops:=TempTops;
              end;

      end
    else
      begin
        for i:=1 to TopsCount-1 do   
          begin
            TempTops[k]:=Tops[i];
            process(k+1,Tops,TopsCount,TempTops,ResTops,Max);
          end;
      end;

end;

end.
