CREATE DATABASE IF NOT EXISTS `sei` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;USE `sei`;CREATE TABLE `usuario` (`codUsuario` int NOT NULL AUTO_INCREMENT,`login` varchar(100) NOT NULL,`senha` varchar(100) NOT NULL DEFAULT 123456,`nome` varchar(255) NOT NULL,`tipoUsuario` char(1) NULL,PRIMARY KEY (`codUsuario`) ,UNIQUE INDEX `un_login_usuario` (`login` ASC));CREATE TABLE `endereco` (`codUsuario` int NOT NULL,`cep` varchar(9) NULL,`rua` varchar(150) NULL,`nCasa` varchar(10) NULL,`bairro` varchar(50) NULL,`complemento` varchar(255) NULL,`cidade` varchar(50) NULL,`estado` varchar(50) NULL,PRIMARY KEY (`codUsuario`) );CREATE TABLE `aluno` (`matricAluno` int NOT NULL,`codTurmaAtual` int NULL,`idade` int NULL,`sexo` char(1) NULL,PRIMARY KEY (`matricAluno`) );CREATE TABLE `turma` (`codTurma` int NOT NULL AUTO_INCREMENT,`serie` int(1) NULL,`turno` char(1) NULL,`ano` int(4) NULL,`sala` varchar(50) NULL,PRIMARY KEY (`codTurma`) );CREATE TABLE `disciplina` (`codDisciplina` int NOT NULL AUTO_INCREMENT,`nome` varchar(50) NOT NULL,`sigla` varchar(5) NULL,`serie` int(1) NOT NULL,`codProfessor` int NULL,PRIMARY KEY (`codDisciplina`) );CREATE TABLE `dadosPessoais` (`codUsuario` int NOT NULL,`cpf` varchar(14) NULL,`rg` varchar(9) NULL,`email` varchar(100) NULL,`telefone` varchar(15) NULL,`celular` varchar(15) NULL,PRIMARY KEY (`codUsuario`) );CREATE TABLE `professor` (`codProfessor` int NOT NULL,`dataAdmissao` date NULL,PRIMARY KEY (`codProfessor`) );CREATE TABLE `nota` (`matricAluno` int NOT NULL,`codDisciplina` int NOT NULL,`ano` int(4) NOT NULL,`bimestre` int(1) NOT NULL,`nota` decimal(4,2) NULL DEFAULT 0,PRIMARY KEY (`matricAluno`, `codDisciplina`, `ano`, `bimestre`) );ALTER TABLE `disciplina` ADD CONSTRAINT `fk_disciplina_professor_1` FOREIGN KEY (`codProfessor`) REFERENCES `professor` (`codProfessor`);ALTER TABLE `aluno` ADD CONSTRAINT `fk_aluno_turma_1` FOREIGN KEY (`codTurmaAtual`) REFERENCES `turma` (`codTurma`);ALTER TABLE `nota` ADD CONSTRAINT `fk_nota_aluno_1` FOREIGN KEY (`matricAluno`) REFERENCES `aluno` (`matricAluno`);ALTER TABLE `nota` ADD CONSTRAINT `fk_nota_disciplina_1` FOREIGN KEY (`codDisciplina`) REFERENCES `disciplina` (`codDisciplina`);ALTER TABLE `endereco` ADD CONSTRAINT `fk_endereco_dados_pessoais_1` FOREIGN KEY (`codUsuario`) REFERENCES `dadosPessoais` (`codUsuario`);ALTER TABLE `aluno` ADD CONSTRAINT `fk_aluno_usuario_1` FOREIGN KEY (`matricAluno`) REFERENCES `usuario` (`codUsuario`);ALTER TABLE `professor` ADD CONSTRAINT `fk_professor_usuario_1` FOREIGN KEY (`codProfessor`) REFERENCES `usuario` (`codUsuario`);ALTER TABLE `dadosPessoais` ADD CONSTRAINT `fk_dadosPessoais_usuario_1` FOREIGN KEY (`codUsuario`) REFERENCES `usuario` (`codUsuario`);INSERT INTO `turma` VALUES(1, 1, 'M', 2016, 'Sala 1'),(2, 1, 'V', 2016, 'Sala 1'),(3, 2, 'M', 2016, 'Sala 2'),(4, 2, 'V', 2016, 'Sala 2'),(5, 3, 'M', 2016, 'Sala 3'),(6, 3, 'V', 2016, 'Sala 3');INSERT INTO `usuario` (`codUsuario`, `login`, `senha`, `nome`, `tipoUsuario`) VALUES(1, 'admin', '1234qwer', 'Administrador', '0'),(2, 'prof1', '1234qwer', 'Newton', 'p'),(3, 'prof2', '1234qwer', 'Gisele', 'p'),(4, 'prof3', '1234qwer', 'Góes', 'p'),(5, 'prof4', '1234qwer', 'Edson', 'p'),(6, 'prof5', '1234qwer', 'Hélio', 'p'),(7, 'prof6', '1234qwer', 'Osvaldo', 'p'),(8, 'prof7', '1234qwer', 'Oscar', 'p'),(9, 'prof8', '1234qwer', 'Rozani', 'p'),(10, 'prof9', '1234qwer', 'Mônica', 'p'),(11, 'aluno1', '1234qwer', 'Aluno 1', 'a'),(12, 'aluno2', '1234qwer', 'Aluno 2', 'a'),(13, 'aluno3', '1234qwer', 'Aluno 3', 'a');INSERT INTO `dadosPessoais` VALUES(2, '12345678900', '12345678', 'prof1@proo.com', '33335555', '999998888'),(3, '23456781900', '23456781', 'prof2@proo.com', '33335555', '999998888'),(4, '34567812900', '34567812', 'prof3@proo.com', '33335555', '999998888'),(5, '45678123900', '45678123', 'prof4@proo.com', '33335555', '999998888'),(6, '56781234900', '56781234', 'prof5@proo.com', '33335555', '999998888'),(7, '67812345900', '67812345', 'prof6@proo.com', '33335555', '999998888'),(8, '78123456900', '78123456', 'prof7@proo.com', '33335555', '999998888'),(9, '81234567900', '81234567', 'prof8@proo.com', '33335555', '999998888'),(10, '23456789900', '23456789', 'prof9@proo.com', '33335555', '999998888'),(11, '34567892900', '34567892', 'aluno1@proo.com', '33335555', '999998888'),(12, '45678923900', '45678923', 'aluno2@proo.com', '33335555', '999998888'),(13, '45678923900', '45678923', 'aluno3@proo.com', '33335555', '999998888');INSERT INTO `endereco` VALUES(2, '12345678', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(3, '23456781', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(4, '34567812', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(5, '45678123', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(6, '56781234', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(7, '67812345', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(8, '78123456', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(9, '81234567', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(10, '23456789', 'Rua do Professor', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(11, '34567892', 'Rua do Aluno', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(12, '45678923', 'Rua do Aluno', '-', 'Centro', '-', 'Maceió', 'Alagoas'),(13, '45678923', 'Rua do Aluno', '-', 'Centro', '-', 'Maceió', 'Alagoas');INSERT INTO `professor` VALUES(2, '2009/12/18'),(3, '2010/01/20'),(4, '2010/02/07'),(5, '2011/12/23'),(6, '2012/01/05'),(7, '2014/02/19'),(8, '2014/03/18'),(9, '2015/03/22'),(10, '2016/01/10');INSERT INTO `aluno` VALUES(11, 1, 20, 'M'),(12, 1, 19, 'F'),(13, 1, 18, 'M');INSERT INTO `disciplina` VALUES(1, 'Matemática', 'MAT1', 1, 10),(2, 'Português', 'POR1', 1, 9),(3, 'Geografia', 'GEO1', 1, 8),(4, 'História', 'HIS1', 1, 7),(5, 'Química', 'QUI1', 1, 6),(6, 'Física', 'FIS1', 1, 5),(7, 'Inglês', 'ING1', 1, 4),(8, 'Artes', 'ART1', 1, 3),(9, 'Filosofia', 'FIL1', 1, 2),(10, 'Sociologia', 'SOC1', 1, 2),(11, 'Matemática', 'MAT2', 2, 10),(12, 'Português', 'POR2', 2, 9),(13, 'Geografia', 'GEO2', 2, 8),(14, 'História', 'HIS2', 2, 7),(15, 'Química', 'QUI2', 2, 6),(16, 'Física', 'FIS2', 2, 5),(17, 'Inglês', 'ING2', 2, 4),(18, 'Artes', 'ART2', 2, 3),(19, 'Filosofia', 'FIL2', 2, 2),(20, 'Sociologia', 'SOC2', 2, 2),(21, 'Matemática', 'MAT3', 3, 10),(22, 'Português', 'POR3', 3, 9),(23, 'Geografia', 'GEO3', 3, 8),(24, 'História', 'HIS3', 3, 7),(25, 'Química', 'QUI3', 3, 6),(26, 'Física', 'FIS3', 3, 5),(27, 'Inglês', 'ING3', 3, 4),(28, 'Artes', 'ART3', 3, 3),(29, 'Filosofia', 'FIL3', 3, 2),(30, 'Sociologia', 'SOC3', 3, 2);