unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.TabControl, FMX.ListBox;

type
  TPessoa = record
    nome: string;
    email: string;
    senha: string;
    cpf: String;
    celular:String;
    //todos os dados que tiver do BD
  end;

type
  Tfrm_Login = class(TForm)
    Layout2: TLayout;
    img_logo_login: TImage;
    Layout1: TLayout;
    Image1: TImage;
    edt_email_login: TEdit;
    StyleBook1: TStyleBook;
    Image2: TImage;
    edt_senha_login: TEdit;
    Layout3: TLayout;
    SpeedButton1: TSpeedButton;
    TabControl1: TTabControl;
    TabLogin: TTabItem;
    TabTipoConta: TTabItem;
    TabContaCliente: TTabItem;
    TabContaPrestador: TTabItem;
    Layout4: TLayout;
    Image4: TImage;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    Layout7: TLayout;
    RoundRect2: TRoundRect;
    Label3: TLabel;
    Layout8: TLayout;
    RoundRect3: TRoundRect;
    Label4: TLabel;
    Layout9: TLayout;
    Image3: TImage;
    Layout10: TLayout;
    Image5: TImage;
    edt_usuario: TEdit;
    Image6: TImage;
    edt_senha: TEdit;
    Image7: TImage;
    edt_email: TEdit;
    Image8: TImage;
    edt_confirma_senha: TEdit;
    Image9: TImage;
    edt_cpf: TEdit;
    Image10: TImage;
    edt_celular: TEdit;
    Layout11: TLayout;
    RoundRect4: TRoundRect;
    Label5: TLabel;
    Layout12: TLayout;
    Image11: TImage;
    Layout13: TLayout;
    Image12: TImage;
    Edit9: TEdit;
    Image13: TImage;
    Edit10: TEdit;
    Image14: TImage;
    Edit11: TEdit;
    Image15: TImage;
    Edit12: TEdit;
    Image16: TImage;
    Edit13: TEdit;
    Image17: TImage;
    Edit14: TEdit;
    Layout14: TLayout;
    RoundRect5: TRoundRect;
    Label6: TLabel;
    ComboBox1: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    RoundRect6: TRoundRect;
    Image18: TImage;
    Edit1: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
    procedure RoundRect5Click(Sender: TObject);
    procedure RoundRect4Click(Sender: TObject);
    procedure RoundRect3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure validaLogin();
    procedure comparaLoginNoBanco(emailOuCpf: String;senha: String);
    procedure edt_cpfChange(Sender: TObject);
    procedure edt_celularChange(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure GeraCadastroNoBanco(vPessoa:TPessoa;p_senha_confirma: String);
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






procedure Tfrm_Login.comparaLoginNoBanco(emailOuCpf, senha: String);
begin
// faz a consulta no banco de
// (SELECT email,senha FROM pessoa WHERE email = :email AND senha = :senha)
end;





procedure Tfrm_Login.edt_cpfChange(Sender: TObject);
var
  Text: string;
  FormattedText: string;
  I: Integer;
begin
  Text := edt_cpf.Text;
  Text := StringReplace(Text, '.', '', [rfReplaceAll]);
  Text := StringReplace(Text, '-', '', [rfReplaceAll]);
  Text := StringReplace(Text, ' ', '', [rfReplaceAll]);

  FormattedText := '';
  for I := 1 to Length(Text) do
  begin
    FormattedText := FormattedText + Text[I];
    if (I = 3) or (I = 6) then
      FormattedText := FormattedText + '.';
    if I = 9 then
      FormattedText := FormattedText + '-';
  end;
  edt_cpf.OnChange := nil;
  edt_cpf.Text := FormattedText;
  edt_cpf.SelStart := Length(FormattedText);
  edt_cpf.OnChange := edt_cpfChange;
end;

procedure Tfrm_Login.edt_celularChange(Sender: TObject);
var
  Text: string;
  FormattedText: string;
  I: Integer;
begin
  Text := edt_celular.Text;
  Text := StringReplace(Text, '(', '', [rfReplaceAll]);
  Text := StringReplace(Text, ')', '', [rfReplaceAll]);
  Text := StringReplace(Text, ' ', '', [rfReplaceAll]);
  Text := StringReplace(Text, '-', '', [rfReplaceAll]);
  FormattedText := '';
  for I := 1 to Length(Text) do
  begin
    FormattedText := FormattedText + Text[I];
    if I = 2 then
      FormattedText := '(' + FormattedText + ') ';
    if I = 7 then
      FormattedText := FormattedText + '-';
  end;

  edt_celular.OnChange := nil;
  edt_celular.Text := FormattedText;
  edt_celular.SelStart := Length(FormattedText);
  edt_celular.OnChange := edt_celularChange;
end;

procedure Tfrm_Login.GeraCadastroNoBanco(vPessoa : TPessoa;p_senha_confirma:String);
begin
if (vPessoa.senha = p_senha_confirma) then
    // cadastra no banco
else
ShowMessage('As senhas est�o divergentes!!!')
end;

procedure Tfrm_Login.Label4Click(Sender: TObject);
begin
  Tfrm_Cliente_home.Create(Self).Show();
end;


procedure Tfrm_Login.Label5Click(Sender: TObject);
var
vPessoa: TPessoa;
begin
// chamar metodo para cadastrar no banco
vPessoa.nome:= edt_usuario.Text;
vPessoa.email:= edt_email.Text;
vPessoa.senha:= edt_senha.Text;
vPessoa.cpf:= edt_cpf.Text;
vPessoa.celular:= edt_celular.Text;

  GeraCadastroNoBanco(vPessoa,edt_confirma_senha.Text);
  TabControl1.TabIndex := 0;
end;

procedure Tfrm_Login.RoundRect1Click(Sender: TObject);
begin
  TabControl1.TabIndex := 2;
end;

procedure Tfrm_Login.RoundRect2Click(Sender: TObject);
begin
  TabControl1.TabIndex := 3;
end;

procedure Tfrm_Login.RoundRect3Click(Sender: TObject);
begin
  frm_Cliente_home.Show;
end;

procedure Tfrm_Login.RoundRect4Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

procedure Tfrm_Login.RoundRect5Click(Sender: TObject);
begin
  TabControl1.TabIndex := 0;
end;

procedure Tfrm_Login.SpeedButton1Click(Sender: TObject);
begin
  TabControl1.TabIndex := 1;
end;

procedure Tfrm_Login.validaLogin;
begin
  // chamar metodo de buscar CPF ou EMAIl compativel no banco

end;

end.
