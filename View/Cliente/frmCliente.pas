unit frmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,ClasseCliente,
  ClienteController;

type
  TTipoCliente = (Fisica, Juridica);

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
    LblSexoObrigatorio: TLabel;
    lblDataObrigatoria: TLabel;
    lblEmailInvalido: TLabel;
    lblTipoCliente: TLabel;
    cbxTipoCliente: TComboBox;
    Memo1: TMemo;
    ProgressBarSucesso: TProgressBar;
    lblSucesso: TLabel;
    procedure btnSalvarClienteClick(Sender: TObject);
    procedure rgSexoClienteClick(Sender: TObject);
  private
    Sexo: Char;
    Clientes : Array[1..3] of TCliente;

    procedure habilitaMensagemErro(AMensagem : String);
    function PalavraExiste(const Mensagem, Palavra: string): Boolean;
    function strToTipoCliente(const str : String) : TTipoCliente;
    procedure ThreadFinished(Sender: TObject);
    procedure contaate100;
  public
    { Public declarations }
  end;

var
  frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}

procedure TfrmCadastroCliente.btnSalvarClienteClick(Sender: TObject);
var
  cliente : TCliente;
  clienteController : TClienteController;
  I : Integer;
  //

begin
  cliente := TCliente.Create();
  clienteController := TClienteController.Create();
  try
    try
      // Definição progressBar
      ProgressBarSucesso.Max := 100;
      ProgressBarSucesso.Min := 0;
      ProgressBarSucesso.Position := 0;

      cliente.FNome := edtNomeCliente.Text;
      cliente.FContatoCliente := edtEmailCliente.Text;
      cliente.FSexo := Sexo;
      cliente.FDataAniversario := dtpDataNascimento.Date;
      cliente.FTipoPessoa := ifthen(strToTipoCliente(cbxTipoCliente.Text) = TTipoCliente.Fisica, 'F','J');

       //Popula Array
       for I := 1 to Pred(Length(Clientes)) do
       begin
         Clientes[I] := Cliente;
       end;

       Memo1.Lines.Add(Format('Nome Cliente: %s  - Data de Aniversário: %s',[Clientes[1].FNome,DateToStr(Clientes[1].FDataAniversario)]));

       // Chama minha camada CONTROLLER
       TThread.CreateAnonymousThread(
         procedure
          var
            I: Integer;
         begin
           contaate100;
           //clienteController.Salvar(Cliente);
           for I := 0 to 100 do
           begin
             TThread.Synchronize(nil,
             procedure
             begin
               ProgressBarSucesso.Position := i;
             end)
           end;
       end).Start;

    except
      on e : Exception do
      begin
        habilitaMensagemErro(e.Message);
        //raise Exception.Create('Falha ao cadastar cliente. Erro:' + E.Message);
      end;
    end;
  finally
    FreeAndNil(cliente);
    FreeAndNil(clienteController);
  end;
end;

procedure TfrmCadastroCliente.contaate100;
var
 I : Integer;
 lbl : Integer;
begin
  for I := 0 to 100 do
  begin
     sleep(2000);
     lbl := I;
  end;
end;

procedure TfrmCadastroCliente.habilitaMensagemErro(AMensagem: String);
begin
  //
  try
    if PalavraExiste(AMensagem, 'Nome') then
      lblNomeObrigatorio.Visible := true;
    if PalavraExiste(AMensagem, 'Sexo') then
      LblSexoObrigatorio.Visible := true;
    if PalavraExiste(AMensagem, 'Data') then
      lblDataObrigatoria.Visible := true;
    if PalavraExiste(AMensagem, 'E-mail') then
      lblEmailInvalido.Visible := true;
  finally

  end;
end;

function TfrmCadastroCliente.PalavraExiste(const Mensagem,
  Palavra: string): Boolean;
begin
  Result := Pos(Palavra, Mensagem) > 0;
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
function TfrmCadastroCliente.strToTipoCliente(const str: String): TTipoCliente;
begin
   result := Fisica;
   if str = 'Fisica' then
     result := Fisica;
   if str = 'Juridica' then
     result := Juridica;
end;

procedure TfrmCadastroCliente.ThreadFinished(Sender: TObject);
begin
  ProgressBarSucesso.Position := ProgressBarSucesso.Max; // Garante que o progresso está completo
  lblSucesso.Visible := true;
end;

end.
