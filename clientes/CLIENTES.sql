SELECT DISTINCT 
LPAD (1, 2, 0) || '|' ||
'RELCLI' || '|' ||
LPAD (50, 3, 0) || '|' ||
:SEQUENCIA || '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDDhhmi')|| '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDD')|| '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDD') || '|' ||
'16731862000124' || '|' ||
'07216054000138'
FROM DUAL
union all
SELECT DISTINCT 
LPAD (2, 2, 0) || '|' ||
LPAD(REPLACE(REPLACE(REPLACE(CGCENT,'-',''),'.',''),'/',''),20,0)|| '|' ||
LPAD (1, 8, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
LPAD (1, 100, 0) || '|' ||
LPAD (1, 100, 0) || '|' ||
LPAD (1, 50, 0) || '|' ||
LPAD (1, 100, 0) || '|' ||
LPAD (1, 03, 0) || '|' ||
LPAD (1, 02, 0) || '|' ||
LPAD (1, 20, 0) || '|' ||
LPAD (1, 50, 0) 
FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
--P.CODOPER='S' AND 
p.filial=1 and
p.qt >0 and    
P.DTMOV >=:DTINI AND
P.DTMOV <=:DTFIM AND
P.CODPROD IN (SELECT CODPROD FROM PCPRODUT PO
LEFT JOIN PCFORNEC PC ON PO.CODFORNEC=PC.CODFORNEC
WHERE PO.CODFORNEC IN ('16154','32194'))
