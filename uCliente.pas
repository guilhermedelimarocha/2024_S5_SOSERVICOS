unit uCliente;
interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;
type
  TMenu = class(TForm)
    Layout4: TLayout;
    Image4: TImage;
    Layout5: TLayout;
    Layout6: TLayout;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    Layout7: TLayout;
    RoundRect2: TRoundRect;
    Label3: TLabel;
    Layout1: TLayout;
    RoundRect3: TRoundRect;
    Label1: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    RoundRect4: TRoundRect;
    Label4: TLabel;
    Fechar: TRoundRect;
    Image1: TImage;
    procedure FecharClick(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Menu: TMenu;
implementation
{$R *.fmx}

uses uPrincipal, uPedirSocorro, uMeuPerfil;

procedure TMenu.FecharClick(Sender: TObject);
begin
  Menu.Close;
end;

procedure TMenu.RoundRect1Click(Sender: TObject);
begin
  frm_PedirSocorro.Show;
end;

procedure TMenu.RoundRect2Click(Sender: TObject);
begin
  MeuPerfil.Show;
end;

end.
