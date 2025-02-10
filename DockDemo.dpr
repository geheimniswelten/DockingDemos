program DockDemo;

uses
  Vcl.Forms,
  UDockMain in 'UDockMain.pas' {DockMain},
  UDockChild in 'UDockChild.pas' {DockChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDockMain, DockMain);
  Application.Run;
end.
