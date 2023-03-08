SELECT DISTINCT ename, loc
FROM emp e JOIN emppro ep ON e.empno = ep.empno
		   JOIN pro p ON ep.prono = p.prono
GROUP BY ename,e.empno, loc

---------------------------------------------------------

SELECT empno, loc
FROM emppro CROSS JOIN pro 
WHERE (empno,loc) NOT IN (SELECT empno,loc FROM emppro NATURAL JOIN pro)

---------------------------------------------------------

SELECT DISTINCT e.empno,ename, loc
FROM emp e CROSS JOIN pro p
WHERE (e.empno,loc) NOT IN (SELECT empno,loc
						  FROM emppro ep JOIN pro p ON ep.prono = p.prono)
 
---------------------------------------------------------

SELECT ename,loc, 'SI' "trabajo?"
FROM emp NATURAL JOIN emppro JOIN pro USING (prono)
	UNION 
	SELECT ename,loc,'NO'
	FROM (SELECT empno, loc
		  FROM emp CROSS JOIN pro
		  MINUS
		  SELECT empno, loc
		  FROM emppro NATURAL JOIN pro)
		  NATURAL JOIN emp

---------------------------------------------------------
      
SELECT e.ename, m.ename
FROM emp e JOIN emp m ON e.mgr = m.empno

---------------------------------------------------------

SELECT e.ename, m.ename
FROM emp e CROSS JOIN emp m
WHERE e.empno != m.empno
	MINUS
	SELECT e.ename, m.ename
	FROM emp e JOIN emp m ON e.mgr = m.empno
	MINUS 
	SELECT m.ename, e.ename 
	FROM emp e JOIN emp m ON e.mgr = m.empno
