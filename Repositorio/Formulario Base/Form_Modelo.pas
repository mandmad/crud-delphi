unit Form_Modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ToolWin, ActnList, ImgList, DB, StdCtrls, DBClient, Buttons, ActnMan, ActnCtrls,
  PlatformDefaultStyleActnCtrls,  ExtCtrls, Grids, DBGrids, Provider, SqlExpr, Generics.Collections, DBCtrls, FMTBcd,
  uDM_Conexao, System.Actions, System.ImageList, uEnumerados, sException, TratamentoErro;

type
  TfrmForm_Modelo = class(TForm)
    pgcAbasCadastro: TPageControl;
    tshConsultar: TTabSheet;
    tshCadastro: TTabSheet;
    dts: TDataSource;
    pnlRodape: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlPesquisa: TPanel;
    lblCampos: TLabel;
    Label2: TLabel;
    cbxField: TComboBox;
    edtValor: TEdit;
    btnPesquisar: TBitBtn;
    Action: TActionList;
    actNovo: TAction;
    actAlterar: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    actDeletar: TAction;
    actGravar: TAction;
    actCancelar: TAction;
    actSair: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    dst_Localizar: TSQLDataSet;
    dsp_Localizar: TDataSetProvider;
    cds_Localizar: TClientDataSet;
    ds_Localizar: TDataSource;
    Images: TImageList;
    procedure actSairExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actDeletarExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Action2Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure actNovoUpdate(Sender: TObject);
    procedure actGravarUpdate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
  protected
    FId: Integer;
    FNomeTabela: string;
    FComponenteFoco : TWinControl;
    FDbgCadastro: TDBGrid;
    FRegistro: TBookmark;
  private

  protected
    FAcao: TAcao;
  public
    procedure ValidarCamposObrigatorios; virtual;
    procedure ValidarRegraNegocio; virtual;
    procedure CamposDefault; virtual;
    procedure Novo; virtual;
    procedure Delete; virtual;
    procedure Gravar; virtual;
    procedure Alterar; virtual;
    procedure Visualizar; virtual;
    procedure Cancelar; virtual;
    procedure Localizar(ASql: String = ''); virtual;
    procedure CarregarComboBoxPesquisa;
    procedure HabilitarDesabilitarComponentes(AAcao: Boolean);
  end;

var
  frmForm_Modelo: TfrmForm_Modelo;

implementation

{$R *.dfm}

uses sFuncoes;

procedure TfrmForm_Modelo.actAlterarExecute(Sender: TObject);
begin
  Self.Alterar();
end;

procedure TfrmForm_Modelo.actCancelarExecute(Sender: TObject);
begin
   Self.Cancelar();
end;

procedure TfrmForm_Modelo.actDeletarExecute(Sender: TObject);
begin
  Self.Delete();
end;

procedure TfrmForm_Modelo.actGravarExecute(Sender: TObject);
begin
  Self.Gravar();
end;

procedure TfrmForm_Modelo.actNovoExecute(Sender: TObject);
begin
  Self.Novo();
end;

procedure TfrmForm_Modelo.actNovoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Dts.State in [dsInactive, dsBrowse];
end;

procedure TfrmForm_Modelo.Action2Execute(Sender: TObject);
begin
  Self.Alterar();
end;

procedure TfrmForm_Modelo.Action3Execute(Sender: TObject);
begin
  Self.Delete();
end;

procedure TfrmForm_Modelo.Action4Execute(Sender: TObject);
begin
  Self.Gravar();
end;

procedure TfrmForm_Modelo.actGravarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := Dts.State in [dsEdit, dsInsert];
end;

procedure TfrmForm_Modelo.Action5Execute(Sender: TObject);
begin
  Self.Cancelar();
end;

procedure TfrmForm_Modelo.Action8Execute(Sender: TObject);
begin
  Close;
end;

procedure TfrmForm_Modelo.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmForm_Modelo.Alterar;
begin
  try
    Self.FAcao := uEnumerados.acAlterar;

    Self.FRegistro := TClientDataSet(ds_Localizar.DataSet).GetBookmark;

    Self.HabilitarDesabilitarComponentes(True);

    if not ds_Localizar.DataSet.IsEmpty then
    begin
      //TClientDataSet(Dts.DataSet).FetchParams;

      Dts.DataSet.Close;

      TClientDataSet(Dts.DataSet).Params[0].AsInteger := ds_Localizar.DataSet.Fields[0].AsInteger;

      Dts.DataSet.Open;

      if Assigned(Self.FDbgCadastro) then
        Self.FDbgCadastro.SetFocus;

      pgcAbasCadastro.ActivePage := tshCadastro;
      Dts.DataSet.Edit;

      if Assigned(Self.FComponenteFoco) then
        Self.FComponenteFoco.SetFocus();
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar(E.Message), PChar('Erro'), MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmForm_Modelo.btnPesquisarClick(Sender: TObject);
begin
  Self.Localizar();

  if Assigned(Self.FDbgCadastro) then
    FDbgCadastro.SetFocus();
