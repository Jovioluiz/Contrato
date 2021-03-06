unit uServicoPayPal;

interface

uses
  uServicoPagamento, math;

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
  Result := RoundTo(Montante * FTaxaMensal * Meses, -2);
end;

function TServicoPayPal.TaxaPagamento(Valor: Currency): Currency;
begin
  Result := RoundTo(Valor * FTaxaPercentual, -2);
end;

end.
