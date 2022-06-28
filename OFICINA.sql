USE OFICINA;

CREATE DATABASE OFICINA;

CREATE TABLE EMPRESA (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeEmpresa VARCHAR(45) NOT NULL,
    tipo VARCHAR(45)
);
CREATE index IDX_IDEMPRESA ON EMPRESA(idEmpresa);
insert into EMPRESA ( nomeEmpresa, tipo) values( "Oficina", "matriz");

CREATE TABLE DEPARTAMENTO (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeDepartamento VARCHAR(45) NOT NULL,
    descricaoDepartamento VARCHAR(100) NOT NULL,
    idEmpresa INT NOT NULL,
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (idEmpresa)
        REFERENCES Empresa (idEmpresa)
);
CREATE index IDX_IDDEPARTAMENTO ON DEPARTAMENTO(idDepartamento);

SELECT * FROM DEPARTAMENTO;
insert into DEPARTAMENTO (nomeDepartamento, descricaoDepartamento, idEmpresa) values("Filial","Partipativa","1");


CREATE TABLE FUNCIONARIO (
    idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeFuncionario VARCHAR(45),
    cpfFuncionario VARCHAR(11),
    endereçoFuncionario VARCHAR(100),
    idDepartamento int,
    CONSTRAINT fk_Departamento_funcionario FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento),
	idEndereco int,
    CONSTRAINT fk_Endereco_funcionario FOREIGN KEY (idEndereco)
		REFERENCES Endereco(idEndereco)
);
CREATE index IDX_IDFUNCIONARIO ON FUNCIONARIO(idFuncionario);
insert into FUNCIONARIO ( nomeFuncionario, cpfFuncionario, endereçoFuncionario, idDepartamento) values( "Luan", "04567899323", "1", "1");
insert into FUNCIONARIO ( nomeFuncionario, cpfFuncionario, endereçoFuncionario, idDepartamento) values( "Clara", "88887899323", "1", "1");
insert into FUNCIONARIO ( nomeFuncionario, cpfFuncionario, endereçoFuncionario, idDepartamento) values( "Dudu", "800087890003", "1", "1");
select * from funcionario;



CREATE TABLE OS (
    idOS INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dataSolicitacao VARCHAR(10),
    dataPrevisao VARCHAR(10),
    resposta VARCHAR(45),
    idFuncionario INT NOT NULL,
    CONSTRAINT fk_idFuncionario_OS FOREIGN KEY (idFuncionario)
        REFERENCES Funcionario (idFuncionario),
    idDepartamento INT NOT NULL,
    CONSTRAINT fk_idDepartamento_OS FOREIGN KEY (idDepartamento)
        REFERENCES Departamento (idDepartamento),
    idCliente INT NOT NULL,
    CONSTRAINT fk_idCliente_OS FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
);
CREATE index IDX_IDOS ON OS(idOS);
    
SELECT * FROM CLIENTE; 
UPDATE CLIENTE SET NomeCliente = "Sicrano de Fulano" WHERE idCliente = 1;
CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(45),
    cpfCliente VARCHAR(45),
    telefone VARCHAR(45),
    enderecoCliente VARCHAR(45)
);
CREATE index IDX_IDCLIENTE ON CLIENTE(idCliente);
insert into CLIENTE ( nomeCliente, cpfCliente, telefone, enderecoCliente) values( "Adriano", "23443256787", "75988786755", "Rua Nome Centro 23");

CREATE TABLE TELEFONE(
      idTelefone int NOT NULL auto_increment primary key,
      numeroTelefone VARCHAR(45),
      idFunionario int,
      idCliente int,
      constraint fk_idFuncionario_Telefone foreign key(idFuncionario)
		references Funcionario(idFuncionario),
	  constraint fk_Cliente_Telefone foreign key(idTelefone)
		references Cliente(idCliente)
    
    );
CREATE index IDX_IDTELEFONE ON TELEFONE(idTelefone);


