SELECT DISTINCT ename, d.loc, p.loc
FROM pro p JOIN emppro ep ON ep.prono = p.prono 
		   JOIN emp e ON ep.empno = e.empno 
		   JOIN dept d ON d.deptno = e.deptno
WHERE d.loc = p.loc


SELECT e.empno,ename, count(*)
FROM emp e JOIN emppro ep ON ep.empno = e.empno 
           JOIN pro p ON ep.prono = p.prono
           JOIN dept d ON e.deptno = d.deptno
WHERE p.loc = d.loc
GROUP BY e.empno,ename


SELECT e.empno,ename, count(p.prono)
FROM emp e JOIN dept d ON d.deptno = e.deptno
		   LEFT JOIN emppro ep ON ep.empno = e.empno
		   LEFT JOIN pro p ON ep.prono = p.prono
		   AND d.loc = p.loc		   
GROUP BY e.empno,ename


SELECT ename,sal,(SELECT AVG(sal) FROM emp)
FROM emp  
WHERE sal > (SELECT AVG(sal)
			 FROM emp)
GROUP BY ename,sal


SELECT ename,sal,deptno, (SELECT AVG(sal) FROM emp e JOIN dept d ON e.deptno = d.deptno WHERE x.deptno = d.deptno)
FROM emp x
WHERE sal > (SELECT AVG(sal)
			FROM emp e JOIN dept d ON e.deptno = d.deptno
			WHERE x.deptno = d.deptno)
      
SELECT prono, ename,hours
FROM emppro ep JOIN emp e ON e.empno = ep.empno
WHERE (prono,hours) = SOME(SELECT prono,max(hours) FROM emppro GROUP BY prono) 


SELECT sum(hours),ename, loc 
FROM emp e JOIN emppro ep ON e.empno = ep.empno 
		   JOIN pro p ON ep.prono = p.prono	
GROUP BY e.empno,ename, loc
HAVING sum(hours) >= ALL(SELECT sum(hours) 
						 FROM emppro epx JOIN pro px ON epx.prono = px.prono
						 WHERE loc = p.loc						 
						 GROUP BY epx.empno)


SELECT AVG(putaMierda)
FROM (SELECT sum(hours) putaMierda FROM emppro GROUP BY prono)


SELECT pname, sum(hours)
FROM emppro ep JOIN pro p ON ep.prono = p.prono 
GROUP BY p.prono, pname
HAVING sum(hours) > (SELECT AVG(horasAux2) 
					 FROM (SELECT sum(hours) horasAux2
    				 	   FROM emppro 
						   GROUP BY prono))
               

SELECT ename, maxx - coalesce(sal+comm,sal) 
FROM emp e JOIN (SELECT max(COALESCE(sal+comm,sal)) maxx, deptno
				 FROM emp
				 GROUP BY deptno) sub ON e.deptno = sub.deptno
         
         
SELECT dname, (SELECT DISTINCT sum(sal) 
			   FROM emp 
			   GROUP BY deptno
			   HAVING sum(sal) >= ALL(SELECT sum(sal)
			   						  FROM emp
			   						  GROUP BY deptno)) - sum(sal)
FROM emp e JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptno, dname
