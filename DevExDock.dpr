program DevExDock;

uses
  Vcl.Forms,
  UDevMain in 'UDevMain.pas' {DevMain},
  UDevChild in 'UDevChild.pas' {DevChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDevMain, DevMain);
  Application.Run;
end.
