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
case when P.CODOPER='S' then '01' else '02' end || '|' ||
TO_CHAR(P.DTMOV,'YYYYMMDD')|| '|' ||
LPAD (0, 20, 0) || '|' ||
LPAD(REPLACE(REPLACE(REPLACE(CGCENT,'-',''),'.',''),'/',''),20,0)|| '|' ||
'RJ' || '|' ||
'21010410' || '|' ||
C.ESTCOB || '|' ||
LPAD (0, 8, 0) || '|' ||
'CIF' || '|' ||
LPAD (1, 2, 0) ,P.NUMNOTA
FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
--P.CODOPER='S' AND   
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
case when P.CODOPER='S' then '01' else '02' end || '|' ||
P.CODAUXILIAR || '|' ||
LPAD (p.qt, 2, 0) || '|' ||
case when P.PUNIT < 1 then TO_CHAR(P.PUNIT,'0.99') else TO_CHAR(P.PUNIT,'999.99') end || '|' ||
LPAD ('N', 1, 0) || '|' ||
case when P.QT*P.PUNIT < 1 then TO_CHAR(P.QT*P.PUNIT,'0.99') else TO_CHAR(P.QT*P.PUNIT,'99999.99') end || '|' ||
case when P.QT*P.PUNIT < 1 then TO_CHAR(P.QT*P.PUNIT,'0.99') else TO_CHAR(P.QT*P.PUNIT,'99999.99') end || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0) || '|' ||
LPAD (0, 2, 0),P.NUMNOTA
FROM PCMOV P
left join PCCLIENT c on  p.codcli = c.codcli
wHERE 
--P.CODOPER='S' AND
P.DTMOV >=:DTINI AND
P.DTMOV <=:DTFIM AND
P.CODPROD IN (SELECT CODPROD FROM PCPRODUT PO
LEFT JOIN PCFORNEC PC ON PO.CODFORNEC=PC.CODFORNEC
WHERE PO.CODFORNEC IN ('16154','32194')))
ORDER BY 2,1
