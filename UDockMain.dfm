object DockMain: TDockMain
  Left = 0
  Top = 0
  Caption = 'DockMain'
  ClientHeight = 499
  ClientWidth = 931
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 32
    Top = 32
    Width = 433
    Height = 427
    Anchors = [akLeft, akTop, akBottom]
    DockSite = True
    ShowCaption = False
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 478
    Top = 32
    Width = 419
    Height = 427
    Anchors = [akLeft, akTop, akRight, akBottom]
    DockSite = True
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 474
    Width = 931
    Height = 25
    Align = alBottom
    Caption = 
      'Control.DockSite = True  (bei der Form funktioniert das Alignmen' +
      't nicht)'
    TabOrder = 2
  end
  object cbFormDocking: TCheckBox
    Left = 8
    Top = 0
    Width = 137
    Height = 17
    Caption = 'Docking on TForm'
    TabOrder = 3
    OnClick = cbFormDockingClick
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 88
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object AddChild: TMenuItem
      Caption = 'Add child'
      OnClick = AddChildClick
    end
    object CloseAll: TMenuItem
      Caption = 'Close all'
      OnClick = CloseAllClick
    end
    object Dialogs1: TMenuItem
      Caption = 'Dialogs'
      object DialogsModal: TMenuItem
        Caption = 'Modal'
        OnClick = DialogsClick
      end
      object DialogsNonModal: TMenuItem
        Tag = 1
        Caption = 'NonModal'
        OnClick = DialogsClick
      end
      object DialogsVCL: TMenuItem
        Tag = 2
        Caption = 'VCL'
        OnClick = DialogsClick
      end
      object DialogsWinAPI: TMenuItem
        Tag = 3
        Caption = 'WinAPI'
        OnClick = DialogsClick
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Reset: TMenuItem
      Caption = 'Reset Config'
      Enabled = False
    end
    object Demos: TMenuItem
      Caption = 'Demos'
      object DemoMdi11: TMenuItem
        Tag = 1
        Caption = 'MDI (11)'
        OnClick = DemosClick
      end
      object DemoMdi12: TMenuItem
        Tag = 2
        Caption = 'MDI (12)'
        OnClick = DemosClick
      end
      object DemoDockSite: TMenuItem
        Tag = 3
        Caption = 'DockSite'
        Enabled = False
        OnClick = DemosClick
      end
      object DemoDxDocking: TMenuItem
        Tag = 4
        Caption = 'dxDocking'
        OnClick = DemosClick
      end
      object DemoWalibeiro: TMenuItem
        Tag = 5
        Caption = 'walibeiro'
        OnClick = DemosClick
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = '-'
    end
  end
end
