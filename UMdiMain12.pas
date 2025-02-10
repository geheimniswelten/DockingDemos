unit UMdiMain12;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.StrUtils, System.Variants, System.Classes, System.IniFiles,
  Vcl.Graphics, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Forms, Vcl.Dialogs, Vcl.FormTabsBar, Vcl.AppEvnts,
  UMdiChild12;

type
  TMdiMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Exit1: TMenuItem;
    AddChild: TMenuItem;
    CloseAll: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Demos: TMenuItem;
    DemoMdi11: TMenuItem;
    DemoMdi12: TMenuItem;
    DemoDockSite: TMenuItem;
    DemoDxDocking: TMenuItem;
    DemoWalibeiro: TMenuItem;
    LogMemo: TMemo;
    FormTabsBar1: TFormTabsBar;
    Reset: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Dialogs1: TMenuItem;
    DialogsWinAPI: TMenuItem;
    DialogsVCL: TMenuItem;
    DialogsNonModal: TMenuItem;
    DialogsModal: TMenuItem;
    Panel3: TPanel;
    cbOnCloseDialog: TRadioGroup;
    procedure Exit1Click(Sender: TObject);
    procedure AddChildClick(Sender: TObject);
    procedure CloseAllClick(Sender: TObject);
    procedure DemosClick(Sender: TObject);
    procedure DialogsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ApplicationEvents1ModalBegin(Sender: TObject);
    procedure ApplicationEvents1ModalEnd(Sender: TObject);
  public
    INI: TIniFile;
    procedure ActiveFormChange(Sender: TObject);
  end;

var
  MdiMain: TMdiMain;

implementation

{$R *.dfm}

procedure TMdiMain.ActiveFormChange(Sender: TObject);
begin
  if Assigned(Screen.ActiveCustomForm) then
    LogMemo.Lines.Add('OnActiveFormChange: ' + Screen.ActiveCustomForm.Name)
  else
    LogMemo.Lines.Add('OnActiveFormChange: nil');
end;

procedure TMdiMain.AddChildClick(Sender: TObject);
var
  i: Integer;
begin
  i := AddChild.Tag;
  repeat
    AddChild.Tag := (AddChild.Tag + 1) mod 10;
    if AddChild.Tag = i then
      raise Exception.Create('maximal 10 Fenster');
  until not Assigned(Self.FindComponent('MdiChild' + AddChild.Tag.ToString));

  var F := TMdiChild.Create(Self);
  F.Tag        := AddChild.Tag;
  F.Name       := 'MdiChild' + AddChild.Tag.ToString;
  F.Caption    := 'MDI-Child ' + AddChild.Tag.ToString;
  F.Memo1.Text := F.Caption + ' ...';
  F.LoadPos(False);
end;

procedure TMdiMain.ApplicationEvents1Activate(Sender: TObject);
begin
  LogMemo.Lines.Add('OnActivate');
end;

procedure TMdiMain.ApplicationEvents1Deactivate(Sender: TObject);
begin
  LogMemo.Lines.Add('OnDeactivate');
end;

procedure TMdiMain.ApplicationEvents1ModalBegin(Sender: TObject);
begin
  LogMemo.Lines.Add('OnModalBegin');
end;

procedure TMdiMain.ApplicationEvents1ModalEnd(Sender: TObject);
begin
  LogMemo.Lines.Add('OnModalEnd');
end;

procedure TMdiMain.CloseAllClick(Sender: TObject);
begin
  for var i := Self.ComponentCount - 1 downto 0 do
    if Self.Components[i] is TForm then
      TForm(Self.Components[i]).Release;
end;

procedure TMdiMain.DemosClick(Sender: TObject);
var
  App: string;
begin
  case TMenuItem(Sender).Tag of
    1: App := 'MDIDemo11.exe';
    //2: App := 'MDIDemo12.exe';
    3: App := 'DockDemo.exe';
    4: App := 'DevExDock.exe';
    5: App := 'DockDemoW.exe ';
  end;
  if ShellExecute(Handle, nil, PChar(App), nil, PChar(ExtractFilePath(ParamStr(0))), SW_SHOW) < 32 then
    RaiseLastOSError;

  Sleep(150);
  if not EndsStr(' ', App) then
    Close;
end;

procedure TMdiMain.DialogsClick(Sender: TObject);
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

procedure TMdiMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMdiMain.FormCreate(Sender: TObject);
begin
  INI := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  cbOnCloseDialog.ItemIndex := INI.ReadInteger('Main', 'ChildForm.OnClose', 0);
  Screen.OnActiveFormChange := ActiveFormChange;
end;

procedure TMdiMain.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveFormChange := nil;
  for var i := Self.ComponentCount - 1 downto 0 do  // OnDestroy wird aufgerufen, bevor die Components feigegeben werden, aber TMdiChild.Destroy->SavePos benötigt noch die INI. (alternativ INI.Free in den Desructor, anstatt ins Event)
    if Self.Components[i] is TForm then
      Self.Components[i].Free;  // Sofort weg, also kein Release und auch ohne OnClose.
  INI.WriteInteger('Main', 'ChildForm.OnClose', cbOnCloseDialog.ItemIndex);
  INI.Free;
end;

procedure TMdiMain.ResetClick(Sender: TObject);
begin
  for var i := 0 to 9 do
    INI.EraseSection('MdiChild' + i.ToString);
end;

end.

