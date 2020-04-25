object Form1: TForm1
  Left = 345
  Top = 164
  Width = 807
  Height = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object inputPnl: TGroupBox
    Left = 0
    Top = 0
    Width = 791
    Height = 153
    Align = alTop
    TabOrder = 0
    object btnPanel: TPanel
      Left = 520
      Top = 15
      Width = 269
      Height = 136
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object ExBtn: TButton
        Left = 40
        Top = 72
        Width = 129
        Height = 49
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        TabOrder = 0
        OnClick = MainBtnClick
      end
      object AddBtn: TButton
        Left = 40
        Top = 8
        Width = 129
        Height = 49
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1077#1088#1096#1080#1085#1091
        TabOrder = 1
        OnClick = AddBtnClick
      end
    end
    object memoPnl: TPanel
      Left = 2
      Top = 15
      Width = 518
      Height = 136
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblName: TLabel
        Left = 80
        Top = 24
        Width = 11
        Height = 23
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCost: TLabel
        Left = 288
        Top = 24
        Width = 11
        Height = 23
        Caption = 'Y'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object XEdt: TEdit
        Left = 0
        Top = 48
        Width = 193
        Height = 21
        TabOrder = 0
        OnKeyPress = XEdtKeyPress
      end
      object YEdt: TEdit
        Left = 208
        Top = 48
        Width = 193
        Height = 21
        TabOrder = 1
        OnKeyPress = YEdtKeyPress
      end
    end
  end
  object resulPnl: TGroupBox
    Left = 0
    Top = 153
    Width = 791
    Height = 250
    Align = alClient
    TabOrder = 1
    object ResImg: TImage
      Left = 0
      Top = 8
      Width = 377
      Height = 241
    end
    object SourceMemo: TMemo
      Left = 384
      Top = 15
      Width = 405
      Height = 233
      Align = alRight
      Enabled = False
      TabOrder = 0
    end
  end
end
