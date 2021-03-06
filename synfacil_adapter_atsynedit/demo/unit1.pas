unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ATSynEdit,
  synfacil_adapter_atsynedit;

type
  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    ed: TATSynEdit;
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  adapter: TSynFacilAdapter;
const
  nTest = 10.20000;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin
  adapter:= TSynFacilAdapter.Create(Self);
  adapter.SetSyntax('Pascal.xml');

  ed:= TATSynEdit.Create(Self);
  ed.Parent:= Self;
  ed.Font.Name:= 'Courier New';
  ed.Align:= alClient;
  ed.OptUnprintedVisible:= false;
  ed.OptRulerVisible:= false;
  ed.AdapterForHilite := adapter;
  ed.Strings.OnLog:=@adapter.StringsLog;
  ed.OnScroll:=@adapter.edScroll;
  ed.LoadFromFile(ExtractFilePath(Application.ExeName)+'unit1.pas');
end;

end.

