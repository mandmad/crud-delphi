unit uDM_Conexao;

interface

uses
  SysUtils, Classes, DB, SqlExpr, DBXFirebird;

type
  Tdm_Conexao = class(TDataModule)
    Conn: TSQLConnection;
  public
    { Public declarations }
  end;

var
  dm_Conexao: Tdm_Conexao;

implementation

{$R *.dfm}

end.
