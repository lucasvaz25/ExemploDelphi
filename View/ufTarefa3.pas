unit ufTarefa3;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UFBase,
  Data.DB,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Datasnap.DBClient,
  UProjetoController;

type
  TfTarefa3 = class( TfBase )
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EdTotal: TLabeledEdit;
    EdTotalDiv: TLabeledEdit;
    BtnTotal: TButton;
    BtnTotalDiv: TButton;
    procedure FormCreate( Sender: TObject );
    procedure FormShow( Sender: TObject );
    procedure BtnTotalClick( Sender: TObject );
    procedure BtnTotalDivClick( Sender: TObject );
  private
    { Private declarations }
    CdsProjeto: TClientDataSet;
    DsProjeto: TDataSource;
    procedure PopulaInterface;
    procedure ConfigDataset;
    procedure ConfigDBGrid;
    procedure CalcValorTotal;
    procedure CalcValorTotalDiv;
  public
    { Public declarations }
    ProjetoControl: TProjetoController;
  end;

implementation

uses
  System.Generics.Collections,
  UProjeto;
{$R *.dfm}


procedure TfTarefa3.BtnTotalClick( Sender: TObject );
begin
  inherited;
  Self.CalcValorTotal;
end;

procedure TfTarefa3.BtnTotalDivClick( Sender: TObject );
begin
  inherited;
  Self.CalcValorTotalDiv;
end;

procedure TfTarefa3.CalcValorTotal;
begin
  EdTotal.Text := FormatFloat( '#.00', ( ProjetoControl.LoadList.GetTotal ) );
end;

procedure TfTarefa3.CalcValorTotalDiv;
begin
  EdTotalDiv.Text := FormatFloat( '#.00', ( ProjetoControl.LoadList.GetTotalDiv ) );
end;

procedure TfTarefa3.ConfigDataset;
begin
  CdsProjeto := TClientDataSet.Create( Self );
  CdsProjeto.Close;
  CdsProjeto.FieldDefs.Clear;
  CdsProjeto.FieldDefs.Add( 'id', FtInteger );
  CdsProjeto.FieldDefs.Add( 'nomeprojeto', FtString, 30 );
  CdsProjeto.FieldDefs.Add( 'valor', FtCurrency );
  CdsProjeto.CreateDataset;
  CdsProjeto.Active := True;
  CdsProjeto.DisableControls;
  CdsProjeto.Open;
end;

procedure TfTarefa3.ConfigDBGrid;
begin
  DsProjeto := TDataSource.Create( Self );

  DsProjeto.DataSet := CdsProjeto;

  DBGrid1.DataSource                   := DsProjeto;
  DBGrid1.Columns.Items[ 0 ].FieldName := 'id';
  DBGrid1.Columns.Items[ 1 ].FieldName := 'nomeprojeto';
  DBGrid1.Columns.Items[ 2 ].FieldName := 'valor';
end;

procedure TfTarefa3.FormCreate( Sender: TObject );
begin
  inherited;
  ProjetoControl := nil;
  ProjetoControl.GetInstance( ProjetoControl, Self );

  Self.ConfigDataset;
  Self.ConfigDBGrid;

end;

procedure TfTarefa3.FormShow( Sender: TObject );
begin
  inherited;
  Self.PopulaInterface;
end;

procedure TfTarefa3.PopulaInterface;
var
  List: TListaProjeto;
  I: Integer;
begin

  CdsProjeto.EmptyDataSet;
  List := ProjetoControl.LoadList;

  if List <> nil then
    if List.Count > 0 then
    begin
      for I := 0 to List.Count - 1 do
      begin
        CdsProjeto.Append;

        CdsProjeto.FieldByName( 'id' ).AsInteger         := List[ I ].Id;
        CdsProjeto.FieldByName( 'nomeprojeto' ).AsString := List[ I ].Nome;
        CdsProjeto.FieldByName( 'valor' ).AsCurrency     := List[ I ].Valor;

        CdsProjeto.Post;
      end;
      CdsProjeto.EnableControls;
    end;
end;

end.
