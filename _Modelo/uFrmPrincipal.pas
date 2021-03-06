unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ActnCtrls,ToolWin, ActnMan,
  ActnMenus, ImgList, ActnList, StdActns, ComCtrls, ExtCtrls, jpeg, Menus, CustomizeDlg, StdCtrls, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, System.ImageList, uSistema;

type
  TfrmPrincipal = class(TForm)
    Image: TImageList;
    BarInforDoSistema: TStatusBar;
    Menu: TActionManager;
    Action1: TAction;
    Image1: TImage;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action2Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uConstantes;

procedure TfrmPrincipal.Action2Execute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox(PChar('Deseja sair do Sistema?'), 'Confirma??o',
    MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes then
  begin
    Application.Terminate;
  end
  else
    Abort;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TSistema.GetInstance().EmpresaCorrente.Id := 1;
  TSistema.GetInstance().EmpresaCorrente.CarregarEmpresaCorrente();
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  BarInforDoSistema.Panels[0].Text := 'Vers?o: ' + uConstantes.VERSAO_DO_SISTEMA;
  BarInforDoSistema.Panels[1].Text := 'Empresa: ' + FormatFloat('000', TSistema.GetInstance().EmpresaCorrente.Id )
    + ' - ' + TSistema.GetInstance().EmpresaCorrente.RSocial;
end;

end.
