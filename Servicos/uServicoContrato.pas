unit uServicoContrato;

interface

uses
  uServicoPayPal, uContrato, System.SysUtils, uServicoPagamento;

type TServicoContrato = class
  private
    FServicoPayPal: IServicoPagamento;

  public
    procedure ProcessaContrato(Contrato: TContrato; Meses: Integer);
    constructor Create(Servico: IServicoPagamento);

    property ServicePaypal: IServicoPagamento read FServicoPayPal write FServicoPayPal;
end;

implementation

uses
  uParcela;

{ TServicoContrato }

constructor TServicoContrato.Create(Servico: IServicoPagamento);
begin
  FServicoPayPal := Servico;
end;

procedure TServicoContrato.ProcessaContrato(Contrato: TContrato; Meses: Integer);
var
  valorBase,
  valorParcela: Currency;
  Parcela: TParcela;
begin
  Parcela := TParcela.Create;

  try
    valorBase := Contrato.ValorTotal / Meses;

    for var i := 0 to Pred(Meses) do
    begin
      Parcela.DataVencimento := IncMonth(Contrato.Data, i + 1);
      valorParcela := valorBase + FServicoPayPal.AdicaoParcela(valorBase, i + 1);
      Parcela.ValorParcela := valorParcela + FServicoPayPal.TaxaPagamento(valorParcela);

      Contrato.AddParcelas(Parcela);
    end;
  finally
    Parcela.Free;
  end;
end;

end.
