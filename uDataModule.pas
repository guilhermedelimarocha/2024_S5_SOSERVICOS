unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.FMXUI.Wait, System.IOUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Pool,
  Data.DB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Connection: TConnection;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TConnection.DataModuleCreate(Sender: TObject);
var
  DatabasePath: string;
begin
  {$IF DEFINED(ANDROID)}
  // O arquivo ser� extra�do dos assets e colocado no caminho correto no primeiro acesso
  DatabasePath := TPath.Combine(TPath.GetDocumentsPath, 'banco/saveme.sqlite');
  {$ELSE}
  DatabasePath := TPath.Combine(ExtractFilePath(ParamStr(0)), 'projeto\banco\seu_banco.sqlite');
  {$ENDIF}

  FDConnection.DriverName := 'SQLite';
  FDConnection.Params.Database := DatabasePath;
  FDConnection.Connected := True;
end;

end.

