unit uDao;

interface

uses
  Classes,
  SysUtils,
  Contnrs;

type

  TDAO = class

  public
    constructor Create;
    destructor Destroy;

    function Insert( var Value: TObject ): Boolean; Virtual;
    function Update( var Value: TObject ): Boolean; Virtual;
    function Delete( VID: Integer ): Boolean; Virtual;
    function Search( Key: string ): TObjectList; virtual;
    function LoadList: TObjectlist; Virtual;
  end;

implementation

{ TDAO }

constructor TDAO.Create;
begin

end;

function TDAO.Delete( VID: Integer ): Boolean;
begin

end;

destructor TDAO.Destroy;
begin

end;

function TDAO.Insert( var Value: TObject ): Boolean;
begin

end;

function TDAO.LoadList: TObjectlist;
begin

end;

function TDAO.Search( Key: string ): TObjectList;
begin

end;

function TDAO.Update( var Value: TObject ): Boolean;
begin

end;

end.
