unit uPedirSocorro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ExtCtrls, FMX.Maps,
  System.Sensors, System.Sensors.Components,
//  Androidapi.Helpers,
//  Androidapi.JNI.JavaTypes, Androidapi.JNI.Os,
   FMX.DialogService, System.Permissions,
  FMX.WebBrowser, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  Tfrm_PedirSocorro = class(TForm)
    lHeader: TLayout;
    btnMenu: TSpeedButton;
    lblPedirAjuda: TLabel;
    lBottom: TLayout;
    lCenter: TLayout;
    lButtonPedirSocorro: TLayout;
    btnPedirSocorro: TButton;
    imgIcon: TImageViewer;
    minhaLocalizacao: TLocationSensor;
    timer: TTimer;
    mapaMinhaLocalizacao: TMapView;
    pPedirSocorro: TPanel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure minhaLocalizacaoLocationChanged(Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateMap(Latitude, Longitude: Double);
  public
    { Public declarations }
  end;

var
  frm_PedirSocorro: Tfrm_PedirSocorro;
  API_KEY: string;

implementation

{$R *.fmx}
//{$R *.Windows.fmx MSWINDOWS}
//{$R *.XLgXhdpiTb.fmx ANDROID}
//{$R *.LgXhdpiTb.fmx ANDROID}


uses uAceitarSocorro, uCliente, uPrincipal;

procedure Tfrm_PedirSocorro.FormCreate(Sender: TObject);
begin
  // Ativa o sensor de localiza��o
  minhaLocalizacao.Active := True;
  Memo1Change(minhaLocalizacao);
//  minhaLocalizacao.Sensor.Start;

//  minhaLocalizacao.OnLocationChanged := minhaLocalizacaoLocationChanged;
  // Define o intervalo do timer (em milissegundos)
  timer.Interval := 5000; // Atualiza a cada 5 segundos
  timer.Enabled := True;
end;

procedure Tfrm_PedirSocorro.Memo1Change(Sender: TObject);
begin
   Memo1.Lines.Add(minhaLocalizacao.Sensor.Latitude.ToString);
   Memo1.Lines.Add(minhaLocalizacao.Sensor.Longitude.ToString);
end;

procedure Tfrm_PedirSocorro.minhaLocalizacaoLocationChanged(Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
begin
  // Atualiza o mapa com a nova localiza��o
  UpdateMap(NewLocation.Latitude, NewLocation.Longitude);
end;

procedure Tfrm_PedirSocorro.timerTimer(Sender: TObject);
begin
  // Verifica se o sensor de localiza��o est� ativo
  if minhaLocalizacao.Active then
  begin
    minhaLocalizacao.Sensor.Start;
//    updateMap(minhaLocalizacao.Sensor.Latitude, minhaLocalizacao.Sensor.Longitude);
  end;
end;

procedure Tfrm_PedirSocorro.UpdateMap(Latitude, Longitude: Double);
var
  posicao: TMapCoordinate;
  marcador: TMapMarkerDescriptor;
  URL: string;
begin
  // Define a posi��o no mapa
  posicao := TMapCoordinate.Create(Latitude, Longitude);
//    posicao.Latitude := -24.9555;
//    posicao.Longitude := -53.4552;

  // Adiciona um marcador no mapa
  marcador := TMapMarkerDescriptor.Create(posicao, 'Minha Localiza��o');
  marcador.Snippet := 'Posi��o Atual';
  marcador.Visible := True;
  marcador.Draggable := false; // Opcional: permite que o marcador seja arrastado

  // Limpa marcadores anteriores para evitar duplica��o
  mapaMinhaLocalizacao.CleanupInstance;

  // Adiciona o marcador no mapa
  mapaMinhaLocalizacao.AddMarker(marcador);

  // Centraliza o mapa no marcador
  mapaMinhaLocalizacao.Location := posicao;

  // Define o n�vel de zoom
  mapaMinhaLocalizacao.Zoom := 50;
end;

end.
