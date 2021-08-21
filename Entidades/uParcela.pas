unit uParcela;

interface

type TParcela = class
  private
    FDataVencimento: TDateTime;
    FValorParcela: Currency;
    procedure SetDataVencimento(const Value: TDateTime);
    procedure SetValorParcela(const Value: Currency);

  public
    function ToString: string; override;
    property DataVencimento: TDateTime read FDataVencimento write SetDataVencimento;
    property ValorParcela: Currency read FValorParcela write SetValorParcela;
end;

implementation

{ TParcela }

procedure TParcela.SetDataVencimento(const Value: TDateTime);
begin
  FDataVencimento := Value;
end;

procedure TParcela.SetValorParcela(const Value: Currency);
begin
  FValorParcela := Value;
end;

function TParcela.ToString: string;
begin

end;

end.
