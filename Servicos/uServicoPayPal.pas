unit uServicoPayPal;

interface

uses
  uServicoPagamento;

type TServicoPayPal = class(TInterfacedObject, IServicoPagamento)

  public
    function TaxaPagamento(Valor: Currency): Currency;
    function AdicaoParcela(Montante: Currency; Meses: Integer): Currency;
end;

implementation

const
  FTaxaPercentual = 0.02;
  FTaxaMensal = 0.01;

{ TServicoPayPal }

function TServicoPayPal.AdicaoParcela(Montante: Currency; Meses: Integer): Currency;
begin
  Result := Montante * FTaxaMensal * Meses;
end;

function TServicoPayPal.TaxaPagamento(Valor: Currency): Currency;
begin
  Result := Valor * FTaxaPercentual;
end;

end.
