inherited frmPesquisarCidade: TfrmPesquisarCidade
  Caption = 'Cidade'
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid [6]
    Left = 8
    Top = 62
    Width = 560
    Height = 226
    DataSource = ds_Localizar
    DrawingStyle = gdsGradient
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end>
  end
  inherited cds_Localizar: TClientDataSet
    object cds_LocalizarID: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID'
      Required = True
    end
    object cds_LocalizarNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
  end
  inherited dst_Localizar: TSQLDataSet
    CommandText = 
      'select'#13#10'  Cidade.id,'#13#10'  cidade.nome'#13#10'from cidade'#13#10'where'#13#10'  (cida' +
      'de.id = -1)'
    object dst_LocalizarID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dst_LocalizarNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
end
