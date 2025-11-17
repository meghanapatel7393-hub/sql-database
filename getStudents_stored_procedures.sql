CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudents`(in age int)
BEGIN
select * from student where student.ages>age;
END