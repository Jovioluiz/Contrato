unit uServicoPagamento;

interface

type IServicoPagamento = Interface

  function TaxaPagamento(Valor: Currency): Currency;
  function AdicaoParcela(montante: Currency; Meses: Integer): Currency;

end;
implementation

end.
