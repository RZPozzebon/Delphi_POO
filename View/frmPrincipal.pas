unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,frmCliente;

type
  TFormPrincipal = class(TForm)
    Panel1: TPanel;
    MainMenuPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.Cliente1Click(Sender: TObject);
begin
  //frmCadastroCliente := frmCadastroCliente.Create(Self);
  try
     frmCadastroCliente.ShowModal;
  finally
     frmCadastroCliente.Free;
  end;
end;

end.
