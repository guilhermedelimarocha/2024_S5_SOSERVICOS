object Connection: TConnection
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Guilherme\Documents\Faculdade\5 Semestre\PROGR' +
        'AMA'#199#195'O PARA DISPOSITIVOS M'#211'VEIS\2024_S5_SOSERVICOS\Banco\saveme.' +
        'sqlite'
      'DriverID=SQLite')
    Connected = True
    Left = 352
    Top = 200
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      '                                       Select 1;')
    Left = 216
    Top = 224
  end
end
