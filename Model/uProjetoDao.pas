unit uProjetoDao;

interface

uses UDao,
  UProjeto,
  System.Contnrs,
  System.Generics.Collections;

type
  TProjetoDao = class( TDAO )
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function Insert( var Value: TObject ): Boolean; Virtual;
    function Update( var Value: TObject ): Boolean; Virtual;
    function Delete( VID: Integer ): Boolean; Virtual;
    function Search( Key: string ): TObjectList; virtual;
    function LoadList: TListaProjeto; Virtual;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Forms;

{ TProjetoDao }

constructor TProjetoDao.Create;
begin
  inherited;
end;

function TProjetoDao.Delete( VID: Integer ): Boolean;
begin

end;

destructor TProjetoDao.Destroy;
begin
  inherited;
end;

procedure TProjetoDao.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TProjetoDao.Insert( var Value: TObject ): Boolean;
begin

end;

function TProjetoDao.LoadList: TListaProjeto;
var
  Arq: TextFile;
  Valor: Currency;
  Id: Integer;
  Nome: string;
  Projeto: TProjeto;
begin
  Result := TListaProjeto.Create;
  try
    AssignFile( Arq, ( ExtractFilePath( Application.ExeName ) + 'Projetos.Dat' ) );

    Reset( Arq );
    while ( not Eof( Arq ) ) do
    begin
      ReadLn( Arq, Id );
      ReadLn( Arq, Nome );
      ReadLn( Arq, Valor );

      Projeto       := TProjeto.Create;
      Projeto.Id    := Id;
      Projeto.Nome  := Nome;
      Projeto.Valor := Valor;

      Result.Add( Projeto );
    end;
    Close( Arq );
  except
    raise Exception.Create( 'N?o foi possivel carregar a lista!' );
    Result := nil;
  end;
end;

function TProjetoDao.Search( Key: string ): TObjectList;
begin

end;

function TProjetoDao.Update( var Value: TObject ): Boolean;
begin

end;

end.
