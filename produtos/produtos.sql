SELECT DISTINCT 
LPAD (1, 2, 0) || '|' ||
'RELPRO' || '|' ||
LPAD (50, 3, 0) || '|' ||
:SEQUENCIA || '|' ||
TO_CHAR(SYSDATE-1,'YYYYMMDDhhmi')|| '|' ||
'16731862000124' || '|' ||
'07216054000138'
FROM DUAL
union all
SELECT DISTINCT 
LPAD (2, 2, 0) || '|' ||
'16731862000124' || '|' ||
RPAD(Po.CODPROD,20,' ') || '|' ||
RPAD(Po.CODAUXILIAR,14,' ') || '|' ||
LPAD (1, 2, 0) || '|' ||
LPAD (1, 2, 0) || '|' ||
RPAD (po.qtunit, 2, 0) || '|' ||
RPAD(po.descricao,100,' ') || '|' ||
case when po.dtexclusao is null then '01' else '02' end
FROM PCPRODUT PO
WHERE PO.CODFORNEC IN ('16154','32194')
