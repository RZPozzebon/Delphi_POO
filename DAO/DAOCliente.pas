unit DAOCliente;

interface

uses
  ClasseCliente, Data.DB, Data.SqlExpr,FireDAC.Comp.Client,System.SysUtils,
  FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.Phys.SQLite, 
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Comp.UI;

type
  TDAOCliente = class
    private
      FConexao : TFDConnection;
      FQuery   : TFDQuery;
    public
      procedure salvar(cliente : TClasseCliente);

      constructor Create;
  end;

implementation

{ TDAOCliente }

constructor TDAOCliente.Create;
begin
  FConexao := TFDConnection.Create(nil);
  try
     FConexao.Params.DriverID := 'DriverID=SQLite';
     FConexao.Params.Database := 'D:\Projetos_Estudos\Delphi\pjr_produto_venda\BD\BD_APLICACAO.db';
  finally

  end;
end;

procedure TDAOCliente.salvar(cliente: TClasseCliente);
var
  WaitCursor: TFDGUIxWaitCursor;
begin
  FQuery := TFDQuery.Create(nil);
  WaitCursor := TFDGUIxWaitCursor.Create(nil);
  try
     try
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
