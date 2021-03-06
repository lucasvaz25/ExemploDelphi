unit UMyThread;

interface

uses
  System.Classes,
  Vcl.ComCtrls;

type
  TMyThread = class( TThread )

  private
    _Time: Integer;
    _Progress: TProgressBar;
  public
    constructor Create( Time: Integer; Progress: TProgressBar );
    destructor Destroy; override;

    procedure Execute; override;

  end;

implementation

uses
  System.SysUtils,
  Vcl.Dialogs;

const
  Limit = 100;

  { Tarefa2 }

constructor TMyThread.Create( Time: Integer; Progress: TProgressBar );
begin
  inherited Create( True );
  FreeOnTerminate := True;
  _Time           := Time;
  _Progress       := Progress;
  _Progress.Max   := Limit;
end;

destructor TMyThread.Destroy;
begin
  inherited;
end;

procedure TMyThread.Execute;
var
  I: Integer;
begin
  inherited;

  I := 1;

  while not( I > Limit ) do
  begin
    _Progress.Position := I;
    Sleep( Self._Time );
    Inc( I );
  end;

end;

end.
