object dm_cidade: Tdm_cidade
  OldCreateOrder = False
  Height = 159
  Width = 515
  object dst_CarregarCidade: TSQLDataSet
    CommandText = 
      'select'#13#10'  Cidade.id,'#13#10'  cidade.nome'#13#10'from cidade '#13#10'where'#13#10'  (cid' +
      'ade.id = :id)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = dm_Conexao.Conn
    Left = 56
    Top = 32
    object dst_CarregarCidadeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object dst_CarregarCidadeNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
end
