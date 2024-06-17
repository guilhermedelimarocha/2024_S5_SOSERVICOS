program SOServicos;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frm_Login},
  uCliente in 'uCliente.pas' {Menu},
  uPedirSocorro in 'uPedirSocorro.pas' {frm_PedirSocorro},
  uMeuPerfil in 'uMeuPerfil.pas' {MeuPerfil},
  uDataModule in 'uDataModule.pas' {Connection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_Login, frm_Login);
  Application.CreateForm(Tfrm_PedirSocorro, frm_PedirSocorro);
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TMeuPerfil, MeuPerfil);
  Application.CreateForm(TConnection, Connection);
  Application.Run;
end.
