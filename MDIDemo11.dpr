program MDIDemo11;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  UMdiMain11 in 'UMdiMain11.pas' {MdiMain},
  UMdiChild11 in 'UMdiChild11.pas' {MdiChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMdiMain, MdiMain);
  Application.Run;
end.

