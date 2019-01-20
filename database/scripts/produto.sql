/*==============================================================*/
/* DBMS name:      ORACLE Version 12c market                    */
/* Created on:     19/01/2019 01:15:54                          */
/*==============================================================*/


/*==============================================================*/
/* PROJETO: MARKET                                              */
/* VERSÃO APLICAÇÃO:   REPOSITORIO:                             */
/*==============================================================*/


/*==============================================================*/
/* Table: PRODUTO                                            */
/*==============================================================*/
CREATE TABLE STORE.PRODUTO (
                             NU_PRODUTO         NUMBER(10)
                               GENERATED AS IDENTITY ( START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE NOORDER)  NOT NULL,
                             DS_PRODUTO         VARCHAR2(4000 CHAR)  NOT NULL,
                             QT_ESTOQUE         NUMBER(38) NOT NULL,
                             VL_CUSTO           NUMBER(7,2) NOT NULL,
                             VL_VENDA           NUMBER(7,2) NOT NULL,
                             NU_FABRICANTE      NUMBER(10)  NOT NULL,
                             NU_UNIDADE         NUMBER(10)  NOT NULL,
                             NU_TIPO            NUMBER(10)  NOT NULL,
                             CONSTRAINT PRODUTO_PK PRIMARY KEY (NU_PRODUTO),
                             CONSTRAINT FABRICANTE_PRODUTO_FK FOREIGN KEY (NU_FABRICANTE)
                               REFERENCES STORE.FABRICANTE(NU_FABRICANTE),
                             CONSTRAINT UNIDADE_PRODUTO_FK FOREIGN KEY (NU_UNIDADE)
                               REFERENCES STORE.UNIDADE(NU_UNIDADE),
                             CONSTRAINT TIPO_PRODUTO_FK FOREIGN KEY (NU_TIPO)
                               REFERENCES STORE.TIPO(NU_TIPO)
);

COMMENT ON TABLE STORE.PRODUTO IS
'Tabela para armazenar os dados do Produto.';

COMMENT ON COLUMN STORE.PRODUTO.NU_PRODUTO IS
'Chave única da tabela PK, identity, identifica a unicidade do registro.';

COMMENT ON COLUMN STORE.PRODUTO.DS_PRODUTO IS
'Descrição do produto.';

COMMENT ON COLUMN STORE.PRODUTO.QT_ESTOQUE IS
'Quantidade de produtos em estoque.';

COMMENT ON COLUMN STORE.PRODUTO.VL_CUSTO IS
'Valor de custo do Produtos.';

COMMENT ON COLUMN STORE.PRODUTO.VL_VENDA IS
'Valor de venda do Produtos.';

COMMENT ON COLUMN STORE.PRODUTO.NU_FABRICANTE IS
'Chave única da tabela FK, identifica o relascionamento do registro.';

COMMENT ON COLUMN STORE.PRODUTO.NU_UNIDADE IS
'Chave única da tabela FK, identifica o relascionamento do registro.';

COMMENT ON COLUMN STORE.PRODUTO.NU_TIPO IS
'Chave única da tabela FK, identifica o relascionamento do registro.';

/*==============================================================*/
/* Index: DESCRICAO_PRODUTO_I                                   */
/*==============================================================*/
CREATE INDEX STORE.DESCRICAO_PRODUTO_I ON STORE.PRODUTO (
DS_PRODUTO ASC
);

/*==============================================================*/
/* Index: FABRICANTE_PRODUTO_I                                   */
/*==============================================================*/
CREATE INDEX STORE.FABRICANTE_PRODUTO_I ON STORE.FABRICANTE (
NU_FABRICANTE ASC
);

/*==============================================================*/
/* Index: UNIDADE_PRODUTO_I                                   */
/*==============================================================*/
CREATE INDEX STORE.UNIDADE_PRODUTO_I ON STORE.UNIDADE (
NU_UNIDADE ASC
);

/*==============================================================*/
/* Index: TIPO_PRODUTO_I                                   */
/*==============================================================*/
CREATE INDEX STORE.TIPO_PRODUTO_I ON STORE.TIPO (
NU_TIPO ASC
);

INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('Pendrive 512Mb',10.0,20.0,40.0,1,10,2);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('HD 120 GB',20.0,100.0,180.0,2,10,4);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('SD CARD  512MB',4.0,20.0,35.0,3,10,2);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('SD CARD 1GB MINI',3.0,28.0,40.0,1,10,2);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('CAM. FOTO I70 PLATA',5.0,600.0,900.0,5,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('CAM. FOTO DSC-W50 PLATA',4.0,400.0,700.0,6,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('WEBCAM INSTANT VF0040SP',4.0,50.0,80.0,7,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('CPU 775 CEL.D 360  3.46 512K 533M',10.0,140.0,300.0,8,10,4);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('FILMADORA DCR-DVD108',2.0,900.0,1400.0,6,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('HD IDE  80G 7.200',8.0,90.0,160.0,5,10,4);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('IMP LASERJET 1018 USB 2.0',4.0,200.0,300.0,9,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('MEM DDR  512MB 400MHZ PC3200',10.0,60.0,100.0,5,10,4);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('MEM DDR2 1024MB 533MHZ PC4200',5.0,100.0,170.0,3,10,4);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('MON LCD 19 920N PRETO',2.0,500.0,800.0,5,10,4);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('MOUSE USB OMC90S OPT.C/LUZ',10.0,20.0,40.0,5,10,2);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('NB DV6108 CS 1.86/512/80/DVD+RW ',2.0,1400.0,2500.0,9,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('NB N220E/B DC 1.6/1/80/DVD+RW ',3.0,1800.0,3400.0,6,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('CAM. FOTO DSC-W90 PLATA',5.0,600.0,1200.0,6,10,1);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('CART. 8767 NEGRO',20.0,30.0,50.0,9,10,3);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('CD-R TUBO DE 100 52X 700MB',20.0,30.0,60.0,5,10,5);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('MEM DDR 1024MB 400MHZ PC3200',7.0,80.0,150.0,1,10,4);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('MOUSE PS2 A7 AZUL/PLATA',20.0,5.0,15.0,10,10,2);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('SPEAKER AS-5100 HOME PRATA',5.0,100.0,180.0,10,10,2);
INSERT INTO STORE.PRODUTO(DS_PRODUTO,QT_ESTOQUE, VL_CUSTO, VL_VENDA, NU_FABRICANTE, NU_UNIDADE, NU_TIPO) VALUES('TEC. USB ABNT AK-806',14.0,20.0,40.0,10,10,2);
COMMIT;





