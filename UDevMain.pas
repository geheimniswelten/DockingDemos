unit UDevMain;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.StrUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  cxPC, dxDockControl, cxControls, dxDockPanel, cxClasses,
  UDevChild;

type
  TDevMain = class(TForm)
    dxDockSite1: TdxDockSite;
    dxDockingManager1: TdxDockingManager;
    MainMenu1: TMainMenu;
    Exit1: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    AddChild: TMenuItem;
    CloseAll: TMenuItem;
    Dialogs1: TMenuItem;
    DialogsModal: TMenuItem;
    DialogsNonModal: TMenuItem;
    DialogsVCL: TMenuItem;
    DialogsWinAPI: TMenuItem;
    DemoWalibeiro: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    Reset: TMenuItem;
    Demos: TMenuItem;
    DemoMdi11: TMenuItem;
    DemoMdi12: TMenuItem;
    DemoDockSite: TMenuItem;
    DemoDxDocking: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    RadioGroup1: TRadioGroup;
    procedure Exit1Click(Sender: TObject);
    procedure AddChildClick(Sender: TObject);
    procedure CloseAllClick(Sender: TObject);
    procedure DialogsClick(Sender: TObject);
    procedure DemosClick(Sender: TObject);
  end;

var
  DevMain: TDevMain;

implementation

{$R *.dfm}

procedure TDevMain.AddChildClick(Sender: TObject);
begin
  AddChild.Tag  := AddChild.Tag + 1;
  var Panel     := TdxDockPanel.Create(Self);
  Panel.Caption := 'Panel+Form ' + AddChild.Tag.ToString;
  Panel.DockTo(dxDockSite1, {dtLeft}TdxDockingType(RadioGroup1.ItemIndex), 0);

  var Form     := TDevChild.Create(Panel);
  Form.Caption := 'Form ' + AddChild.Tag.ToString;  // nicht sichtbar
  Form.Parent  := Panel;
end;

procedure TDevMain.CloseAllClick(Sender: TObject);
begin
  for var i := Self.ComponentCount - 1 downto 0 do
    if Self.Components[i] is TdxDockPanel then
      TdxDockPanel(Self.Components[i]).Free;
end;

procedure TDevMain.DemosClick(Sender: TObject);
var
  App: string;
begin
  case TMenuItem(Sender).Tag of
    1: App := 'MDIDemo11.exe';
    2: App := 'MDIDemo12.exe';
    3: App := 'DockDemo.exe';
    //4: App := 'DevExDock.exe';
    5: App := 'DockDemoW.exe ';
  end;
  if ShellExecute(Handle, nil, PChar(App), nil, PChar(ExtractFilePath(ParamStr(0))), SW_SHOW) < 32 then
    RaiseLastOSError;

  Sleep(150);
  if not EndsStr(' ', App) then
    Close;
end;

procedure TDevMain.DialogsClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    0: ShowMessage('modaler Dialog');
    1: with CreateMessageDialog('nicht Modal', mtInformation, [mbClose]) do begin
         Position := poScreenCenter;
         Show;
       end;
    2: begin
         UseLatestCommonDialogs := False;
         ShowMessage('VCL-Dialog');
         UseLatestCommonDialogs := True;
       end;
    3: MessageBox(Self.Handle, 'WinAPI-Dialog', nil, MB_OK);
  end;
end;

procedure TDevMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.

