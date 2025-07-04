unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,SHDocVw,Winapi.ActiveX, Vcl.OleCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    WebBrowser1: TWebBrowser;
    procedure Button1Click(Sender: TObject);
    procedure UpdateChart(const Sales: array of Integer; const Labels: array of string);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.UpdateChart(const Sales: array of Integer; const Labels: array of string);
const
  HTML_TEMPLATE: string =
    '<html>' +
    '<head>' +
    '<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>' +
    '</head>' +
    '<body>' +
    '<div id="chartContainer" style="height: 370px; width: 100%%;"></div>' +
    '<script>' +
    'window.onload = function () {' +
    '  var chart = new CanvasJS.Chart("chartContainer", {' +
    '    animationEnabled: true,' +
    '    title: { text: "Updated Sales Data" },' +
    '    data: [{ type: "column", dataPoints: [%s] }]' +
    '  });' +
    '  chart.render();' +
    '};' +
    '</script>' +
    '</body>' +
    '</html>';
var
  i: Integer;
  DataPoints, HTML: string;
  HTMLStream: TStringStream;
begin
  DataPoints := '';
  for i := 0 to High(Sales) do
  begin
    DataPoints := DataPoints + Format('{ label: "%s", y: %d }', [Labels[i], Sales[i]]);
    if i < High(Sales) then
      DataPoints := DataPoints + ',';
  end;

  HTML := Format(HTML_TEMPLATE, [DataPoints]);

  HTMLStream := TStringStream.Create(HTML, TEncoding.UTF8);
  try
    WebBrowser1.Navigate('about:blank');
    while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do
      Application.ProcessMessages;

    if Assigned(WebBrowser1.Document) then
      (WebBrowser1.Document as IPersistStreamInit).Load(TStreamAdapter.Create(HTMLStream));
  finally
    HTMLStream.Free;
  end;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  NewLabels: array[0..3] of string;
  NewSales: array[0..3] of Integer;
begin
  NewLabels[0] := 'May';
  NewLabels[1] := 'Jun';
  NewLabels[2] := 'Jul';
  NewLabels[3] := 'Aug';

  NewSales[0] := 75;
  NewSales[1] := 88;
  NewSales[2] := 66;
  NewSales[3] := 90;

  UpdateChart(NewSales, NewLabels);

end;

end.
