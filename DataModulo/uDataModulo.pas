unit uDataModulo;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  Tdm = class(TDataModule)
    ds: TDataSource;
    cds: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
