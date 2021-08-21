unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uServicoContrato, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uListaDados;

type
  TfrmPrincipal = class(TForm)
    edtNumeroContrato: TEdit;
    edtValorContrato: TEdit;
    edtData: TEdit;
    edtNumeroParcelas: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    dbGrid: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FListaDados: TListaDados;
    { Private declarations }
    procedure ProcessaContrato(NumeroContrato: Integer; Data: TDateTime; ValorContrato: Currency; NumeroParcelas: Integer);
    procedure SetListaDados(const Value: TListaDados);
  public
    { Public declarations }
    property ListaDados: TListaDados read FListaDados write SetListaDados;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uContrato, uServicoPayPal;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  ProcessaContrato(StrToInt(edtNumeroContrato.Text),
                   StrToDate(edtData.Text),
                   StrToCurr(edtValorContrato.Text),
                   StrToInt(edtNumeroParcelas.Text));
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaDados := TListaDados.Create;
  dbGrid.DataSource := FListaDados.Dados.ds;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FListaDados.Free;
end;

procedure TfrmPrincipal.ProcessaContrato(NumeroContrato: Integer; Data: TDateTime; ValorContrato: Currency; NumeroParcelas: Integer);
var
  contrato: TContrato;
  servicoContrato: TServicoContrato;
begin
  contrato := TContrato.Create;
  servicoContrato := TServicoContrato.Create(TServicoPayPal.Create);

  try
    contrato.Numero := NumeroContrato;
    contrato.Data := Data;
    contrato.ValorTotal := ValorContrato;
    servicoContrato.ProcessaContrato(contrato, NumeroParcelas);

    for var par in contrato.Parcelas do
    begin
      FListaDados.Dados.cds.Append;
      FListaDados.Dados.cds.FieldByName('data_vencimento').AsDateTime := par.DataVencimento;
      FListaDados.Dados.cds.FieldByName('valor_parcela').AsCurrency := par.ValorParcela;
      FListaDados.Dados.cds.Post;
    end;

  finally
    contrato.Free;
    servicoContrato.Free;
  end;
end;

procedure TfrmPrincipal.SetListaDados(const Value: TListaDados);
begin
  FListaDados := Value;
end;

end.
