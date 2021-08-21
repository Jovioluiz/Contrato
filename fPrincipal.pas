unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uServicoContrato, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    edtNumeroContrato: TEdit;
    edtValorContrato: TEdit;
    edtData: TEdit;
    edtNumeroParcelas: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcessaContrato(NumeroContrato: Integer; Data: TDateTime; ValorContrato: Currency; NumeroParcelas: Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uContrato, uServicoPayPal;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ProcessaContrato(StrToInt(edtNumeroContrato.Text), StrToDate(edtData.Text), StrToCurr(edtValorContrato.Text), StrToInt(edtNumeroParcelas.Text));
end;

procedure TForm1.ProcessaContrato(NumeroContrato: Integer; Data: TDateTime; ValorContrato: Currency; NumeroParcelas: Integer);
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

  finally
    contrato.Free;
    servicoContrato.Free;
  end;
end;

end.
