program MDIDemo12;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  UMdiMain12 in 'UMdiMain12.pas' {MdiMain},
  UMdiChild12 in 'UMdiChild12.pas' {MdiChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMdiMain, MdiMain);
  Application.Run;
end.
