unit uMeuPerfil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.TabControl,
  Data.DB, Data.SqlExpr;

type
  TMeuPerfil = class(TForm)
    TabControl1: TTabControl;
    Meu_perfil: TTabItem;
    Logo_save_me: TImage;
    tres_pontos: TLayout;
    SpeedButton2: TSpeedButton;
    Layout_dados: TLayout;
    Usuario: TImage;
    Edit15: TEdit;
    email: TImage;
    Edit17: TEdit;
    senha: TImage;
    Edit18: TEdit;
    cpf: TImage;
    Edit19: TEdit;
    cell: TImage;
    Edit20: TEdit;
    Layout14: TLayout;
    RoundRect5: TRoundRect;
    Label6: TLabel;
    Layout1: TLayout;
    Image1: TImage;
    Line1: TLine;
    Line2: TLine;
    Line3: TLine;
    Line4: TLine;
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MeuPerfil: TMeuPerfil;

implementation

{$R *.fmx}

procedure TMeuPerfil.SpeedButton2Click(Sender: TObject);
begin

TabControl1.ActiveTab := Meu_perfil;


end;

end.
