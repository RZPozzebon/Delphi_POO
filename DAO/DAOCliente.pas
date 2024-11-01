unit DAOCliente;

interface

uses
  ClasseCliente, Data.DB, Data.SqlExpr,FireDAC.Comp.Client,System.SysUtils,
  FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.Phys.SQLite, 
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, FireDAC.Phys.SQLiteDef;


type
  TDAOCliente = class
    private
      FConexao : TFDConnection;
      FQuery   : TFDQuery;
    public
      procedure salvar(cliente : TCliente);
      procedure consultarCliente;

      constructor Create;
  end;

implementation

{ TDAOCliente }

procedure TDAOCliente.consultarCliente;
var
  WaitCursor: TFDGUIxWaitCursor;

begin
  FQuery := TFDQuery.Create(nil);
  WaitCursor := TFDGUIxWaitCursor.Create(nil);

  try
     try
       // Atribuindo a conexão
       FQuery.Connection := FConexao;
       FQuery.SQL.Text := 'SELECT * FROM Cliente';
       FQuery.Open();

     except
       on e : Exception do
       begin
         raise Exception.Create('Falha ao cadastrar usuário o banco de dados. Erro: ' + e.Message);
       end;
     end;
  finally
    FreeAndNil(FQuery);
    FreeAndNil(FConexao);
    FreeAndNil(WaitCursor);

  end;
end;

constructor TDAOCliente.Create;
var
  DriverLink: TFDPhysSQLiteDriverLink;
  stringconnection : String;
begin
  FConexao := TFDConnection.Create(nil);
  DriverLink := TFDPhysSQLiteDriverLink.Create(nil);

  try
     FConexao.Params.DriverID := 'SQLite';
     FConexao.Params.Database := 'D:\Projetos_Estudos\Delphi\pjr_produto_venda\BD\BD_APLICACAO';
     FConexao.LoginPrompt := False;
     FConexao.Connected := True;

     stringconnection := FConexao.Params.Database;
  finally
    FreeAndNil(DriverLink);
  end;
end;

procedure TDAOCliente.salvar(cliente: TCliente);
var
  WaitCursor: TFDGUIxWaitCursor;

begin
  FQuery := TFDQuery.Create(nil);
  WaitCursor := TFDGUIxWaitCursor.Create(nil);


  try
     try
       // Atribuindo a conexão
       FQuery.Connection := FConexao;

       FQuery.SQL.Text := 'INSERT INTO Cliente (Nome, ContatoEmail, Sexo, DataAniversario)' +
                          'VALUES(:Nome, :ContatoEmail, :Sexo, :DataAniversario);';

       FQuery.ParamByName('Nome').AsString := cliente.FNome;
       FQuery.ParamByName('ContatoEmail').AsString := cliente.FContatoCliente;
       FQuery.ParamByName('Sexo').AsString := cliente.FSexo;
       FQuery.ParamByName('DataAniversario').AsString := DateToStr(cliente.FDataAniversario);

       FQuery.ExecSQL;
     except
       on e : Exception do
       begin
         raise Exception.Create('Falha ao cadastrar usuário o banco de dados. Erro: ' + e.Message);
       end;
     end;
  finally
    FreeAndNil(FQuery);
    FreeAndNil(FConexao);
    FreeAndNil(WaitCursor);

  end;
end;

end.
