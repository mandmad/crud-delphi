unit uDM_Cliente;

interface

uses
  System.SysUtils, System.Classes, uDM_Conexao, Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient,
  uDM_Cidade, TratamentoErro;

type
  Tdm_Cliente = class(TDataModule)
    dst_Cliente: TSQLDataSet;
    dsp_Cliente: TDataSetProvider;
    cds_Cliente: TClientDataSet;
    dst_ClienteCODIGO: TIntegerField;
    dst_ClienteRSOCIAL: TStringField;
    dst_ClienteCIDADE: TIntegerField;
    dst_ClienteNOME: TStringField;
    cds_ClienteCODIGO: TIntegerField;
    cds_ClienteRSOCIAL: TStringField;
    cds_ClienteCIDADE: TIntegerField;
    cds_ClienteNOME: TStringField;
    procedure cds_ClienteCIDADEValidate(Sender: TField);
    procedure cds_ClienteReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Cliente: Tdm_Cliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm_Cliente.cds_ClienteCIDADEValidate(Sender: TField);
var
  VDM_Cidade: Tdm_cidade;
begin
  cds_ClienteNOME.Clear;

  VDM_Cidade := Tdm_cidade.Create(Self);
  try
    if cds_ClienteCIDADE.AsInteger > 0 then
    begin
      VDM_Cidade.dst_CarregarCidade.Close;
      VDM_Cidade.dst_CarregarCidade.Params[0].AsInteger := cds_ClienteCIDADE.AsInteger;
      VDM_Cidade.dst_CarregarCidade.Open;

      cds_ClienteNOME.AsString := VDM_Cidade.dst_CarregarCidadeNOME.AsString;

      VDM_Cidade.dst_CarregarCidade.Close;
    end;
  finally
    FreeAndNil(VDM_Cidade);
  end;
end;

procedure Tdm_Cliente.cds_ClienteReconcileError(DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  TTratamentoErro.HandleReconcileError(E.Message, Action);
end;

end.