end;

procedure TfrmForm_Modelo.CamposDefault;
begin
  //
end;

procedure TfrmForm_Modelo.Cancelar;
begin
  TClientDataSet(Dts.DataSet).CancelUpdates;
  pgcAbasCadastro.ActivePage := tshConsultar;

  if Assigned(Self.FDbgCadastro) then
    Self.FDbgCadastro.SetFocus;

  Self.edtValor.Clear();
  Self.cbxField.SetFocus();
end;

procedure TfrmForm_Modelo.CarregarComboBoxPesquisa;
var
  I: Integer;
begin
  for I := 0 to Pred(cds_Localizar.FieldCount) do
    cbxField.Items.Add(cds_Localizar.Fields[I].DisplayLabel);
end;

procedure TfrmForm_Modelo.Delete;
begin
  Self.FAcao := uEnumerados.acExcluir;
  try
   if not ds_Localizar.DataSet.IsEmpty then
   begin
    // TClientDataSet(Dts.DataSet).FetchParams;

     Dts.DataSet.Close;
     TClientDataSet(Dts.DataSet).Params[0].AsInteger := ds_Localizar.DataSet.Fields[0].AsInteger;
     Dts.DataSet.Open;

     ds_Localizar.DataSet.Close;

     if Application.MessageBox(PChar('Deseja Excluir o registro?'), 'Confirma??o',
       MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes then
     begin
       Dts.DataSet.Delete;

       if TClientDataSet(Dts.DataSet).ApplyUpdates(0) > 0 then
         raise EOnReconcileError.Create(TTratamentoErro.GetMensagemErroApplyUpdate());

       Self.edtValor.Clear();
       Self.cbxField.SetFocus();
       Dts.DataSet.Close;
     end;
   end;
  except
    on E: Exception do
    begin
      Dts.DataSet.Close;
        Application.MessageBox(PChar(E.Message), PChar('Erro'), MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmForm_Modelo.edtValorExit(Sender: TObject);
begin
  if not ds_Localizar.DataSet.IsEmpty then
  begin
    if Assigned(Self.FDbgCadastro) then
      Self.FDbgCadastro.SetFocus;
  end;
end;

procedure TfrmForm_Modelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if Dts.DataSet.State in [dsInsert] then
//    Self.FPersistencia.GetId(FIdEmpresa, FId, FNomeTabela);

  if Dts.DataSet.Active then
    Dts.DataSet.Close;

  if ds_Localizar.DataSet.Active then
    ds_Localizar.DataSet.Close;
end;

procedure TfrmForm_Modelo.FormCreate(Sender: TObject);
begin
  cds_Localizar.Close;
  cds_Localizar.Open;
end;

procedure TfrmForm_Modelo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    actNovo.Execute;
  end;

  if Key = VK_F4 then
  begin
    actAlterar.Execute;
  end;

  if Key = VK_DELETE then
  begin
    actDeletar.Execute;
  end;

  if Key = VK_F5 then
  begin
    actCancelar.Execute;
  end;

  if Key = Vk_END then
  begin
    actGravar.Execute;
  end;

  if Key = VK_ESCAPE then
  begin
    actSair.Execute;
  end;
end;

procedure TfrmForm_Modelo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmForm_Modelo.FormShow(Sender: TObject);
begin
  tshCadastro.TabVisible  := False;
  tshConsultar.TabVisible := False;

  Self.CarregarComboBoxPesquisa();

  cbxField.ItemIndex := 0;

  pgcAbasCadastro.ActivePage := tshConsultar;

  edtValor.SetFocus();
end;

procedure TfrmForm_Modelo.Gravar;
begin
  try
    if FAcao <> uEnumerados.acVisualizar then
    begin
      Self.ValidarCamposObrigatorios();

      Self.ValidarRegraNegocio();

      TClientDataSet(Dts.DataSet).Post;

      if TClientDataSet(Dts.DataSet).ApplyUpdates(0) > 0 then
        raise EOnReconcileError.Create(TTratamentoErro.GetMensagemErroApplyUpdate());

      pgcAbasCadastro.ActivePage := tshConsultar;

      if Assigned(Self.FDbgCadastro) then
        Self.FDbgCadastro.SetFocus;

      if FAcao in [acIncluir, acAlterar, acExcluir] then
      begin
        btnPesquisar.Click;
      end;
    end
    else
    begin
      pgcAbasCadastro.ActivePage := tshConsultar;

      if Assigned(Self.FDbgCadastro) then
        Self.FDbgCadastro.SetFocus;
    end;
  except
    on E: ECampoObrigatorioError do
    begin
      Application.MessageBox(PChar(E.Message), PChar('Valida??o'), MB_OK + MB_ICONINFORMATION);
      Exit;
    end;

    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), PChar('Erro'), MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
  end;
end;

procedure TfrmForm_Modelo.HabilitarDesabilitarComponentes(AAcao: Boolean);
var
  I: Integer;
begin
  if AAcao then
  begin
    for I := 0 to Pred(ComponentCount) do
    begin
      if Components[I] is TGroupBox then
        TGroupBox(Components[I]).Enabled:= True
      else if Components[I] is TDBEdit then
        TDBEdit(Components[I]).ReadOnly := False
      else if Components[I] is TDBComboBox then
        TDBComboBox(Components[I]).ReadOnly := False
      else if Components[I] is TDBLookupComboBox then
        TDBLookupComboBox(Components[I]).ReadOnly := False
      else if Components[I] is TCheckBox then
        TCheckBox(Components[I]).Enabled := True
      else if Components[I] is TSpeedButton then
        TSpeedButton(Components[I]).Enabled := True
      else if Components[I] is TDBMemo then
        TDBMemo(Components[I]).ReadOnly := False
      else if Components[I] is TDBGrid then
        TDBGrid(Components[I]).ReadOnly := False;
    end;
  end
  else
  begin
    for I := 0 to Pred(ComponentCount) do
    begin
      if Components[I] is TGroupBox then
        TGroupBox(Components[I]).Enabled:= False
      else if Components[I] is TDBEdit then
        TDBEdit(Components[I]).ReadOnly := True
      else if Components[I] is TDBComboBox then
        TDBComboBox(Components[I]).ReadOnly := True
      else if Components[I] is TDBLookupComboBox then
        TDBLookupComboBox(Components[I]).ReadOnly := True
      else if Components[I] is TCheckBox then
        TCheckBox(Components[I]).Enabled := False
      else if Components[I] is TSpeedButton then
        TSpeedButton(Components[I]).Enabled := False
      else if Components[I] is TDBMemo then
        TDBMemo(Components[I]).ReadOnly := True
      else if Components[I] is TDBGrid then
        TDBGrid(Components[I]).ReadOnly := True;
    end;
  end;
end;

procedure TfrmForm_Modelo.Localizar(ASql: String = '');
var
  VMontarSql: String;
  VCampo: String;
  VSql: String;
begin
  VMontarSql := EmptyStr;

  VCampo := cds_Localizar.Fields[cbxField.ItemIndex].FieldName;

  VSql := TFuncoes.MontarSqlComponente(dst_Localizar);

  VMontarSql := ' where upper(' + VCampo + ')' + ' like ' + ' upper( ' +
  QuotedStr(edtValor.Text + '%') + ') ' + ASql + ' order by ' + VCampo;

  cds_Localizar.Close;
  dst_Localizar.CommandText := VSql + VMontarSql;
  cds_Localizar.Open;
end;

procedure TfrmForm_Modelo.Novo;
begin
  try
    Self.FAcao := uEnumerados.acIncluir;

    Self.HabilitarDesabilitarComponentes(True);

    if not Dts.DataSet.Active then
    begin
      TClientDataSet(Dts.DataSet).FetchParams;

      Dts.DataSet.Close;
      TClientDataSet(Dts.DataSet).Params[0].AsInteger := -1;
      Dts.DataSet.Open;
    end;

    Dts.DataSet.Append();
    pgcAbasCadastro.ActivePage := tshCadastro;
    Self.CamposDefault();

    if Assigned(Self.FComponenteFoco) then
      Self.FComponenteFoco.SetFocus();
  except
    on E: Exception do
      Application.MessageBox(PChar(E.Message), PChar('Erro'), MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmForm_Modelo.ValidarCamposObrigatorios;
var
  I: Integer;
begin
  for I := 0 to Pred(dts.DataSet.FieldCount) do
  begin
    if (dts.DataSet.Fields[I].Required) then
    begin
      if (dts.DataSet.Fields[I].IsNull) or (dts.DataSet.Fields[I].AsString = EmptyStr) then
      begin
        dts.DataSet.Fields[I].FocusControl;
        raise ECampoObrigatorioError.Create('Campo "' + dts.DataSet.Fields[i].DisplayLabel + '" ? de preenchimento Obrigat?rio.');
      end;
    end;
  end;
end;

procedure TfrmForm_Modelo.ValidarRegraNegocio;
begin
 //
end;

procedure TfrmForm_Modelo.Visualizar;
begin
  try
    Self.FAcao := uEnumerados.acVisualizar;

    if not ds_Localizar.DataSet.IsEmpty then
    begin
      Dts.DataSet.Close;
      TClientDataSet(Dts.DataSet).Params[0].AsInteger := ds_Localizar.DataSet.Fields[0].AsInteger;
      Dts.DataSet.Open;

      pgcAbasCadastro.ActivePage := tshCadastro;
      Self.HabilitarDesabilitarComponentes(False);
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar(E.Message), PChar('Erro'), MB_OK + MB_ICONINFORMATION);
  end;
end;

end.
