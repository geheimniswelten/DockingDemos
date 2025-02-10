unit UDockChild;

// https://walibeiro.wordpress.com/2016/11/08/delphi-docking-demo/

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TDockChild = class(TForm)
    Button1: TButton;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

implementation

{$R *.dfm}

procedure TDockChild.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TDockChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

