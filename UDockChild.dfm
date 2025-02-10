object DockChild: TDockChild
  Left = 0
  Top = 0
  Caption = 'DockChild'
  ClientHeight = 254
  ClientWidth = 448
  Color = clBtnFace
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  TextHeight = 15
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel2: TPanel
    Left = 0
    Top = 229
    Width = 448
    Height = 25
    Align = alBottom
    Caption = 'DragKind=dkDock | DragMode=dmAutomatic'
    TabOrder = 1
    ExplicitTop = 228
    ExplicitWidth = 444
  end
end
