unit uProjeto;

interface

uses UPai,
  System.Math,
  System.Generics.Collections;

type
  TProjeto = class( TPai )
  private
    FNome: string;
    FValor: Currency;
    procedure SetNome( const Value: string );
    procedure SetValor( const Value: Currency );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;
    procedure CopiarDados( Value: Tprojeto );

    property Nome: string read FNome write SetNome;
    property Valor: Currency read FValor write SetValor;
  end;

  TListaProjeto = class( Tobjectlist<TProjeto> )
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetTotal: Currency;
    function GetTotalDiv: Currency;
  end;

implementation

{ TProjeto }

procedure TProjeto.CopiarDados( Value: Tprojeto );
begin
  inherited CopiarDados( Value );
  FNome  := Value.Nome;
  Fvalor := Value.Valor;
end;

constructor TProjeto.Create;
begin
  inherited;
  Fnome  := '';
  FValor := 0;
end;

destructor TProjeto.Destroy;
begin
  inherited;
end;

procedure TProjeto.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure TProjeto.SetNome( const Value: string );
begin
  FNome := Value;
end;

procedure TProjeto.SetValor( const Value: Currency );
begin
  FValor := Value;
end;

{ TListaProjeto }

constructor TListaProjeto.Create;
begin
  inherited;
end;

destructor TListaProjeto.Destroy;
begin
  inherited;
end;

procedure TListaProjeto.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TListaProjeto.GetTotal: Currency;
var
  I: Integer;
begin
  Result := 0;

  for I    := 0 to Self.Count - 1 do
    Result := Result + Self[ I ].Valor;

  Result := RoundTo( Result, -2 );
end;

function TListaProjeto.GetTotalDiv: Currency;
var
  I: Integer;
begin
  Result := 0;

  for I := 0 to Self.Count - 2 do
  begin
    Result := Result + ( Self[ I + 1 ].Valor / Self[ I ].Valor );
  end;
  Result := RoundTo( Result, -2 );
end;

end.
