unit UMdiChild12;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.StrUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ButtonGroup, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus;

type
  TMdiChild = class(TForm)
    Memo1: TMemo;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Close1: TMenuItem;
    Docking1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure Docking1Click(Sender: TObject);
  protected
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure DestroyWindowHandle; override;
    //procedure RecreateWnd;
  private
    procedure CMRecreateWnd(var Message: TMessage); message CM_RECREATEWND;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure LoadPos(CurrentDocking: Boolean);
    procedure SavePos;
  end;

implementation

{$R *.dfm}

uses
  UMdiMain12;

procedure TMdiChild.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TMdiChild.CMRecreateWnd(var Message: TMessage);
begin
  MdiMain.LogMemo.Lines.Add('WndRecreate: ' + Self.Caption);
  inherited;
end;

constructor TMdiChild.Create(Owner: TComponent);
begin
  MdiMain.LogMemo.Lines.Add('Create: ' + Self.ClassName);
  inherited;
end;

procedure TMdiChild.CreateWindowHandle(const Params: TCreateParams);
begin
  MdiMain.LogMemo.Lines.Add('WndCreated: ' + Self.Caption);
  inherited;
end;

destructor TMdiChild.Destroy;
begin
  if not Application.Terminated then
    MdiMain.LogMemo.Lines.Add('Destroy: ' + Self.Caption);
  SavePos;
  inherited;
end;

procedure TMdiChild.DestroyWindowHandle;
begin
  if not Application.Terminated then
    MdiMain.LogMemo.Lines.Add('WndDestory: ' + Self.Caption);
  inherited;
end;

procedure TMdiChild.Docking1Click(Sender: TObject);
begin
  MdiMain.LogMemo.Lines.Add(IfThen(FormStyle = fsMDIChild, 'Ausdocken: ', 'Eindocken: ') + Self.Caption);
  SavePos;
  if FormStyle = fsMDIChild then begin
    FormStyle := fsNormal;
    Panel2.Caption := 'Form.FormStyle = fsNormal';
  end else begin
    FormStyle := fsMDIChild;
    Panel2.Caption := 'Form.FormStyle = fsMDIChild';
  end;
  LoadPos(True);
end;

procedure TMdiChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  MdiMain.AddChild.Tag := Self.Tag - 1;

  // siehe TMdiMain.DialogsClick
  case MdiMain.cbOnCloseDialog.ItemIndex - 1 of
    0: ShowMessage('[OnClose] modaler Dialog');
    1: with CreateMessageDialog('[OnClose] nicht Modal', mtInformation, [mbClose]) do begin
         Position := poScreenCenter;
         Show;
       end;
    2: begin
         UseLatestCommonDialogs := False;
         ShowMessage('[OnClose] VCL-Dialog');
         UseLatestCommonDialogs := True;
       end;
    3: MessageBox(Self.Handle, '[OnClose] WinAPI-Dialog', nil, MB_OK);
  end;

  //MdiMain.cbOnCloseDialog.ItemIndex := 0;
end;

procedure TMdiChild.LoadPos(CurrentDocking: Boolean);
var
  IsDock:  Boolean;
  Section: string;
begin
  if CurrentDocking then begin
    if FormStyle = fsMDIChild then begin
      Section := Name;
      Panel2.Caption := 'Form.FormStyle = fsMDIChild';
    end else begin
      Section := '@' + Name;
      Panel2.Caption := 'Form.FormStyle = fsNormal';
    end;
  end else
    if MdiMain.INI.ReadBool(Name, 'Docking', True) then begin
      Section := Name;
      FormStyle := fsMDIChild;
      Panel2.Caption := 'Form.FormStyle = fsMDIChild';
    end else begin
      Section := '@' + Name;
      FormStyle := fsNormal;
      Panel2.Caption := 'Form.FormStyle = fsNormal';
    end;

  if MdiMain.INI.SectionExists(Section) then begin
    Top := MdiMain.INI.ReadInteger(Section, 'Top', 0);
    Left := MdiMain.INI.ReadInteger(Section, 'Left', 0);
    Width := MdiMain.INI.ReadInteger(Section, 'Width', 0);
    Height := MdiMain.INI.ReadInteger(Section, 'Height', 0);
  end;
end;

procedure TMdiChild.SavePos;
var
  Section: string;
begin
  Section := Name;
  if FormStyle <> fsMDIChild then
    Section := '@' + Name;
  MdiMain.INI.WriteBool(Name, 'Docking', FormStyle = fsMDIChild);
  MdiMain.INI.WriteInteger(Section, 'Top', Top);
  MdiMain.INI.WriteInteger(Section, 'Left', Left);
  MdiMain.INI.WriteInteger(Section, 'Width', Width);
  MdiMain.INI.WriteInteger(Section, 'Height', Height);
end;

end.

