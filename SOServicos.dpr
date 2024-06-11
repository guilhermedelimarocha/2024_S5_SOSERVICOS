program SOServicos;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frm_Login},
  uPedirSocorro in 'uPedirSocorro.pas' {frm_PedirSocorro},
  uCliente in 'uCliente.pas' {frm_Cliente_home},
  uAceitarSocorro in 'uAceitarSocorro.pas' {frm_AceitarSocorro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_PedirSocorro, frm_PedirSocorro);
  Application.CreateForm(Tfrm_AceitarSocorro, frm_AceitarSocorro);
  Application.CreateForm(Tfrm_Cliente_home, frm_Cliente_home);
  Application.CreateForm(Tfrm_AceitarSocorro, frm_AceitarSocorro);
  Application.Run;
end.
