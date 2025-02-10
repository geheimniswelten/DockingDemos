object MdiChild: TMdiChild
  Left = 1391
  Top = 30
  Caption = 'MdiChild'
  ClientHeight = 279
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  Visible = True
  OnClose = FormClose
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 475
    Height = 254
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 254
    Width = 475
    Height = 25
    Align = alBottom
    Caption = 'Form.FormStyle = fsMDIChild'
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 72
    object N1: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object N2: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object Docking1: TMenuItem
      Caption = 'Ein-/Ausdocken'
      GroupIndex = 1
      OnClick = Docking1Click
    end
    object Close1: TMenuItem
      Caption = 'Close'
      GroupIndex = 1
      OnClick = Close1Click
    end
  end
end