CREATE TABLE ENDERECO (
    idEndereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ruaEndereco VARCHAR(45),
    bairroEndereco VARCHAR(45),
    cepEndereco VARCHAR(45),
    numeroEndereco VARCHAR(45)
);
CREATE index IDX_IDENDERECO ON ENDERECO(idEndereco);
insert into ENDERECO ( ruaEndereco, bairroEndereco, cepEndereco, numeroEndereco) values( "Marechal Rondon", "Centro", "48602340", "34");
select * from ENDERECO;

CREATE TABLE SERVICO (
    idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeServico VARCHAR(45),
    recursos VARCHAR(200)
);
CREATE index IDX_IDSERVICO ON SERVICO(idServico);
insert into SERVICO ( nomeServico, recursos) values( "Mecanico", "ferramentas");

CREATE TABLE ITENS_OS (
    idServico INT NOT NULL,
    idOS INT NOT NULL,
    CONSTRAINT fk_idServico_itens foreign key (idServico)
		REFERENCES Servico(idServico),
	CONSTRAINT fk_idos_itens foreign key (idOs)
		REFERENCES OS(idOs),
	PRIMARY KEY (idServico, idOS)
);
CREATE index IDX_IDSERVICO ON ITENS_OS(idServico);
CREATE index IDX_IDOS ON ITENS_OS(idOS);

select f.nomeFuncionario, s.nomeServico FROM
Funcionario f, Servico s, OS os, itens_OS i WHERE
f.idFuncionario = os.idFuncionario and
s.idServico = i.idServico and
os.idos = i.idos;


INSERT INTO DEPARTAMENTO (nomeDepartamento,descricaoDepartamento,idEmpresa)
VALUES
  ("elit sed","taciti sociosqu ad litora torquent",1),
  ("pharetra. Nam","eu tellus. Phasellus elit pede, malesuada vel,",1),
  ("a, auctor","Sed eget lacus. Mauris non dui nec urna",1),
  ("et tristique","quis arcu vel",1),
  ("felis. Donec","lacus. Etiam bibendum fermentum metus. Aenean sed",1),
  ("augue scelerisque","sit amet luctus vulputate,",1),
  ("dictum eleifend,","ligula. Aenean euismod mauris eu elit. Nulla",1),
  ("egestas blandit.","Sed pharetra, felis eget varius ultrices, mauris ipsum porta",1),
  ("in, tempus","enim consequat purus. Maecenas libero",1),
  ("ac libero","Donec dignissim magna",1);

INSERT INTO ENDERECO (cepEndereco,bairroEndereco,ruaEndereco,numeroEndereco)
VALUES
  ("712678","Cajamarca","657 Ligula Ave",1),
  ("7638","Hawaii","2574 Morbi Avenue",7),
  ("5582","North Island","438-5531 Quis Rd.",4),
  ("50308","North Island","Ap #238-4883 Nisl Rd.",8),
  ("789767","Maule","295-2680 Montes, St.",10),
  ("50512","Niger","P.O. Box 721, 7844 Sit Ave",9),
  ("479563","Konya","Ap #690-4822 Pellentesque St.",8),
  ("363233","Guanacaste","Ap #103-6589 Ligula. Street",2),
  ("3873","Chandigarh","724-2280 Neque Street",9),
  ("25124","Victoria","1323 Aliquam St.",3);

