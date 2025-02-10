object DevMain: TDevMain
  Left = 0
  Top = 0
  Caption = 'DevMain'
  ClientHeight = 439
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  TextHeight = 15
  object dxDockSite1: TdxDockSite
    Left = 32
    Top = 72
    Width = 545
    Height = 334
    Anchors = [akLeft, akTop, akRight, akBottom]
    DockingType = 5
    OriginalWidth = 545
    OriginalHeight = 334
  end
  object RadioGroup1: TRadioGroup
    Left = 32
    Top = 17
    Width = 489
    Height = 41
    Caption = ' DockingType '
    Columns = 6
    ItemIndex = 1
    Items.Strings = (
      'dtClient'
      'dtLeft'
      'dtTop'
      'dtRight'
      'dtBottom'
      'dtNone')
    TabOrder = 1
  end
  object dxDockingManager1: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.CustomButtons.Buttons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 208
    Top = 104
    PixelsPerInch = 96
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 104
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
        Enabled = False
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
