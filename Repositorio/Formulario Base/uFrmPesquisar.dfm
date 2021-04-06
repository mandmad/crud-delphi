object frmPesquisar: TfrmPesquisar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pesquisar'
  ClientHeight = 327
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    576
    327)
  PixelsPerInch = 96
  TextHeight = 13
  object lblCampos: TLabel
    Left = 9
    Top = 7
    Width = 42
    Height = 13
    Caption = 'Campos:'
  end
  object Label2: TLabel
    Left = 9
    Top = 34
    Width = 46
    Height = 13
    Caption = 'Pesquisa:'
  end
  object cbxField: TComboBox
    Left = 60
    Top = 7
    Width = 188
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
  end
  object edtValor: TEdit
    Left = 61
    Top = 35
    Width = 285
    Height = 21
    TabOrder = 1
    OnChange = edtValorChange
  end
  object btnPesquisar: TBitBtn
    Left = 352
    Top = 34
    Width = 91
    Height = 25
    Hint = 'Localizar registro.'
    Caption = 'Localizar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF3F3F3F6F6F6FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE6E6E69D9D9D747474727272ACACACFBFBFBFFFFFFFFFFFFFFFFFFFAFAFA
      E2E2E2D4D4D4E6E6E6FEFEFEFFFFFFFFFFFFA7A7A758514BAC9065BC9F6C836E
      57B7B7B7FFFFFFFFFFFFFCFCFCB4B4B47E7E7E7373738D8D8DD1D1D1F4F4F4CA
      CACA747474B79766E7D683E1CE75DEC27A746A64FFFFFFFFFFFFEBEBEB555453
      8A7660A9906C806E5D9292927E7E7EA4A4A4737373C6A67EEBDEB7EDE2C1B8A9
      92363433BFBFBFFFFFFFA4A4A49C7D53E6D27AE3D074DDC1706D655D76767697
      9797B4B4B43E39366F665C79756F6666663636354B4B4BC8C8C89D9D9DD5B98B
      E8DBA9E9DCB1D2BE8C433E3AB4B4B4E2E2E2EAEAEA6060603D3D3C6363637171
      714242417E7E7EA3A3A3ECECEB756454BDA784B09C7A746A5B4646467D7D7D96
      96969A9A9A828282323231585858727272515150686868EDEDEDFFFFFFAEAEAE
      3534345E5E5E7474745555554444448888888484847777772D2D2C4C4C4B6E6E
      6E5E5E5E727272FFFFFFFFFFFFFFFFFF6666664E4E4E7171716262623434343B
      3B3B7474743333332C2C2C3F3F3F60605F535352535353FFFFFFFFFFFFFFFFFF
      E7E7E74646466565656A6A6A4242423B3B3B4949494A4A4A5151515959595B5B
      5B4E4E4E262626FFFFFFFFFFFFFFFFFFFFFFFF7878785656565D5D5D5B5B5B57
      57575555554D4D4D3E3E3E6868684848482222224E4E4EFFFFFFFFFFFFFFFFFF
      FFFFFFE2E2E24949495A5A5A6A6A6A5151513939395555559B9B9BFFFFFFCDCD
      CD565656999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C73C3C3C5656568C
      8C8CF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFC8C8C8979797DFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnPesquisarClick
  end
  object OK: TBitBtn
    Left = 477
    Top = 294
    Width = 91
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF48884B4B994EFBFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF47854952CC5B77EE813F
      8740FAFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF4380453CC14560FE6F69FF7858F065328535F8FEF9FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF457E4529B3354FE95E78EF8479F28458
      F5674AE7562D8030F8FDF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF487D49
      29A33553D75F88E4918EE5969FEAA571E77C4AE7593FD64C29772CF6FBF7FFFF
      FFFFFFFFFFFFFFFFFFFF5E90605EB4676FD1799DDFA398DF9F2C8831398C3E99
      E5A069DB7439D84931C23D256D27F6FAF6FFFFFFFFFFFFFFFFFFEAF4EB529757
      B5DDBAA9DAAE36933CC5EBC8F9FDFA419B47A5E2AA60D06A28C93722B02F2665
      27F7F9F7FFFFFFFFFFFFFFFFFFEBF7EC429748449548BEE7C1FFFFFFFFFFFFF3
      FBF43C9642B3E3B755C46015B72513A320266428F6F8F6FFFFFFFFFFFFFFFFFF
      ECF8EDCBECCEFFFFFFFFFFFFFFFFFFFFFFFFF4FBF539903EB4DCB751B25A069E
      140B9517306A32EFF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF4FAF43B9041B6D7B9529F5A3A99414993514E7D4EFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FBF43C9142BAD7
      BD569E5D4B814CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF4FBF4409145538B54FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFD
      FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 3
    OnClick = OKClick
  end
  object ds_Localizar: TDataSource
    DataSet = cds_Localizar
    Left = 235
    Top = 272
  end
  object cds_Localizar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Localizar'
    Left = 168
    Top = 272
  end
  object dst_Localizar: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dm_Conexao.Conn
    Left = 32
    Top = 272
  end
  object dsp_Localizar: TDataSetProvider
    DataSet = dst_Localizar
    Left = 96
    Top = 272
  end
end
