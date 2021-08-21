unit uContrato;

interface

uses
  System.Generics.Collections, uParcela;

type TContrato = class
  private
    FNumero: Integer;
    FData: TDateTime;
    FValorTotal: Currency;
    FParcelas: TList<TParcela>;
    procedure SetNumero(const Value: Integer);
    procedure SetData(const Value: TDateTime);
    procedure SetValorTotal(const Value: Currency);

  public
    procedure AddParcelas(Parcelas: TParcela);
    constructor Create;
    destructor Destroy; override;

    property Numero: Integer read FNumero write SetNumero;
    property Data: TDateTime read FData write SetData;
    property ValorTotal: Currency read FValorTotal write SetValorTotal;
    property Parcelas: TList<TParcela> read FParcelas write FParcelas;

end;

implementation

{ TContrato }

procedure TContrato.AddParcelas(Parcelas: TParcela);
begin
  FParcelas.Add(Parcelas);
end;

constructor TContrato.Create;
begin
  FParcelas := TList<TParcela>.Create;
end;

destructor TContrato.Destroy;
begin
  FParcelas.Free;
  inherited;
end;

procedure TContrato.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TContrato.SetValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

procedure TContrato.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

end.
