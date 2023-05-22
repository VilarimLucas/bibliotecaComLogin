-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bdbiblioteca
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbautor`
--

DROP TABLE IF EXISTS `tbautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbautor` (
  `codAutor` int NOT NULL AUTO_INCREMENT,
  `nomeAutor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbautor`
--

LOCK TABLES `tbautor` WRITE;
/*!40000 ALTER TABLE `tbautor` DISABLE KEYS */;
INSERT INTO `tbautor` VALUES (1,'Valéria Piassava Polise'),(2,'Water Isacsson'),(3,'Balakimar Balachandran'),(4,'Herman Melville'),(5,'J. R. R. Tokien'),(6,'George A. A. Martin'),(7,'Jorge Amado'),(8,'Neil Gaiman '),(9,'Joseph Edward Shigley'),(10,'SARKIS MELCONIAN'),(11,'Russell C. Hibbeler'),(12,'Franco Brunetti'),(13,'Robert L. Norton '),(14,'Henrique Rozenfeld'),(15,'Van Wylen'),(16,'Max Gunther ');
/*!40000 ALTER TABLE `tbautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbgenero`
--

DROP TABLE IF EXISTS `tbgenero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbgenero` (
  `codGenero` int NOT NULL AUTO_INCREMENT,
  `genero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbgenero`
--

LOCK TABLES `tbgenero` WRITE;
/*!40000 ALTER TABLE `tbgenero` DISABLE KEYS */;
INSERT INTO `tbgenero` VALUES (1,'Vibrações Mecânicas'),(2,'Termodinâmica'),(3,'Projetos'),(4,'Mecânica dos Sólidos'),(5,'Mecânica dos Fluidos'),(6,'Elemento de Máquinas'),(7,'Financeiro'),(8,'Biografia/Auto-Biografia'),(9,'Literatura Inglesa');
/*!40000 ALTER TABLE `tbgenero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblivro`
--

DROP TABLE IF EXISTS `tblivro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblivro` (
  `codLivro` int NOT NULL AUTO_INCREMENT,
  `nomeLivro` varchar(100) DEFAULT NULL,
  `codAutor` int DEFAULT NULL,
  `codGenero` int DEFAULT NULL,
  `anoLancamento` int DEFAULT NULL,
  `edicaoLivro` varchar(50) DEFAULT NULL,
  `descricaoLivro` text,
  `statusLivro` int DEFAULT NULL,
  PRIMARY KEY (`codLivro`),
  KEY `codAutor` (`codAutor`),
  KEY `codGenero` (`codGenero`),
  CONSTRAINT `tblivro_ibfk_1` FOREIGN KEY (`codAutor`) REFERENCES `tbautor` (`codAutor`),
  CONSTRAINT `tblivro_ibfk_2` FOREIGN KEY (`codGenero`) REFERENCES `tbgenero` (`codGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblivro`
--

LOCK TABLES `tblivro` WRITE;
/*!40000 ALTER TABLE `tblivro` DISABLE KEYS */;
INSERT INTO `tblivro` VALUES (1,'Vibrações mecânicas',3,1,2010,'1ª edição','A vibração é um tópico clássico e, ao longo dos anos, cresce a diversidade de sistemas projetados nos quais ela precisa se considerada. Neste livro, os autores apresentam uma introdução ao tópico para os alunos de engenharia e ciências físicas, contextualizando as aplicações das vibações em exemplos e exercícios práticos. Vibrações lineares e não lineares, construção de modelos de sistemas, análise, prognóstico e medição são aspectos físicos dos fenômenos vibratórios em todos os capítulos. O livro está organizado de modo a conduzir o estudante dos tópicos mais simples aos mais complexos. O capítulo 1 traz um resumo de conceitos, como cinemática e graus de liberdade, e de princípios, como o da quantidade de movimento linear, de Newton, e o da quantidade de movimento angular, de Euler. Nos capítulos que seguem sçao trabalhados conceitos de rigidez elástica equivalente, contrução de modelos de sistemas vibratórios, determinação da equação governante, sistemas de um e múltiplos graus de liberdade, linearização de sistemas não lineares, ressonância, função de resposta em frequência, excitação harmônica, frequências naturais e modos de vibrar, entre outros tópicos de vibrações. Em todo o livro, o MATLAB foi extensivamente utilizado. Exercícios finalizam cada capítulo, permitindo ao aluno aplicar e testar os conhecimentos adquiridos.',0),(2,'Gestão de desenvolvimento de produtos: Uma referência para a melhoria do processo',14,3,2012,'1ª edição','O livro Gestão de desenvolvimento de produtos apresenta de forma didática e completa um modelo estruturado para a gestão do processo de desenvolvimento de produtos.Apesar de possuir algumas particularidades relacionadas ao desenvolvimento de bens duráveis e equipamentos, o modelo pode ser adequado ao desenvolvimento de qualquer tipo de produto.O livro pode ser utilizado tanto por professores e alunos de graduação e pós-graduação de diversas áreas do conhecimento, como por profissionais de empresas, já que aborda o tema de uma forma prática, mas sem ser superficial.Além disso, o livro traz uma série de questões, exemplos, casos, dentre outros materiais, de modo a fazer com que o leitor fixe ainda mais o assunto que está sendo desenvolvido.Enfim, Gestão de desenvolvimento de produtos é um livro que pode ser utilizado por todos aqueles que desejam aprofundar seus conhecimentos na área de gestão de produtos sem perder de vista o embasamento teórico, mas sempre levando em conta o aspecto prático da questão.',1),(3,'Projeto de Máquinas: Uma Abordagem Integrada',13,3,2013,'4ª edição ','Livro baseado na longa experiência do professor em sala de aula, oferece na primeira parte os principais conceitos da disciplina. Os vários tópicos são então unidos, na segunda parte, por meio de estudos de caso. Conta com CD com diferentes programas de computador e modelos que facilitam o entendimento do assunto.',1),(4,'Os axiomas de Zurique',16,7,2017,'19ª edição','O sistema bancário suíço é um dos mais ricos do mundo. Milionários de todos os continentes aplicam no país não só pelo anonimato oferecido por suas instituições financeiras. Investidores que sabem como poucos ganhar dinheiro por meio de métodos e princípios que funcionam em qualquer lugar, sob quaisquer condições econômicas.',1),(5,'Fundamentos da Termodinâmica',15,2,2018,'2ª edição','A obra \"Fundamentos da Termodinâmica\", em sua oitava edição, reafirma sua importância como literatura de referência para o estudo da termodinâmica sob a perspectiva da engenharia. Sua adoção pelas melhores escolas de engenharia do mundo se deve a sua qualidade e sua capacidade de renovação.',1),(6,'Mecânica dos Fluidos',12,5,2008,'2ª edição','Pensada e escrita especificamente para atender às necessidades dos alunos e professores de engenharia, esta segunda edição de Mecânica dos fluidos mantém as características que consagraram o livro como um dos mais didáticos e completos da área. Com seu método inovador de apresentar o conteúdo ― resultado da experiência do autor como docente em instituições de renome ―, o livro aborda, desde o início, situações regidas por hipóteses simplificadoras para que o leitor compreenda e se acostume com as principais variáveis e efeitos e, em seguida, elimina gradualmente as simplificações, chegando a equações mais abrangentes. Nesta nova edição, as qualidades didáticas da obra são intensificadas por uma nova apresentação visual, com ilustrações mais ricas. Além disso, uma nova seção com 40 exercícios permite que o aluno teste o conhecimento adquirido. Livro-texto para cursos de engenharia, Mecânica dos fluidos é também leitura recomendada para cursos técnicos e bibliografia de atualização para profissionais da área.',1),(7,'Elementos de Máquinas',10,6,2019,'Revisada edição','O foco desse livro é tratar, de forma didática e estruturada, sobre o dimensionamento dos diferentes elementos de construção de máquinas e equipamentos, para serem utilizados nas diversas modalidades da engenharia, como a mecânica, mecatrônica, naval, aeronáutica, eletrotécnica, automação, entre outras. O conteúdo da obra está totalmente desenvolvido no Sistema Internacional (SI) e possui exemplos resolvidos. A décima primeira edição também apresenta um projeto gráfico reformulado e novos exercícios.',1),(8,'Elementos de Máquinas de Shigley ',9,6,2016,'10ª edição ','Clássico da área de projeto em engenharia mecânica, há 50 anos no mercado, este livro combina uma linguagem direta e focada em fundamentos com uma discussão detalhada e abrangente dos componentes. Estas características o tornaram uma referência indispensável para engenheiros praticantes. Inclui capítulo sobre dimensionamento e toleranciamento geométricos, que possbilita ao aluno melhor leitura e compreensão das especificações de projeto.',1),(9,'Estática: Mecânica para Engenharia',11,4,2017,'14ª edição ','Hibbeler é, indiscutivelmente, uma referência e suas obras são indispensáveis a qualquer estudante da área. Isso fica evidente com estes dois lança- mentos, que reforçam suas qualidades e seus recursos. A décima quarta edição inclui novos exercícios preliminares, que ajudam os alunos no desenvolvimento da compreensão de conceitos e na construção das habilidades de resolução de problemas. Os livros apresentam uma grande variedade de problemas em uma ampla gama de aplicações com diferentes níveis de dificuldade, enfatizando situações práticas e facilmente encontradas na rotina profissional. Para melhor ilustrar tudo isso, foram incluídas inúmeras fotos ao longo dos livros, que explicam como os princípios relevantes são aplicados a situações do mundo real e como os materiais se comportam sob uma nova carga. Pelo equilíbrio entre tradição e inovação, teoria e prática, Estática – mecânica para engenharia e Dinâmica – mecânica para engenharia são essenciais a estudantes de engenharia, mecânica, dinâmica e eletrotécnica que, com estes livros, desenvolverão habilidades para analisar e solucionar problemas reais.',1),(10,'Resistencia dos Materiais',11,4,2009,'5ª edição ','Em sua 5a edição, este texto ao mesmo tempo abrangente e profundo de Hibbeler confirma-se como referência na área de resistência dos materiais.',1),(11,'Steve Jobs',2,8,2011,' Reissue edição ','Based on more than forty interviews with Steve Jobs conducted over two years—as well as interviews with more than 100 family members, friends, adversaries, competitors, and colleagues—Walter Isaacson has written a riveting story of the roller-coaster life and searingly intense personality of a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.',0),(12,'Moby Dick',4,9,1851,'1ª edição','Lançado em 1851, Moby Dick, ou A baleia, de Herman Melville (1819-1891), se tornou um dos livros de aventura mais emblemáticos da literatura universal. A história do capitão Ahab, em busca de vingança contra o terrível cachalote que amputara sua perna, entrou definitivamente para a cultura popular, inspirando, entre outras criações, pinturas de Jackson Pollock e Frank Stella, adaptações de Orson Welles para o rádio e o teatro, um filme de John Huston, e até um blues do Led Zeppelin. Mas uma leitura atenta da obra-prima de Melville pode revelar as camadas mais profundas do texto, que deram ao autor o posto de maior prosador norte-americano do século XIX. Entremeados à narrativa vão se sobressaindo múltiplos elementos: referências bíblicas que ecoam críticas da época ao nascente imperialismo dos Estados Unidos; a questão racial, personificada na figura dos três arpoadores, um negro, um índio e um nativo polinésio; a análise da extração do óleo dos cachalotes como atividade econômica industrial, incluindo uma discussão sobre a sustentabilidade da pesca das baleias; as tensões sociais, que aparecem nas relações entre superiores e subordinados e na possibilidade sempre presente de um motim ― tudo isso encenado no palco shakespeariano do convés de um baleeiro que parte de Nantucket, em Massachusetts, até chegar ao Pacífico, onde ocorre o enfrentamento final entre o obsessivo capitão Ahab e a monstruosa baleia branca. Além de trazer ensaios de Evert Duyckinck, D. H. Lawrence e F. O. Mathiessen sobre Moby Dick, que delineiam a recepção crítica do livro, esta nova edição apresenta um prefácio de Albert Camus, inédito em nosso país, e um ensaio de Bruno Gambarotto, um dos maiores especialistas brasileiros na obra de Melville.',0);
/*!40000 ALTER TABLE `tblivro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbusuario`
--

DROP TABLE IF EXISTS `tbusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbusuario` (
  `usuario` varchar(100) NOT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `nivel` int DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbusuario`
--

LOCK TABLES `tbusuario` WRITE;
/*!40000 ALTER TABLE `tbusuario` DISABLE KEYS */;
INSERT INTO `tbusuario` VALUES ('lucasVilarim','1234',1),('usuInter','1234',2),('usuLimitado','1234',3);
/*!40000 ALTER TABLE `tbusuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 23:10:00
