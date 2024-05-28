program SOServicos;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frm_Login};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_Login, frm_Login);
  Application.Run;
end.
