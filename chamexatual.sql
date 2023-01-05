SELECT * FROM (SELECT DISTINCT 
LPAD (1, 2, 0) || '|' ||
'VENDAS' || '|' ||
LPAD (50, 3, 0) || '|' ||
:SEQUENCIA || '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDDhhmi')|| '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDD')|| '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDD') || '|' ||
'16731862000124' || '|' ||
'07216054000138',1
FROM DUAL
union all
SELECT DISTINCT 
LPAD (2, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
LPAD(P.NUMNOTA,20,0) || '|' ||
LPAD (1, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
TO_CHAR(P.DTMOV,'YYYYMMDD')|| '|' ||
LPAD (0, 20, 0) || '|' ||
RPAD(REPLACE(REPLACE(REPLACE(CGCENT,'-',''),'.',''),'/',''),20,0)|| '|' ||
'RJ' || '|' ||
'21010410' || '|' ||
C.ESTCOB || '|' ||
LPAD (0, 8, 0) || '|' ||
'CIF' || '|' ||
LPAD (1, 2, 0) ,P.NUMNOTA
FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
P.CODOPER='S' AND
P.DTMOV >=:DTINI AND
P.DTMOV <=:DTFIM AND
P.CODPROD IN (SELECT CODPROD FROM PCPRODUT PO
LEFT JOIN PCFORNEC PC ON PO.CODFORNEC=PC.CODFORNEC
WHERE PO.CODFORNEC IN ('16154','32194'))
UNION ALL

SELECT DISTINCT 
LPAD (3, 2, 0) || '|' ||
LPAD(P.NUMNOTA,20,0) || '|' ||
LPAD (1, 2, 0) || '|' ||
P.CODAUXILIAR || '|' ||
LPAD (P.QT, 2, 0) || '|' ||
LPAD (REPLACE(P.PUNIT,',','.'), 2, 0) || '|' ||
LPAD (0, 1, 0) || '|' ||
LPAD (REPLACE(P.QT*P.PUNIT,',','.'), 3, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0),P.NUMNOTA
FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
P.CODOPER='S' AND
P.DTMOV >=:DTINI AND
P.DTMOV <=:DTFIM AND
P.CODPROD IN (SELECT CODPROD FROM PCPRODUT PO
LEFT JOIN PCFORNEC PC ON PO.CODFORNEC=PC.CODFORNEC
WHERE PO.CODFORNEC IN ('16154','32194')))
ORDER BY 2,1
