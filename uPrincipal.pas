unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  Tfrm_Login = class(TForm)
    Layout2: TLayout;
    img_logo_login: TImage;
    Layout1: TLayout;
    Image1: TImage;
    Edit1: TEdit;
    StyleBook1: TStyleBook;
    Image2: TImage;
    Edit2: TEdit;
    Layout3: TLayout;
    Image3: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Login: Tfrm_Login;

implementation

{$R *.fmx}

uses uCliente;
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure Tfrm_Login.SpeedButton1Click(Sender: TObject);
begin
  frm_Cadastro.Show;
end;

end.
