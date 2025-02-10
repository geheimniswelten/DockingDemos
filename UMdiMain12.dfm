object MdiMain: TMdiMain
  Left = 732
  Top = 30
  Caption = 'MDI-Demo (12)'
  ClientHeight = 570
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  VisualManager = FormTabsBar1
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 161
    Height = 515
    Align = alLeft
    ShowCaption = False
    TabOrder = 0
    object cbOnCloseDialog: TRadioGroup
      Left = 8
      Top = 16
      Width = 145
      Height = 145
      Caption = ' ChildForm.OnClose '
      ItemIndex = 0
      Items.Strings = (
        '(none)'
        'Modal'
        'NonModal'
        'VCL'
        'WinAPI')
      TabOrder = 0
    end
    object lbOptions: TCheckListBox
      Left = 8
      Top = 184
      Width = 145
      Height = 177
      ItemHeight = 15
      Items.Strings = (
        'HideInactiveFormOnParent'
        'HideMinimizedForm'
        'ShowTabsMenuButton'
        ''
        'Draggable'
        'MarkInvisibleForm'
        'ShowFormIcon'
        'ShowFormSystemMenu'
        'ShowCloseButton'
        'ShowHintForTruncatedCaption')
      TabOrder = 1
      OnClick = lbOptionsClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 545
    Width = 935
    Height = 25
    Align = alBottom
    Caption = 'Form.FormStyle = fsMDIForm'
    TabOrder = 1
  end
  object LogMemo: TMemo
    Left = 763
    Top = 30
    Width = 172
    Height = 515
    Align = alRight
    ScrollBars = ssVertical
    TabOrder = 2
    WordWrap = False
  end
  object FormTabsBar1: TFormTabsBar
    Left = 0
    Top = 0
    Width = 935
    Height = 30
    ParentColor = False
    TabOptions.ShowFormIcon = True
    TabOptions.ShowFormSystemMenu = True
    TabOptions.ShowCloseButton = True
    TabOptions.ShowHintForTruncatedCaption = True
    ShowTabsMenuButton = True
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 48
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
      OnClick = ResetClick
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
        Enabled = False
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
  object ApplicationEvents1: TApplicationEvents
    OnActivate = ApplicationEvents1Activate
    OnDeactivate = ApplicationEvents1Deactivate
    OnModalBegin = ApplicationEvents1ModalBegin
    OnModalEnd = ApplicationEvents1ModalEnd
    Left = 328
    Top = 48
  end
end
