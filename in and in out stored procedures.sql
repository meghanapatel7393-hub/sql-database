CREATE DEFINER=`root`@`localhost` PROCEDURE `inandout_procedures`(inout records int,in age int)
BEGIN
select count(*) into records from student where ages>age;
END