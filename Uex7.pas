{ѕостроить такой многоугольник (не об€зательно выпуклый) с вершинами
в заданном множестве, периметр которого максимален.}
unit Uex7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,UBacktrack,TeCanvas;

type
  TForm1 = class(TForm)
    inputPnl: TGroupBox;
    btnPanel: TPanel;
    memoPnl: TPanel;
    ExBtn: TButton;
    resulPnl: TGroupBox;
    AddBtn: TButton;
    XEdt: TEdit;
    YEdt: TEdit;
    lblName: TLabel;
    lblCost: TLabel;
    SourceMemo: TMemo;
    ResImg: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationIdle(Sender: TObject; var done: Boolean);
    procedure MainBtnClick(Sender: TObject);
    procedure XEdtKeyPress(Sender: TObject; var Key: Char);
    procedure YEdtKeyPress(Sender: TObject; var Key: Char);
    procedure AddBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TopsArr:TTopsArray;
  count:Integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnIdle:=ApplicationIdle;
  SourceMemo.Lines.Add('Ќабор вершин:');
end;

procedure  TForm1.ApplicationIdle(Sender: TObject; var done: Boolean);
begin
  AddBtn.Enabled :=(XEdt.Text<>'') and (YEdt.Text<>'');
  ExBtn.Enabled:=((TopsArr[2].x<>0) and (TopsArr[2].y<>0));
end;

procedure TForm1.MainBtnClick(Sender: TObject);
var
  k:Integer;
  max:Real;
  ResArr,TempTops:TTopsArray;
  i:Integer;

begin
  ResImg.Picture:=nil;
  k:=0;
  max:=0;
  process(k,TopsArr,count,TempTops,ResArr,max);
  ResImg.Canvas.MoveTo(ResArr[0].X,ResArr[0].Y);
    for i:=1 to count do
      ResImg.Canvas.LineTo(ResArr[I].X,ResArr[I].Y);
end;

procedure TForm1.XEdtKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9']) and (Ord(Key)<>8) then
    Key:=#0;
end;

procedure TForm1.YEdtKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9']) and (Ord(Key)<>8) then
     Key:=#0;
end;

procedure TForm1.AddBtnClick(Sender: TObject);
begin
  TopsArr[count].x:=StrToInt(XEdt.text);
  TopsArr[count].Y:=StrToInt(YEdt.text);
  with TopsArr[count] do
      SourceMemo.Lines.Add('X: ' + IntToStr(X) + '   Y: '+IntToStr(Y));
  XEdt.Clear;
  YEdt.Clear;
  inc(count);
end;

end.
