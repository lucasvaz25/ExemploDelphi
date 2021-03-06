unit uPai;

interface

type
  Tpai = class
  private
    FId: Integer;
    procedure SetId( const Value: Integer );
  public
    constructor Create;
    destructor Destroy;
    procedure Free;
    procedure CopiarDados( Value: Tpai );

    property Id: Integer read FId write SetId;
  end;

implementation

{ Tpai }

procedure Tpai.CopiarDados( Value: Tpai );
begin
  FId := Value.Id;
end;

constructor Tpai.Create;
begin
  inherited;
  FId := 0;
end;

destructor Tpai.Destroy;
begin
  inherited;
end;

procedure Tpai.Free;
begin
  if Assigned( Self ) then
    Self.Destroy;
end;

procedure Tpai.SetId( const Value: Integer );
begin
  FId := Value;
end;

end.
