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
    function GetSexo: Char;
    procedure SetSexo(const Value: Char);
    { Private declarations }
    property Sexo: Char read GetSexo write SetSexo;
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
  try
    try
      cliente.FNome := edtNomeCliente.Text;
      cliente.FContatoCliente := edtEmailCliente.Text;
      cliente.FSexo := Sexo;
      cliente.FDataAniversario := dtpDataNascimento.Date;

      // Controller validar os dados.
      clienteController.Create(cliente);
      
    except
      on e : Exception do
      begin
        raise Exception.Create('Falha ao cadastar o cliente. Erro:' + E.Message);
      end;
    end;
  finally
    cliente.Free;
  end;
end;

function TfrmCadastroCliente.GetSexo: Char;
begin
  Result := Sexo;
end;

procedure TfrmCadastroCliente.rgSexoClienteClick(Sender: TObject);
begin
 
 try
   if (rgSexoCliente.ItemIndex > -1) then
   begin 
     case rgSexoCliente.ItemIndex of

     1: SetSexo('M');// Mulher

     2: SetSexo('H');// Homen

     3: SetSexo('O');// Outros
     end;
   end;
 except
   on e : Exception do
   begin
     showMessage('Erro ou converter o sexo. Erro: ' + e.Message);
   end;
 end;

end;

procedure TfrmCadastroCliente.SetSexo(const Value: Char);
begin
  if Value <> '' then  
    Sexo := Value;
end;

end.
