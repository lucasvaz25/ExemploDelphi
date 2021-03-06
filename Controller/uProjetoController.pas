unit uProjetoController;

interface

uses
  UController,
  UProjeto,
  UProjetoDao,
  System.Classes,
  System.Contnrs,
  System.Generics.Collections;

type
  TProjetoController = class( TController )
  protected
    ProjetoDao: TProjetoDao;
  public
    constructor Create;
    destructor Destroy;
    procedure Free;

    function GetInstance( var Instance: TProjetoController; OWner: TComponent ): TProjetoController;
    function GetEntity: TProjeto;

    function Insert( var Value: TObject ): Boolean; Virtual;
    function Update( var Value: TObject ): Boolean; Virtual;
    function Delete( VID: Integer ): Boolean; Virtual;
    function Search( Key: string ): TObjectList; virtual;
    function LoadList: TListaProjeto; Virtual;
  end;

implementation

{ TProjetoController }

constructor TProjetoController.Create;
begin
  inherited;
  ProjetoDao := TProjetoDao.Create;
end;

function TProjetoController.Delete( VID: Integer ): Boolean;
begin

end;

destructor TProjetoController.Destroy;
begin
  inherited;
end;

procedure TProjetoController.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

function TProjetoController.GetEntity: TProjeto;
begin
  if ( Self.Entity = nil ) then
    Self.Entity := TProjeto.Create;
  Result        := TProjeto( Self.Entity );
end;

function TProjetoController.GetInstance( var Instance: TProjetoController;
            OWner: TComponent ): TProjetoController;
begin
  if not( Assigned( Instance ) ) then
    Instance := TProjetoController.Create;
  Result     := Instance;
end;

function TProjetoController.Insert( var Value: TObject ): Boolean;
begin

end;

function TProjetoController.LoadList: TListaProjeto;
begin
  Result := Self.ProjetoDao.LoadList;
end;

function TProjetoController.Search( Key: string ): TObjectList;
begin

end;

function TProjetoController.Update( var Value: TObject ): Boolean;
begin

end;

end.
