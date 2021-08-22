unit uServicoPayGo;

interface

uses
  uServicoPagamento, math;

type TServicoPayGo = class(TInterfacedObject, IServicoPagamento)
  private
    FValorAdicional: Currency;
    procedure SetValorAdicional(const Value: Currency);

  public
    function TaxaPagamento(Valor: Currency): Currency;
    function AdicaoParcela(Montante: Currency; Meses: Integer): Currency;
    function CalculaValorAdicional(Valor: Currency): Currency;

    property ValorAdicional: Currency read FValorAdicional write SetValorAdicional;

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

function TServicoPayGo.CalculaValorAdicional(Valor: Currency): Currency;
begin
  Result := 0;
  if (Valor * FTaxaMensal) > 1000.00 then
    Result := RoundTo(Valor * 0.005, -2);
end;

procedure TServicoPayGo.SetValorAdicional(const Value: Currency);
begin
  FValorAdicional := Value;
end;

function TServicoPayGo.TaxaPagamento(Valor: Currency): Currency;
begin
  Result := RoundTo(Valor * FTaxaPercentual, -2);
end;

end.
