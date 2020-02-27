-- Crear la base de datos db_tasks
CREATE DATABASE IF NOT EXISTS db_tasks;
CREATE DATABASE IF NOT EXISTS db_clientes_ex_crud;

-- Crear usuario
CREATE USER 'tasksuser'@'%' IDENTIFIED BY 'taskspassword';

-- Permisos para el nuevo usuario
GRANT CREATE, ALTER, INDEX, LOCK TABLES, REFERENCES, UPDATE, DELETE, DROP, SELECT, INSERT ON `db_tasks`.* TO 'tasksuser'@'%';
GRANT CREATE, ALTER, INDEX, LOCK TABLES, REFERENCES, UPDATE, DELETE, DROP, SELECT, INSERT ON `db_clientes_ex_crud`.* TO 'root'@'%';

FLUSH PRIVILEGES;