INSERT INTO FUNCIONARIO (nomeFuncionario,cpfFuncionario,telefoneFuncionario,idDepartamento, endereçoFuncionario)
VALUES
  ("Sandra Wynn","24153731308","(933) 535-5395","mauris sagittis placerat. Cras dictum ultricies","tristique ac,"),
  ("Bertha Walker","90773564875","(354) 459-2725","faucibus id, libero. Donec consectetuer mauris","nec, leo. Morbi neque tellus, imperdiet non, vestibulum"),
  ("Amal Hess","45463480509","(564) 234-6157","facilisis eget, ipsum.","tincidunt, neque vitae semper egestas, urna"),
  ("Gray Molina","17953803492","(585) 271-8918","augue, eu tempor erat neque non","urna. Nullam lobortis quam"),
  ("Zenaida Chase","43635811650","(417) 572-1088","Praesent eu nulla at sem molestie sodales.","in aliquet lobortis, nisi nibh lacinia orci,"),
  ("Dominic King","80224634566","(351) 913-6173","a, magna. Lorem ipsum dolor sit","pede. Cras vulputate velit eu sem. Pellentesque ut"),
  ("Upton Hudson","22936072442","(266) 823-3452","Proin non massa non ante bibendum ullamcorper.","dolor. Donec fringilla. Donec feugiat metus sit amet ante."),
  ("Mariam Mckay","37285658948","(674) 427-7560","mollis nec, cursus a, enim. Suspendisse aliquet, sem","feugiat metus sit amet"),
  ("Keely Mckay","78819828767","(597) 566-2049","consectetuer mauris id sapien. Cras dolor dolor, tempus","semper rutrum. Fusce dolor"),
  ("Lawrence Klein","83263488658","(458) 478-3417","ornare sagittis felis. Donec","sit amet massa. Quisque porttitor");

INSERT INTO CLIENTE (nomeCliente,cpfCliente,enderecoCliente)
VALUES
  ("Armando Molina","79437936131",9),
  ("Chelsea Brady","11129420952",10),
  ("Brenna Carter","32754160192",9),
  ("Chase Campos","60251876264",7),
  ("Zachary Norton","23493011669",2),
  ("Reagan Reynolds","37312722639",3),
  ("Judah Odom","85235677479",2),
  ("Irene Mcknight","14523314479",10),
  ("Shelley Galloway","29378068764",6),
  ("Clayton Salas","64205878523",5);

INSERT INTO SERVICO (nomeServico,recursos)
VALUES
  ("pede nec","pellentesque eget, dictum placerat, augue. Sed molestie. Sed"),
  ("In","libero at auctor ullamcorper,"),
  ("ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam","cursus"),
  ("sit amet","orci luctus et ultrices posuere cubilia Curae Phasellus ornare."),
  ("sem molestie sodales. Mauris blandit","tortor nibh sit amet orci. Ut");

INSERT INTO OS (dataSolicitacao,dataPrevisao,resposta,idFuncionario,idDepartamento,idCliente )
VALUES
  ("63714339","68568638","vulputate dui, nec tempus mauris",3,8,3),
  ("66928233","15227233","in, hendrerit consectetuer, cursus et,",1,5,3),
  ("75142961","81581474","mauris. Integer sem elit, pharetra",5,8,3),
  ("77788279","47282552","at, iaculis quis, pede. Praesent",3,3,3),
  ("35654241","86656326","Cras lorem lorem, luctus ut, pellentesque eget,",1,9,5);

INSERT INTO ITENS_OS (idServico,idOS)
VALUES
  (2,3),
  (4,3),
  (5,1),
  (3,1),
  (4,2);

INSERT INTO OS (dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values ("02/07/2002", "03/07/2002", "Agendado", 1, 1, 1);
INSERT INTO SERVICO (nomeServico, recursos) values ("Troca de roteador", "roteador");
INSERT INTO ITENS_OS (idServico, idOS) values (1, 1);


   select s.nomeServico, d.nomeDepartamento, o.resposta from Servico s INNER JOIN ITENS_OS i ON (i.idServico = s.idServico) INNER JOIN OS o ON (o.idOS = i.idOS) INNER JOIN Departamento d ON (d.idDepartamento = o.idDepartamento) and d.idDepartamento = 1;  
   select s.nomeServico, f.nomeFuncionario from Servico s INNER JOIN ITENS_OS i ON (i.idServico = s.idServico) INNER JOIN OS o ON (o.idOS = i.idOS) INNER JOIN Funcionario f ON (f.idFuncionario = o.idFuncionario);  
   select s.nomeServico, c.nomeCliente from Servico s INNER JOIN ITENS_OS i ON (i.idServico = s.idServico) INNER JOIN OS o ON (o.idOS = i.idOS) INNER JOIN Cliente c ON (c.idCliente = o.idCliente);


SELECT
  count(nomeFuncionario)
FROM
  FUNCIONARIO;
  
SELECT nomeCliente as Clientela FROM CLIENTE;



