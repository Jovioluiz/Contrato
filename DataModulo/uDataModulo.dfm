object dm: Tdm
  OldCreateOrder = False
  Height = 139
  Width = 203
  object ds: TDataSource
    DataSet = cds
    Left = 40
    Top = 48
  end
  object cds: TClientDataSet
    PersistDataPacket.Data = {
      5C0000009619E0BD0100000018000000020000000000030000005C000D76616C
      6F725F70617263656C6108000400000001000753554254595045020049000600
      4D6F6E6579000F646174615F76656E63696D656E746F08000800000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'valor_parcela'
        DataType = ftCurrency
      end
      item
        Name = 'data_vencimento'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 48
  end
end
