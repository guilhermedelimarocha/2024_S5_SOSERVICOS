program SOServicos;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frm_Login},
  uCliente in 'uCliente.pas' {frm_Cliente_home};
//  uAceitarSocorro in 'uAceitarSocorro.pas' {frm_AceitarSocorro},
//  uPedirSocorro in 'uPedirSocorro.pas' {frm_PedirSocorro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_Login, frm_Login);
  Application.CreateForm(Tfrm_Cliente_home, frm_Cliente_home);
//  Application.CreateForm(Tfrm_AceitarSocorro, frm_AceitarSocorro);
//  Application.CreateForm(Tfrm_PedirSocorro, frm_PedirSocorro);
  Application.Run;
end.
