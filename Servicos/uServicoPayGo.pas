unit uServicoPayGo;

interface

uses
  uServicoPagamento, math;

type TServicoPayGo = class(TInterfacedObject, IServicoPagamento)

  public
    function TaxaPagamento(Valor: Currency): Currency;
    function AdicaoParcela(Montante: Currency; Meses: Integer): Currency;

end;

implementation

const
  FTaxaPercentual = 0.09;
  FTaxaMensal = 0.025;

{ TServicoPayGo }

function TServicoPayGo.AdicaoParcela(Montante: Currency; Meses: Integer): Currency;
begin
  Result := RoundTo(Montante * FTaxaMensal * Meses, -2);
end;

function TServicoPayGo.TaxaPagamento(Valor: Currency): Currency;
begin
  Result := RoundTo(Valor * FTaxaPercentual, -2);
end;

end.
