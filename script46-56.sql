SELECT ep.prono, sum(ep.hours)
FROM emp e JOIN emppro ep ON e.empno = ep.empno
WHERE e.sal >= 1000
GROUP BY ep.prono
HAVING count(*)>=2

----------------------------------------------------------------------

SELECT DISTINCT d.dname
FROM dept d JOIN emp e ON e.deptno = d.deptno 
GROUP BY d.deptno, dname,job
HAVING count(*)>=2

----------------------------------------------------------------------

SELECT ename, pname, hours
FROM emp e JOIN pro p ON e.deptno = p.deptno JOIN emppro ep ON ep.prono = p.prono
WHERE hours >= ALL (SELECT hours FROM emppro WHERE prono=p.prono)

----------------------------------------------------------------------

SELECT m.ename, sum(e.sal)
FROM emp e JOIN emp m ON e.mgr = m.empno
GROUP BY m.empno, m.ename 
HAVING sum(e.sal) >= ALL (SELECT sum(sal) 
			  FROM emp 
			  WHERE mgr IS NOT NULL
			  GROUP BY mgr)
    
----------------------------------------------------------------------

SELECT sum(hours), pname, deptno
FROM emppro ep JOIN pro p ON ep.prono = p.prono 
GROUP BY p.prono, pname, p.deptno
HAVING sum(hours) >= ALL(SELECT sum(hours) 
		         FROM emppro ep1 JOIN pro p1 ON ep1.prono = p1.prono
		         WHERE p.deptno = p1.deptno
		         GROUP BY p1.prono)

----------------------------------------------------------------------
             
SELECT dname, count(ename)
FROM dept d LEFT JOIN emp e ON d.deptno = e.deptno
GROUP BY d.deptno, dname

----------------------------------------------------------------------

SELECT ename, COALESCE (sum(hours),0)
FROM emp e LEFT JOIN emppro ep ON e.empno = ep.empno 
GROUP BY ename, e.empno

----------------------------------------------------------------------

SELECT e.ename, m.ename, d.dname
FROM emp e LEFT JOIN emp m ON e.mgr = m.empno LEFT JOIN dept d ON m.deptno = d.deptno 

----------------------------------------------------------------------

SELECT e.ename, count(DISTINCT loc)
FROM emp e LEFT JOIN emppro ep ON e.empno = ep.empno LEFT JOIN pro p ON ep.prono = p.prono 
GROUP BY e.empno, e.ename

----------------------------------------------------------------------

SELECT d.dname,COALESCE(count(ep.empno),0)
FROM dept d LEFT JOIN pro p ON d.deptno = p.deptno
	    LEFT JOIN emppro ep ON p.prono = ep.prono
GROUP BY d.deptno, d.dname
HAVING d.deptno = 30 OR d.deptno = 40

----------------------------------------------------------------------

SELECT m.ename, count(e.empno)
FROM emp e RIGHT JOIN emp m ON e.mgr = m.empno AND to_char(e.hiredate,'yyyy') = to_char(m.hiredate,'yyyy')
WHERE m.empno IN (SELECT mgr FROM emp)
GROUP BY m.ename,m.empno
