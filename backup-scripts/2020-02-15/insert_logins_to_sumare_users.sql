SELECT COUNT(*) FROM `users`;
LOAD DATA LOCAL INFILE '/root/logins01' INTO TABLE test;
delete from test where userid in (select userid from users);
UPDATE test SET home=CONCAT('/sumarepochta/',userid), domain='sumare.ru', password='sumare1password', uid=8, gid=12, active='Y';
insert into users select * from test;
SELECT COUNT(*) FROM `users`;
delete from test;
exit

