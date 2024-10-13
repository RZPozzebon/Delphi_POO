unit frmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,ClasseCliente,
  ClienteController;

type
  TfrmCadastroCliente = class(TForm)
    pnlCamposCadastro: TPanel;
    lblNomeCliente: TLabel;
    lblContatoemail: TLabel;
    lblDataAniversario: TLabel;
    lblSexo: TLabel;
    edtNomeCliente: TEdit;
    edtEmailCliente: TEdit;
    rgSexoCliente: TRadioGroup;
    dtpDataNascimento: TDateTimePicker;
    btnSalvarCliente: TButton;
    btnCancelarCliente: TButton;
    lblNomeObrigatorio: TLabel;
    lblEmailObrigatorio: TLabel;
    procedure btnSalvarClienteClick(Sender: TObject);
    procedure rgSexoClienteClick(Sender: TObject);
  private
    Sexo: Char;
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.btnSalvarClienteClick(Sender: TObject);
var
  cliente : TClasseCliente;
  clienteController : TClienteController;
begin
  cliente := TClasseCliente.Create();
  clienteController := TClienteController.Create();
  try
    try
      cliente.FNome := edtNomeCliente.Text;
      cliente.FContatoCliente := edtEmailCliente.Text;
      cliente.FSexo := Sexo;
      cliente.FDataAniversario := dtpDataNascimento.Date;

      // Chama minha camada CONTROLLER
      clienteController.Salvar(Cliente);
    except
      on e : Exception do
      begin
        raise Exception.Create('Falha ao cadastar cliente. Erro:' + E.Message);
      end;
    end;
  finally
    FreeAndNil(cliente);
    FreeAndNil(clienteController);
  end;
end;

procedure TfrmCadastroCliente.rgSexoClienteClick(Sender: TObject);
begin
 
 try
   if (rgSexoCliente.ItemIndex > -1) then
   begin 
     case rgSexoCliente.ItemIndex of

     0: Sexo := 'M';// Mulher

     1: Sexo := 'H';// Homen

     2: Sexo := 'O';// Outros
     end;
   end;
 except
   on e : Exception do
   begin
     showMessage('Erro ou converter o sexo. Erro: ' + e.Message);
   end;
 end;
end;
end.
