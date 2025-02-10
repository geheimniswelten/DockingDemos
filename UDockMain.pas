unit UDockMain;

// https://walibeiro.wordpress.com/2016/11/08/delphi-docking-demo/

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.StrUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  UDockChild;

type
  TDockMain = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    Panel2: TPanel;
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
    cbFormDocking: TCheckBox;
    procedure Exit1Click(Sender: TObject);
    procedure AddChildClick(Sender: TObject);
    procedure CloseAllClick(Sender: TObject);
    procedure DialogsClick(Sender: TObject);
    procedure DemosClick(Sender: TObject);
    procedure cbFormDockingClick(Sender: TObject);
  end;

var
  DockMain: TDockMain;

implementation

{$R *.dfm}

procedure TDockMain.AddChildClick(Sender: TObject);
begin
  AddChild.Tag := AddChild.Tag + 1;
  with TDockChild.Create(Self) do begin
    Caption := 'DockChild ' + AddChild.Tag.ToString;
    Color   := Random($FFFFFF);
    Show;
  end;
end;

procedure TDockMain.cbFormDockingClick(Sender: TObject);
begin
  Self.DockSite := cbFormDocking.Checked;
  if Self.DockSite then
    PageControl1.Width := Self.ClientWidth - PageControl1.Left - 150
  else
    PageControl1.Width := Self.ClientWidth - PageControl1.Left - 32
end;

procedure TDockMain.CloseAllClick(Sender: TObject);
begin
  for var i := Self.ComponentCount - 1 downto 0 do
    if Self.Components[i] is TForm then
      TForm(Self.Components[i]).Release;
end;

procedure TDockMain.DemosClick(Sender: TObject);
var
  App: string;
begin
  case TMenuItem(Sender).Tag of
    1: App := 'MDIDemo11.exe';
    2: App := 'MDIDemo12.exe';
    //3: App := 'DockDemo.exe';
    4: App := 'DevExDock.exe';
    5: App := 'DockDemoW.exe ';
  end;
  if ShellExecute(Handle, nil, PChar(App), nil, PChar(ExtractFilePath(ParamStr(0))), SW_SHOW) < 32 then
    RaiseLastOSError;

  Sleep(150);
  if not EndsStr(' ', App) then
    Close;
end;

procedure TDockMain.DialogsClick(Sender: TObject);
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

procedure TDockMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.

