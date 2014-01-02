/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50524
Source Host           : 127.0.0.1:3306
Source Database       : db_pivote

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-01-02 01:06:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bienregistro
-- ----------------------------
DROP TABLE IF EXISTS `bienregistro`;
CREATE TABLE `bienregistro` (
  `nBieRegCodigo` int(11) NOT NULL,
  `cBieCodigo` varchar(1000) DEFAULT NULL,
  `nBieCodigo` int(11) NOT NULL DEFAULT '0',
  `nbieestado` int(11) NOT NULL,
  `nbieCondicion` int(11) NOT NULL,
  `cMarModCodigo` varchar(1000) DEFAULT NULL,
  `cBieRegSerie` varchar(500) DEFAULT NULL,
  `cUbiGeoCodigo` varchar(40) DEFAULT NULL,
  `nUbiGeoCodigo` int(11) DEFAULT NULL,
  `nMarModCodigo` int(11) DEFAULT NULL,
  `nBieDepreEstado` int(11) DEFAULT NULL,
  PRIMARY KEY (`nBieRegCodigo`,`nBieCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bienregistro
-- ----------------------------

-- ----------------------------
-- Table structure for bieregcaracteristica
-- ----------------------------
DROP TABLE IF EXISTS `bieregcaracteristica`;
CREATE TABLE `bieregcaracteristica` (
  `nBieRegCodigo` int(11) NOT NULL,
  `nBieRegClase` int(11) NOT NULL,
  `nBieCarTipo` int(11) NOT NULL,
  `cBieValor` varchar(1000) NOT NULL,
  PRIMARY KEY (`nBieRegCodigo`,`nBieRegClase`,`nBieCarTipo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bieregcaracteristica
-- ----------------------------

-- ----------------------------
-- Table structure for bieregcomponente
-- ----------------------------
DROP TABLE IF EXISTS `bieregcomponente`;
CREATE TABLE `bieregcomponente` (
  `nBieCompCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `nBieRegCodigo` int(11) NOT NULL,
  `dBieCompFecAdq` date NOT NULL,
  `dBieCompFecReg` date NOT NULL,
  `nBieCompParCodigo` int(11) NOT NULL,
  `nBieCompCant` int(11) NOT NULL,
  `nBieCompPrecUnit` double(11,2) NOT NULL,
  `nBieCompPrecTotal` double(11,2) NOT NULL,
  `cBieCompObs` varchar(500) NOT NULL,
  `nBieCompEstado` int(11) NOT NULL,
  PRIMARY KEY (`nBieCompCodigo`,`nBieRegCodigo`,`dBieCompFecReg`,`nBieCompParCodigo`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bieregcomponente
-- ----------------------------

-- ----------------------------
-- Table structure for bieregdocumento
-- ----------------------------
DROP TABLE IF EXISTS `bieregdocumento`;
CREATE TABLE `bieregdocumento` (
  `nBieRegCodigo` int(11) NOT NULL,
  `cDocCodigo` varchar(100) NOT NULL,
  `nBieRegDocEstado` int(11) NOT NULL,
  PRIMARY KEY (`nBieRegCodigo`,`cDocCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bieregdocumento
-- ----------------------------

-- ----------------------------
-- Table structure for bieregmantenimiento
-- ----------------------------
DROP TABLE IF EXISTS `bieregmantenimiento`;
CREATE TABLE `bieregmantenimiento` (
  `nBieRegManCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `nBieRegCodigo` int(11) NOT NULL,
  `nBieRegParClase` varchar(250) NOT NULL,
  `nBieRegParCodigo` int(11) NOT NULL,
  `dBieRegManFecha` date NOT NULL,
  `dBieRegManFechaRea` date NOT NULL,
  `cBieRegObservacion` varchar(250) NOT NULL,
  `nBieRegManEstado` int(11) NOT NULL,
  `nBieRegEstado` int(11) NOT NULL,
  PRIMARY KEY (`nBieRegManCodigo`,`nBieRegCodigo`,`nBieRegParClase`,`nBieRegParCodigo`,`dBieRegManFecha`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bieregmantenimiento
-- ----------------------------

-- ----------------------------
-- Table structure for bieregperrelacion
-- ----------------------------
DROP TABLE IF EXISTS `bieregperrelacion`;
CREATE TABLE `bieregperrelacion` (
  `nBieRegItem` int(11) NOT NULL AUTO_INCREMENT,
  `nBieRegCodigo` int(11) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  `nPerRelacion` int(11) NOT NULL,
  `nEstadoRelacion` int(11) NOT NULL,
  PRIMARY KEY (`nBieRegItem`,`nBieRegCodigo`,`cPerCodigo`,`nPerRelacion`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bieregperrelacion
-- ----------------------------

-- ----------------------------
-- Table structure for bieregperservicio
-- ----------------------------
DROP TABLE IF EXISTS `bieregperservicio`;
CREATE TABLE `bieregperservicio` (
  `nBieRegItem` int(11) NOT NULL,
  `nBieRegCodigo` int(11) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  `nSerCodigo` int(11) NOT NULL,
  `nSerImporte` double(11,2) NOT NULL,
  `dBieSerFecha` date NOT NULL,
  `nBieSerEstado` int(11) NOT NULL,
  PRIMARY KEY (`nBieRegItem`,`nBieRegCodigo`,`cPerCodigo`,`nSerCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bieregperservicio
-- ----------------------------

-- ----------------------------
-- Table structure for ctactecomprobante
-- ----------------------------
DROP TABLE IF EXISTS `ctactecomprobante`;
CREATE TABLE `ctactecomprobante` (
  `cCtaCteRecibo` varchar(14) NOT NULL,
  `nCtaCteComCodigo` int(11) NOT NULL,
  `cCtaCteComNumero` varchar(11) NOT NULL,
  `nCtaCteTipoPago` int(11) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  PRIMARY KEY (`cCtaCteRecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactecomprobante
-- ----------------------------

-- ----------------------------
-- Table structure for ctactedetalle
-- ----------------------------
DROP TABLE IF EXISTS `ctactedetalle`;
CREATE TABLE `ctactedetalle` (
  `cCtaCteRecibo` varchar(15) NOT NULL,
  `Item` int(11) NOT NULL,
  `nSerCodigo` int(11) NOT NULL,
  `nCtaCteCantidad` decimal(9,2) NOT NULL,
  `nMoneda` int(11) NOT NULL,
  `fCtaCteTC` decimal(9,2) NOT NULL,
  `fCtaCteIGV` decimal(9,2) NOT NULL,
  `fCtaCteDetimporte` decimal(9,2) NOT NULL,
  `dCtaCteDetRegistro` datetime NOT NULL,
  `nCtaCtedetEstado` int(11) NOT NULL,
  PRIMARY KEY (`cCtaCteRecibo`,`Item`,`nSerCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactedetalle
-- ----------------------------

-- ----------------------------
-- Table structure for ctacteinterface
-- ----------------------------
DROP TABLE IF EXISTS `ctacteinterface`;
CREATE TABLE `ctacteinterface` (
  `nCtaCteMovCodigo` int(11) NOT NULL,
  `nOpeCodigo` int(11) NOT NULL,
  `nUniOrgCodigo` int(11) DEFAULT NULL,
  `nIntCodigo` int(11) DEFAULT NULL,
  `nIntClase` int(11) DEFAULT NULL,
  `cCtaCteMovColumna` varchar(30) DEFAULT NULL,
  `cCtaCteMovValor` varchar(30) DEFAULT NULL,
  `cCtaCteMovTraza` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctacteinterface
-- ----------------------------

-- ----------------------------
-- Table structure for ctactemov
-- ----------------------------
DROP TABLE IF EXISTS `ctactemov`;
CREATE TABLE `ctactemov` (
  `nCtaCteMovimiento` int(11) NOT NULL,
  `cCtaCteItem` varchar(15) NOT NULL,
  `nOpeCodigo` int(11) NOT NULL,
  `dCtaCteMovFecha` datetime NOT NULL,
  `cCtaCteMovValorA` varchar(150) NOT NULL,
  `cCtaCteMovValorN` varchar(150) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  PRIMARY KEY (`nCtaCteMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactemov
-- ----------------------------

-- ----------------------------
-- Table structure for ctactemovcuenta
-- ----------------------------
DROP TABLE IF EXISTS `ctactemovcuenta`;
CREATE TABLE `ctactemovcuenta` (
  `nCtaCteMovCodigo` int(11) NOT NULL,
  `nPerCtaCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactemovcuenta
-- ----------------------------

-- ----------------------------
-- Table structure for ctactemovimiento
-- ----------------------------
DROP TABLE IF EXISTS `ctactemovimiento`;
CREATE TABLE `ctactemovimiento` (
  `nCtaCteMovCodigo` int(11) NOT NULL,
  `dCtaCteMovFecha` datetime NOT NULL,
  `nPrdCodigo` int(11) NOT NULL,
  `cCtaCteMovObservacion` varchar(100) DEFAULT NULL,
  `cPerJurCodigo` varchar(20) NOT NULL,
  `bCtaCteMovEstado` bit(11) NOT NULL,
  PRIMARY KEY (`nCtaCteMovCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactemovimiento
-- ----------------------------

-- ----------------------------
-- Table structure for ctactemovpersona
-- ----------------------------
DROP TABLE IF EXISTS `ctactemovpersona`;
CREATE TABLE `ctactemovpersona` (
  `nCtaCteMovCodigo` int(11) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  `nTipoPersona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactemovpersona
-- ----------------------------

-- ----------------------------
-- Table structure for ctactenumeracion
-- ----------------------------
DROP TABLE IF EXISTS `ctactenumeracion`;
CREATE TABLE `ctactenumeracion` (
  `cPerJuridica` varchar(20) NOT NULL,
  `nComTipo` int(11) NOT NULL,
  `nSerie` int(11) NOT NULL,
  `Numero` varchar(200) NOT NULL,
  PRIMARY KEY (`cPerJuridica`,`nComTipo`,`nSerie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactenumeracion
-- ----------------------------

-- ----------------------------
-- Table structure for ctactepagdatos
-- ----------------------------
DROP TABLE IF EXISTS `ctactepagdatos`;
CREATE TABLE `ctactepagdatos` (
  `nCtaCtePagcodigo` int(11) NOT NULL,
  `cCtaCtePagDatPerJurCodigo` varchar(10) NOT NULL,
  `cCtaCtePagDatBanco` varchar(50) NOT NULL,
  `cCtaCtePagDatNroCuenta` varchar(25) NOT NULL,
  `dCtaCtePagDatFecha` datetime NOT NULL,
  `cCtaCtePagDatNroOperacion` varchar(15) DEFAULT NULL,
  `fCtaCtePagDatImporte` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactepagdatos
-- ----------------------------

-- ----------------------------
-- Table structure for ctactepago
-- ----------------------------
DROP TABLE IF EXISTS `ctactepago`;
CREATE TABLE `ctactepago` (
  `cCtaCteRecibo` varchar(18) NOT NULL,
  `nCtaCtePagcodigo` int(11) NOT NULL AUTO_INCREMENT,
  `cPerCodigo` varchar(20) NOT NULL,
  `nPerCtaCodigo` int(11) NOT NULL,
  `nTurno` int(11) NOT NULL,
  `nForPago` int(11) NOT NULL,
  `nTipPago` int(11) DEFAULT NULL,
  `cCtaCtePagNroOperacion` varchar(50) DEFAULT NULL,
  `dCtaCtePagfecha` datetime NOT NULL,
  `CtaCtePagGlosa` varchar(250) DEFAULT NULL,
  `fCtaCtePagImporte` decimal(9,2) NOT NULL,
  PRIMARY KEY (`nCtaCtePagcodigo`,`cCtaCteRecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactepago
-- ----------------------------

-- ----------------------------
-- Table structure for ctactereferencia
-- ----------------------------
DROP TABLE IF EXISTS `ctactereferencia`;
CREATE TABLE `ctactereferencia` (
  `cCtaCteReciboCargo` varchar(20) NOT NULL,
  `cCtaCteReciboAbono` varchar(20) NOT NULL,
  `nCtaCteOpeCodigo` int(11) NOT NULL,
  `nCtaCteTipo` int(11) NOT NULL,
  `dCtaCteFecha` datetime NOT NULL,
  `fCtaCteMonto` decimal(9,2) NOT NULL,
  `nMonCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctactereferencia
-- ----------------------------

-- ----------------------------
-- Table structure for ctacteservicio
-- ----------------------------
DROP TABLE IF EXISTS `ctacteservicio`;
CREATE TABLE `ctacteservicio` (
  `nSerCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `nBieCodigo` int(11) NOT NULL,
  `nActCodigo` int(11) NOT NULL,
  `nSerImporte` float(11,0) NOT NULL,
  `nMonCodigo` int(11) NOT NULL,
  `nSerAfecto` int(11) NOT NULL,
  `nSerTipo` int(11) NOT NULL,
  `nSerModalidad` int(11) NOT NULL,
  `fSerTasa` float(11,0) NOT NULL,
  `nSerPeriodicidad` int(11) NOT NULL,
  `nUniOrgCodigo` int(11) DEFAULT NULL,
  `nPrdCodigo` int(11) NOT NULL,
  PRIMARY KEY (`nSerCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ctacteservicio
-- ----------------------------

-- ----------------------------
-- Table structure for cuentacorriente
-- ----------------------------
DROP TABLE IF EXISTS `cuentacorriente`;
CREATE TABLE `cuentacorriente` (
  `cCtaCteRecibo` varchar(15) NOT NULL,
  `nPerCtaCodigo` int(11) NOT NULL,
  `nCtaCteTipo` int(11) NOT NULL,
  `nCtaCteItem` int(11) NOT NULL,
  `fCtaCteImporte` decimal(9,2) NOT NULL,
  `nCtaCteCuota` int(11) NOT NULL,
  `nCtaCteEstado` int(11) NOT NULL,
  `dCtaCteFecVence` datetime NOT NULL,
  `dCtaCteFecPago` datetime DEFAULT NULL,
  `dCtaCteFecEmis` datetime DEFAULT NULL,
  `dCtaCteFecRegistro` datetime NOT NULL,
  `cCtaCteGlosa` varchar(150) DEFAULT NULL,
  `nPrdCodigo` int(11) DEFAULT NULL,
  `nMonCodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`cCtaCteRecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cuentacorriente
-- ----------------------------

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `IdDepartamento` char(8) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `IdPais` char(8) NOT NULL,
  `nDepEstado` int(4) DEFAULT '1',
  PRIMARY KEY (`IdDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of departamento
-- ----------------------------
INSERT INTO `departamento` VALUES ('dep00001', 'Amazonas', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00002', 'Ancash', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00003', 'Apurimac', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00004', 'Arequipa', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00005', 'Ayacucho', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00006', 'Cajamarca', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00007', 'Cusco', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00008', 'Huanuco', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00009', 'Huancavelica', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00010', 'Ica', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00011', 'Junin', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00012', 'La Libertad', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00013', 'Lambayeque', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00014', 'Lima', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00015', 'Loreto', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00016', 'Madre de Dios', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00017', 'Moquegua', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00018', 'Pasco', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00019', 'Piura', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00020', 'Puno', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00021', 'San Martin', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00022', 'Tacna', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00023', 'Tumbes', 'pai00001', '1');
INSERT INTO `departamento` VALUES ('dep00024', 'Ucayali', 'pai00001', '1');

-- ----------------------------
-- Table structure for distrito
-- ----------------------------
DROP TABLE IF EXISTS `distrito`;
CREATE TABLE `distrito` (
  `IdDistrito` char(8) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `IdProvincia` char(8) NOT NULL,
  `nDisEstado` int(4) DEFAULT '1',
  PRIMARY KEY (`IdDistrito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of distrito
-- ----------------------------
INSERT INTO `distrito` VALUES ('dis00001', 'Chachapoyas', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00002', 'Asuncion', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00003', 'Balsas', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00004', 'Cheto', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00005', 'Chiliquin', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00006', 'Chuquibamba', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00007', 'Granada', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00008', 'Huancas', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00009', 'La Jalca', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00010', 'Leimebamba', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00011', 'Levanto', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00012', 'Magdalena', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00013', 'Mariscal Castilla', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00014', 'Molinopampa', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00015', 'Montevideo', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00016', 'Olleros', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00017', 'Quinjalca', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00018', 'San Francisco de Daguas', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00019', 'San Isidro de Maino', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00020', 'Soloco', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00021', 'Sonche', 'pro00001', '1');
INSERT INTO `distrito` VALUES ('dis00022', 'Lla Peca', 'pro00002', '1');
INSERT INTO `distrito` VALUES ('dis00023', 'Aramango', 'pro00002', '1');
INSERT INTO `distrito` VALUES ('dis00024', 'Copallin', 'pro00002', '1');
INSERT INTO `distrito` VALUES ('dis00025', 'El Parco', 'pro00002', '1');
INSERT INTO `distrito` VALUES ('dis00026', 'Imaza', 'pro00002', '1');
INSERT INTO `distrito` VALUES ('dis00027', 'Jumbilla', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00028', 'Chisquilla', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00029', 'Churuja', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00030', 'Corosha', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00031', 'Cuispes', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00032', 'Florida', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00033', 'Jazan', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00034', 'Recta', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00035', 'San Carlos', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00036', 'Shipasbamba', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00037', 'Valera', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00038', 'Yambrasbamba', 'pro00003', '1');
INSERT INTO `distrito` VALUES ('dis00039', 'Nieva', 'pro00004', '1');
INSERT INTO `distrito` VALUES ('dis00040', 'El Cenepa', 'pro00004', '1');
INSERT INTO `distrito` VALUES ('dis00041', 'Rio Santiago', 'pro00004', '1');
INSERT INTO `distrito` VALUES ('dis00042', 'Lamud', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00043', 'Camporredondo', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00044', 'Cocabamba', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00045', 'Colcamar', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00046', 'Conila', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00047', 'Inguilpata', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00048', 'Longuita', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00049', 'Lonya Chico', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00050', 'Luya', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00051', 'Luya Viejo', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00052', 'Maria', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00053', 'Ocalli', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00054', 'Ocumal', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00055', 'Pisuquia', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00056', 'Providencia', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00057', 'San Cristobal', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00058', 'San Francisco Del Yeso', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00059', 'San Jeronimo', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00060', 'San Juan De Lopecancha', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00061', 'Santa Catalina', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00062', 'Santo Tomas', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00063', 'Tingo', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00064', 'Trita', 'pro00005', '1');
INSERT INTO `distrito` VALUES ('dis00065', 'San Nicolas', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00066', 'Chirimoto', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00067', 'Cochamal', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00068', 'Huambo', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00069', 'Limabamba', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00070', 'Longar', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00071', 'Mariscal Benavides', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00072', 'Milpuc', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00073', 'Omia', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00074', 'Santa Rosa', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00075', 'Totora', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00076', 'Vista Alegre', 'pro00006', '1');
INSERT INTO `distrito` VALUES ('dis00077', 'Bagua Grande', 'pro00007', '1');
INSERT INTO `distrito` VALUES ('dis00078', 'Cajaruro', 'pro00007', '1');
INSERT INTO `distrito` VALUES ('dis00079', 'Cumba', 'pro00007', '1');
INSERT INTO `distrito` VALUES ('dis00080', 'El Milagro', 'pro00007', '1');
INSERT INTO `distrito` VALUES ('dis00081', 'Jamalca', 'pro00007', '1');
INSERT INTO `distrito` VALUES ('dis00082', 'Lonya Grande', 'pro00007', '1');
INSERT INTO `distrito` VALUES ('dis00083', 'Yamon', 'pro00007', '1');
INSERT INTO `distrito` VALUES ('dis00084', 'Huaraz', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00085', 'Cochabamba', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00086', 'Colcabamba', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00087', 'Huanchay', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00088', 'Jangas', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00089', 'La Libertad', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00090', 'Olleros', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00091', 'Pampas', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00092', 'Pariacoto', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00093', 'Pira', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00094', 'Tarica', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00095', 'Independencia', 'pro00008', '1');
INSERT INTO `distrito` VALUES ('dis00096', 'Aija', 'pro00009', '1');
INSERT INTO `distrito` VALUES ('dis00097', 'Coris', 'pro00009', '1');
INSERT INTO `distrito` VALUES ('dis00098', 'Huacllan', 'pro00009', '1');
INSERT INTO `distrito` VALUES ('dis00099', 'La Merced', 'pro00009', '1');
INSERT INTO `distrito` VALUES ('dis00100', 'Succha', 'pro00009', '1');
INSERT INTO `distrito` VALUES ('dis00101', 'Llamellin', 'pro00010', '1');
INSERT INTO `distrito` VALUES ('dis00102', 'Aczo', 'pro00010', '1');
INSERT INTO `distrito` VALUES ('dis00103', 'Chaccho', 'pro00010', '1');
INSERT INTO `distrito` VALUES ('dis00104', 'Chingas', 'pro00010', '1');
INSERT INTO `distrito` VALUES ('dis00105', 'Mirgas', 'pro00010', '1');
INSERT INTO `distrito` VALUES ('dis00106', 'San Juan De Rontoy', 'pro00010', '1');
INSERT INTO `distrito` VALUES ('dis00107', 'Chacas', 'pro00011', '1');
INSERT INTO `distrito` VALUES ('dis00108', 'Acochaca', 'pro00011', '1');
INSERT INTO `distrito` VALUES ('dis00109', 'Chiquian', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00110', 'Abelardo Pardo Lezameta', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00111', 'Antonio Raymondi', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00112', 'Aquia', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00113', 'Cajacay', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00114', 'Canis', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00115', 'Colquioc', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00116', 'Huallanca', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00117', 'Huasta', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00118', 'Huayllacayan', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00119', 'La Primavera', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00120', 'Mangas', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00121', 'Pacllon', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00122', 'S. Mgel De Corpanqui', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00123', 'Ticllos', 'pro00012', '1');
INSERT INTO `distrito` VALUES ('dis00124', 'Carhuaz', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00125', 'Acopampa', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00126', 'Amashca', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00127', 'Anta', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00128', 'Ataquero', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00129', 'Marcara', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00130', 'Pariahuanca', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00131', 'San Miguel De Aco', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00132', 'Shilla', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00133', 'Tinco', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00134', 'Yungar', 'pro00013', '1');
INSERT INTO `distrito` VALUES ('dis00135', 'San Luis', 'pro00014', '1');
INSERT INTO `distrito` VALUES ('dis00136', 'San Nicolas', 'pro00014', '1');
INSERT INTO `distrito` VALUES ('dis00137', 'Yauya', 'pro00014', '1');
INSERT INTO `distrito` VALUES ('dis00138', 'Casma', 'pro00015', '1');
INSERT INTO `distrito` VALUES ('dis00139', 'Buena Vista Alta', 'pro00015', '1');
INSERT INTO `distrito` VALUES ('dis00140', 'Comandante Noel', 'pro00015', '1');
INSERT INTO `distrito` VALUES ('dis00141', 'Yautan', 'pro00015', '1');
INSERT INTO `distrito` VALUES ('dis00142', 'Corongo', 'pro00016', '1');
INSERT INTO `distrito` VALUES ('dis00143', 'Aco', 'pro00016', '1');
INSERT INTO `distrito` VALUES ('dis00144', 'Bambas', 'pro00016', '1');
INSERT INTO `distrito` VALUES ('dis00145', 'Cusca', 'pro00016', '1');
INSERT INTO `distrito` VALUES ('dis00146', 'La Pampa', 'pro00016', '1');
INSERT INTO `distrito` VALUES ('dis00147', 'Yanac', 'pro00016', '1');
INSERT INTO `distrito` VALUES ('dis00148', 'Yupan', 'pro00016', '1');
INSERT INTO `distrito` VALUES ('dis00149', 'Huari', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00150', 'Anra', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00151', 'Cajay', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00152', 'Chavin De Huantar', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00153', 'Huacachi', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00154', 'Huacchis', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00155', 'Huachis', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00156', 'Huantar', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00157', 'Masin', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00158', 'Paucas', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00159', 'Ponto', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00160', 'Rahuapampa', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00161', 'Rapayan', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00162', 'San Marcos', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00163', 'San Pedro De Chana', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00164', 'Uco', 'pro00017', '1');
INSERT INTO `distrito` VALUES ('dis00165', 'Huarmey', 'pro00018', '1');
INSERT INTO `distrito` VALUES ('dis00166', 'Cochapeti', 'pro00018', '1');
INSERT INTO `distrito` VALUES ('dis00167', 'Culebras', 'pro00018', '1');
INSERT INTO `distrito` VALUES ('dis00168', 'Huayan', 'pro00018', '1');
INSERT INTO `distrito` VALUES ('dis00169', 'Malvas', 'pro00018', '1');
INSERT INTO `distrito` VALUES ('dis00170', 'Caraz', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00171', 'Huallanca', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00172', 'Huata', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00173', 'Huaylas', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00174', 'Mato', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00175', 'Pamparomas', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00176', 'Pueblo Libre', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00177', 'Santa Cruz', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00178', 'Santo Toribio', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00179', 'Yuracmarca', 'pro00019', '1');
INSERT INTO `distrito` VALUES ('dis00180', 'Piscobamba', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00181', 'Casca', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00182', 'Eleazar Guzman Barron', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00183', 'Fidel Olivas Escudero', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00184', 'Llama', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00185', 'Llumpa', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00186', 'Lucma', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00187', 'Musga', 'pro00020', '1');
INSERT INTO `distrito` VALUES ('dis00188', 'Ocros', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00189', 'Acas', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00190', 'Cajamarquilla', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00191', 'Carhuapampa', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00192', 'Cochas', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00193', 'Congas', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00194', 'Llipa', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00195', 'San Cristobal De Rajan', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00196', 'San Pedro', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00197', 'Santiago De Chilcas', 'pro00021', '1');
INSERT INTO `distrito` VALUES ('dis00198', 'Cabana', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00199', 'Bolognesi', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00200', 'Conchucos', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00201', 'Huacaschuque', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00202', 'Huandoval', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00203', 'Lacabamba', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00204', 'Llapo', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00205', 'Pallasca', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00206', 'Pampas', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00207', 'Santa Rosa', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00208', 'Tauca', 'pro00022', '1');
INSERT INTO `distrito` VALUES ('dis00209', 'Pomabamba', 'pro00023', '1');
INSERT INTO `distrito` VALUES ('dis00210', 'Huayllan', 'pro00023', '1');
INSERT INTO `distrito` VALUES ('dis00211', 'Parobamba', 'pro00023', '1');
INSERT INTO `distrito` VALUES ('dis00212', 'Quinuabamba', 'pro00023', '1');
INSERT INTO `distrito` VALUES ('dis00213', 'Recuay', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00214', 'Catac', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00215', 'Cotaparaco', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00216', 'Huayllapampa', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00217', 'Llacllin', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00218', 'Marca', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00219', 'Pampas Chico', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00220', 'Pararin', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00221', 'Tapacocha', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00222', 'Ticapampa', 'pro00024', '1');
INSERT INTO `distrito` VALUES ('dis00223', 'Chimbote', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00224', 'Caceres Del Peru', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00225', 'Coishco', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00226', 'Macate', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00227', 'Moro', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00228', 'Nepeña', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00229', 'Samanco', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00230', 'Santa', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00231', 'Nuevo Chimbote', 'pro00025', '1');
INSERT INTO `distrito` VALUES ('dis00232', 'Sihuas', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00233', 'Acobamba', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00234', 'Alfonso Ugarte', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00235', 'Cashapampa', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00236', 'Chingalpo', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00237', 'Huayllabamba', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00238', 'Quiches', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00239', 'Ragash', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00240', 'San Juan', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00241', 'Sicsibamba', 'pro00026', '1');
INSERT INTO `distrito` VALUES ('dis00242', 'Yungay', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00243', 'Cascapara', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00244', 'Mancos', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00245', 'Matacoto', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00246', 'Quillo', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00247', 'Ranrahirca', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00248', 'Shupluy', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00249', 'Yanama', 'pro00027', '1');
INSERT INTO `distrito` VALUES ('dis00250', 'Abancay', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00251', 'Chacoche', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00252', 'Circa', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00253', 'Curahuasi', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00254', 'Huanipaca', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00255', 'Lambrama', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00256', 'Pichirhua', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00257', 'San Pedro De Cachora', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00258', 'Tamburco', 'pro00028', '1');
INSERT INTO `distrito` VALUES ('dis00259', 'Antabamba', 'pro00030', '1');
INSERT INTO `distrito` VALUES ('dis00260', 'El Oro', 'pro00030', '1');
INSERT INTO `distrito` VALUES ('dis00261', 'Huaquirca', 'pro00030', '1');
INSERT INTO `distrito` VALUES ('dis00262', 'Juan Espinoza Medrano', 'pro00030', '1');
INSERT INTO `distrito` VALUES ('dis00263', 'Oropesa', 'pro00030', '1');
INSERT INTO `distrito` VALUES ('dis00264', 'Pachaconas', 'pro00030', '1');
INSERT INTO `distrito` VALUES ('dis00265', 'Sabaino', 'pro00030', '1');
INSERT INTO `distrito` VALUES ('dis00266', 'Chalhuanca', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00267', 'Capaya', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00268', 'Caraybamba', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00269', 'Chapimarca', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00270', 'Colcabamba', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00271', 'Cotaruse', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00272', 'Huayllo', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00273', 'Justo Apu Sahuaraura', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00274', 'Lucre', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00275', 'Pocohuanca', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00276', 'San Juan De Chacña', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00277', 'Sañayca', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00278', 'Soraya', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00279', 'Tapairihua', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00280', 'Tintay', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00281', 'Toraya', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00282', 'Yanaca', 'pro00031', '1');
INSERT INTO `distrito` VALUES ('dis00283', 'Tambobamba', 'pro00032', '1');
INSERT INTO `distrito` VALUES ('dis00284', 'Cotabambas', 'pro00032', '1');
INSERT INTO `distrito` VALUES ('dis00285', 'Coyllurqui', 'pro00032', '1');
INSERT INTO `distrito` VALUES ('dis00286', 'Haquira', 'pro00032', '1');
INSERT INTO `distrito` VALUES ('dis00287', 'Mara', 'pro00032', '1');
INSERT INTO `distrito` VALUES ('dis00288', 'Challhuahuacho', 'pro00032', '1');
INSERT INTO `distrito` VALUES ('dis00289', 'Chuquibambilla', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00290', 'Curpahuasi', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00291', 'Gamarra', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00292', 'Huayllati', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00293', 'Mamara', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00294', 'Micaela Bastidas', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00295', 'Pataypampa', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00296', 'Progreso', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00297', 'San Antonio', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00298', 'Santa Rosa', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00299', 'Turpay', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00300', 'Vilcabamba', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00301', 'Virundo', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00302', 'Curasco', 'pro00034', '1');
INSERT INTO `distrito` VALUES ('dis00303', 'Chincheros', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00304', 'Anco-huallo', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00305', 'Cocharcas', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00306', 'Huaccana', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00307', 'Ocobamba', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00308', 'Ongoy', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00309', 'Uranmarca', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00310', 'Ranracancha', 'pro00033', '1');
INSERT INTO `distrito` VALUES ('dis00311', 'Andahuaylas', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00312', 'Andarapa', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00313', 'Chiara', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00314', 'Huancarama', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00315', 'Huancaray', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00316', 'Huayana', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00317', 'Kishuara', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00318', 'Pacobamba', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00319', 'Pacucha', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00320', 'Pampachiri', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00321', 'Pomacocha', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00322', 'San Antonio De Cachi', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00323', 'San Jeronimo', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00324', 'San Miguel De Chaccrampa', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00325', 'Santa Maria De Chicmo', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00326', 'Talavera', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00327', 'Tumay Huaraca', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00328', 'Turpo', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00329', 'Kaquiabamba', 'pro00029', '1');
INSERT INTO `distrito` VALUES ('dis00330', 'Arequipa', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00331', 'Alto Selva Alegre', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00332', 'Cayma', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00333', 'Cerro Colorado', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00334', 'Characato', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00335', 'Chiguata', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00336', 'Jacobo Hunter', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00337', 'La Joya', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00338', 'Mariano Melgar', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00339', 'Miraflores', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00340', 'Mollebaya', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00341', 'Paucarpata', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00342', 'Pocsi', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00343', 'Polobaya', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00344', 'Quequeña', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00345', 'Sabandia', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00346', 'Sachaca', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00347', 'San Juan De Siguas', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00348', 'San Juan De Tarucani', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00349', 'Santa Isabel De Siguas', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00350', 'Santa Rita De Siguas', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00351', 'Socabaya', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00352', 'Tiabaya', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00353', 'Uchumayo', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00354', 'Vitor', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00355', 'Yanahuara', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00356', 'Yarabamba', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00357', 'Yura', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00358', 'Jose Luis Bustamante Y Rivero', 'pro00035', '1');
INSERT INTO `distrito` VALUES ('dis00359', 'Camana', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00360', 'Jose Maria Quimper', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00361', 'Mariano Nicolas Valcarcel', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00362', 'Mariscal Caceres', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00363', 'Nicolas De Pierola', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00364', 'Ocoña', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00365', 'Quilca', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00366', 'Samuel Pastor', 'pro00036', '1');
INSERT INTO `distrito` VALUES ('dis00367', 'Caraveli', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00368', 'Acari', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00369', 'Atico', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00370', 'Atiquipa', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00371', 'Bella Union', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00372', 'Cahuacho', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00373', 'Chala', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00374', 'Chaparra', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00375', 'Huanuhuanu', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00376', 'Jaqui', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00377', 'Lomas', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00378', 'Quicacha', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00379', 'Yauca', 'pro00037', '1');
INSERT INTO `distrito` VALUES ('dis00380', 'Aplao', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00381', 'Andagua', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00382', 'Ayo', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00383', 'Chachas', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00384', 'Chilcaymarca', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00385', 'Choco', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00386', 'Huancarqui', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00387', 'Machaguay', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00388', 'Orcopampa', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00389', 'Pampacolca', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00390', 'Tipan', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00391', 'Uñon', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00392', 'Uraca', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00393', 'Viraco', 'pro00038', '1');
INSERT INTO `distrito` VALUES ('dis00394', 'Chivay', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00395', 'Achoma', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00396', 'Cabanaconde', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00397', 'Callalli', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00398', 'Caylloma', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00399', 'Coporaque', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00400', 'Huambo', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00401', 'Huanca', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00402', 'Ichupampa', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00403', 'Lari', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00404', 'Lluta', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00405', 'Maca', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00406', 'Madrigal', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00407', 'San Antonio De Chuca', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00408', 'Sibayo', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00409', 'Tapay', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00410', 'Tisco', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00411', 'Tuti', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00412', 'Yanque', 'pro00039', '1');
INSERT INTO `distrito` VALUES ('dis00413', 'Chuquibamba', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00414', 'Andaray', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00415', 'Cayarani', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00416', 'Chichas', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00417', 'Iray', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00418', 'Rio Grande', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00419', 'Salamanca', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00420', 'Yanaquihua', 'pro00040', '1');
INSERT INTO `distrito` VALUES ('dis00421', 'Mollendo', 'pro00041', '1');
INSERT INTO `distrito` VALUES ('dis00422', 'Cocachacra', 'pro00041', '1');
INSERT INTO `distrito` VALUES ('dis00423', 'Dean Valdivia', 'pro00041', '1');
INSERT INTO `distrito` VALUES ('dis00424', 'Islay', 'pro00041', '1');
INSERT INTO `distrito` VALUES ('dis00425', 'Mejia', 'pro00041', '1');
INSERT INTO `distrito` VALUES ('dis00426', 'Punta De Bombon', 'pro00041', '1');
INSERT INTO `distrito` VALUES ('dis00427', 'Cotahuasi', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00428', 'Alca', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00429', 'Charcana', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00430', 'Huaynacotas', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00431', 'Pampamarca', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00432', 'Puyca', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00433', 'Quechualla', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00434', 'Sayla', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00435', 'Tauria', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00436', 'Tomepampa', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00437', 'Toro', 'pro00042', '1');
INSERT INTO `distrito` VALUES ('dis00438', 'Ayacucho', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00439', 'Acocro', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00440', 'Acos Vinchos', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00441', 'Carmen Alto', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00442', 'Chiara', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00443', 'Ocros', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00444', 'Pacaycasa', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00445', 'Quinua', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00446', 'San Jose De Ticllas', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00447', 'San Juan Bautista', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00448', 'Santiago De Pischa', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00449', 'Socos', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00450', 'Tambillo', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00451', 'Vinchos', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00452', 'Jesus Nazareno', 'pro00043', '1');
INSERT INTO `distrito` VALUES ('dis00453', 'Cangallo', 'pro00044', '1');
INSERT INTO `distrito` VALUES ('dis00454', 'Chuschi', 'pro00044', '1');
INSERT INTO `distrito` VALUES ('dis00455', 'Los Morochucos', 'pro00044', '1');
INSERT INTO `distrito` VALUES ('dis00456', 'Maria Parado De Bellido', 'pro00044', '1');
INSERT INTO `distrito` VALUES ('dis00457', 'Paras', 'pro00044', '1');
INSERT INTO `distrito` VALUES ('dis00458', 'Totos', 'pro00044', '1');
INSERT INTO `distrito` VALUES ('dis00459', 'Sancos', 'pro00045', '1');
INSERT INTO `distrito` VALUES ('dis00460', 'Carapo', 'pro00045', '1');
INSERT INTO `distrito` VALUES ('dis00461', 'Sacsamarca', 'pro00045', '1');
INSERT INTO `distrito` VALUES ('dis00462', 'Santiago De Lucanamarca', 'pro00045', '1');
INSERT INTO `distrito` VALUES ('dis00463', 'Huanta', 'pro00046', '1');
INSERT INTO `distrito` VALUES ('dis00464', 'Hayahuanco', 'pro00046', '1');
INSERT INTO `distrito` VALUES ('dis00465', 'Huamanguilla', 'pro00046', '1');
INSERT INTO `distrito` VALUES ('dis00466', 'Iguain', 'pro00046', '1');
INSERT INTO `distrito` VALUES ('dis00467', 'Luricocha', 'pro00046', '1');
INSERT INTO `distrito` VALUES ('dis00468', 'Santillana', 'pro00046', '1');
INSERT INTO `distrito` VALUES ('dis00469', 'Sivia', 'pro00046', '1');
INSERT INTO `distrito` VALUES ('dis00470', 'San Miguel', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00471', 'Anco', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00472', 'Ayna', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00473', 'Chilcas', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00474', 'Chungui', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00475', 'Luis Carranza', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00476', 'Tambo', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00477', 'Santa Rosa', 'pro00047', '1');
INSERT INTO `distrito` VALUES ('dis00478', 'Puquio', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00479', 'Aucara', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00480', 'Cabana', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00481', 'Carmen Salcedo', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00482', 'Chaviña', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00483', 'Chipao', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00484', 'Huac-huas', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00485', 'Laramate', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00486', 'Leoncio Prado', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00487', 'Llauta', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00488', 'Lucanas', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00489', 'Ocaña', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00490', 'Otoca', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00491', 'Saisa', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00492', 'San Cristobal', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00493', 'San Juan', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00494', 'San Pedro', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00495', 'San Pedro De Palco', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00496', 'Sancos', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00497', 'Santa Ana De Huaycahuacho', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00498', 'Santa Lucia', 'pro00048', '1');
INSERT INTO `distrito` VALUES ('dis00499', 'Coracora', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00500', 'Chumpi', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00501', 'Coronel Castañeda', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00502', 'Pacapausa', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00503', 'Pullo', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00504', 'Puyusca', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00505', 'San Francisco De Ravacayco', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00506', 'Upahuacho', 'pro00049', '1');
INSERT INTO `distrito` VALUES ('dis00507', 'Pausa', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00508', 'Colta', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00509', 'Corculla', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00510', 'Lampa', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00511', 'Marcabamba', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00512', 'Oyolo', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00513', 'Pararca', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00514', 'San Javier Del Alpabamba', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00515', 'San Jose De Ushua', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00516', 'Sara Sara', 'pro00050', '1');
INSERT INTO `distrito` VALUES ('dis00517', 'Querobamba', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00518', 'Belen', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00519', 'Chalcos', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00520', 'Chilcayoc', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00521', 'Huacaña', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00522', 'Morcolla', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00523', 'Paico', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00524', 'San Pedro De Larcay', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00525', 'San Salvador De Quije', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00526', 'Santiago De Paucaray', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00527', 'Soras', 'pro00051', '1');
INSERT INTO `distrito` VALUES ('dis00528', 'Huancapi', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00529', 'Alcamenca', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00530', 'Apongo', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00531', 'Asquipata', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00532', 'Canaria', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00533', 'Cayara', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00534', 'Colca', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00535', 'Huamanquiquia', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00536', 'Huancaraylla', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00537', 'Huaya', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00538', 'Sarhua', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00539', 'Vilcanchos', 'pro00052', '1');
INSERT INTO `distrito` VALUES ('dis00540', 'Vilcas Huaman', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00541', 'Accomarca', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00542', 'Carhuanca', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00543', 'Concepcion', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00544', 'Huambalpa', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00545', 'Independencia', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00546', 'Saurama', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00547', 'Vischongo', 'pro00053', '1');
INSERT INTO `distrito` VALUES ('dis00548', 'San Ignacio', 'pro00062', '1');
INSERT INTO `distrito` VALUES ('dis00549', 'Chirinos', 'pro00062', '1');
INSERT INTO `distrito` VALUES ('dis00550', 'Huarango', 'pro00062', '1');
INSERT INTO `distrito` VALUES ('dis00551', 'La Coipa', 'pro00062', '1');
INSERT INTO `distrito` VALUES ('dis00552', 'Namballe', 'pro00062', '1');
INSERT INTO `distrito` VALUES ('dis00553', 'San Jose De Lourdes', 'pro00062', '1');
INSERT INTO `distrito` VALUES ('dis00554', 'Tabaconas', 'pro00062', '1');
INSERT INTO `distrito` VALUES ('dis00555', 'Jaen', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00556', 'Bellavista', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00557', 'Chontali', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00558', 'Colasay', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00559', 'Huabal', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00560', 'Las Pirias', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00561', 'Pomahuaca', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00562', 'Pucara', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00563', 'Sallique', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00564', 'San Felipe', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00565', 'San Jose Del Alto', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00566', 'Santa Rosa', 'pro00061', '1');
INSERT INTO `distrito` VALUES ('dis00567', 'Cutervo', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00568', 'Callayuc', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00569', 'Choros', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00570', 'Cujillo', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00571', 'La Ramada', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00572', 'Pimpingos', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00573', 'Querocotillo', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00574', 'San Andres De Cutervo', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00575', 'San Juan De Cutervo', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00576', 'San Luis De Lucma', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00577', 'Santa Cruz', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00578', 'Santo Domingo De La Capilla', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00579', 'Santo Tomas', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00580', 'Socota', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00581', 'Toribio Casanova', 'pro00059', '1');
INSERT INTO `distrito` VALUES ('dis00582', 'Chota', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00583', 'Anguia', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00584', 'Chadin', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00585', 'Chiguirip', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00586', 'Chimban', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00587', 'Cochabamba', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00588', 'Conchan', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00589', 'Huambos', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00590', 'Lajas', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00591', 'Llama', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00592', 'Miracosta', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00593', 'Paccha', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00594', 'Pion', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00595', 'Querocoto', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00596', 'San Juan De Licupis', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00597', 'Tacabamba', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00598', 'Tocmoche', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00599', 'Choropampa', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00600', 'Chalamarca', 'pro00057', '1');
INSERT INTO `distrito` VALUES ('dis00601', 'Santa Cruz', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00602', 'Andabamba', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00603', 'Catache', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00604', 'Chancaybaños', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00605', 'La Esperanza', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00606', 'Ninabamba', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00607', 'Pulan', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00608', 'Saucepampa', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00609', 'Sexi', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00610', 'Uticyacu', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00611', 'Yauyucan', 'pro00066', '1');
INSERT INTO `distrito` VALUES ('dis00612', 'Bambamarca', 'pro00060', '1');
INSERT INTO `distrito` VALUES ('dis00613', 'Chugur', 'pro00060', '1');
INSERT INTO `distrito` VALUES ('dis00614', 'Hualgayoc', 'pro00060', '1');
INSERT INTO `distrito` VALUES ('dis00615', 'Celendin', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00616', 'Chumuch', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00617', 'Cortegana', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00618', 'Huasmin', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00619', 'Jorge Chavez', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00620', 'Jose Galvez', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00621', 'Miguel Iglesias', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00622', 'Oxamarca', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00623', 'Sorochuco', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00624', 'Sucre', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00625', 'Utco', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00626', 'La Libertad De Pallan', 'pro00056', '1');
INSERT INTO `distrito` VALUES ('dis00627', 'San Pablo', 'pro00065', '1');
INSERT INTO `distrito` VALUES ('dis00628', 'San Bernardino', 'pro00065', '1');
INSERT INTO `distrito` VALUES ('dis00629', 'San Luis', 'pro00065', '1');
INSERT INTO `distrito` VALUES ('dis00630', 'Tumbaden', 'pro00065', '1');
INSERT INTO `distrito` VALUES ('dis00631', 'San Miguel', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00632', 'Bolivar', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00633', 'Calquis', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00634', 'Catilluc', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00635', 'El Prado', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00636', 'La Florida', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00637', 'Llapa', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00638', 'Nanchoc', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00639', 'Niepos', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00640', 'San Gregorio', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00641', 'San Silvestre De Cochan', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00642', 'Tongod', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00643', 'Union Agua Blanca', 'pro00064', '1');
INSERT INTO `distrito` VALUES ('dis00644', 'Contumaza', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00645', 'Chilete', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00646', 'Cupisnique', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00647', 'Guzmango', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00648', 'San Benito', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00649', 'Santa Cruz De Toled', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00650', 'Tantarica', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00651', 'Yonan', 'pro00058', '1');
INSERT INTO `distrito` VALUES ('dis00652', 'Cajamarca', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00653', 'Asuncion', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00654', 'Chetilla', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00655', 'Cospan', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00656', 'Encañada', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00657', 'Jesus', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00658', 'Llacanora', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00659', 'Los Baños Del Inca', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00660', 'Magdalena', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00661', 'Matara', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00662', 'Namora', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00663', 'San Juan', 'pro00054', '1');
INSERT INTO `distrito` VALUES ('dis00664', 'Cajabamba', 'pro00055', '1');
INSERT INTO `distrito` VALUES ('dis00665', 'Cachachi', 'pro00055', '1');
INSERT INTO `distrito` VALUES ('dis00666', 'Condebamba', 'pro00055', '1');
INSERT INTO `distrito` VALUES ('dis00667', 'Sitacocha', 'pro00055', '1');
INSERT INTO `distrito` VALUES ('dis00668', 'Pedro Galvez', 'pro00063', '1');
INSERT INTO `distrito` VALUES ('dis00669', 'Eduardo Villanueva', 'pro00063', '1');
INSERT INTO `distrito` VALUES ('dis00670', 'Gregorio Pita', 'pro00063', '1');
INSERT INTO `distrito` VALUES ('dis00671', 'Ichocan', 'pro00063', '1');
INSERT INTO `distrito` VALUES ('dis00672', 'Jose Manuel Quiroz', 'pro00063', '1');
INSERT INTO `distrito` VALUES ('dis00673', 'Jose Sabogal', 'pro00063', '1');
INSERT INTO `distrito` VALUES ('dis00674', 'Chancay', 'pro00063', '1');
INSERT INTO `distrito` VALUES ('dis00675', 'Cusco', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00676', 'Ccorca', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00677', 'Poroy', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00678', 'San Jeronimo', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00679', 'San Sebastian', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00680', 'Santiago', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00681', 'Saylla', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00682', 'Wanchaq', 'pro00068', '1');
INSERT INTO `distrito` VALUES ('dis00683', 'Acomayo', 'pro00069', '1');
INSERT INTO `distrito` VALUES ('dis00684', 'Acopia', 'pro00069', '1');
INSERT INTO `distrito` VALUES ('dis00685', 'Acos', 'pro00069', '1');
INSERT INTO `distrito` VALUES ('dis00686', 'Mosoc Llacta', 'pro00069', '1');
INSERT INTO `distrito` VALUES ('dis00687', 'Pomacanchi', 'pro00069', '1');
INSERT INTO `distrito` VALUES ('dis00688', 'Rondocan', 'pro00069', '1');
INSERT INTO `distrito` VALUES ('dis00689', 'Sangarara', 'pro00069', '1');
INSERT INTO `distrito` VALUES ('dis00690', 'Anta', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00691', 'Ancahuasi', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00692', 'Cachimayo', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00693', 'Chinchaypujio', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00694', 'Huarocondo', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00695', 'Limatambo', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00696', 'Mollepata', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00697', 'Pucyura', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00698', 'Zurite', 'pro00070', '1');
INSERT INTO `distrito` VALUES ('dis00699', 'Calca', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00700', 'Coya', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00701', 'Lamay', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00702', 'Lares', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00703', 'Pisac', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00704', 'San Salvador', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00705', 'Taray', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00706', 'Yanatile', 'pro00071', '1');
INSERT INTO `distrito` VALUES ('dis00707', 'Yanaoca', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00708', 'Checca', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00709', 'Kunturkanki', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00710', 'Langui', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00711', 'Layo', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00712', 'Pampamarca', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00713', 'Quehue', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00714', 'Tupac Amaru', 'pro00072', '1');
INSERT INTO `distrito` VALUES ('dis00715', 'Sicuani', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00716', 'Checacupe', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00717', 'Combapata', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00718', 'Marangani', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00719', 'Pitumarca', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00720', 'San Pablo', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00721', 'San Pedro', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00722', 'Tinta', 'pro00073', '1');
INSERT INTO `distrito` VALUES ('dis00723', 'Santo Tomas', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00724', 'Capacmarca', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00725', 'Chamaca', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00726', 'Colquemarca', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00727', 'Livitaca', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00728', 'Llusco', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00729', 'Quiñota', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00730', 'Velille', 'pro00074', '1');
INSERT INTO `distrito` VALUES ('dis00731', 'Espinar', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00732', 'Condoroma', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00733', 'Coporaque', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00734', 'Ocoruro', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00735', 'Pallpata', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00736', 'Pichigua', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00737', 'Suyckutambo', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00738', 'Alto Pichigua', 'pro00075', '1');
INSERT INTO `distrito` VALUES ('dis00739', 'Santa Ana', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00740', 'Echarate', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00741', 'Huayopata', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00742', 'Maranura', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00743', 'Ocobamba', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00744', 'Quellouno', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00745', 'Quimbiri', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00746', 'Santa Teresa', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00747', 'Vilcabamba', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00748', 'Pichari', 'pro00076', '1');
INSERT INTO `distrito` VALUES ('dis00749', 'Paruro', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00750', 'Accha', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00751', 'Ccapi', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00752', 'Colcha', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00753', 'Huanoquite', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00754', 'Omacha', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00755', 'Paccaritambo', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00756', 'Pillpinto', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00757', 'Yaurisque', 'pro00077', '1');
INSERT INTO `distrito` VALUES ('dis00758', 'Paucartambo', 'pro00078', '1');
INSERT INTO `distrito` VALUES ('dis00759', 'Caicay', 'pro00078', '1');
INSERT INTO `distrito` VALUES ('dis00760', 'Challabamba', 'pro00078', '1');
INSERT INTO `distrito` VALUES ('dis00761', 'Colquepata', 'pro00078', '1');
INSERT INTO `distrito` VALUES ('dis00762', 'Huancarani', 'pro00078', '1');
INSERT INTO `distrito` VALUES ('dis00763', 'Kosñipata', 'pro00078', '1');
INSERT INTO `distrito` VALUES ('dis00764', 'Urcos', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00765', 'Andahuaylillas', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00766', 'Camanti', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00767', 'Ccarhuayo', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00768', 'Ccatca', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00769', 'Cusipata', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00770', 'Huaro', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00771', 'Lucre', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00772', 'Marcapata', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00773', 'Ocongate', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00774', 'Oropesa', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00775', 'Quiquijana', 'pro00079', '1');
INSERT INTO `distrito` VALUES ('dis00776', 'Urubamba', 'pro00080', '1');
INSERT INTO `distrito` VALUES ('dis00777', 'Chinchero', 'pro00080', '1');
INSERT INTO `distrito` VALUES ('dis00778', 'Huayllabamba', 'pro00080', '1');
INSERT INTO `distrito` VALUES ('dis00779', 'Machupicchu', 'pro00080', '1');
INSERT INTO `distrito` VALUES ('dis00780', 'Maras', 'pro00080', '1');
INSERT INTO `distrito` VALUES ('dis00781', 'Ollantaytambo', 'pro00080', '1');
INSERT INTO `distrito` VALUES ('dis00782', 'Yucay', 'pro00080', '1');
INSERT INTO `distrito` VALUES ('dis00783', 'Huancavelica', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00784', 'Acobambilla', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00785', 'Acoria', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00786', 'Conayca', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00787', 'Cuenca', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00788', 'Huachocolpa', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00789', 'Huayllahuara', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00790', 'Izcuchaca', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00791', 'Laria', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00792', 'Manta', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00793', 'Mariscal Caceres', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00794', 'Moya', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00795', 'Nuevo Occoro', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00796', 'Palca', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00797', 'Pilchaca', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00798', 'Vilca', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00799', 'Yauli', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00800', 'Ascencion', 'pro00081', '1');
INSERT INTO `distrito` VALUES ('dis00801', 'Acobamba', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00802', 'Andabamba', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00803', 'Anta', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00804', 'Caja', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00805', 'Marcas', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00806', 'Paucara', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00807', 'Pomacocha', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00808', 'Rosario', 'pro00082', '1');
INSERT INTO `distrito` VALUES ('dis00809', 'Lircay', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00810', 'Anchonga', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00811', 'Callanmarca', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00812', 'Ccochaccasa', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00813', 'Chincho', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00814', 'Congalla', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00815', 'Huanca-huanca', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00816', 'Huayllay Grande', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00817', 'Julcamarca', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00818', 'San Antonio De Antaparco', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00819', 'Santo Tomas De Pata', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00820', 'Secclla', 'pro00083', '1');
INSERT INTO `distrito` VALUES ('dis00821', 'Castrovirreyna', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00822', 'Arma', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00823', 'Aurahua', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00824', 'Capillas', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00825', 'Chupamarca', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00826', 'Cocas', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00827', 'Huachos', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00828', 'Huamatambo', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00829', 'Mollepampa', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00830', 'San Juan', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00831', 'Santa Ana', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00832', 'Tantara', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00833', 'Ticrapo', 'pro00084', '1');
INSERT INTO `distrito` VALUES ('dis00834', 'Churcampa', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00835', 'Anco', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00836', 'Chinchihuasi', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00837', 'El Carmen', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00838', 'La Merced', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00839', 'Locroja', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00840', 'Pachamarca', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00841', 'Paucarbamba', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00842', 'San Miguel De Mayocc', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00843', 'San Pedro De Coris', 'pro00085', '1');
INSERT INTO `distrito` VALUES ('dis00844', 'Huaytara', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00845', 'Ayavi', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00846', 'Cordova', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00847', 'Huayacundo Arma', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00848', 'Laramarca', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00849', 'Ocoyo', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00850', 'Pilpichaca', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00851', 'Querco', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00852', 'Quito-arma', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00853', 'San Antonio De Cusicancha', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00854', 'San Francisco De Sangayaico', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00855', 'San Isidro', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00856', 'Santiago De Chocorvos', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00857', 'Santiago De Quirahuara', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00858', 'Santo Domingo De Capillas', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00859', 'Tambo', 'pro00086', '1');
INSERT INTO `distrito` VALUES ('dis00860', 'Pampas', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00861', 'Acostambo', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00862', 'Acraquia', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00863', 'Ahuaycha', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00864', 'Colcabamba', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00865', 'Daniel Hernandez', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00866', 'Huachocolpa', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00867', 'Huando', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00868', 'Huaribamba', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00869', 'Ñahuimpuquio', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00870', 'Pazos', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00871', 'Quishuar', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00872', 'Salcabamba', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00873', 'Salcahuasi', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00874', 'San Marcos De Rocchac', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00875', 'Surcubamba', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00876', 'Tintay Puncu', 'pro00087', '1');
INSERT INTO `distrito` VALUES ('dis00877', 'Huanuco', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00878', 'Amarilis', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00879', 'Chinchao', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00880', 'Churubamba', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00881', 'Margos', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00882', 'Quisqui', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00883', 'San Francisco De Cayran', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00884', 'San Pedro De Chaulan', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00885', 'Santa Maria Del Valle', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00886', 'Yarumayo', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00887', 'Pillco Marca', 'pro00088', '1');
INSERT INTO `distrito` VALUES ('dis00888', 'Ambo', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00889', 'Cayna', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00890', 'Colpas', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00891', 'Conchamarca', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00892', 'Huacar', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00893', 'San Francisco', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00894', 'San Rafael', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00895', 'Tomay Kichwa', 'pro00089', '1');
INSERT INTO `distrito` VALUES ('dis00896', 'La Union', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00897', 'Chuquis', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00898', 'Marias', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00899', 'Pachas', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00900', 'Quivilla', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00901', 'Ripan', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00902', 'Shunqui', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00903', 'Sillapata', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00904', 'Yanas', 'pro00090', '1');
INSERT INTO `distrito` VALUES ('dis00905', 'Huacaybamba', 'pro00091', '1');
INSERT INTO `distrito` VALUES ('dis00906', 'Canchabamba', 'pro00091', '1');
INSERT INTO `distrito` VALUES ('dis00907', 'Cochabamba', 'pro00091', '1');
INSERT INTO `distrito` VALUES ('dis00908', 'Pinra', 'pro00091', '1');
INSERT INTO `distrito` VALUES ('dis00909', 'Llata', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00910', 'Arancay', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00911', 'Chavin De Pariarca', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00912', 'Jacas Grande', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00913', 'Jircan', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00914', 'Miraflores', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00915', 'Monzon', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00916', 'Punchao', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00917', 'Puños', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00918', 'Singa', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00919', 'Tantamayo', 'pro00092', '1');
INSERT INTO `distrito` VALUES ('dis00920', 'Rupa-rupa', 'pro00093', '1');
INSERT INTO `distrito` VALUES ('dis00921', 'Daniel Alomia Robles', 'pro00093', '1');
INSERT INTO `distrito` VALUES ('dis00922', 'Hermilio Valdizan', 'pro00093', '1');
INSERT INTO `distrito` VALUES ('dis00923', 'Jose Crespo Y Castillo', 'pro00093', '1');
INSERT INTO `distrito` VALUES ('dis00924', 'Luyando', 'pro00093', '1');
INSERT INTO `distrito` VALUES ('dis00925', 'Mariano Damaso Beraun', 'pro00093', '1');
INSERT INTO `distrito` VALUES ('dis00926', 'Huacrachuco', 'pro00094', '1');
INSERT INTO `distrito` VALUES ('dis00927', 'Cholon', 'pro00094', '1');
INSERT INTO `distrito` VALUES ('dis00928', 'San Buenaventura', 'pro00094', '1');
INSERT INTO `distrito` VALUES ('dis00929', 'Panao', 'pro00095', '1');
INSERT INTO `distrito` VALUES ('dis00930', 'Chaglla', 'pro00095', '1');
INSERT INTO `distrito` VALUES ('dis00931', 'Molino', 'pro00095', '1');
INSERT INTO `distrito` VALUES ('dis00932', 'Umari', 'pro00095', '1');
INSERT INTO `distrito` VALUES ('dis00933', 'Puerto Inca', 'pro00096', '1');
INSERT INTO `distrito` VALUES ('dis00934', 'Codo Del Pozuzo', 'pro00096', '1');
INSERT INTO `distrito` VALUES ('dis00935', 'Honoria', 'pro00096', '1');
INSERT INTO `distrito` VALUES ('dis00936', 'Tournavista', 'pro00096', '1');
INSERT INTO `distrito` VALUES ('dis00937', 'Yuyapichis', 'pro00096', '1');
INSERT INTO `distrito` VALUES ('dis00938', 'Jesus', 'pro00097', '1');
INSERT INTO `distrito` VALUES ('dis00939', 'Baños', 'pro00097', '1');
INSERT INTO `distrito` VALUES ('dis00940', 'Jivia', 'pro00097', '1');
INSERT INTO `distrito` VALUES ('dis00941', 'Queropalca', 'pro00097', '1');
INSERT INTO `distrito` VALUES ('dis00942', 'Rondos', 'pro00097', '1');
INSERT INTO `distrito` VALUES ('dis00943', 'San Francisco De Asis', 'pro00097', '1');
INSERT INTO `distrito` VALUES ('dis00944', 'San Miguel De Cauri', 'pro00097', '1');
INSERT INTO `distrito` VALUES ('dis00945', 'Chavinillo', 'pro00098', '1');
INSERT INTO `distrito` VALUES ('dis00946', 'Cahuac', 'pro00098', '1');
INSERT INTO `distrito` VALUES ('dis00947', 'Chacabamba', 'pro00098', '1');
INSERT INTO `distrito` VALUES ('dis00948', 'Chupan', 'pro00098', '1');
INSERT INTO `distrito` VALUES ('dis00949', 'Jacas Chico', 'pro00098', '1');
INSERT INTO `distrito` VALUES ('dis00950', 'Obas', 'pro00098', '1');
INSERT INTO `distrito` VALUES ('dis00951', 'Pampamarca', 'pro00098', '1');
INSERT INTO `distrito` VALUES ('dis00952', 'Ica', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00953', 'La Tinguiña', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00954', 'Los Aquijes', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00955', 'Ocucaje', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00956', 'Pachacutec', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00957', 'Parcona', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00958', 'Pueblo Nuevo', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00959', 'Salas', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00960', 'San Jose De Los Molinos', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00961', 'San Juan Bautista', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00962', 'Santiago', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00963', 'Subtanjalla', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00964', 'Tate', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00965', 'Yauca Del Rosario', 'pro00099', '1');
INSERT INTO `distrito` VALUES ('dis00966', 'Chincha Alta', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00967', 'Alto Laran', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00968', 'Chavin', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00969', 'Chincha Baja', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00970', 'El Carmen', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00971', 'Grocio Prado', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00972', 'Pueblo Nuevo', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00973', 'San Juan De Yanac', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00974', 'San Pedro De Huacarpana', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00975', 'Sunampe', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00976', 'Tambo De Mora', 'pro00100', '1');
INSERT INTO `distrito` VALUES ('dis00977', 'Nazca', 'pro00101', '1');
INSERT INTO `distrito` VALUES ('dis00978', 'Changuillo', 'pro00101', '1');
INSERT INTO `distrito` VALUES ('dis00979', 'El Ingenio', 'pro00101', '1');
INSERT INTO `distrito` VALUES ('dis00980', 'Marcona', 'pro00101', '1');
INSERT INTO `distrito` VALUES ('dis00981', 'Vista Alegre', 'pro00101', '1');
INSERT INTO `distrito` VALUES ('dis00982', 'Palpa', 'pro00102', '1');
INSERT INTO `distrito` VALUES ('dis00983', 'Llipata', 'pro00102', '1');
INSERT INTO `distrito` VALUES ('dis00984', 'Rio Grande', 'pro00102', '1');
INSERT INTO `distrito` VALUES ('dis00985', 'Santa Cruz', 'pro00102', '1');
INSERT INTO `distrito` VALUES ('dis00986', 'Tibillo', 'pro00102', '1');
INSERT INTO `distrito` VALUES ('dis00987', 'Pisco', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00988', 'Huancano', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00989', 'Humay', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00990', 'Independencia', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00991', 'Paracas', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00992', 'San Andres', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00993', 'San Clemente', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00994', 'Tupac Amaru Inca', 'pro00103', '1');
INSERT INTO `distrito` VALUES ('dis00995', 'Huancayo', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis00996', 'Carhuacallanga', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis00997', 'Chacapampa', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis00998', 'Chicche', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis00999', 'Chilca', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01000', 'Chongos Alto', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01001', 'Chupuro', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01002', 'Colca', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01003', 'Cullhuas', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01004', 'El Tambo', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01005', 'Huacrapuquio', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01006', 'Hualhuas', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01007', 'Huancan', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01008', 'Huasicancha', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01009', 'Huayucachi', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01010', 'Ingenio', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01011', 'Pariahuanca', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01012', 'Pilcomayo', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01013', 'Pucara', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01014', 'Quichuay', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01015', 'Quilcas', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01016', 'San Agustin', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01017', 'San Jeronimo De Tunan', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01018', 'Saño', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01019', 'Santo Domingo De Acobamba', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01020', 'Sapallanga', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01021', 'Sicaya', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01022', 'Viques', 'pro00104', '1');
INSERT INTO `distrito` VALUES ('dis01023', 'Chanchamayo', 'pro00106', '1');
INSERT INTO `distrito` VALUES ('dis01024', 'Perene', 'pro00106', '1');
INSERT INTO `distrito` VALUES ('dis01025', 'Pichanaqui', 'pro00106', '1');
INSERT INTO `distrito` VALUES ('dis01026', 'San Luis De Shuaro', 'pro00106', '1');
INSERT INTO `distrito` VALUES ('dis01027', 'San Ramon', 'pro00106', '1');
INSERT INTO `distrito` VALUES ('dis01028', 'Vitoc', 'pro00106', '1');
INSERT INTO `distrito` VALUES ('dis01029', 'Concepcion', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01030', 'Aco', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01031', 'Andamarca', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01032', 'Chambara', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01033', 'Cochas', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01034', 'Comas', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01035', 'Heroinas Toledo', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01036', 'Manzanares', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01037', 'Mariscal Castilla', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01038', 'Matahuasi', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01039', 'Mito', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01040', 'Nueve De Julio', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01041', 'Orcotuna', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01042', 'San Jose De Quero', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01043', 'Santa Rosa De Ocopa', 'pro00105', '1');
INSERT INTO `distrito` VALUES ('dis01044', 'Junin', 'pro00108', '1');
INSERT INTO `distrito` VALUES ('dis01045', 'Carhuamayo', 'pro00108', '1');
INSERT INTO `distrito` VALUES ('dis01046', 'Ondores', 'pro00108', '1');
INSERT INTO `distrito` VALUES ('dis01047', 'Ulcumayo', 'pro00108', '1');
INSERT INTO `distrito` VALUES ('dis01048', 'Satipo', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01049', 'Coviriali', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01050', 'Llaylla', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01051', 'Mazamari', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01052', 'Pampa Hermosa', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01053', 'Pangoa', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01054', 'Rio Negro', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01055', 'Rio Tambo', 'pro00109', '1');
INSERT INTO `distrito` VALUES ('dis01056', 'Jauja', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01057', 'Acolla', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01058', 'Apata', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01059', 'Ataura', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01060', 'Canchayllo', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01061', 'Curicaca', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01062', 'El Mantaro', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01063', 'Huamali', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01064', 'Huaripampa', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01065', 'Huertas', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01066', 'Janjaillo', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01067', 'Julcan', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01068', 'Leonor Ordoñez', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01069', 'Llocllapampa', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01070', 'Marco', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01071', 'Masma', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01072', 'Masma Chicche', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01073', 'Molinos', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01074', 'Monobamba', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01075', 'Muqui', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01076', 'Muquiyauyo', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01077', 'Paca', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01078', 'Paccha', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01079', 'Pancan', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01080', 'Parco', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01081', 'Pomacancha', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01082', 'Ricran', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01083', 'San Lorenzo', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01084', 'San Pedro De Chunan', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01085', 'Sausa', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01086', 'Sincos', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01087', 'Tunan Marca', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01088', 'Yauli', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01089', 'Yauyos', 'pro00107', '1');
INSERT INTO `distrito` VALUES ('dis01090', 'Tarma', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01091', 'Acobamba', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01092', 'Huaricolca', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01093', 'Huasahuasi', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01094', 'La Union', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01095', 'Palca', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01096', 'Palcamayo', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01097', 'San Pedro De Cajas', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01098', 'Tapo', 'pro00110', '1');
INSERT INTO `distrito` VALUES ('dis01099', 'La Oroya', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01100', 'Chacapalpa', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01101', 'Huay-huay', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01102', 'Marcapomacocha', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01103', 'Morococha', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01104', 'Paccha', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01105', 'Santa Barbara De Carhuacayan', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01106', 'Santa Rosa De Sacco', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01107', 'Suitucancha', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01108', 'Yauli', 'pro00111', '1');
INSERT INTO `distrito` VALUES ('dis01109', 'Chupaca', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01110', 'Ahuac', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01111', 'Chongos Bajo', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01112', 'Huachac', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01113', 'Huamancaca Chico', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01114', 'San Juan De Yscos', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01115', 'San Juan De Jarpa', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01116', 'Tres De Diciembre', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01117', 'Yanacancha', 'pro00112', '1');
INSERT INTO `distrito` VALUES ('dis01118', 'Trujillo', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01119', 'El Porvenir', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01120', 'Florencia De Mora', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01121', 'Huanchaco', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01122', 'La Esperanza', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01123', 'Laredo', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01124', 'Moche', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01125', 'Poroto', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01126', 'Salaverry', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01127', 'Simbal', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01128', 'Victor Larco Herrera', 'pro00113', '1');
INSERT INTO `distrito` VALUES ('dis01129', 'Ascope', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01130', 'Chicama', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01131', 'Chocope', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01132', 'Magdalena De Cao', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01133', 'Paijan', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01134', 'Razuri', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01135', 'Santiago De Cao', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01136', 'Casa Grande', 'pro00114', '1');
INSERT INTO `distrito` VALUES ('dis01137', 'Bolivar', 'pro00115', '1');
INSERT INTO `distrito` VALUES ('dis01138', 'Bambamarca', 'pro00115', '1');
INSERT INTO `distrito` VALUES ('dis01139', 'Condormarca', 'pro00115', '1');
INSERT INTO `distrito` VALUES ('dis01140', 'Longotea', 'pro00115', '1');
INSERT INTO `distrito` VALUES ('dis01141', 'Uchumarca', 'pro00115', '1');
INSERT INTO `distrito` VALUES ('dis01142', 'Ucuncha', 'pro00115', '1');
INSERT INTO `distrito` VALUES ('dis01143', 'Chepen', 'pro00116', '1');
INSERT INTO `distrito` VALUES ('dis01144', 'Pacanga', 'pro00116', '1');
INSERT INTO `distrito` VALUES ('dis01145', 'Pueblo Nuevo', 'pro00116', '1');
INSERT INTO `distrito` VALUES ('dis01146', 'Julcan', 'pro00117', '1');
INSERT INTO `distrito` VALUES ('dis01147', 'Calamarca', 'pro00117', '1');
INSERT INTO `distrito` VALUES ('dis01148', 'Carabamba', 'pro00117', '1');
INSERT INTO `distrito` VALUES ('dis01149', 'Huaso', 'pro00117', '1');
INSERT INTO `distrito` VALUES ('dis01150', 'Otuzco', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01151', 'Agallpampa', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01152', 'Charat', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01153', 'Huaranchal', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01154', 'La Cuesta', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01155', 'Mache', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01156', 'Paranday', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01157', 'Salpo', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01158', 'Sinsicap', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01159', 'Usquil', 'pro00118', '1');
INSERT INTO `distrito` VALUES ('dis01160', 'Cascas', 'pro00123', '1');
INSERT INTO `distrito` VALUES ('dis01161', 'Lucma', 'pro00123', '1');
INSERT INTO `distrito` VALUES ('dis01162', 'Marmot', 'pro00123', '1');
INSERT INTO `distrito` VALUES ('dis01163', 'Sayapullo', 'pro00123', '1');
INSERT INTO `distrito` VALUES ('dis01164', 'Viru', 'pro00124', '1');
INSERT INTO `distrito` VALUES ('dis01165', 'Chao', 'pro00124', '1');
INSERT INTO `distrito` VALUES ('dis01166', 'Guadalupito', 'pro00124', '1');
INSERT INTO `distrito` VALUES ('dis01167', 'San Pedro De Lloc', 'pro00119', '1');
INSERT INTO `distrito` VALUES ('dis01168', 'Guadalupe', 'pro00119', '1');
INSERT INTO `distrito` VALUES ('dis01169', 'Jequetepeque', 'pro00119', '1');
INSERT INTO `distrito` VALUES ('dis01170', 'Pacasmayo', 'pro00119', '1');
INSERT INTO `distrito` VALUES ('dis01171', 'San Jose', 'pro00119', '1');
INSERT INTO `distrito` VALUES ('dis01172', 'Tayabamba', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01173', 'Buldibuyo', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01174', 'Chillia', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01175', 'Huancaspata', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01176', 'Huaylillas', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01177', 'Huayo', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01178', 'Ongon', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01179', 'Parcoy', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01180', 'Pataz', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01181', 'Pias', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01182', 'Santiago De Challas', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01183', 'Taurija', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01184', 'Urpay', 'pro00120', '1');
INSERT INTO `distrito` VALUES ('dis01185', 'Huamachuco', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01186', 'Chugay', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01187', 'Cochorco', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01188', 'Curgos', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01189', 'Marcabal', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01190', 'Sanagoran', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01191', 'Sarin', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01192', 'Sartimbamba', 'pro00121', '1');
INSERT INTO `distrito` VALUES ('dis01193', 'Santiago De Chuco', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01194', 'Angasmarca', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01195', 'Cachicadan', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01196', 'Mollebamba', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01197', 'Mollepata', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01198', 'Quiruvilca', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01199', 'Santa Cruz De Chuca', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01200', 'Sitabamba', 'pro00122', '1');
INSERT INTO `distrito` VALUES ('dis01201', 'Chiclayo', 'pro00125', '1');
INSERT INTO `distrito` VALUES ('dis01202', 'Chongoyape', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01203', 'Eten', 'pro00125', '1');
INSERT INTO `distrito` VALUES ('dis01204', 'Eten Puerto', 'pro00125', '1');
INSERT INTO `distrito` VALUES ('dis01205', 'Jose Leonardo Ortiz', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01206', 'La Victoria', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01207', 'Lagunas', 'pro00125', '1');
INSERT INTO `distrito` VALUES ('dis01208', 'Monsefu', 'pro00125', '1');
INSERT INTO `distrito` VALUES ('dis01209', 'Nueva Arica', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01210', 'Oyotun', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01211', 'Picsi', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01212', 'Pimentel', 'pro00125', '1');
INSERT INTO `distrito` VALUES ('dis01213', 'Reque', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01214', 'Santa Rosa', 'pro00125', '1');
INSERT INTO `distrito` VALUES ('dis01215', 'Saña', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01217', 'Cayalti', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01218', 'Patapo', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01219', 'Pomalca', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01220', 'Pucala', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01221', 'Tuman', 'pro00125', '0');
INSERT INTO `distrito` VALUES ('dis01222', 'Ferreñafe', 'pro00126', '1');
INSERT INTO `distrito` VALUES ('dis01223', 'Cañaris', 'pro00126', '1');
INSERT INTO `distrito` VALUES ('dis01224', 'Incahuasi', 'pro00126', '1');
INSERT INTO `distrito` VALUES ('dis01225', 'Manuel Atonio Mesones Muro', 'pro00126', '1');
INSERT INTO `distrito` VALUES ('dis01226', 'Pitipo', 'pro00126', '1');
INSERT INTO `distrito` VALUES ('dis01227', 'Pueblo Nuevo', 'pro00126', '0');
INSERT INTO `distrito` VALUES ('dis01228', 'Lambayeque', 'pro00127', '1');
INSERT INTO `distrito` VALUES ('dis01229', 'Chochope', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01230', 'Illimo', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01231', 'Jayanca', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01232', 'Mochumi', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01233', 'Morrope', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01234', 'Motupe', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01235', 'Olmos', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01236', 'Pacora', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01237', 'Salas', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01238', 'San Jose', 'pro00127', '1');
INSERT INTO `distrito` VALUES ('dis01239', 'Tucume', 'pro00127', '0');
INSERT INTO `distrito` VALUES ('dis01240', 'Lima', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01241', 'Ancon', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01242', 'Ate', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01243', 'Barranco', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01244', 'Breña', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01245', 'Carabayllo', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01246', 'Chaclacayo', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01247', 'Chorrillos', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01248', 'Cieneguilla', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01249', 'Comas', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01250', 'El Agustino', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01251', 'Independencia', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01252', 'Jesus Maria', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01253', 'La Molina', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01254', 'La Victoria', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01255', 'Lince', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01256', 'Los Olivos', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01257', 'Lurigancho', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01258', 'Lurin', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01259', 'Magdalena Del Mar', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01260', 'Magdalena Vieja', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01261', 'Miraflores', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01262', 'Pachacamac', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01263', 'Pucusana', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01264', 'Puente Piedra', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01265', 'Punta Hermosa', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01266', 'Punta Negra', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01267', 'Rimac', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01268', 'San Bartolo', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01269', 'San Borja', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01270', 'San Isidro', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01271', 'San Juan De Lurigancho', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01272', 'San Juan De Miraflores', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01273', 'San Luis', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01274', 'San Martin De Porres', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01275', 'San Miguel', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01276', 'Santa Anita', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01277', 'Santa Maria Del Mar', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01278', 'Santa Rosa', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01279', 'Santiago De Surco', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01280', 'Surquillo', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01281', 'Villa El Salvador', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01282', 'Villa Maria Del Triunfo', 'pro00128', '1');
INSERT INTO `distrito` VALUES ('dis01283', 'Barranca', 'pro00129', '1');
INSERT INTO `distrito` VALUES ('dis01284', 'Paramonga', 'pro00129', '1');
INSERT INTO `distrito` VALUES ('dis01285', 'Pativilca', 'pro00129', '1');
INSERT INTO `distrito` VALUES ('dis01286', 'Supe', 'pro00129', '1');
INSERT INTO `distrito` VALUES ('dis01287', 'Supe Puerto', 'pro00129', '1');
INSERT INTO `distrito` VALUES ('dis01288', 'Cajatambo', 'pro00130', '1');
INSERT INTO `distrito` VALUES ('dis01289', 'Copa', 'pro00130', '1');
INSERT INTO `distrito` VALUES ('dis01290', 'Gorgor', 'pro00130', '1');
INSERT INTO `distrito` VALUES ('dis01291', 'Huancapon', 'pro00130', '1');
INSERT INTO `distrito` VALUES ('dis01292', 'Manas', 'pro00130', '1');
INSERT INTO `distrito` VALUES ('dis01293', 'San Vicente De Cañete', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01294', 'Asia', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01295', 'Calango', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01296', 'Cerro Azul', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01297', 'Chilca', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01298', 'Coayllo', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01299', 'Imperial', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01300', 'Lunahuana', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01301', 'Mala', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01302', 'Nuevo Imperial', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01303', 'Pacaran', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01304', 'Quilmana', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01305', 'San Antonio', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01306', 'San Luis', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01307', 'Santa Cruz De Flores', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01308', 'Zuñiga', 'pro00132', '1');
INSERT INTO `distrito` VALUES ('dis01309', 'Canta', 'pro00131', '1');
INSERT INTO `distrito` VALUES ('dis01310', 'Arahuay', 'pro00131', '1');
INSERT INTO `distrito` VALUES ('dis01311', 'Huamantanga', 'pro00131', '1');
INSERT INTO `distrito` VALUES ('dis01312', 'Huaros', 'pro00131', '1');
INSERT INTO `distrito` VALUES ('dis01313', 'Lachaqui', 'pro00131', '1');
INSERT INTO `distrito` VALUES ('dis01314', 'San Buenaventura', 'pro00131', '1');
INSERT INTO `distrito` VALUES ('dis01315', 'Santa Rosa De Quives', 'pro00131', '1');
INSERT INTO `distrito` VALUES ('dis01316', 'Huaral', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01317', 'Atavillos Alto', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01318', 'Atavillos Bajo', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01319', 'Aucallama', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01320', 'Chancay', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01321', 'Ihuari', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01322', 'Lampian', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01323', 'Pacaraos', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01324', 'San Miguel De Acos', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01325', 'Santa Cruz De Andamarca', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01326', 'Sumbilca', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01327', 'Veintisiete De Noviembre', 'pro00133', '1');
INSERT INTO `distrito` VALUES ('dis01328', 'Matucana', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01329', 'Antioquia', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01330', 'Callahuanca', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01331', 'Carampoma', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01332', 'Chicla', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01333', 'Cuenca', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01334', 'Huachupampa', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01335', 'Huanza', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01336', 'Huarochiri', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01337', 'Lahuaytambo', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01338', 'Langa', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01339', 'Laraos', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01340', 'Mariatana', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01341', 'Ricardo Palma', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01342', 'San Andres De Tupicocha', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01343', 'San Antonio', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01344', 'San Bartolome', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01345', 'San Damian', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01346', 'San Juan De Iris', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01347', 'San Juan De Tantaranche', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01348', 'San Lorenzo De Quinti', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01349', 'San Mateo', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01350', 'San Mateo De Otao', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01351', 'San Pedro De Casta', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01352', 'San Pedro De Huancayre', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01353', 'Sangallaya', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01354', 'Santa Cruz De Cocachacra', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01355', 'Santa Eulalia', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01356', 'Santiago De Anchucaya', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01357', 'Santiago De Tuna', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01358', 'Santo Domingo De Los Olleros', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01359', 'Surco', 'pro00134', '1');
INSERT INTO `distrito` VALUES ('dis01360', 'Huacho', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01361', 'Ambar', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01362', 'Caleta De Carquin', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01363', 'Checras', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01364', 'Hualmay', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01365', 'Huaura', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01366', 'Leoncio Prado', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01367', 'Paccho', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01368', 'Santa Leonor', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01369', 'Santa Maria', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01370', 'Sayan', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01371', 'Vegueta', 'pro00135', '1');
INSERT INTO `distrito` VALUES ('dis01372', 'Oyon', 'pro00136', '1');
INSERT INTO `distrito` VALUES ('dis01373', 'Andajes', 'pro00136', '1');
INSERT INTO `distrito` VALUES ('dis01374', 'Caujul', 'pro00136', '1');
INSERT INTO `distrito` VALUES ('dis01375', 'Cochamarca', 'pro00136', '1');
INSERT INTO `distrito` VALUES ('dis01376', 'Navan', 'pro00136', '1');
INSERT INTO `distrito` VALUES ('dis01377', 'Pachangara', 'pro00136', '1');
INSERT INTO `distrito` VALUES ('dis01378', 'Yauyos', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01379', 'Alis', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01380', 'Ayauca', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01381', 'Ayaviri', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01382', 'Azangaro', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01383', 'Cacra', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01384', 'Carania', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01385', 'Catahuasi', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01386', 'Chocos', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01387', 'Cochas', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01388', 'Colonia', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01389', 'Hongos', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01390', 'Huampara', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01391', 'Huancaya', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01392', 'Huangascar', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01393', 'Huantan', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01394', 'Huañec', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01395', 'Laraos', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01396', 'Lincha', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01397', 'Madean', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01398', 'Miraflores', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01399', 'Omas', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01400', 'Putinza', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01401', 'Quinches', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01402', 'Quinocay', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01403', 'San Joaquin', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01404', 'San Pedro De Pilas', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01405', 'Tanta', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01406', 'Tauripampa', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01407', 'Tomas', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01408', 'Tupe', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01409', 'Viñac', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01410', 'Vitis', 'pro00137', '1');
INSERT INTO `distrito` VALUES ('dis01411', 'Callao', 'pro00067', '1');
INSERT INTO `distrito` VALUES ('dis01412', 'Bellavista', 'pro00067', '1');
INSERT INTO `distrito` VALUES ('dis01413', 'Carmen De La Legua Reynoso', 'pro00067', '1');
INSERT INTO `distrito` VALUES ('dis01414', 'La Perla', 'pro00067', '1');
INSERT INTO `distrito` VALUES ('dis01415', 'La Punta', 'pro00067', '1');
INSERT INTO `distrito` VALUES ('dis01416', 'Ventanilla', 'pro00067', '1');
INSERT INTO `distrito` VALUES ('dis01417', 'Iquitos', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01418', 'Alto Nanay', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01419', 'Fernando Lores', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01420', 'Indiana', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01421', 'Las Amazonas', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01422', 'Mazan', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01423', 'Napo', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01424', 'Punchana', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01425', 'Putumayo', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01426', 'Torres Causana', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01427', 'Belen', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01428', 'San Juan Bautista', 'pro00138', '1');
INSERT INTO `distrito` VALUES ('dis01429', 'Yurimaguas', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01430', 'Balsapuerto', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01431', 'Barranca', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01432', 'Cahuapanas', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01433', 'Jeberos', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01434', 'Lagunas', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01435', 'Manseriche', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01436', 'Morona', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01437', 'Pastaza', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01438', 'Santa Cruz', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01439', 'Teniente Cesar Lopez Rojas', 'pro00139', '1');
INSERT INTO `distrito` VALUES ('dis01440', 'Nauta', 'pro00140', '1');
INSERT INTO `distrito` VALUES ('dis01441', 'Parinari', 'pro00140', '1');
INSERT INTO `distrito` VALUES ('dis01442', 'Tigre', 'pro00140', '1');
INSERT INTO `distrito` VALUES ('dis01443', 'Trompeteros', 'pro00140', '1');
INSERT INTO `distrito` VALUES ('dis01444', 'Urarinas', 'pro00140', '1');
INSERT INTO `distrito` VALUES ('dis01445', 'Ramon Castilla', 'pro00141', '1');
INSERT INTO `distrito` VALUES ('dis01446', 'Pebas', 'pro00141', '1');
INSERT INTO `distrito` VALUES ('dis01447', 'Yavari', 'pro00141', '1');
INSERT INTO `distrito` VALUES ('dis01448', 'San Pablo', 'pro00141', '1');
INSERT INTO `distrito` VALUES ('dis01449', 'Requena', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01450', 'Alto Tapiche', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01451', 'Capelo', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01452', 'Emilio San Martin', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01453', 'Maquia', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01454', 'Puinahua', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01455', 'Saquena', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01456', 'Soplin', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01457', 'Tapiche', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01458', 'Yaquerana', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01459', 'Jenaro Herrera', 'pro00142', '1');
INSERT INTO `distrito` VALUES ('dis01460', 'Contamana', 'pro00143', '1');
INSERT INTO `distrito` VALUES ('dis01461', 'Inahuaya', 'pro00143', '1');
INSERT INTO `distrito` VALUES ('dis01462', 'Padre Marquez', 'pro00143', '1');
INSERT INTO `distrito` VALUES ('dis01463', 'Pampa Hermosa', 'pro00143', '1');
INSERT INTO `distrito` VALUES ('dis01464', 'Sarayacu', 'pro00143', '1');
INSERT INTO `distrito` VALUES ('dis01465', 'Vargas Guerra', 'pro00143', '1');
INSERT INTO `distrito` VALUES ('dis01466', 'Tambopata', 'pro00145', '1');
INSERT INTO `distrito` VALUES ('dis01467', 'Inambari', 'pro00145', '1');
INSERT INTO `distrito` VALUES ('dis01468', 'Las Piedras', 'pro00145', '1');
INSERT INTO `distrito` VALUES ('dis01469', 'Laberinto', 'pro00145', '1');
INSERT INTO `distrito` VALUES ('dis01470', 'Fitzcarrald', 'pro00146', '1');
INSERT INTO `distrito` VALUES ('dis01471', 'Manu', 'pro00146', '1');
INSERT INTO `distrito` VALUES ('dis01472', 'Madre De Dios', 'pro00146', '1');
INSERT INTO `distrito` VALUES ('dis01473', 'Heupetuhe', 'pro00146', '1');
INSERT INTO `distrito` VALUES ('dis01474', 'Iñapari', 'pro00147', '1');
INSERT INTO `distrito` VALUES ('dis01475', 'Iberia', 'pro00147', '1');
INSERT INTO `distrito` VALUES ('dis01476', 'Tahuamanu', 'pro00147', '1');
INSERT INTO `distrito` VALUES ('dis01477', 'Moquegua', 'pro00148', '1');
INSERT INTO `distrito` VALUES ('dis01478', 'Carumas', 'pro00148', '1');
INSERT INTO `distrito` VALUES ('dis01479', 'Cuchumbaya', 'pro00148', '1');
INSERT INTO `distrito` VALUES ('dis01480', 'Samegua', 'pro00148', '1');
INSERT INTO `distrito` VALUES ('dis01481', 'San Cristobal', 'pro00148', '1');
INSERT INTO `distrito` VALUES ('dis01482', 'Torata', 'pro00148', '1');
INSERT INTO `distrito` VALUES ('dis01483', 'Omate', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01484', 'Chojata', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01485', 'Coalaque', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01486', 'Ichuña', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01487', 'La Capilla', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01488', 'Lloque', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01489', 'Matalaque', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01490', 'Puquina', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01491', 'Quinistaquillas', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01492', 'Ubinas', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01493', 'Yunga', 'pro00149', '1');
INSERT INTO `distrito` VALUES ('dis01494', 'Ilo', 'pro00150', '1');
INSERT INTO `distrito` VALUES ('dis01495', 'El Algarrobal', 'pro00150', '1');
INSERT INTO `distrito` VALUES ('dis01496', 'Pacocha', 'pro00150', '1');
INSERT INTO `distrito` VALUES ('dis01497', 'Chaupimarca', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01498', 'Huachon', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01499', 'Huariaca', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01500', 'Huayllay', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01501', 'Ninacaca', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01502', 'Pallanchacra', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01503', 'Paucartambo', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01504', 'San Fco.de Asis De Yarusyacan', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01505', 'Simon Bolivar', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01506', 'Ticlacayan', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01507', 'Tinyahuarco', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01508', 'Vicco', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01509', 'Yanacancha', 'pro00151', '1');
INSERT INTO `distrito` VALUES ('dis01510', 'Yanahuanca', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01511', 'Chacayan', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01512', 'Goyllarisquizga', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01513', 'Paucar', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01514', 'San Pedro De Pillao', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01515', 'Santa Ana De Tusi', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01516', 'Tapuc', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01517', 'Vilcabamba', 'pro00152', '1');
INSERT INTO `distrito` VALUES ('dis01518', 'Oxapampa', 'pro00153', '1');
INSERT INTO `distrito` VALUES ('dis01519', 'Chontabamba', 'pro00153', '1');
INSERT INTO `distrito` VALUES ('dis01520', 'Huancabamba', 'pro00153', '1');
INSERT INTO `distrito` VALUES ('dis01521', 'Palcazu', 'pro00153', '1');
INSERT INTO `distrito` VALUES ('dis01522', 'Pozuzo', 'pro00153', '1');
INSERT INTO `distrito` VALUES ('dis01523', 'Puerto Bermudez', 'pro00153', '1');
INSERT INTO `distrito` VALUES ('dis01524', 'Villa Rica', 'pro00153', '1');
INSERT INTO `distrito` VALUES ('dis01525', 'Piura', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01526', 'Castilla', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01527', 'Catacaos', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01528', 'Cura Mori', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01529', 'El Tallan', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01530', 'La Arena', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01531', 'La Union', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01532', 'Las Lomas', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01533', 'Tambo Grande', 'pro00154', '1');
INSERT INTO `distrito` VALUES ('dis01534', 'Ayabaca', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01535', 'Frias', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01536', 'Jilili', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01537', 'Lagunas', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01538', 'Montero', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01539', 'Pacaipampa', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01540', 'Paimas', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01541', 'Sapillica', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01542', 'Sicchez', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01543', 'Suyo', 'pro00155', '1');
INSERT INTO `distrito` VALUES ('dis01544', 'Huancabamba', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01545', 'Canchaque', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01546', 'El Carmen De La Frontera', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01547', 'Huarmaca', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01548', 'Lalaquiz', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01549', 'San Miguel De El Faique', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01550', 'Sondor', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01551', 'Sondorillo', 'pro00156', '1');
INSERT INTO `distrito` VALUES ('dis01552', 'Paita', 'pro00158', '1');
INSERT INTO `distrito` VALUES ('dis01553', 'Amotape', 'pro00158', '1');
INSERT INTO `distrito` VALUES ('dis01554', 'Arenal', 'pro00158', '1');
INSERT INTO `distrito` VALUES ('dis01555', 'Colan', 'pro00158', '1');
INSERT INTO `distrito` VALUES ('dis01556', 'La Huaca', 'pro00158', '1');
INSERT INTO `distrito` VALUES ('dis01557', 'Tamarindo', 'pro00158', '1');
INSERT INTO `distrito` VALUES ('dis01558', 'Vichayal', 'pro00158', '1');
INSERT INTO `distrito` VALUES ('dis01559', 'Chulucanas', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01560', 'Buenos Aires', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01561', 'Chalaco', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01562', 'La Matanza', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01563', 'Morropon', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01564', 'Salitral', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01565', 'San Juan De Bigote', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01566', 'Santa Catalina De Mossa', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01567', 'Santo Domingo', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01568', 'Yamango', 'pro00157', '1');
INSERT INTO `distrito` VALUES ('dis01569', 'Sechura', 'pro00161', '1');
INSERT INTO `distrito` VALUES ('dis01570', 'Bellavista La Union', 'pro00161', '1');
INSERT INTO `distrito` VALUES ('dis01571', 'Bernal', 'pro00161', '1');
INSERT INTO `distrito` VALUES ('dis01572', 'Cristo Nos Valga', 'pro00161', '1');
INSERT INTO `distrito` VALUES ('dis01573', 'Rinconada Llicuar', 'pro00161', '1');
INSERT INTO `distrito` VALUES ('dis01574', 'Vice', 'pro00161', '1');
INSERT INTO `distrito` VALUES ('dis01575', 'Sullana', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01576', 'Bellavista', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01577', 'Ignacio Escudero', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01578', 'Lancones', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01579', 'Marcavelica', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01580', 'Miguel Checa', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01581', 'Querecotillo', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01582', 'Salitral', 'pro00159', '1');
INSERT INTO `distrito` VALUES ('dis01583', 'Pariñas', 'pro00160', '1');
INSERT INTO `distrito` VALUES ('dis01584', 'El Alto', 'pro00160', '1');
INSERT INTO `distrito` VALUES ('dis01585', 'La Brea', 'pro00160', '1');
INSERT INTO `distrito` VALUES ('dis01586', 'Lobitos', 'pro00160', '1');
INSERT INTO `distrito` VALUES ('dis01587', 'Los Organos', 'pro00160', '1');
INSERT INTO `distrito` VALUES ('dis01588', 'Mancora', 'pro00160', '1');
INSERT INTO `distrito` VALUES ('dis01589', 'Puno', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01590', 'Acora', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01591', 'Amantani', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01592', 'Atuncolla', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01593', 'Capachica', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01594', 'Chucuito', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01595', 'Coata', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01596', 'Huata', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01597', 'Mañazo', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01598', 'Paucarcolla', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01599', 'Pichacani', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01600', 'Plateria', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01601', 'San Antonio', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01602', 'Tiquillaca', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01603', 'Vilque', 'pro00162', '1');
INSERT INTO `distrito` VALUES ('dis01604', 'Azangaro', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01605', 'Achaya', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01606', 'Arapa', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01607', 'Asillo', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01608', 'Caminaca', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01609', 'Chupa', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01610', 'Jose Domingo Choquehuanca', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01611', 'Muñani', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01612', 'Potoni', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01613', 'Saman', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01614', 'San Anton', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01615', 'San Jose', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01616', 'San Juan De Salinas', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01617', 'Santiago De Pupuja', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01618', 'Tirapata', 'pro00163', '1');
INSERT INTO `distrito` VALUES ('dis01619', 'Macusani', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01620', 'Ajoyani', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01621', 'Ayapata', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01622', 'Coasa', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01623', 'Corani', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01624', 'Crucero', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01625', 'Ituata', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01626', 'Ollachea', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01627', 'San Gaban', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01628', 'Usicayos', 'pro00164', '1');
INSERT INTO `distrito` VALUES ('dis01629', 'Juli', 'pro00165', '1');
INSERT INTO `distrito` VALUES ('dis01630', 'Desaguadero', 'pro00165', '1');
INSERT INTO `distrito` VALUES ('dis01631', 'Huacullani', 'pro00165', '1');
INSERT INTO `distrito` VALUES ('dis01632', 'Kelluyo', 'pro00165', '1');
INSERT INTO `distrito` VALUES ('dis01633', 'Pisacoma', 'pro00165', '1');
INSERT INTO `distrito` VALUES ('dis01634', 'Pomata', 'pro00165', '1');
INSERT INTO `distrito` VALUES ('dis01635', 'Zepita', 'pro00165', '1');
INSERT INTO `distrito` VALUES ('dis01636', 'Ilave', 'pro00166', '1');
INSERT INTO `distrito` VALUES ('dis01637', 'Capazo', 'pro00166', '1');
INSERT INTO `distrito` VALUES ('dis01638', 'Pilcuyo', 'pro00166', '1');
INSERT INTO `distrito` VALUES ('dis01639', 'Santa Rosa', 'pro00166', '1');
INSERT INTO `distrito` VALUES ('dis01640', 'Conduriri', 'pro00166', '1');
INSERT INTO `distrito` VALUES ('dis01641', 'Huancane', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01642', 'Cojata', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01643', 'Huatasani', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01644', 'Inchupalla', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01645', 'Pusi', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01646', 'Rosaspata', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01647', 'Taraco', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01648', 'Vilque Chico', 'pro00167', '1');
INSERT INTO `distrito` VALUES ('dis01649', 'Lampa', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01650', 'Cabanilla', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01651', 'Calapuja', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01652', 'Nicasio', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01653', 'Ocuviri', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01654', 'Palca', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01655', 'Paratia', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01656', 'Pucara', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01657', 'Santa Lucia', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01658', 'Vilavila', 'pro00168', '1');
INSERT INTO `distrito` VALUES ('dis01659', 'Ayaviri', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01660', 'Antauta', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01661', 'Cupi', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01662', 'Llalli', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01663', 'Macari', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01664', 'Nuñoa', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01665', 'Orurillo', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01666', 'Santa Rosa', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01667', 'Umachiri', 'pro00169', '1');
INSERT INTO `distrito` VALUES ('dis01668', 'Moho', 'pro00170', '1');
INSERT INTO `distrito` VALUES ('dis01669', 'Conima', 'pro00170', '1');
INSERT INTO `distrito` VALUES ('dis01670', 'Huayrapata', 'pro00170', '1');
INSERT INTO `distrito` VALUES ('dis01671', 'Tilali', 'pro00170', '1');
INSERT INTO `distrito` VALUES ('dis01672', 'Putina', 'pro00171', '1');
INSERT INTO `distrito` VALUES ('dis01673', 'Ananea', 'pro00171', '1');
INSERT INTO `distrito` VALUES ('dis01674', 'Pedro Vilca Apaza', 'pro00171', '1');
INSERT INTO `distrito` VALUES ('dis01675', 'Quilcapuncu', 'pro00171', '1');
INSERT INTO `distrito` VALUES ('dis01676', 'Sina', 'pro00171', '1');
INSERT INTO `distrito` VALUES ('dis01677', 'Juliaca', 'pro00172', '1');
INSERT INTO `distrito` VALUES ('dis01678', 'Cabana', 'pro00172', '1');
INSERT INTO `distrito` VALUES ('dis01679', 'Cabanillas', 'pro00172', '1');
INSERT INTO `distrito` VALUES ('dis01680', 'Caracoto', 'pro00172', '1');
INSERT INTO `distrito` VALUES ('dis01681', 'Sandia', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01682', 'Cuyocuyo', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01683', 'Limbani', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01684', 'Patambuco', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01685', 'Phara', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01686', 'Quiaca', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01687', 'San Juan Del Oro', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01688', 'Yanahuaya', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01689', 'Alto Inambari', 'pro00173', '1');
INSERT INTO `distrito` VALUES ('dis01690', 'Yunguyo', 'pro00174', '1');
INSERT INTO `distrito` VALUES ('dis01691', 'Anapia', 'pro00174', '1');
INSERT INTO `distrito` VALUES ('dis01692', 'Copani', 'pro00174', '1');
INSERT INTO `distrito` VALUES ('dis01693', 'Cuturapi', 'pro00174', '1');
INSERT INTO `distrito` VALUES ('dis01694', 'Ollaraya', 'pro00174', '1');
INSERT INTO `distrito` VALUES ('dis01695', 'Tinicachi', 'pro00174', '1');
INSERT INTO `distrito` VALUES ('dis01696', 'Unicachi', 'pro00174', '1');
INSERT INTO `distrito` VALUES ('dis01697', 'Bellavista', 'pro00176', '1');
INSERT INTO `distrito` VALUES ('dis01698', 'Alto Biavo', 'pro00176', '1');
INSERT INTO `distrito` VALUES ('dis01699', 'Bajo Biavo', 'pro00176', '1');
INSERT INTO `distrito` VALUES ('dis01700', 'Huallaga', 'pro00176', '1');
INSERT INTO `distrito` VALUES ('dis01701', 'San Pablo', 'pro00176', '1');
INSERT INTO `distrito` VALUES ('dis01702', 'San Rafael', 'pro00176', '1');
INSERT INTO `distrito` VALUES ('dis01703', 'Saposoa', 'pro00178', '1');
INSERT INTO `distrito` VALUES ('dis01704', 'Alto Saposoa', 'pro00178', '1');
INSERT INTO `distrito` VALUES ('dis01705', 'El Eslabon', 'pro00178', '1');
INSERT INTO `distrito` VALUES ('dis01706', 'Piscoyacu', 'pro00178', '1');
INSERT INTO `distrito` VALUES ('dis01707', 'Sacanche', 'pro00178', '1');
INSERT INTO `distrito` VALUES ('dis01708', 'Tingo De Sapoa', 'pro00178', '1');
INSERT INTO `distrito` VALUES ('dis01709', 'Lamas', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01710', 'Alonso De Alvara', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01711', 'Barranquita', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01712', 'Caynarachi', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01713', 'Cuñumbuqui', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01714', 'Pinto Recodo', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01715', 'Rumisapa', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01716', 'San Roque De Cumbaza', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01717', 'Shanao', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01718', 'Tabalosos', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01719', 'Zapatero', 'pro00179', '1');
INSERT INTO `distrito` VALUES ('dis01720', 'Juanjui', 'pro00180', '1');
INSERT INTO `distrito` VALUES ('dis01721', 'Campanilla', 'pro00180', '1');
INSERT INTO `distrito` VALUES ('dis01722', 'Huicungo', 'pro00180', '1');
INSERT INTO `distrito` VALUES ('dis01723', 'Pachiza', 'pro00180', '1');
INSERT INTO `distrito` VALUES ('dis01724', 'Pajarillo', 'pro00180', '1');
INSERT INTO `distrito` VALUES ('dis01725', 'Moyobamba', 'pro00175', '1');
INSERT INTO `distrito` VALUES ('dis01726', 'Calzadda', 'pro00175', '1');
INSERT INTO `distrito` VALUES ('dis01727', 'Habana', 'pro00175', '1');
INSERT INTO `distrito` VALUES ('dis01728', 'Jepelacio', 'pro00175', '1');
INSERT INTO `distrito` VALUES ('dis01729', 'Soritor', 'pro00175', '1');
INSERT INTO `distrito` VALUES ('dis01730', 'Yantalo', 'pro00175', '1');
INSERT INTO `distrito` VALUES ('dis01731', 'Picota', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01732', 'Buenos Aires', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01733', 'Caspisapa', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01734', 'Pilluana', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01735', 'Pucacaca', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01736', 'San Cristobal', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01737', 'San Hilarion', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01738', 'Shamboyacu', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01739', 'Tingo De Ponasa', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01740', 'Tres Unidos', 'pro00181', '1');
INSERT INTO `distrito` VALUES ('dis01741', 'Rioja', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01742', 'Awajun', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01743', 'Elias Soplin Vargas', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01744', 'Nueva Cajamarca', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01745', 'Pardo Miguel', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01746', 'Posic', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01747', 'San Fernando', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01748', 'Yorongos', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01749', 'Yuracyacu', 'pro00182', '1');
INSERT INTO `distrito` VALUES ('dis01750', 'Tarapoto', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01751', 'Alberto Leveau', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01752', 'Cacatachi', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01753', 'Chazuta', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01754', 'Chipurana', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01755', 'El Porvenir', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01756', 'Humbayoc', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01757', 'Juan Guerra', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01758', 'La Banda De Shilcayo', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01759', 'Morales', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01760', 'Papaplaya', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01761', 'San Antonio', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01762', 'Sauce', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01763', 'Shapaja', 'pro00183', '1');
INSERT INTO `distrito` VALUES ('dis01764', 'Tocache', 'pro00184', '1');
INSERT INTO `distrito` VALUES ('dis01765', 'Nuevo Progreso', 'pro00184', '1');
INSERT INTO `distrito` VALUES ('dis01766', 'Polvora', 'pro00184', '1');
INSERT INTO `distrito` VALUES ('dis01767', 'Shunte', 'pro00184', '1');
INSERT INTO `distrito` VALUES ('dis01768', 'Uchiza', 'pro00184', '1');
INSERT INTO `distrito` VALUES ('dis01769', 'San Jose De Sisa', 'pro00177', '1');
INSERT INTO `distrito` VALUES ('dis01770', 'Agua Blanca', 'pro00177', '1');
INSERT INTO `distrito` VALUES ('dis01771', 'San Martin', 'pro00177', '1');
INSERT INTO `distrito` VALUES ('dis01772', 'Santa Rosa', 'pro00177', '1');
INSERT INTO `distrito` VALUES ('dis01773', 'Shatoja', 'pro00177', '1');
INSERT INTO `distrito` VALUES ('dis01774', 'Tacna', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01775', 'Alto De La Alianza', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01776', 'Calana', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01777', 'Inclan', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01778', 'Pachia', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01779', 'Palca', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01780', 'Pocollay', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01781', 'Sama', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01782', 'Ciudad Nueva', 'pro00185', '1');
INSERT INTO `distrito` VALUES ('dis01783', 'Candarave', 'pro00186', '1');
INSERT INTO `distrito` VALUES ('dis01784', 'Cairani', 'pro00186', '1');
INSERT INTO `distrito` VALUES ('dis01785', 'Camilaca', 'pro00186', '1');
INSERT INTO `distrito` VALUES ('dis01786', 'Curibaya', 'pro00186', '1');
INSERT INTO `distrito` VALUES ('dis01787', 'Huanuara', 'pro00186', '1');
INSERT INTO `distrito` VALUES ('dis01788', 'Quilahuani', 'pro00186', '1');
INSERT INTO `distrito` VALUES ('dis01789', 'Locumba', 'pro00187', '1');
INSERT INTO `distrito` VALUES ('dis01790', 'Ilabaya', 'pro00187', '1');
INSERT INTO `distrito` VALUES ('dis01791', 'Ite', 'pro00187', '1');
INSERT INTO `distrito` VALUES ('dis01792', 'Tarata', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01793', 'Chucatamani', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01794', 'Estique', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01795', 'Estique-pampa', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01796', 'Sitajara', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01797', 'Susapaya', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01798', 'Tarucachi', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01799', 'Ticaco', 'pro00188', '1');
INSERT INTO `distrito` VALUES ('dis01800', 'Zarumilla', 'pro00191', '1');
INSERT INTO `distrito` VALUES ('dis01801', 'Aguas Verdes', 'pro00191', '1');
INSERT INTO `distrito` VALUES ('dis01802', 'Matapalo', 'pro00191', '1');
INSERT INTO `distrito` VALUES ('dis01803', 'Papayal', 'pro00191', '1');
INSERT INTO `distrito` VALUES ('dis01804', 'Tumbes', 'pro00189', '1');
INSERT INTO `distrito` VALUES ('dis01805', 'Corrales', 'pro00189', '1');
INSERT INTO `distrito` VALUES ('dis01806', 'La Cruz', 'pro00189', '1');
INSERT INTO `distrito` VALUES ('dis01807', 'Pampas De Hospital', 'pro00189', '1');
INSERT INTO `distrito` VALUES ('dis01808', 'San Jacinto', 'pro00189', '1');
INSERT INTO `distrito` VALUES ('dis01809', 'San Juan De La Virgen', 'pro00189', '1');
INSERT INTO `distrito` VALUES ('dis01810', 'Zorritos', 'pro00190', '1');
INSERT INTO `distrito` VALUES ('dis01811', 'Casitas', 'pro00190', '1');
INSERT INTO `distrito` VALUES ('dis01812', 'Callaria', 'pro00192', '1');
INSERT INTO `distrito` VALUES ('dis01813', 'Campoverde', 'pro00192', '1');
INSERT INTO `distrito` VALUES ('dis01814', 'Iparia', 'pro00192', '1');
INSERT INTO `distrito` VALUES ('dis01815', 'Masisea', 'pro00192', '1');
INSERT INTO `distrito` VALUES ('dis01816', 'Yarinacocha', 'pro00192', '1');
INSERT INTO `distrito` VALUES ('dis01817', 'Nueva Requena', 'pro00192', '1');
INSERT INTO `distrito` VALUES ('dis01818', 'Raymondi', 'pro00193', '1');
INSERT INTO `distrito` VALUES ('dis01819', 'Sepahua', 'pro00193', '1');
INSERT INTO `distrito` VALUES ('dis01820', 'Tahuania', 'pro00193', '1');
INSERT INTO `distrito` VALUES ('dis01821', 'Yurua', 'pro00193', '1');
INSERT INTO `distrito` VALUES ('dis01822', 'Padre Abad', 'pro00194', '1');
INSERT INTO `distrito` VALUES ('dis01823', 'Irazola', 'pro00194', '1');
INSERT INTO `distrito` VALUES ('dis01824', 'Curimana', 'pro00194', '1');
INSERT INTO `distrito` VALUES ('dis01825', 'Purus', 'pro00195', '1');

-- ----------------------------
-- Table structure for docbieregdistribucion
-- ----------------------------
DROP TABLE IF EXISTS `docbieregdistribucion`;
CREATE TABLE `docbieregdistribucion` (
  `cDocCodigo` varchar(20) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `nAlmOrigen` int(11) NOT NULL,
  `nAlmDestino` int(11) NOT NULL,
  `nBieRegCodigo` int(11) NOT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cDocCodigo`,`nBieRegCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docbieregdistribucion
-- ----------------------------

-- ----------------------------
-- Table structure for docbieregistro
-- ----------------------------
DROP TABLE IF EXISTS `docbieregistro`;
CREATE TABLE `docbieregistro` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nNroItem` int(11) NOT NULL,
  `nBieRegCodigo` int(11) NOT NULL,
  `nEstado` int(11) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nNroItem`,`nBieRegCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docbieregistro
-- ----------------------------

-- ----------------------------
-- Table structure for doccompdetvalor
-- ----------------------------
DROP TABLE IF EXISTS `doccompdetvalor`;
CREATE TABLE `doccompdetvalor` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nNroItem` int(11) NOT NULL,
  `nMoneda` int(11) NOT NULL,
  `fValor` double(11,2) NOT NULL,
  `fDescuento` double(11,2) DEFAULT NULL,
  `fIGV` double(11,2) DEFAULT NULL,
  `dGravado` date DEFAULT NULL,
  PRIMARY KEY (`cDocCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of doccompdetvalor
-- ----------------------------

-- ----------------------------
-- Table structure for doccomprobante
-- ----------------------------
DROP TABLE IF EXISTS `doccomprobante`;
CREATE TABLE `doccomprobante` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nTipo` int(11) NOT NULL,
  `nMoneda` int(11) NOT NULL,
  `fmonto` float(11,0) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nTipo`,`nMoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of doccomprobante
-- ----------------------------

-- ----------------------------
-- Table structure for docdata
-- ----------------------------
DROP TABLE IF EXISTS `docdata`;
CREATE TABLE `docdata` (
  `nDocDatCodigo` int(11) NOT NULL DEFAULT '0',
  `cDocDatNombre` varchar(100) DEFAULT NULL,
  `cDocDatApellido` varchar(100) DEFAULT NULL,
  `cDocDatCorreo` varchar(100) DEFAULT NULL,
  `cDocCodigo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`nDocDatCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docdata
-- ----------------------------

-- ----------------------------
-- Table structure for docdatenvio
-- ----------------------------
DROP TABLE IF EXISTS `docdatenvio`;
CREATE TABLE `docdatenvio` (
  `nDocDatCodigo` int(11) DEFAULT NULL,
  `cDocCodigo` varchar(15) DEFAULT NULL,
  `nDocMenCodigo` int(11) DEFAULT NULL,
  `nDocDatEnvEstado` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docdatenvio
-- ----------------------------

-- ----------------------------
-- Table structure for docdepartamento
-- ----------------------------
DROP TABLE IF EXISTS `docdepartamento`;
CREATE TABLE `docdepartamento` (
  `cDocCodigo` varchar(20) DEFAULT NULL,
  `nParCodigo` int(11) DEFAULT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `cDocDepValor` varchar(20) DEFAULT NULL,
  `cDocDepGlosa` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docdepartamento
-- ----------------------------
INSERT INTO `docdepartamento` VALUES ('61726387208198', '0', '0', 'dep00013', 'MERCADO FINAL - DEPARTAMENTO');
INSERT INTO `docdepartamento` VALUES ('61726387208199', '0', '0', 'dep00013', 'MERCADO FINAL - DEPARTAMENTO');
INSERT INTO `docdepartamento` VALUES ('20198441074688', '0', '0', 'dep00013', 'MERCADO FINAL - DEPARTAMENTO');
INSERT INTO `docdepartamento` VALUES ('20198441074689', '0', '0', 'dep00013', 'MERCADO FINAL - DEPARTAMENTO');
INSERT INTO `docdepartamento` VALUES ('26598529548291', '0', '0', 'dep00013', 'MERCADO FINAL - DEPARTAMENTO');

-- ----------------------------
-- Table structure for docdistrito
-- ----------------------------
DROP TABLE IF EXISTS `docdistrito`;
CREATE TABLE `docdistrito` (
  `cDocCodigo` varchar(20) DEFAULT NULL,
  `nParCodigo` int(11) DEFAULT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `cDocDisValor` varchar(20) DEFAULT NULL,
  `cDocDisGlosa` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docdistrito
-- ----------------------------
INSERT INTO `docdistrito` VALUES ('20198441074688', '0', '0', 'dis01204', 'MERCADO FINAL - PROVINCIA');
INSERT INTO `docdistrito` VALUES ('20198441074689', '0', '0', 'dis01204', 'MERCADO FINAL - PROVINCIA');
INSERT INTO `docdistrito` VALUES ('26598529548291', '0', '0', 'dis01201', 'MERCADO FINAL - PROVINCIA');

-- ----------------------------
-- Table structure for docidentifica
-- ----------------------------
DROP TABLE IF EXISTS `docidentifica`;
CREATE TABLE `docidentifica` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nDocTipoNum` int(11) NOT NULL,
  `cDocNDoc` varchar(100) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nDocTipoNum`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docidentifica
-- ----------------------------

-- ----------------------------
-- Table structure for docmensaje
-- ----------------------------
DROP TABLE IF EXISTS `docmensaje`;
CREATE TABLE `docmensaje` (
  `nDocMenCodigo` int(11) NOT NULL DEFAULT '0',
  `cDocMenDescripcion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`nDocMenCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docmensaje
-- ----------------------------

-- ----------------------------
-- Table structure for docpais
-- ----------------------------
DROP TABLE IF EXISTS `docpais`;
CREATE TABLE `docpais` (
  `cDocCodigo` varchar(20) DEFAULT NULL,
  `nParCodigo` int(11) DEFAULT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `cDocPaiValor` varchar(20) DEFAULT NULL,
  `cDocPaiGlosa` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docpais
-- ----------------------------
INSERT INTO `docpais` VALUES ('20198441074688', '0', '0', 'pai00001', 'MERCADO FINAL - PAIS');
INSERT INTO `docpais` VALUES ('20198441074689', '0', '0', 'pai00001', 'MERCADO FINAL - PAIS');
INSERT INTO `docpais` VALUES ('26598529548291', '0', '0', 'pai00001', 'MERCADO FINAL - PAIS');

-- ----------------------------
-- Table structure for docparametro
-- ----------------------------
DROP TABLE IF EXISTS `docparametro`;
CREATE TABLE `docparametro` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `nParCodigo` int(11) NOT NULL,
  `cDocParObservacion` varchar(500) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`nParClase`,`nParCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docparametro
-- ----------------------------
INSERT INTO `docparametro` VALUES ('02076078227479', '2066', '1', 'XJSKD123 - EL PIRATA DEL MAR');
INSERT INTO `docparametro` VALUES ('02076078227479', '2042', '1', 'FICHA 2 - XJSKD123 - EL PIRATA DEL MAR');
INSERT INTO `docparametro` VALUES ('02076078227480', '2066', '2', 'HDGS45 - SAN PABLO II');
INSERT INTO `docparametro` VALUES ('02076078227480', '2042', '2', 'FICHA 2 - HDGS45 - SAN PABLO II');
INSERT INTO `docparametro` VALUES ('02076078227481', '2066', '3', 'HDGS45 - SAN PABLO II');
INSERT INTO `docparametro` VALUES ('02076078227481', '2042', '2', 'FICHA 2 - HDGS45 - SAN PABLO II');
INSERT INTO `docparametro` VALUES ('20198441074688', '2066', '4', '100000100002 - PISFIL  PUEMAPE ARMANDO');
INSERT INTO `docparametro` VALUES ('20198441074688', '2040', '7', 'FICHA 3(Flota Pesquera) - Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('20198441074688', '2', '2081', 'GANANCIAS : ');
INSERT INTO `docparametro` VALUES ('20198441074688', '3', '2081', 'GANANCIAS : ');
INSERT INTO `docparametro` VALUES ('20198441074689', '2066', '5', '100000100002 - PISFIL  PUEMAPE ARMANDO');
INSERT INTO `docparametro` VALUES ('20198441074689', '2040', '7', 'FICHA 3(Flota Pesquera) - Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('20198441074689', '2', '2081', 'GANANCIAS : ');
INSERT INTO `docparametro` VALUES ('20198441074689', '3', '2081', 'GANANCIAS : ');
INSERT INTO `docparametro` VALUES ('26598529548288', '2066', '6', 'PL-2358-BM - CHOLO JUSTO');
INSERT INTO `docparametro` VALUES ('26598529548288', '2042', '3', 'FICHA 2 - PL-2358-BM - CHOLO JUSTO');
INSERT INTO `docparametro` VALUES ('26598529548288', '2040', '4', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('26598529548289', '2066', '7', 'PL-2358-BM - CHOLO JUSTO');
INSERT INTO `docparametro` VALUES ('26598529548289', '2042', '3', 'FICHA 2 - PL-2358-BM - CHOLO JUSTO');
INSERT INTO `docparametro` VALUES ('26598529548289', '2040', '5', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('26598529548290', '2066', '8', 'GDHS123 - EL PIRATA');
INSERT INTO `docparametro` VALUES ('26598529548290', '2042', '4', 'FICHA 2 - GDHS123 - EL PIRATA');
INSERT INTO `docparametro` VALUES ('26598529548290', '2040', '4', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('26598529548291', '2066', '9', '100000100002 - PISFIL PUEMAPE ARMANDO');
INSERT INTO `docparametro` VALUES ('26598529548291', '2040', '4', 'FICHA 3(Flota Pesquera) - Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('26598529548292', '2066', '10', 'GDHS123 - EL PIRATA');
INSERT INTO `docparametro` VALUES ('26598529548292', '2042', '4', 'FICHA 2 - GDHS123 - EL PIRATA');
INSERT INTO `docparametro` VALUES ('26598529548292', '2040', '4', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('26598529548293', '2066', '11', 'CJSK34 - EL CHOLO');
INSERT INTO `docparametro` VALUES ('26598529548293', '2042', '5', 'FICHA 2 - CJSK34 - EL CHOLO');
INSERT INTO `docparametro` VALUES ('26598529548293', '2040', '5', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('26598529548294', '2066', '12', 'XKSJD - LA NAVE');
INSERT INTO `docparametro` VALUES ('26598529548294', '2042', '6', 'FICHA 2 - XKSJD - LA NAVE');
INSERT INTO `docparametro` VALUES ('26598529548294', '2040', '6', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)');
INSERT INTO `docparametro` VALUES ('26598529548295', '2066', '13', 'JAJSDHJCS3 - EL BRAVO');
INSERT INTO `docparametro` VALUES ('26598529548295', '2042', '7', 'FICHA 2 - JAJSDHJCS3 - EL BRAVO');
INSERT INTO `docparametro` VALUES ('26598529548295', '2040', '2', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)');

-- ----------------------------
-- Table structure for docpersona
-- ----------------------------
DROP TABLE IF EXISTS `docpersona`;
CREATE TABLE `docpersona` (
  `cDocCodigo` varchar(15) NOT NULL,
  `nDocPerTipo` int(11) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  `nPerRelacion` int(11) NOT NULL,
  `nDocTipo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docpersona
-- ----------------------------
INSERT INTO `docpersona` VALUES ('02076078227479', '14', '100000100002', '2005', '1008');
INSERT INTO `docpersona` VALUES ('02076078227479', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('02076078227480', '14', '100000100002', '2005', '1008');
INSERT INTO `docpersona` VALUES ('02076078227480', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('02076078227481', '14', '100000100004', '2005', '1008');
INSERT INTO `docpersona` VALUES ('02076078227481', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('20198441074688', '14', '100000100002', '2005', '1009');
INSERT INTO `docpersona` VALUES ('20198441074688', '15', '1', '2012', '1009');
INSERT INTO `docpersona` VALUES ('20198441074689', '14', '100000100002', '2005', '1009');
INSERT INTO `docpersona` VALUES ('20198441074689', '15', '1', '2012', '1009');
INSERT INTO `docpersona` VALUES ('26598529548288', '14', '100000100012', '2005', '1008');
INSERT INTO `docpersona` VALUES ('26598529548288', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('26598529548289', '14', '100000100012', '2005', '1008');
INSERT INTO `docpersona` VALUES ('26598529548289', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('26598529548290', '14', '100000100003', '2005', '1008');
INSERT INTO `docpersona` VALUES ('26598529548290', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('26598529548291', '14', '100000100002', '2005', '1009');
INSERT INTO `docpersona` VALUES ('26598529548291', '15', '1', '2012', '1009');
INSERT INTO `docpersona` VALUES ('26598529548292', '14', '100000100012', '2005', '1008');
INSERT INTO `docpersona` VALUES ('26598529548292', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('26598529548293', '14', '100000100012', '2005', '1008');
INSERT INTO `docpersona` VALUES ('26598529548293', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('26598529548294', '14', '100000100002', '2005', '1008');
INSERT INTO `docpersona` VALUES ('26598529548294', '15', '1', '2012', '1008');
INSERT INTO `docpersona` VALUES ('26598529548295', '14', '100000100003', '2005', '1008');
INSERT INTO `docpersona` VALUES ('26598529548295', '15', '1', '2012', '1008');

-- ----------------------------
-- Table structure for docpresupuesto
-- ----------------------------
DROP TABLE IF EXISTS `docpresupuesto`;
CREATE TABLE `docpresupuesto` (
  `cDocCodigo` varchar(20) DEFAULT NULL,
  `nParCodigo` int(11) DEFAULT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `cDocPreValor` varchar(100) DEFAULT NULL,
  `cDocParGlosa` varchar(250) DEFAULT NULL,
  `nDocPreEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docpresupuesto
-- ----------------------------
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '1', '2078', '34', 'INGRESOS PROMEDIO MENSUAL O POR FAENA DE PESCA ', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '2', '2078', '45', 'INGRESOS PROMEDIO MENSUAL POR OTRA ACTIDAD', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '1', '2079', '45', 'GASTOS PROPIETARIO - ARTE Y/O APAREJO DE PESCA', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '2', '2079', '65', 'ASTOS PROPIETARIO - REPARACION Y MANTENIMIENTO', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '3', '2079', '56', 'ASTOS PROPIETARIO - OTROS GASTOS', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '1', '2080', '56', 'GASTOS COMUNES - ALIMIMENTOS', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '2', '2080', '65', 'GASTOS COMUNES - COMBUSTIBLE', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '3', '2080', '65', 'GASTOS COMUNES - LUBRICANTES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '4', '2080', '56', 'GASTOS COMUNES - AGUA', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '5', '2080', '0.00', 'GASTOS COMUNES - HIELO', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '6', '2080', '0.00', 'GASTOS COMUNES - OTROS', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '7', '2080', '408', 'GASTOS COMUNES - TOTAL DE GASTOS COMUNES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '2', '2043', '56', '657', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '1', '2043', '56', '567', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '1', '2082', '56', 'GASTOS COMUNES -GANANCIAS TOTALES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '2', '2082', '756', 'GASTOS COMUNES - NUMERO TOTAL DE PARTES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '3', '2082', '76', 'GASTOS COMUNES - VALOR DE UNA PARTE', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '4', '2082', '67', 'GASTOS COMUNES - PARTES PARA EL ARMADOR', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '5', '2082', '67', 'GASTOS COMUNES - PARTES PARA EL PROPIETARIO DE LA RED', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '6', '2082', '67', 'GASTOS COMUNES - PARTES PARA LA TRIBULACION', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '7', '2082', '67', 'GASTOS COMUNES -OTROS(ESPECIFICAR)', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074688', '8', '2082', '1156', 'GASTOS COMUNES - TOTALES GANANCIAS', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '1', '2078', '34', 'INGRESOS PROMEDIO MENSUAL O POR FAENA DE PESCA ', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '2', '2078', '45', 'INGRESOS PROMEDIO MENSUAL POR OTRA ACTIDAD', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '1', '2079', '45', 'GASTOS PROPIETARIO - ARTE Y/O APAREJO DE PESCA', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '2', '2079', '65', 'ASTOS PROPIETARIO - REPARACION Y MANTENIMIENTO', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '3', '2079', '56', 'ASTOS PROPIETARIO - OTROS GASTOS', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '1', '2080', '56', 'GASTOS COMUNES - ALIMIMENTOS', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '2', '2080', '65', 'GASTOS COMUNES - COMBUSTIBLE', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '3', '2080', '65', 'GASTOS COMUNES - LUBRICANTES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '4', '2080', '56', 'GASTOS COMUNES - AGUA', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '5', '2080', '0.00', 'GASTOS COMUNES - HIELO', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '6', '2080', '0.00', 'GASTOS COMUNES - OTROS', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '7', '2080', '408', 'GASTOS COMUNES - TOTAL DE GASTOS COMUNES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '2', '2043', '56', '657', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '1', '2043', '56', '567', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '1', '2082', '56', 'GASTOS COMUNES -GANANCIAS TOTALES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '2', '2082', '756', 'GASTOS COMUNES - NUMERO TOTAL DE PARTES', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '3', '2082', '76', 'GASTOS COMUNES - VALOR DE UNA PARTE', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '4', '2082', '67', 'GASTOS COMUNES - PARTES PARA EL ARMADOR', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '5', '2082', '67', 'GASTOS COMUNES - PARTES PARA EL PROPIETARIO DE LA RED', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '6', '2082', '67', 'GASTOS COMUNES - PARTES PARA LA TRIBULACION', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '7', '2082', '67', 'GASTOS COMUNES -OTROS(ESPECIFICAR)', '1');
INSERT INTO `docpresupuesto` VALUES ('20198441074689', '8', '2082', '1156', 'GASTOS COMUNES - TOTALES GANANCIAS', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '1', '2078', '0.00', 'INGRESOS PROMEDIO MENSUAL O POR FAENA DE PESCA ', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '2', '2078', '0.00', 'INGRESOS PROMEDIO MENSUAL POR OTRA ACTIDAD', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '1', '2079', '12', 'GASTOS PROPIETARIO - ARTE Y/O APAREJO DE PESCA', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '2', '2079', '45', 'ASTOS PROPIETARIO - REPARACION Y MANTENIMIENTO', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '3', '2079', '20.9', 'ASTOS PROPIETARIO - OTROS GASTOS', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '1', '2080', '12', 'GASTOS COMUNES - ALIMIMENTOS', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '2', '2080', '45', 'GASTOS COMUNES - COMBUSTIBLE', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '3', '2080', '0.00', 'GASTOS COMUNES - LUBRICANTES', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '4', '2080', '54', 'GASTOS COMUNES - AGUA', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '5', '2080', '12', 'GASTOS COMUNES - HIELO', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '6', '2080', '34', 'GASTOS COMUNES - OTROS', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '7', '2080', '234.9', 'GASTOS COMUNES - TOTAL DE GASTOS COMUNES', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '2', '2043', '12', '12', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '1', '2043', '12', '12', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '1', '2043', '12', '13', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '1', '2082', '12', 'GASTOS COMUNES -GANANCIAS TOTALES', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '2', '2082', '23.9', 'GASTOS COMUNES - NUMERO TOTAL DE PARTES', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '3', '2082', '23', 'GASTOS COMUNES - VALOR DE UNA PARTE', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '4', '2082', '45', 'GASTOS COMUNES - PARTES PARA EL ARMADOR', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '5', '2082', '123', 'GASTOS COMUNES - PARTES PARA EL PROPIETARIO DE LA RED', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '6', '2082', '4', 'GASTOS COMUNES - PARTES PARA LA TRIBULACION', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '7', '2082', '5', 'GASTOS COMUNES -OTROS(ESPECIFICAR)', '1');
INSERT INTO `docpresupuesto` VALUES ('26598529548291', '8', '2082', '235.9', 'GASTOS COMUNES - TOTALES GANANCIAS', '1');

-- ----------------------------
-- Table structure for docprovincia
-- ----------------------------
DROP TABLE IF EXISTS `docprovincia`;
CREATE TABLE `docprovincia` (
  `cDocCodigo` varchar(20) DEFAULT NULL,
  `nParCodigo` int(11) DEFAULT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `cDocProValor` varchar(20) DEFAULT NULL,
  `cDocProGlosa` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docprovincia
-- ----------------------------
INSERT INTO `docprovincia` VALUES ('20198441074688', '0', '0', 'pro00125', 'MERCADO FINA - PROVINCIA');
INSERT INTO `docprovincia` VALUES ('20198441074689', '0', '0', 'pro00125', 'MERCADO FINA - PROVINCIA');
INSERT INTO `docprovincia` VALUES ('26598529548291', '0', '0', 'pro00125', 'MERCADO FINA - PROVINCIA');

-- ----------------------------
-- Table structure for docref
-- ----------------------------
DROP TABLE IF EXISTS `docref`;
CREATE TABLE `docref` (
  `cDocCodigo` varchar(15) NOT NULL DEFAULT '',
  `cDocRefCodigo` varchar(15) NOT NULL,
  PRIMARY KEY (`cDocCodigo`,`cDocRefCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docref
-- ----------------------------

-- ----------------------------
-- Table structure for docrefdestino
-- ----------------------------
DROP TABLE IF EXISTS `docrefdestino`;
CREATE TABLE `docrefdestino` (
  `cDocCodigo` varchar(15) NOT NULL,
  `cLugarOrigen` text NOT NULL,
  `nOrigTipo` int(11) NOT NULL,
  `cOrigDireccion` varchar(200) NOT NULL,
  `cOrigManz` varchar(100) NOT NULL,
  `cOrigLote` varchar(100) NOT NULL,
  `nOrigTipoRes` int(11) NOT NULL,
  `cOrigResidencia` varchar(200) NOT NULL,
  `cLugarDestino` text NOT NULL,
  `nDestTipo` int(11) NOT NULL,
  `cDestDireccion` varchar(200) NOT NULL,
  PRIMARY KEY (`cDocCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docrefdestino
-- ----------------------------

-- ----------------------------
-- Table structure for documentos
-- ----------------------------
DROP TABLE IF EXISTS `documentos`;
CREATE TABLE `documentos` (
  `cDocCodigo` varchar(15) NOT NULL,
  `dDocFecha` datetime NOT NULL,
  `cDocObserv` varchar(1000) NOT NULL,
  `nDocTipo` int(11) NOT NULL,
  `nEstado` int(11) NOT NULL,
  PRIMARY KEY (`cDocCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of documentos
-- ----------------------------
INSERT INTO `documentos` VALUES ('02076078227479', '2013-12-19 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('02076078227480', '2013-12-12 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('02076078227481', '2013-12-05 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('20198441074688', '2013-12-19 00:00:00', 'PRIMERA FICHA SOCIO- ECONOMICAA', '1009', '1');
INSERT INTO `documentos` VALUES ('20198441074689', '2013-12-19 00:00:00', 'PRIMERA FICHA SOCIO- ECONOMICAA', '1009', '1');
INSERT INTO `documentos` VALUES ('26598529548288', '2013-05-25 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('26598529548289', '2013-12-12 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('26598529548290', '2013-12-12 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('26598529548291', '2013-12-18 00:00:00', 'FICHA 3', '1009', '1');
INSERT INTO `documentos` VALUES ('26598529548292', '2013-12-12 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('26598529548293', '2013-10-08 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('26598529548294', '2013-09-10 00:00:00', 'FICHA 2', '1008', '1');
INSERT INTO `documentos` VALUES ('26598529548295', '2013-12-12 00:00:00', 'FICHA 2', '1008', '1');

-- ----------------------------
-- Table structure for docvigencia
-- ----------------------------
DROP TABLE IF EXISTS `docvigencia`;
CREATE TABLE `docvigencia` (
  `cDocCodigo` varchar(15) NOT NULL,
  `dFecha` date NOT NULL,
  `dFechaFin` date NOT NULL,
  `dHora` datetime NOT NULL,
  PRIMARY KEY (`cDocCodigo`),
  UNIQUE KEY `Codigo` (`cDocCodigo`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of docvigencia
-- ----------------------------

-- ----------------------------
-- Table structure for kardex
-- ----------------------------
DROP TABLE IF EXISTS `kardex`;
CREATE TABLE `kardex` (
  `NroMovimiento` int(11) NOT NULL DEFAULT '0',
  `dFecha` datetime NOT NULL,
  `nUniOrgCodigo` int(11) NOT NULL,
  `nAlmCodigo` int(11) NOT NULL,
  `nTipoMov` int(11) NOT NULL,
  `nBieCodigo` int(11) NOT NULL,
  `nMarModCodigo` int(11) NOT NULL,
  `nUnidad` int(11) NOT NULL,
  `fCantidad` float(8,2) NOT NULL,
  `nMonCodigo` int(11) NOT NULL,
  `fImporte` float(8,2) NOT NULL,
  `fPrecio` float(8,2) NOT NULL,
  `cKarObs` varchar(255) NOT NULL,
  `cDocCodigo` varchar(18) NOT NULL,
  `cMarModCodigo` varchar(10) NOT NULL,
  `cBieCodigo` varchar(18) NOT NULL,
  `fSaldo` float(8,2) NOT NULL,
  `NroMovOrigen` int(11) NOT NULL,
  `nMetCodigo` int(11) NOT NULL,
  `nBieRegCodigo` int(11) NOT NULL,
  `nKarEstado` int(11) NOT NULL,
  PRIMARY KEY (`NroMovimiento`,`cBieCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kardex
-- ----------------------------

-- ----------------------------
-- Table structure for kardex_caja
-- ----------------------------
DROP TABLE IF EXISTS `kardex_caja`;
CREATE TABLE `kardex_caja` (
  `nKxPeriodo` int(11) NOT NULL,
  `nKxTipoMov` int(11) NOT NULL,
  `fKxImporte` float NOT NULL,
  `cKxDocCodigo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kardex_caja
-- ----------------------------

-- ----------------------------
-- Table structure for pais
-- ----------------------------
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `IdPais` varchar(20) NOT NULL,
  `Nombre` varchar(250) DEFAULT NULL,
  `nPaiEstado` int(4) DEFAULT '1',
  PRIMARY KEY (`IdPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pais
-- ----------------------------
INSERT INTO `pais` VALUES ('pai00001', 'Perú', '1');
INSERT INTO `pais` VALUES ('pai00002', 'Afganistán', '1');
INSERT INTO `pais` VALUES ('pai00003', 'Akrotiri', '0');
INSERT INTO `pais` VALUES ('pai00004', 'Albania', '0');
INSERT INTO `pais` VALUES ('pai00005', 'Alemania', '0');
INSERT INTO `pais` VALUES ('pai00006', 'Andorra', '0');
INSERT INTO `pais` VALUES ('pai00007', 'Angola', '0');
INSERT INTO `pais` VALUES ('pai00008', 'Anguila', '0');
INSERT INTO `pais` VALUES ('pai00009', 'Antártida', '0');
INSERT INTO `pais` VALUES ('pai00010', 'Antigua y Barbuda', '0');
INSERT INTO `pais` VALUES ('pai00011', 'Antillas Neerlandesas', '0');
INSERT INTO `pais` VALUES ('pai00012', 'Arabia Saudí', '0');
INSERT INTO `pais` VALUES ('pai00013', 'Arctic Ocean', '0');
INSERT INTO `pais` VALUES ('pai00014', 'Argelia', '0');
INSERT INTO `pais` VALUES ('pai00015', 'Argentina', '0');
INSERT INTO `pais` VALUES ('pai00016', 'Armenia', '0');
INSERT INTO `pais` VALUES ('pai00017', 'Aruba', '0');
INSERT INTO `pais` VALUES ('pai00018', 'Ashmore and Cartier Islands', '0');
INSERT INTO `pais` VALUES ('pai00019', 'Atlantic Ocean', '0');
INSERT INTO `pais` VALUES ('pai00020', 'Australia', '0');
INSERT INTO `pais` VALUES ('pai00021', 'Austria', '0');
INSERT INTO `pais` VALUES ('pai00022', 'Azerbaiyán', '0');
INSERT INTO `pais` VALUES ('pai00023', 'Bahamas', '0');
INSERT INTO `pais` VALUES ('pai00024', 'Bahráin', '0');
INSERT INTO `pais` VALUES ('pai00025', 'Bangladesh', '0');
INSERT INTO `pais` VALUES ('pai00026', 'Barbados', '0');
INSERT INTO `pais` VALUES ('pai00027', 'Bélgica', '0');
INSERT INTO `pais` VALUES ('pai00028', 'Belice', '0');
INSERT INTO `pais` VALUES ('pai00029', 'Benín', '0');
INSERT INTO `pais` VALUES ('pai00030', 'Bermudas', '0');
INSERT INTO `pais` VALUES ('pai00031', 'Bielorrusia', '0');
INSERT INTO `pais` VALUES ('pai00032', 'Birmania; Myanmar', '0');
INSERT INTO `pais` VALUES ('pai00033', 'Bolivia', '0');
INSERT INTO `pais` VALUES ('pai00034', 'Bosnia y Hercegovina', '0');
INSERT INTO `pais` VALUES ('pai00035', 'Botsuana', '0');
INSERT INTO `pais` VALUES ('pai00036', 'Brasil', '0');
INSERT INTO `pais` VALUES ('pai00037', 'Brunéi', '0');
INSERT INTO `pais` VALUES ('pai00038', 'Bulgaria', '0');
INSERT INTO `pais` VALUES ('pai00039', 'Burkina Faso', '0');
INSERT INTO `pais` VALUES ('pai00040', 'Burundi', '0');
INSERT INTO `pais` VALUES ('pai00041', 'Bután', '0');
INSERT INTO `pais` VALUES ('pai00042', 'Cabo Verde', '0');
INSERT INTO `pais` VALUES ('pai00043', 'Camboya', '0');
INSERT INTO `pais` VALUES ('pai00044', 'Camerún', '0');
INSERT INTO `pais` VALUES ('pai00045', 'Canadá', '0');
INSERT INTO `pais` VALUES ('pai00046', 'Chad', '0');
INSERT INTO `pais` VALUES ('pai00047', 'Chile', '0');
INSERT INTO `pais` VALUES ('pai00048', 'China', '0');
INSERT INTO `pais` VALUES ('pai00049', 'Chipre', '0');
INSERT INTO `pais` VALUES ('pai00050', 'Clipperton Island', '0');
INSERT INTO `pais` VALUES ('pai00051', 'Colombia', '0');
INSERT INTO `pais` VALUES ('pai00052', 'Comoras', '0');
INSERT INTO `pais` VALUES ('pai00053', 'Congo', '0');
INSERT INTO `pais` VALUES ('pai00054', 'Coral Sea Islands', '0');
INSERT INTO `pais` VALUES ('pai00055', 'Corea del Norte', '0');
INSERT INTO `pais` VALUES ('pai00056', 'Corea del Sur', '0');
INSERT INTO `pais` VALUES ('pai00057', 'Costa de Marfil', '0');
INSERT INTO `pais` VALUES ('pai00058', 'Costa Rica', '0');
INSERT INTO `pais` VALUES ('pai00059', 'Croacia', '0');
INSERT INTO `pais` VALUES ('pai00060', 'Cuba', '0');
INSERT INTO `pais` VALUES ('pai00061', 'Dhekelia', '0');
INSERT INTO `pais` VALUES ('pai00062', 'Dinamarca', '0');
INSERT INTO `pais` VALUES ('pai00063', 'Dominica', '0');
INSERT INTO `pais` VALUES ('pai00064', 'Ecuador', '0');
INSERT INTO `pais` VALUES ('pai00065', 'Egipto', '0');
INSERT INTO `pais` VALUES ('pai00066', 'El Salvador', '0');
INSERT INTO `pais` VALUES ('pai00067', 'El Vaticano', '0');
INSERT INTO `pais` VALUES ('pai00068', 'Emiratos Árabes Unidos', '0');
INSERT INTO `pais` VALUES ('pai00069', 'Eritrea', '0');
INSERT INTO `pais` VALUES ('pai00070', 'Eslovaquia', '0');
INSERT INTO `pais` VALUES ('pai00071', 'Eslovenia', '0');
INSERT INTO `pais` VALUES ('pai00072', 'España', '0');
INSERT INTO `pais` VALUES ('pai00073', 'Estados Unidos', '0');
INSERT INTO `pais` VALUES ('pai00074', 'Estonia', '0');
INSERT INTO `pais` VALUES ('pai00075', 'Etiopía', '0');
INSERT INTO `pais` VALUES ('pai00076', 'Filipinas', '0');
INSERT INTO `pais` VALUES ('pai00077', 'Finlandia', '0');
INSERT INTO `pais` VALUES ('pai00078', 'Fiyi', '0');
INSERT INTO `pais` VALUES ('pai00079', 'Francia', '0');
INSERT INTO `pais` VALUES ('pai00080', 'Gabón', '0');
INSERT INTO `pais` VALUES ('pai00081', 'Gambia', '0');
INSERT INTO `pais` VALUES ('pai00082', 'Gaza Strip', '0');
INSERT INTO `pais` VALUES ('pai00083', 'Georgia', '0');
INSERT INTO `pais` VALUES ('pai00084', 'Ghana', '0');
INSERT INTO `pais` VALUES ('pai00085', 'Gibraltar', '0');
INSERT INTO `pais` VALUES ('pai00086', 'Granada', '0');
INSERT INTO `pais` VALUES ('pai00087', 'Grecia', '0');
INSERT INTO `pais` VALUES ('pai00088', 'Groenlandia', '0');
INSERT INTO `pais` VALUES ('pai00089', 'Guam', '0');
INSERT INTO `pais` VALUES ('pai00090', 'Guatemala', '0');
INSERT INTO `pais` VALUES ('pai00091', 'Guernsey', '0');
INSERT INTO `pais` VALUES ('pai00092', 'Guinea', '0');
INSERT INTO `pais` VALUES ('pai00093', 'Guinea Ecuatorial', '0');
INSERT INTO `pais` VALUES ('pai00094', 'Guinea-Bissau', '0');
INSERT INTO `pais` VALUES ('pai00095', 'Guyana', '0');
INSERT INTO `pais` VALUES ('pai00096', 'Haití', '0');
INSERT INTO `pais` VALUES ('pai00097', 'Honduras', '0');
INSERT INTO `pais` VALUES ('pai00098', 'Hong Kong', '0');
INSERT INTO `pais` VALUES ('pai00099', 'Hungría', '0');
INSERT INTO `pais` VALUES ('pai00100', 'India', '0');
INSERT INTO `pais` VALUES ('pai00101', 'Indian Ocean', '0');
INSERT INTO `pais` VALUES ('pai00102', 'Indonesia', '0');
INSERT INTO `pais` VALUES ('pai00103', 'Irán', '0');
INSERT INTO `pais` VALUES ('pai00104', 'Iraq', '0');
INSERT INTO `pais` VALUES ('pai00105', 'Irlanda', '0');
INSERT INTO `pais` VALUES ('pai00106', 'Isla Bouvet', '0');
INSERT INTO `pais` VALUES ('pai00107', 'Isla Christmas', '0');
INSERT INTO `pais` VALUES ('pai00108', 'Isla Norfolk', '0');
INSERT INTO `pais` VALUES ('pai00109', 'Islandia', '0');
INSERT INTO `pais` VALUES ('pai00110', 'Islas Caimán', '0');
INSERT INTO `pais` VALUES ('pai00111', 'Islas Cocos', '0');
INSERT INTO `pais` VALUES ('pai00112', 'Islas Cook', '0');
INSERT INTO `pais` VALUES ('pai00113', 'Islas Feroe', '0');
INSERT INTO `pais` VALUES ('pai00114', 'Islas Georgia del Sur y Sandwich del Sur', '0');
INSERT INTO `pais` VALUES ('pai00115', 'Islas Heard y McDonald', '0');
INSERT INTO `pais` VALUES ('pai00116', 'Islas Malvinas', '0');
INSERT INTO `pais` VALUES ('pai00117', 'Islas Marianas del Norte', '0');
INSERT INTO `pais` VALUES ('pai00118', 'Islas Marshall', '0');
INSERT INTO `pais` VALUES ('pai00119', 'Islas Pitcairn', '0');
INSERT INTO `pais` VALUES ('pai00120', 'Islas Salomón', '0');
INSERT INTO `pais` VALUES ('pai00121', 'Islas Turcas y Caicos', '0');
INSERT INTO `pais` VALUES ('pai00122', 'Islas Vírgenes Americanas', '0');
INSERT INTO `pais` VALUES ('pai00123', 'Islas Vírgenes Británicas', '0');
INSERT INTO `pais` VALUES ('pai00124', 'Israel', '0');
INSERT INTO `pais` VALUES ('pai00125', 'Italia', '0');
INSERT INTO `pais` VALUES ('pai00126', 'Jamaica', '0');
INSERT INTO `pais` VALUES ('pai00127', 'Jan Mayen', '0');
INSERT INTO `pais` VALUES ('pai00128', 'Japón', '0');
INSERT INTO `pais` VALUES ('pai00129', 'Jersey', '0');
INSERT INTO `pais` VALUES ('pai00130', 'Jordania', '0');
INSERT INTO `pais` VALUES ('pai00131', 'Kazajistán', '0');
INSERT INTO `pais` VALUES ('pai00132', 'Kenia', '0');
INSERT INTO `pais` VALUES ('pai00133', 'Kirguizistán', '0');
INSERT INTO `pais` VALUES ('pai00134', 'Kiribati', '0');
INSERT INTO `pais` VALUES ('pai00135', 'Kuwait', '0');
INSERT INTO `pais` VALUES ('pai00136', 'Laos', '0');
INSERT INTO `pais` VALUES ('pai00137', 'Lesoto', '0');
INSERT INTO `pais` VALUES ('pai00138', 'Letonia', '0');
INSERT INTO `pais` VALUES ('pai00139', 'Líbano', '0');
INSERT INTO `pais` VALUES ('pai00140', 'Liberia', '0');
INSERT INTO `pais` VALUES ('pai00141', 'Libia', '0');
INSERT INTO `pais` VALUES ('pai00142', 'Liechtenstein', '0');
INSERT INTO `pais` VALUES ('pai00143', 'Lituania', '0');
INSERT INTO `pais` VALUES ('pai00144', 'Luxemburgo', '0');
INSERT INTO `pais` VALUES ('pai00145', 'Macao', '0');
INSERT INTO `pais` VALUES ('pai00146', 'Macedonia', '0');
INSERT INTO `pais` VALUES ('pai00147', 'Madagascar', '0');
INSERT INTO `pais` VALUES ('pai00148', 'Malasia', '0');
INSERT INTO `pais` VALUES ('pai00149', 'Malaui', '0');
INSERT INTO `pais` VALUES ('pai00150', 'Maldivas', '0');
INSERT INTO `pais` VALUES ('pai00151', 'Malí', '0');
INSERT INTO `pais` VALUES ('pai00152', 'Malta', '0');
INSERT INTO `pais` VALUES ('pai00153', 'Man, Isle of', '0');
INSERT INTO `pais` VALUES ('pai00154', 'Marruecos', '0');
INSERT INTO `pais` VALUES ('pai00155', 'Mauricio', '0');
INSERT INTO `pais` VALUES ('pai00156', 'Mauritania', '0');
INSERT INTO `pais` VALUES ('pai00157', 'Mayotte', '0');
INSERT INTO `pais` VALUES ('pai00158', 'México', '0');
INSERT INTO `pais` VALUES ('pai00159', 'Micronesia', '0');
INSERT INTO `pais` VALUES ('pai00160', 'Moldavia', '0');
INSERT INTO `pais` VALUES ('pai00161', 'Mónaco', '0');
INSERT INTO `pais` VALUES ('pai00162', 'Mongolia', '0');
INSERT INTO `pais` VALUES ('pai00163', 'Montenegro', '0');
INSERT INTO `pais` VALUES ('pai00164', 'Montserrat', '0');
INSERT INTO `pais` VALUES ('pai00165', 'Mozambique', '0');
INSERT INTO `pais` VALUES ('pai00166', 'Mundo', '0');
INSERT INTO `pais` VALUES ('pai00167', 'Namibia', '0');
INSERT INTO `pais` VALUES ('pai00168', 'Nauru', '0');
INSERT INTO `pais` VALUES ('pai00169', 'Navassa Island', '0');
INSERT INTO `pais` VALUES ('pai00170', 'Nepal', '0');
INSERT INTO `pais` VALUES ('pai00171', 'Nicaragua', '0');
INSERT INTO `pais` VALUES ('pai00172', 'Níger', '0');
INSERT INTO `pais` VALUES ('pai00173', 'Nigeria', '0');
INSERT INTO `pais` VALUES ('pai00174', 'Niue', '0');
INSERT INTO `pais` VALUES ('pai00175', 'Noruega', '0');
INSERT INTO `pais` VALUES ('pai00176', 'Nueva Caledonia', '0');
INSERT INTO `pais` VALUES ('pai00177', 'Nueva Zelanda', '0');
INSERT INTO `pais` VALUES ('pai00178', 'Omán', '0');
INSERT INTO `pais` VALUES ('pai00179', 'Pacific Ocean', '0');
INSERT INTO `pais` VALUES ('pai00180', 'Países Bajos', '0');
INSERT INTO `pais` VALUES ('pai00181', 'Pakistán', '0');
INSERT INTO `pais` VALUES ('pai00182', 'Palaos', '0');
INSERT INTO `pais` VALUES ('pai00183', 'Panamá', '0');
INSERT INTO `pais` VALUES ('pai00184', 'Papúa-Nueva Guinea', '0');
INSERT INTO `pais` VALUES ('pai00185', 'Paracel Islands', '0');
INSERT INTO `pais` VALUES ('pai00186', 'Paraguay', '0');
INSERT INTO `pais` VALUES ('pai00187', 'Polinesia Francesa', '0');
INSERT INTO `pais` VALUES ('pai00188', 'Polonia', '0');
INSERT INTO `pais` VALUES ('pai00189', 'Portugal', '0');
INSERT INTO `pais` VALUES ('pai00190', 'Puerto Rico', '0');
INSERT INTO `pais` VALUES ('pai00191', 'Qatar', '0');
INSERT INTO `pais` VALUES ('pai00192', 'Reino Unido', '0');
INSERT INTO `pais` VALUES ('pai00193', 'República Centroafricana', '0');
INSERT INTO `pais` VALUES ('pai00194', 'República Checa', '0');
INSERT INTO `pais` VALUES ('pai00195', 'República Democrática del Congo', '0');
INSERT INTO `pais` VALUES ('pai00196', 'República Dominicana', '0');
INSERT INTO `pais` VALUES ('pai00197', 'Ruanda', '0');
INSERT INTO `pais` VALUES ('pai00198', 'Rumania', '0');
INSERT INTO `pais` VALUES ('pai00199', 'Rusia', '0');
INSERT INTO `pais` VALUES ('pai00200', 'Sáhara Occidental', '0');
INSERT INTO `pais` VALUES ('pai00201', 'Samoa', '0');
INSERT INTO `pais` VALUES ('pai00202', 'Samoa Americana', '0');
INSERT INTO `pais` VALUES ('pai00203', 'San Cristóbal y Nieves', '0');
INSERT INTO `pais` VALUES ('pai00204', 'San Marino', '0');
INSERT INTO `pais` VALUES ('pai00205', 'San Pedro y Miquelón', '0');
INSERT INTO `pais` VALUES ('pai00206', 'San Vicente y las Granadinas', '0');
INSERT INTO `pais` VALUES ('pai00207', 'Santa Helena', '0');
INSERT INTO `pais` VALUES ('pai00208', 'Santa Lucía', '0');
INSERT INTO `pais` VALUES ('pai00209', 'Santo Tomé y Príncipe', '0');
INSERT INTO `pais` VALUES ('pai00210', 'Senegal', '0');
INSERT INTO `pais` VALUES ('pai00211', 'Serbia', '0');
INSERT INTO `pais` VALUES ('pai00212', 'Seychelles', '0');
INSERT INTO `pais` VALUES ('pai00213', 'Sierra Leona', '0');
INSERT INTO `pais` VALUES ('pai00214', 'Singapur', '0');
INSERT INTO `pais` VALUES ('pai00215', 'Siria', '0');
INSERT INTO `pais` VALUES ('pai00216', 'Somalia', '0');
INSERT INTO `pais` VALUES ('pai00217', 'Southern Ocean', '0');
INSERT INTO `pais` VALUES ('pai00218', 'Spratly Islands', '0');
INSERT INTO `pais` VALUES ('pai00219', 'Sri Lanka', '0');
INSERT INTO `pais` VALUES ('pai00220', 'Suazilandia', '0');
INSERT INTO `pais` VALUES ('pai00221', 'Sudáfrica', '0');
INSERT INTO `pais` VALUES ('pai00222', 'Sudán', '0');
INSERT INTO `pais` VALUES ('pai00223', 'Suecia', '0');
INSERT INTO `pais` VALUES ('pai00224', 'Suiza', '0');
INSERT INTO `pais` VALUES ('pai00225', 'Surinam', '0');
INSERT INTO `pais` VALUES ('pai00226', 'Svalbard y Jan Mayen', '0');
INSERT INTO `pais` VALUES ('pai00227', 'Tailandia', '0');
INSERT INTO `pais` VALUES ('pai00228', 'Taiwán', '0');
INSERT INTO `pais` VALUES ('pai00229', 'Tanzania', '0');
INSERT INTO `pais` VALUES ('pai00230', 'Tayikistán', '0');
INSERT INTO `pais` VALUES ('pai00231', 'Territorio Británico del Océano Indico', '0');
INSERT INTO `pais` VALUES ('pai00232', 'Territorios Australes Franceses', '0');
INSERT INTO `pais` VALUES ('pai00233', 'Timor Oriental', '0');
INSERT INTO `pais` VALUES ('pai00234', 'Togo', '0');
INSERT INTO `pais` VALUES ('pai00235', 'Tokelau', '0');
INSERT INTO `pais` VALUES ('pai00236', 'Tonga', '0');
INSERT INTO `pais` VALUES ('pai00237', 'Trinidad y Tobago', '0');
INSERT INTO `pais` VALUES ('pai00238', 'Túnez', '0');
INSERT INTO `pais` VALUES ('pai00239', 'Turkmenistán', '0');
INSERT INTO `pais` VALUES ('pai00240', 'Turquía', '0');
INSERT INTO `pais` VALUES ('pai00241', 'Tuvalu', '0');
INSERT INTO `pais` VALUES ('pai00242', 'Ucrania', '0');
INSERT INTO `pais` VALUES ('pai00243', 'Uganda', '0');
INSERT INTO `pais` VALUES ('pai00244', 'Unión Europea', '0');
INSERT INTO `pais` VALUES ('pai00245', 'Uruguay', '0');
INSERT INTO `pais` VALUES ('pai00246', 'Uzbekistán', '0');
INSERT INTO `pais` VALUES ('pai00247', 'Vanuatu', '0');
INSERT INTO `pais` VALUES ('pai00248', 'Venezuela', '0');
INSERT INTO `pais` VALUES ('pai00249', 'Vietnam', '0');
INSERT INTO `pais` VALUES ('pai00250', 'Wake Island', '0');
INSERT INTO `pais` VALUES ('pai00251', 'Wallis y Futuna', '0');
INSERT INTO `pais` VALUES ('pai00252', 'West Bank', '0');
INSERT INTO `pais` VALUES ('pai00253', 'Yemen', '0');
INSERT INTO `pais` VALUES ('pai00254', 'Yibuti', '0');
INSERT INTO `pais` VALUES ('pai00255', 'Zambia', '0');
INSERT INTO `pais` VALUES ('pai00256', 'Zimbabue', '0');

-- ----------------------------
-- Table structure for parametro
-- ----------------------------
DROP TABLE IF EXISTS `parametro`;
CREATE TABLE `parametro` (
  `nParCodigo` bigint(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `cParJerarquia` varchar(500) NOT NULL,
  `cParNombre` varchar(1000) NOT NULL,
  `cParDescripcion` varchar(1000) NOT NULL,
  `nParTipo` int(11) NOT NULL,
  PRIMARY KEY (`nParCodigo`,`nParClase`),
  KEY `idx_Parametro_cParNombre` (`cParNombre`) USING BTREE,
  KEY `idx_Parametro_cParDescripcion` (`cParDescripcion`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parametro
-- ----------------------------
INSERT INTO `parametro` VALUES ('0', '1100', '00', 'operaciones', 'Operaciones', '0');
INSERT INTO `parametro` VALUES ('1', '1100', '01', 'Operacion', 'Activar Usuario', '1000');
INSERT INTO `parametro` VALUES ('2', '1100', '02', 'Operacion', 'Eliminar Usuario', '1000');
INSERT INTO `parametro` VALUES ('3', '1100', '03', 'Operacion', 'Modificar Usuario', '1000');
INSERT INTO `parametro` VALUES ('4', '1100', '04', 'Operacion', 'Insertar Usuario', '1000');
INSERT INTO `parametro` VALUES ('5', '1100', '05', 'Operacion', 'Modificar Persona', '1000');
INSERT INTO `parametro` VALUES ('6', '1100', '05', 'Operacion', 'Eliminar Persona', '1000');
INSERT INTO `parametro` VALUES ('7', '1100', '07', 'Operacion', 'Insertar Persona', '1000');
INSERT INTO `parametro` VALUES ('8', '1100', '08', 'Operaciones', 'Modificar Cuenta General', '1000');
INSERT INTO `parametro` VALUES ('9', '1100', '09', 'Operacion', 'Insertar Cuenta General', '1000');
INSERT INTO `parametro` VALUES ('10', '1100', '10', 'Operacion', 'Eliminar Cuenta General', '1000');
INSERT INTO `parametro` VALUES ('11', '1100', '11', 'Operacion', 'Insertar Periodo', '1000');
INSERT INTO `parametro` VALUES ('12', '1100', '12', 'Operacion', 'Modificar Periodo', '1000');
INSERT INTO `parametro` VALUES ('13', '1100', '13', 'Operacion', 'Eliminar periodo', '1000');
INSERT INTO `parametro` VALUES ('14', '1100', '14', 'Operacion', 'Insertar Empresa', '1000');
INSERT INTO `parametro` VALUES ('15', '1100', '15', 'Operacion', 'Modicar Empresa', '1000');
INSERT INTO `parametro` VALUES ('16', '1100', '16', 'Operacion', 'Eliminar Empresa', '1000');
INSERT INTO `parametro` VALUES ('1', '1001', '01', 'DOCUMENTO IDENTIDAD', 'TIPO DE DOCUMENTO IDENTIDAD', '0');
INSERT INTO `parametro` VALUES ('2', '1001', '0101', 'DNI', 'DOCUMENTO NACIONAL DE IDENTIDAD', '1000');
INSERT INTO `parametro` VALUES ('3', '1001', '0102', 'LB', 'LIBRETA MILITAR', '1000');
INSERT INTO `parametro` VALUES ('4', '1001', '0103', 'CE', 'CARNET DE EXTRANJERIA', '1000');
INSERT INTO `parametro` VALUES ('5', '1001', '0104', 'P', 'PASAPORTE', '1000');
INSERT INTO `parametro` VALUES ('2', '1002', '0202', 'F', 'FEMENINO', '1000');
INSERT INTO `parametro` VALUES ('0', '1002', '02', 'SEXO', 'TIPO SEXO', '0');
INSERT INTO `parametro` VALUES ('1', '1002', '0201', 'M', 'MASCULINO', '1000');
INSERT INTO `parametro` VALUES ('6', '2065', '1006', 'LUGAR DE ARRIBO', 'LUGAR DE ARRIBO', '1000');
INSERT INTO `parametro` VALUES ('900305', '5000', '900305', 'xajax_Listar_Caracteristicas_Especies(0,20,1,1);', 'Caracteristicas', '1000');
INSERT INTO `parametro` VALUES ('0', '1004', '10', 'TIPO DE TELEFONO', '.::.TIPO DE TELEFONO.::.', '0');
INSERT INTO `parametro` VALUES ('1', '1004', '1001', 'C', 'CELULAR', '1000');
INSERT INTO `parametro` VALUES ('7', '2065', '1007', 'FECHA DE ARRIBO', 'FECHA DE ARRIBO', '1000');
INSERT INTO `parametro` VALUES ('6', '1001', '0105', 'L', 'LICENCIA', '1001');
INSERT INTO `parametro` VALUES ('1', '1005', '10', 'RELACION EMPRESA', 'TIPO DE RELACION CON EMPRESA', '0');
INSERT INTO `parametro` VALUES ('2', '1005', '1001', 'CONDUCTOR', 'CONDUCTOR', '1000');
INSERT INTO `parametro` VALUES ('7', '1001', '0106', 'R', 'RUC', '1002');
INSERT INTO `parametro` VALUES ('1', '1006', '1001', 'Agricultura, Ganadería Caza y Silvicultura', 'Agricultura, Ganadería Caza y Silvicultura', '1000');
INSERT INTO `parametro` VALUES ('2', '1007', '0102', 'LUCES Y GRIPERÍA PROFESIONAL ', 'LUCES Y GRIPERÍA PROFESIONAL ', '1000');
INSERT INTO `parametro` VALUES ('0', '1010', '01', 'Productos', 'Productos', '0');
INSERT INTO `parametro` VALUES ('1', '1010', '0101', 'RED EPIC X', 'RED EPIC X', '1000');
INSERT INTO `parametro` VALUES ('3', '1005', '1002', 'REP LEGAL', 'REPRESENTANTE LEGAL', '1000');
INSERT INTO `parametro` VALUES ('2', '1006', '1002', 'Pesca', 'Pesca', '1000');
INSERT INTO `parametro` VALUES ('3', '1006', '1003', 'Explotación de Minas y Canteras', 'Explotación de Minas y Canteras', '1000');
INSERT INTO `parametro` VALUES ('8', '5000', '2001', 'MNUADMPER', 'Persona', '1000');
INSERT INTO `parametro` VALUES ('10', '5000', '20010101', 'xajax_MostrarPersonas(0,20,1,1)', 'PersNatOtro', '1000');
INSERT INTO `parametro` VALUES ('9', '5000', '200101', 'xajax_MostrarPersonas(0,20,1,1)', 'Persona Natural', '1000');
INSERT INTO `parametro` VALUES ('36', '1100', '35', 'Operacion', 'Ingreso al Sistema', '1000');
INSERT INTO `parametro` VALUES ('11', '5000', '200102', 'xajax_MostrarPersonas(0,20,1,1)', 'Persona Juridica', '1000');
INSERT INTO `parametro` VALUES ('12', '5000', '20010201', 'xajax_MostrarJuridicas(0,20,1,1)', 'PersJurOtro', '1000');
INSERT INTO `parametro` VALUES ('906020104', '5001', '9006020104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906020105', '5001', '9006020105', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('2', '1004', '1002', 'F', 'FIJO', '1000');
INSERT INTO `parametro` VALUES ('0', '1007', '01', 'Categorias', 'Categorias', '0');
INSERT INTO `parametro` VALUES ('1', '1007', '0101', 'CÁMARAS Y OPTICAS PROFESIONALES', 'CÁMARAS Y OPTICAS PROFESIONALES', '1000');
INSERT INTO `parametro` VALUES ('2', '1010', '0102', 'CANON 5D MARK II', 'CANON 5D MARK II', '1000');
INSERT INTO `parametro` VALUES ('7', '5004', '1007', 'frmadminweb.php', 'Modulo de Administracion Web', '1000');
INSERT INTO `parametro` VALUES ('0', '5004', '10', 'MODULOS', 'MODULOS', '0');
INSERT INTO `parametro` VALUES ('0', '1018', '01', 'COMPROBANTE', 'COMPROBANTE', '0');
INSERT INTO `parametro` VALUES ('1', '1018', '0101', 'FACTURA', 'FACTURA', '1000');
INSERT INTO `parametro` VALUES ('2', '1018', '0102', 'BOLETA', 'BOLETA', '1000');
INSERT INTO `parametro` VALUES ('906020103', '5001', '9006020103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('900602', '5000', '900602', '', 'Detalle Persona', '1000');
INSERT INTO `parametro` VALUES ('9060201', '5000', '90060201', 'xajax_Configurar_ParametroAbr(1003)', 'Estado Civil ', '1000');
INSERT INTO `parametro` VALUES ('906020101', '5001', '9006020101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906020102', '5001', '9006020102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('3', '1007', '0103', 'ACCESORIOS', 'ACCESORIOS', '1000');
INSERT INTO `parametro` VALUES ('4', '1007', '0104', 'AUDIO PROFESIONAL', 'AUDIO PROFESIONAL', '1000');
INSERT INTO `parametro` VALUES ('5', '2040', '0011', '00000000000000', 'PIMENTEL', '1000');
INSERT INTO `parametro` VALUES ('3', '1004', '1003', 'R', 'RPM', '1000');
INSERT INTO `parametro` VALUES ('9060202', '5000', '90060202', 'xajax_Configurar_ParametroAbr(1004)', 'Tipo Telefono ', '1000');
INSERT INTO `parametro` VALUES ('906020201', '5001', '9006020201', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906020202', '5001', '9006020202', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('906020203', '5001', '9006020203', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('906020204', '5001', '9006020204', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906020205', '5001', '9006020205', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('10', '2067', '1010', 'DETALLE DE PRECIO DEL ARTE DE PESCA', 'DETALLE DE PRECIO DEL ARTE DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('900108', '5000', '900108', 'xajax_Listar_Embarcaciones(0,20,1,1);', 'Embarcación', '1000');
INSERT INTO `parametro` VALUES ('90010801', '5001', '90010801', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90010802', '5001', '90010802', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('6', '2037', '0011', 'ADM', 'ADMINISTRADOR', '1000');
INSERT INTO `parametro` VALUES ('1', '2037', '0011', 'ESPECIAL', 'ESPECIAL', '0');
INSERT INTO `parametro` VALUES ('0', '2037', '10', '::: ROLES:::', '::: ROLES:::', '0');
INSERT INTO `parametro` VALUES ('2', '2037', '0011', 'PUBLICO', 'PUBLICO', '1000');
INSERT INTO `parametro` VALUES ('3', '2037', '0011', 'INVITADO', 'INVITADO', '1000');
INSERT INTO `parametro` VALUES ('4', '2037', '0011', 'REGIST.', 'REGISTRADO', '1000');
INSERT INTO `parametro` VALUES ('0', '2038', '10', 'GRUPO', '::: GRUPOS :::', '0');
INSERT INTO `parametro` VALUES ('5', '2037', '0011', 'RN', 'ROL NUEVO', '0');
INSERT INTO `parametro` VALUES ('1', '2066', '0011', 'FICHA 2', 'FICHA 2', '1000');
INSERT INTO `parametro` VALUES ('2', '2066', '0011', 'FICHA 2', 'FICHA 2', '1000');
INSERT INTO `parametro` VALUES ('7', '2040', '0011', 'JJJ', 'CHICLAYO', '1000');
INSERT INTO `parametro` VALUES ('12', '2052', '0011', '0000005', 'MALLA', '1000');
INSERT INTO `parametro` VALUES ('7', '2037', '0011', 'R10', 'ROL 10', '0');
INSERT INTO `parametro` VALUES ('8', '2037', '0011', 'R11', 'ROL 11', '0');
INSERT INTO `parametro` VALUES ('9', '2037', '0011', 'R123', 'ROLLES 122', '0');
INSERT INTO `parametro` VALUES ('10', '2037', '0011', 'R13', 'ROL 13', '0');
INSERT INTO `parametro` VALUES ('1', '2038', '0011', 'GA', 'GRUPO A', '1000');
INSERT INTO `parametro` VALUES ('2', '2038', '0011', 'GC', 'GRUPO C', '1000');
INSERT INTO `parametro` VALUES ('3', '2038', '0011', 'GB', 'GRUPO B', '1000');
INSERT INTO `parametro` VALUES ('4', '2038', '0011', 'G_D', 'GRUPO D', '0');
INSERT INTO `parametro` VALUES ('5', '2038', '0011', 'ADMIN', 'ADMINISTRADOR', '0');
INSERT INTO `parametro` VALUES ('6', '2038', '0011', 'ADMIN', 'ADMINISTRADORES', '1000');
INSERT INTO `parametro` VALUES ('11', '2037', '0011', 'SPU 1', 'SUPER USUARIO 1', '1000');
INSERT INTO `parametro` VALUES ('12', '2037', '0011', 'SPU 2', 'SUPER USUARIO 2', '1000');
INSERT INTO `parametro` VALUES ('13', '2037', '0011', 'REGISTRO DE EMBARCACIONES', 'REGISTRO DE EMBARCACIONES', '1000');
INSERT INTO `parametro` VALUES ('90', '5000', '90', 'MENUS SISTEMA WEB', 'MENUS SISTEMA WEB', '0');
INSERT INTO `parametro` VALUES ('9001', '5000', '9001', 'MAESTROS', 'Caract. de Pesqueria', '1000');
INSERT INTO `parametro` VALUES ('90010101', '5001', '90010101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('900101', '5000', '900101', 'xajax_Configurar_Parametro(2040);', 'Sitios de Desembarque', '1000');
INSERT INTO `parametro` VALUES ('90010102', '5001', '90010102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90010103', '5001', '90010103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('0', '2040', '10', 'SITIO DE DESEMBARQUE', '.::SITIOS DE DESSEMBARCACIÓN::.', '0');
INSERT INTO `parametro` VALUES ('4', '2040', '0011', '00323FD', 'SAN JOSE', '1000');
INSERT INTO `parametro` VALUES ('2', '2040', '0011', '0000SA', 'SANTA ROSA', '1000');
INSERT INTO `parametro` VALUES ('3', '2040', '0011', '00003-E', 'PIMÉNTEL', '0');
INSERT INTO `parametro` VALUES ('11', '2052', '0011', '000020', 'ALAMBRES', '1000');
INSERT INTO `parametro` VALUES ('90010104', '5001', '90010104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('3', '2051', '0011', 'N. INGLÉS', 'NOMBRE INGLÉS', '1000');
INSERT INTO `parametro` VALUES ('4', '2051', '0011', 'T. COMERCIAL', 'TAMAÑO COMERCIAL', '1000');
INSERT INTO `parametro` VALUES ('5', '2051', '0011', 'FOTOGRAFÍA', 'FOTOGRAFÍA', '2000');
INSERT INTO `parametro` VALUES ('6', '2051', '0011', 'HÁBITAT', 'HÁBITAT', '1000');
INSERT INTO `parametro` VALUES ('0', '2043', '10', 'ESPECIE', '.::. ESPECIES .::.', '0');
INSERT INTO `parametro` VALUES ('3', '2065', '1003', 'HORA DE ZARPE', 'HORA DE ZARPE', '1000');
INSERT INTO `parametro` VALUES ('2', '2065', '1002', 'FECHA DE ZARPE', 'FECHA DE ZARPE', '1000');
INSERT INTO `parametro` VALUES ('0', '2042', '10', 'EMBARCACIONES', '.::. EMBARCACIONES .::.', '0');
INSERT INTO `parametro` VALUES ('900103', '5000', '900105', 'xajax_Configurar_Parametro(2041);', 'Aparejos  Pesca', '1000');
INSERT INTO `parametro` VALUES ('90010301', '5001', '90010301', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90010302', '5001', '90010302', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90010303', '5001', '90010303', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90010304', '5001', '90010304', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('1', '2041', '0011', '00001-AP', 'ALMADRABA', '1000');
INSERT INTO `parametro` VALUES ('2', '2041', '0011', '00005-AP', 'TRASMALLO', '1000');
INSERT INTO `parametro` VALUES ('3', '2041', '0011', 'MSS0034', 'RED CORTA', '100');
INSERT INTO `parametro` VALUES ('4', '2041', '0011', 'HS3848', 'ATARRALLA', '100');
INSERT INTO `parametro` VALUES ('0', '2044', '10', 'ZONAS DE PESCA ', '.::. SITIOS / ZONAS  DE PESCA  .::.', '0');
INSERT INTO `parametro` VALUES ('0', '2045', '10', '.::. ACTIVIDADES ECONÓMICAS  .::.', '.::. ACTIVIDADES ECONÓMICAS  .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2032', '1001', 'RD03', 'RED CORTA', '1000');
INSERT INTO `parametro` VALUES ('2', '2032', '1002', 'DM447D', 'RED CON PLOMÓ', '1000');
INSERT INTO `parametro` VALUES ('0', '2046', '10', 'TIPOS Y TÉCNICAS DE PESCA', '.::. TIPOS Y TÉCNICAS DE PESCA  .::.', '0');
INSERT INTO `parametro` VALUES ('900106', '5000', '900106', 'xajax_Configurar_Parametro(2046);', 'Tipo Pesca', '1000');
INSERT INTO `parametro` VALUES ('90010601', '5001', '90010601', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90010602', '5001', '90010602', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90010603', '5001', '90010603', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90010604', '5001', '90010604', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('1', '2046', '0011', 'PB00001', 'PESCA DE BAJURA', '1000');
INSERT INTO `parametro` VALUES ('2', '2046', '0011', 'PA00002', 'PESCA DE ALTURA', '1000');
INSERT INTO `parametro` VALUES ('3', '2046', '0011', 'PGA00004', 'PESCA DE GRAN ALTURA', '1000');
INSERT INTO `parametro` VALUES ('4', '2046', '0011', 'PA00005', 'PESCA ARTÉSANAL', '1000');
INSERT INTO `parametro` VALUES ('5', '2046', '0011', 'PA00007', 'PESCA INDUSTRIAL', '1000');
INSERT INTO `parametro` VALUES ('6', '2046', '0011', 'ASDADDDDDDDDDDDDDDD', 'ASDAS', '0');
INSERT INTO `parametro` VALUES ('8', '2065', '1008', 'HORA DE ARRIBO', 'HORA DE ARRIBO', '1000');
INSERT INTO `parametro` VALUES ('9002', '5000', '9002', 'MAESTROS', 'Persona', '1000');
INSERT INTO `parametro` VALUES ('900201', '5000', '900201', 'xajax_Listar_Pescadores(0,20,1,1)', 'Pescador', '1000');
INSERT INTO `parametro` VALUES ('90020101', '5001', '90020101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90020102', '5001', '90020102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90020103', '5001', '90020103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90020104', '5001', '90020104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('900104', '5000', '900103', 'xajax_Listar_Zonas_Pesca(0,20,1,1);', 'Zonas de Pesca', '1000');
INSERT INTO `parametro` VALUES ('90010401', '5001', '90010401', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90010402', '5001', '90010402', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90010403', '5001', '90010403', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90010404', '5001', '90010404', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('1', '2044', '0011', 'SAN', 'SAN JOSÉ', '1000');
INSERT INTO `parametro` VALUES ('2', '2044', '0011', 'SA', 'SANTA ROSA', '1000');
INSERT INTO `parametro` VALUES ('3', '2044', '0011', 'PI', 'PIMENTEL', '1000');
INSERT INTO `parametro` VALUES ('4', '2044', '0011', 'MO', 'MONSEFÚ', '1000');
INSERT INTO `parametro` VALUES ('5', '2044', '0011', 'MOS', 'ZONA2', '1000');
INSERT INTO `parametro` VALUES ('10', '2050', '0011', '0000-23', 'OTROS 2', '1000');
INSERT INTO `parametro` VALUES ('8', '2050', '0011', '00007-GF', 'CAMARON GENERO', '1000');
INSERT INTO `parametro` VALUES ('0', '2049', '10', 'FAMILA', '.::.  FAMILAS DE PECES ::.', '0');
INSERT INTO `parametro` VALUES ('90030404', '5001', '90030404', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('0', '2051', '10', '.::.  CARACTERISTICA DE ESPECIES  ::.', '.::.  CARACTERISTICA DE ESPECIES  ::.', '0');
INSERT INTO `parametro` VALUES ('1', '2051', '0011', 'N. CIENTIFICO', 'NOMBRE CIENTIFICO', '1000');
INSERT INTO `parametro` VALUES ('2', '2051', '0011', 'N. COMUN', 'NOMBRE COMUN', '1000');
INSERT INTO `parametro` VALUES ('1', '2049', '0011', '001', 'NATICIDAE', '1000');
INSERT INTO `parametro` VALUES ('3', '2049', '0011', '003', 'SERRANIDAE', '1000');
INSERT INTO `parametro` VALUES ('2', '2049', '0011', '002', 'OCYPOPIDAE', '1000');
INSERT INTO `parametro` VALUES ('4', '2049', '0011', '0023.324', 'FAM2222', '0');
INSERT INTO `parametro` VALUES ('90030403', '5001', '90030403', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('900304', '5000', '900304', 'xajax_Listar_Detalle_Especies(0,20,1,1)', 'Detalle Especies', '1000');
INSERT INTO `parametro` VALUES ('90030401', '5001', '90030401', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90030402', '5001', '90030402', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('9003', '5000', '9003', 'MAESTROS', 'Especies', '1000');
INSERT INTO `parametro` VALUES ('900301', '5000', '900301', 'xajax_Configurar_Parametro(2049);', 'Familias', '1000');
INSERT INTO `parametro` VALUES ('90030101', '5001', '90030101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90030102', '5001', '90030102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90030103', '5001', '90030103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90030104', '5001', '90030104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('900302', '5000', '900302', 'xajax_Listar_Generos(0,20,1,1)', 'Generos', '1000');
INSERT INTO `parametro` VALUES ('90030201', '5001', '90030201', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90030202', '5001', '90030202', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90030203', '5001', '90030203', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('1', '2050', '0011', '00001-GF', 'ACRYBIA', '1000');
INSERT INTO `parametro` VALUES ('2', '2050', '0011', '00002-GF', 'AMAUROPSIS', '1000');
INSERT INTO `parametro` VALUES ('3', '2050', '0011', '00003-GF', 'BULBUS', '1000');
INSERT INTO `parametro` VALUES ('4', '2050', '0011', '00004-GF', 'CALINATICINA', '1000');
INSERT INTO `parametro` VALUES ('5', '2050', '0011', '00005-GF', 'AMISSIDENS', '1000');
INSERT INTO `parametro` VALUES ('0', '2050', '10', 'GENEROS ESPECIES', '.::.  GENEROS ESPECIES  ::.', '0');
INSERT INTO `parametro` VALUES ('6', '2050', '0011', '00006-GF', 'AMPHIARIUS', '1000');
INSERT INTO `parametro` VALUES ('90030204', '5001', '90030204', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('7', '2049', '0011', '005', 'SCIAENIDAE', '1000');
INSERT INTO `parametro` VALUES ('900303', '5000', '900303', 'xajax_Listar_Especies(0,20,1,1)', 'Especies', '1000');
INSERT INTO `parametro` VALUES ('90030301', '5001', '90030301', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90030302', '5001', '90030302', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90030303', '5001', '90030303', 'detalle.gif', 'Carracteriscas', '1000');
INSERT INTO `parametro` VALUES ('90030304', '5001', '90030304', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('6', '2049', '0011', '006', 'CANCRIDAE', '1000');
INSERT INTO `parametro` VALUES ('7', '2050', '0011', '4444444', '2323443SDADSSD', '0');
INSERT INTO `parametro` VALUES ('9', '2050', '0011', '000006', 'OTROS1', '1000');
INSERT INTO `parametro` VALUES ('8', '2049', '0011', '007', 'MYTILIDAE', '1000');
INSERT INTO `parametro` VALUES ('9', '2049', '0011', '008', 'ENGRAULIDAE', '1000');
INSERT INTO `parametro` VALUES ('10', '2049', '0011', '009', 'HAEMULIDAE', '1000');
INSERT INTO `parametro` VALUES ('11', '2049', '0011', '010', 'ARIIDAE', '1000');
INSERT INTO `parametro` VALUES ('12', '2049', '0011', '011', 'SYNGNATHIDAE', '1000');
INSERT INTO `parametro` VALUES ('13', '2049', '0011', '012', 'SICYONIIDAE', '1000');
INSERT INTO `parametro` VALUES ('14', '2049', '0011', '013', 'OPHICHTHIDAE', '1000');
INSERT INTO `parametro` VALUES ('15', '2049', '0011', '014', 'SCOMBRIDAE', '1000');
INSERT INTO `parametro` VALUES ('16', '2049', '0011', '015', 'NUEVO FAMILIA', '1000');
INSERT INTO `parametro` VALUES ('17', '2049', '0011', '016', 'NUEVA FAMILIA 2', '1000');
INSERT INTO `parametro` VALUES ('6', '2040', '0011', '00003', 'PUERTO ETÉN', '1000');
INSERT INTO `parametro` VALUES ('6', '2044', '0011', '000002', 'DOS TETAS', '1000');
INSERT INTO `parametro` VALUES ('5', '2041', '0011', '00002-AP', 'PALANGRE', '1000');
INSERT INTO `parametro` VALUES ('6', '2041', '0011', '00004-AP', 'PESCA DE ARRASTRE', '1000');
INSERT INTO `parametro` VALUES ('8', '2041', '11', '00006-AP', 'ALMORREFA', '1000');
INSERT INTO `parametro` VALUES ('9', '2041', '11', '00007-AP', 'Tirar l\'art', '1000');
INSERT INTO `parametro` VALUES ('10', '2041', '11', '00008-AP', 'Retel', '1000');
INSERT INTO `parametro` VALUES ('11', '2041', '11', '00001-AP', 'BOLICHE', '1000');
INSERT INTO `parametro` VALUES ('12', '2041', '11', '00001-AP', 'Pesca al coup', '1000');
INSERT INTO `parametro` VALUES ('13', '2041', '11', '00001-AP', 'ALMADRABA', '0');
INSERT INTO `parametro` VALUES ('14', '2041', '11', '00001-AP', 'Tarrafa', '1000');
INSERT INTO `parametro` VALUES ('15', '2041', '11', '00001-AP', 'CHINCHORRO (PESCA)', '1000');
INSERT INTO `parametro` VALUES ('16', '2041', '11', '00001-AP', 'PESCA CON CARRO VALENCIANO', '1000');
INSERT INTO `parametro` VALUES ('17', '2041', '11', '00001-AP', 'Pesca con cianuro', '1000');
INSERT INTO `parametro` VALUES ('18', '2041', '11', '00001-AP', 'Pesca con explosivos', '1000');
INSERT INTO `parametro` VALUES ('19', '2041', '11', '00001-AP', 'ARPÓN', '1000');
INSERT INTO `parametro` VALUES ('20', '2041', '11', '00001-AP', 'Nasa (pesca)', '1000');
INSERT INTO `parametro` VALUES ('21', '2041', '11', '00001-AP', 'Pesca con piedra', '1000');
INSERT INTO `parametro` VALUES ('22', '2041', '11', '00022-AP', 'PESCA CON CAÑA', '1000');
INSERT INTO `parametro` VALUES ('23', '2041', '11', '00001-AP', 'CUCHARILLA', '1000');
INSERT INTO `parametro` VALUES ('24', '2041', '11', '00001-AP', 'Pesca con mosca', '1000');
INSERT INTO `parametro` VALUES ('11', '2050', '0011', '0003-G', 'ANISOTREMUS', '1000');
INSERT INTO `parametro` VALUES ('7', '2051', '0011', 'DISTRIBUCIÓN GEOG.', 'DISTRIBUCIÓN GEOG.', '1000');
INSERT INTO `parametro` VALUES ('90010305', '5001', '90010305', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('90010105', '5001', '90010105', 'boton-reporte', 'Reporte', '1000');
INSERT INTO `parametro` VALUES ('90010405', '5001', '90010405', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('0', '2052', '10', ' ARTE DE PESCA', '.::.  ARTE DE PESCA .::.', '0');
INSERT INTO `parametro` VALUES ('900107', '5000', '900104', ' xajax_Configurar_Parametro(2052);', 'Arte de Pesca', '1000');
INSERT INTO `parametro` VALUES ('90010701', '5001', '90010701', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90010702', '5001', '90010702', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90010703', '5001', '90010703', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90010704', '5001', '90010704', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('90010705', '5001', '90010705', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('1', '2052', '0011', '00001', 'CORTINA', '1000');
INSERT INTO `parametro` VALUES ('2', '2052', '0011', '0002', 'CERCA', '1000');
INSERT INTO `parametro` VALUES ('3', '2052', '0011', '00004', 'ARRASTRE', '1000');
INSERT INTO `parametro` VALUES ('4', '2052', '0011', '00005', 'ALMÁDRABA', '1000');
INSERT INTO `parametro` VALUES ('5', '2052', '0011', '00003', 'TARRAFA', '1000');
INSERT INTO `parametro` VALUES ('90010605', '5001', '90010605', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('90030105', '5001', '90030105', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('90030205', '5001', '90030205', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('90030305', '5001', '90030305', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('9004', '5000', '9004', 'MAESTROS', 'Permisos', '1000');
INSERT INTO `parametro` VALUES ('900401', '5000', '900401', 'xajax_Mostrar_Roles(0,20,1,1)', 'Roles', '1000');
INSERT INTO `parametro` VALUES ('90040101', '5001', '90040101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90040102', '5001', '90040102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90040103', '5001', '90040103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90040104', '5001', '90040104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('90040105', '5001', '90040105', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('900402', '5000', '900402', 'xajax_Mostrar_Grupos(0,20,1,1)', 'Grupos', '1000');
INSERT INTO `parametro` VALUES ('90040201', '5001', '90040201', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90040202', '5001', '90040202', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90040203', '5001', '90040203', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90040204', '5001', '90040204', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('90040205', '5001', '90040205', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('90020105', '5001', '90020105', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('90030501', '5001', '90030501', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90030502', '5001', '90030502', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90030503', '5001', '90030503', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90030504', '5001', '90030504', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('90030505', '5001', '90030505', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('900403', '5000', '900403', 'xajax_Mostrar_Grupos_Permisos(0,20,1,1)', 'Grupo - Permisos', '1000');
INSERT INTO `parametro` VALUES ('90040301', '5001', '90040301', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90040302', '5001', '90040302', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90040303', '5001', '90040303', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90040304', '5001', '90040304', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('9005', '5000', '9005', 'MAESTROS', 'Fichas de Registro', '1000');
INSERT INTO `parametro` VALUES ('90050101', '5001', '90050101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('900501', '5000', '900501', 'xajax_Mostrar_Ficha1(0,20,1,1)', 'Biomasa - Tabla 1', '1000');
INSERT INTO `parametro` VALUES ('900502', '5000', '900502', 'xajax_Mostrar_Ficha2(0,20,1,1)', 'Flota Pesquera - Tabla 6', '1000');
INSERT INTO `parametro` VALUES ('90050201', '5001', '90050201', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('0', '1003', '1', 'ESTADO CIVIL', '.::ESTADO CIVIL (CONYUGAL)::.', '0');
INSERT INTO `parametro` VALUES ('1', '1003', '102', 'SOLTERO', 'SOLTERO', '1000');
INSERT INTO `parametro` VALUES ('2', '1003', '101', 'CASADO', 'CASADO', '1000');
INSERT INTO `parametro` VALUES ('3', '1003', '104', 'VIUDO', 'VIUDO', '1000');
INSERT INTO `parametro` VALUES ('4', '1003', '105', 'DIVORCIADO', 'DIVORCIADO', '1000');
INSERT INTO `parametro` VALUES ('5', '1003', '103', 'CONVIVIENTE', 'CONVIVIENTE', '1000');
INSERT INTO `parametro` VALUES ('0', '2053', '10', '.::. CARACTERISTICA DE EMBARCACIÓN .::.', '.::. CARACTERISTICA DE EMBARCACIÓN .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2053', '1001', 'MATRICULA...', 'MATRICULA', '1000');
INSERT INTO `parametro` VALUES ('2', '2053', '1002', 'DIMENSIONES', 'DIMENSIONES', '1000');
INSERT INTO `parametro` VALUES ('3', '2053', '1003', 'CAPACIDAD DE BODEGA', 'CAPACIDAD DE BODEGA', '1000');
INSERT INTO `parametro` VALUES ('4', '2053', '1004', 'MATERIAL DE CONSTRUCCION', 'MATERIAL DE CONSTRUCCION', '1000');
INSERT INTO `parametro` VALUES ('5', '2053', '1005', 'CONDICIONES DE ADQUISICIÓN', 'CONDICIONES DE ADQUISICIÓN', '1000');
INSERT INTO `parametro` VALUES ('6', '2053', '1006', 'AÑOS', 'AÑOS', '1000');
INSERT INTO `parametro` VALUES ('7', '2053', '1007', 'PRECIOS', 'PRECIOS', '1000');
INSERT INTO `parametro` VALUES ('8', '2053', '1008', 'FORMA DE COMPRA', 'FORMA DE COMPRA', '1000');
INSERT INTO `parametro` VALUES ('9', '2053', '1009', 'TIEMPO DE VIDA UTIL', 'TIEMPO DE VIDA UTIL', '1000');
INSERT INTO `parametro` VALUES ('10', '2053', '1010', 'EQUIPOS', 'EQUIPOS', '1000');
INSERT INTO `parametro` VALUES ('11', '2053', '1011', 'TIPO DE EMBARCACIÓN', 'TIPO DE EMBARCACIÓN', '1000');
INSERT INTO `parametro` VALUES ('12', '2053', '1012', 'MOTOR', 'MOTOR', '1000');
INSERT INTO `parametro` VALUES ('13', '2053', '1012', 'TRIPULACIÓN', 'TRIPULACIÓN', '1000');
INSERT INTO `parametro` VALUES ('17', '2053', '1017', 'CARACTERISTICAS DE ARTE DE PESCA', 'CARACTERISTICAS DE ARTE DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('0', '2054', '10', '.:: CONDICIONES AMBIENTALES ::.', '.:: CONDICIONES AMBIENTALES ::.', '0');
INSERT INTO `parametro` VALUES ('1', '2054', '1001', 'Mar', 'Mar', '1000');
INSERT INTO `parametro` VALUES ('2', '2054', '1002', 'Corriente', 'Corriente', '1000');
INSERT INTO `parametro` VALUES ('3', '2054', '1003', 'Viento', 'Viento', '1000');
INSERT INTO `parametro` VALUES ('4', '2054', '1004', 'Temperatura', 'Temperatura', '1000');
INSERT INTO `parametro` VALUES ('0', '2055', '10', '.::. DIMENSIONES .::.', '.::. DIMENSIONES .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2055', '1001', 'ESLORA', 'ESLORA', '1000');
INSERT INTO `parametro` VALUES ('2', '2055', '1002', 'MANGA', 'MANGA', '1000');
INSERT INTO `parametro` VALUES ('3', '2055', '1003', 'PUNTAL', 'PUNTAL', '1000');
INSERT INTO `parametro` VALUES ('0', '2056', '10', '.::. CAPACIDAD DE BODEGAS .::.', '.::. CAPACIDAD DE BODEGAS .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2056', '1001', 'CAPACIDAD DE BODEGAS', 'CAPACIDAD DE BODEGAS', '1000');
INSERT INTO `parametro` VALUES ('2', '2056', '1002', 'TRB', 'TRB', '1000');
INSERT INTO `parametro` VALUES ('3', '2056', '1003', 'TRN', 'TRN', '1000');
INSERT INTO `parametro` VALUES ('0', '2057', '10', '.::. CONDICIONES DE ADQUISICION .::.', '.::. CONDICIONES DE ADQUISICION.::.', '0');
INSERT INTO `parametro` VALUES ('1', '2057', '1001', 'HERENCIA', 'HERENCIA', '1000');
INSERT INTO `parametro` VALUES ('2', '2057', '1002', 'CONSTRUCCIÓN', 'CONSTRUCCIÓN', '1000');
INSERT INTO `parametro` VALUES ('3', '2057', '1003', 'COMPRA', 'COMPRA', '1000');
INSERT INTO `parametro` VALUES ('0', '2058', '10', '.::. FORMA DE COMPRA .::.', '.::. FORMA DE COMPRA.::.', '0');
INSERT INTO `parametro` VALUES ('1', '2058', '1001', 'CONTADO', 'HERENCIA', '1000');
INSERT INTO `parametro` VALUES ('2', '2058', '1002', 'CREDITO', 'CONSTRUCCIÓN', '1000');
INSERT INTO `parametro` VALUES ('0', '2059', '10', '.::. EQUIPOS .::.', '.::. EQUIPOS .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2059', '1001', 'NAVEGADOR', 'NAVEGADOR', '1000');
INSERT INTO `parametro` VALUES ('2', '2059', '1002', 'ECOSONDA', 'ECOSONDA', '1000');
INSERT INTO `parametro` VALUES ('3', '2059', '1003', 'RADIO', 'RADIO', '1000');
INSERT INTO `parametro` VALUES ('4', '2059', '1004', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro` VALUES ('0', '2060', '10', '.::. TIPO DE EMBARCACIÓN .::.', '.::. TIPO DE EMBARCACIÓN .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2060', '1001', 'NO MECANIZADO', 'NO MECANIZADO', '1000');
INSERT INTO `parametro` VALUES ('2', '2060', '1002', 'MECANIZADO INTERIOR', 'MECANIZADO INTERIOR', '1000');
INSERT INTO `parametro` VALUES ('3', '2060', '1003', 'FUERA DE BORDA', 'FUERA DE BORDA', '1000');
INSERT INTO `parametro` VALUES ('0', '2061', '10', '.::. CARACTERISTICAS DE MOTOR .::.', '.::. CARACTERISTICAS DE MOTOR .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2061', '1001', 'MARCA', 'MARCA', '1000');
INSERT INTO `parametro` VALUES ('2', '2061', '1002', 'HP', 'HP', '1000');
INSERT INTO `parametro` VALUES ('3', '2061', '1003', 'ESTADO DEL MOTOR', 'ESTADO DEL MOTOR', '1000');
INSERT INTO `parametro` VALUES ('0', '2062', '10', '.:: AÑOS ::.', '.:: AÑOS ::.', '0');
INSERT INTO `parametro` VALUES ('1', '2062', '1001', 'ADQUISICION DE EMBARCACION', 'ADQUISICION DE EMBARCACION', '1000');
INSERT INTO `parametro` VALUES ('2', '2062', '1002', 'USO DE LA EMBARCACION', 'USO DE LA EMBARCACION', '1000');
INSERT INTO `parametro` VALUES ('3', '2062', '1003', 'ADQUISICION DEL MOTOR', 'ADQUISICION DEL MOTOR', '1000');
INSERT INTO `parametro` VALUES ('4', '2062', '1004', 'USO DEL MOTOR', 'USO DEL MOTOR', '1000');
INSERT INTO `parametro` VALUES ('0', '2063', '10', '.::. PRECIOS DE COMPRA EMBARCACIÓN .::.', '.::. PRECIOS DE COMPRA EMBARCACIÓN .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2063', '1001', 'PRECIO DE COMPRA DE EMBARCACIÓN', 'PRECIO DE COMPRA DE EMBARCACIÓN', '1000');
INSERT INTO `parametro` VALUES ('2', '2063', '1002', 'PRECIO DE COMPRA DE MOTOR DE EMBARCACIÓN', 'PRECIO DE COMPRA DE MOTOR DE EMBARCACIÓN', '1000');
INSERT INTO `parametro` VALUES ('0', '2064', '10', '.::. CARACTERISTICAS DE ARTE DE PESCA .::.', '.::. CARACTERISTICAS DE ARTE DE PESCA .::.', '0');
INSERT INTO `parametro` VALUES ('1', '2064', '1001', 'CARACTERISTICA DE ARTE', 'CARACTERISTICA DE ARTE', '1000');
INSERT INTO `parametro` VALUES ('2', '2064', '1002', 'TIEMPO DE VIDA UTIL DEL ARTE', 'TIEMPO DE VIDA UTIL DEL ARTE', '1000');
INSERT INTO `parametro` VALUES ('3', '2064', '1003', 'PRECIO DEL ARTE DE PESCA', 'PRECIO DEL ARTE DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('0', '2065', '10', '.:: OPERACIÓN DE PESCA ::.', '.:: OPERACIÓN DE PESCA ::.', '0');
INSERT INTO `parametro` VALUES ('1', '2065', '1001', 'LUGAR DE ZARPE', 'LUGAR DE ZARPE', '1000');
INSERT INTO `parametro` VALUES ('90050202', '5001', '90050202', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90050102', '5001', '90050102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('900503', '5000', '900503', 'xajax_Mostrar_Ficha3(0,20,1,1)', 'Socio Económica - Tabla 8', '1000');
INSERT INTO `parametro` VALUES ('90050301', '5001', '90050301', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90050302', '5001', '90050302', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('0', '2066', '10', '.:: FICHAS DE REGISTRO ::.', '.:: FICHAS DE REGISTRO ::.', '0');
INSERT INTO `parametro` VALUES ('1', '2043', '1001', '0001', 'NOMBRE CIENTIFICO ESPECIE', '1000');
INSERT INTO `parametro` VALUES ('9006', '5000', '9006', 'MAESTROS', 'Tablas Maéstras', '1000');
INSERT INTO `parametro` VALUES ('900601', '5000', '900601', 'xajax_Listar_Entidad_Financiera(0,15,1,1)', 'Entidades Finacieras', '1000');
INSERT INTO `parametro` VALUES ('90060101', '5001', '90060101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90060102', '5001', '90060102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('90060103', '5001', '90060103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90060104', '5001', '90060104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('90060105', '5001', '90060105', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('4', '2065', '1004', 'INICIO DE LANZE', 'INICIO DE LANZE', '1000');
INSERT INTO `parametro` VALUES ('5', '2065', '1005', 'FIN DE LANZE', 'FIN DE LANZE', '1000');
INSERT INTO `parametro` VALUES ('0', '1006', '1', '.::RUBRO O ACTIVIDAD COMERCIAL::.', '.::RUBRO O ACTIVIDAD COMERCIAL::.', '0');
INSERT INTO `parametro` VALUES ('4', '1006', '1004', 'Industrias Manufactureras No Metálicas', 'Industrias Manufactureras No Metálicas', '1000');
INSERT INTO `parametro` VALUES ('5', '1006', '1005', 'Industrias Manufactureras Metálicas', 'Industrias Manufactureras Metálicas', '1000');
INSERT INTO `parametro` VALUES ('6', '1006', '1006', 'Suministro de Electricidad, Gas y Agua', 'Suministro de Electricidad, Gas y Agua', '1000');
INSERT INTO `parametro` VALUES ('7', '1006', '1007', 'Construcción', 'Construcción', '1000');
INSERT INTO `parametro` VALUES ('10', '1006', '1010', 'Transporte, Almacenamiento y Comunicaciones', 'Transporte, Almacenamiento y Comunicaciones', '1000');
INSERT INTO `parametro` VALUES ('11', '1006', '1011', 'Intermediación Financiera', 'Intermediación Financiera', '1000');
INSERT INTO `parametro` VALUES ('13', '1006', '1013', 'Adm. Pública y Defensa; Planes de Seg. Social, Afiliación Obligatoria', 'Adm. Pública y Defensa; Planes de Seg. Social, Afiliación Obligatoria', '1000');
INSERT INTO `parametro` VALUES ('1', '2067', '1001', 'Observacion', 'Observacion', '1000');
INSERT INTO `parametro` VALUES ('0', '2067', '10', '.:: CARACTERISTICAS DE LA FICHA ::.', '.:: CARACTERISTICAS DE LA FICHA ::.', '0');
INSERT INTO `parametro` VALUES ('2', '2067', '1002', 'Numero de tripulantes total', 'Numero de tripulantes total', '1000');
INSERT INTO `parametro` VALUES ('3', '2067', '1003', 'Capturas total', 'Capturas total', '1000');
INSERT INTO `parametro` VALUES ('4', '2067', '1004', 'Capturas especies', 'Capturas especies', '1000');
INSERT INTO `parametro` VALUES ('5', '2067', '1005', 'Lugar', 'Lugar', '1000');
INSERT INTO `parametro` VALUES ('6', '2067', '1006', 'ARTE DE PESCA', 'ARTE DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('7', '2067', '1007', 'CARACTERISTICA DE ARTE', 'CARACTERISTICA DE ARTE', '1000');
INSERT INTO `parametro` VALUES ('8', '2067', '1008', 'TIEMPO DE VIDA UTIL DEL ARTE', 'TIEMPO DE VIDA UTIL DEL ARTE', '1000');
INSERT INTO `parametro` VALUES ('9', '2067', '1009', 'PRECIO DEL ARTE DE PESCA', 'PRECIO DEL ARTE DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('0', '2068', '10', '.:::. CARGA FAMILIAR .:::.', '.:::. CARGA FAMILIAR .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2068', '1001', 'ESPOSA', 'ESPOSA', '1000');
INSERT INTO `parametro` VALUES ('2', '2068', '1002', 'HIJOS(NUMERO DE HIJOS)', 'HIJOS(NUMERO DE HIJOS)', '1000');
INSERT INTO `parametro` VALUES ('3', '2068', '1003', 'NUMERO DE HIJOS HOMBRES', 'NUMERO DE HIJOS HOMBRES', '1000');
INSERT INTO `parametro` VALUES ('4', '2068', '1004', 'NUMERO DE HIJOS MUJERES', 'NUMERO DE HIJOS MUJERES', '1000');
INSERT INTO `parametro` VALUES ('5', '2068', '1005', 'EN EDAD ESCOLAR', 'EN EDAD ESCOLAR', '1000');
INSERT INTO `parametro` VALUES ('6', '2068', '1006', 'PADRES', 'PADRES', '1000');
INSERT INTO `parametro` VALUES ('7', '2060', '1007', 'ESPOSO', 'ESPOSO', '1000');
INSERT INTO `parametro` VALUES ('0', '2069', '10', 'GRADO DE INSTRUCCIÓN', '.:::. GRADO DE INSTRUCCIÓN .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2069', '1001', 'NINGUN NIVEL', 'NINGUN NIVEL', '1000');
INSERT INTO `parametro` VALUES ('2', '2069', '1002', 'PRIMARIA', 'PRIMARIA', '1000');
INSERT INTO `parametro` VALUES ('3', '2069', '1003', 'SECUNDARIA', 'SECUNDARIA', '1000');
INSERT INTO `parametro` VALUES ('4', '2069', '1004', 'TÉCNICO', 'TÉCNICO', '1000');
INSERT INTO `parametro` VALUES ('5', '2069', '1005', 'SUPERIOR', 'SUPERIOR', '1000');
INSERT INTO `parametro` VALUES ('0', '2070', '10', '.:::. VIVIENDA UBICACIÓN  .:::.', '.:::. VIVIENDA UBICACIÓN  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2070', '1001', 'ÁREA URBANA', 'ÁREA URBANA', '1000');
INSERT INTO `parametro` VALUES ('2', '2070', '1002', 'ÁREA RURAL', 'ÁREA RURAL', '1000');
INSERT INTO `parametro` VALUES ('0', '2071', '10', '.:::. VIVIENDA CONDICION   .:::.', '.:::. VIVIENDA UBICACIÓN  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2071', '1003', 'PROPIA', 'PROPIA', '1000');
INSERT INTO `parametro` VALUES ('2', '2071', '1004', 'ALQUILADA', 'ALQUILADA', '1000');
INSERT INTO `parametro` VALUES ('3', '2071', '1005', 'USO AUTORIZADO POR EL PROPIETARIO', 'USO AUTORIZADO POR EL PROPIETARIO', '1000');
INSERT INTO `parametro` VALUES ('0', '2072', '10', '.:::. VIVIENDA TIPO  .:::.', '.:::. VIVIENDA TIPO  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2072', '1001', 'CASA INDEPENDIENTE', 'CASA INDEPENDIENTE', '1000');
INSERT INTO `parametro` VALUES ('2', '2072', '1002', 'EN QUINTA', 'EN QUINTA', '1000');
INSERT INTO `parametro` VALUES ('3', '2072', '1003', 'CHOZA', 'CHOZA', '1000');
INSERT INTO `parametro` VALUES ('4', '2072', '1004', 'IMPROVISADA', 'IMPROVISADA', '1000');
INSERT INTO `parametro` VALUES ('0', '2073', '10', '.:::. VIVIENDA OTROS  .:::.', '.:::. VIVIENDA TIPO  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2073', '1005', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro` VALUES ('2', '2073', '1006', 'N° DE HABITACIONES', 'N° DE HABITACIONES', '1000');
INSERT INTO `parametro` VALUES ('0', '2074', '10', '.:::. VIVIENDA MATERIAL  .:::.', '.:::. VIVIENDA MATERIAL  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2074', '1001', 'LADRILLO', 'LADRILLO', '1000');
INSERT INTO `parametro` VALUES ('2', '2074', '1002', 'MADERA', 'MADERA', '1000');
INSERT INTO `parametro` VALUES ('3', '2074', '1003', 'ADOBE', 'ADOBE', '1000');
INSERT INTO `parametro` VALUES ('4', '2074', '1004', 'ESTERA', 'ESTERA', '1000');
INSERT INTO `parametro` VALUES ('5', '2074', '1004', 'QUINCHA', 'QUINCHA', '1000');
INSERT INTO `parametro` VALUES ('6', '2074', '1005', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro` VALUES ('0', '2075', '10', '.:::. VIVIENDA CREDITO  .:::.', '.:::. VIVIENDA CREDITO  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2075', '1001', 'FINANCIADO', 'FINANCIADO', '1000');
INSERT INTO `parametro` VALUES ('2', '2075', '1002', 'NO FINANCIADO', 'NO FINANCIADO', '1000');
INSERT INTO `parametro` VALUES ('0', '2076', '10', '.:::. VIVIENDAS SERVICIOS BASICOS  .:::.', '.:::. VIVIENDAS SERVICIOS BASICOS  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2076', '1001', 'AGUA', 'AGUA', '1000');
INSERT INTO `parametro` VALUES ('2', '2076', '1002', 'LUZ', 'LUZ', '1000');
INSERT INTO `parametro` VALUES ('3', '2076', '1003', 'DESAGUE', 'DESAGUE', '1000');
INSERT INTO `parametro` VALUES ('4', '2076', '1004', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro` VALUES ('5', '2076', '1005', 'TELEFONO', 'TELEFONO', '1000');
INSERT INTO `parametro` VALUES ('0', '2077', '10', '.:::. CARGA FAMILIAR  .:::.', '.:::. CARGA FAMILIAR  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2077', '1001', 'ESPOSO(PESCADOR)', 'ESPOSO(PESCADOR)', '1000');
INSERT INTO `parametro` VALUES ('2', '2077', '1002', 'ESPOSA', 'ESPOSA', '1000');
INSERT INTO `parametro` VALUES ('3', '2077', '1003', 'HIJOS TOTAL', 'HIJOS TOTAL', '1000');
INSERT INTO `parametro` VALUES ('4', '2077', '1004', 'HIJOS MUJERES', 'HIJOS MUJERES', '1000');
INSERT INTO `parametro` VALUES ('5', '2077', '1005', 'HIJOS HOMBRES', 'HIJOS HOMBRES', '1000');
INSERT INTO `parametro` VALUES ('6', '2077', '1006', 'HIJOS EN EDAD ESCOLAR', 'HIJOS EN EDAD ESCOLAR', '1000');
INSERT INTO `parametro` VALUES ('7', '2077', '1007', 'PADRES', 'PADRES', '1000');
INSERT INTO `parametro` VALUES ('0', '2078', '10', 'INGRESOS', '.:::. INGRESOS  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2078', '1001', 'INGRESOS PROMEDIO MENSUAL O POR FAENA DE PESCA', 'INGRESOS PROMEDIO MENSUAL O POR FAENA DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('2', '2078', '1002', 'INGRESOS PROMEDIO MENSUAL POR OTRA ACTIDAD', 'INGRESOS PROMEDIO MENSUAL POR OTRA ACTIDAD', '1000');
INSERT INTO `parametro` VALUES ('0', '2079', '10', 'GASTOS  DEL PROPIETARIO', '.:::. GASTOS DEL PROPIETARIO .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2079', '1001', 'ARTE Y/O APAREJO DE PESCA', 'ARTE Y/O APAREJO DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('2', '2079', '1002', 'REPARACION Y MANTENIMIENTO', 'REPARACION Y MANTENIMIENTO', '1000');
INSERT INTO `parametro` VALUES ('3', '2079', '1003', 'OTROS GASTOS', 'OTROS GASTOS', '1000');
INSERT INTO `parametro` VALUES ('4', '2079', '1004', 'TOTAL DE GASTOS  DEL PROPIETARIO', 'TOTAL DE GASTOS  DEL PROPIETARIO', '1000');
INSERT INTO `parametro` VALUES ('0', '2080', '10', 'GASTOS  COMUNES', '.:::. GASTOS COMUNES .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2080', '1001', 'ALIMIMENTOS', 'ALIMIMENTOS', '1000');
INSERT INTO `parametro` VALUES ('2', '2080', '1002', 'COMBUSTIBLE', 'COMBUSTIBLE', '1000');
INSERT INTO `parametro` VALUES ('3', '2080', '1003', 'LUBRICANTES', 'LUBRICANTES', '1000');
INSERT INTO `parametro` VALUES ('4', '2080', '1004', 'AGUA', 'AGUA', '1000');
INSERT INTO `parametro` VALUES ('5', '2080', '1005', 'HIELO', 'HIELO', '1000');
INSERT INTO `parametro` VALUES ('6', '2080', '1006', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro` VALUES ('7', '2080', '1007', 'TOTAL DE GASTOS COMUNES', 'TOTAL DE GASTOS', '1000');
INSERT INTO `parametro` VALUES ('0', '2081', '10', 'GANANCIAS', '.:::. GANANCIAS  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2081', '1001', 'PRECIO CONVENCIDO', 'PRECIO CONVENCIDO', '1000');
INSERT INTO `parametro` VALUES ('2', '2081', '1002', 'RECIBIDO AL CONTADO', 'RECIBIDO AL CONTADO', '1000');
INSERT INTO `parametro` VALUES ('3', '2081', '1003', 'TIEMPO FINAL DEL PAGO', 'TIEMPO FINAL DEL PAGO', '1000');
INSERT INTO `parametro` VALUES ('4', '2081', '1004', 'INGRESO POR OTRAS FUENTES', 'INGRESO POR OTRAS FUENTES', '1000');
INSERT INTO `parametro` VALUES ('0', '2082', '10', 'DISTRIBUCION DE GANANCIAS', '.:::. DISTRIBUCION DE GANANCIAS  .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2082', '1001', 'GANANCIAS TOTALES', 'GANANCIAS TOTALES', '1000');
INSERT INTO `parametro` VALUES ('2', '2082', '1002', 'NUMERO TOTAL DE PARTES', 'NUMERO TOTAL DE PARTES', '1000');
INSERT INTO `parametro` VALUES ('3', '2082', '1003', 'VALOR DE UNA PARTE', 'VALOR DE UNA PARTE', '1000');
INSERT INTO `parametro` VALUES ('4', '2082', '1004', 'PARTES PARA EL ARMADOR', 'PARTES PARA EL ARMADOR', '1000');
INSERT INTO `parametro` VALUES ('5', '2082', '1005', 'PARTES PARA EL PROPIETARIO DE LA RED', 'PARTES PARA EL PROPIETARIO DE LA RED', '1000');
INSERT INTO `parametro` VALUES ('6', '2082', '1006', 'PARTES PARA LA TRIBULACION', 'PARTES PARA LA TRIBULACION', '1000');
INSERT INTO `parametro` VALUES ('7', '2082', '1007', 'OTROS(ESPECIFICAR)', 'OTROS(ESPECIFICAR)', '1000');
INSERT INTO `parametro` VALUES ('8', '2082', '1008', 'TOTALES GANANCIAS', 'TOTALES GANANCIAS', '1000');
INSERT INTO `parametro` VALUES ('1', '2042', '0011', 'XJSKD123', 'EL PIRATA DEL MAR', '1000');
INSERT INTO `parametro` VALUES ('2', '2042', '0011', 'HDGS45', 'SAN PABLO II', '1000');
INSERT INTO `parametro` VALUES ('11', '2042', '0011', 'XCFSDSD', 'NUEVA EMBARCACION', '1000');
INSERT INTO `parametro` VALUES ('6', '2052', '0011', 'AP0001', 'ARPON', '1000');
INSERT INTO `parametro` VALUES ('7', '2052', '0011', '000002', 'NUEVO ARTES DE PESCA', '1000');
INSERT INTO `parametro` VALUES ('8', '2052', '0011', '000012', 'NUEVO ARTES ....', '0');
INSERT INTO `parametro` VALUES ('9', '2052', '0011', '00008', 'NEW ARTES', '1000');
INSERT INTO `parametro` VALUES ('10', '2052', '0011', '22222222233', 'DSFSFSDF', '1000');
INSERT INTO `parametro` VALUES ('0', '2041', '10', 'APAREJO DE PESCA', '.::APAREJO DE PESCA::.', '0');
INSERT INTO `parametro` VALUES ('90010803', '5001', '90010803', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('90010804', '5001', '90010804', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('90010805', '5001', '90010805', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('12', '2050', '0011', '0000000054', 'NUEVO GENERO', '0');
INSERT INTO `parametro` VALUES ('13', '2050', '0011', '0000111', 'GENERO NUEVO', '1000');
INSERT INTO `parametro` VALUES ('14', '2050', '0011', '001', 'GENERO NUEV', '0');
INSERT INTO `parametro` VALUES ('15', '2050', '0011', '000012', 'SARDINAS NOMBRE CIENTIFICO', '1000');
INSERT INTO `parametro` VALUES ('16', '2050', '0011', '00121231', 'NOMBRE CIENTIFICO DE ESPECIE', '1000');
INSERT INTO `parametro` VALUES ('3', '2066', '0011', 'FICHA 2', 'FICHA 2', '1000');
INSERT INTO `parametro` VALUES ('9060203', '5000', '90060203', 'xajax_Configurar_ParametroAbr(2069)', 'Grado de Instrucción', '1000');
INSERT INTO `parametro` VALUES ('906020301', '5001', '9006020301', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906020302', '5001', '9006020302', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('906020303', '5001', '9006020303', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('906020304', '5001', '9006020304', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906020305', '5001', '9006020305', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('17', '2050', '0011', '0002', 'GENERO ENGRAULIDE', '1000');
INSERT INTO `parametro` VALUES ('2', '2043', '1002', '235645', 'ENGRAULIS RINGENS JENYNS', '1000');
INSERT INTO `parametro` VALUES ('4', '2066', '0011', 'FICHA 3', '20198441074688', '1000');
INSERT INTO `parametro` VALUES ('5', '2066', '0011', 'FICHA 3', '20198441074689', '1000');
INSERT INTO `parametro` VALUES ('9007', '5000', '9007', 'MAESTROS', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('900701', '5000', '900701', 'xajax_Reportes_Biomasa()', 'Biomasa', '1000');
INSERT INTO `parametro` VALUES ('900702', '5000', '900702', 'xajax_Cargar_Frm_Reportes_Ficha2();', 'Socio Económica', '1000');
INSERT INTO `parametro` VALUES ('90070201', '5001', '90070201', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('3', '2042', '0011', 'PL-2358-BM', 'CHOLO JUSTO', '1000');
INSERT INTO `parametro` VALUES ('6', '2066', '0011', 'FICHA 2', '26598529548288', '1000');
INSERT INTO `parametro` VALUES ('7', '2066', '0011', 'FICHA 2', '26598529548289', '1000');
INSERT INTO `parametro` VALUES ('4', '2042', '0011', 'GDHS123', 'EL PIRATA', '1000');
INSERT INTO `parametro` VALUES ('8', '2066', '0011', 'FICHA 2', '26598529548290', '1000');
INSERT INTO `parametro` VALUES ('3', '2043', '1003', '54', 'CABALLA', '1000');
INSERT INTO `parametro` VALUES ('9', '2066', '0011', 'FICHA 3', '26598529548291', '1000');
INSERT INTO `parametro` VALUES ('5', '2042', '0011', 'CJSK34', 'EL CHOLO', '1000');
INSERT INTO `parametro` VALUES ('18', '2053', '1018', 'BODEGA INSULADA', 'BODEGA INSULADA', '1000');
INSERT INTO `parametro` VALUES ('0', '2083', '10', 'BODEGA INSULADA', '.:::. BODEGA INSULADA.:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2083', '1001', 'SI', 'SI', '1000');
INSERT INTO `parametro` VALUES ('2', '2083', '1002', 'NO', 'NO', '1000');
INSERT INTO `parametro` VALUES ('10', '2066', '0011', 'FICHA 2', '26598529548292', '1000');
INSERT INTO `parametro` VALUES ('11', '2066', '0011', 'FICHA 2', '26598529548293', '1000');
INSERT INTO `parametro` VALUES ('6', '2042', '0011', 'XKSJD', 'LA NAVE', '1000');
INSERT INTO `parametro` VALUES ('12', '2066', '0011', 'FICHA 2', '26598529548294', '1000');
INSERT INTO `parametro` VALUES ('7', '2042', '0011', 'JAJSDHJCS3', 'EL BRAVO', '1000');
INSERT INTO `parametro` VALUES ('0', '2084', '10', 'MATERIAL DE CONSTRUCCIÓN', '.:::.MATERIAL DE CONSTRUCCION.:::.', '0');
INSERT INTO `parametro` VALUES ('900603', '5000', '900603', '', 'Detalle Embarcacíon', '1000');
INSERT INTO `parametro` VALUES ('9060301', '5000', '90060301', 'xajax_Configurar_ParametroAbr(2084)', 'Material de Construcción', '1000');
INSERT INTO `parametro` VALUES ('906030101', '5001', '9006030101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906030102', '5001', '9006030102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('906030103', '5001', '9006030103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('906030104', '5001', '9006030104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906030105', '5001', '9006030105', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('1', '2084', '0011', 'MA', 'MADERA', '1000');
INSERT INTO `parametro` VALUES ('2', '2084', '0011', 'AC', 'ACERO', '1000');
INSERT INTO `parametro` VALUES ('13', '2066', '0011', 'FICHA 2', '26598529548295', '1000');
INSERT INTO `parametro` VALUES ('8', '2040', '0011', '44444', 'SAN JOSE', '0');
INSERT INTO `parametro` VALUES ('9', '2040', '0011', '5555', 'ETEN', '1000');
INSERT INTO `parametro` VALUES ('8', '2042', '0011', 'DS12D', 'DAVID', '1000');
INSERT INTO `parametro` VALUES ('900504', '5000', '900504', 'xajax_Mostrar_Ficha4(0,20,1,1)', 'Oceanografía', '1000');
INSERT INTO `parametro` VALUES ('90050401', '5001', '90050401', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('90050402', '5001', '90050402', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('900604', '5000', '900604', '', 'Oceanografía', '1000');
INSERT INTO `parametro` VALUES ('9060401', '5000', '90060401', 'xajax_Listar_Perfiles(0,20,1,1)\r\n', 'Perfil', '1000');
INSERT INTO `parametro` VALUES ('906040101', '5001', '9006040101', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906040102', '5001', '9006040102', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('906040103', '5001', '9006040103', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('906040104', '5001', '9006040104', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906040105', '5001', '9006040105', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('0', '2085', '10', 'PERFIL', '.:::. PERFIL OCEANOGRAFICO .:::.', '0');
INSERT INTO `parametro` VALUES ('1', '2085', '1001', 'PERFIL 1', 'PERFIL 1', '1000');
INSERT INTO `parametro` VALUES ('2', '2085', '1002', 'PERFIL 2', 'PERFIL 2', '1000');
INSERT INTO `parametro` VALUES ('3', '2085', '1003', 'PERFIL 3', 'PERFIL 3', '1000');
INSERT INTO `parametro` VALUES ('4', '2085', '1004', 'PERFIL 4', 'PERFIL 4', '1000');
INSERT INTO `parametro` VALUES ('0', '2086', '10', 'ESTACIÓN', '.:::.ESTACIÓNES - PERFIL.:::.', '0');
INSERT INTO `parametro` VALUES ('0', '2087', '10', 'CARRACTERISCAS DE ESTACIÓN', '.:::.CARRACTERISCAS DE ESTACIÓN.:::.', '0');
INSERT INTO `parametro` VALUES ('9060402', '5000', '90060402', 'xajax_Listar_Estaciones(0,20,1,1)', 'Estación', '1000');
INSERT INTO `parametro` VALUES ('906040201', '5001', '9006040201', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906040202', '5001', '9006040202', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('906040203', '5001', '9006040203', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('906040204', '5001', '9006040204', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906040205', '5001', '9006040205', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('1', '2086', '0011', 'ES', 'ESTACION DE PRUEBA', '1000');
INSERT INTO `parametro` VALUES ('0', '2088', '10', 'PARÁMETRO FÍSI/QUÍM\r\n', '.:::.PARÁMETROS FÍSICO/QUÍMICO.:::.', '0');
INSERT INTO `parametro` VALUES ('0', '2089', '10', 'PARÁMETRO PROFUNDIDAD', '.:::.PARÁMETRO PROFUNDIDAD.:::.', '0');
INSERT INTO `parametro` VALUES ('9060403', '5000', '90060403', 'xajax_Configurar_ParametroAbr(2088)', 'Parámetros Fís/Quím\r\n', '1000');
INSERT INTO `parametro` VALUES ('906040301', '5001', '9006040301', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906040302', '5001', '9006040302', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('906040303', '5001', '9006040303', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('906040304', '5001', '9006040304', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906040305', '5001', '9006040305', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('1', '2088', '0011', 'T', 'TEMPERATURA', '1000');
INSERT INTO `parametro` VALUES ('2', '2088', '0011', 'O2', 'OXIGENO', '1000');
INSERT INTO `parametro` VALUES ('3', '2088', '0011', 'S', 'SALINIDAD', '1000');
INSERT INTO `parametro` VALUES ('4', '2088', '0011', 'N', 'NUTRIENTES', '1000');
INSERT INTO `parametro` VALUES ('5', '2088', '0011', 'CL \"A\"', 'CLOROFILA \"A\"', '1000');
INSERT INTO `parametro` VALUES ('9060404', '5000', '90060404', 'xajax_Configurar_Oceanografia_Profundidad(2089)\r\n;', 'Parametros Profundidad', '1000');
INSERT INTO `parametro` VALUES ('906040401', '5001', '9006040401', 'boton-nuevo', 'Nuevo', '1000');
INSERT INTO `parametro` VALUES ('906040402', '5001', '9006040402', 'boton-listar', 'Listar', '1000');
INSERT INTO `parametro` VALUES ('906040403', '5001', '9006040403', 'boton-editar', 'Editar', '1000');
INSERT INTO `parametro` VALUES ('906040404', '5001', '9006040404', 'boton-eliminar', 'Eliminar', '1000');
INSERT INTO `parametro` VALUES ('906040405', '5001', '9006040405', 'boton-reporte', 'Reportes', '1000');
INSERT INTO `parametro` VALUES ('1', '2089', '0011', '10', '10', '1000');
INSERT INTO `parametro` VALUES ('7', '2044', '0011', '00003', 'ISLA LOS LOBOS DE TIERRA', '1000');
INSERT INTO `parametro` VALUES ('9', '2042', '0011', 'DSXK123', 'EL SOL RADIANTE', '1000');
INSERT INTO `parametro` VALUES ('10', '2042', '0011', 'XCFSD', 'NUEVA EMBARCACION', '1000');
INSERT INTO `parametro` VALUES ('12', '2042', '0011', 'HSDGH', 'EMBARCION POSEIDON', '1000');

-- ----------------------------
-- Table structure for parametro_copy
-- ----------------------------
DROP TABLE IF EXISTS `parametro_copy`;
CREATE TABLE `parametro_copy` (
  `nParCodigo` bigint(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `cParJerarquia` varchar(500) NOT NULL,
  `cParNombre` varchar(1000) NOT NULL,
  `cParDescripcion` varchar(1000) NOT NULL,
  `nParTipo` int(11) NOT NULL,
  PRIMARY KEY (`nParCodigo`,`nParClase`),
  KEY `idx_Parametro_cParNombre` (`cParNombre`) USING BTREE,
  KEY `idx_Parametro_cParDescripcion` (`cParDescripcion`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parametro_copy
-- ----------------------------
INSERT INTO `parametro_copy` VALUES ('0', '1100', '00', 'operaciones', 'Operaciones', '0');
INSERT INTO `parametro_copy` VALUES ('1', '1100', '01', 'Operacion', 'Activar Usuario', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1100', '02', 'Operacion', 'Eliminar Usuario', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '1100', '03', 'Operacion', 'Modificar Usuario', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '1100', '04', 'Operacion', 'Insertar Usuario', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '1100', '05', 'Operacion', 'Modificar Persona', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '1100', '05', 'Operacion', 'Eliminar Persona', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '1100', '07', 'Operacion', 'Insertar Persona', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '1100', '08', 'Operaciones', 'Modificar Cuenta General', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '1100', '09', 'Operacion', 'Insertar Cuenta General', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '1100', '10', 'Operacion', 'Eliminar Cuenta General', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '1100', '11', 'Operacion', 'Insertar Periodo', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '1100', '12', 'Operacion', 'Modificar Periodo', '1000');
INSERT INTO `parametro_copy` VALUES ('13', '1100', '13', 'Operacion', 'Eliminar periodo', '1000');
INSERT INTO `parametro_copy` VALUES ('14', '1100', '14', 'Operacion', 'Insertar Empresa', '1000');
INSERT INTO `parametro_copy` VALUES ('15', '1100', '15', 'Operacion', 'Modicar Empresa', '1000');
INSERT INTO `parametro_copy` VALUES ('16', '1100', '16', 'Operacion', 'Eliminar Empresa', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '1001', '01', 'DOCUMENTO IDENTIDAD', 'TIPO DE DOCUMENTO IDENTIDAD', '0');
INSERT INTO `parametro_copy` VALUES ('2', '1001', '0101', 'DNI', 'DOCUMENTO NACIONAL DE IDENTIDAD', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '1001', '0102', 'LB', 'LIBRETA MILITAR', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '1001', '0103', 'CE', 'CARNET DE EXTRANJERIA', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '1001', '0104', 'P', 'PASAPORTE', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1002', '0202', 'F', 'FEMENINO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '1002', '02', 'SEXO', 'TIPO SEXO', '0');
INSERT INTO `parametro_copy` VALUES ('1', '1002', '0201', 'M', 'MASCULINO', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2065', '1006', 'LUGAR DE ARRIBO', 'LUGAR DE ARRIBO', '1000');
INSERT INTO `parametro_copy` VALUES ('900305', '5000', '900305', 'xajax_Listar_Caracteristicas_Especies(0,20,1,1);', 'Caracteristicas', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '1004', '10', 'TIPO DE TELEFONO', '.::.TIPO DE TELEFONO.::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '1004', '1001', 'C', 'CELULAR', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2065', '1007', 'FECHA DE ARRIBO', 'FECHA DE ARRIBO', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '1001', '0105', 'L', 'LICENCIA', '1001');
INSERT INTO `parametro_copy` VALUES ('1', '1005', '10', 'RELACION EMPRESA', 'TIPO DE RELACION CON EMPRESA', '0');
INSERT INTO `parametro_copy` VALUES ('2', '1005', '1001', 'CONDUCTOR', 'CONDUCTOR', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '1001', '0106', 'R', 'RUC', '1002');
INSERT INTO `parametro_copy` VALUES ('1', '1006', '1001', 'Agricultura, Ganadería Caza y Silvicultura', 'Agricultura, Ganadería Caza y Silvicultura', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1007', '0102', 'LUCES Y GRIPERÍA PROFESIONAL ', 'LUCES Y GRIPERÍA PROFESIONAL ', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '1010', '01', 'Productos', 'Productos', '0');
INSERT INTO `parametro_copy` VALUES ('1', '1010', '0101', 'RED EPIC X', 'RED EPIC X', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '1005', '1002', 'REP LEGAL', 'REPRESENTANTE LEGAL', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1006', '1002', 'Pesca', 'Pesca', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '1006', '1003', 'Explotación de Minas y Canteras', 'Explotación de Minas y Canteras', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '5000', '2001', 'MNUADMPER', 'Persona', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '5000', '20010101', 'xajax_MostrarPersonas(0,20,1,1)', 'PersNatOtro', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '5000', '200101', 'xajax_MostrarPersonas(0,20,1,1)', 'Persona Natural', '1000');
INSERT INTO `parametro_copy` VALUES ('36', '1100', '35', 'Operacion', 'Ingreso al Sistema', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '5000', '200102', 'xajax_MostrarPersonas(0,20,1,1)', 'Persona Juridica', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '5000', '20010201', 'xajax_MostrarJuridicas(0,20,1,1)', 'PersJurOtro', '1000');
INSERT INTO `parametro_copy` VALUES ('906020104', '5001', '9006020104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906020105', '5001', '9006020105', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1004', '1002', 'F', 'FIJO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '1007', '01', 'Categorias', 'Categorias', '0');
INSERT INTO `parametro_copy` VALUES ('1', '1007', '0101', 'CÁMARAS Y OPTICAS PROFESIONALES', 'CÁMARAS Y OPTICAS PROFESIONALES', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1010', '0102', 'CANON 5D MARK II', 'CANON 5D MARK II', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '5004', '1007', 'frmadminweb.php', 'Modulo de Administracion Web', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '5004', '10', 'MODULOS', 'MODULOS', '0');
INSERT INTO `parametro_copy` VALUES ('0', '1018', '01', 'COMPROBANTE', 'COMPROBANTE', '0');
INSERT INTO `parametro_copy` VALUES ('1', '1018', '0101', 'FACTURA', 'FACTURA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1018', '0102', 'BOLETA', 'BOLETA', '1000');
INSERT INTO `parametro_copy` VALUES ('906020103', '5001', '9006020103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('900602', '5000', '900602', '', 'Detalle Persona', '1000');
INSERT INTO `parametro_copy` VALUES ('9060201', '5000', '90060201', 'xajax_Configurar_ParametroAbr(1003)', 'Estado Civil ', '1000');
INSERT INTO `parametro_copy` VALUES ('906020101', '5001', '9006020101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906020102', '5001', '9006020102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '1007', '0103', 'ACCESORIOS', 'ACCESORIOS', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '1007', '0104', 'AUDIO PROFESIONAL', 'AUDIO PROFESIONAL', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2040', '0011', '00000000000000', 'PIMENTEL', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '1004', '1003', 'R', 'RPM', '1000');
INSERT INTO `parametro_copy` VALUES ('9060202', '5000', '90060202', 'xajax_Configurar_ParametroAbr(1004)', 'Tipo Telefono ', '1000');
INSERT INTO `parametro_copy` VALUES ('906020201', '5001', '9006020201', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906020202', '5001', '9006020202', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('906020203', '5001', '9006020203', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('906020204', '5001', '9006020204', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906020205', '5001', '9006020205', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2067', '1010', 'DETALLE DE PRECIO DEL ARTE DE PESCA', 'DETALLE DE PRECIO DEL ARTE DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('900108', '5000', '900108', 'xajax_Listar_Embarcaciones(0,20,1,1);', 'Embarcación', '1000');
INSERT INTO `parametro_copy` VALUES ('90010801', '5001', '90010801', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90010802', '5001', '90010802', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2037', '0011', 'ADM', 'ADMINISTRADOR', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2037', '0011', 'ESPECIAL', 'ESPECIAL', '0');
INSERT INTO `parametro_copy` VALUES ('0', '2037', '10', '::: ROLES:::', '::: ROLES:::', '0');
INSERT INTO `parametro_copy` VALUES ('2', '2037', '0011', 'PUBLICO', 'PUBLICO', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2037', '0011', 'INVITADO', 'INVITADO', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2037', '0011', 'REGIST.', 'REGISTRADO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2038', '10', 'GRUPO', '::: GRUPOS :::', '0');
INSERT INTO `parametro_copy` VALUES ('5', '2037', '0011', 'RN', 'ROL NUEVO', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2066', '0011', 'FICHA 2', 'FICHA 2', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2066', '0011', 'FICHA 2', 'FICHA 2', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2040', '0011', 'JJJ', 'CHICLAYO', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2052', '0011', '0000005', 'MALLA', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2037', '0011', 'R10', 'ROL 10', '0');
INSERT INTO `parametro_copy` VALUES ('8', '2037', '0011', 'R11', 'ROL 11', '0');
INSERT INTO `parametro_copy` VALUES ('9', '2037', '0011', 'R123', 'ROLLES 122', '0');
INSERT INTO `parametro_copy` VALUES ('10', '2037', '0011', 'R13', 'ROL 13', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2038', '0011', 'GA', 'GRUPO A', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2038', '0011', 'GC', 'GRUPO C', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2038', '0011', 'GB', 'GRUPO B', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2038', '0011', 'G_D', 'GRUPO D', '0');
INSERT INTO `parametro_copy` VALUES ('5', '2038', '0011', 'ADMIN', 'ADMINISTRADOR', '0');
INSERT INTO `parametro_copy` VALUES ('6', '2038', '0011', 'ADMIN', 'ADMINISTRADORES', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '2037', '0011', 'SPU 1', 'SUPER USUARIO 1', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2037', '0011', 'SPU 2', 'SUPER USUARIO 2', '1000');
INSERT INTO `parametro_copy` VALUES ('13', '2037', '0011', 'REGISTRO DE EMBARCACIONES', 'REGISTRO DE EMBARCACIONES', '1000');
INSERT INTO `parametro_copy` VALUES ('90', '5000', '90', 'MENUS SISTEMA WEB', 'MENUS SISTEMA WEB', '0');
INSERT INTO `parametro_copy` VALUES ('9001', '5000', '9001', 'MAESTROS', 'Caract. de Pesqueria', '1000');
INSERT INTO `parametro_copy` VALUES ('90010101', '5001', '90010101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('900101', '5000', '900101', 'xajax_Configurar_Parametro(2040);', 'Sitios de Desembarque', '1000');
INSERT INTO `parametro_copy` VALUES ('90010102', '5001', '90010102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010103', '5001', '90010103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2040', '10', 'SITIO DE DESEMBARQUE', '.::SITIOS DE DESSEMBARCACIÓN::.', '0');
INSERT INTO `parametro_copy` VALUES ('4', '2040', '0011', '00323FD', 'SAN JOSE', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2040', '0011', '0000SA', 'SANTA ROSA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2040', '0011', '00003-E', 'PIMÉNTEL', '0');
INSERT INTO `parametro_copy` VALUES ('11', '2052', '0011', '000020', 'ALAMBRES', '1000');
INSERT INTO `parametro_copy` VALUES ('90010104', '5001', '90010104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2051', '0011', 'N. INGLÉS', 'NOMBRE INGLÉS', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2051', '0011', 'T. COMERCIAL', 'TAMAÑO COMERCIAL', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2051', '0011', 'FOTOGRAFÍA', 'FOTOGRAFÍA', '2000');
INSERT INTO `parametro_copy` VALUES ('6', '2051', '0011', 'HÁBITAT', 'HÁBITAT', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2043', '10', 'ESPECIE', '.::. ESPECIES .::.', '0');
INSERT INTO `parametro_copy` VALUES ('3', '2065', '1003', 'HORA DE ZARPE', 'HORA DE ZARPE', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2065', '1002', 'FECHA DE ZARPE', 'FECHA DE ZARPE', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2042', '10', 'EMBARCACIONES', '.::. EMBARCACIONES .::.', '0');
INSERT INTO `parametro_copy` VALUES ('900103', '5000', '900105', 'xajax_Configurar_Parametro(2041);', 'Aparejos  Pesca', '1000');
INSERT INTO `parametro_copy` VALUES ('90010301', '5001', '90010301', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90010302', '5001', '90010302', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010303', '5001', '90010303', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010304', '5001', '90010304', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2041', '0011', '00001-AP', 'ALMADRABA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2041', '0011', '00005-AP', 'TRASMALLO', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2041', '0011', 'MSS0034', 'RED CORTA', '100');
INSERT INTO `parametro_copy` VALUES ('4', '2041', '0011', 'HS3848', 'ATARRALLA', '100');
INSERT INTO `parametro_copy` VALUES ('0', '2044', '10', 'ZONAS DE PESCA ', '.::. SITIOS / ZONAS  DE PESCA  .::.', '0');
INSERT INTO `parametro_copy` VALUES ('0', '2045', '10', '.::. ACTIVIDADES ECONÓMICAS  .::.', '.::. ACTIVIDADES ECONÓMICAS  .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2032', '1001', 'RD03', 'RED CORTA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2032', '1002', 'DM447D', 'RED CON PLOMÓ', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2046', '10', 'TIPOS Y TÉCNICAS DE PESCA', '.::. TIPOS Y TÉCNICAS DE PESCA  .::.', '0');
INSERT INTO `parametro_copy` VALUES ('900106', '5000', '900106', 'xajax_Configurar_Parametro(2046);', 'Tipo Pesca', '1000');
INSERT INTO `parametro_copy` VALUES ('90010601', '5001', '90010601', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90010602', '5001', '90010602', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010603', '5001', '90010603', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010604', '5001', '90010604', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2046', '0011', 'PB00001', 'PESCA DE BAJURA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2046', '0011', 'PA00002', 'PESCA DE ALTURA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2046', '0011', 'PGA00004', 'PESCA DE GRAN ALTURA', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2046', '0011', 'PA00005', 'PESCA ARTÉSANAL', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2046', '0011', 'PA00007', 'PESCA INDUSTRIAL', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2046', '0011', 'ASDADDDDDDDDDDDDDDD', 'ASDAS', '0');
INSERT INTO `parametro_copy` VALUES ('8', '2065', '1008', 'HORA DE ARRIBO', 'HORA DE ARRIBO', '1000');
INSERT INTO `parametro_copy` VALUES ('9002', '5000', '9002', 'MAESTROS', 'Persona', '1000');
INSERT INTO `parametro_copy` VALUES ('900201', '5000', '900201', 'xajax_Listar_Pescadores(0,20,1,1)', 'Pescador', '1000');
INSERT INTO `parametro_copy` VALUES ('90020101', '5001', '90020101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90020102', '5001', '90020102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90020103', '5001', '90020103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90020104', '5001', '90020104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('900104', '5000', '900103', 'xajax_Listar_Zonas_Pesca(0,20,1,1);', 'Zonas de Pesca', '1000');
INSERT INTO `parametro_copy` VALUES ('90010401', '5001', '90010401', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90010402', '5001', '90010402', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010403', '5001', '90010403', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010404', '5001', '90010404', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2044', '0011', 'SAN', 'SAN JOSÉ', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2044', '0011', 'SA', 'SANTA ROSA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2044', '0011', 'PI', 'PIMENTEL', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2044', '0011', 'MO', 'MONSEFÚ', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2044', '0011', 'MOS', 'ZONA2', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2050', '0011', '0000-23', 'OTROS 2', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2050', '0011', '00007-GF', 'CAMARON GENERO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2049', '10', 'FAMILA', '.::.  FAMILAS DE PECES ::.', '0');
INSERT INTO `parametro_copy` VALUES ('90030404', '5001', '90030404', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2051', '10', '.::.  CARACTERISTICA DE ESPECIES  ::.', '.::.  CARACTERISTICA DE ESPECIES  ::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2051', '0011', 'N. CIENTIFICO', 'NOMBRE CIENTIFICO', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2051', '0011', 'N. COMUN', 'NOMBRE COMUN', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2049', '0011', '001', 'NATICIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2049', '0011', '003', 'SERRANIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2049', '0011', '002', 'OCYPOPIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2049', '0011', '0023.324', 'FAM2222', '0');
INSERT INTO `parametro_copy` VALUES ('90030403', '5001', '90030403', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('900304', '5000', '900304', 'xajax_Listar_Detalle_Especies(0,20,1,1)', 'Detalle Especies', '1000');
INSERT INTO `parametro_copy` VALUES ('90030401', '5001', '90030401', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90030402', '5001', '90030402', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('9003', '5000', '9003', 'MAESTROS', 'Especies', '1000');
INSERT INTO `parametro_copy` VALUES ('900301', '5000', '900301', 'xajax_Configurar_Parametro(2049);', 'Familias', '1000');
INSERT INTO `parametro_copy` VALUES ('90030101', '5001', '90030101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90030102', '5001', '90030102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90030103', '5001', '90030103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90030104', '5001', '90030104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('900302', '5000', '900302', 'xajax_Listar_Generos(0,20,1,1)', 'Generos', '1000');
INSERT INTO `parametro_copy` VALUES ('90030201', '5001', '90030201', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90030202', '5001', '90030202', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90030203', '5001', '90030203', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2050', '0011', '00001-GF', 'ACRYBIA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2050', '0011', '00002-GF', 'AMAUROPSIS', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2050', '0011', '00003-GF', 'BULBUS', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2050', '0011', '00004-GF', 'CALINATICINA', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2050', '0011', '00005-GF', 'AMISSIDENS', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2050', '10', 'GENEROS ESPECIES', '.::.  GENEROS ESPECIES  ::.', '0');
INSERT INTO `parametro_copy` VALUES ('6', '2050', '0011', '00006-GF', 'AMPHIARIUS', '1000');
INSERT INTO `parametro_copy` VALUES ('90030204', '5001', '90030204', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2049', '0011', '005', 'SCIAENIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('900303', '5000', '900303', 'xajax_Listar_Especies(0,20,1,1)', 'Especies', '1000');
INSERT INTO `parametro_copy` VALUES ('90030301', '5001', '90030301', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90030302', '5001', '90030302', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90030303', '5001', '90030303', 'detalle.gif', 'Carracteriscas', '1000');
INSERT INTO `parametro_copy` VALUES ('90030304', '5001', '90030304', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2049', '0011', '006', 'CANCRIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2050', '0011', '4444444', '2323443SDADSSD', '0');
INSERT INTO `parametro_copy` VALUES ('9', '2050', '0011', '000006', 'OTROS1', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2049', '0011', '007', 'MYTILIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '2049', '0011', '008', 'ENGRAULIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2049', '0011', '009', 'HAEMULIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '2049', '0011', '010', 'ARIIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2049', '0011', '011', 'SYNGNATHIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('13', '2049', '0011', '012', 'SICYONIIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('14', '2049', '0011', '013', 'OPHICHTHIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('15', '2049', '0011', '014', 'SCOMBRIDAE', '1000');
INSERT INTO `parametro_copy` VALUES ('16', '2049', '0011', '015', 'NUEVO FAMILIA', '1000');
INSERT INTO `parametro_copy` VALUES ('17', '2049', '0011', '016', 'NUEVA FAMILIA 2', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2040', '0011', '00003', 'PUERTO ETÉN', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2044', '0011', '000002', 'DOS TETAS', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2041', '0011', '00002-AP', 'PALANGRE', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2041', '0011', '00004-AP', 'PESCA DE ARRASTRE', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2041', '11', '00006-AP', 'ALMORREFA', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '2041', '11', '00007-AP', 'Tirar l\'art', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2041', '11', '00008-AP', 'Retel', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '2041', '11', '00001-AP', 'BOLICHE', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2041', '11', '00001-AP', 'Pesca al coup', '1000');
INSERT INTO `parametro_copy` VALUES ('13', '2041', '11', '00001-AP', 'ALMADRABA', '0');
INSERT INTO `parametro_copy` VALUES ('14', '2041', '11', '00001-AP', 'Tarrafa', '1000');
INSERT INTO `parametro_copy` VALUES ('15', '2041', '11', '00001-AP', 'CHINCHORRO (PESCA)', '1000');
INSERT INTO `parametro_copy` VALUES ('16', '2041', '11', '00001-AP', 'PESCA CON CARRO VALENCIANO', '1000');
INSERT INTO `parametro_copy` VALUES ('17', '2041', '11', '00001-AP', 'Pesca con cianuro', '1000');
INSERT INTO `parametro_copy` VALUES ('18', '2041', '11', '00001-AP', 'Pesca con explosivos', '1000');
INSERT INTO `parametro_copy` VALUES ('19', '2041', '11', '00001-AP', 'ARPÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('20', '2041', '11', '00001-AP', 'Nasa (pesca)', '1000');
INSERT INTO `parametro_copy` VALUES ('21', '2041', '11', '00001-AP', 'Pesca con piedra', '1000');
INSERT INTO `parametro_copy` VALUES ('22', '2041', '11', '00022-AP', 'PESCA CON CAÑA', '1000');
INSERT INTO `parametro_copy` VALUES ('23', '2041', '11', '00001-AP', 'CUCHARILLA', '1000');
INSERT INTO `parametro_copy` VALUES ('24', '2041', '11', '00001-AP', 'Pesca con mosca', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '2050', '0011', '0003-G', 'ANISOTREMUS', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2051', '0011', 'DISTRIBUCIÓN GEOG.', 'DISTRIBUCIÓN GEOG.', '1000');
INSERT INTO `parametro_copy` VALUES ('90010305', '5001', '90010305', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('90010105', '5001', '90010105', 'reporte.png', 'Reporte', '1000');
INSERT INTO `parametro_copy` VALUES ('90010405', '5001', '90010405', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2052', '10', ' ARTE DE PESCA', '.::.  ARTE DE PESCA .::.', '0');
INSERT INTO `parametro_copy` VALUES ('900107', '5000', '900104', ' xajax_Configurar_Parametro(2052);', 'Arte de Pesca', '1000');
INSERT INTO `parametro_copy` VALUES ('90010701', '5001', '90010701', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90010702', '5001', '90010702', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010703', '5001', '90010703', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010704', '5001', '90010704', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010705', '5001', '90010705', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2052', '0011', '00001', 'CORTINA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2052', '0011', '0002', 'CERCA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2052', '0011', '00004', 'ARRASTRE', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2052', '0011', '00005', 'ALMÁDRABA', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2052', '0011', '00003', 'TARRAFA', '1000');
INSERT INTO `parametro_copy` VALUES ('90010605', '5001', '90010605', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('90030105', '5001', '90030105', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('90030205', '5001', '90030205', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('90030305', '5001', '90030305', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('9004', '5000', '9004', 'MAESTROS', 'Permisos', '1000');
INSERT INTO `parametro_copy` VALUES ('900401', '5000', '900401', 'xajax_Mostrar_Roles(0,20,1,1)', 'Roles', '1000');
INSERT INTO `parametro_copy` VALUES ('90040101', '5001', '90040101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90040102', '5001', '90040102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040103', '5001', '90040103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040104', '5001', '90040104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040105', '5001', '90040105', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('900402', '5000', '900402', 'xajax_Mostrar_Grupos(0,20,1,1)', 'Grupos', '1000');
INSERT INTO `parametro_copy` VALUES ('90040201', '5001', '90040201', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90040202', '5001', '90040202', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040203', '5001', '90040203', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040204', '5001', '90040204', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040205', '5001', '90040205', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('90020105', '5001', '90020105', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('90030501', '5001', '90030501', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90030502', '5001', '90030502', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90030503', '5001', '90030503', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90030504', '5001', '90030504', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('90030505', '5001', '90030505', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('900403', '5000', '900403', 'xajax_Mostrar_Grupos_Permisos(0,20,1,1)', 'Grupo - Permisos', '1000');
INSERT INTO `parametro_copy` VALUES ('90040301', '5001', '90040301', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90040302', '5001', '90040302', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040303', '5001', '90040303', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90040304', '5001', '90040304', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('9005', '5000', '9005', 'MAESTROS', 'Fichas de Registro', '1000');
INSERT INTO `parametro_copy` VALUES ('90050101', '5001', '90050101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('900501', '5000', '900501', 'xajax_Mostrar_Ficha1(0,20,1,1)', 'Biomasa - Tabla 1', '1000');
INSERT INTO `parametro_copy` VALUES ('900502', '5000', '900502', 'xajax_Mostrar_Ficha2(0,20,1,1)', 'Flota Pesquera - Tabla 6', '1000');
INSERT INTO `parametro_copy` VALUES ('90050201', '5001', '90050201', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '1003', '1', 'ESTADO CIVIL', '.::ESTADO CIVIL (CONYUGAL)::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '1003', '102', 'SOLTERO', 'SOLTERO', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '1003', '101', 'CASADO', 'CASADO', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '1003', '104', 'VIUDO', 'VIUDO', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '1003', '105', 'DIVORCIADO', 'DIVORCIADO', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '1003', '103', 'CONVIVIENTE', 'CONVIVIENTE', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2053', '10', '.::. CARACTERISTICA DE EMBARCACIÓN .::.', '.::. CARACTERISTICA DE EMBARCACIÓN .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2053', '1001', 'MATRICULA...', 'MATRICULA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2053', '1002', 'DIMENSIONES', 'DIMENSIONES', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2053', '1003', 'CAPACIDAD DE BODEGA', 'CAPACIDAD DE BODEGA', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2053', '1004', 'MATERIAL DE CONSTRUCCION', 'MATERIAL DE CONSTRUCCION', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2053', '1005', 'CONDICIONES DE ADQUISICIÓN', 'CONDICIONES DE ADQUISICIÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2053', '1006', 'AÑOS', 'AÑOS', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2053', '1007', 'PRECIOS', 'PRECIOS', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2053', '1008', 'FORMA DE COMPRA', 'FORMA DE COMPRA', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '2053', '1009', 'TIEMPO DE VIDA UTIL', 'TIEMPO DE VIDA UTIL', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2053', '1010', 'EQUIPOS', 'EQUIPOS', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '2053', '1011', 'TIPO DE EMBARCACIÓN', 'TIPO DE EMBARCACIÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2053', '1012', 'MOTOR', 'MOTOR', '1000');
INSERT INTO `parametro_copy` VALUES ('13', '2053', '1012', 'TRIPULACIÓN', 'TRIPULACIÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('17', '2053', '1017', 'CARACTERISTICAS DE ARTE DE PESCA', 'CARACTERISTICAS DE ARTE DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2054', '10', '.:: CONDICIONES AMBIENTALES ::.', '.:: CONDICIONES AMBIENTALES ::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2054', '1001', 'Mar', 'Mar', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2054', '1002', 'Corriente', 'Corriente', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2054', '1003', 'Viento', 'Viento', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2054', '1004', 'Temperatura', 'Temperatura', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2055', '10', '.::. DIMENSIONES .::.', '.::. DIMENSIONES .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2055', '1001', 'ESLORA', 'ESLORA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2055', '1002', 'MANGA', 'MANGA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2055', '1003', 'PUNTAL', 'PUNTAL', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2056', '10', '.::. CAPACIDAD DE BODEGAS .::.', '.::. CAPACIDAD DE BODEGAS .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2056', '1001', 'CAPACIDAD DE BODEGAS', 'CAPACIDAD DE BODEGAS', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2056', '1002', 'TRB', 'TRB', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2056', '1003', 'TRN', 'TRN', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2057', '10', '.::. CONDICIONES DE ADQUISICION .::.', '.::. CONDICIONES DE ADQUISICION.::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2057', '1001', 'HERENCIA', 'HERENCIA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2057', '1002', 'CONSTRUCCIÓN', 'CONSTRUCCIÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2057', '1003', 'COMPRA', 'COMPRA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2058', '10', '.::. FORMA DE COMPRA .::.', '.::. FORMA DE COMPRA.::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2058', '1001', 'CONTADO', 'HERENCIA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2058', '1002', 'CREDITO', 'CONSTRUCCIÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2059', '10', '.::. EQUIPOS .::.', '.::. EQUIPOS .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2059', '1001', 'NAVEGADOR', 'NAVEGADOR', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2059', '1002', 'ECOSONDA', 'ECOSONDA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2059', '1003', 'RADIO', 'RADIO', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2059', '1004', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2060', '10', '.::. TIPO DE EMBARCACIÓN .::.', '.::. TIPO DE EMBARCACIÓN .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2060', '1001', 'NO MECANIZADO', 'NO MECANIZADO', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2060', '1002', 'MECANIZADO INTERIOR', 'MECANIZADO INTERIOR', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2060', '1003', 'FUERA DE BORDA', 'FUERA DE BORDA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2061', '10', '.::. CARACTERISTICAS DE MOTOR .::.', '.::. CARACTERISTICAS DE MOTOR .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2061', '1001', 'MARCA', 'MARCA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2061', '1002', 'HP', 'HP', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2061', '1003', 'ESTADO DEL MOTOR', 'ESTADO DEL MOTOR', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2062', '10', '.:: AÑOS ::.', '.:: AÑOS ::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2062', '1001', 'ADQUISICION DE EMBARCACION', 'ADQUISICION DE EMBARCACION', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2062', '1002', 'USO DE LA EMBARCACION', 'USO DE LA EMBARCACION', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2062', '1003', 'ADQUISICION DEL MOTOR', 'ADQUISICION DEL MOTOR', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2062', '1004', 'USO DEL MOTOR', 'USO DEL MOTOR', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2063', '10', '.::. PRECIOS DE COMPRA EMBARCACIÓN .::.', '.::. PRECIOS DE COMPRA EMBARCACIÓN .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2063', '1001', 'PRECIO DE COMPRA DE EMBARCACIÓN', 'PRECIO DE COMPRA DE EMBARCACIÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2063', '1002', 'PRECIO DE COMPRA DE MOTOR DE EMBARCACIÓN', 'PRECIO DE COMPRA DE MOTOR DE EMBARCACIÓN', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2064', '10', '.::. CARACTERISTICAS DE ARTE DE PESCA .::.', '.::. CARACTERISTICAS DE ARTE DE PESCA .::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2064', '1001', 'CARACTERISTICA DE ARTE', 'CARACTERISTICA DE ARTE', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2064', '1002', 'TIEMPO DE VIDA UTIL DEL ARTE', 'TIEMPO DE VIDA UTIL DEL ARTE', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2064', '1003', 'PRECIO DEL ARTE DE PESCA', 'PRECIO DEL ARTE DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2065', '10', '.:: OPERACIÓN DE PESCA ::.', '.:: OPERACIÓN DE PESCA ::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2065', '1001', 'LUGAR DE ZARPE', 'LUGAR DE ZARPE', '1000');
INSERT INTO `parametro_copy` VALUES ('90050202', '5001', '90050202', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90050102', '5001', '90050102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('900503', '5000', '900503', 'xajax_Mostrar_Ficha3(0,20,1,1)', 'Socio Económica - Tabla 8', '1000');
INSERT INTO `parametro_copy` VALUES ('90050301', '5001', '90050301', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90050302', '5001', '90050302', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2066', '10', '.:: FICHAS DE REGISTRO ::.', '.:: FICHAS DE REGISTRO ::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2043', '1001', '0001', 'NOMBRE CIENTIFICO ESPECIE', '1000');
INSERT INTO `parametro_copy` VALUES ('9006', '5000', '9006', 'MAESTROS', 'Tablas Maéstras', '1000');
INSERT INTO `parametro_copy` VALUES ('900601', '5000', '900601', 'xajax_Listar_Entidad_Financiera(0,15,1,1)', 'Entidades Finacieras', '1000');
INSERT INTO `parametro_copy` VALUES ('90060101', '5001', '90060101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90060102', '5001', '90060102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('90060103', '5001', '90060103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90060104', '5001', '90060104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('90060105', '5001', '90060105', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2065', '1004', 'INICIO DE LANZE', 'INICIO DE LANZE', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2065', '1005', 'FIN DE LANZE', 'FIN DE LANZE', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '1006', '1', '.::RUBRO O ACTIVIDAD COMERCIAL::.', '.::RUBRO O ACTIVIDAD COMERCIAL::.', '0');
INSERT INTO `parametro_copy` VALUES ('4', '1006', '1004', 'Industrias Manufactureras No Metálicas', 'Industrias Manufactureras No Metálicas', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '1006', '1005', 'Industrias Manufactureras Metálicas', 'Industrias Manufactureras Metálicas', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '1006', '1006', 'Suministro de Electricidad, Gas y Agua', 'Suministro de Electricidad, Gas y Agua', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '1006', '1007', 'Construcción', 'Construcción', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '1006', '1010', 'Transporte, Almacenamiento y Comunicaciones', 'Transporte, Almacenamiento y Comunicaciones', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '1006', '1011', 'Intermediación Financiera', 'Intermediación Financiera', '1000');
INSERT INTO `parametro_copy` VALUES ('13', '1006', '1013', 'Adm. Pública y Defensa; Planes de Seg. Social, Afiliación Obligatoria', 'Adm. Pública y Defensa; Planes de Seg. Social, Afiliación Obligatoria', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2067', '1001', 'Observacion', 'Observacion', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2067', '10', '.:: CARACTERISTICAS DE LA FICHA ::.', '.:: CARACTERISTICAS DE LA FICHA ::.', '0');
INSERT INTO `parametro_copy` VALUES ('2', '2067', '1002', 'Numero de tripulantes total', 'Numero de tripulantes total', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2067', '1003', 'Capturas total', 'Capturas total', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2067', '1004', 'Capturas especies', 'Capturas especies', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2067', '1005', 'Lugar', 'Lugar', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2067', '1006', 'ARTE DE PESCA', 'ARTE DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2067', '1007', 'CARACTERISTICA DE ARTE', 'CARACTERISTICA DE ARTE', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2067', '1008', 'TIEMPO DE VIDA UTIL DEL ARTE', 'TIEMPO DE VIDA UTIL DEL ARTE', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '2067', '1009', 'PRECIO DEL ARTE DE PESCA', 'PRECIO DEL ARTE DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2068', '10', '.:::. CARGA FAMILIAR .:::.', '.:::. CARGA FAMILIAR .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2068', '1001', 'ESPOSA', 'ESPOSA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2068', '1002', 'HIJOS(NUMERO DE HIJOS)', 'HIJOS(NUMERO DE HIJOS)', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2068', '1003', 'NUMERO DE HIJOS HOMBRES', 'NUMERO DE HIJOS HOMBRES', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2068', '1004', 'NUMERO DE HIJOS MUJERES', 'NUMERO DE HIJOS MUJERES', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2068', '1005', 'EN EDAD ESCOLAR', 'EN EDAD ESCOLAR', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2068', '1006', 'PADRES', 'PADRES', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2060', '1007', 'ESPOSO', 'ESPOSO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2069', '10', 'GRADO DE INSTRUCCIÓN', '.:::. GRADO DE INSTRUCCIÓN .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2069', '1001', 'NINGUN NIVEL', 'NINGUN NIVEL', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2069', '1002', 'PRIMARIA', 'PRIMARIA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2069', '1003', 'SECUNDARIA', 'SECUNDARIA', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2069', '1004', 'TÉCNICO', 'TÉCNICO', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2069', '1005', 'SUPERIOR', 'SUPERIOR', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2070', '10', '.:::. VIVIENDA UBICACIÓN  .:::.', '.:::. VIVIENDA UBICACIÓN  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2070', '1001', 'ÁREA URBANA', 'ÁREA URBANA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2070', '1002', 'ÁREA RURAL', 'ÁREA RURAL', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2071', '10', '.:::. VIVIENDA CONDICION   .:::.', '.:::. VIVIENDA UBICACIÓN  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2071', '1003', 'PROPIA', 'PROPIA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2071', '1004', 'ALQUILADA', 'ALQUILADA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2071', '1005', 'USO AUTORIZADO POR EL PROPIETARIO', 'USO AUTORIZADO POR EL PROPIETARIO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2072', '10', '.:::. VIVIENDA TIPO  .:::.', '.:::. VIVIENDA TIPO  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2072', '1001', 'CASA INDEPENDIENTE', 'CASA INDEPENDIENTE', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2072', '1002', 'EN QUINTA', 'EN QUINTA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2072', '1003', 'CHOZA', 'CHOZA', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2072', '1004', 'IMPROVISADA', 'IMPROVISADA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2073', '10', '.:::. VIVIENDA OTROS  .:::.', '.:::. VIVIENDA TIPO  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2073', '1005', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2073', '1006', 'N° DE HABITACIONES', 'N° DE HABITACIONES', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2074', '10', '.:::. VIVIENDA MATERIAL  .:::.', '.:::. VIVIENDA MATERIAL  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2074', '1001', 'LADRILLO', 'LADRILLO', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2074', '1002', 'MADERA', 'MADERA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2074', '1003', 'ADOBE', 'ADOBE', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2074', '1004', 'ESTERA', 'ESTERA', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2074', '1004', 'QUINCHA', 'QUINCHA', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2074', '1005', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2075', '10', '.:::. VIVIENDA CREDITO  .:::.', '.:::. VIVIENDA CREDITO  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2075', '1001', 'FINANCIADO', 'FINANCIADO', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2075', '1002', 'NO FINANCIADO', 'NO FINANCIADO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2076', '10', '.:::. VIVIENDAS SERVICIOS BASICOS  .:::.', '.:::. VIVIENDAS SERVICIOS BASICOS  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2076', '1001', 'AGUA', 'AGUA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2076', '1002', 'LUZ', 'LUZ', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2076', '1003', 'DESAGUE', 'DESAGUE', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2076', '1004', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2076', '1005', 'TELEFONO', 'TELEFONO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2077', '10', '.:::. CARGA FAMILIAR  .:::.', '.:::. CARGA FAMILIAR  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2077', '1001', 'ESPOSO(PESCADOR)', 'ESPOSO(PESCADOR)', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2077', '1002', 'ESPOSA', 'ESPOSA', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2077', '1003', 'HIJOS TOTAL', 'HIJOS TOTAL', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2077', '1004', 'HIJOS MUJERES', 'HIJOS MUJERES', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2077', '1005', 'HIJOS HOMBRES', 'HIJOS HOMBRES', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2077', '1006', 'HIJOS EN EDAD ESCOLAR', 'HIJOS EN EDAD ESCOLAR', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2077', '1007', 'PADRES', 'PADRES', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2078', '10', 'INGRESOS', '.:::. INGRESOS  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2078', '1001', 'INGRESOS PROMEDIO MENSUAL O POR FAENA DE PESCA', 'INGRESOS PROMEDIO MENSUAL O POR FAENA DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2078', '1002', 'INGRESOS PROMEDIO MENSUAL POR OTRA ACTIDAD', 'INGRESOS PROMEDIO MENSUAL POR OTRA ACTIDAD', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2079', '10', 'GASTOS  DEL PROPIETARIO', '.:::. GASTOS DEL PROPIETARIO .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2079', '1001', 'ARTE Y/O APAREJO DE PESCA', 'ARTE Y/O APAREJO DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2079', '1002', 'REPARACION Y MANTENIMIENTO', 'REPARACION Y MANTENIMIENTO', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2079', '1003', 'OTROS GASTOS', 'OTROS GASTOS', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2079', '1004', 'TOTAL DE GASTOS  DEL PROPIETARIO', 'TOTAL DE GASTOS  DEL PROPIETARIO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2080', '10', 'GASTOS  COMUNES', '.:::. GASTOS COMUNES .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2080', '1001', 'ALIMIMENTOS', 'ALIMIMENTOS', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2080', '1002', 'COMBUSTIBLE', 'COMBUSTIBLE', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2080', '1003', 'LUBRICANTES', 'LUBRICANTES', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2080', '1004', 'AGUA', 'AGUA', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2080', '1005', 'HIELO', 'HIELO', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2080', '1006', 'OTROS', 'OTROS', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2080', '1007', 'TOTAL DE GASTOS COMUNES', 'TOTAL DE GASTOS', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2081', '10', 'GANANCIAS', '.:::. GANANCIAS  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2081', '1001', 'PRECIO CONVENCIDO', 'PRECIO CONVENCIDO', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2081', '1002', 'RECIBIDO AL CONTADO', 'RECIBIDO AL CONTADO', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2081', '1003', 'TIEMPO FINAL DEL PAGO', 'TIEMPO FINAL DEL PAGO', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2081', '1004', 'INGRESO POR OTRAS FUENTES', 'INGRESO POR OTRAS FUENTES', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2082', '10', 'DISTRIBUCION DE GANANCIAS', '.:::. DISTRIBUCION DE GANANCIAS  .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2082', '1001', 'GANANCIAS TOTALES', 'GANANCIAS TOTALES', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2082', '1002', 'NUMERO TOTAL DE PARTES', 'NUMERO TOTAL DE PARTES', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2082', '1003', 'VALOR DE UNA PARTE', 'VALOR DE UNA PARTE', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2082', '1004', 'PARTES PARA EL ARMADOR', 'PARTES PARA EL ARMADOR', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2082', '1005', 'PARTES PARA EL PROPIETARIO DE LA RED', 'PARTES PARA EL PROPIETARIO DE LA RED', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2082', '1006', 'PARTES PARA LA TRIBULACION', 'PARTES PARA LA TRIBULACION', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2082', '1007', 'OTROS(ESPECIFICAR)', 'OTROS(ESPECIFICAR)', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2082', '1008', 'TOTALES GANANCIAS', 'TOTALES GANANCIAS', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2042', '0011', 'XJSKD123', 'EL PIRATA DEL MAR', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2042', '0011', 'HDGS45', 'SAN PABLO II', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '2042', '0011', 'XCFSDSD', 'NUEVA EMBARCACION', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2052', '0011', 'AP0001', 'ARPON', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2052', '0011', '000002', 'NUEVO ARTES DE PESCA', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2052', '0011', '000012', 'NUEVO ARTES ....', '0');
INSERT INTO `parametro_copy` VALUES ('9', '2052', '0011', '00008', 'NEW ARTES', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2052', '0011', '22222222233', 'DSFSFSDF', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2041', '10', 'APAREJO DE PESCA', '.::APAREJO DE PESCA::.', '0');
INSERT INTO `parametro_copy` VALUES ('90010803', '5001', '90010803', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010804', '5001', '90010804', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('90010805', '5001', '90010805', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2050', '0011', '0000000054', 'NUEVO GENERO', '0');
INSERT INTO `parametro_copy` VALUES ('13', '2050', '0011', '0000111', 'GENERO NUEVO', '1000');
INSERT INTO `parametro_copy` VALUES ('14', '2050', '0011', '001', 'GENERO NUEV', '0');
INSERT INTO `parametro_copy` VALUES ('15', '2050', '0011', '000012', 'SARDINAS NOMBRE CIENTIFICO', '1000');
INSERT INTO `parametro_copy` VALUES ('16', '2050', '0011', '00121231', 'NOMBRE CIENTIFICO DE ESPECIE', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2066', '0011', 'FICHA 2', 'FICHA 2', '1000');
INSERT INTO `parametro_copy` VALUES ('9060203', '5000', '90060203', 'xajax_Configurar_ParametroAbr(2069)', 'Grado de Instrucción', '1000');
INSERT INTO `parametro_copy` VALUES ('906020301', '5001', '9006020301', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906020302', '5001', '9006020302', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('906020303', '5001', '9006020303', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('906020304', '5001', '9006020304', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906020305', '5001', '9006020305', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('17', '2050', '0011', '0002', 'GENERO ENGRAULIDE', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2043', '1002', '235645', 'ENGRAULIS RINGENS JENYNS', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2066', '0011', 'FICHA 3', '20198441074688', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2066', '0011', 'FICHA 3', '20198441074689', '1000');
INSERT INTO `parametro_copy` VALUES ('9007', '5000', '9007', 'MAESTROS', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('900701', '5000', '900701', 'xajax_Reportes_Biomasa()', 'Biomasa', '1000');
INSERT INTO `parametro_copy` VALUES ('900702', '5000', '900702', 'xajax_Cargar_Frm_Reportes_Ficha2();', 'Socio Económica', '1000');
INSERT INTO `parametro_copy` VALUES ('90070201', '5001', '90070201', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2042', '0011', 'PL-2358-BM', 'CHOLO JUSTO', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2066', '0011', 'FICHA 2', '26598529548288', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2066', '0011', 'FICHA 2', '26598529548289', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2042', '0011', 'GDHS123', 'EL PIRATA', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2066', '0011', 'FICHA 2', '26598529548290', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2043', '1003', '54', 'CABALLA', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '2066', '0011', 'FICHA 3', '26598529548291', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2042', '0011', 'CJSK34', 'EL CHOLO', '1000');
INSERT INTO `parametro_copy` VALUES ('18', '2053', '1018', 'BODEGA INSULADA', 'BODEGA INSULADA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2083', '10', 'BODEGA INSULADA', '.:::. BODEGA INSULADA.:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2083', '1001', 'SI', 'SI', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2083', '1002', 'NO', 'NO', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2066', '0011', 'FICHA 2', '26598529548292', '1000');
INSERT INTO `parametro_copy` VALUES ('11', '2066', '0011', 'FICHA 2', '26598529548293', '1000');
INSERT INTO `parametro_copy` VALUES ('6', '2042', '0011', 'XKSJD', 'LA NAVE', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2066', '0011', 'FICHA 2', '26598529548294', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2042', '0011', 'JAJSDHJCS3', 'EL BRAVO', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2084', '10', 'MATERIAL DE CONSTRUCCIÓN', '.:::.MATERIAL DE CONSTRUCCION.:::.', '0');
INSERT INTO `parametro_copy` VALUES ('900603', '5000', '900603', '', 'Detalle Embarcacíon', '1000');
INSERT INTO `parametro_copy` VALUES ('9060301', '5000', '90060301', 'xajax_Configurar_ParametroAbr(2084)', 'Material de Construcción', '1000');
INSERT INTO `parametro_copy` VALUES ('906030101', '5001', '9006030101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906030102', '5001', '9006030102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('906030103', '5001', '9006030103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('906030104', '5001', '9006030104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906030105', '5001', '9006030105', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2084', '0011', 'MA', 'MADERA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2084', '0011', 'AC', 'ACERO', '1000');
INSERT INTO `parametro_copy` VALUES ('13', '2066', '0011', 'FICHA 2', '26598529548295', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2040', '0011', '44444', 'SAN JOSE', '0');
INSERT INTO `parametro_copy` VALUES ('9', '2040', '0011', '5555', 'ETEN', '1000');
INSERT INTO `parametro_copy` VALUES ('8', '2042', '0011', 'DS12D', 'DAVID', '1000');
INSERT INTO `parametro_copy` VALUES ('900504', '5000', '900504', 'xajax_Mostrar_Ficha4(0,20,1,1)', 'Oceanografía', '1000');
INSERT INTO `parametro_copy` VALUES ('90050401', '5001', '90050401', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('90050402', '5001', '90050402', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('900604', '5000', '900604', '', 'Oceanografía', '1000');
INSERT INTO `parametro_copy` VALUES ('9060401', '5000', '90060401', 'xajax_Listar_Perfiles(0,20,1,1)\r\n', 'Perfil', '1000');
INSERT INTO `parametro_copy` VALUES ('906040101', '5001', '9006040101', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906040102', '5001', '9006040102', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040103', '5001', '9006040103', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040104', '5001', '9006040104', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040105', '5001', '9006040105', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2085', '10', 'PERFIL', '.:::. PERFIL OCEANOGRAFICO .:::.', '0');
INSERT INTO `parametro_copy` VALUES ('1', '2085', '1001', 'PERFIL 1', 'PERFIL 1', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2085', '1002', 'PERFIL 2', 'PERFIL 2', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2085', '1003', 'PERFIL 3', 'PERFIL 3', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2085', '1004', 'PERFIL 4', 'PERFIL 4', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2086', '10', 'ESTACIÓN', '.:::.ESTACIÓNES - PERFIL.:::.', '0');
INSERT INTO `parametro_copy` VALUES ('0', '2087', '10', 'CARRACTERISCAS DE ESTACIÓN', '.:::.CARRACTERISCAS DE ESTACIÓN.:::.', '0');
INSERT INTO `parametro_copy` VALUES ('9060402', '5000', '90060402', 'xajax_Listar_Estaciones(0,20,1,1)', 'Estación', '1000');
INSERT INTO `parametro_copy` VALUES ('906040201', '5001', '9006040201', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906040202', '5001', '9006040202', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040203', '5001', '9006040203', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040204', '5001', '9006040204', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040205', '5001', '9006040205', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2086', '0011', 'ES', 'ESTACION DE PRUEBA', '1000');
INSERT INTO `parametro_copy` VALUES ('0', '2088', '10', 'PARÁMETRO FÍSI/QUÍM\r\n', '.:::.PARÁMETROS FÍSICO/QUÍMICO.:::.', '0');
INSERT INTO `parametro_copy` VALUES ('0', '2089', '10', 'PARÁMETRO PROFUNDIDAD', '.:::.PARÁMETRO PROFUNDIDAD.:::.', '0');
INSERT INTO `parametro_copy` VALUES ('9060403', '5000', '90060403', 'xajax_Configurar_ParametroAbr(2088)', 'Parámetros Fís/Quím\r\n', '1000');
INSERT INTO `parametro_copy` VALUES ('906040301', '5001', '9006040301', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906040302', '5001', '9006040302', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040303', '5001', '9006040303', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040304', '5001', '9006040304', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040305', '5001', '9006040305', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2088', '0011', 'T', 'TEMPERATURA', '1000');
INSERT INTO `parametro_copy` VALUES ('2', '2088', '0011', 'O2', 'OXIGENO', '1000');
INSERT INTO `parametro_copy` VALUES ('3', '2088', '0011', 'S', 'SALINIDAD', '1000');
INSERT INTO `parametro_copy` VALUES ('4', '2088', '0011', 'N', 'NUTRIENTES', '1000');
INSERT INTO `parametro_copy` VALUES ('5', '2088', '0011', 'CL \"A\"', 'CLOROFILA \"A\"', '1000');
INSERT INTO `parametro_copy` VALUES ('9060404', '5000', '90060404', 'xajax_Configurar_Oceanografia_Profundidad(2089)\r\n;', 'Parametros Profundidad', '1000');
INSERT INTO `parametro_copy` VALUES ('906040401', '5001', '9006040401', 'nuevo.png', 'Nuevo', '1000');
INSERT INTO `parametro_copy` VALUES ('906040402', '5001', '9006040402', 'listar.png', 'Listar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040403', '5001', '9006040403', 'editar.png', 'Editar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040404', '5001', '9006040404', 'eliminar.png', 'Eliminar', '1000');
INSERT INTO `parametro_copy` VALUES ('906040405', '5001', '9006040405', 'reporte.png', 'Reportes', '1000');
INSERT INTO `parametro_copy` VALUES ('1', '2089', '0011', '10', '10', '1000');
INSERT INTO `parametro_copy` VALUES ('7', '2044', '0011', '00003', 'ISLA LOS LOBOS DE TIERRA', '1000');
INSERT INTO `parametro_copy` VALUES ('9', '2042', '0011', 'DSXK123', 'EL SOL RADIANTE', '1000');
INSERT INTO `parametro_copy` VALUES ('10', '2042', '0011', 'XCFSD', 'NUEVA EMBARCACION', '1000');
INSERT INTO `parametro_copy` VALUES ('12', '2042', '0011', 'HSDGH', 'EMBARCION POSEIDON', '1000');

-- ----------------------------
-- Table structure for parcoordenada
-- ----------------------------
DROP TABLE IF EXISTS `parcoordenada`;
CREATE TABLE `parcoordenada` (
  `nParCodigo` int(11) NOT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `cParLatitud` varchar(100) DEFAULT NULL,
  `cParLonguitud` varchar(100) DEFAULT NULL,
  `cParAltitud` varchar(100) DEFAULT NULL,
  `cObservacion` text,
  `nEstado` int(11) DEFAULT NULL,
  PRIMARY KEY (`nParCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parcoordenada
-- ----------------------------
INSERT INTO `parcoordenada` VALUES ('1', '2044', '43°30\'50\'\'', '43°30\'50\'\'', '-', 'CALTE DE SAN JOSÉ ', '1');
INSERT INTO `parcoordenada` VALUES ('2', '2044', ' 33°30\'50\'\'', '81°30\'50\'\'', '', 'caleta de santa rosa', '1');
INSERT INTO `parcoordenada` VALUES ('3', '2044', '69°56\'50\'\'', '87°56\'89\'\'', '', 'SSS', '0');
INSERT INTO `parcoordenada` VALUES ('4', '2044', '34°30\'80\'\'', '55°40\'34\'\'', '', 'MONSEFÚ CIUDAD DE LAS FLORES', '1');
INSERT INTO `parcoordenada` VALUES ('7', '2044', '06°26\'', '80°51\'', '', '', '1');

-- ----------------------------
-- Table structure for pardetalle
-- ----------------------------
DROP TABLE IF EXISTS `pardetalle`;
CREATE TABLE `pardetalle` (
  `nParCodigo` int(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `nParItem` int(11) NOT NULL,
  `nParItemS` int(11) NOT NULL,
  `cParDetTexto` text NOT NULL,
  `cParDetTxtRef` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`nParCodigo`,`nParClase`,`nParItem`,`nParItemS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pardetalle
-- ----------------------------
INSERT INTO `pardetalle` VALUES ('1', '2066', '9', '2067', '45234', 'malla');
INSERT INTO `pardetalle` VALUES ('2', '2066', '9', '2067', '34534', 'paños');
INSERT INTO `pardetalle` VALUES ('3', '2066', '9', '2067', '34566', 'paños');
INSERT INTO `pardetalle` VALUES ('6', '2066', '9', '2067', '200', 'c/paños');
INSERT INTO `pardetalle` VALUES ('7', '2066', '9', '2067', '123', 'paños');
INSERT INTO `pardetalle` VALUES ('8', '2066', '9', '2067', '456456', 'paños');
INSERT INTO `pardetalle` VALUES ('10', '2066', '9', '2067', '34', '56');
INSERT INTO `pardetalle` VALUES ('11', '2066', '9', '2067', '12', '3');
INSERT INTO `pardetalle` VALUES ('13', '2066', '9', '2067', '124', '12');

-- ----------------------------
-- Table structure for pardireccion
-- ----------------------------
DROP TABLE IF EXISTS `pardireccion`;
CREATE TABLE `pardireccion` (
  `nParCodigo` int(11) DEFAULT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `cUbigCodigo` varchar(20) DEFAULT NULL,
  `cParGlosa` text COMMENT 'Observacion o Descripcion',
  `nParDirEstado` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pardireccion
-- ----------------------------
INSERT INTO `pardireccion` VALUES ('2', '2030', 'dis01214', 'DISTRITO - SITIO DESEMBARQUE', '1');
INSERT INTO `pardireccion` VALUES ('3', '2030', '00323', 'DISTRITO - SITIO DESEMBARQUE', '1');
INSERT INTO `pardireccion` VALUES ('4', '2030', 'dis00110', 'DISTRITO - SITIO DESEMBARQUE', '1');
INSERT INTO `pardireccion` VALUES ('5', '2030', 'dis00110', 'DISTRITO - SITIO DESEMBARQUE', '0');
INSERT INTO `pardireccion` VALUES ('6', '2040', 'dis01208', 'DISTRITO - SITIO DESEMBARQUE', '0');
INSERT INTO `pardireccion` VALUES ('7', '2040', '00005-f', 'DISTRITO - SITIO DESEMBARQUE', '0');
INSERT INTO `pardireccion` VALUES ('8', '2040', '00011', 'DISTRITO - SITIO DESEMBARQUE', '1');
INSERT INTO `pardireccion` VALUES ('9', '2040', 'dis01204', 'DISTRITO - SITIO DESEMBARQUE', '1');

-- ----------------------------
-- Table structure for parimagen
-- ----------------------------
DROP TABLE IF EXISTS `parimagen`;
CREATE TABLE `parimagen` (
  `nParCodigo` int(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `cParImgRuta` text NOT NULL,
  `nParImgTipo` int(11) NOT NULL,
  `nParImgEstado` int(11) NOT NULL,
  `cGlosa` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parimagen
-- ----------------------------
INSERT INTO `parimagen` VALUES ('1', '1010', 'http://adrisconsulting.com/imagenrecords/img/epicx.png', '1', '1', null);
INSERT INTO `parimagen` VALUES ('1', '1010', 'http://adrisconsulting.com/imagenrecords/img/epicx_detalle.jpg', '2', '1', null);
INSERT INTO `parimagen` VALUES ('2', '1010', 'http://adrisconsulting.com/imagenrecords/img/canon5d.png', '1', '1', null);
INSERT INTO `parimagen` VALUES ('2', '1010', 'http://adrisconsulting.com/imagenrecords/img/canon5d_detalle.jpg', '2', '1', null);

-- ----------------------------
-- Table structure for parparametro
-- ----------------------------
DROP TABLE IF EXISTS `parparametro`;
CREATE TABLE `parparametro` (
  `nParSrcCodigo` int(11) NOT NULL,
  `nParSrcClase` int(11) NOT NULL,
  `nParDstCodigo` int(11) NOT NULL,
  `nParDstClase` int(11) NOT NULL,
  `cValor` varchar(250) DEFAULT NULL,
  `nParEstado` int(11) DEFAULT NULL,
  PRIMARY KEY (`nParSrcCodigo`,`nParSrcClase`,`nParDstCodigo`,`nParDstClase`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parparametro
-- ----------------------------
INSERT INTO `parparametro` VALUES ('900101', '5000', '90010101', '5001', 'xajax_Nuevo_Parametro();', '1');
INSERT INTO `parparametro` VALUES ('900101', '5000', '90010102', '5001', 'xajax_Configurar_Parametro(2040);', '1');
INSERT INTO `parparametro` VALUES ('900101', '5000', '90010103', '5001', 'xajax_Editar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('11', '2049', '12', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('2', '2049', '13', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('17', '2049', '14', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('4', '2050', '15', '2043', ' GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('15', '2043', '1', '2050', 'SARDINAS NOMBRE CIENTIFICO', '1');
INSERT INTO `parparametro` VALUES ('15', '2043', '2', '2050', 'SARDINAS ...', '1');
INSERT INTO `parparametro` VALUES ('1', '2051', '16', '2043', ' GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('4', '2051', '8', '2043', ' GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('9060202', '5000', '906020204', '5001', 'xajax_Eliminar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060202', '5000', '906020205', '5001', 'xajax_Reporte_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('11', '2051', '6', '2043', ' GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('5', '2050', '7', '2043', ' GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('900108', '5000', '90010801', '5001', 'xajax_Nuevo_Embarcacion();', '1');
INSERT INTO `parparametro` VALUES ('900108', '5000', '90010805', '5001', 'xajax_Reportes_Embarcacion(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('5', '2050', '8', '2043', ' GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('5', '2050', '9', '2043', ' GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('900108', '5000', '90010804', '5001', 'xajax_Eliminar_Embarcacion(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900108', '5000', '90010803', '5001', 'xajax_Editar_Embarcacion(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900108', '5000', '90010802', '5001', 'xajax_Listar_Embarcaciones(0,20,1,1);', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '1', '2053', 'GDFGHDFGH', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('9060203', '5000', '906020304', '5001', 'xajax_Eliminar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060203', '5000', '906020305', '5001', 'xajax_Reporte_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '5', '2053', 'EMBARCACION - CONDICIONES DE ADQUISICION ', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '6', '2053', 'EMBARCACION - AÑOS ', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '4', '2053', 'madera', '1');
INSERT INTO `parparametro` VALUES ('9060203', '5000', '906020303', '5001', 'xajax_Editar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9', '2049', '17', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('1', '2050', '2', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('2', '2043', '1', '2051', 'ENGRAULIS RINGENS JENYNS', '1');
INSERT INTO `parparametro` VALUES ('2', '2043', '2', '2051', 'ANCHOVETA, PELADILLA (JUVENILES)', '1');
INSERT INTO `parparametro` VALUES ('4', '2066', '7', '2040', 'FICHA 3(Flota Pesquera) - Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('5', '2066', '7', '2040', 'FICHA 3(Flota Pesquera) - Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('900702', '5000', '90070201', '5001', 'xajax_Cargar_Frm_Reportes_Ficha2();', '1');
INSERT INTO `parparametro` VALUES ('6', '2066', '3', '2042', 'FICHA 2 - PL-2358-BM - CHOLO JUSTO', '1');
INSERT INTO `parparametro` VALUES ('6', '2066', '4', '2040', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('900101', '5000', '90010104', '5001', 'xajax_Eliminar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060201', '5000', '906020104', '5001', 'xajax_Eliminar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('6', '2050', '2', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('4', '2050', '2', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('9060202', '5000', '906020201', '5001', 'xajax_Nuevo_ParametroAbr();', '1');
INSERT INTO `parparametro` VALUES ('900103', '5000', '90010301', '5001', 'xajax_Nuevo_Parametro();', '1');
INSERT INTO `parparametro` VALUES ('900103', '5000', '90010302', '5001', 'xajax_Configurar_Parametro(2041);', '1');
INSERT INTO `parparametro` VALUES ('900103', '5000', '90010303', '5001', 'xajax_Editar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900103', '5000', '90010304', '5001', 'xajax_Eliminar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900106', '5000', '90010601', '5001', 'xajax_Nuevo_Parametro();', '1');
INSERT INTO `parparametro` VALUES ('900106', '5000', '90010602', '5001', 'xajax_Configurar_Parametro(2046);', '1');
INSERT INTO `parparametro` VALUES ('900106', '5000', '90010603', '5001', 'xajax_Editar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900106', '5000', '90010604', '5001', 'xajax_Eliminar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900201', '5000', '90020101', '5001', 'xajax_Nuevo_Pescador();', '1');
INSERT INTO `parparametro` VALUES ('900201', '5000', '90020102', '5001', 'xajax_Listar_Pescadores(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900201', '5000', '90020103', '5001', 'xajax_Editar_Pescador(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900201', '5000', '90020104', '5001', 'xajax_Eliminar_Pescador(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900104', '5000', '90010401', '5001', 'xajax_Nuevo_Zona_Pesca();', '1');
INSERT INTO `parparametro` VALUES ('900104', '5000', '90010402', '5001', 'xajax_Listar_Zonas_Pesca(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900104', '5000', '90010403', '5001', 'xajax_Editar_Zona_Pesca(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900104', '5000', '90010404', '5001', 'xajax_Eliminar_Zona_Pesca(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('11', '2050', '3', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('9060202', '5000', '906020203', '5001', 'xajax_Editar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('5', '2050', '2', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('9060202', '5000', '906020202', '5001', 'xajax_Configurar_ParametroAbr(1004)', '1');
INSERT INTO `parparametro` VALUES ('900301', '5000', '90030101', '5001', 'xajax_Nuevo_Parametro();', '1');
INSERT INTO `parparametro` VALUES ('900304', '5000', '90030401', '5001', 'xajax_Nuevo_Detalle_Especie();', '1');
INSERT INTO `parparametro` VALUES ('900304', '5000', '90030402', '5001', 'xajax_Listar_Detalle_Especies(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900304', '5000', '90030403', '5001', 'xajax_Editar_Detalle_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900304', '5000', '90030404', '5001', 'xajax_Eliminar_Detalle_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900301', '5000', '90030102', '5001', 'xajax_Configurar_Parametro(2049);', '1');
INSERT INTO `parparametro` VALUES ('900301', '5000', '90030103', '5001', 'xajax_Editar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900301', '5000', '90030104', '5001', 'xajax_Eliminar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900302', '5000', '90030201', '5001', 'xajax_Nuevo_Genero();', '1');
INSERT INTO `parparametro` VALUES ('900302', '5000', '90030202', '5001', 'xajax_Listar_Generos(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900302', '5000', '90030203', '5001', 'xajax_Editar_Genero(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900302', '5000', '90030204', '5001', 'xajax_Eliminar_Genero(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('3', '2049', '4', '2050', 'FAMILIA - GENERO ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('3', '2049', '5', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('2', '2049', '6', '2050', 'FAMILIA - GENERO ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('3', '2049', '7', '2050', 'FAMILIA - GENERO ESPECIES', '0');
INSERT INTO `parparametro` VALUES ('3', '2049', '8', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('16', '2049', '2', '2050', 'FAMILIA - GENERO ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('900303', '5000', '90030301', '5001', 'xajax_Nuevo_Especie();', '1');
INSERT INTO `parparametro` VALUES ('900303', '5000', '90030302', '5001', 'xajax_Listar_Especies(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900303', '5000', '90030303', '5001', 'xajax_Mostar_Caracteristicas_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900303', '5000', '90030304', '5001', 'xajax_Eliminar_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('1', '2049', '9', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('1', '2049', '10', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('5', '2050', '1', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('6', '2050', '1', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('4', '2050', '1', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('9060201', '5000', '906020105', '5001', 'xajax_Reporte_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9', '2049', '1', '2050', 'FAMILIA - GENERO ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('9060201', '5000', '906020103', '5001', 'xajax_Editar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('10', '2049', '11', '2050', 'FAMILIA - GENERO ESPECIES', '1');
INSERT INTO `parparametro` VALUES ('1', '2043', '1', '2051', 'NOMBRE CIENTIFICO ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('1', '2043', '2', '2051', 'NOMBRE COMÚN DE ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '7', '2053', 'EMBARCACION - PRECIOS ', '1');
INSERT INTO `parparametro` VALUES ('9060201', '5000', '906020101', '5001', 'xajax_Nuevo_ParametroAbr();', '1');
INSERT INTO `parparametro` VALUES ('9060201', '5000', '906020102', '5001', 'xajax_Configurar_ParametroAbr(1003)', '1');
INSERT INTO `parparametro` VALUES ('5', '2050', '4', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('900103', '5000', '90010305', '5001', 'xajax_Reportes_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900101', '5000', '90010105', '5001', 'xajax_Reportes_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900104', '5000', '90010405', '5001', 'xajax_Reporte_Zonas_Pesca(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900107', '5000', '90010701', '5001', 'xajax_Nuevo_Parametro();', '1');
INSERT INTO `parparametro` VALUES ('900107', '5000', '90010702', '5001', 'xajax_Listar_Artes_Pesca(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900107', '5000', '90010703', '5001', 'xajax_Editar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900107', '5000', '90010704', '5001', 'xajax_Eliminar_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900107', '5000', '90010705', '5001', 'xajax_Reportes_Parametro(xajax.getFormValues(FormPer));return false ;', '1');
INSERT INTO `parparametro` VALUES ('900106', '5000', '90010605', '5001', 'xajax_Reportes_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900301', '5000', '90030105', '5001', 'xajax_Reportes_Parametro(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900302', '5000', '90030205', '5001', 'xajax_Reporte_Genero_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900303', '5000', '90030305', '5001', 'xajax_Reporte_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900401', '5000', '90040101', '5001', 'xajax_Nuevo_Rol();', '1');
INSERT INTO `parparametro` VALUES ('900401', '5000', '90040102', '5001', 'xajax_Mostrar_Roles(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900401', '5000', '90040103', '5001', 'xajax_Load_Rol(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900401', '5000', '90040104', '5001', 'xajax_Eliminar_Rol(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900401', '5000', '90040105', '5001', 'xajax_Reporte_Rol(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900402', '5000', '90040201', '5001', 'xajax_Nuevo_Grupo();', '1');
INSERT INTO `parparametro` VALUES ('900402', '5000', '90040202', '5001', 'xajax_Mostrar_Grupos(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900402', '5000', '90040203', '5001', 'xajax_Load_Grupo(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900402', '5000', '90040204', '5001', 'xajax_Eliminar_Grupo(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900402', '5000', '90040205', '5001', 'xajax_Reporte_Grupo(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900201', '5000', '90020105', '5001', 'xajax_Reporte_Pescador(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900305', '5000', '90030501', '5001', 'xajax_Nuevo_Caracteristicas_Especie();', '1');
INSERT INTO `parparametro` VALUES ('900305', '5000', '90030502', '5001', 'xajax_Listar_Caracteristicas_Especies(0,20,1,1);', '1');
INSERT INTO `parparametro` VALUES ('900305', '5000', '90030503', '5001', 'xajax_Editar_Caracteristicas_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900305', '5000', '90030504', '5001', 'xajax_Eliminar_Caracteristicas_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900305', '5000', '90030505', '5001', 'xajax_Reporte_Caracteristicas_Especie(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900403', '5000', '90040301', '5001', 'xajax_Nuevo_Menu_Grupo_Permisos();', '1');
INSERT INTO `parparametro` VALUES ('900403', '5000', '90040302', '5001', 'xajax_Mostrar_Grupos_Permisos(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900403', '5000', '90040303', '5001', 'xajax_Load_Grupo_Permiso(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900403', '5000', '90040304', '5001', 'xajax_Eliminar_Grupo_Permiso(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900501', '5000', '90050101', '5001', 'xajax_Nuevo_Ficha1();', '1');
INSERT INTO `parparametro` VALUES ('900502', '5000', '90050201', '5001', 'xajax_Nuevo_Ficha2();', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '10', '2053', ' EMBARCACION - EQUIPOS', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '1', '2053', 'HDSND34', '0');
INSERT INTO `parparametro` VALUES ('4', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '0');
INSERT INTO `parparametro` VALUES ('4', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '0');
INSERT INTO `parparametro` VALUES ('5', '2042', '1', '2053', 'djs123', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '1', '2053', 'DSAFE234', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '1', '2053', '6XHS123', '1');
INSERT INTO `parparametro` VALUES ('1', '2066', '7', '2067', 'asdASD', '1');
INSERT INTO `parparametro` VALUES ('1', '2066', '9', '2067', '45234', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('900502', '5000', '90050202', '5001', 'xajax_Mostrar_Ficha2(0,20,1,1);', '1');
INSERT INTO `parparametro` VALUES ('900501', '5000', '90050102', '5001', 'xajax_Mostrar_Ficha1(0,20,1,1);', '1');
INSERT INTO `parparametro` VALUES ('900503', '5000', '90050301', '5001', 'xajax_Nuevo_Ficha3();', '1');
INSERT INTO `parparametro` VALUES ('900503', '5000', '90050302', '5001', 'xajax_Mostrar_Ficha3(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900601', '5000', '90060101', '5001', 'xajax_Nuevo_Entidad_Financiera();', '1');
INSERT INTO `parparametro` VALUES ('900601', '5000', '90060102', '5001', 'xajax_Listar_Entidad_Financiera(0,15,1,1)', '1');
INSERT INTO `parparametro` VALUES ('900601', '5000', '90060103', '5001', 'xajax_Editar_Entidad_Financiera(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900601', '5000', '90060104', '5001', 'xajax_Eliminar_Entidad_Financiera(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('900601', '5000', '90060105', '5001', 'xajax_Reportes_Entidad_Finaciera(xajax.getFormValues(FormPer));return false ;', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '4', '2053', 'sdfsd', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '6', '2053', 'EMBARCACION - AÑOS ', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '5', '2053', 'EMBARCACION - CONDICIONES DE ADQUISICION ', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '7', '2053', 'EMBARCACION - PRECIOS ', '1');
INSERT INTO `parparametro` VALUES ('1', '2066', '6', '2067', '1', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '6', '2053', 'EMBARCACION - AÑOS ', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '4', '2053', 'sdfasd', '1');
INSERT INTO `parparametro` VALUES ('1', '2066', '1', '2042', 'FICHA 2 - XJSKD123 - EL PIRATA DEL MAR', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '1', '2053', 'TRAMITE', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '9', '2053', '20', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '5', '2053', 'EMBARCACION - CONDICIONES DE ADQUISICION ', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '12', '2053', 'EMBARCACION - MOTOR ', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '11', '2053', 'EMBARCACION - TIPO EMBARCACION ', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '10', '2053', ' EMBARCACION - EQUIPOS', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '9', '2053', '12314', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '7', '2053', 'EMBARCACION - PRECIOS ', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '8', '2053', 'EMBARCACION - FORMA DE COMPRA ', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '1', '2053', 'xksl123', '1');
INSERT INTO `parparametro` VALUES ('9060203', '5000', '906020302', '5001', 'xajax_Configurar_ParametroAbr(2069)', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '1', '2067', 'gg', '1');
INSERT INTO `parparametro` VALUES ('3', '2066', '8', '2067', 'd', '1');
INSERT INTO `parparametro` VALUES ('3', '2066', '7', '2067', 'ca', '1');
INSERT INTO `parparametro` VALUES ('3', '2066', '9', '2067', '34566', '1');
INSERT INTO `parparametro` VALUES ('2', '2066', '7', '2067', '3452345', '1');
INSERT INTO `parparametro` VALUES ('2', '2066', '8', '2067', '34534', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '1', '2067', 'sdfasdf', '1');
INSERT INTO `parparametro` VALUES ('3', '2066', '2', '2042', 'FICHA 2 - HDGS45 - SAN PABLO II', '1');
INSERT INTO `parparametro` VALUES ('3', '2066', '6', '2067', '12', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '8', '2053', 'EMBARCACION - FORMA DE COMPRA ', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '9', '2053', '2345', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '10', '2053', ' EMBARCACION - EQUIPOS', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '11', '2053', 'EMBARCACION - TIPO EMBARCACION ', '1');
INSERT INTO `parparametro` VALUES ('2', '2042', '12', '2053', 'EMBARCACION - MOTOR ', '1');
INSERT INTO `parparametro` VALUES ('2', '2066', '6', '2067', '11', '1');
INSERT INTO `parparametro` VALUES ('2', '2066', '9', '2067', '34534', '1');
INSERT INTO `parparametro` VALUES ('5', '2050', '5', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '8', '2053', 'EMBARCACION - FORMA DE COMPRA ', '1');
INSERT INTO `parparametro` VALUES ('9060203', '5000', '906020301', '5001', 'xajax_Nuevo_ParametroAbr();', '1');
INSERT INTO `parparametro` VALUES ('2', '2066', '2', '2042', 'FICHA 2 - HDGS45 - SAN PABLO II', '1');
INSERT INTO `parparametro` VALUES ('1', '2042', '1', '2067', 'ASDsa', '1');
INSERT INTO `parparametro` VALUES ('1', '2066', '8', '2067', '34', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '11', '2053', 'EMBARCACION - TIPO EMBARCACION ', '1');
INSERT INTO `parparametro` VALUES ('3', '2042', '12', '2053', 'EMBARCACION - MOTOR ', '1');
INSERT INTO `parparametro` VALUES ('6', '2066', '6', '2067', '1', '1');
INSERT INTO `parparametro` VALUES ('6', '2066', '9', '2067', '200', '1');
INSERT INTO `parparametro` VALUES ('6', '2066', '7', '2067', 'fondo', '1');
INSERT INTO `parparametro` VALUES ('6', '2066', '8', '2067', '2 años', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '1', '2067', 'en plena faena de pesca se rompen las redes por el lobo', '1');
INSERT INTO `parparametro` VALUES ('7', '2066', '3', '2042', 'FICHA 2 - PL-2358-BM - CHOLO JUSTO', '1');
INSERT INTO `parparametro` VALUES ('7', '2066', '5', '2040', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('7', '2066', '6', '2067', '11', '1');
INSERT INTO `parparametro` VALUES ('7', '2066', '9', '2067', '123', '1');
INSERT INTO `parparametro` VALUES ('7', '2066', '7', '2067', 'fond', '1');
INSERT INTO `parparametro` VALUES ('7', '2066', '8', '2067', '23', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '1', '2067', 'ficha socio economica ', '1');
INSERT INTO `parparametro` VALUES ('8', '2066', '4', '2042', 'FICHA 2 - GDHS123 - EL PIRATA', '1');
INSERT INTO `parparametro` VALUES ('8', '2066', '4', '2040', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '4', '2053', '', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '6', '2053', 'EMBARCACION - AÑOS ', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '5', '2053', 'EMBARCACION - CONDICIONES DE ADQUISICION ', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '7', '2053', 'EMBARCACION - PRECIOS ', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '8', '2053', 'EMBARCACION - FORMA DE COMPRA ', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '9', '2053', '345', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '10', '2053', ' EMBARCACION - EQUIPOS', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '11', '2053', 'EMBARCACION - TIPO EMBARCACION ', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '12', '2053', 'EMBARCACION - MOTOR ', '1');
INSERT INTO `parparametro` VALUES ('8', '2066', '6', '2067', '3', '1');
INSERT INTO `parparametro` VALUES ('8', '2066', '9', '2067', '456456', '1');
INSERT INTO `parparametro` VALUES ('8', '2066', '7', '2067', 'dfd', '1');
INSERT INTO `parparametro` VALUES ('8', '2066', '8', '2067', 'df', '1');
INSERT INTO `parparametro` VALUES ('8', '2042', '1', '2067', 'dfdf', '1');
INSERT INTO `parparametro` VALUES ('1', '2050', '3', '2043', 'GENERO - ESPECIE', '1');
INSERT INTO `parparametro` VALUES ('3', '2043', '1', '2051', 'CABALLA', '1');
INSERT INTO `parparametro` VALUES ('3', '2043', '2', '2051', 'CABALLA', '1');
INSERT INTO `parparametro` VALUES ('9', '2066', '4', '2040', 'FICHA 3(Flota Pesquera) - Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('10', '2066', '4', '2042', 'FICHA 2 - GDHS123 - EL PIRATA', '1');
INSERT INTO `parparametro` VALUES ('10', '2066', '4', '2040', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('4', '2042', '18', '2053', 'EMBARCACION - BODEGA INSULADA ', '1');
INSERT INTO `parparametro` VALUES ('10', '2066', '6', '2067', '2', '1');
INSERT INTO `parparametro` VALUES ('10', '2066', '9', '2067', '34', '1');
INSERT INTO `parparametro` VALUES ('10', '2066', '7', '2067', 'tras mallo', '1');
INSERT INTO `parparametro` VALUES ('10', '2066', '8', '2067', '235', '1');
INSERT INTO `parparametro` VALUES ('10', '2042', '1', '2067', 'ficha 2', '1');
INSERT INTO `parparametro` VALUES ('11', '2066', '5', '2042', 'FICHA 2 - CJSK34 - EL CHOLO', '1');
INSERT INTO `parparametro` VALUES ('11', '2066', '5', '2040', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '4', '2053', '', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '6', '2053', 'EMBARCACION - AÑOS ', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '5', '2053', 'EMBARCACION - CONDICIONES DE ADQUISICION ', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '7', '2053', 'EMBARCACION - PRECIOS ', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '8', '2053', 'EMBARCACION - FORMA DE COMPRA ', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '18', '2053', 'EMBARCACION - BODEGA INSULADA ', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '9', '2053', '', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '10', '2053', ' EMBARCACION - EQUIPOS', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '11', '2053', 'EMBARCACION - TIPO EMBARCACION ', '1');
INSERT INTO `parparametro` VALUES ('5', '2042', '12', '2053', 'EMBARCACION - MOTOR ', '1');
INSERT INTO `parparametro` VALUES ('11', '2066', '6', '2067', '7', '1');
INSERT INTO `parparametro` VALUES ('11', '2066', '9', '2067', '12', '1');
INSERT INTO `parparametro` VALUES ('11', '2066', '7', '2067', 'se rompem', '1');
INSERT INTO `parparametro` VALUES ('11', '2066', '8', '2067', 'sd', '1');
INSERT INTO `parparametro` VALUES ('11', '2042', '1', '2067', 'sd', '1');
INSERT INTO `parparametro` VALUES ('12', '2066', '6', '2042', 'FICHA 2 - XKSJD - LA NAVE', '1');
INSERT INTO `parparametro` VALUES ('12', '2066', '6', '2040', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '4', '2053', '', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '6', '2053', 'EMBARCACION - AÑOS ', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '5', '2053', 'EMBARCACION - CONDICIONES DE ADQUISICION ', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '7', '2053', 'EMBARCACION - PRECIOS ', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '8', '2053', 'EMBARCACION - FORMA DE COMPRA ', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '18', '2053', 'EMBARCACION - BODEGA INSULADA ', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '9', '2053', 'asd', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '10', '2053', ' EMBARCACION - EQUIPOS', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '11', '2053', 'EMBARCACION - TIPO EMBARCACION ', '1');
INSERT INTO `parparametro` VALUES ('6', '2042', '12', '2053', 'EMBARCACION - MOTOR ', '1');
INSERT INTO `parparametro` VALUES ('12', '2066', '6', '2067', '9', '1');
INSERT INTO `parparametro` VALUES ('12', '2066', '7', '2067', 'ssss', '1');
INSERT INTO `parparametro` VALUES ('12', '2066', '8', '2067', 'ddd', '1');
INSERT INTO `parparametro` VALUES ('12', '2042', '1', '2067', 'dd', '1');
INSERT INTO `parparametro` VALUES ('9060301', '5000', '906030101', '5001', 'xajax_Nuevo_ParametroAbr();', '1');
INSERT INTO `parparametro` VALUES ('9060301', '5000', '906030102', '5001', 'xajax_Configurar_ParametroAbr(2084)', '1');
INSERT INTO `parparametro` VALUES ('9060301', '5000', '906030103', '5001', 'xajax_Editar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060301', '5000', '906030104', '5001', 'xajax_Eliminar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060301', '5000', '906030105', '5001', 'xajax_Reporte_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('13', '2066', '7', '2042', 'FICHA 2 - JAJSDHJCS3 - EL BRAVO', '1');
INSERT INTO `parparametro` VALUES ('13', '2066', '2', '2040', 'FICHA 2(Socio Económica)- Lugar(Sitio de Desembarque)', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '4', '2053', '1-MATERIAL DE CONSTRUCCION', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '6', '2053', 'EMBARCACION - AÑOS ', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '5', '2053', 'EMBARCACION - CONDICIONES DE ADQUISICION ', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '7', '2053', 'EMBARCACION - PRECIOS ', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '8', '2053', 'EMBARCACION - FORMA DE COMPRA ', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '18', '2053', 'EMBARCACION - BODEGA INSULADA ', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '9', '2053', '23435', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '10', '2053', ' EMBARCACION - EQUIPOS', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '11', '2053', 'EMBARCACION - TIPO EMBARCACION ', '1');
INSERT INTO `parparametro` VALUES ('7', '2042', '12', '2053', 'EMBARCACION - MOTOR ', '1');
INSERT INTO `parparametro` VALUES ('13', '2066', '6', '2067', '4', '1');
INSERT INTO `parparametro` VALUES ('13', '2066', '9', '2067', '124', '1');
INSERT INTO `parparametro` VALUES ('13', '2066', '7', '2067', 'se rompen', '1');
INSERT INTO `parparametro` VALUES ('13', '2066', '8', '2067', '235445443', '1');
INSERT INTO `parparametro` VALUES ('13', '2042', '1', '2067', 'sdfddddddsssss', '1');
INSERT INTO `parparametro` VALUES ('8', '2042', '1', '2053', 'TRAMITE', '1');
INSERT INTO `parparametro` VALUES ('8', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('8', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('900504', '5000', '90050401', '5001', 'xajax_Nuevo_Ficha4();', '1');
INSERT INTO `parparametro` VALUES ('900504', '5000', '90050402', '5001', 'xajax_Mostrar_Ficha4(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('9060401', '5000', '906040101', '5001', 'xajax_Nuevo_Perfil();', '1');
INSERT INTO `parparametro` VALUES ('9060401', '5000', '906040102', '5001', 'xajax_Listar_Perfiles(0,20,1,1)', '1');
INSERT INTO `parparametro` VALUES ('9060401', '5000', '906040103', '5001', 'xajax_Editar_Perfil(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060401', '5000', '906040104', '5001', 'xajax_Eliminar_Perfil(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060401', '5000', '906040105', '5001', 'xajax_Reporte_Perfil(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060402', '5000', '906040201', '5001', 'xajax_Nuevo_Estacion();', '1');
INSERT INTO `parparametro` VALUES ('9060402', '5000', '906040202', '5001', 'xajax_Listar_Estacion(0,2085,1,1)', '1');
INSERT INTO `parparametro` VALUES ('9060402', '5000', '906040203', '5001', 'xajax_Editar_Estacion(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060402', '5000', '906040204', '5001', 'xajax_Eliminar_Estacion(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060402', '5000', '906040205', '5001', 'xajax_Reporte_Estacion(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('2', '2085', '1', '2086', 'PERFIL  - Estacion ', '1');
INSERT INTO `parparametro` VALUES ('9060403', '5000', '906040301', '5001', 'xajax_Nuevo_ParametroAbr();', '1');
INSERT INTO `parparametro` VALUES ('9060403', '5000', '906040302', '5001', 'xajax_Listar_ParametroAbr(2088)', '1');
INSERT INTO `parparametro` VALUES ('9060403', '5000', '906040303', '5001', 'xajax_Editar_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060403', '5000', '906040304', '5001', 'xajax_Eliminar_Parametro_Fisico_Quimico(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060403', '5000', '906040305', '5001', 'xajax_Reporte_ParametroAbr(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060404', '5000', '906040401', '5001', 'xajax_Nuevo_Profundidad();', '1');
INSERT INTO `parparametro` VALUES ('9060404', '5000', '906040402', '5001', 'xajax_Configurar_Oceanografia_Profundidad(2089)\r\n;', '1');
INSERT INTO `parparametro` VALUES ('9060404', '5000', '906040403', '5001', 'xajax_Editar_Profundidad(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060404', '5000', '906040404', '5001', 'xajax_Eliminar_Profundidad(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9060404', '5000', '906040405', '5001', 'xajax_Reporte_Profundidad(xajax.getFormValues(FormPer));', '1');
INSERT INTO `parparametro` VALUES ('9', '2042', '1', '2053', 'DSXK123', '1');
INSERT INTO `parparametro` VALUES ('9', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('9', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('10', '2042', '1', '2053', 'XCFSD', '1');
INSERT INTO `parparametro` VALUES ('10', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('10', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('11', '2042', '1', '2053', 'XCFSDSD', '1');
INSERT INTO `parparametro` VALUES ('11', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('11', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('12', '2042', '1', '2053', 'HSDGH', '1');
INSERT INTO `parparametro` VALUES ('12', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('12', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('13', '2042', '1', '2053', 'HSDGHW', '1');
INSERT INTO `parparametro` VALUES ('13', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('13', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('14', '2042', '1', '2053', 'HSDGHWS', '1');
INSERT INTO `parparametro` VALUES ('14', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('14', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('15', '2042', '1', '2053', 'HSDGHWSS', '1');
INSERT INTO `parparametro` VALUES ('15', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('15', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('16', '2042', '1', '2053', 'SDSD', '1');
INSERT INTO `parparametro` VALUES ('16', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('16', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('17', '2042', '1', '2053', 'SDSDS', '1');
INSERT INTO `parparametro` VALUES ('17', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('17', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('18', '2042', '1', '2053', 'SFSFFD', '1');
INSERT INTO `parparametro` VALUES ('18', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('18', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');
INSERT INTO `parparametro` VALUES ('19', '2042', '1', '2053', 'SDASAS', '1');
INSERT INTO `parparametro` VALUES ('19', '2042', '2', '2053', 'EMBARCACION - DIMENSION', '1');
INSERT INTO `parparametro` VALUES ('19', '2042', '3', '2053', 'EMBARCACION - CAPACIDAD DE BODEGA ', '1');

-- ----------------------------
-- Table structure for parparext
-- ----------------------------
DROP TABLE IF EXISTS `parparext`;
CREATE TABLE `parparext` (
  `nIntSrcCodigo` int(11) DEFAULT NULL,
  `nIntSrcClase` int(11) DEFAULT NULL,
  `nIntDstCodigo` int(11) DEFAULT NULL,
  `nIntDstClase` int(11) DEFAULT NULL,
  `nObjCodigo` int(11) DEFAULT NULL,
  `nObjTipo` int(11) DEFAULT NULL,
  `cValor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parparext
-- ----------------------------
INSERT INTO `parparext` VALUES ('1', '2042', '2', '2053', '1', '2055', '# eslora');
INSERT INTO `parparext` VALUES ('1', '2042', '2', '2053', '2', '2055', '# manga');
INSERT INTO `parparext` VALUES ('1', '2042', '2', '2053', '3', '2055', '# puntal');
INSERT INTO `parparext` VALUES ('1', '2042', '3', '2053', '1', '2056', '# bodega');
INSERT INTO `parparext` VALUES ('1', '2042', '3', '2053', '2', '2056', '# trb');
INSERT INTO `parparext` VALUES ('1', '2042', '3', '2053', '3', '2056', '# trn ');
INSERT INTO `parparext` VALUES ('2', '2042', '2', '2053', '1', '2055', '# eslora ');
INSERT INTO `parparext` VALUES ('2', '2042', '2', '2053', '2', '2055', 'manga');
INSERT INTO `parparext` VALUES ('2', '2042', '2', '2053', '3', '2055', 'puntal');
INSERT INTO `parparext` VALUES ('2', '2042', '3', '2053', '1', '2056', 'bodega');
INSERT INTO `parparext` VALUES ('2', '2042', '3', '2053', '2', '2056', 'trb');
INSERT INTO `parparext` VALUES ('2', '2042', '3', '2053', '3', '2056', 'trn');
INSERT INTO `parparext` VALUES ('1', '2042', '6', '2053', '1', '2062', 'sdfasdf');
INSERT INTO `parparext` VALUES ('1', '2042', '6', '2053', '2', '2062', 'asdfads');
INSERT INTO `parparext` VALUES ('1', '2042', '6', '2053', '3', '2062', '1999');
INSERT INTO `parparext` VALUES ('1', '2042', '6', '2053', '4', '2062', '345234');
INSERT INTO `parparext` VALUES ('1', '2042', '5', '2053', '2', '2057', 'CONSTRUCCIÓN');
INSERT INTO `parparext` VALUES ('1', '2042', '7', '2053', '1', '2063', 'asdfasd');
INSERT INTO `parparext` VALUES ('1', '2042', '7', '2053', '2', '2063', '2452345');
INSERT INTO `parparext` VALUES ('1', '2042', '8', '2053', '1', '2058', 'CONTADO');
INSERT INTO `parparext` VALUES ('1', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('1', '2042', '11', '2053', '1', '2060', 'NO MECANIZADO');
INSERT INTO `parparext` VALUES ('1', '2042', '12', '2053', '1', '2061', 'dfgsdfg');
INSERT INTO `parparext` VALUES ('1', '2042', '12', '2053', '2', '2061', '');
INSERT INTO `parparext` VALUES ('1', '2042', '12', '2053', '3', '2061', 'NUEVO');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '1', '2062', 'asdfsadf');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '2', '2062', '345');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '3', '2062', '34534');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '4', '2062', '45');
INSERT INTO `parparext` VALUES ('2', '2042', '5', '2053', '1', '2057', 'HERENCIA');
INSERT INTO `parparext` VALUES ('2', '2042', '7', '2053', '1', '2063', '2345');
INSERT INTO `parparext` VALUES ('2', '2042', '7', '2053', '2', '2063', '45');
INSERT INTO `parparext` VALUES ('2', '2042', '8', '2053', '1', '2058', 'CONTADO');
INSERT INTO `parparext` VALUES ('2', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('2', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('2', '2042', '11', '2053', '1', '2060', 'NO MECANIZADO');
INSERT INTO `parparext` VALUES ('2', '2042', '12', '2053', '1', '2061', '3452345');
INSERT INTO `parparext` VALUES ('2', '2042', '12', '2053', '2', '2061', '');
INSERT INTO `parparext` VALUES ('2', '2042', '12', '2053', '3', '2061', 'NUEVO');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '1', '2062', 'asdfsadf');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '2', '2062', '345');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '3', '2062', '34534');
INSERT INTO `parparext` VALUES ('2', '2042', '6', '2053', '4', '2062', '45');
INSERT INTO `parparext` VALUES ('2', '2042', '5', '2053', '1', '2057', 'HERENCIA');
INSERT INTO `parparext` VALUES ('2', '2042', '7', '2053', '1', '2063', '2345');
INSERT INTO `parparext` VALUES ('2', '2042', '7', '2053', '2', '2063', '45');
INSERT INTO `parparext` VALUES ('2', '2042', '8', '2053', '1', '2058', 'CONTADO');
INSERT INTO `parparext` VALUES ('2', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('2', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('2', '2042', '11', '2053', '1', '2060', 'NO MECANIZADO');
INSERT INTO `parparext` VALUES ('2', '2042', '12', '2053', '1', '2061', '3452345');
INSERT INTO `parparext` VALUES ('2', '2042', '12', '2053', '2', '2061', '');
INSERT INTO `parparext` VALUES ('2', '2042', '12', '2053', '3', '2061', 'NUEVO');
INSERT INTO `parparext` VALUES ('3', '2042', '2', '2053', '1', '2055', '9.20');
INSERT INTO `parparext` VALUES ('3', '2042', '2', '2053', '2', '2055', '3.35');
INSERT INTO `parparext` VALUES ('3', '2042', '2', '2053', '3', '2055', '1.45');
INSERT INTO `parparext` VALUES ('3', '2042', '3', '2053', '1', '2056', '10');
INSERT INTO `parparext` VALUES ('3', '2042', '3', '2053', '2', '2056', '');
INSERT INTO `parparext` VALUES ('3', '2042', '3', '2053', '3', '2056', '6.42');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '1', '2062', '1993');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '2', '2062', '22');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '3', '2062', '1993');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '4', '2062', '15');
INSERT INTO `parparext` VALUES ('3', '2042', '5', '2053', '2', '2057', 'CONSTRUCCIÓN');
INSERT INTO `parparext` VALUES ('3', '2042', '7', '2053', '1', '2063', '35000');
INSERT INTO `parparext` VALUES ('3', '2042', '7', '2053', '2', '2063', '18000');
INSERT INTO `parparext` VALUES ('3', '2042', '8', '2053', '2', '2058', 'por partes ');
INSERT INTO `parparext` VALUES ('3', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('3', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('3', '2042', '10', '2053', '3', '2059', 'RADIO');
INSERT INTO `parparext` VALUES ('3', '2042', '11', '2053', '3', '2060', 'FUERA DE BORDA ');
INSERT INTO `parparext` VALUES ('3', '2042', '12', '2053', '1', '2061', 'mitsubishi');
INSERT INTO `parparext` VALUES ('3', '2042', '12', '2053', '2', '2061', '140');
INSERT INTO `parparext` VALUES ('3', '2042', '12', '2053', '3', '2061', 'NUEVO');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '1', '2062', '1993');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '2', '2062', '22');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '3', '2062', '1993');
INSERT INTO `parparext` VALUES ('3', '2042', '6', '2053', '4', '2062', '15');
INSERT INTO `parparext` VALUES ('3', '2042', '5', '2053', '2', '2057', 'CONSTRUCCIÓN');
INSERT INTO `parparext` VALUES ('3', '2042', '7', '2053', '1', '2063', '35000');
INSERT INTO `parparext` VALUES ('3', '2042', '7', '2053', '2', '2063', '18000');
INSERT INTO `parparext` VALUES ('3', '2042', '8', '2053', '2', '2058', 'por partes ');
INSERT INTO `parparext` VALUES ('3', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('3', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('3', '2042', '10', '2053', '3', '2059', 'RADIO');
INSERT INTO `parparext` VALUES ('3', '2042', '11', '2053', '3', '2060', 'FUERA DE BORDA ');
INSERT INTO `parparext` VALUES ('3', '2042', '12', '2053', '1', '2061', 'mitsubishi');
INSERT INTO `parparext` VALUES ('3', '2042', '12', '2053', '2', '2061', '140');
INSERT INTO `parparext` VALUES ('3', '2042', '12', '2053', '3', '2061', 'NUEVO');
INSERT INTO `parparext` VALUES ('4', '2042', '2', '2053', '1', '2055', '2.45');
INSERT INTO `parparext` VALUES ('4', '2042', '2', '2053', '2', '2055', '23.6');
INSERT INTO `parparext` VALUES ('4', '2042', '2', '2053', '3', '2055', '5.4');
INSERT INTO `parparext` VALUES ('4', '2042', '3', '2053', '1', '2056', '6.5');
INSERT INTO `parparext` VALUES ('4', '2042', '3', '2053', '2', '2056', '5.6');
INSERT INTO `parparext` VALUES ('4', '2042', '3', '2053', '3', '2056', '45.4');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '1', '2062', '');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '2', '2062', '1995');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '3', '2062', 'we');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '4', '2062', '');
INSERT INTO `parparext` VALUES ('4', '2042', '5', '2053', '1', '2057', 'HERENCIA');
INSERT INTO `parparext` VALUES ('4', '2042', '7', '2053', '1', '2063', '345');
INSERT INTO `parparext` VALUES ('4', '2042', '7', '2053', '2', '2063', 'rt');
INSERT INTO `parparext` VALUES ('4', '2042', '8', '2053', '1', '2058', 'CONTADO');
INSERT INTO `parparext` VALUES ('4', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('4', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('4', '2042', '10', '2053', '3', '2059', 'RADIO');
INSERT INTO `parparext` VALUES ('4', '2042', '11', '2053', '1', '2060', 'NO MECANIZADO');
INSERT INTO `parparext` VALUES ('4', '2042', '12', '2053', '1', '2061', 'toyota');
INSERT INTO `parparext` VALUES ('4', '2042', '12', '2053', '2', '2061', 'erre');
INSERT INTO `parparext` VALUES ('4', '2042', '12', '2053', '3', '2061', 'USADO');
INSERT INTO `parparext` VALUES ('5', '2042', '2', '2053', '1', '2055', '3.4');
INSERT INTO `parparext` VALUES ('5', '2042', '2', '2053', '2', '2055', '6.6');
INSERT INTO `parparext` VALUES ('5', '2042', '2', '2053', '3', '2055', '4.6');
INSERT INTO `parparext` VALUES ('5', '2042', '3', '2053', '1', '2056', '5.4');
INSERT INTO `parparext` VALUES ('5', '2042', '3', '2053', '2', '2056', '5.6');
INSERT INTO `parparext` VALUES ('5', '2042', '3', '2053', '3', '2056', '75');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '1', '2062', '');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '2', '2062', '1995');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '3', '2062', 'we');
INSERT INTO `parparext` VALUES ('4', '2042', '6', '2053', '4', '2062', '');
INSERT INTO `parparext` VALUES ('4', '2042', '5', '2053', '1', '2057', 'HERENCIA');
INSERT INTO `parparext` VALUES ('4', '2042', '7', '2053', '1', '2063', '345');
INSERT INTO `parparext` VALUES ('4', '2042', '7', '2053', '2', '2063', 'rt');
INSERT INTO `parparext` VALUES ('4', '2042', '8', '2053', '1', '2058', 'CONTADO');
INSERT INTO `parparext` VALUES ('4', '2042', '18', '2053', '1', '2083', 'SI');
INSERT INTO `parparext` VALUES ('4', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('4', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('4', '2042', '10', '2053', '3', '2059', 'RADIO');
INSERT INTO `parparext` VALUES ('4', '2042', '11', '2053', '1', '2060', 'NO MECANIZADO');
INSERT INTO `parparext` VALUES ('4', '2042', '12', '2053', '1', '2061', 'toyota');
INSERT INTO `parparext` VALUES ('4', '2042', '12', '2053', '2', '2061', 'erre');
INSERT INTO `parparext` VALUES ('4', '2042', '12', '2053', '3', '2061', 'USADO');
INSERT INTO `parparext` VALUES ('5', '2042', '6', '2053', '1', '2062', '');
INSERT INTO `parparext` VALUES ('5', '2042', '6', '2053', '2', '2062', '23');
INSERT INTO `parparext` VALUES ('5', '2042', '6', '2053', '3', '2062', '1900');
INSERT INTO `parparext` VALUES ('5', '2042', '6', '2053', '4', '2062', '20');
INSERT INTO `parparext` VALUES ('5', '2042', '5', '2053', '1', '2057', 'HERENCIA');
INSERT INTO `parparext` VALUES ('5', '2042', '7', '2053', '1', '2063', '434');
INSERT INTO `parparext` VALUES ('5', '2042', '7', '2053', '2', '2063', '2000');
INSERT INTO `parparext` VALUES ('5', '2042', '8', '2053', '2', '2058', '');
INSERT INTO `parparext` VALUES ('5', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('5', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('5', '2042', '11', '2053', '2', '2060', 'MECANIZADO INTERIOR');
INSERT INTO `parparext` VALUES ('5', '2042', '12', '2053', '1', '2061', 'toyota');
INSERT INTO `parparext` VALUES ('5', '2042', '12', '2053', '2', '2061', '');
INSERT INTO `parparext` VALUES ('5', '2042', '12', '2053', '3', '2061', 'USADO');
INSERT INTO `parparext` VALUES ('6', '2042', '2', '2053', '1', '2055', '12');
INSERT INTO `parparext` VALUES ('6', '2042', '2', '2053', '2', '2055', '3');
INSERT INTO `parparext` VALUES ('6', '2042', '2', '2053', '3', '2055', '4');
INSERT INTO `parparext` VALUES ('6', '2042', '3', '2053', '1', '2056', '5');
INSERT INTO `parparext` VALUES ('6', '2042', '3', '2053', '2', '2056', '5');
INSERT INTO `parparext` VALUES ('6', '2042', '3', '2053', '3', '2056', '4');
INSERT INTO `parparext` VALUES ('6', '2042', '6', '2053', '1', '2062', '');
INSERT INTO `parparext` VALUES ('6', '2042', '6', '2053', '2', '2062', '2000|');
INSERT INTO `parparext` VALUES ('6', '2042', '6', '2053', '3', '2062', '1995');
INSERT INTO `parparext` VALUES ('6', '2042', '6', '2053', '4', '2062', '10');
INSERT INTO `parparext` VALUES ('6', '2042', '5', '2053', '2', '2057', 'CONSTRUCCIÓN');
INSERT INTO `parparext` VALUES ('6', '2042', '7', '2053', '1', '2063', '7000');
INSERT INTO `parparext` VALUES ('6', '2042', '7', '2053', '2', '2063', '32');
INSERT INTO `parparext` VALUES ('6', '2042', '8', '2053', '1', '2058', 'CONTADO');
INSERT INTO `parparext` VALUES ('6', '2042', '18', '2053', '1', '2083', 'SI');
INSERT INTO `parparext` VALUES ('6', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('6', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('6', '2042', '12', '2053', '1', '2061', 'nissan');
INSERT INTO `parparext` VALUES ('6', '2042', '12', '2053', '2', '2061', '45');
INSERT INTO `parparext` VALUES ('6', '2042', '12', '2053', '3', '2061', 'USADO');
INSERT INTO `parparext` VALUES ('7', '2042', '2', '2053', '1', '2055', '45');
INSERT INTO `parparext` VALUES ('7', '2042', '2', '2053', '2', '2055', '4');
INSERT INTO `parparext` VALUES ('7', '2042', '2', '2053', '3', '2055', '2');
INSERT INTO `parparext` VALUES ('7', '2042', '3', '2053', '1', '2056', '78');
INSERT INTO `parparext` VALUES ('7', '2042', '3', '2053', '2', '2056', '98');
INSERT INTO `parparext` VALUES ('7', '2042', '3', '2053', '3', '2056', '0');
INSERT INTO `parparext` VALUES ('7', '2042', '4', '2053', '1', '2084', 'MATERIAL DE CONSTRUCCION');
INSERT INTO `parparext` VALUES ('7', '2042', '6', '2053', '1', '2062', '1900');
INSERT INTO `parparext` VALUES ('7', '2042', '6', '2053', '2', '2062', '2000');
INSERT INTO `parparext` VALUES ('7', '2042', '6', '2053', '3', '2062', '1990');
INSERT INTO `parparext` VALUES ('7', '2042', '6', '2053', '4', '2062', '1243');
INSERT INTO `parparext` VALUES ('7', '2042', '5', '2053', '1', '2057', 'HERENCIA');
INSERT INTO `parparext` VALUES ('7', '2042', '7', '2053', '1', '2063', '34533');
INSERT INTO `parparext` VALUES ('7', '2042', '7', '2053', '2', '2063', '123434');
INSERT INTO `parparext` VALUES ('7', '2042', '8', '2053', '1', '2058', 'CONTADO');
INSERT INTO `parparext` VALUES ('7', '2042', '18', '2053', '2', '2083', 'NO');
INSERT INTO `parparext` VALUES ('7', '2042', '10', '2053', '1', '2059', 'NAVEGADOR');
INSERT INTO `parparext` VALUES ('7', '2042', '10', '2053', '2', '2059', 'ECOSONDA');
INSERT INTO `parparext` VALUES ('7', '2042', '10', '2053', '3', '2059', 'RADIO');
INSERT INTO `parparext` VALUES ('7', '2042', '11', '2053', '1', '2060', 'NO MECANIZADO');
INSERT INTO `parparext` VALUES ('7', '2042', '12', '2053', '1', '2061', 'toyota ');
INSERT INTO `parparext` VALUES ('7', '2042', '12', '2053', '2', '2061', '');
INSERT INTO `parparext` VALUES ('7', '2042', '12', '2053', '3', '2061', 'NUEVO');
INSERT INTO `parparext` VALUES ('8', '2042', '2', '2053', '1', '2055', '2.5');
INSERT INTO `parparext` VALUES ('8', '2042', '2', '2053', '2', '2055', '4');
INSERT INTO `parparext` VALUES ('8', '2042', '2', '2053', '3', '2055', '5');
INSERT INTO `parparext` VALUES ('8', '2042', '3', '2053', '1', '2056', '6');
INSERT INTO `parparext` VALUES ('8', '2042', '3', '2053', '2', '2056', '6');
INSERT INTO `parparext` VALUES ('8', '2042', '3', '2053', '3', '2056', '7');
INSERT INTO `parparext` VALUES ('9', '2042', '2', '2053', '1', '2055', '12');
INSERT INTO `parparext` VALUES ('9', '2042', '2', '2053', '2', '2055', '6.4');
INSERT INTO `parparext` VALUES ('9', '2042', '2', '2053', '3', '2055', '4.3');
INSERT INTO `parparext` VALUES ('9', '2042', '3', '2053', '1', '2056', '34');
INSERT INTO `parparext` VALUES ('9', '2042', '3', '2053', '2', '2056', '0.0');
INSERT INTO `parparext` VALUES ('9', '2042', '3', '2053', '3', '2056', '3.4');
INSERT INTO `parparext` VALUES ('10', '2042', '2', '2053', '1', '2055', '34.4');
INSERT INTO `parparext` VALUES ('10', '2042', '2', '2053', '2', '2055', '5.42');
INSERT INTO `parparext` VALUES ('10', '2042', '2', '2053', '3', '2055', '23.4');
INSERT INTO `parparext` VALUES ('10', '2042', '3', '2053', '1', '2056', '5.53');
INSERT INTO `parparext` VALUES ('10', '2042', '3', '2053', '2', '2056', '3.4');
INSERT INTO `parparext` VALUES ('10', '2042', '3', '2053', '3', '2056', '.34');
INSERT INTO `parparext` VALUES ('11', '2042', '2', '2053', '1', '2055', '34.4');
INSERT INTO `parparext` VALUES ('11', '2042', '2', '2053', '2', '2055', '5.42');
INSERT INTO `parparext` VALUES ('11', '2042', '2', '2053', '3', '2055', '23.4');
INSERT INTO `parparext` VALUES ('11', '2042', '3', '2053', '1', '2056', '5.53');
INSERT INTO `parparext` VALUES ('11', '2042', '3', '2053', '2', '2056', '3.4');
INSERT INTO `parparext` VALUES ('11', '2042', '3', '2053', '3', '2056', '.34');
INSERT INTO `parparext` VALUES ('12', '2042', '2', '2053', '1', '2055', '3.41');
INSERT INTO `parparext` VALUES ('12', '2042', '2', '2053', '2', '2055', '4.32');
INSERT INTO `parparext` VALUES ('12', '2042', '2', '2053', '3', '2055', '4.43');
INSERT INTO `parparext` VALUES ('12', '2042', '3', '2053', '1', '2056', '3.54');
INSERT INTO `parparext` VALUES ('12', '2042', '3', '2053', '2', '2056', '2.43');
INSERT INTO `parparext` VALUES ('12', '2042', '3', '2053', '3', '2056', '3,5');
INSERT INTO `parparext` VALUES ('13', '2042', '2', '2053', '1', '2055', '3.41');
INSERT INTO `parparext` VALUES ('13', '2042', '2', '2053', '2', '2055', '4.32');
INSERT INTO `parparext` VALUES ('13', '2042', '2', '2053', '3', '2055', '4.43');
INSERT INTO `parparext` VALUES ('13', '2042', '3', '2053', '1', '2056', '3.54');
INSERT INTO `parparext` VALUES ('13', '2042', '3', '2053', '2', '2056', '2.43');
INSERT INTO `parparext` VALUES ('13', '2042', '3', '2053', '3', '2056', '3,5');
INSERT INTO `parparext` VALUES ('14', '2042', '2', '2053', '1', '2055', '3.41');
INSERT INTO `parparext` VALUES ('14', '2042', '2', '2053', '2', '2055', '4.32');
INSERT INTO `parparext` VALUES ('14', '2042', '2', '2053', '3', '2055', '4.43');
INSERT INTO `parparext` VALUES ('14', '2042', '3', '2053', '1', '2056', '3.54');
INSERT INTO `parparext` VALUES ('14', '2042', '3', '2053', '2', '2056', '2.43');
INSERT INTO `parparext` VALUES ('14', '2042', '3', '2053', '3', '2056', '3,5');
INSERT INTO `parparext` VALUES ('15', '2042', '2', '2053', '1', '2055', '3.41');
INSERT INTO `parparext` VALUES ('15', '2042', '2', '2053', '2', '2055', '4.32');
INSERT INTO `parparext` VALUES ('15', '2042', '2', '2053', '3', '2055', '4.43');
INSERT INTO `parparext` VALUES ('15', '2042', '3', '2053', '1', '2056', '3.54');
INSERT INTO `parparext` VALUES ('15', '2042', '3', '2053', '2', '2056', '2.43');
INSERT INTO `parparext` VALUES ('15', '2042', '3', '2053', '3', '2056', '3,5');
INSERT INTO `parparext` VALUES ('16', '2042', '2', '2053', '1', '2055', 'DSD');
INSERT INTO `parparext` VALUES ('16', '2042', '2', '2053', '2', '2055', 'SDSD');
INSERT INTO `parparext` VALUES ('16', '2042', '2', '2053', '3', '2055', 'SDSD');
INSERT INTO `parparext` VALUES ('16', '2042', '3', '2053', '1', '2056', 'SD');
INSERT INTO `parparext` VALUES ('16', '2042', '3', '2053', '2', '2056', 'SD');
INSERT INTO `parparext` VALUES ('16', '2042', '3', '2053', '3', '2056', 'SD');
INSERT INTO `parparext` VALUES ('17', '2042', '2', '2053', '1', '2055', 'DSD');
INSERT INTO `parparext` VALUES ('17', '2042', '2', '2053', '2', '2055', 'SDSD');
INSERT INTO `parparext` VALUES ('17', '2042', '2', '2053', '3', '2055', 'SDSD');
INSERT INTO `parparext` VALUES ('17', '2042', '3', '2053', '1', '2056', 'SD');
INSERT INTO `parparext` VALUES ('17', '2042', '3', '2053', '2', '2056', 'SD');
INSERT INTO `parparext` VALUES ('17', '2042', '3', '2053', '3', '2056', 'SD');
INSERT INTO `parparext` VALUES ('18', '2042', '2', '2053', '1', '2055', '123');
INSERT INTO `parparext` VALUES ('18', '2042', '2', '2053', '2', '2055', '345');
INSERT INTO `parparext` VALUES ('18', '2042', '2', '2053', '3', '2055', '345');
INSERT INTO `parparext` VALUES ('18', '2042', '3', '2053', '1', '2056', '345');
INSERT INTO `parparext` VALUES ('18', '2042', '3', '2053', '2', '2056', '5');
INSERT INTO `parparext` VALUES ('18', '2042', '3', '2053', '3', '2056', '534543');
INSERT INTO `parparext` VALUES ('19', '2042', '2', '2053', '1', '2055', '3');
INSERT INTO `parparext` VALUES ('19', '2042', '2', '2053', '2', '2055', '3');
INSERT INTO `parparext` VALUES ('19', '2042', '2', '2053', '3', '2055', '4');
INSERT INTO `parparext` VALUES ('19', '2042', '3', '2053', '1', '2056', '3');
INSERT INTO `parparext` VALUES ('19', '2042', '3', '2053', '2', '2056', '4');
INSERT INTO `parparext` VALUES ('19', '2042', '3', '2053', '3', '2056', '5');

-- ----------------------------
-- Table structure for parserporpersona
-- ----------------------------
DROP TABLE IF EXISTS `parserporpersona`;
CREATE TABLE `parserporpersona` (
  `nParSerCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `cPerCodigo` varchar(20) NOT NULL,
  `dParSerFecha` datetime NOT NULL,
  `nParSrcCodigo` int(11) NOT NULL,
  `nParSrcClase` int(11) NOT NULL,
  `nParDstCodigo` int(11) NOT NULL,
  `nParDstClase` int(11) NOT NULL,
  `nParSerPorcentaje` int(11) NOT NULL,
  `nParSerEstado` int(11) NOT NULL,
  PRIMARY KEY (`nParSerCodigo`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parserporpersona
-- ----------------------------

-- ----------------------------
-- Table structure for percontacto
-- ----------------------------
DROP TABLE IF EXISTS `percontacto`;
CREATE TABLE `percontacto` (
  `cPerJurCodigo` varchar(20) NOT NULL,
  `cPerCodigo` varchar(20) NOT NULL,
  `nPerConEstado` int(11) NOT NULL,
  `cPerObservacion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of percontacto
-- ----------------------------

-- ----------------------------
-- Table structure for percuenta
-- ----------------------------
DROP TABLE IF EXISTS `percuenta`;
CREATE TABLE `percuenta` (
  `nPerCtaCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `cPerCodigo` varchar(20) NOT NULL,
  `cNroCuenta` varchar(20) NOT NULL,
  `nPerCtaTipo` int(11) NOT NULL,
  `cPerJurCodigo` varchar(20) NOT NULL,
  `nMonCodigo` int(11) NOT NULL,
  `nPerCtaEstado` int(11) NOT NULL,
  PRIMARY KEY (`nPerCtaCodigo`)
) ENGINE=MyISAM AUTO_INCREMENT=655679382 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of percuenta
-- ----------------------------

-- ----------------------------
-- Table structure for perdireccion
-- ----------------------------
DROP TABLE IF EXISTS `perdireccion`;
CREATE TABLE `perdireccion` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece esta direccion',
  `nUbiCodigo` int(11) NOT NULL COMMENT 'Codigo del ubigeo de esta direccion',
  `nPerDirTipo` int(11) NOT NULL COMMENT 'Codigo del tipo de la direccion (Casa - trabajo)',
  `nPerRelTipo` int(11) DEFAULT NULL,
  `cPerDirDescripcion` varchar(500) NOT NULL COMMENT 'Descripcion de la direccion',
  `cPerDirGlosa` varchar(500) DEFAULT NULL,
  `nPerDirEstado` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Se registra la diferentes direcciones de una persona';

-- ----------------------------
-- Records of perdireccion
-- ----------------------------
INSERT INTO `perdireccion` VALUES ('100000100001', '0', '1', '2005', 'DIEGO FERRE MONSEFU', 'PESCADOR', '1');
INSERT INTO `perdireccion` VALUES ('100000100002', '0', '1', '2005', 'CALLANCA', 'PESCADOR', '1');
INSERT INTO `perdireccion` VALUES ('100000100003', '0', '1', '2005', 'CIUDAD ETEN', 'PESCADOR', '1');
INSERT INTO `perdireccion` VALUES ('100000100004', '0', '1', '2005', 'PUEBLO JOVEN', 'PESCADOR', '1');
INSERT INTO `perdireccion` VALUES ('100000100012', '0', '1', '2005', 'SAN JOSE 123', 'PESCADOR', '1');
INSERT INTO `perdireccion` VALUES ('100000100013', '0', '1', '2005', 'ADFAJHSDGFJHASDVF', 'PESCADOR', '1');

-- ----------------------------
-- Table structure for perdocumento
-- ----------------------------
DROP TABLE IF EXISTS `perdocumento`;
CREATE TABLE `perdocumento` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este documento. ',
  `nPerDocTipo` int(11) NOT NULL COMMENT 'Codigo del tipo de documento',
  `cPerDocNumero` varchar(250) NOT NULL COMMENT 'Numero del documento',
  `dPerDocCaducidad` date NOT NULL,
  `nPerDocCategoria` int(11) DEFAULT NULL,
  `nPerDocEstado` int(11) NOT NULL DEFAULT '1',
  UNIQUE KEY `idx_cPerDocNumero` (`cPerDocNumero`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Se registra los diferentes documentos de una persona ';

-- ----------------------------
-- Records of perdocumento
-- ----------------------------
INSERT INTO `perdocumento` VALUES ('100000100001', '1', '25463456', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100002', '1', '43378389', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100003', '1', '73465826', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100004', '1', '47626870', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100005', '2', '3459234795', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100006', '2', '20100047218', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100007', '2', '20504565794', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100008', '2', '2352345564', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100009', '2', '45345345345', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100010', '2', '234523452345', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100011', '2', '32452345435', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100012', '1', '23524656', '0000-00-00', '0', '1');
INSERT INTO `perdocumento` VALUES ('100000100013', '1', '36456574', '0000-00-00', '0', '1');

-- ----------------------------
-- Table structure for perdomicilio
-- ----------------------------
DROP TABLE IF EXISTS `perdomicilio`;
CREATE TABLE `perdomicilio` (
  `cPerCodigo` varchar(20) NOT NULL,
  `nParCodigo` int(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `cPerDomValor` varchar(250) DEFAULT NULL,
  `dPerDomFecha` date DEFAULT NULL,
  `nPerDomEstado` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perdomicilio
-- ----------------------------
INSERT INTO `perdomicilio` VALUES ('100000100009', '1', '2070', 'VIVIENDA-UBICACÓN-ÁREA URBANA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100009', '2', '2071', 'VIVIENDA-CONDICIÓN-ALQUILADA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100009', '2', '2072', 'VIVIENDA-TIPO-EN QUINTA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100009', '2', '2073', '4', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100009', '1', '2074', 'VIVIENDA-METERIAL-LADRILLO', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100009', '1', '2075', '100000000013', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100009', '3', '2076', 'DESAGUE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100008', '2', '2070', 'VIVIENDA-UBICACÓN-ÁREA RURAL', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100008', '1', '2071', 'VIVIENDA-CONDICIÓN-PROPIA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100008', '4', '2072', 'VIVIENDA-TIPO-IMPROVISADA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100008', '2', '2073', '0', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100008', '1', '2074', 'VIVIENDA-METERIAL-LADRILLO', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100008', '1', '2075', '100000000012', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100008', '3', '2076', 'DESAGUE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2070', 'VIVIENDA-UBICACÓN-ÁREA RURAL', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2071', 'VIVIENDA-CONDICIÓN-PROPIA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2072', 'VIVIENDA-TIPO-CASA INDEPENDIENTE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2073', '4', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '3', '2074', 'VIVIENDA-METERIAL-ADOBE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2075', '100000100006', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2076', 'AGUA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2076', 'LUZ', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2070', 'VIVIENDA-UBICACÓN-ÁREA RURAL', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2071', 'VIVIENDA-CONDICIÓN-PROPIA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2072', 'VIVIENDA-TIPO-CASA INDEPENDIENTE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2073', '4', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '3', '2074', 'VIVIENDA-METERIAL-ADOBE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2075', '100000100006', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2076', 'AGUA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2076', 'LUZ', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2070', 'VIVIENDA-UBICACÓN-ÁREA RURAL', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2071', 'VIVIENDA-CONDICIÓN-PROPIA', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '1', '2072', 'VIVIENDA-TIPO-CASA INDEPENDIENTE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2073', '4', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '3', '2074', 'VIVIENDA-METERIAL-ADOBE', '0000-00-00', '1');
INSERT INTO `perdomicilio` VALUES ('100000100002', '2', '2075', 'VIVIENDA-CREDITO DE CONSTRUCCIÓN - NO FINANCIADO', '0000-00-00', '1');

-- ----------------------------
-- Table structure for pergrado
-- ----------------------------
DROP TABLE IF EXISTS `pergrado`;
CREATE TABLE `pergrado` (
  `cPerCodigo` varchar(20) NOT NULL DEFAULT '',
  `nParCodigo` int(11) NOT NULL DEFAULT '0',
  `nParClase` int(11) NOT NULL DEFAULT '0',
  `nPerGraValor` int(11) NOT NULL,
  `cPerGraGlosa` text,
  `dPerGraGlosa` date DEFAULT NULL,
  `nPerGraEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pergrado
-- ----------------------------
INSERT INTO `pergrado` VALUES ('100000100009', '2', '2069', '7', 'ESPOSO-PESCADOR-PRIMARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100009', '1', '2069', '1', 'ESPOSA-PESCADOR-NINGUN NIVEL', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100009', '3', '2069', '2', 'HIJOS-PESCADOR-TÉCNICO', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100008', '2', '2069', '7', 'ESPOSO-PESCADOR-PRIMARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100008', '3', '2069', '1', 'ESPOSA-PESCADOR-SECUNADARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100008', '3', '2069', '2', 'HIJOS-PESCADOR-SECUNADARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '2', '2069', '0', 'ESPOSO-PESCADOR-PRIMARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '3', '2069', '0', 'ESPOSA-PESCADOR-SECUNDARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '2', '2069', '4', 'HIJOS-PESCADOR-PRIMARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '3', '2069', '5', 'HIJOS-PESCADOR-SECUNDARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '5', '2069', '1', 'HIJOS-PESCADOR-SUPERIOR', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '2', '2069', '0', 'ESPOSO-PESCADOR-PRIMARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '3', '2069', '0', 'ESPOSA-PESCADOR-SECUNDARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '2', '2069', '4', 'HIJOS-PESCADOR-PRIMARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '3', '2069', '5', 'HIJOS-PESCADOR-SECUNDARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '5', '2069', '1', 'HIJOS-PESCADOR-SUPERIOR', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '2', '2069', '0', 'ESPOSO-PESCADOR-PRIMARIA', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '1', '2069', '0', 'ESPOSA-PESCADOR-NINGUN NIVEL', '0000-00-00', '1');
INSERT INTO `pergrado` VALUES ('100000100002', '1', '2069', '2', 'HIJOS-PESCADOR-NINGUN NIVEL', '0000-00-00', '1');

-- ----------------------------
-- Table structure for perimagen
-- ----------------------------
DROP TABLE IF EXISTS `perimagen`;
CREATE TABLE `perimagen` (
  `cPerCodigo` varchar(10) NOT NULL,
  `cPerRuta` varchar(50) NOT NULL,
  `nPerTipo` int(11) NOT NULL,
  `nPerEstado` int(11) NOT NULL,
  PRIMARY KEY (`cPerCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perimagen
-- ----------------------------
INSERT INTO `perimagen` VALUES ('1000000001', '', '1', '1');

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo` (
  `nPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `dFecInic` date NOT NULL,
  `dFecFinal` date NOT NULL,
  `fImporteInic` float NOT NULL,
  `nEstado` int(11) NOT NULL,
  PRIMARY KEY (`nPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of periodo
-- ----------------------------

-- ----------------------------
-- Table structure for perjuridica
-- ----------------------------
DROP TABLE IF EXISTS `perjuridica`;
CREATE TABLE `perjuridica` (
  `cPerCodigo` varchar(20) CHARACTER SET utf8 NOT NULL,
  `nPerJurRubro` int(11) NOT NULL,
  `nPerJurTipoEmpresa` int(11) NOT NULL,
  `cPerJurDescripcion` varchar(250) CHARACTER SET utf8 NOT NULL,
  `nPerEmpresa` int(11) NOT NULL,
  PRIMARY KEY (`cPerCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- ----------------------------
-- Records of perjuridica
-- ----------------------------
INSERT INTO `perjuridica` VALUES ('100000100005', '11', '0', 'BANCO DE MATERIALES', '0');
INSERT INTO `perjuridica` VALUES ('100000100006', '11', '0', 'BANCO DE CREDITOS DEL PERU', '0');
INSERT INTO `perjuridica` VALUES ('100000100007', '11', '0', 'BANCO AGRARIO DEL PERÚ', '0');
INSERT INTO `perjuridica` VALUES ('100000100009', '11', '0', 'INSTITUTO NACIONAL DE DESARROLLO', '0');
INSERT INTO `perjuridica` VALUES ('100000100008', '11', '0', 'CENTRO DE INVESTIGACIÓN Y PROMOCIÓN AGRARIA', '0');
INSERT INTO `perjuridica` VALUES ('100000100010', '11', '0', 'INSTITUTO NACIONAL DE DESARROLLO DE LA AGROINDUSTRIA', '0');
INSERT INTO `perjuridica` VALUES ('100000100011', '11', '0', 'INSTITUTO NACIONAL DE INVESTIGACIÓN Y PROMOCIÓN AGRARIA', '0');

-- ----------------------------
-- Table structure for perlaboral
-- ----------------------------
DROP TABLE IF EXISTS `perlaboral`;
CREATE TABLE `perlaboral` (
  `cPerCodigo` varchar(20) DEFAULT NULL,
  `nParClase` int(11) DEFAULT NULL,
  `nParCodigo` int(11) DEFAULT NULL,
  `dPerLabRegistro` date DEFAULT NULL,
  `nPerLabEstado` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perlaboral
-- ----------------------------

-- ----------------------------
-- Table structure for permail
-- ----------------------------
DROP TABLE IF EXISTS `permail`;
CREATE TABLE `permail` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este Email',
  `nPerMailTipo` int(11) DEFAULT NULL COMMENT 'Codigo del tipo de email(personal - corporativo)',
  `cPerMail` varchar(250) NOT NULL COMMENT 'Descripcion del Email',
  `nPerRelTipo` int(11) DEFAULT NULL,
  `nPerMailEstado` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Se registra los diferentes email de una persona ';

-- ----------------------------
-- Records of permail
-- ----------------------------
INSERT INTO `permail` VALUES ('1', '1', 'juanjiner@adrisconsulting.com', null, null);
INSERT INTO `permail` VALUES ('100000100001', '1', 'armandoaepp@hotmail.com', '2005', '1');

-- ----------------------------
-- Table structure for pernatural
-- ----------------------------
DROP TABLE IF EXISTS `pernatural`;
CREATE TABLE `pernatural` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la Persona',
  `cPerNatApePaterno` varchar(250) NOT NULL COMMENT 'Registro del apellido paterno',
  `cPerNatApeMaterno` varchar(250) NOT NULL COMMENT 'Registro del apellido Materno',
  `nPerNatSexo` int(11) NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este sexo',
  `nPerNatEstCivil` int(11) NOT NULL COMMENT 'Codigo de la Persona a la que le pertenece este estado civil',
  PRIMARY KEY (`cPerCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='En esta tabla se registra los apellidos de una persona';

-- ----------------------------
-- Records of pernatural
-- ----------------------------
INSERT INTO `pernatural` VALUES ('1', 'Pisfil ', 'Puemape', '2', '4');
INSERT INTO `pernatural` VALUES ('100000100001', 'PUEMAPEE', 'PISFIL', '1', '1');
INSERT INTO `pernatural` VALUES ('100000100002', 'PISFIL', 'PUEMAPE', '1', '2');
INSERT INTO `pernatural` VALUES ('100000100003', 'NECIOSUP', 'LIZA', '1', '1');
INSERT INTO `pernatural` VALUES ('100000100004', 'TORRES', 'ANDONAIRE', '1', '1');
INSERT INTO `pernatural` VALUES ('100000100012', 'FIESTAS', 'LLENQUE', '1', '2');
INSERT INTO `pernatural` VALUES ('100000100013', 'PERES', 'VARGAS', '1', '2');

-- ----------------------------
-- Table structure for perparametro
-- ----------------------------
DROP TABLE IF EXISTS `perparametro`;
CREATE TABLE `perparametro` (
  `cPerCodigo` varchar(20) NOT NULL,
  `nParCodigo` int(11) NOT NULL,
  `nParClase` int(11) NOT NULL,
  `nPerParValor` int(11) DEFAULT NULL,
  `cPerParGlosa` varchar(255) DEFAULT NULL,
  `nPerParEstado` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perparametro
-- ----------------------------
INSERT INTO `perparametro` VALUES ('100000100009', '4', '2077', '2', 'CARGA FAMILIAR - HIJOS MUJERES ', '1');
INSERT INTO `perparametro` VALUES ('100000100009', '5', '2077', '2', 'CARGA FAMILIAR - HIJOS HOMBRES ', '1');
INSERT INTO `perparametro` VALUES ('100000100009', '3', '2077', '4', 'CARGA FAMILIAR - NUMERO DE HIJOS TOTAL', '1');
INSERT INTO `perparametro` VALUES ('100000100009', '6', '2077', '2', 'CARGA FAMILIAR - HIJOS EN EDAD ESCOLAR', '1');
INSERT INTO `perparametro` VALUES ('100000100009', '7', '2077', '2', 'CARGA FAMILIAR - PADRES', '1');
INSERT INTO `perparametro` VALUES ('100000100008', '2', '2077', '2', 'ESPOSA', '1');
INSERT INTO `perparametro` VALUES ('100000100008', '4', '2077', '2', 'CARGA FAMILIAR - HIJOS MUJERES ', '1');
INSERT INTO `perparametro` VALUES ('100000100008', '5', '2077', '2', 'CARGA FAMILIAR - HIJOS HOMBRES ', '1');
INSERT INTO `perparametro` VALUES ('100000100008', '3', '2077', '4', 'CARGA FAMILIAR - NUMERO DE HIJOS TOTAL', '1');
INSERT INTO `perparametro` VALUES ('100000100008', '6', '2077', '2', 'CARGA FAMILIAR - HIJOS EN EDAD ESCOLAR', '1');
INSERT INTO `perparametro` VALUES ('100000100008', '7', '2077', '2', 'CARGA FAMILIAR - PADRES', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '2', '2077', '2', 'ESPOSA', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '4', '2077', '1', 'CARGA FAMILIAR - HIJOS MUJERES ', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '5', '2077', '2', 'CARGA FAMILIAR - HIJOS HOMBRES ', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '3', '2077', '3', 'CARGA FAMILIAR - NUMERO DE HIJOS TOTAL', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '6', '2077', '9', 'CARGA FAMILIAR - HIJOS EN EDAD ESCOLAR', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '7', '2077', '2', 'CARGA FAMILIAR - PADRES', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '2', '2077', '2', 'ESPOSA', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '4', '2077', '1', 'CARGA FAMILIAR - HIJOS MUJERES ', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '5', '2077', '2', 'CARGA FAMILIAR - HIJOS HOMBRES ', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '3', '2077', '3', 'CARGA FAMILIAR - NUMERO DE HIJOS TOTAL', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '6', '2077', '9', 'CARGA FAMILIAR - HIJOS EN EDAD ESCOLAR', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '7', '2077', '2', 'CARGA FAMILIAR - PADRES', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '2', '2077', '2', 'ESPOSA', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '4', '2077', '1', 'CARGA FAMILIAR - HIJOS MUJERES ', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '5', '2077', '2', 'CARGA FAMILIAR - HIJOS HOMBRES ', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '3', '2077', '3', 'CARGA FAMILIAR - NUMERO DE HIJOS TOTAL', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '6', '2077', '0', 'CARGA FAMILIAR - HIJOS EN EDAD ESCOLAR', '1');
INSERT INTO `perparametro` VALUES ('100000100002', '7', '2077', '2', 'CARGA FAMILIAR - PADRES', '1');

-- ----------------------------
-- Table structure for perrelacion
-- ----------------------------
DROP TABLE IF EXISTS `perrelacion`;
CREATE TABLE `perrelacion` (
  `cPerCodigo` varchar(20) NOT NULL,
  `nPerRelTipo` int(11) NOT NULL,
  `cPerJuridica` varchar(20) NOT NULL,
  `nPerRelEstado` int(11) NOT NULL,
  `dPerRelacion` date NOT NULL,
  `cPerObservacion` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perrelacion
-- ----------------------------
INSERT INTO `perrelacion` VALUES ('100000100002', '2005', '100000100000', '1', '2013-12-04', 'PESCADOR');
INSERT INTO `perrelacion` VALUES ('100000100003', '2005', '100000100000', '1', '2013-12-05', 'PESCADOR');
INSERT INTO `perrelacion` VALUES ('100000100004', '2005', '100000100000', '1', '2013-12-03', 'PESCADOR');
INSERT INTO `perrelacion` VALUES ('100000100012', '2005', '100000100000', '1', '2013-12-14', 'PESCADOR');
INSERT INTO `perrelacion` VALUES ('100000100013', '2005', '100000100000', '1', '2013-12-17', 'PESCADOR');

-- ----------------------------
-- Table structure for persona
-- ----------------------------
DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la persona.',
  `cPerNombre` varchar(1000) NOT NULL COMMENT 'Nombre de la persona.',
  `cPerApellidos` varchar(500) DEFAULT NULL,
  `dPerNacimiento` date NOT NULL COMMENT 'Fecha de nacimiento de la persona.',
  `nPerTipo` int(11) NOT NULL COMMENT 'Codigo si es una persona  juridica o natural.',
  `nPerEstado` int(11) NOT NULL COMMENT 'Codigo si esta persona esta activa o inactivo.',
  PRIMARY KEY (`cPerCodigo`),
  KEY `idx_cPerApellidos` (`cPerApellidos`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='En esta tabla se registran los nombres de una persona';

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO `persona` VALUES ('1', 'Armando Enrique', 'Pisfil Puemape', '1987-02-04', '1', '1');
INSERT INTO `persona` VALUES ('100000100000', 'iniciar formatos', 'obligatorio no borrar', '2009-07-16', '1', '0');
INSERT INTO `persona` VALUES ('100000100001', 'ENRIQUE', 'PUEMAPEE PISFIL', '2013-12-06', '1', '1');
INSERT INTO `persona` VALUES ('100000100002', 'ARMANDO', 'PISFIL PUEMAPE', '0000-00-00', '1', '1');
INSERT INTO `persona` VALUES ('100000100003', 'RENATO', 'NECIOSUP LIZA', '1992-04-04', '1', '1');
INSERT INTO `persona` VALUES ('100000100004', 'HENRY SMITH', 'TORRES ANDONAIRE', '1993-02-01', '1', '1');
INSERT INTO `persona` VALUES ('100000100005', 'BM', 'BANCO DE MATERIALES', '0000-00-00', '2', '1');
INSERT INTO `persona` VALUES ('100000100006', 'BCP', 'BANCO DE CREDITOS DEL PERU', '0000-00-00', '2', '1');
INSERT INTO `persona` VALUES ('100000100007', 'BAP', 'BANCO AGRARIO DEL PERÚ', '0000-00-00', '2', '1');
INSERT INTO `persona` VALUES ('100000100008', 'CIPA', 'CENTRO DE INVESTIGACIÓN Y PROMOCIÓN AGRARIA', '0000-00-00', '2', '1');
INSERT INTO `persona` VALUES ('100000100009', 'INADE', 'INSTITUTO NACIONAL DE DESARROLLO', '0000-00-00', '2', '1');
INSERT INTO `persona` VALUES ('100000100010', 'INDRA', 'INSTITUTO NACIONAL DE DESARROLLO DE LA AGROINDUSTRIA', '0000-00-00', '2', '1');
INSERT INTO `persona` VALUES ('100000100011', 'INIPA', 'INSTITUTO NACIONAL DE INVESTIGACIÓN Y PROMOCIÓN AGRARIA', '0000-00-00', '2', '1');
INSERT INTO `persona` VALUES ('100000100012', 'JUSTO DE LA  CRUZ', 'FIESTAS LLENQUE', '1975-12-12', '1', '1');
INSERT INTO `persona` VALUES ('100000100013', 'JUAN MANUEL', 'PERES VARGAS', '1994-12-01', '1', '1');

-- ----------------------------
-- Table structure for pertelefono
-- ----------------------------
DROP TABLE IF EXISTS `pertelefono`;
CREATE TABLE `pertelefono` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la Persona a la cual le pertenece este Numero Telefonico',
  `nPerTelTipo` int(11) NOT NULL COMMENT 'Tipo de Telefono (Fijo - Celular Movistar - Celular Claro)',
  `cPerTelNumero` varchar(250) NOT NULL COMMENT 'Numero del Telefono',
  `nPerRelTipo` int(11) NOT NULL,
  `nPerTelEstado` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Almacena los telefonos de una determinada Persona';

-- ----------------------------
-- Records of pertelefono
-- ----------------------------
INSERT INTO `pertelefono` VALUES ('100000100001', '2', '996393414', '2005', '1');
INSERT INTO `pertelefono` VALUES ('100000100001', '3', '#996393414', '2005', '1');
INSERT INTO `pertelefono` VALUES ('100000100001', '1', '45654645', '2005', '1');
INSERT INTO `pertelefono` VALUES ('100000100002', '2', '346667453', '2005', '1');
INSERT INTO `pertelefono` VALUES ('100000100003', '1', '978807232', '2005', '1');
INSERT INTO `pertelefono` VALUES ('100000100003', '1', '#978807232', '2005', '1');
INSERT INTO `pertelefono` VALUES ('100000100004', '1', '#979004799', '2005', '1');
INSERT INTO `pertelefono` VALUES ('100000100004', '1', '67533366', '2005', '1');

-- ----------------------------
-- Table structure for perusuacceso
-- ----------------------------
DROP TABLE IF EXISTS `perusuacceso`;
CREATE TABLE `perusuacceso` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la persona quien tendra acceso al sistema.',
  `nPerUsuAccGrupo` int(11) NOT NULL COMMENT 'Codigo de un determinado grupo a la que una persona tendra acceso.',
  `nPerUsuAccTipo` int(11) NOT NULL COMMENT 'Codigo de un determinado grupo a la que una persona tendra acceso.',
  `nPerUsuAccObjCodigo` int(11) NOT NULL COMMENT 'Codigo del permiso al que tendra una persona.',
  `nPerUsuAccCodigo` int(11) NOT NULL COMMENT 'Codigo del permiso al que tendra una persona.',
  `nPerUsuAccPrdCodigo` int(11) NOT NULL COMMENT 'Codigo de un determinado periodo al que un usuario tendra acceso.',
  `nPerUsuAccEstado` int(11) NOT NULL COMMENT 'Codigo del estado de un usuario(activo - inactivo).',
  PRIMARY KEY (`cPerCodigo`,`nPerUsuAccGrupo`,`nPerUsuAccTipo`,`nPerUsuAccObjCodigo`,`nPerUsuAccCodigo`,`nPerUsuAccPrdCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='En esta tabla se registraran los permisos de un determinado ';

-- ----------------------------
-- Records of perusuacceso
-- ----------------------------
INSERT INTO `perusuacceso` VALUES ('1', '5004', '1', '5004', '7', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010804', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010805', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900602', '0', '1');
INSERT INTO `perusuacceso` VALUES ('', '0', '0', '0', '0', '0', '0');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060202', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020202', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020203', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020204', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020205', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900108', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010801', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010802', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010803', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '70701', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '0', '0', '0', '0');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '704020102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '704020103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010202', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010203', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010204', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010303', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '706010304', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '70702', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '70703', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9001', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010405', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900107', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010303', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010304', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900106', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010601', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010602', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010603', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010604', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9002', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90020101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90020102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90020103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90020104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010401', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010402', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010403', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010404', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030403', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030404', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010305', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900304', '0', '0');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030401', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030402', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9003', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030202', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030203', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030204', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900303', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030303', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030304', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010701', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010702', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010703', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010704', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010705', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90010605', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030205', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030305', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9004', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900401', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900402', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040202', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040203', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040204', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040205', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90020105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900305', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030501', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030502', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030503', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030504', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90030505', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900403', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040303', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90040304', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9005', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900501', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900502', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050202', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900503', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9006', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900601', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90060101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90060102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90060103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90060104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90060105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060203', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020303', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020304', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906020305', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9007', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900701', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900702', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90070201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900603', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906030101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906030102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906030103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906030104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906030105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900504', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050401', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '90050402', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '900604', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060401', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040101', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040102', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040103', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040104', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040105', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060402', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040201', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040202', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040203', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040204', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040205', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060403', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040301', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040302', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040303', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040304', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040305', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '90', '1', '5000', '9060404', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040401', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040402', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040403', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040404', '0', '1');
INSERT INTO `perusuacceso` VALUES ('1', '5001', '1', '5001', '906040405', '0', '1');

-- ----------------------------
-- Table structure for perusuario
-- ----------------------------
DROP TABLE IF EXISTS `perusuario`;
CREATE TABLE `perusuario` (
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la persona ',
  `cPerUsuCodigo` varchar(50) NOT NULL COMMENT 'Registro del nombre del usuario.',
  `cPerUsuClave` varchar(50) NOT NULL COMMENT 'Registro de la clave del usuario.',
  `nPerUsuEstado` int(11) NOT NULL COMMENT 'Codigo del estado del usuario(activo - inactivo)',
  PRIMARY KEY (`cPerCodigo`,`cPerUsuCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of perusuario
-- ----------------------------
INSERT INTO `perusuario` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1');

-- ----------------------------
-- Table structure for provincia
-- ----------------------------
DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `IdProvincia` char(8) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `IdDepartamento` char(8) NOT NULL,
  `nProEstado` int(4) DEFAULT '1',
  PRIMARY KEY (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of provincia
-- ----------------------------
INSERT INTO `provincia` VALUES ('pro00001', 'Chachapoyas', 'dep00001', '1');
INSERT INTO `provincia` VALUES ('pro00002', 'Bagua', 'dep00001', '1');
INSERT INTO `provincia` VALUES ('pro00003', 'Bongara', 'dep00001', '1');
INSERT INTO `provincia` VALUES ('pro00004', 'Condorcanqui', 'dep00001', '1');
INSERT INTO `provincia` VALUES ('pro00005', 'Luya', 'dep00001', '1');
INSERT INTO `provincia` VALUES ('pro00006', 'Rodriguez de Mendoza', 'dep00001', '1');
INSERT INTO `provincia` VALUES ('pro00007', 'Utcubamba', 'dep00001', '1');
INSERT INTO `provincia` VALUES ('pro00008', 'Huaraz', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00009', 'Aija', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00010', 'Antonio Raymondi', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00011', 'Asuncion', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00012', 'Bolognesi', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00013', 'Carhuaz', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00014', 'Carlos Fermin Fitzcarrald', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00015', 'Casma', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00016', 'Corongo', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00017', 'Huari', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00018', 'Huarmey', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00019', 'Huaylas', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00020', 'Mariscal Luzuriaga', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00021', 'Ocros', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00022', 'Pallasca', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00023', 'Pomabamba', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00024', 'Recuay', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00025', 'Santa', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00026', 'Sihuas', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00027', 'Yungay', 'dep00002', '1');
INSERT INTO `provincia` VALUES ('pro00028', 'Abancay', 'dep00003', '1');
INSERT INTO `provincia` VALUES ('pro00029', 'Andahuaylas', 'dep00003', '1');
INSERT INTO `provincia` VALUES ('pro00030', 'Antabamba', 'dep00003', '1');
INSERT INTO `provincia` VALUES ('pro00031', 'Aymaraes', 'dep00003', '1');
INSERT INTO `provincia` VALUES ('pro00032', 'Cotabambas', 'dep00003', '1');
INSERT INTO `provincia` VALUES ('pro00033', 'Chincheros', 'dep00003', '1');
INSERT INTO `provincia` VALUES ('pro00034', 'Grau', 'dep00003', '1');
INSERT INTO `provincia` VALUES ('pro00035', 'Arequipa', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00036', 'Camana', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00037', 'Caraveli', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00038', 'Castilla', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00039', 'Caylloma', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00040', 'Condesuyos', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00041', 'Islay', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00042', 'La Union', 'dep00004', '1');
INSERT INTO `provincia` VALUES ('pro00043', 'Huamanga', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00044', 'Cangallo', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00045', 'Huanca Sancos', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00046', 'Huanta', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00047', 'La Mar', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00048', 'Lucanas', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00049', 'Parinacochas', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00050', 'Paucar del Sara', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00051', 'Sucre', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00052', 'Victor Fajardo', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00053', 'Vilcas Huaman', 'dep00005', '1');
INSERT INTO `provincia` VALUES ('pro00054', 'Cajamarca', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00055', 'Cajabamba', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00056', 'Celendin', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00057', 'Chota', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00058', 'Contumaza', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00059', 'Cutervo', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00060', 'Hualgayoc', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00061', 'Jaen', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00062', 'San Ignacio', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00063', 'San Marcos', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00064', 'San Miguel', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00065', 'San Pablo', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00066', 'Santa Cruz', 'dep00006', '1');
INSERT INTO `provincia` VALUES ('pro00067', 'Callao', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00068', 'Cusco', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00069', 'Acomayo', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00070', 'Anta', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00071', 'Calca', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00072', 'Canas', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00073', 'Canchis', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00074', 'Chumbivilcas', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00075', 'Espinar', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00076', 'La Convencion', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00077', 'Paruro', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00078', 'Paucartambo', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00079', 'Quispicanchi', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00080', 'Urubamba', 'dep00007', '1');
INSERT INTO `provincia` VALUES ('pro00081', 'Huancavelica', 'dep00009', '1');
INSERT INTO `provincia` VALUES ('pro00082', 'Acobamba', 'dep00009', '1');
INSERT INTO `provincia` VALUES ('pro00083', 'Angaraes', 'dep00009', '1');
INSERT INTO `provincia` VALUES ('pro00084', 'Castrovirreyna', 'dep00009', '1');
INSERT INTO `provincia` VALUES ('pro00085', 'Churcampa', 'dep00009', '1');
INSERT INTO `provincia` VALUES ('pro00086', 'Huaytara', 'dep00009', '1');
INSERT INTO `provincia` VALUES ('pro00087', 'Tayacaja', 'dep00009', '1');
INSERT INTO `provincia` VALUES ('pro00088', 'Huanuco', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00089', 'Ambo', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00090', 'Dos de Mayo', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00091', 'Huacaybamba', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00092', 'Huamalies', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00093', 'Leoncio Prado', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00094', 'Marañon', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00095', 'Pachitea', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00096', 'Puerto Inca', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00097', 'Lauricocha', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00098', 'Yarowilca', 'dep00008', '1');
INSERT INTO `provincia` VALUES ('pro00099', 'Ica', 'dep00010', '1');
INSERT INTO `provincia` VALUES ('pro00100', 'Chincha', 'dep00010', '1');
INSERT INTO `provincia` VALUES ('pro00101', 'Nazca', 'dep00010', '1');
INSERT INTO `provincia` VALUES ('pro00102', 'Palpa', 'dep00010', '1');
INSERT INTO `provincia` VALUES ('pro00103', 'Pisco', 'dep00010', '1');
INSERT INTO `provincia` VALUES ('pro00104', 'Huancayo', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00105', 'Concepcion', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00106', 'Chanchamayo', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00107', 'Jauja', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00108', 'Junin', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00109', 'Satipo', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00110', 'Tarma', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00111', 'Yauli', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00112', 'Chupaca', 'dep00011', '1');
INSERT INTO `provincia` VALUES ('pro00113', 'Trujillo', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00114', 'Ascope', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00115', 'Bolivar', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00116', 'Chepen', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00117', 'Julcan', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00118', 'Otuzco', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00119', 'Pacasmayo', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00120', 'Pataz', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00121', 'Sanchez Carrion', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00122', 'Santiago de Chuco', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00123', 'Gran Chimu', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00124', 'Viru', 'dep00012', '1');
INSERT INTO `provincia` VALUES ('pro00125', 'Chiclayo', 'dep00013', '1');
INSERT INTO `provincia` VALUES ('pro00126', 'Ferreñafe', 'dep00013', '0');
INSERT INTO `provincia` VALUES ('pro00127', 'Lambayeque', 'dep00013', '1');
INSERT INTO `provincia` VALUES ('pro00128', 'Lima', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00129', 'Barranca', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00130', 'Cajatambo', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00131', 'Canta', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00132', 'Cañete', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00133', 'Huaral', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00134', 'Huarochiri', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00135', 'Huaura', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00136', 'Oyon', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00137', 'Yauyos', 'dep00014', '1');
INSERT INTO `provincia` VALUES ('pro00138', 'Maynas', 'dep00015', '1');
INSERT INTO `provincia` VALUES ('pro00139', 'Alto Amazonas', 'dep00015', '1');
INSERT INTO `provincia` VALUES ('pro00140', 'Loreto', 'dep00015', '1');
INSERT INTO `provincia` VALUES ('pro00141', 'Mariscal Ramon Castilla', 'dep00015', '1');
INSERT INTO `provincia` VALUES ('pro00142', 'Requena', 'dep00015', '1');
INSERT INTO `provincia` VALUES ('pro00143', 'Ucayali', 'dep00015', '1');
INSERT INTO `provincia` VALUES ('pro00144', 'Datem del Mara&Atilde;&plusmn;on', 'dep00015', '1');
INSERT INTO `provincia` VALUES ('pro00145', 'Tambopata', 'dep00016', '1');
INSERT INTO `provincia` VALUES ('pro00146', 'Manu', 'dep00016', '1');
INSERT INTO `provincia` VALUES ('pro00147', 'Tahuamanu', 'dep00016', '1');
INSERT INTO `provincia` VALUES ('pro00148', 'Mariscal Nieto', 'dep00017', '1');
INSERT INTO `provincia` VALUES ('pro00149', 'General Sanchez Cerro', 'dep00017', '1');
INSERT INTO `provincia` VALUES ('pro00150', 'Ilo', 'dep00017', '1');
INSERT INTO `provincia` VALUES ('pro00151', 'Pasco', 'dep00018', '1');
INSERT INTO `provincia` VALUES ('pro00152', 'Daniel Alcides Carrion', 'dep00018', '1');
INSERT INTO `provincia` VALUES ('pro00153', 'Oxapampa', 'dep00018', '1');
INSERT INTO `provincia` VALUES ('pro00154', 'Piura', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00155', 'Ayabaca', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00156', 'Huancabamba', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00157', 'Morropon', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00158', 'Paita', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00159', 'Sullana', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00160', 'Talara', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00161', 'Sechura', 'dep00019', '1');
INSERT INTO `provincia` VALUES ('pro00162', 'Puno', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00163', 'Azangaro', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00164', 'Carabaya', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00165', 'Chucuito', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00166', 'El Collao', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00167', 'Huancane', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00168', 'Lampa', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00169', 'Melgar', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00170', 'Moho', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00171', 'San Antonio de Putina', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00172', 'San Roman', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00173', 'Sandia', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00174', 'Yunguyo', 'dep00020', '1');
INSERT INTO `provincia` VALUES ('pro00175', 'Moyobamba', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00176', 'Bellavista', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00177', 'El Dorado', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00178', 'Huallaga', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00179', 'Lamas', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00180', 'Mariscal Caceres', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00181', 'Picota', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00182', 'Rioja', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00183', 'San Martin', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00184', 'Tocache', 'dep00021', '1');
INSERT INTO `provincia` VALUES ('pro00185', 'Tacna', 'dep00022', '1');
INSERT INTO `provincia` VALUES ('pro00186', 'Candarave', 'dep00022', '1');
INSERT INTO `provincia` VALUES ('pro00187', 'Jorge Basadre', 'dep00022', '1');
INSERT INTO `provincia` VALUES ('pro00188', 'Tarata', 'dep00022', '1');
INSERT INTO `provincia` VALUES ('pro00189', 'Tumbes', 'dep00023', '1');
INSERT INTO `provincia` VALUES ('pro00190', 'Contralmirante Villar', 'dep00023', '1');
INSERT INTO `provincia` VALUES ('pro00191', 'Zarumilla', 'dep00023', '1');
INSERT INTO `provincia` VALUES ('pro00192', 'Coronel Portillo', 'dep00024', '1');
INSERT INTO `provincia` VALUES ('pro00193', 'Atalaya', 'dep00024', '1');
INSERT INTO `provincia` VALUES ('pro00194', 'Padre Abad', 'dep00024', '1');
INSERT INTO `provincia` VALUES ('pro00195', 'Purus', 'dep00024', '1');

-- ----------------------------
-- Table structure for transaccion
-- ----------------------------
DROP TABLE IF EXISTS `transaccion`;
CREATE TABLE `transaccion` (
  `cTraCodigo` varchar(100) NOT NULL COMMENT 'Codigo de la transaccion que se va a realizar.',
  `nOpeCodigo` int(11) NOT NULL COMMENT 'Codigo de la operacion que se esta realizando',
  `cPerCodigo` varchar(20) NOT NULL COMMENT 'Codigo de la persona quien esta realizando una determinada transaccion.',
  `dTraFecha` datetime NOT NULL COMMENT 'Fecha en que se realiza una determinada transaccion.',
  `cComputer` varchar(250) NOT NULL COMMENT 'Descripcion del equipo que se esta utilizando',
  `cTraDescripcion` longtext NOT NULL COMMENT 'Descripcion de la transaccion que se esta realizando',
  PRIMARY KEY (`cTraCodigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='En esta tabla se registrara las transaciones que realiza un ';

-- ----------------------------
-- Records of transaccion
-- ----------------------------
INSERT INTO `transaccion` VALUES ('201311271320239700f5dd579011e382682016d8d47c3d', '36', '1', '2013-11-27 13:20:23', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131127132252f003b530579011e382682016d8d47c3d', '36', '1', '2013-11-27 13:22:52', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131127145602f3cf4fe0579d11e382682016d8d47c3d', '36', '1', '2013-11-27 14:56:02', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131127145622ffd1e584579d11e382682016d8d47c3d', '36', '1', '2013-11-27 14:56:22', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131127162446597d7c3057aa11e382682016d8d47c3d', '36', '1', '2013-11-27 16:24:46', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013112716395576ecbfc557ac11e382682016d8d47c3d', '36', '1', '2013-11-27 16:39:55', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131127170832767eeade57b011e382682016d8d47c3d', '610', '1', '2013-11-27 17:08:32', '', 'Registro Rol 000003333 .::. MOTUPE');
INSERT INTO `transaccion` VALUES ('20131127170953a6db598957b011e382682016d8d47c3d', '610', '1', '2013-11-27 17:09:53', '', 'Registro Rol 00003223 .::. NUEVOOSSSS');
INSERT INTO `transaccion` VALUES ('201311271730438fb2cd4e57b311e382682016d8d47c3d', '611', '1', '2013-11-27 17:30:43', '', 'Modifico Rol .::. 11 - NUEVO SITIOOOO');
INSERT INTO `transaccion` VALUES ('20131127173640643e42a557b411e382682016d8d47c3d', '611', '1', '2013-11-27 17:36:40', '', 'Modifico Rol .::. 11 - NUEVO SITIOO0000000000000OO');
INSERT INTO `transaccion` VALUES ('201311271737508e3a950c57b411e382682016d8d47c3d', '612', '1', '2013-11-27 17:37:50', '', 'Elimino Arte de Pesca .::. 11');
INSERT INTO `transaccion` VALUES ('20131127230106b72ba1ec57e111e382682016d8d47c3d', '36', '1', '2013-11-27 23:01:06', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013112723142291a6250157e311e382682016d8d47c3d', '610', '1', '2013-11-27 23:14:22', '', 'Registro Rol 000000000000000 .::. NUASSSSSSS');
INSERT INTO `transaccion` VALUES ('20131127231432975bd05057e311e382682016d8d47c3d', '611', '1', '2013-11-27 23:14:32', '', 'Modifico Rol .::. 12 - NUASSSSSSS');
INSERT INTO `transaccion` VALUES ('20131127231603cdfe2f4957e311e382682016d8d47c3d', '36', '1', '2013-11-27 23:16:03', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131127234433c95bfbf457e711e382682016d8d47c3d', '610', '1', '2013-11-27 23:44:33', '', 'Registro Rol 00006 .::. ASSSADAS');
INSERT INTO `transaccion` VALUES ('20131127234516e2d02efd57e711e382682016d8d47c3d', '610', '1', '2013-11-27 23:45:16', '', 'Registro Rol 00008 .::. SADASDASD');
INSERT INTO `transaccion` VALUES ('20131128092224829c7252583811e382682016d8d47c3d', '611', '1', '2013-11-28 09:22:24', '', 'Modifico Rol .::. 13 - ASSSADSSSSSSS');
INSERT INTO `transaccion` VALUES ('2013112809223689811b5b583811e382682016d8d47c3d', '611', '1', '2013-11-28 09:22:36', '', 'Modifico Rol .::. 13 - ASSSADSSSSSSSSSSSSSSSSSS');
INSERT INTO `transaccion` VALUES ('201311281025465ca20f23584111e382682016d8d47c3d', '611', '1', '2013-11-28 10:25:46', '', 'Modifico Rol .::. 6 - DOS TETASSS');
INSERT INTO `transaccion` VALUES ('2013112810255260998fd0584111e382682016d8d47c3d', '611', '1', '2013-11-28 10:25:52', '', 'Modifico Rol .::. 6 - DOS TETAS');
INSERT INTO `transaccion` VALUES ('201311281406524003cfb5586011e382682016d8d47c3d', '36', '1', '2013-11-28 14:06:52', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013112900163069de407858b511e382682016d8d47c3d', '36', '1', '2013-11-29 00:16:30', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201311290028090a9a2f1c58b711e382682016d8d47c3d', '36', '1', '2013-11-29 00:28:09', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201311290030526c2d6fd758b711e382682016d8d47c3d', '36', '1', '2013-11-29 00:30:52', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131129081241effaba0958f711e382682016d8d47c3d', '36', '1', '2013-11-29 08:12:41', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131129081928e28d4f0a58f811e382682016d8d47c3d', '36', '1', '2013-11-29 08:19:28', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131129091435958e8554590011e382682016d8d47c3d', '610', '1', '2013-11-29 09:14:35', '', 'Registro SITIO DE DESEMBARQUE.::.ASDASDDSSSSS .::. EEEEEEEEEEEEEEEDDDDDDE');
INSERT INTO `transaccion` VALUES ('20131129091516ae31b274590011e382682016d8d47c3d', '610', '1', '2013-11-29 09:15:16', '', 'Registro SITIO DE DESEMBARQUE.::.435634563456345 .::. SDFASDFASDFASDF');
INSERT INTO `transaccion` VALUES ('201311290939411764a68f590411e382682016d8d47c3d', '610', '1', '2013-11-29 09:39:41', '', 'Registro Familia Especie 12 - 0000000054 .::. NUEVO GENERO');
INSERT INTO `transaccion` VALUES ('20131129140323edbe5a52592811e382682016d8d47c3d', '36', '1', '2013-11-29 14:03:23', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131129140323edc3e5be592811e382682016d8d47c3d', '36', '1', '2013-11-29 14:03:23', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131129140410097fa759592911e382682016d8d47c3d', '610', '1', '2013-11-29 14:04:10', '', 'Registro Familia Especie 13 - 0000111 .::. GENERO NUEVO');
INSERT INTO `transaccion` VALUES ('201311291407277f511776592911e382682016d8d47c3d', '610', '1', '2013-11-29 14:07:27', '', 'Registro Familia Especie 14 - 00001111 .::. GENERO NUEVO');
INSERT INTO `transaccion` VALUES ('2013112914335531e302da592d11e382682016d8d47c3d', '611', '1', '2013-11-29 14:33:55', '', 'MODIFICO GENERO.::. 14 - GENERO NUEVO00000');
INSERT INTO `transaccion` VALUES ('20131129163236c645920d593d11e382682016d8d47c3d', '612', '1', '2013-11-29 16:32:36', '', 'Elimino Arte de Pesca .::. 6');
INSERT INTO `transaccion` VALUES ('201311291638068ab9f8bc593e11e382682016d8d47c3d', '612', '1', '2013-11-29 16:38:06', '', 'Elimino Arte de Pesca .::. 6');
INSERT INTO `transaccion` VALUES ('201311291638349b4919a2593e11e382682016d8d47c3d', '612', '1', '2013-11-29 16:38:34', '', 'Elimino Arte de Pesca .::. 6');
INSERT INTO `transaccion` VALUES ('20131129163949c8838885593e11e382682016d8d47c3d', '612', '1', '2013-11-29 16:39:49', '', 'Elimino Arte de Pesca .::. 6');
INSERT INTO `transaccion` VALUES ('20131129164122ffe38816593e11e382682016d8d47c3d', '612', '1', '2013-11-29 16:41:22', '', 'Elimino 2044.::. 6');
INSERT INTO `transaccion` VALUES ('20131129164203186130d8593f11e382682016d8d47c3d', '612', '1', '2013-11-29 16:42:03', '', 'Elimino 2044.::. 6');
INSERT INTO `transaccion` VALUES ('201311291642111ceed4b1593f11e382682016d8d47c3d', '612', '1', '2013-11-29 16:42:11', '', 'Elimino 2044.::. 7');
INSERT INTO `transaccion` VALUES ('2013112916432146e1bdbd593f11e382682016d8d47c3d', '611', '1', '2013-11-29 16:43:21', '', 'MODIFICO ZONAS DE PESCA .::. 1 - SAN JOSÉ');
INSERT INTO `transaccion` VALUES ('2013112916444478200ed2593f11e382682016d8d47c3d', '611', '1', '2013-11-29 16:44:44', '', 'MODIFICO GENERO.::. 14 - GENERO NUEV');
INSERT INTO `transaccion` VALUES ('201311291644507bb3b839593f11e382682016d8d47c3d', '611', '1', '2013-11-29 16:44:50', '', 'MODIFICO GENERO.::. 14 - GENERO NUEV');
INSERT INTO `transaccion` VALUES ('2013112916445880b5c354593f11e382682016d8d47c3d', '611', '1', '2013-11-29 16:44:58', '', 'MODIFICO GENERO.::. 13 - GENERO NUEVO');
INSERT INTO `transaccion` VALUES ('20131129164623b2d89371593f11e382682016d8d47c3d', '612', '1', '2013-11-29 16:46:23', '', 'ELIMINAR FAMILIA -GENERO ESPECIE  .::. 14-17');
INSERT INTO `transaccion` VALUES ('20131129164654c5a28688593f11e382682016d8d47c3d', '612', '1', '2013-11-29 16:46:54', '', 'ELIMINAR FAMILIA -GENERO ESPECIE  .::. 12-11');
INSERT INTO `transaccion` VALUES ('2013112921461094604d75596911e382682016d8d47c3d', '36', '1', '2013-11-29 21:46:10', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013112922333332d4682a597011e382682016d8d47c3d', '36', '1', '2013-11-29 22:33:33', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131129230518a1f38ba5597411e382682016d8d47c3d', '36', '1', '2013-11-29 23:05:18', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131129230518a1f4709c597411e382682016d8d47c3d', '36', '1', '2013-11-29 23:05:18', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201311292322360cb8b9f6597711e382682016d8d47c3d', '36', '1', '2013-11-29 23:22:36', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131130082607fa55990559c211e382682016d8d47c3d', '36', '1', '2013-11-30 08:26:07', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131130092311f3a3d1e359ca11e382682016d8d47c3d', '610', '1', '2013-11-30 09:23:11', '', 'Registro ESPECIE  15 - 000012 .::. SARDINAS NOMBRE CIENTIFICO');
INSERT INTO `transaccion` VALUES ('201311300927288c88ece859cb11e382682016d8d47c3d', '610', '1', '2013-11-30 09:27:28', '', 'Registro ESPECIE  16 - 00121231 .::. NOMBRE CIENTIFICO DE ESPECIE');
INSERT INTO `transaccion` VALUES ('20131130093028f7d631a059cb11e382682016d8d47c3d', '610', '1', '2013-11-30 09:30:28', '', 'Registro ESPECIE  8 - 3564562456 .::. NOMBRE DE CIENTIFICO DE LAS ESPECIE......................');
INSERT INTO `transaccion` VALUES ('20131130093325617b7d2659cc11e382682016d8d47c3d', '610', '1', '2013-11-30 09:33:25', '', 'Registro ESPECIE  6 - 23452437 .::. ANSDJKFASJKDFKSDJ');
INSERT INTO `transaccion` VALUES ('201311300941308261ef2959cd11e382682016d8d47c3d', '610', '1', '2013-11-30 09:41:30', '', 'Registro ESPECIE  7 - 482375923 .::. JDSKJADSKDJFAKDSJ');
INSERT INTO `transaccion` VALUES ('20131130095137ec3418eb59ce11e382682016d8d47c3d', '610', '1', '2013-11-30 09:51:37', '', 'Registro ESPECIE  9 - 000021S .::. NOMBRE CIENTIFICO');
INSERT INTO `transaccion` VALUES ('20131130101828acb3065459d211e382682016d8d47c3d', '612', '1', '2013-11-30 10:18:28', '', '.::. ELIMINAR ESPECIE - Y CARACTERISTICAS ESPECIE .::. 7');
INSERT INTO `transaccion` VALUES ('201311301105273d16922459d911e382682016d8d47c3d', '610', '1', '2013-11-30 11:05:27', '', 'Registro ESPECIE  1 - 0001 .::. NOMBRE CIENTIFICO ESPECIE');
INSERT INTO `transaccion` VALUES ('201311301413599315f77b59f311e382682016d8d47c3d', '36', '1', '2013-11-30 14:13:59', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131201192218cfe143815ae711e382682016d8d47c3d', '36', '1', '2013-12-01 19:22:18', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131202102548079c5acd5b6611e382682016d8d47c3d', '36', '1', '2013-12-02 10:25:48', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120212163782916dee5b7511e382682016d8d47c3d', '36', '1', '2013-12-02 12:16:37', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312021752306eb8a5505ba411e382682016d8d47c3d', '36', '1', '2013-12-02 17:52:30', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203080634bec919985c1b11e382682016d8d47c3d', '36', '1', '2013-12-03 08:06:34', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203080634becd3a225c1b11e382682016d8d47c3d', '36', '1', '2013-12-03 08:06:34', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203081048565240815c1c11e382682016d8d47c3d', '36', '1', '2013-12-03 08:10:48', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203094642bb6c609b5c2911e382682016d8d47c3d', '36', '1', '2013-12-03 09:46:42', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312031042288621d8a65c3111e382682016d8d47c3d', '36', '1', '2013-12-03 10:42:28', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312031535066790f8f85c5a11e382682016d8d47c3d', '36', '1', '2013-12-03 15:35:06', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312031550318f0e79155c5c11e382682016d8d47c3d', '36', '1', '2013-12-03 15:50:31', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203165537a71f1b1c5c6511e382682016d8d47c3d', '36', '1', '2013-12-03 16:55:37', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203165537a72182a45c6511e382682016d8d47c3d', '36', '1', '2013-12-03 16:55:37', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203165720e47e7f555c6511e382682016d8d47c3d', '36', '1', '2013-12-03 16:57:20', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203165720e47f63005c6511e382682016d8d47c3d', '36', '1', '2013-12-03 16:57:20', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312031705330a2b54f05c6711e382682016d8d47c3d', '36', '1', '2013-12-03 17:05:33', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120320283466ce17dd5c8311e382682016d8d47c3d', '36', '1', '2013-12-03 20:28:34', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120320365390298e5d5c8411e382682016d8d47c3d', '36', '1', '2013-12-03 20:36:53', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131203203653902d136b5c8411e382682016d8d47c3d', '36', '1', '2013-12-03 20:36:53', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120322510750c5918a5c9711e382682016d8d47c3d', '36', '1', '2013-12-03 22:51:07', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120322510750c686465c9711e382682016d8d47c3d', '36', '1', '2013-12-03 22:51:07', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120408074211b9d7685ce511e382682016d8d47c3d', '36', '1', '2013-12-04 08:07:42', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120408074211bcd7245ce511e382682016d8d47c3d', '36', '1', '2013-12-04 08:07:42', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131204091212148d2c015cee11e382682016d8d47c3d', '7', '1', '2013-12-04 09:12:12', '', 'Registro la persona fghdgfh fghdgfh dgfhdgfhdgf');
INSERT INTO `transaccion` VALUES ('2013120409193119c1a12b5cef11e382682016d8d47c3d', '7', '1', '2013-12-04 09:19:31', '', 'Registro la persona perez perez enrique');
INSERT INTO `transaccion` VALUES ('20131204092827599df6785cf011e382682016d8d47c3d', '7', '1', '2013-12-04 09:28:27', '', 'Registro la persona perez perez enrique');
INSERT INTO `transaccion` VALUES ('201312040937028c9999c25cf111e382682016d8d47c3d', '7', '1', '2013-12-04 09:37:02', '', 'Registro la persona pisfil pisfil maria ');
INSERT INTO `transaccion` VALUES ('20131204094011fcf4ec585cf111e382682016d8d47c3d', '7', '1', '2013-12-04 09:40:11', '', 'Registro la persona pisfil pisfil veronica');
INSERT INTO `transaccion` VALUES ('20131204095652518ed2535cf411e382682016d8d47c3d', '7', '1', '2013-12-04 09:56:52', '', 'Registro la persona pisfil pisfil veronica');
INSERT INTO `transaccion` VALUES ('20131204100041d9ff87575cf411e382682016d8d47c3d', '7', '1', '2013-12-04 10:00:41', '', 'Registro la persona pisfil pisfil enrique');
INSERT INTO `transaccion` VALUES ('2013120411574636ec18055d0511e382682016d8d47c3d', '36', '1', '2013-12-04 11:57:46', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131204130255514004135d0e11e382682016d8d47c3d', '7', '1', '2013-12-04 13:02:55', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('2013120413035071dacc195d0e11e382682016d8d47c3d', '7', '1', '2013-12-04 13:03:50', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('20131204130732f63beba45d0e11e382682016d8d47c3d', '7', '1', '2013-12-04 13:07:32', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041308211377677b5d0f11e382682016d8d47c3d', '7', '1', '2013-12-04 13:08:21', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041309012afe99795d0f11e382682016d8d47c3d', '7', '1', '2013-12-04 13:09:01', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('20131204141055d107f17c5d1711e382682016d8d47c3d', '7', '1', '2013-12-04 14:10:55', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('20131204141154f418031f5d1711e382682016d8d47c3d', '7', '1', '2013-12-04 14:11:54', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('20131204141308200cbff05d1811e382682016d8d47c3d', '7', '1', '2013-12-04 14:13:08', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041414013f8c586c5d1811e382682016d8d47c3d', '7', '1', '2013-12-04 14:14:01', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041414455a51ea605d1811e382682016d8d47c3d', '7', '1', '2013-12-04 14:14:45', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041415176cd2d3c25d1811e382682016d8d47c3d', '7', '1', '2013-12-04 14:15:17', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427502dc2e6925d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:50', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427502e38f1e35d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:50', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427512e8174155d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:51', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427512ea0d5ff5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:51', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427512ebead375d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:51', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427522ee250f95d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:52', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427522f16d45b5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:52', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427522f3cb1fd5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:52', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427522f6357c85d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:52', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427532fa856cb5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:53', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427532fc719d25d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:53', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427532fe434c95d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:53', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041427532ffcd32e5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:27:53', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041428123b4715aa5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:28:12', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041429055ab2f74b5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:29:05', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041430348fef0c8d5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:30:34', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('20131204143219ce8161ac5d1a11e382682016d8d47c3d', '7', '1', '2013-12-04 14:32:19', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041435283eb7bae25d1b11e382682016d8d47c3d', '7', '1', '2013-12-04 14:35:28', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('201312041448190a5910bc5d1d11e382682016d8d47c3d', '7', '1', '2013-12-04 14:48:19', '', 'Registro la persona guevara guevara lorenzo');
INSERT INTO `transaccion` VALUES ('20131204153713df11b7245d2311e382682016d8d47c3d', '7', '1', '2013-12-04 15:37:13', '', 'Actualizar PescadorGUEVARA GUEVARA LORENZO');
INSERT INTO `transaccion` VALUES ('20131204153726e736fddc5d2311e382682016d8d47c3d', '7', '1', '2013-12-04 15:37:26', '', 'Actualizar PescadorGUEVARA GUEVARA LORENZO');
INSERT INTO `transaccion` VALUES ('20131204160412a4734dcf5d2711e382682016d8d47c3d', '610', '1', '2013-12-04 16:04:12', '', 'Registro Rol 5463456345G .::. ASDFASDFASDFFFFFFFFFFFFFFFF');
INSERT INTO `transaccion` VALUES ('20131204160539d7e824945d2711e382682016d8d47c3d', '610', '1', '2013-12-04 16:05:39', '', 'Registro Rol 1111111111111111111111 .::. SSSSSSSSSSSSSSSSSSSSS');
INSERT INTO `transaccion` VALUES ('20131204160600e48e44f25d2711e382682016d8d47c3d', '610', '1', '2013-12-04 16:06:00', '', 'Registro Rol 11111111222222222222222 .::. 22222222222222222222');
INSERT INTO `transaccion` VALUES ('2013120416065706ad40575d2811e382682016d8d47c3d', '610', '1', '2013-12-04 16:06:57', '', 'Registro Rol 33333 .::. 222222222222222');
INSERT INTO `transaccion` VALUES ('2013120416070008426d035d2811e382682016d8d47c3d', '610', '1', '2013-12-04 16:07:00', '', 'Registro Rol 33333 .::. 222222222222222');
INSERT INTO `transaccion` VALUES ('20131204160720146cf81c5d2811e382682016d8d47c3d', '610', '1', '2013-12-04 16:07:20', '', 'Registro Rol 22222222233 .::. DSFSFSDF');
INSERT INTO `transaccion` VALUES ('201312041610127ace027b5d2811e382682016d8d47c3d', '610', '1', '2013-12-04 16:10:12', '', 'Registro Rol 22222222233 .::. DSFSFSDF');
INSERT INTO `transaccion` VALUES ('201312041610589655d2fd5d2811e382682016d8d47c3d', '610', '1', '2013-12-04 16:10:58', '', 'Registro Rol 3452345 .::. 44444444444444');
INSERT INTO `transaccion` VALUES ('201312041654109efaad765d2e11e382682016d8d47c3d', '610', '1', '2013-12-04 16:54:10', '', 'Registro Rol 0000000034 .::. NUEVO DESEMBARQUE');
INSERT INTO `transaccion` VALUES ('2013120417060347fdb3f45d3011e382682016d8d47c3d', '610', '1', '2013-12-04 17:06:03', '', 'Registro Rol 5634563456 .::. NUEVO DESEMBARQUE 2');
INSERT INTO `transaccion` VALUES ('2013120417062756b0d6b75d3011e382682016d8d47c3d', '610', '1', '2013-12-04 17:06:27', '', 'Registro Rol 64567467567567 .::. NUEVO DESEMBARQUE 444');
INSERT INTO `transaccion` VALUES ('20131204170737800bfd145d3011e382682016d8d47c3d', '610', '1', '2013-12-04 17:07:37', '', 'Registro Rol 3456435645 .::. NUEVO SIIII');
INSERT INTO `transaccion` VALUES ('2013120417075188b3a8415d3011e382682016d8d47c3d', '610', '1', '2013-12-04 17:07:51', '', 'Registro Rol 456766687678 .::. DDDDDDDDDDDDDDDDD');
INSERT INTO `transaccion` VALUES ('20131204185711ce6c91545d3f11e382682016d8d47c3d', '7', '1', '2013-12-04 18:57:11', '', 'Registro la persona vargas vargas maria');
INSERT INTO `transaccion` VALUES ('201312041858580eaac4435d4011e382682016d8d47c3d', '7', '1', '2013-12-04 18:58:58', '', 'Registro la persona vargas vargas maria');
INSERT INTO `transaccion` VALUES ('20131204190025421f61a85d4011e382682016d8d47c3d', '7', '1', '2013-12-04 19:00:25', '', 'Registro la persona vargas vargas maria');
INSERT INTO `transaccion` VALUES ('2013120419005654fb2e3a5d4011e382682016d8d47c3d', '7', '1', '2013-12-04 19:00:56', '', 'Registro la persona vargas vargas maria');
INSERT INTO `transaccion` VALUES ('201312041902298c1fcf905d4011e382682016d8d47c3d', '7', '1', '2013-12-04 19:02:29', '', 'Registro la persona gsdfgsdf gsdfgsdf gsdfg');
INSERT INTO `transaccion` VALUES ('201312042200577ae2efd75d5911e382682016d8d47c3d', '36', '1', '2013-12-04 22:00:57', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312050806170b3dff425dae11e382682016d8d47c3d', '36', '1', '2013-12-05 08:06:17', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312050806170b58aac85dae11e382682016d8d47c3d', '36', '1', '2013-12-05 08:06:17', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131205085523e72070ce5db411e382682016d8d47c3d', '36', '1', '2013-12-05 08:55:23', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312050932120b80e6eb5dba11e382682016d8d47c3d', '7', '1', '2013-12-05 09:32:12', '', 'Registro la persona PUEMAPE PUEMAPE  armando');
INSERT INTO `transaccion` VALUES ('20131205093848f7d9fd2b5dba11e382682016d8d47c3d', '7', '1', '2013-12-05 09:38:48', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('2013120509415566e131fd5dbb11e382682016d8d47c3d', '7', '1', '2013-12-05 09:41:55', '', 'Actualizar PescadorPISFIL PISFIL ENRIQUE');
INSERT INTO `transaccion` VALUES ('20131205094403b38f43555dbb11e382682016d8d47c3d', '7', '1', '2013-12-05 09:44:03', '', 'Registro la persona liza liza renato');
INSERT INTO `transaccion` VALUES ('20131205115844841f533b5dce11e382682016d8d47c3d', '36', '1', '2013-12-05 11:58:44', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312051254585efb33ec5dd611e382682016d8d47c3d', '610', '1', '2013-12-05 12:54:58', '', 'Registro Embarcacion 847583745863 .::. LAS NAVES MAR ADENTRO');
INSERT INTO `transaccion` VALUES ('20131205130117411e964d5dd711e382682016d8d47c3d', '610', '1', '2013-12-05 13:01:17', '', 'Registro Embarcacion XKSL123 .::. SAN PABLO II');
INSERT INTO `transaccion` VALUES ('20131205134757c5d130f15ddd11e382682016d8d47c3d', '610', '1', '2013-12-05 13:47:57', '', 'Registro Embarcacion 6XHS123 .::. SAN SALVADOR II');
INSERT INTO `transaccion` VALUES ('20131205142333befe386c5de211e382682016d8d47c3d', '610', '1', '2013-12-05 14:23:33', '', 'Registro Embarcacion DSAFE234 .::. LAS MARIAS');
INSERT INTO `transaccion` VALUES ('20131205142359cebe6b025de211e382682016d8d47c3d', '610', '1', '2013-12-05 14:23:59', '', 'Registro Embarcacion DFD .::. SSSSSSSSSSSSSSS');
INSERT INTO `transaccion` VALUES ('20131205142428dfd6f5fc5de211e382682016d8d47c3d', '611', '1', '2013-12-05 14:24:28', '', 'Modifico Rol .::. 4 - SSSSSSSSSSSSSSS');
INSERT INTO `transaccion` VALUES ('20131205142517fd5a64bb5de211e382682016d8d47c3d', '611', '1', '2013-12-05 14:25:17', '', 'Modifico Rol .::. 2 - SAN SALVADOR II');
INSERT INTO `transaccion` VALUES ('201312051425571514c4115de311e382682016d8d47c3d', '611', '1', '2013-12-05 14:25:57', '', 'Modifico Rol .::. 4 - EL PIRATA');
INSERT INTO `transaccion` VALUES ('201312051426101cfe73335de311e382682016d8d47c3d', '611', '1', '2013-12-05 14:26:10', '', 'Modifico Rol .::. 4 - EL PIRATA');
INSERT INTO `transaccion` VALUES ('201312051426111d9b17525de311e382682016d8d47c3d', '611', '1', '2013-12-05 14:26:11', '', 'Modifico Rol .::. 4 - EL PIRATA');
INSERT INTO `transaccion` VALUES ('20131205143645977aa18e5de411e382682016d8d47c3d', '611', '1', '2013-12-05 14:36:45', '', 'Modifico Rol .::. 2 - SAN SALVADOR II');
INSERT INTO `transaccion` VALUES ('20131205144458bd1bbe9b5de511e382682016d8d47c3d', '612', '1', '2013-12-05 14:44:58', '', 'Elimino Aparejo de Pesca .::. 4');
INSERT INTO `transaccion` VALUES ('201312052248063b2335385e2911e382682016d8d47c3d', '36', '1', '2013-12-05 22:48:06', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120600063833ea115a5e3411e382682016d8d47c3d', '610', '1', '2013-12-06 00:06:38', '', 'Registro Embarcacion DJS123 .::. LAS CARABELAS DE PBLO');
INSERT INTO `transaccion` VALUES ('20131206080358e2bc4ec45e7611e382682016d8d47c3d', '36', '1', '2013-12-06 08:03:58', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131206082611fd1722585e7911e382682016d8d47c3d', '36', '1', '2013-12-06 08:26:11', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131206085010571b8ad75e7d11e382682016d8d47c3d', '610', '1', '2013-12-06 08:50:10', '', 'Registro Embarcacion TRAMITE .::. EL PIRATA DEL MAR ROJO');
INSERT INTO `transaccion` VALUES ('201312060851127ba740d75e7d11e382682016d8d47c3d', '610', '1', '2013-12-06 08:51:12', '', 'Registro Embarcacion GDFGHDFGH .::. RAPIDOS');
INSERT INTO `transaccion` VALUES ('201312061052336fc021845e8e11e382682016d8d47c3d', '611', '1', '2013-12-06 10:52:33', '', 'Modifico Rol .::. 10 - CALLAO');
INSERT INTO `transaccion` VALUES ('201312061202484021176e5e9811e382682016d8d47c3d', '610', '1', '2013-12-06 12:02:48', '', 'Registro Rol 999934345 .::. NUEVO SITIO 222222222');
INSERT INTO `transaccion` VALUES ('20131206120839115a9ace5e9911e382682016d8d47c3d', '610', '1', '2013-12-06 12:08:39', '', 'Registro Rol 00000000000000 .::. PIMENTEL');
INSERT INTO `transaccion` VALUES ('201312061209333170ba065e9911e382682016d8d47c3d', '610', '1', '2013-12-06 12:09:33', '', 'Registro Rol 87697896789 .::. VVVVVVVVV');
INSERT INTO `transaccion` VALUES ('20131206122428468817ed5e9b11e382682016d8d47c3d', '610', '1', '2013-12-06 12:24:28', '', 'Registro SITIO DE DESEMBARQUE .::. GFHDFGH .::. YYYYYYYYYYYY');
INSERT INTO `transaccion` VALUES ('201312061225085ea79dfd5e9b11e382682016d8d47c3d', '610', '1', '2013-12-06 12:25:08', '', 'Registro SITIO DE DESEMBARQUE .::. GFHDFGHDDDDD .::. YYYYYYYYYYYY');
INSERT INTO `transaccion` VALUES ('20131206122520658dbe4c5e9b11e382682016d8d47c3d', '610', '1', '2013-12-06 12:25:20', '', 'Registro SITIO DE DESEMBARQUE .::. GFHDFGHDDDDDDDDD .::. YYYYYYYYYYYY');
INSERT INTO `transaccion` VALUES ('201312061231223da314315e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:31:22', '', 'Registro SITIO DE DESEMBARQUE .::. DFSDFSDFSDF .::. FFFFFFFFFFFF');
INSERT INTO `transaccion` VALUES ('201312061231314307f25e5e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:31:31', '', 'Registro SITIO DE DESEMBARQUE .::. DFSDFSDFSDFXCVXCVXCV .::. FFFFFFFFFFFF');
INSERT INTO `transaccion` VALUES ('2013120612313846f770945e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:31:38', '', 'Registro SITIO DE DESEMBARQUE .::. DFSDFSDFSDFXCVXCVXCVXCVCVXCV .::. FFFFFFFFFFFF');
INSERT INTO `transaccion` VALUES ('201312061231444aad5d575e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:31:44', '', 'Registro SITIO DE DESEMBARQUE .::. SDFSDFFSDFSD .::. FFFFFFFFFFFF');
INSERT INTO `transaccion` VALUES ('20131206123320842ad1595e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:33:20', '', 'Registro SITIO DE DESEMBARQUE .::. SDFASDFASD .::. DDDDDDDDDDDDDDDD');
INSERT INTO `transaccion` VALUES ('201312061233398f47d2d95e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:33:39', '', 'Registro SITIO DE DESEMBARQUE .::. SDFSDFDFASD .::. EEEEEEEEEEEEEEE');
INSERT INTO `transaccion` VALUES ('2013120612335799e993155e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:33:57', '', 'Registro SITIO DE DESEMBARQUE .::. SDFGSDFGSDFGSDFG .::. JJJJJJJJJJJJJJJJJJJJJJ');
INSERT INTO `transaccion` VALUES ('20131206123611e98efde55e9c11e382682016d8d47c3d', '610', '1', '2013-12-06 12:36:11', '', 'Registro SITIO DE DESEMBARQUE .::. 00003 .::. PUERTO ETÉN');
INSERT INTO `transaccion` VALUES ('201312061315075a4407935ea211e382682016d8d47c3d', '610', '1', '2013-12-06 13:15:07', '', 'Registro  ARTE DE PESCA .::. 000020 .::. ALAMBRES');
INSERT INTO `transaccion` VALUES ('2013120615092551a0820a5eb211e382682016d8d47c3d', '36', '1', '2013-12-06 15:09:25', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131206170805e58c1f775ec211e382682016d8d47c3d', '36', '1', '2013-12-06 17:08:05', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120621075063ff22485ee411e382682016d8d47c3d', '36', '1', '2013-12-06 21:07:50', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013120621195212666f295ee611e382682016d8d47c3d', '36', '1', '2013-12-06 21:19:52', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131206224859857fed225ef211e382682016d8d47c3d', '36', '1', '2013-12-06 22:48:59', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131207103522338f6d875f5511e382682016d8d47c3d', '610', '1', '2013-12-07 10:35:22', '', 'Registro Embarcacion XJSKD123 .::. EL PIRATA DEL MAR');
INSERT INTO `transaccion` VALUES ('20131207103646656f5dac5f5511e382682016d8d47c3d', '610', '1', '2013-12-07 10:36:46', '', 'Registro Embarcacion HDGS45 .::. SAN PABLO II');
INSERT INTO `transaccion` VALUES ('201312031224568236526d5f6411e382682016d8d47c3d', '610', '1', '2013-12-03 12:24:56', '', 'Registro SITIO DE DESEMBARQUE .::. JJJ .::. CHICLAYO');
INSERT INTO `transaccion` VALUES ('20131203123446e17bb8085f6511e382682016d8d47c3d', '7', '1', '2013-12-03 12:34:46', '', 'Registro la persona andonaire andonaire henry smith');
INSERT INTO `transaccion` VALUES ('20131203124238faf886c55f6611e382682016d8d47c3d', '610', '1', '2013-12-03 12:42:38', '', 'Registro  ARTE DE PESCA .::. 0000005 .::. MALLA');
INSERT INTO `transaccion` VALUES ('20131208222128fdf51b00608011e3b9f12016d8d47c3d', '36', '1', '2013-12-08 22:21:28', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131208222128fdf58f63608011e3b9f12016d8d47c3d', '36', '1', '2013-12-08 22:21:28', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131209080114fc11f8bf60d111e3b9f12016d8d47c3d', '36', '1', '2013-12-09 08:01:14', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131209091955fa3a8e1360dc11e3b9f12016d8d47c3d', '610', '1', '2013-12-09 09:19:55', '', 'Registro ESTADO CIVIL .::. 00023 .::. NUEVO ESTADO');
INSERT INTO `transaccion` VALUES ('2013120909224961df4eff60dd11e3b9f12016d8d47c3d', '612', '1', '2013-12-09 09:22:49', '', 'Elimino Arte de Pesca .::. 6');
INSERT INTO `transaccion` VALUES ('2013120910345272aa980360e711e3b9f12016d8d47c3d', '610', '1', '2013-12-09 10:34:52', '', 'Registro TIPO DE TELEFONO .::. C1 .::. RPM');
INSERT INTO `transaccion` VALUES ('20131209120926a83195af60f411e3b9f12016d8d47c3d', '36', '1', '2013-12-09 12:09:26', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312091715055b6eaa80611f11e3b9f12016d8d47c3d', '7', '1', '2013-12-09 17:15:05', '', 'Registro Entidad Finaciera ghfgh fghfgh');
INSERT INTO `transaccion` VALUES ('201312091716599f835ee2611f11e3b9f12016d8d47c3d', '7', '1', '2013-12-09 17:16:59', '', 'Registro Entidad Finaciera ghfgh fghfgh');
INSERT INTO `transaccion` VALUES ('20131209172231653f9782612011e3b9f12016d8d47c3d', '7', '1', '2013-12-09 17:22:31', '', 'Registro Entidad Finaciera 20100047218 banco de creditos del peru ');
INSERT INTO `transaccion` VALUES ('20131209174736e5e6f751612311e3b9f12016d8d47c3d', '7', '1', '2013-12-09 17:47:36', '', 'Registro Entidad Finaciera 20504565794 Banco Agrario del Perú');
INSERT INTO `transaccion` VALUES ('2013120921524726cd3e6a614611e3b9f12016d8d47c3d', '36', '1', '2013-12-09 21:52:47', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312092214242ba7182e614911e3b9f12016d8d47c3d', '36', '1', '2013-12-09 22:14:24', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312092221352c82dd51614a11e3b9f12016d8d47c3d', '36', '1', '2013-12-09 22:21:35', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131210081305ce4a9697619c11e3b9f12016d8d47c3d', '36', '1', '2013-12-10 08:13:05', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131210081305ce4b6eca619c11e3b9f12016d8d47c3d', '36', '1', '2013-12-10 08:13:05', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121013374428e4bead61ca11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 13:37:44', '', 'Modifico Entidad Financiera .::. BANCO CONTINENTAL');
INSERT INTO `transaccion` VALUES ('20131210141848e5757e5a61cf11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:18:48', '', 'Modifico Entidad Financiera .::. HSDHFHJASDJFHASDJF');
INSERT INTO `transaccion` VALUES ('20131210141849e5fa6b0161cf11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:18:49', '', 'Modifico Entidad Financiera .::. HSDHFHJASDJFHASDJF');
INSERT INTO `transaccion` VALUES ('20131210141851e74f492261cf11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:18:51', '', 'Modifico Entidad Financiera .::. HSDHFHJASDJFHASDJF');
INSERT INTO `transaccion` VALUES ('20131210141852e76e9ee061cf11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:18:52', '', 'Modifico Entidad Financiera .::. HSDHFHJASDJFHASDJF');
INSERT INTO `transaccion` VALUES ('20131210141852e78d08ce61cf11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:18:52', '', 'Modifico Entidad Financiera .::. HSDHFHJASDJFHASDJF');
INSERT INTO `transaccion` VALUES ('20131210141852e7aa88df61cf11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:18:52', '', 'Modifico Entidad Financiera .::. HSDHFHJASDJFHASDJF');
INSERT INTO `transaccion` VALUES ('20131210141852e7c89cd361cf11e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:18:52', '', 'Modifico Entidad Financiera .::. HSDHFHJASDJFHASDJF');
INSERT INTO `transaccion` VALUES ('20131210142029219ccb8961d011e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:20:29', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALES');
INSERT INTO `transaccion` VALUES ('201312101420312281389061d011e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:20:31', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALES');
INSERT INTO `transaccion` VALUES ('201312101423348fd9912a61d011e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:23:34', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALES');
INSERT INTO `transaccion` VALUES ('201312101423399289aed261d011e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:23:39', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('20131210142532d6349dcf61d011e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:25:32', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('2013121014305093e40c9c61d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:30:50', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('201312101431029b1380cf61d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:31:02', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('201312101431039b83769261d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:31:03', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('201312101431039ba6001761d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:31:03', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('20131210143324ef86874361d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:33:24', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('20131210143325f00efe6161d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:33:25', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('20131210143334f59d3da061d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:33:34', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('20131210143341f9d0e91261d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:33:41', '', 'Modifico Entidad Financiera .::. BANCO AGRARIO DEL PERÚ');
INSERT INTO `transaccion` VALUES ('20131210143346fcd0ef7061d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:33:46', '', 'Modifico Entidad Financiera .::. BANCO AGRARIO DEL PERÚ');
INSERT INTO `transaccion` VALUES ('20131210143350feb3ab4161d111e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:33:50', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALESSSSS');
INSERT INTO `transaccion` VALUES ('201312101435092ddadd9461d211e3b9f12016d8d47c3d', '611', '1', '2013-12-10 14:35:09', '', 'Modifico Entidad Financiera .::. BANCO DE MATERIALES');
INSERT INTO `transaccion` VALUES ('201312101711450e5796ff61e811e3b9f12016d8d47c3d', '612', '1', '2013-12-10 17:11:45', '', 'Elimino Aparejo de Pesca .::. 100000100006');
INSERT INTO `transaccion` VALUES ('201312101714537ec073c361e811e3b9f12016d8d47c3d', '611', '1', '2013-12-10 17:14:53', '', 'Modifico Entidad Financiera .::. BANCO DE CREDITOS DEL PERU');
INSERT INTO `transaccion` VALUES ('201312101804547b3467d861ef11e3b9f12016d8d47c3d', '7', '1', '2013-12-10 18:04:54', '', 'Registro Entidad Finaciera 2352345564 Centro de Investigación y Promoción Agraria');
INSERT INTO `transaccion` VALUES ('201312101811115c4e2db561f011e3b9f12016d8d47c3d', '7', '1', '2013-12-10 18:11:11', '', 'Registro Entidad Finaciera 45345345345 Instituto Nacional de Desarrollo');
INSERT INTO `transaccion` VALUES ('20131210181622152cd35461f111e3b9f12016d8d47c3d', '7', '1', '2013-12-10 18:16:22', '', 'Registro Entidad Finaciera 234523452345 Instituto Nacional de Desarrollo de la Agroindustria');
INSERT INTO `transaccion` VALUES ('201312101818336367bbf461f111e3b9f12016d8d47c3d', '7', '1', '2013-12-10 18:18:33', '', 'Registro Entidad Finaciera 32452345435 Instituto Nacional de Investigación y Promoción Agraria');
INSERT INTO `transaccion` VALUES ('201312102124265b0c045e620b11e3b9f12016d8d47c3d', '36', '1', '2013-12-10 21:24:26', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312102124265b0e7388620b11e3b9f12016d8d47c3d', '36', '1', '2013-12-10 21:24:26', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131211081941e4fa534f626611e3b9f12016d8d47c3d', '36', '1', '2013-12-11 08:19:41', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131211081941e5012dc8626611e3b9f12016d8d47c3d', '36', '1', '2013-12-11 08:19:41', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131211124959a75da35d628c11e3b9f12016d8d47c3d', '610', '1', '2013-12-11 12:49:59', '', 'Registro Familia Especie 17 - 0002 .::. GENERO ENGRAULIDE');
INSERT INTO `transaccion` VALUES ('2013121113012942b90858628e11e3b9f12016d8d47c3d', '610', '1', '2013-12-11 13:01:29', '', 'Registro ESPECIE  2 - 235645 .::. ENGRAULIS RINGENS JENYNS');
INSERT INTO `transaccion` VALUES ('201312111545383154a8ef62a511e3b9f12016d8d47c3d', '610', '1', '2013-12-11 15:45:38', '', 'Registro ESTADO CIVIL .::. CV .::. CONVIENTE DOS');
INSERT INTO `transaccion` VALUES ('2013121211181903af060b634911e3baba2016d8d47c3d', '36', '1', '2013-12-12 11:18:19', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131212225905e9171d3a63aa11e3baba2016d8d47c3d', '36', '1', '2013-12-12 22:59:05', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131212230728147f536463ac11e3baba2016d8d47c3d', '36', '1', '2013-12-12 23:07:28', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121223152631f3dd9763ad11e3baba2016d8d47c3d', '36', '1', '2013-12-12 23:15:26', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312130819202cf62c7263f911e3b4882016d8d47c3d', '36', '1', '2013-12-13 08:19:20', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312130819202cf82aed63f911e3b4882016d8d47c3d', '36', '1', '2013-12-13 08:19:20', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131213094859b2ea08b6640511e3b4882016d8d47c3d', '36', '1', '2013-12-13 09:48:59', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131213094859b2ead5ee640511e3b4882016d8d47c3d', '36', '1', '2013-12-13 09:48:59', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121312083130fc39c2641911e3b4882016d8d47c3d', '36', '1', '2013-12-13 12:08:31', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131213135928b0fd8e91642811e3b4882016d8d47c3d', '36', '1', '2013-12-13 13:59:28', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121314113361249723642a11e3b4882016d8d47c3d', '36', '1', '2013-12-13 14:11:33', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131213151236e8dcba33643211e3b4882016d8d47c3d', '36', '1', '2013-12-13 15:12:36', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312131626534915dae6643d11e3b4882016d8d47c3d', '36', '1', '2013-12-13 16:26:53', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131213213150e2c2fd8f646711e3b4882016d8d47c3d', '36', '1', '2013-12-13 21:31:50', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131214080812c95634e364c011e3b4882016d8d47c3d', '36', '1', '2013-12-14 08:08:12', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312140834186ee9474764c411e3b4882016d8d47c3d', '7', '1', '2013-12-14 08:34:18', '', 'Actualizar PescadorPUEMAPE PUEMAPE ARMANDO');
INSERT INTO `transaccion` VALUES ('201312140834217057302b64c411e3b4882016d8d47c3d', '7', '1', '2013-12-14 08:34:21', '', 'Actualizar PescadorPUEMAPE PUEMAPE ARMANDO');
INSERT INTO `transaccion` VALUES ('20131214083431764826db64c411e3b4882016d8d47c3d', '7', '1', '2013-12-14 08:34:31', '', 'Actualizar PescadorPUEMAPE PUEMAPE ARMANDO');
INSERT INTO `transaccion` VALUES ('201312140839392e3dd26b64c511e3b4882016d8d47c3d', '7', '1', '2013-12-14 08:39:39', '', 'Actualizar PescadorPUEMAPE PUEMAPE ARMANDO');
INSERT INTO `transaccion` VALUES ('20131214092814f75232f764cb11e3b4882016d8d47c3d', '7', '1', '2013-12-14 09:28:14', '', 'Registro la persona llenque llenque Justo de la  cruz');
INSERT INTO `transaccion` VALUES ('2013121409300036cd8ce464cc11e3b4882016d8d47c3d', '610', '1', '2013-12-14 09:30:00', '', 'Registro Embarcacion PL-2358-BM .::. CHOLO JUSTO');
INSERT INTO `transaccion` VALUES ('201312140953267cde337764cf11e3b4882016d8d47c3d', '36', '1', '2013-12-14 09:53:26', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312140953267cdea57e64cf11e3b4882016d8d47c3d', '36', '1', '2013-12-14 09:53:26', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121411033046915c5a64d911e3b4882016d8d47c3d', '610', '1', '2013-12-14 11:03:30', '', 'Registro Embarcacion GDHS123 .::. EL PIRATA');
INSERT INTO `transaccion` VALUES ('201312141311151ef32a1c64eb11e3b4882016d8d47c3d', '610', '1', '2013-12-14 13:11:15', '', 'Registro ESPECIE  3 - 54 .::. CABALLA');
INSERT INTO `transaccion` VALUES ('201312160545583f97045d663f11e3b4882016d8d47c3d', '36', '1', '2013-12-16 05:45:58', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121606364255929e8d664611e3b4882016d8d47c3d', '36', '1', '2013-12-16 06:36:42', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121608084833778e76665311e3b4882016d8d47c3d', '36', '1', '2013-12-16 08:08:48', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131216083422c60021c2665611e3b4882016d8d47c3d', '36', '1', '2013-12-16 08:34:22', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131216113336cfc8a64a666f11e3b4882016d8d47c3d', '610', '1', '2013-12-16 11:33:36', '', 'Registro Embarcacion CJSK34 .::. EL CHOLO');
INSERT INTO `transaccion` VALUES ('201312161436265a4f4410668911e3b4882016d8d47c3d', '610', '1', '2013-12-16 14:36:26', '', 'Registro Embarcacion XKSJD .::. LA NAVE');
INSERT INTO `transaccion` VALUES ('20131217081227e08e85e3671c11e3b4882016d8d47c3d', '36', '1', '2013-12-17 08:12:27', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131217112434b6fceebf673711e3b4882016d8d47c3d', '36', '1', '2013-12-17 11:24:34', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312171615596d05d5ae676011e3b4882016d8d47c3d', '36', '1', '2013-12-17 16:15:59', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131217171441a084df0f676811e3b4882016d8d47c3d', '7', '1', '2013-12-17 17:14:41', '', 'Registro la persona vargas vargas juan manuel');
INSERT INTO `transaccion` VALUES ('20131217171532beb1cdab676811e3b4882016d8d47c3d', '610', '1', '2013-12-17 17:15:32', '', 'Registro Embarcacion JAJSDHJCS3 .::. EL BRAVO');
INSERT INTO `transaccion` VALUES ('20131217174336aa70f56d676c11e3b4882016d8d47c3d', '610', '1', '2013-12-17 17:43:36', '', 'Registro MATERIAL DE CONSTRUCCIÓN .::. M .::. MADERA');
INSERT INTO `transaccion` VALUES ('20131217174402b9ee25fe676c11e3b4882016d8d47c3d', '610', '1', '2013-12-17 17:44:02', '', 'Registro MATERIAL DE CONSTRUCCIÓN .::. AC .::. ACERO');
INSERT INTO `transaccion` VALUES ('20131217174536f1d5a130676c11e3b4882016d8d47c3d', '611', '1', '2013-12-17 17:45:36', '', 'Modifico Rol .::. 1 - MADERA');
INSERT INTO `transaccion` VALUES ('201312172207147ea6636e679111e3b4882016d8d47c3d', '36', '1', '2013-12-17 22:07:14', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131218083951df1c11a667e911e3b4882016d8d47c3d', '36', '1', '2013-12-18 08:39:51', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312180918394a67283a67ef11e3b4882016d8d47c3d', '36', '1', '2013-12-18 09:18:39', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131218093731ed65c74967f111e3b4882016d8d47c3d', '610', '1', '2013-12-18 09:37:31', '', 'Registro SITIO DE DESEMBARQUE .::. 44444 .::. SAN JOSE');
INSERT INTO `transaccion` VALUES ('20131218095117d940986a67f311e3b4882016d8d47c3d', '610', '1', '2013-12-18 09:51:17', '', 'Registro SITIO DE DESEMBARQUE .::. 5555 .::. ETEN');
INSERT INTO `transaccion` VALUES ('201312180953463223ce9c67f411e3b4882016d8d47c3d', '610', '1', '2013-12-18 09:53:46', '', 'Registro Embarcacion TRAMITE .::. DAVID');
INSERT INTO `transaccion` VALUES ('201312180954304c9156e267f411e3b4882016d8d47c3d', '611', '1', '2013-12-18 09:54:30', '', 'Modifico Rol .::. 8 - DAVID');
INSERT INTO `transaccion` VALUES ('2013121811282369dc4270680111e3b4882016d8d47c3d', '36', '1', '2013-12-18 11:28:23', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131219080927d086a40a68ae11e3b4882016d8d47c3d', '36', '1', '2013-12-19 08:09:27', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131219081534ab55b98768af11e3b4882016d8d47c3d', '36', '1', '2013-12-19 08:15:34', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013121908185422a2f90768b011e3b4882016d8d47c3d', '36', '1', '2013-12-19 08:18:54', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131219083247133b507368b211e3b4882016d8d47c3d', '36', '1', '2013-12-19 08:32:47', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312190850057d9d787768b411e3b4882016d8d47c3d', '36', '1', '2013-12-19 08:50:05', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131219123306a10d9d4968d311e3b4882016d8d47c3d', '610', '1', '2013-12-19 12:33:06', '', 'Registro PERFIL   1 - ES .::. ESTACION DE PRUEBA');
INSERT INTO `transaccion` VALUES ('20131219131143060893fd68d911e3b4882016d8d47c3d', '612', '1', '2013-12-19 13:11:43', '', 'Elimino perfil .::. 1');
INSERT INTO `transaccion` VALUES ('201312191311520b9ebfd968d911e3b4882016d8d47c3d', '612', '1', '2013-12-19 13:11:52', '', 'Elimino perfil .::. 2');
INSERT INTO `transaccion` VALUES ('2013121913132643e6d40168d911e3b4882016d8d47c3d', '612', '1', '2013-12-19 13:13:26', '', 'Elimino perfil .::. 1');
INSERT INTO `transaccion` VALUES ('201312191349545c00924c68de11e3b4882016d8d47c3d', '610', '1', '2013-12-19 13:49:54', '', 'Registro PARÁMETRO FÍSI/QUÍM\r\n .::. T .::. TEMPERATURA');
INSERT INTO `transaccion` VALUES ('20131219135007638ec5c568de11e3b4882016d8d47c3d', '610', '1', '2013-12-19 13:50:07', '', 'Registro PARÁMETRO FÍSI/QUÍM\r\n .::. O2 .::. OXIGENO');
INSERT INTO `transaccion` VALUES ('201312191350206b84ae6468de11e3b4882016d8d47c3d', '610', '1', '2013-12-19 13:50:20', '', 'Registro PARÁMETRO FÍSI/QUÍM\r\n .::. S .::. SALINIDAD');
INSERT INTO `transaccion` VALUES ('2013121913503775a4259b68de11e3b4882016d8d47c3d', '610', '1', '2013-12-19 13:50:37', '', 'Registro PARÁMETRO FÍSI/QUÍM\r\n .::. N .::. NUTRIENTES');
INSERT INTO `transaccion` VALUES ('20131219135106870adb7068de11e3b4882016d8d47c3d', '610', '1', '2013-12-19 13:51:06', '', 'Registro PARÁMETRO FÍSI/QUÍM\r\n .::. CL \"A\" .::. CLOROFILA \"A\"');
INSERT INTO `transaccion` VALUES ('20131221102942b93f8f9f6a5411e3b4882016d8d47c3d', '36', '1', '2013-12-21 10:29:42', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131221221205d8094bf66ab611e3b4882016d8d47c3d', '36', '1', '2013-12-21 22:12:05', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013122122423118493a726abb11e3b4882016d8d47c3d', '612', '1', '2013-12-21 22:42:31', '', 'Elimino Arte de Pesca .::. 8');
INSERT INTO `transaccion` VALUES ('201312221929003a36159c6b6911e3b4882016d8d47c3d', '36', '1', '2013-12-22 19:29:00', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('20131223081533507ff9d86bd411e3b4882016d8d47c3d', '36', '1', '2013-12-23 08:15:33', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('201312230823547a939a5f6bd511e3b4882016d8d47c3d', '610', '1', '2013-12-23 08:23:54', '', 'Registro PARÁMETRO PROFUNDIDAD .::. 10 .::. 10');
INSERT INTO `transaccion` VALUES ('201312231148521d2aee996bf211e3b4882016d8d47c3d', '610', '1', '2013-12-23 11:48:52', '', 'REGISTRO ZONA DE PESCA0003 .::. ISLA LOS LOBOS DE TIERRA');
INSERT INTO `transaccion` VALUES ('201312231150114bedcda36bf211e3b4882016d8d47c3d', '610', '1', '2013-12-23 11:50:11', '', 'REGISTRO ZONA DE PESCAFFF .::. ISLA LOS LOBOS DE TIERRA');
INSERT INTO `transaccion` VALUES ('201312231151387fd6a2156bf211e3b4882016d8d47c3d', '610', '1', '2013-12-23 11:51:38', '', 'REGISTRO ZONA DE PESCAFFFSSSS .::. ISLA LOS LOBOS DE TIERRA');
INSERT INTO `transaccion` VALUES ('2013122311515187ba18bb6bf211e3b4882016d8d47c3d', '610', '1', '2013-12-23 11:51:51', '', 'REGISTRO ZONA DE PESCARETERT .::. LOS NUEVOQ');
INSERT INTO `transaccion` VALUES ('20131223120024b937577e6bf311e3b4882016d8d47c3d', '610', '1', '2013-12-23 12:00:24', '', 'REGISTRO ZONA DE PESCA00003 .::. ISLA LOS LOBOS DE TIERRA');
INSERT INTO `transaccion` VALUES ('2013122315461646d0d3e66c1311e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:46:16', '', 'Registro Embarcacion DSXK123 .::. EL SOL RADIANTE');
INSERT INTO `transaccion` VALUES ('201312231551380736ff856c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:51:38', '', 'Registro Embarcacion XCFSD .::. NUEVA EMBARCACION');
INSERT INTO `transaccion` VALUES ('2013122315534351c84d586c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:53:43', '', 'Registro Embarcacion XCFSDSD .::. NUEVA EMBARCACION');
INSERT INTO `transaccion` VALUES ('201312231554557c780e036c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:54:55', '', 'Registro Embarcacion HSDGH .::. EMBARCION POSEIDON');
INSERT INTO `transaccion` VALUES ('2013122315551487f2d5dd6c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:55:14', '', 'Registro Embarcacion HSDGHW .::. EMBARCION POSEIDON');
INSERT INTO `transaccion` VALUES ('20131223155558a1d212126c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:55:58', '', 'Registro Embarcacion HSDGHWS .::. EMBARCION POSEIDON');
INSERT INTO `transaccion` VALUES ('20131223155705ca2ed8486c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:57:05', '', 'Registro Embarcacion HSDGHWSS .::. EMBARCION POSEIDON');
INSERT INTO `transaccion` VALUES ('20131223155725d5cf00486c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:57:25', '', 'Registro Embarcacion SDSD .::. SDSDDDDDDDDDDDDDDDD');
INSERT INTO `transaccion` VALUES ('20131223155744e1386ef76c1411e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:57:44', '', 'Registro Embarcacion SDSDS .::. SDSDDDDDDDDDDDDDDDD');
INSERT INTO `transaccion` VALUES ('201312231558590dc7006f6c1511e3b4882016d8d47c3d', '610', '1', '2013-12-23 15:58:59', '', 'Registro Embarcacion SFSFFD .::. DDDDDDDDDDDDDD');
INSERT INTO `transaccion` VALUES ('2013122316013168356bfb6c1511e3b4882016d8d47c3d', '610', '1', '2013-12-23 16:01:31', '', 'Registro Embarcacion SDASAS .::. LOS MARES');
INSERT INTO `transaccion` VALUES ('20131228012915649bb0616f8911e3b4882016d8d47c3d', '36', '1', '2013-12-28 01:29:15', '', 'Ingreso al Sistema: Armando Enrique Pisfil Puemape');
INSERT INTO `transaccion` VALUES ('2013123022465636a5021371ce11e3b4882016d8d47c3d', '36', '1', '2013-12-30 22:46:56', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('2013123022465636a5ec4171ce11e3b4882016d8d47c3d', '36', '1', '2013-12-30 22:46:56', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('20131230230442b1fec47171d011e3b4882016d8d47c3d', '36', '1', '2013-12-30 23:04:42', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('20131230230442b1ff51e771d011e3b4882016d8d47c3d', '36', '1', '2013-12-30 23:04:42', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('20131230230457bae25a1b71d011e3b4882016d8d47c3d', '36', '1', '2013-12-30 23:04:57', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('201312310938303cc9d9a0722911e3b4882016d8d47c3d', '36', '1', '2013-12-31 09:38:30', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('201312311252124bef1241724411e3b4882016d8d47c3d', '36', '1', '2013-12-31 12:52:12', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('201312311252124bf4c762724411e3b4882016d8d47c3d', '36', '1', '2013-12-31 12:52:12', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('20131231130321da9b30b4724511e3b4882016d8d47c3d', '36', '1', '2013-12-31 13:03:21', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('20140101121125bf030814730711e38b972016d8d47c3d', '36', '1', '2014-01-01 12:11:25', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('201401011217168ff3deaa730811e38b972016d8d47c3d', '36', '1', '2014-01-01 12:17:16', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('201401011217429f4569c5730811e38b972016d8d47c3d', '36', '1', '2014-01-01 12:17:42', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('20140101214321a4b437a5735711e38b972016d8d47c3d', '36', '1', '2014-01-01 21:43:21', '', 'Ingreso al Sistema');
INSERT INTO `transaccion` VALUES ('201401020048408842a8e3737111e38b972016d8d47c3d', '36', '1', '2014-01-02 00:48:40', '', 'Ingreso al Sistema');

-- ----------------------------
-- Table structure for visitas
-- ----------------------------
DROP TABLE IF EXISTS `visitas`;
CREATE TABLE `visitas` (
  `id_visita` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `num` int(10) NOT NULL,
  `nombrehost` varchar(50) NOT NULL,
  PRIMARY KEY (`id_visita`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of visitas
-- ----------------------------

-- ----------------------------
-- Procedure structure for usp_Actualizar_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Actualizar_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Actualizar_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstCodigoNew int(11), nParDstClase int(11), cValor varchar(20))
BEGIN
	#Routine body goes here...
	UPDATE parparametro
	SET parparametro.cValor=cValor,
			parparametro.nParDstCodigo=nParDstCodigoNew	
	WHERE parparametro.nParSrcCodigo=nParSrcCodigo
	AND parparametro.nParSrcClase=nParSrcClase
	AND parparametro.nParDstCodigo=nParDstCodigo
	AND parparametro.nParDstClase=nParDstClase;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_Parametro`(nParClase int(11), nParCodigo int (11))
BEGIN
		SELECT parametro.nParCodigo,
				parametro.cParNombre,
				parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParTipo = 1000
		AND parametro.nParClase=nParClase
		AND parametro.nParCodigo = nParCodigo
		ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_ParCoodenadar
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_ParCoodenadar`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_ParCoodenadar`(nParCodigo INT ,nParClase INT)
BEGIN
	SELECT 
		parcoordenada.nParCodigo,
		parcoordenada.nParClase,
		parcoordenada.cParLatitud,
		parcoordenada.cParLonguitud,
		parcoordenada.cParAltitud,
		parcoordenada.cObservacion
	FROM parcoordenada
	WHERE parcoordenada.nParClase=nParClase	
	AND parcoordenada.nParCodigo=nParCodigo 
	AND parcoordenada.nEstado=1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11) , nParDstCodigo int(11) , nParDstClase int(11))
BEGIN
	#Routine body goes here...
			SELECT	parparametro.nParSrcCodigo,
							familia.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,
							subfamilia.cParDescripcion AS cParDstDescripcion,
							parparametro.cValor
			FROM parametro familia
			INNER JOIN parparametro 					ON parparametro.nParSrcCodigo=familia.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro subfamilia 	ON parparametro.nParDstCodigo=subfamilia.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE familia.nParTipo			= 1000
			AND subfamilia.nParTipo			= 1000
			AND parparametro.nParEstado = 1			
			AND ( (nParSrcCodigo = 0 ) OR (familia.nParCodigo	= nParSrcCodigo ) )
			AND ( (nParSrcClase = 0 ) OR (familia.nParClase = nParSrcClase) ) 
			AND ( (nParDstCodigo = 0 ) OR (subfamilia.nParCodigo = nParDstCodigo) )
			AND ( (nParDstClase = 0 ) OR (subfamilia.nParClase	= nParDstClase) ) 
			 
			;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_ParParametros_By_nParCodigo3
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_ParParametros_By_nParCodigo3`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_ParParametros_By_nParCodigo3`(nParClase1 int(11), nParClase2 int(11), nParClase3 int(11), nParCodigo3 int(11))
BEGIN
	#Routine body goes here...
			SELECT	grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,
							subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
							familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre
			FROM parametro AS familia
			INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
			INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
			INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
			INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo				
			WHERE familia.nParClase=nParClase1
			AND familia.nParTipo=1000
			AND fsf.nParSrcClase=nParClase1
			AND fsf.nParDstClase=nParClase2
			AND fsf.nParEstado=1
			AND subfamilia.nParClase=nParClase2
			AND subfamilia.nParTipo=1000
			AND sfg.nParSrcClase=nParClase2
			AND sfg.nParDstClase=nParClase3
			AND sfg.nParEstado=1
			AND grupo.nParClase=nParClase3
			AND grupo.nParTipo=1000
			AND grupo.nParCodigo = nParCodigo3;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_ParParametros_By_nParCodigo4
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_ParParametros_By_nParCodigo4`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_ParParametros_By_nParCodigo4`(nParClase1 int(11), nParClase2 int(11), nParClase3 int(11), nParClase4 int(11), nParCodigo4 int(11))
BEGIN
	#Routine body goes here...
			SELECT	modelo.nParCodigo AS nModCodigo, modelo.cParDescripcion AS cModNombre,
							grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,
							subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
							familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre
			FROM parametro AS familia
			INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
			INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
			INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
			INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo
			INNER JOIN parparametro AS gm					ON grupo.nParCodigo=gm.nParSrcCodigo
			INNER JOIN parametro		AS modelo 		ON gm.nParDstCodigo=modelo.nParCodigo	
			WHERE familia.nParClase=nParClase1
			AND familia.nParTipo=1000
			AND fsf.nParSrcClase=nParClase1
			AND fsf.nParDstClase=nParClase2
			AND fsf.nParEstado=1
			AND subfamilia.nParClase=nParClase2
			AND subfamilia.nParTipo=1000
			AND sfg.nParSrcClase=nParClase2
			AND sfg.nParDstClase=nParClase3
			AND sfg.nParEstado=1
			AND grupo.nParClase=nParClase3
			AND grupo.nParTipo=1000
			AND gm.nParSrcClase=nParClase3
			AND gm.nParDstClase=nParClase4
			AND gm.nParEstado=1
			AND modelo.nParClase=nParClase4
			AND modelo.nParTipo=1000
			AND modelo.nParCodigo=nParCodigo4;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_ParParametros_By_nParCodigo5
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_ParParametros_By_nParCodigo5`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_ParParametros_By_nParCodigo5`(nParClase1 int(11), nParClase2 int(11), nParClase3 int(11), nParClase4 int(11), nParClase5 int(11), nParCodigo5 int(11))
BEGIN
	#Routine body goes here...
			SELECT	producto.nParCodigo AS nProCodigo, producto.cParNombre AS cProCodigo, producto.cParDescripcion AS cProNombre,
							modelo.nParCodigo AS nModCodigo, modelo.cParDescripcion AS cModNombre,
							grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,
							subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
							familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre
			FROM parametro AS familia
			INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
			INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
			INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
			INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo
			INNER JOIN parparametro AS gm					ON grupo.nParCodigo=gm.nParSrcCodigo
			INNER JOIN parametro		AS modelo 		ON gm.nParDstCodigo=modelo.nParCodigo
			INNER JOIN parparametro AS mp					ON modelo.nParCodigo=mp.nParSrcCodigo
			INNER JOIN parametro		AS producto		ON mp.nParDstCodigo=producto.nParCodigo
			WHERE familia.nParClase=nParClase1 
			AND familia.nParTipo=1000
			AND fsf.nParSrcClase=nParClase1 
			AND fsf.nParDstClase=nParClase2 
			AND fsf.nParEstado=1
			AND subfamilia.nParClase=nParClase2 
			AND subfamilia.nParTipo=1000
			AND sfg.nParSrcClase=nParClase2 
			AND sfg.nParDstClase=nParClase3 
			AND sfg.nParEstado=1
			AND grupo.nParClase=nParClase3 
			AND grupo.nParTipo=1000
			AND gm.nParSrcClase=nParClase3 
			AND gm.nParDstClase=nParClase4 
			AND gm.nParEstado=1
			AND modelo.nParClase=nParClase4 
			AND modelo.nParTipo=1000
			AND mp.nParSrcClase=nParClase4 
			AND mp.nParDstClase=nParClase5 
			AND gm.nParEstado=1
			AND producto.nParClase=nParClase5 
			AND producto.nParTipo=1000
			AND producto.nParCodigo=nParCodigo5;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_ParParametro_By_nParDstCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_ParParametro_By_nParDstCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_ParParametro_By_nParDstCodigo`(nParSrcClase int(11), nParDstClase int(11), nParDstCodigo int(11))
BEGIN
	#Routine body goes here...
			SELECT	parparametro.nParSrcCodigo,
							familia.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,
							subfamilia.cParDescripcion AS cParDstDescripcion,
							parparametro.cValor
			FROM parametro familia
			INNER JOIN parparametro 					ON parparametro.nParSrcCodigo=familia.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro subfamilia 	ON parparametro.nParDstCodigo=subfamilia.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE familia.nParClase			= nParSrcClase
			AND subfamilia.nParClase		= nParDstClase
			AND subfamilia.nParCodigo		= nParDstCodigo
			AND familia.nParTipo				= 1000
			AND subfamilia.nParTipo			= 1000
			AND parparametro.nParEstado = 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_ParParametro_By_nParSrcCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_ParParametro_By_nParSrcCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_ParParametro_By_nParSrcCodigo`(nParSrcClase int(11), nParDstClase int(11), nParSrcCodigo int(11))
BEGIN
	#Routine body goes here...
			SELECT	parparametro.nParSrcCodigo,
							familia.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,
							subfamilia.cParDescripcion AS cParDstDescripcion,
							parparametro.cValor
			FROM parametro familia
			INNER JOIN parparametro 					ON parparametro.nParSrcCodigo=familia.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro subfamilia 	ON parparametro.nParDstCodigo=subfamilia.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE familia.nParClase			= nParSrcClase
			AND subfamilia.nParClase		= nParDstClase
			AND familia.nParCodigo			= nParSrcCodigo
			AND familia.nParTipo				= 1000
			AND subfamilia.nParTipo			= 1000
			AND parparametro.nParEstado = 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_PerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_PerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_PerMail`(cPerCodigo varchar(20), nPerRelTipo int(11))
BEGIN
	SELECT permail.cPerCodigo, permail.cPerMail
	FROM permail
	WHERE permail.nPerRelTipo=nPerRelTipo
	AND permail.cPerCodigo=cPerCodigo
	AND permail.nPerMailEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_Persona_By_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_Persona_By_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_Persona_By_cPerDocNumero`(nPerTipo int(11), nPerDocTipo int(11), cPerDocNumero varchar(20))
BEGIN
	#Routine body goes here...
	SELECT persona.cPerCodigo, persona.cPerNombre, persona.cPerApellidos,
				perdocumento.nPerDocTipo, perdocumento.cPerDocNumero
	FROM persona
	INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
	WHERE persona.nPerEstado=1
	AND perdocumento.nPerDocEstado=1
	AND	( (nPerTipo	=	0  ) 				OR 	(persona.nPerTipo = nPerTipo) )
	AND	( (nPerDocTipo	=	0  ) 		OR 	(perdocumento.nPerDocTipo = nPerDocTipo) )
	AND	( (cPerDocNumero	=	"-")	OR	(perdocumento.cPerDocNumero LIKE CONCAT(cPerDocNumero,"%")) );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_Persona_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_Persona_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_Persona_nPerRelTipo`(cPerNombres varchar(500), cPerDocNumero varchar(500), nPerRelTipo INT(11))
BEGIN
						SELECT 		
										persona.cPerCodigo, 
										persona.nPerTipo, 
										persona.cPerNombre, 
										persona.cPerApellidos,	
										perdocumento.nPerDocTipo, 
										perdocumento.cPerDocNumero,	
										perrelacion.nPerRelTipo, 
										perrelacion.cPerJuridica ,
										perdireccion.cPerDirDescripcion
						FROM persona 
						INNER JOIN perrelacion  ON persona.cPerCodigo = perrelacion.cPerCodigo
						INNER JOIN perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo
						INNER JOIN pernatural   ON persona.cPerCodigo = pernatural.cPerCodigo
						LEFT JOIN perdireccion ON persona.cPerCodigo = perdireccion.cPerCodigo
						WHERE persona.nPerTipo  = 1						
						AND persona.nPerEstado  <>0
						AND perrelacion.nPerRelEstado = 1						
						AND( (cPerNombres ='-') OR ( concat(persona.cPerApellidos,' ' , persona.cPerNombre) like concat(cPerNombres,'%') ) )		
						AND( (cPerDocNumero ='-') OR ( perdocumento.cPerDocNumero like concat(cPerDocNumero,'%')) )
						AND( (nPerRelTipo=0) 			OR ( perrelacion.nPerRelTipo=nPerRelTipo ) )
						ORDER BY concat(pernatural.cPerNatApePaterno,' ' , pernatural.cPerNatApeMaterno), persona.cPerNombre DESC;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Buscar_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Buscar_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Buscar_PerTelefono`(cPerCodigo varchar(20), nPerRelTipo int(11))
BEGIN
	SELECT 
		pertelefono.cPerCodigo,
		pertelefono.nPerTelTipo,
		pertelefono.cPerTelNumero,
		pertelefono.nPerRelTipo 
	FROM pertelefono
	WHERE pertelefono.nPerRelTipo=nPerRelTipo
	AND pertelefono.cPerCodigo=cPerCodigo
	AND pertelefono.nPerTelEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_Parametro`(nParCodigo int(11), nParClase int(11))
BEGIN
  UPDATE parametro SET
				parametro.nParTipo=0
	WHERE parametro.nParCodigo=nParCodigo
		AND parametro.nParClase=nParClase;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_ParCoordenada
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_ParCoordenada`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_ParCoordenada`(nParCodigo INT, nParClase INT, nEstado INT)
BEGIN
		UPDATE parcoordenada SET  
				parcoordenada.nEstado=nEstado 
		WHERE		 
		  parcoordenada.nParCodigo = nParCodigo 
		 AND	parcoordenada.nParClase = nParClase;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_ParDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_ParDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_ParDireccion`(nParCodigo int , nParClase int)
BEGIN
	UPDATE pardireccion SET
		pardireccion.nParDirEstado=0
	WHERE pardireccion.nParCodigo =nParCodigo AND pardireccion.nParClase=nParClase ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_ParParametro_By_nParDstCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_ParParametro_By_nParDstCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_ParParametro_By_nParDstCodigo`(nParSrcClase int(11), nParDstClase int(11), nParDstCodigo int(11))
BEGIN
	UPDATE parparametro
	SET parparametro.nParEstado=0
	WHERE parparametro.nParSrcClase		=	nParSrcClase
	AND parparametro.nParDstCodigo		=	nParDstCodigo	 
	AND parparametro.nParDstClase			=	nParDstClase;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_ParParametro_By_nParSrcCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_ParParametro_By_nParSrcCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_ParParametro_By_nParSrcCodigo`(nParSrcClase int(11), nParDstClase int(11), nParSrcCodigo int(11))
BEGIN
	UPDATE parparametro
	SET parparametro.nParEstado=0
	WHERE parparametro.nParSrcClase		=	nParSrcClase
	AND parparametro.nParSrcCodigo		=	nParSrcCodigo	 
	AND parparametro.nParDstClase			=	nParDstClase;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_PerDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_PerDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_PerDireccion`(cPerCodigo varchar(20), nPerRelTipo int(11))
BEGIN
	#Routine body goes here...
	UPDATE perdireccion
	SET perdireccion.nPerDirEstado=0
	WHERE perdireccion.cPerCodigo=cPerCodigo
	AND perdireccion.nPerRelTipo=nPerRelTipo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_PerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_PerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_PerMail`(cPerCodigo varchar(20), nPerRelTipo int(11))
BEGIN
	#Routine body goes here...
	UPDATE permail
	SET permail.nPerMailEstado = 0
	WHERE permail.cPerCodigo = cPerCodigo
	AND permail.nPerRelTipo = nPerRelTipo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_PerRelacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_PerRelacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_PerRelacion`(cPerCodigo varchar(20), cPerJuridica varchar(20), nPerRelTipo int(11))
BEGIN

	UPDATE perrelacion
	SET perrelacion.nPerRelEstado=0
	WHERE perrelacion.cPerCodigo=cPerCodigo
	AND perrelacion.cPerJuridica=cPerJuridica
	AND perrelacion.nPerRelTipo=nPerRelTipo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_Persona`(cPerCodigo varchar(100))
BEGIN
	UPDATE persona
	SET persona.nPerEstado=0
	WHERE persona.cPerCodigo=cPerCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Elm_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Elm_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Elm_PerTelefono`(cPerCodigo varchar(20), nPerRelTipo int(11))
BEGIN
	#Routine body goes here...
	UPDATE pertelefono
	SET pertelefono.nPerTelEstado = 0
	WHERE pertelefono.cPerCodigo = cPerCodigo
	AND pertelefono.nPerRelTipo = nPerRelTipo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Filtrar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Filtrar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Filtrar_Parametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cParNombre varchar(500), cParDescripcion varchar(500), nParClase int(11))
BEGIN

	IF  (nPagRegistro = 1 ) THEN
		SET @sentencia = CONCAT('SELECT parametro.nParCodigo,
							parametro.cParNombre,
							IFNULL(parametro.cParDescripcion,"") cParDescripcion
					FROM parametro
					WHERE parametro.nParClase="',nParClase,'"
					AND parametro.nParTipo=1000
					AND( ( "',cParNombre ,'" 				= "-" )	OR ( parametro.cParNombre like "',cParNombre ,'%") )
					AND( ( "',cParDescripcion ,'" 	= "-" ) OR ( parametro.cParDescripcion like "',cParDescripcion ,'%") )
					ORDER BY parametro.cParDescripcion ASC
					LIMIT  ',nOriReg,',',nCanReg,' ; ');
					prepare consulta FROM @sentencia;
					execute consulta;
	ELSE
		SELECT parametro.nParCodigo,
				parametro.cParNombre,
				IFNULL(parametro.cParDescripcion,"") cParDescripcion
		FROM parametro
		WHERE parametro.nParClase=nParClase
		AND parametro.nParTipo=1000
		AND ( ( cParNombre 			= "-" ) OR ( parametro.cParNombre 			LIKE CONCAT(cParNombre,'%') ) )
		AND	( ( cParDescripcion = "-" ) OR ( parametro.cParDescripcion 	LIKE CONCAT(cParDescripcion,'%') ) )
		ORDER BY parametro.cParJerarquia ASC ;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_Departamento_By_IdDepartamento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_Departamento_By_IdDepartamento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_Departamento_By_IdDepartamento`(IdDepartamento varchar(20))
BEGIN
		SELECT departamento.IdDepartamento, departamento.Nombre,departamento.IdPais 
			FROM departamento WHERE departamento.IdDepartamento ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_Distrito_By_IdDistrito
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_Distrito_By_IdDistrito`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_Distrito_By_IdDistrito`(IdDistrito varchar(20))
BEGIN
				SELECT distrito.IdDistrito, distrito.Nombre,distrito.IdProvincia
				FROM distrito WHERE distrito.IdDistrito=IdDistrito ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_ParParExt
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_ParParExt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_ParParExt`(nIntSrcClase int(11), nIntSrcCodigo int(11), nIntDstClase int(11), nIntDstCodigo int(11), nObjTipo int(11), nObjCodigo int(11))
BEGIN

			SELECT 	src.nParCodigo AS nSrcCodigo, src.cParDescripcion AS cSrcDescripcion,
							dst.nParCodigo AS nDstCodigo, dst.cParDescripcion AS cDstDescripcion,
							obj.nParCodigo AS nObjCodigo, obj.cParDescripcion AS cObjDescripcion,
							parparext.cValor
			FROM parparext 
			INNER JOIN parametro AS src ON parparext.nIntSrcCodigo=src.nParCodigo AND src.nParClase=nIntSrcClase
			INNER JOIN parametro AS dst ON parparext.nIntDstCodigo=dst.nParCodigo AND dst.nParClase=nIntDstClase
			INNER JOIN parametro AS obj ON parparext.nObjCodigo=obj.nParCodigo		AND obj.nParClase=nObjTipo
			WHERE parparext.nIntSrcClase=nIntSrcClase
			AND		parparext.nIntDstClase=nIntDstClase
			AND		parparext.nObjTipo=nObjTipo
			AND 	parparext.nIntSrcCodigo=nIntSrcCodigo
			AND		parparext.nIntDstCodigo=nIntDstCodigo
			AND		parparext.nObjCodigo=nObjCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_PerDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_PerDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_PerDireccion`(cPerCodigo varchar(20), nPerRelTipo int(11), nPerDirTipo int(11), nUbiCodigo int(11))
BEGIN
	SELECT perdireccion.cPerCodigo, perdireccion.cPerDirDescripcion
	FROM perdireccion
	WHERE perdireccion.nPerRelTipo=nPerRelTipo
	AND perdireccion.cPerCodigo=cPerCodigo
	AND	( (nPerDirTipo	=	0  ) 		OR 	(perdireccion.nPerDirTipo = nPerDirTipo) )
	AND	( (nUbiCodigo	=	0  ) 		OR 	(perdireccion.nUbiCodigo = nUbiCodigo) )
	AND perdireccion.nPerDirEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_PerDocumento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_PerDocumento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_PerDocumento`(cPerCodigo varchar(20), nPerDocTipo int(4), nPerDocCategoria int(4))
BEGIN
	SELECT perdocumento.cPerCodigo, perdocumento.nPerDocTipo, perdocumento.cPerDocNumero
	FROM perdocumento
	WHERE perdocumento.nPerDocEstado=1
	AND perdocumento.cPerCodigo=cPerCodigo
	AND	( (nPerDocTipo	=	0) 			OR 	(perdocumento.nPerDocTipo 			= nPerDocTipo) )
	AND	( (nPerDocCategoria	=	0) 	OR 	(perdocumento.nPerDocCategoria 	= nPerDocCategoria) );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_PerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_PerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_PerMail`(cPerCodigo varchar(20), nPerRelTipo int(11), nPerMailTipo int(11))
BEGIN
	SELECT permail.cPerCodigo, permail.cPerMail
	FROM permail
	WHERE permail.nPerRelTipo=nPerRelTipo
	AND permail.cPerCodigo=cPerCodigo
	AND	( (nPerMailTipo	=	0  ) 		OR 	(permail.nPerMailTipo = nPerMailTipo) )
	AND permail.nPerMailEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_PerTelefono`(cPerCodigo varchar(20), nPerRelTipo int(11), nPerTelTipo int(11))
BEGIN
	SELECT pertelefono.cPerCodigo, pertelefono.cPerTelNumero
	FROM pertelefono
	WHERE pertelefono.nPerRelTipo=nPerRelTipo
	AND pertelefono.cPerCodigo=cPerCodigo
	AND	( (nPerTelTipo	=	0  ) 		OR 	(pertelefono.nPerTelTipo = nPerTelTipo) )
	AND pertelefono.nPerTelEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Buscar_Provincia_By_IdProvincia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Buscar_Provincia_By_IdProvincia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Buscar_Provincia_By_IdProvincia`(IdProvincia varchar(20))
BEGIN
			SELECT provincia.IdProvincia,provincia.Nombre, provincia.IdDepartamento
				FROM provincia WHERE provincia.IdProvincia=IdProvincia;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Departamentos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Departamentos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Departamentos`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cDepartamento varchar(200))
BEGIN
	IF  (nPagRegistro = 1 ) THEN
			SET @sentencia = CONCAT('SELECT departamento.IdDepartamento, departamento.Nombre,departamento.IdPais 
										FROM departamento
						WHERE( ("',cDepartamento   ,'" ="-"  ) OR (departamento.Nombre like "',cDepartamento  ,'%") )
						ORDER BY departamento.Nombre ASC
						LIMIT  ',nOriReg,',',nCanReg);
						prepare consulta FROM @sentencia;
						execute consulta;
		ELSE
			SELECT departamento.IdDepartamento, departamento.Nombre,departamento.IdPais 
			FROM departamento  ORDER BY departamento.Nombre ;
	END IF;


		
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Departamentos_Pais
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Departamentos_Pais`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Departamentos_Pais`(IdPais varchar(20))
BEGIN
	SELECT departamento.IdDepartamento , departamento.Nombre , departamento.IdPais
	FROM departamento
	WHERE  departamento.IdPais = IdPais AND departamento.nDepEstado = 1 
 ORDER BY departamento.Nombre ASC ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Distritos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Distritos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Distritos`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cDistrito varchar(200))
BEGIN
IF  (nPagRegistro = 1 ) THEN
		SET @sentencia = CONCAT('SELECT distrito.IdDistrito, distrito.Nombre,distrito.IdProvincia
				FROM distrito
					WHERE( ("',cDistrito   ,'" ="-"  ) OR (distrito.Nombre like "',cDistrito  ,'%") )
					ORDER BY distrito.Nombre ASC
					LIMIT  ',nOriReg,',',nCanReg);
					prepare consulta FROM @sentencia;
					execute consulta;
	ELSE
				SELECT distrito.IdDistrito, distrito.Nombre,distrito.IdProvincia
				FROM distrito ORDER BY distrito.Nombre ASC ;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Distritos_Provincia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Distritos_Provincia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Distritos_Provincia`(IdProvincia char(8))
BEGIN
			SELECT distrito.IdDistrito, distrito.Nombre,distrito.IdProvincia , distrito.nDisEstado
				FROM distrito WHERE distrito.IdProvincia = IdProvincia AND distrito.nDisEstado = 1 ORDER BY distrito.Nombre ASC ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Filtrar_DocParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Filtrar_DocParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Filtrar_DocParametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), nParSrcClase int(11), nParDstClase int(11), nDocTipo int(11), nPerRelacion int(11), nDocPerTipo int(11), cSrcDescripcion varchar(100), cDstDescripcion varchar(100), cPerNombres varchar(100))
BEGIN

	IF(nPagRegistro = 1) THEN

		SET @sentencia=CONCAT('
														SELECT 	documentos.cDocCodigo, documentos.dDocFecha,
																		src.nParCodigo AS nSrcCodigo, src.cParNombre AS cSrcNombre, src.cParDescripcion AS cSrcDescripcion,
																		dst.nParCodigo AS nDstCodigo, dst.cParNombre AS cDstNombre, dst.cParDescripcion AS cDstDescripcion,
																		persona.cPerCodigo, CONCAT(persona.cPerNombre," ",persona.cPerApellidos) AS cPerNombres
														FROM parametro AS src
														INNER JOIN parparametro ON src.nParCodigo=parparametro.nParSrcCodigo
														INNER JOIN parametro AS dst ON parparametro.nParDstCodigo=dst.nParCodigo
														INNER JOIN docparametro ON dst.nParCodigo=docparametro.nParCodigo
														INNER JOIN documentos ON docparametro.cDocCodigo=documentos.cDocCodigo
														INNER JOIN docpersona ON documentos.cDocCodigo=docpersona.cDocCodigo
														INNER JOIN persona ON docpersona.cPerCodigo=persona.cPerCodigo
														WHERE src.nParTipo=1000
														AND dst.nParTipo=1000
														AND src.nParClase=nParSrcClase
														AND dst.nParClase=nParDstClase
														AND parparametro.nParSrcClase	=	nParSrcClase
														AND parparametro.nParDstClase	=	nParDstClase
														AND docparametro.nParClase		=	nParDstClase															
														AND ( (',nDocTipo,' 		= 0)	OR (docpersona.nDocTipo 		= ',nDocTipo,') )
														AND ( (',nPerRelacion,' = 0)	OR (docpersona.nPerRelacion = ',nPerRelacion,') )
														AND ( (',nDocPerTipo,' 	= 0)	OR (docpersona.nDocPerTipo 	= ',nDocPerTipo,') )
														AND ( ("',cSrcDescripcion,'"	= "-")	OR (src.cParDescripcion 																	LIKE "',cSrcDescripcion,'%") )
														AND ( ("',cDstDescripcion,'"	= "-")	OR (dst.cParDescripcion 																	LIKE "',cDstDescripcion,'%") )
														AND ( ("',cPerNombres,'"			= "-")	OR (CONCAT(persona.cPerNombre," ",persona.cPerApellidos)	LIKE "',cPerNombres,'%") )
														LIMIT ',nOriReg ,',',nCanReg,';');
			PREPARE consulta FROM @sentencia;
			EXECUTE consulta;

	ELSE
			SELECT 	documentos.cDocCodigo, documentos.dDocFecha,
							src.nParCodigo AS nSrcCodigo, src.cParNombre AS cSrcNombre, src.cParDescripcion AS cSrcDescripcion,
							dst.nParCodigo AS nDstCodigo, dst.cParNombre AS cDstNombre, dst.cParDescripcion AS cDstDescripcion,
							persona.cPerCodigo, CONCAT(persona.cPerNombre,' ',persona.cPerApellidos) AS cPerNombres
			FROM parametro AS src
			INNER JOIN parparametro ON src.nParCodigo=parparametro.nParSrcCodigo
			INNER JOIN parametro AS dst ON parparametro.nParDstCodigo=dst.nParCodigo
			INNER JOIN docparametro ON dst.nParCodigo=docparametro.nParCodigo
			INNER JOIN documentos ON docparametro.cDocCodigo=documentos.cDocCodigo
			INNER JOIN docpersona ON documentos.cDocCodigo=docpersona.cDocCodigo
			INNER JOIN persona ON docpersona.cPerCodigo=persona.cPerCodigo
			WHERE src.nParTipo=1000
			AND dst.nParTipo=1000
			AND src.nParClase=nParSrcClase
			AND dst.nParClase=nParDstClase
			AND parparametro.nParSrcClase	=	nParSrcClase
			AND parparametro.nParDstClase	=	nParDstClase
			AND docparametro.nParClase		=	nParDstClase
			AND ( (nDocTipo 		= 0)	OR (docpersona.nDocTipo 		= nDocTipo) )
			AND ( (nPerRelacion = 0)	OR (docpersona.nPerRelacion = nPerRelacion) )
			AND ( (nDocPerTipo 	= 0)	OR (docpersona.nDocPerTipo 	= nDocPerTipo) )
			AND ( (cSrcDescripcion 	= '-')	OR (src.cParDescripcion 																	LIKE CONCAT(cSrcDescripcion,'%')) )
			AND ( (cDstDescripcion 	= '-')	OR (dst.cParDescripcion 																	LIKE CONCAT(cDstDescripcion, '%')) )
			AND ( (cPerNombres  		= '-')	OR (CONCAT(persona.cPerNombre,' ',persona.cPerApellidos) 	LIKE concat(cPerNombres, '%')) );
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Grupo_Permiso
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Grupo_Permiso`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Grupo_Permiso`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cParDescripcionGrupo varchar(500), cParDescripcionPermiso varchar(500), nParClase int(11))
BEGIN

	IF  (nPagRegistro = 1 ) THEN
		SET @sentencia = CONCAT('SELECT grupo.nParCodigo,
							grupo.cParDescripcion, 
									CASE permiso.nParClase 
										WHEN 5000 THEN "MENU" 
										WHEN 5001 THEN "BOTONERA"
									END AS permiso, 
								permiso.nParCodigo ,
								permiso.cParDescripcion as cParDescripcionPermiso, 
								LENGTH(permiso.cParJerarquia) AS cParJerarquia
					from parametro AS grupo
					INNER JOIN parparametro ON grupo.nParCodigo=parparametro.nParSrcCodigo
					INNER JOIN parametro AS permiso ON parparametro.nParDstCodigo=permiso.nParCodigo
					WHERE grupo.nParClase=',nParClase ,'
					AND parparametro.nParSrcClase=',nParClase ,'
					AND permiso.nParClase IN (5000,5001)
					AND parparametro.nParDstClase IN (5000,5001)
					AND ( ( "', cParDescripcionGrupo,'" ="-") OR (grupo.cParDescripcion LIKE "',cParDescripcionGrupo,'%") )
					AND ( ("',cParDescripcionPermiso,'" ="-" ) OR (permiso.cParDescripcion LIKE "',cParDescripcionPermiso,'%") )
					ORDER BY grupo.nParCodigo , LENGTH(permiso.cParJerarquia)
							LIMIT  ',nOriReg,',',nCanReg);

					prepare consulta FROM @sentencia;
					execute consulta;

	ELSE

			SELECT grupo.nParCodigo,
					grupo.cParDescripcion, 
							CASE permiso.nParClase 
								WHEN 5000 THEN 'MENU' 
								WHEN 5001 THEN 'BOTONERA' 
							END AS permiso, 
						permiso.nParCodigo ,
						permiso.cParDescripcion as cParDescripcionPermiso, 
						LENGTH(permiso.cParJerarquia) AS cParJerarquia
			from parametro AS grupo
			INNER JOIN parparametro ON grupo.nParCodigo=parparametro.nParSrcCodigo
			INNER JOIN parametro AS permiso ON parparametro.nParDstCodigo=permiso.nParCodigo
			WHERE grupo.nParClase=nParClase
			AND parparametro.nParSrcClase=nParClase

			-- AND permiso.nParClase IN (5000,5001)
		  -- AND parparametro.nParDstClase IN (5000,5001)

			AND ( (cParDescripcionGrupo ='-') OR (grupo.cParDescripcion LIKE CONCAT(cParDescripcionGrupo,'%')) )
			AND ( (cParDescripcionPermiso ='-') OR (permiso.cParDescripcion LIKE CONCAT(cParDescripcionPermiso,'%')) )
			ORDER BY grupo.nParCodigo , LENGTH(permiso.cParJerarquia) ; 

	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Medida_By_nParProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Medida_By_nParProducto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Medida_By_nParProducto`(nParProducto int(11))
BEGIN

	SELECT	parparametro.nParSrcCodigo,
					parametro.cParDescripcion,
					parparametro.cValor
	FROM parparametro
	INNER JOIN parametro ON parametro.nParCodigo=parparametro.nParSrcCodigo 	
	WHERE parparametro.nParSrcClase=1011 AND
	parparametro.nParDstClase=1010 AND
	parametro.nParClase=1011 AND
	parametro.nParTipo=1000 AND
	parparametro.nParEstado=1 AND
	parparametro.nParDstCodigo=nParProducto;
	

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Menu
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Menu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Menu`()
BEGIN

	SELECT 	parametro.cParJerarquia,
					parametro.cParNombre,
					parametro.cParDescripcion,
					LENGTH(parametro.cParJerarquia) AS jerarquia,
					LEFT(parametro.cParJerarquia,1) AS menu
	FROM parametro
	WHERE parametro.nParClase=5000
	AND LENGTH(parametro.cParJerarquia)>2
	ORDER BY parametro.cParJerarquia;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Paises
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Paises`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Paises`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cPais varchar(200))
BEGIN
		IF  (nPagRegistro = 1 ) THEN
				SET @sentencia = CONCAT('SELECT pais.IdPais , pais.Nombre 
						FROM pais
							WHERE( ("',cPais     ,'" ="-"  ) OR (pais.Nombre like "',cPais    ,'%") )
								WHERE pais.nPaiEstado = 1
							ORDER BY pais.Nombre ASC
							LIMIT  ',nOriReg,',',nCanReg);
							prepare consulta FROM @sentencia;
							execute consulta;
			ELSE
						SELECT pais.IdPais , pais.Nombre 				
						FROM pais WHERE pais.nPaiEstado = 1 ORDER BY pais.Nombre ASC ;
			END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cParDescripcion varchar(500), nParClase int(11))
BEGIN

	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('SELECT parametro.nParCodigo,
							parametro.cParNombre,
							IFNULL(parametro.cParDescripcion,"") cParDescripcion
					FROM parametro
					WHERE parametro.nParClase="',nParClase,'"
					AND parametro.nParTipo=1000
					AND( ("',cParDescripcion ,'" ="-"  ) OR ( parametro.cParDescripcion like "',cParDescripcion ,'%") )
					ORDER BY parametro.cParJerarquia ASC
					LIMIT  ',nOriReg,',',nCanReg);
					prepare consulta FROM @sentencia;
					execute consulta;

	ELSE
		SELECT parametro.nParCodigo,
					parametro.cParNombre,
					IFNULL(parametro.cParDescripcion,"") cParDescripcion
		FROM parametro
		WHERE parametro.nParClase=nParClase
		AND parametro.nParTipo=1000
		AND( (cParDescripcion ='-' ) OR (parametro.cParDescripcion like concat(cParDescripcion ,'%')) )
		ORDER BY parametro.cParJerarquia ASC;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_By_cParDescripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_By_cParDescripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_By_cParDescripcion`(cParDescripcion varchar(100), nParClase Int(4))
BEGIN

	SELECT parametro.nParCodigo,
		parametro.cParDescripcion,
		parametro.cParNombre
	FROM parametro
	WHERE parametro.cParDescripcion = cParDescripcion
	AND parametro.nParClase		 			= nParClase
	AND parametro.nParTipo		 			= 1000;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_By_cParNombre
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_By_cParNombre`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_By_cParNombre`(nParClase int(11), cParNombre varchar(100))
BEGIN
		SELECT parametro.nParCodigo, 
		parametro.cParNombre, 
		parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParTipo	= 1000
		AND parametro.nParClase	 = nParClase
		AND ( (cParNombre ='-' ) OR (parametro.cParNombre like concat(cParNombre ,'%')) );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_By_nParClase
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_By_nParClase`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_By_nParClase`(nParClase Int(4))
BEGIN
	SELECT parametro.nParCodigo,
		parametro.nParClase,
		parametro.cParJerarquia,
		parametro.cParNombre,
		parametro.cParDescripcion,
		parametro.nParTipo,
		(length(parametro.cParJerarquia)) as CanJerarquia
	From parametro
	WHERE parametro.nParClase = nParClase
	AND parametro.nParTipo <> 0
	AND parametro.nParTipo <> 1001
	AND parametro.nParTipo <> 1002
	ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_by_nParCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_by_nParCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_by_nParCodigo`(nParCodigo int (11))
BEGIN
		SELECT parametro.nParCodigo,
				parametro.cParNombre,
				parametro.cParDescripcion
		FROM parametro
		WHERE nParClase=1007
		AND nParTipo=1000
		AND parametro.nParCodigo= nParCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_by_nParCodigo_nParClase
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_by_nParCodigo_nParClase`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_by_nParCodigo_nParClase`(nParCodigo int (11), nParClase int(11))
BEGIN
		SELECT parametro.nParCodigo, 
				parametro.cParNombre, 
				parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParTipo = 1000
		AND parametro.nParClase=nParClase
		AND ((nParCodigo='-') OR (parametro.nParCodigo = nParCodigo))
		ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_By_Todos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_By_Todos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_By_Todos`(nParCodigo int(4), nParClase Int(4), cParJerarquia nVarChar(100), cParNombre nVarChar(200), cParDescripcion nVarChar(500), nParTipo Int(4))
BEGIN

	SELECT parametro.nParCodigo,
		parametro.nParClase,
		parametro.cParJerarquia,
		parametro.cParNombre,
		parametro.cParDescripcion,
		parametro.nParTipo,
		(length(parametro.cParJerarquia)) as CanJerarquia
	From parametro
	WHERE (( nParCodigo = 0) OR (parametro.nParCodigo = nParCodigo ))
	AND (( nParClase = 0) OR (parametro.nParClase = nParClase ))
	AND (( cParJerarquia = '-' ) OR (parametro.cParJerarquia = cParJerarquia ))
	AND (( cParNombre = '-' ) OR (parametro.cParNombre = cParNombre ))
	AND (( cParDescripcion = '-' ) OR (parametro.cParDescripcion = cParDescripcion ))
	AND (( nParTipo = 0) OR (parametro.nParTipo = nParTipo ))
	ORDER BY parametro.cParJerarquia;

/*
	SET @sentencia = CONCAT('
					SELECT parametro.nParCodigo,
							parametro.nParClase,
							parametro.cParJerarquia,
							parametro.cParNombre,
							parametro.cParDescripcion,
							parametro.nParTipo,
							(length(parametro.cParJerarquia)) as CanJerarquia
					 From parametro
						WHERE (( ',nParCodigo,' = 0) OR (parametro.nParCodigo = ',nParCodigo ,' ))
							AND (( ',nParClase ,' = 0) OR (parametro.nParClase = ', nParClase,' ))	
							AND (( "',cParNombre,'" = "-"  ) OR (parametro.cParNombre = "', cParNombre,'" ))
							AND (("', cParDescripcion,'" = "-"  ) OR (parametro.cParDescripcion ="', cParDescripcion ,'" ))
							AND (( ',nParTipo,' = 0) OR (parametro.nParTipo = ', nParTipo ,' ))
							ORDER BY parametro.',nOrderBy,'   ; '
					);
				PREPARE consulta FROM @sentencia;
				EXECUTE consulta;
				DEALLOCATE PREPARE consulta;
*/
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_Padre_nParClase
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_Padre_nParClase`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_Padre_nParClase`(nParClase INT(4))
BEGIN
		SELECT parametro.cParJerarquia , 
			parametro.cParNombre ,
			parametro.cParDescripcion FROM parametro
		WHERE parametro.nParClase =  nParClase
		AND parametro.nParTipo = 0 
		AND parametro.nParCodigo = 0  ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Parametro_Transaccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Parametro_Transaccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Parametro_Transaccion`(nParCodigo Int(4))
BEGIN
SELECT
		parametro.nParCodigo,
		parametro.nParClase,
		parametro.cParJerarquia,
		parametro.cParNombre,
		parametro.cParDescripcion,
		parametro.nParTipo,
		(length(parametro.cParJerarquia)) as CanJerarquia
From parametro
WHERE
parametro.nParClase =  1100 AND
parametro.nParCodigo <>  0 AND
parametro.nParCodigo =  nParCodigo
ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_ParDireccion_By_nParCodigo_nParClase
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_ParDireccion_By_nParCodigo_nParClase`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_ParDireccion_By_nParCodigo_nParClase`(nParCodigo int(1), nParClase int(11))
BEGIN
	SELECT * FROM pardireccion 
WHERE pardireccion.nParCodigo=nParCodigo AND pardireccion.nParClase = nParClase ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11))
BEGIN
	SELECT	parparametro.nParSrcCodigo,
					parparametro.nParSrcClase,
					parparametro.nParDstCodigo,
					parparametro.nParDstClase,
					parparametro.cValor,
					src.cParDescripcion AS cParSrcDescripcion,
					dst.cParDescripcion AS cParDstDescripcion
	FROM		parparametro
	INNER JOIN	parametro AS src ON parparametro.nParSrcCodigo=src.nParCodigo AND src.nParClase=1011
	INNER JOIN parametro AS dst ON parparametro.nParDstCodigo=dst.nParCodigo AND dst.nParClase=1011
	WHERE		((nParSrcCodigo='-') OR (parparametro.nParSrcCodigo=nParSrcCodigo))
	AND			parparametro.nParSrcClase=nParSrcClase
	AND			((nParDstCodigo='-') OR (parparametro.nParDstCodigo=nParDstCodigo))
	AND			parparametro.nParDstClase=nParDstClase
	AND			parparametro.nParEstado=1
	ORDER BY		parparametro.cValor DESC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerCuenta_By_cPerCodigo_nPerCueTipo_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerCuenta_By_cPerCodigo_nPerCueTipo_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerCuenta_By_cPerCodigo_nPerCueTipo_nPerRelTipo`(cPerCodigo varchar(20), nPerCueTipo int(11) , nPerRelTipo int(11))
BEGIN
	/*SELECT	parparametro.nParDstCodigo,
					parparametro.cValor
	FROM perrelacion
	INNER JOIN parparametro ON perrelacion.cPerCodigo=parparametro.nParSrcCodigo
	AND parparametro.nParSrcClase = nPerRelTipo
	AND parparametro.nParDstClase = 1013
	AND parparametro.nParEstado = 1
	AND perrelacion.nPerRelTipo = nPerRelTipo
	AND perrelacion.cPerJuridica = 6
	AND perrelacion.nPerRelEstado = 1
	AND parparametro.nParSrcCodigo = cPerCodigo 
	AND parparametro.nParDstCodigo = nPerCueTipo ;*/
	SELECT percuenta.nPerCtaTipo,
				 percuenta.cNroCuenta,
				 cuenta.cParDescripcion
	FROM percuenta
	INNER JOIN parametro cuenta ON percuenta.nPerCtaTipo=cuenta.nParCodigo AND cuenta.nParClase=1013
	WHERE percuenta.cPerCodigo=cPerCodigo
	AND		( (nPerCueTipo = 0) 	 OR ( percuenta.nPerCtaTipo like concat(nPerCueTipo,'%')) )
	AND percuenta.nPerCtaEstado= nPerRelTipo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerJuridica
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerJuridica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerJuridica`()
BEGIN
	SELECT 	persona.cPerCodigo,
			persona.cPerNombre,
			IFNULL(perdocumento.cPerDocNumero,"-") cPerDocNumero
	FROM	persona
	LEFT JOIN perdocumento 	ON persona.cPerCodigo = perdocumento.cPerCodigo
	WHERE   persona.nPerTipo           			= 2
    		AND persona.nPerEstado                      <> 0
		AND persona.cPerNombre LIKE  CONCAT(cPerNombre, '%');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerJuridica_By_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerJuridica_By_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerJuridica_By_cPerDocNumero`(cPerDocNumero varchar(250))
BEGIN
	SELECT persona.cPerNombre, 
			perdocumento.cPerDocNumero, 
			parametro.cParDescripcion
	FROM perdocumento
	INNER JOIN persona 		ON persona.cPerCodigo = perdocumento.cPerCodigo
	INNER JOIN parametro 	ON perdocumento.nPerDocTipo = parametro.nParCodigo AND parametro.nParClase = 1001
	WHERE perdocumento.cPerDocNumero = cPerDocNumero
	AND perdocumento.nPerDocTipo  	 = 7
	AND persona.nPerEstado					 = 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Perjuridica_By_LikecPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Perjuridica_By_LikecPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Perjuridica_By_LikecPerDocNumero`(cPerDocnumero varchar(100))
BEGIN

	SELECT persona.cPerCodigo,
		persona.cPerNombre,  
		perdocumento.cPerDocNumero,
		RIGHT(persona.cPerCodigo,5)
	FROM perdocumento
	INNER JOIN persona 		ON persona.cPerCodigo = perdocumento.cPerCodigo
	INNER JOIN parametro 	ON perdocumento.nPerDocTipo = parametro.nParCodigo AND parametro.nParClase = 1001
	WHERE perdocumento.nPerDocTipo  	= 7
	AND persona.nPerEstado						= 1
	AND persona.nPerTipo							= 2
	AND ((perdocumento.cPerDocNumero LIKE CONCAT(cPerDocnumero,'%'))OR persona.cPerNombre LIKE CONCAT(cPerDocnumero,'%'))
	limit 0,6;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerJuridica_By_Nombres
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerJuridica_By_Nombres`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerJuridica_By_Nombres`(cPerNombre varchar(250))
BEGIN
	SELECT 	persona.cPerCodigo,
			persona.cPerNombre,
			IFNULL(perdocumento.cPerDocNumero,"-") cPerDocNumero,
			RIGHT(persona.cPerCodigo,5)
	FROM	persona
	LEFT JOIN perdocumento 	ON persona.cPerCodigo = perdocumento.cPerCodigo
	WHERE persona.nPerTipo 	= 2
  AND persona.nPerEstado  <> 0
	AND persona.cPerNombre LIKE  CONCAT(cPerNombre, '%');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerJuridica_By_nPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerJuridica_By_nPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerJuridica_By_nPerCodigo`(cPerCodigo  varchar(20) , nPerJurRubro int(4))
BEGIN

	SELECT 
			persona.cPerCodigo, 
			persona.cPerNombre, 
			persona.cPerApellidos , 
			perdocumento.cPerDocNumero,
			perjuridica.cPerJurDescripcion
	FROM persona 
	INNER JOIN perjuridica ON persona.cPerCodigo=perjuridica.cPerCodigo
	INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
	AND persona.nPerEstado=1
	AND perdocumento.nPerDocEstado = 1 
	AND persona.nPerTipo = 2 -- empresa 
	AND perdocumento.nPerDocTipo = 2 -- ruc 
	AND ((nPerJurRubro = 0 ) OR (perjuridica.nPerJurRubro  = nPerJurRubro)) -- nPerJurRubro = 11
	AND ( (cPerCodigo = 0 ) OR (perjuridica.cPerCodigo	= cPerCodigo ) )
; 

/*
select per.cPerCodigo, 
per.cPerNombre, 
perdoc.cPerDocNumero, 
perdir.cPerDirDescripcion, 
percon.cPerCodigo AS CodContacto,
CONCAT(percon.cPerNombre,' ', percon.cPerApellidos) AS Contacto,
perrep.cPerCodigo AS CodRepresentante,
CONCAT(perrep.cPerNombre,' ', perrep.cPerApellidos) AS Representante,
perjur.cPerJurDescripcion,
rubro.nParCodigo,
rubro.cParDescripcion

from persona as per
INNER JOIN perjuridica as perjur ON per.cPerCodigo=perjur.cPerCodigo
INNER JOIN perdireccion as perdir ON perdir.cPerCodigo=perjur.cPerCodigo
INNER JOIN perdocumento as perdoc ON perdoc.cPerCodigo=perjur.cPerCodigo
INNER JOIN perrelacion AS perrelcon ON perrelcon.cPerJuridica=perjur.cPerCodigo AND perrelcon.nPerRelTipo=2018
INNER JOIN persona AS percon ON percon.cPerCodigo=perrelcon.cPerCodigo
INNER JOIN perrelacion AS perrelrep ON perrelrep.cPerJuridica=perjur.cPerCodigo AND perrelrep.nPerRelTipo=2017
INNER JOIN persona AS perrep ON perrep.cPerCodigo=perrelrep.cPerCodigo
INNER JOIN parametro AS rubro ON rubro.nParCodigo=perjur.nPerJurRubro and rubro.nParClase=1006
WHERE percon.nPerEstado=1
AND per.nPerEstado=1
AND perjur.cPerCodigo	= cPerCodigo;
*/
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_PerMail_By_cPerCodigo_nPerMailTipo_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_PerMail_By_cPerCodigo_nPerMailTipo_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_PerMail_By_cPerCodigo_nPerMailTipo_nPerRelTipo`(cPerCodigo varchar(20), nPerMailTipo int(11),nPerRelTipo int(11))
BEGIN
	SELECT	permail.nPerMailTipo,	
					permail.cPerMail,
					mail.cParDescripcion
	FROM	permail
	INNER JOIN parametro mail ON permail.nPerMailTipo=mail.nParCodigo AND mail.nParClase=1012
	WHERE	permail.cPerCodigo = cPerCodigo
	AND		permail.nPerRelTipo = nPerRelTipo
	AND		( (nPerMailTipo  = 0) 	 OR ( permail.nPerMailTipo like concat(nPerMailTipo,'%')) );
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Permisos_Botonera_By_Usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Permisos_Botonera_By_Usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Permisos_Botonera_By_Usuario`(nPerTipo int(4), nPerEstado int(4), nPerUsuEstado Int(4), nPerUsuAccEstado Int(4), nParClase Int(4),cPerCodigo  varchar(20), nPerUsuAccGrupo Int(4), nParTipo Int(4), nParSrcClase Int(4), nParSrcCodigo Int(4))
BEGIN
	SELECT persona.cPerCodigo,
		persona.cPerNombre,
		persona.nPerTipo,
		perusuacceso.nPerUsuAccGrupo,
    perusuacceso.nPerUsuAccCodigo,
		perusuacceso.nPerUsuAccEstado,
		parametro.cParJerarquia,
		parametro.cParNombre,
    parametro.cParDescripcion,
		(length(parametro.cParJerarquia)) as CanJerarquia,
		parparametro.cValor
	FROM persona
  INNER JOIN perusuario  	ON persona.cPerCodigo    = perusuario.cPerCodigo
  INNER JOIN perusuacceso ON perusuario.cPerCodigo = perusuacceso.cPerCodigo
  INNER JOIN parametro    ON parametro.nParCodigo  = perusuacceso.nPerUsuAccCodigo AND parametro.nParClase = perusuacceso.nPerUsuAccObjCodigo
	INNER JOIN parparametro	ON parparametro.nParDstClase = parametro.nParClase AND parparametro.nParDstCodigo = parametro.nParCodigo
	WHERE persona.nPerTipo             = nPerTipo
  AND persona.nPerEstado             <> nPerEstado
  AND perusuario.nPerUsuEstado       <> nPerUsuEstado
  AND perusuacceso.nPerUsuAccEstado  <>	nPerUsuAccEstado
  AND parametro.nParClase            = nParClase
  AND persona.cPerCodigo             = cPerCodigo
	AND perusuacceso.nPerUsuAccGrupo	 = nPerUsuAccGrupo
	AND parametro.nParTipo			   		 = nParTipo
	AND parparametro.nParSrcClase			 = nParSrcClase
	AND parparametro.nParSrcCodigo		 = nParSrcCodigo
	ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Permisos_By_Usuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Permisos_By_Usuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Permisos_By_Usuario`(nPerTipo int(4), nPerEstado int(4), nPerUsuEstado Int(4), nPerUsuAccEstado Int(4), nParClase Int(4), cPerCodigo  varchar(20), nPerUsuAccGrupo Int(4))
BEGIN
	SELECT persona.cPerCodigo,
		persona.cPerNombre,
		persona.nPerTipo,
		perusuacceso.nPerUsuAccGrupo,
    perusuacceso.nPerUsuAccCodigo,
		perusuacceso.nPerUsuAccEstado,
		parametro.cParJerarquia,
		parametro.cParNombre,
    Concat(left(parametro.cParDescripcion,1),lower(right(parametro.cParDescripcion,(length(parametro.cParDescripcion)-1)))) AS NombreMenu,
		(length(parametro.cParJerarquia)) as CanJerarquia
	FROM persona
  INNER JOIN perusuario   ON persona.cPerCodigo    = perusuario.cPerCodigo
  INNER JOIN perusuacceso ON perusuario.cPerCodigo = perusuacceso.cPerCodigo
  INNER JOIN parametro    ON parametro.nParCodigo  = perusuacceso.nPerUsuAccCodigo AND parametro.nParClase = perusuacceso.nPerUsuAccObjCodigo
	WHERE persona.nPerTipo            = nPerTipo
  AND persona.nPerEstado            <> nPerEstado
  AND perusuario.nPerUsuEstado      <> nPerUsuEstado
  AND perusuacceso.nPerUsuAccEstado <> nPerUsuAccEstado
  AND parametro.nParClase           = nParClase
  AND persona.cPerCodigo            = cPerCodigo
	AND perusuacceso.nPerUsuAccGrupo	= nPerUsuAccGrupo
	ORDER BY parametro.cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Permiso_By_Acceso_Grupo_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Permiso_By_Acceso_Grupo_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Permiso_By_Acceso_Grupo_Persona`(nParCodigo int(4), nParClase Int(4), cPerCodigo  varchar(20), nPerUsuAccEstado Int(4))
BEGIN
	SELECT  perusuacceso.nPerUsuAccCodigo   ,
       		perusuacceso.cPerCodigo         ,
        	perusuacceso.nPerUsuAccGrupo    ,
        	perusuacceso.nPerUsuAccPrdCodigo,
        	perusuacceso.nPerUsuAccEstado
	FROM    perusuacceso
	WHERE   perusuacceso.nPerUsuAccEstado = nPerUsuAccEstado
  AND perusuacceso.cPerCodigo        = cPerCodigo
  AND perusuacceso.nPerUsuAccGrupo   = nParClase
  AND perusuacceso.nPerUsuAccCodigo  = nParCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_By_Apellidos
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_By_Apellidos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_By_Apellidos`(cPerNatApellido varchar(250))
BEGIN
	SELECT 	persona.cPerCodigo,
			CONCAT(persona.cPerNombre, ' ' ,persona.cPerApellidos) Nombre,
			IFNULL(perdocumento.cPerDocNumero,"-") cPerDocNumero,
			RIGHT(persona.cPerCodigo,5)
	FROM	persona
	INNER JOIN pernatural 	ON persona.cPerCodigo = pernatural.cPerCodigo
	LEFT JOIN perdocumento 	ON persona.cPerCodigo = perdocumento.cPerCodigo
	WHERE   persona.nPerTipo        = 1
  AND persona.nPerEstado          <> 0
	AND perdocumento.nPerDocTipo 		<>6
	AND perdocumento.nPerDocEstado	= 1
	HAVING Nombre LIKE CONCAT(cPerNatApellido ,'%')
	limit 0,8;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_By_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_By_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_By_cPerDocNumero`(cPerDocNumero varchar(250), nPerDocTipo Int(4), cPerCodigo varchar(20))
BEGIN
	SELECT CONCAT(persona.cPerApellidos,' ', persona.cPerNombre) AS cPerNombres,  perdocumento.cPerDocNumero, parametro.cParDescripcion
	FROM perdocumento
		INNER JOIN persona 		ON persona.cPerCodigo = perdocumento.cPerCodigo
		INNER JOIN parametro 		ON perdocumento.nPerDocTipo = parametro.nParCodigo AND parametro.nParClase = 1001
	WHERE perdocumento.cPerDocNumero=cPerDocNumero
		AND perdocumento.nPerDocTipo = nPerDocTipo
		AND persona.nPerEstado = 1
		AND ((cPerCodigo ='-') OR (persona.cPerCodigo <> cPerCodigo ));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_By_nPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_By_nPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_By_nPerCodigo`(cPerCodigo  varchar(20))
BEGIN
	SELECT	persona.cPerCodigo, 
					pernatural.cPerNatApePaterno, 
					pernatural.cPerNatApeMaterno,
					persona.cPerNombre,
					DATE_FORMAT(persona.dPerNacimiento,'%d/%m/%Y') AS dPerNacimiento,
					pernatural.nPerNatSexo,
					sexo.cParDescripcion as cPerNatSexo,
					pernatural.nPerNatEstCivil,
					civil.cParDescripcion as cPerNatEstCivil,
					perdocumento.nPerDocTipo,
					documento.cParDescripcion as cPerDocTipo,
					perdocumento.cPerDocNumero,
					perdireccion.cPerDirDescripcion
	FROM persona
	INNER JOIN pernatural ON persona.cPerCodigo=pernatural.cPerCodigo
	INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
	INNER JOIN perdireccion ON persona.cPerCodigo=perdireccion.cPerCodigo	
	INNER JOIN parametro documento ON perdocumento.nPerDocTipo=documento.nParCodigo AND documento.nParClase=1001
	INNER JOIN parametro sexo ON pernatural.nPerNatSexo=sexo.nParCodigo AND sexo.nParClase=1002
	INNER JOIN parametro civil ON pernatural.nPerNatEstCivil=civil.nParCodigo AND civil.nParClase=1003
	WHERE persona.cPerCodigo=cPerCodigo
	AND persona.nPerTipo = 1
	AND persona.nPerEstado = 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_By_nPerRelTipo_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_By_nPerRelTipo_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_By_nPerRelTipo_cPerDocNumero`(nPerRelTipo int(11), cPerDocNumero varchar(100))
BEGIN
	IF  (nPerRelTipo = 1 ) THEN
		SET @sentencia=CONCAT('SELECT	persona.cPerCodigo,
																	persona.cPerNombre,
																	"-",
																	rubro.cParDescripcion,
																	CONCAT(contacto.cPerNombre, " ", contacto.cPerApellidos) AS cPerApellidos
													FROM persona 
													INNER JOIN perjuridica ON persona.cPerCodigo=perjuridica.cPerCodigo
													INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
													INNER JOIN parametro AS rubro ON rubro.nParCodigo=perjuridica.nPerJurRubro AND rubro.nParClase=1006
													INNER JOIN perrelacion ON perrelacion.cPerJuridica=perjuridica.cPerCodigo
													INNER JOIN persona	AS contacto ON contacto.cPerCodigo=perrelacion.cPerCodigo AND perrelacion.nPerRelTipo=2018
													WHERE perdocumento.cPerDocNumero=',cPerDocNumero,'
													AND persona.nPerTipo = 2
													AND persona.nPerEstado = 1
													AND perdocumento.nPerDocTipo=7
													AND perrelacion.nPerRelEstado=1');
					prepare consulta FROM @sentencia;
					execute consulta;
	ELSE
		SELECT	persona.cPerCodigo,
						persona.cPerNombre,
						pernatural.cPerNatApePaterno,
						pernatural.cPerNatApeMaterno,
						'0',
						perdocumento.nPerDocTipo
		FROM persona 
		INNER JOIN pernatural ON persona.cPerCodigo=pernatural.cPerCodigo
		INNER JOIN perdocumento ON persona.cPerCodigo=perdocumento.cPerCodigo
		WHERE perdocumento.cPerDocNumero = cPerDocNumero
		AND persona.nPerTipo = 1
		AND persona.nPerEstado = 1
		AND perdocumento.nPerDocTipo=2;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Persona_Codigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Persona_Codigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Persona_Codigo`()
BEGIN
	#Routine body goes here...
	DECLARE cPerCodigo VARCHAR(20);

  SELECT 	IFNULL( MAX(RIGHT(persona.cPerCodigo,6))+1 , '100001' ) INTO cPerCodigo
	FROM		persona;

	SELECT CONCAT('100000',cPerCodigo);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Provincias
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Provincias`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Provincias`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cProvincia varchar(200))
BEGIN
IF  (nPagRegistro = 1 ) THEN
		SET @sentencia = CONCAT('SELECT provincia.IdProvincia,provincia.Nombre, provincia.IdDepartamento
					FROM provincia 

					WHERE( ("',cProvincia   ,'" ="-"  ) OR (provincia.Nombre like "',cProvincia  ,'%") )
					ORDER BY provincia.Nombre ASC
					LIMIT  ',nOriReg,',',nCanReg);
					prepare consulta FROM @sentencia;
					execute consulta;
	ELSE
		SELECT provincia.IdProvincia,provincia.Nombre, provincia.IdDepartamento
				FROM provincia ORDER BY provincia.Nombre ASC ;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Provincias_Departamento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Provincias_Departamento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Provincias_Departamento`(IdDepartamento CHAR(8))
BEGIN
			SELECT provincia.IdProvincia,provincia.Nombre, provincia.IdDepartamento
				FROM provincia 
WHERE provincia.IdDepartamento=IdDepartamento 
AND provincia.nProEstado = 1 
ORDER BY provincia.Nombre ASC ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Relacion_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Relacion_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Relacion_ParParametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), nGenClase int(11), nPar1Clase int(11), nPar2Clase int(11), cGenDes varchar(100), cPar1Des varchar(100), cPar2Des varchar(100))
BEGIN
		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('	SELECT	general.nParCodigo AS nGenCodigo, general.cParDescripcion AS cGenNombre,
																				p1.nParCodigo AS nP1Codigo, p1.cParDescripcion AS cP1Nombre, pp1.cValor AS cP1Valor,
																				p2.nParCodigo AS nP2Codigo, p2.cParDescripcion AS cP2Nombre, pp2.cValor AS cP2Valor
																FROM parametro AS general
																INNER JOIN parparametro AS pp1 ON general.nParCodigo=pp1.nParSrcCodigo AND pp1.nParDstClase= ',nPar1Clase,'
																INNER JOIN parametro AS p1 ON pp1.nParDstCodigo=p1.nParCodigo AND p1.nParClase= ',nPar1Clase,'
																INNER JOIN parparametro AS pp2 ON general.nParCodigo=pp2.nParSrcCodigo AND pp2.nParDstClase= ',nPar2Clase,'
																INNER JOIN parametro AS p2 ON pp2.nParDstCodigo=p2.nParCodigo AND p2.nParClase= ',nPar2Clase,'
																WHERE general.nParClase=',nGenClase,'
																AND general.nParTipo=1000
																AND pp1.nParSrcClase= ',nGenClase,'
																AND pp2.nParSrcClase= ',nGenClase,'
																AND pp1.nParEstado=1
																AND pp2.nParEstado=1
																AND( ("',cGenDes,'"  = "-"  ) OR (general.cParDescripcion LIKE "',cGenDes,'%") )
																AND( ("',cPar1Des,'" = "-"  ) OR (p1.cParDescripcion LIKE "',cPar1Des,'%") )
																AND( ("',cPar2Des,'" = "-"  ) OR (p2.cParDescripcion LIKE "',cPar2Des,'%") )
																ORDER BY general.nParCodigo
																LIMIT ',nOriReg,',',nCanReg,';');
					prepare consulta FROM @sentencia;
					execute consulta;

		ELSE

				SELECT	general.nParCodigo AS nGenCodigo, general.cParDescripcion AS cGenNombre,
								p1.nParCodigo AS nP1Codigo, p1.cParDescripcion AS cP1Nombre, pp1.cValor AS cP1Valor,
								p2.nParCodigo AS nP2Codigo, p2.cParDescripcion AS cP2Nombre, pp2.cValor AS cP2Valor
				FROM parametro AS general
				INNER JOIN parparametro AS pp1 ON general.nParCodigo=pp1.nParSrcCodigo AND pp1.nParDstClase= nPar1Clase
				INNER JOIN parametro AS p1 ON pp1.nParDstCodigo=p1.nParCodigo AND p1.nParClase= nPar1Clase
				INNER JOIN parparametro AS pp2 ON general.nParCodigo=pp2.nParSrcCodigo AND pp2.nParDstClase= nPar2Clase
				INNER JOIN parametro AS p2 ON pp2.nParDstCodigo=p2.nParCodigo AND p2.nParClase= nPar2Clase
				WHERE general.nParClase=nGenClase
				AND general.nParTipo=1000
				AND pp1.nParSrcClase= nGenClase
				AND pp2.nParSrcClase= nGenClase
				AND pp1.nParEstado=1
				AND pp2.nParEstado=1
				AND( (cGenDes = '-' ) OR (general.cParDescripcion LIKE CONCAT(cGenDes ,'%')) )
				AND( (cPar1Des ='-' ) OR (p1.cParDescripcion LIKE CONCAT(cPar1Des ,'%')) )
				AND( (cPar2Des ='-' ) OR (p2.cParDescripcion LIKE CONCAT(cPar2Des ,'%')) )
				ORDER BY general.nParCodigo;

		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_Menu
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_Menu`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_Menu`(nParCodigo_ INT, cParJerarquia_Len_ INT, nParGrupo_ INT)
BEGIN

		IF (nParCodigo_ = 0) THEN
				SELECT 
					parametro.nParCodigo,
					parametro.cParDescripcion,
					parametro.cParNombre , 
					parametro.cParJerarquia,
					parametro.nParClase,
					IFNULL(
						(
						SELECT  menugrupo.nParSrcCodigo FROM parparametro menugrupo 
							WHERE menugrupo.nParSrcCodigo = nParGrupo_  
							AND 	menugrupo.nParSrcClase=2038 	
							AND menugrupo.nParDstCodigo=parametro.nParCodigo	
							AND menugrupo.nParDstClase=parametro.nParClase
						)
					, 0) as nParGrupo

				FROM parametro
				WHERE parametro.nParClase=5000
				AND parametro.nParTipo<>0	
				AND LENGTH(parametro.cParJerarquia) in (cParJerarquia_Len_) 
				AND parametro.nParTipo=1000
				ORDER BY parametro.cParJerarquia  ;
		ELSE
				SELECT 
						parametro.nParCodigo,
						parametro.cParDescripcion,
						parametro.cParNombre , 
						parametro.cParJerarquia,
						parametro.nParClase,
						IFNULL(
							(
							SELECT  menugrupo.nParSrcCodigo FROM parparametro menugrupo 
								WHERE menugrupo.nParSrcCodigo = nParGrupo_  
								AND 	menugrupo.nParSrcClase=2038 	
								AND menugrupo.nParDstCodigo=parametro.nParCodigo	
								AND menugrupo.nParDstClase=parametro.nParClase
							)
						, 0) as nParGrupo
					FROM parametro
					WHERE parametro.nParClase=5000
					AND parametro.nParTipo<>0	
					AND LENGTH(parametro.cParJerarquia) in (cParJerarquia_Len_ ) 
					AND parametro.nParTipo=1000		
					AND  SUBSTRING(parametro.nParCodigo,1,LENGTH(nParCodigo_))=nParCodigo_ 
					ORDER BY parametro.cParJerarquia  ;

		END IF ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_Menu_Botonera
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_Menu_Botonera`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_Menu_Botonera`(nParSrcCodigo_ INT , nParGrupo_ INT)
BEGIN
	SELECT 
					menu.nParCodigo ,			
					parparametro.nParDstCodigo,
					menu.cParDescripcion  as PadreDescripcion,		
					boton.cParDescripcion as HijoDescripcion,					
					boton.cParJerarquia,		
					boton.nParClase
					,
					IFNULL(
						(
						SELECT  menugrupo.nParSrcCodigo FROM parparametro menugrupo 
							WHERE menugrupo.nParSrcCodigo = nParGrupo_   
							AND 	menugrupo.nParSrcClase=2038 	
							AND menugrupo.nParDstCodigo=boton.nParCodigo	
							AND menugrupo.nParDstClase=boton.nParClase
						)
					, 0) as nParGrupo
			

					
		FROM parametro AS menu
		INNER JOIN parparametro ON menu.nParCodigo=parparametro.nParSrcCodigo
		INNER JOIN parametro AS boton ON parparametro.nParDstCodigo=boton.nParCodigo
		WHERE menu.nParClase=5000
		AND parparametro.nParSrcClase=5000
		AND boton.nParClase=5001
		AND parparametro.nParDstClase=5001
		AND  menu.nParTipo=1000
		AND  boton.nParTipo=1000
		AND menu.nParCodigo=nParSrcCodigo_ ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_Parametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cParDescripcion varchar(500), nParClase Int(4))
BEGIN

	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('SELECT parametro.nParCodigo,
					 parametro.cParNombre,
					 parametro.cParDescripcion
				FROM parametro
				WHERE parametro.nParClase	= ',nParClase,'
				AND parametro.nParTipo 		= 1000
				AND( ("',cParDescripcion ,'" ="-"  ) OR (  parametro.cParDescripcion like "',cParDescripcion ,'%") )
				ORDER BY parametro.cParDescripcion ASC
				LIMIT ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

	ELSE

		SELECT parametro.nParCodigo,
			 parametro.cParNombre,
			 parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParClase	= nParClase
		AND parametro.nParTipo 		= 1000
		AND( (cParDescripcion ='-' ) OR ( parametro.cParDescripcion like  concat(cParDescripcion,'%')) )
		ORDER BY parametro.cParDescripcion ASC;

	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_seleccionar_Parametro_by_nParCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_seleccionar_Parametro_by_nParCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_seleccionar_Parametro_by_nParCodigo`(nParCodigo int(11),  nParSrcClase int(4), nParDstClase int(4))
BEGIN
			/*SELECT 	parparametro.nParSrcCodigo,
				parametro.cParDescripcion,
				parparametro.nParDstCodigo,
				parmodelo.cParDescripcion
			FROM parametro
			INNER JOIN parparametro 				ON parparametro.nParSrcCodigo=parametro.nParCodigo AND parametro.nParClase=nParSrcClase 
			INNER JOIN parametro parmodelo 	ON parmodelo.nParCodigo=parparametro.nParDstCodigo AND parparametro.nParDstClase=nParDstClase 
			WHERE parametro.nParClase	= nParSrcClase 
			AND parmodelo.nParClase		= nParDstClase 
			AND parmodelo.nParTipo		= 1000
			AND parametro.nParTipo		= 1000
			AND parametro.nParCodigo = nParCodigo;*/
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_ParParamento_By_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_ParParamento_By_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_ParParamento_By_Parametro`(nParSrcClase int(11), nParDstClase int(11))
BEGIN
		SELECT	parparametro.nParSrcCodigo,
							categoria.cParNombre , 
							categoria.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,						
							subCategoria.cParDescripcion AS cParDstDescripcion,
							parparametro.cValor
			FROM parametro categoria
			INNER JOIN parparametro 					ON parparametro.nParSrcCodigo=categoria.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro subCategoria 	ON parparametro.nParDstCodigo=subCategoria.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE categoria.nParClase			=  nParSrcClase 
			AND subCategoria.nParClase		= nParDstClase 
			AND categoria.nParTipo				= 1000
			AND subCategoria.nParTipo			= 1000
			AND parparametro.nParEstado = 1
			ORDER BY parparametro.nParSrcCodigo , 	parparametro.nParDstCodigo  ASC ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_ParParametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),  nParSrcClase int(11), nParSrcCodigo Int(4), nParDstClase int(11), cParDstNombre varchar(255), cParDst  varchar(255))
BEGIN

		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('SELECT parparametro.nParSrcCodigo,						
							parsrc.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,
							pardst.cParNombre,
							pardst.cParDescripcion AS cParDstDescripcion
						FROM parametro parsrc
						INNER JOIN parparametro 			ON parparametro.nParSrcCodigo=parsrc.nParCodigo AND parparametro.nParSrcClase=',nParSrcClase,'
						INNER JOIN parametro pardst 	ON parparametro.nParDstCodigo=pardst.nParCodigo AND parparametro.nParDstClase=',nParDstClase,'
						WHERE parsrc.nParClase			=	',nParSrcClase,'
						AND pardst.nParClase				=	',nParDstClase,'
						AND parsrc.nParTipo					=	1000
						AND pardst.nParTipo					=	1000
						AND parparametro.nParEstado = 1
						AND( ("',cParDstNombre   ,'" ="-"  ) OR (pardst.cParNombre like "',cParDstNombre  ,'%") )
						AND( ("',cParDst  ,'" ="-"  ) OR (pardst.cParDescripcion like "',cParDst ,'%"  ) )
						AND(  (',nParSrcCodigo ,'=0) OR (parsrc.nParCodigo=',nParSrcCodigo ,')  )
						ORDER BY parsrc.cParDescripcion  ASC, parparametro.nParSrcCodigo DESC
				LIMIT ',nOriReg,',',nCanReg, '; ');
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	parparametro.nParSrcCodigo,				
					parsrc.cParDescripcion AS cParSrcDescripcion,
					parparametro.nParDstCodigo,
					pardst.cParNombre,
					pardst.cParDescripcion AS cParDstDescripcion
			FROM parametro parsrc
			INNER JOIN parparametro 			ON parparametro.nParSrcCodigo=parsrc.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro pardst 	ON parparametro.nParDstCodigo=pardst.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE parsrc.nParClase			= nParSrcClase
			AND pardst.nParClase				= nParDstClase
			AND parsrc.nParTipo					= 1000
			AND pardst.nParTipo					= 1000
			AND parparametro.nParEstado = 1
			AND( (cParDstNombre   ='-' ) OR (pardst.cParNombre like concat(cParDstNombre  ,'%')) )
			AND( (cParDst  ='-' ) OR ( pardst.cParDescripcion like concat(cParDst ,'%') ) )
			AND( (nParSrcCodigo =0) OR (parsrc.nParCodigo=nParSrcCodigo ) )
			ORDER BY parsrc.cParDescripcion  ASC, parparametro.nParSrcCodigo DESC;

		END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_ParParametro0
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_ParParametro0`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_ParParametro0`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),  nParSrcClase int(11), cParSrc varchar(255), nParDstClase int(11),cParDst  varchar(255))
BEGIN

		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('SELECT parparametro.nParSrcCodigo,
							parsrc.cParNombre,
							parsrc.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,
							pardst.cParDescripcion AS cParDstDescripcion
						FROM parametro parsrc
						INNER JOIN parparametro 			ON parparametro.nParSrcCodigo=parsrc.nParCodigo AND parparametro.nParSrcClase=',nParSrcClase,'
						INNER JOIN parametro pardst 	ON parparametro.nParDstCodigo=pardst.nParCodigo AND parparametro.nParDstClase=',nParDstClase,'
						WHERE parsrc.nParClase			=	',nParSrcClase,'
						AND pardst.nParClase				=	',nParDstClase,'
						AND parsrc.nParTipo					=	1000
						AND pardst.nParTipo					=	1000
						AND parparametro.nParEstado = 1
						AND( ("',cParSrc  ,'" ="-"  ) OR (parsrc.cParDescripcion like "',cParSrc ,'%") )
						AND( ("',cParDst  ,'" ="-"  ) OR (pardst.cParDescripcion like "',cParDst ,'%") )
						ORDER BY parsrc.cParDescripcion  ASC
				LIMIT ',nOriReg,',',nCanReg);
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	parparametro.nParSrcCodigo,
						parparametro.nParSrcClase ,
					pardst.cParNombre,
					pardst.cParDescripcion AS cParSrcDescripcion,
					parparametro.nParDstCodigo,
					pardst.cParDescripcion AS cParDstDescripcion , 
					parparametro.cValor
			FROM parametro parsrc
			INNER JOIN parparametro 			ON parparametro.nParSrcCodigo=parsrc.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro pardst 	ON parparametro.nParDstCodigo=pardst.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE parsrc.nParClase			= nParSrcClase
			AND pardst.nParClase				= nParDstClase
			AND parsrc.nParTipo					= 1000
			AND pardst.nParTipo					= 1000
			AND parparametro.nParEstado = 1
			AND( (cParSrc  ='-' ) OR (parsrc.cParDescripcion like concat(cParSrc ,'%')) )
			AND( (cParDst  ='-' ) OR (pardst.cParDescripcion like concat(cParDst ,'%')) )
			ORDER BY parsrc.cParDescripcion  ASC;

		END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_ParParametro_By_nPaDstCodigo_h
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_ParParametro_By_nPaDstCodigo_h`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_ParParametro_By_nPaDstCodigo_h`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),  nParSrcClase int(11), cParSrc varchar(255), nParDstClase int(11), cParDst  varchar(255) ,nParDstCodigo INT(4) , nParDstCodigoH INT(4))
BEGIN
	IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('
							SELECT	parparametro.nParSrcCodigo,
									parsrc.cParNombre AS cParSrcNombre,
									parsrc.cParDescripcion AS cParSrcDescripcion,
									parparametro.nParDstCodigo,				
									pardst.cParNombre AS cParDstNombre,
									pardst.cParDescripcion AS cParDstDescripcion,
									( SELECT parparametro.cValor FROM parparametro WHERE parparametro.nParDstCodigo=',nParDstCodigoH,'    AND
										 parparametro.nParSrcClase=',nParSrcClase,' AND parparametro.nParDstClase=',nParDstClase,'  AND 
										parparametro.nParSrcCodigo=parsrc.nParCodigo
										) AS cSrcDstValor 
							FROM parametro parsrc
							INNER JOIN parparametro 			ON parparametro.nParSrcCodigo=parsrc.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
							INNER JOIN parametro pardst 	ON parparametro.nParDstCodigo=pardst.nParCodigo AND parparametro.nParDstClase=nParDstClase
							WHERE parsrc.nParClase			= ',nParSrcClase ,'
							AND pardst.nParClase				= ',nParDstClase ,'
							AND parsrc.nParTipo					= 1000
							AND pardst.nParTipo					= 1000
							AND parparametro.nParEstado = 1
							AND 	parparametro.nParDstCodigo=', nParDstCodigo ,' 
							AND( ("',cParSrc ,'" ="-" ) OR (parsrc.cParDescripcion like concat("',cParSrc ,'%")) )
							AND( ("',cParDst,'"  ="-" ) OR 
										( 	
											( SELECT parparametro.cValor FROM parparametro WHERE parparametro.nParDstCodigo=',nParDstCodigoH,'    AND
											 parparametro.nParSrcClase=',nParSrcClase,' AND parparametro.nParDstClase=',nParSrcClase,' AND 
											 parparametro.nParSrcCodigo=parsrc.nParCodigo
											) like concat("%',cParDst ,'%")
										) 
								) ORDER BY parsrc.cParDescripcion ASC 
										LIMIT ',nOriReg,',',nCanReg ,' ;');
										prepare consulta FROM @sentencia;
										execute consulta;


ELSE

		SELECT	parparametro.nParSrcCodigo,
					parsrc.cParNombre AS cParSrcNombre,
					parsrc.cParDescripcion AS cParSrcDescripcion,
					parparametro.nParDstCodigo,				
					pardst.cParNombre AS cParDstNombre,
					pardst.cParDescripcion AS cParDstDescripcion,
					( SELECT parparametro.cValor FROM parparametro WHERE parparametro.nParDstCodigo=nParDstCodigoH    AND
						 parparametro.nParSrcClase=nParSrcClase AND parparametro.nParDstClase=nParDstClase  AND 
						parparametro.nParSrcCodigo=parsrc.nParCodigo
						) AS cSrcDstValor -- nombre comun
			FROM parametro parsrc
			INNER JOIN parparametro 			ON parparametro.nParSrcCodigo=parsrc.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro pardst 	ON parparametro.nParDstCodigo=pardst.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE parsrc.nParClase			= nParSrcClase 
			AND pardst.nParClase				= nParDstClase 
			AND parsrc.nParTipo					= 1000
			AND pardst.nParTipo					= 1000
			AND parparametro.nParEstado = 1
			AND 	parparametro.nParDstCodigo= nParDstCodigo 
			AND( (cParSrc  ='-' ) OR (parsrc.cParDescripcion like concat(cParSrc ,'%')) )
			AND( (cParDst  ='-' ) OR ( 
							( SELECT parparametro.cValor FROM parparametro WHERE parparametro.nParDstCodigo=nParDstCodigoH    AND
							 parparametro.nParSrcClase=nParSrcClase AND parparametro.nParDstClase=nParSrcClase AND 
							 parparametro.nParSrcCodigo=parsrc.nParCodigo
							) like concat(cParDst,'%') )) 
				ORDER BY parsrc.cParDescripcion ASC 
			
						; 
		
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_ParParametro_nParDstCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_ParParametro_nParDstCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_ParParametro_nParDstCodigo`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),  nParSrcClase INT(11)  , nParDstCodigo INT(11) ,  nParDstClase INT(11) , cParNombre VARCHAR(300) ,  cParDescripcion VARCHAR(300) , cValor VARCHAR(500))
BEGIN

			IF  (nPagRegistro = 1 ) THEN

						SET @sentencia = CONCAT('
														SELECT 
																	parparametro.nParSrcCodigo , 
																	parametro.cParNombre , 
																	parametro.cParDescripcion ,
																	parparametro.nParDstCodigo ,
																	parparametro.cValor	 
														FROM parametro 
														INNER JOIN parparametro ON parametro.nParCodigo = parparametro.nParSrcCodigo
														WHERE parametro.nParClase = ',nParSrcClase,' 	
														AND parparametro.nParSrcClase = ',nParSrcClase ,' 	
														AND parparametro.nParDstClase = ',nParDstClase ,' 	
														AND parparametro.nParDstCodigo = ',nParDstCodigo,' 	  
														AND parametro.nParTipo					= 1000
														AND parparametro.nParEstado = 1
														AND( ("',cParNombre ,'"  ="-" ) OR (parametro.cParNombre like "',cParNombre  ,'%") )
														AND( ("',cParDescripcion,'"  ="-" ) OR ( parametro.cParDescripcion like "',cParDescripcion ,'%" ) )
														AND( ("',cValor,'" ="-") OR (parparametro.cValor like "',cValor ,'%" ) )
														ORDER BY parametro.cParNombre  asc , parametro.cParDescripcion  ASC, parparametro.cValor 
							LIMIT ',nOriReg,',',nCanReg, '; ');
							prepare consulta FROM @sentencia;
							execute consulta;
			ELSE
				
						SELECT 
									parparametro.nParSrcCodigo , 
									parametro.cParNombre , 
									parametro.cParDescripcion ,
									parparametro.nParDstCodigo ,
									parparametro.cValor	 
						FROM parametro 
						INNER JOIN parparametro ON parametro.nParCodigo = parparametro.nParSrcCodigo
						WHERE parametro.nParClase = nParSrcClase 	
						AND parparametro.nParSrcClase = nParSrcClase 
						AND parparametro.nParDstClase = nParDstClase 
						AND parparametro.nParDstCodigo = nParDstCodigo  
						AND parametro.nParTipo					= 1000
						AND parparametro.nParEstado = 1
						AND( (cParNombre   ="-" ) OR (parametro.cParNombre like concat(cParNombre  ,"%")) )
						AND( (cParDescripcion  ="-" ) OR ( parametro.cParDescripcion like concat(cParDescripcion ,"%") ) )
						AND( (cValor ="-") OR (parparametro.cValor like concat(cValor ,"%") ) )
						ORDER BY parametro.cParNombre  asc , parametro.cParDescripcion  ASC, parparametro.cValor 
						;
			END IF ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_ParParExt
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_ParParExt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_ParParExt`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),nIntSrcClase Int(11), cSrcDescripcion Varchar(100), nIntDstClase Int(11), cDstDescripcion Varchar(100), nObjTipo Int(11), cObjDescripcion varchar(100))
BEGIN
		IF  (nPagRegistro = 1 ) THEN
			SET @sentencia = CONCAT('
															SELECT 	src.nParCodigo AS nSrcCodigo, src.cParDescripcion AS cSrcDescripcion,
																			dst.nParCodigo AS nDstCodigo, dst.cParDescripcion AS cDstDescripcion,
																			obj.nParCodigo AS nObjCodigo, obj.cParDescripcion AS cObjDescripcion,
																			parparext.cValor
															FROM parparext 
															INNER JOIN parametro AS src ON parparext.nIntSrcCodigo=src.nParCodigo AND src.nParClase=',nIntSrcClase,'
															INNER JOIN parametro AS dst ON parparext.nIntDstCodigo=dst.nParCodigo AND dst.nParClase=',nIntDstClase,'
															INNER JOIN parametro AS obj ON parparext.nObjCodigo=obj.nParCodigo		AND obj.nParClase=',nObjTipo,'
															WHERE parparext.nIntSrcClase=',nIntSrcClase,'
															AND		parparext.nIntDstClase=',nIntDstClase,'
															AND		parparext.nObjTipo=',nObjTipo,'
															AND( ("',cSrcDescripcion,'" ="-"  ) OR (src.cParDescripcion like "',cSrcDescripcion,'%") )
															AND( ("',cDstDescripcion,'" ="-"  ) OR (dst.cParDescripcion like "',cDstDescripcion,'%") )
															AND( ("',cObjDescripcion,'" ="-"  ) OR (obj.cParDescripcion like "',cObjDescripcion,'%") )
															LIMIT ',nOriReg,',',nCanReg,';');
				PREPARE consulta FROM @sentencia;
				EXECUTE consulta;
		ELSE

			SELECT 	src.nParCodigo AS nSrcCodigo, src.cParDescripcion AS cSrcDescripcion,
							dst.nParCodigo AS nDstCodigo, dst.cParDescripcion AS cDstDescripcion,
							obj.nParCodigo AS nObjCodigo, obj.cParDescripcion AS cObjDescripcion,
							parparext.cValor
			FROM parparext 
			INNER JOIN parametro AS src ON parparext.nIntSrcCodigo=src.nParCodigo AND src.nParClase=nIntSrcClase
			INNER JOIN parametro AS dst ON parparext.nIntDstCodigo=dst.nParCodigo AND dst.nParClase=nIntDstClase
			INNER JOIN parametro AS obj ON parparext.nObjCodigo=obj.nParCodigo		AND obj.nParClase=nObjTipo
			WHERE parparext.nIntSrcClase=nIntSrcClase
			AND		parparext.nIntDstClase=nIntDstClase
			AND		parparext.nObjTipo=nObjTipo
			AND( (cSrcDescripcion ='-'  ) OR (src.cParDescripcion LIKE CONCAT(cSrcDescripcion,'%')) )
			AND( (cDstDescripcion ='-'  ) OR (dst.cParDescripcion LIKE CONCAT(cDstDescripcion,'%')) )
			AND( (cObjDescripcion ='-'  ) OR (obj.cParDescripcion LIKE CONCAT(cObjDescripcion,'%')) );
		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_seleccionar_perjuridicas
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_seleccionar_perjuridicas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_seleccionar_perjuridicas`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cPerNombre varchar(500) , cPerDocNumero varchar(250), cPerContacto varchar(250))
BEGIN
		IF  (nPagRegistro = 1 ) THEN
			SET @sentencia = CONCAT('	SELECT per.cPerCodigo, per.cPerNombre, 
																				perdoc.cPerDocNumero, perdir.cPerDirDescripcion, CONCAT(percon.cPerNombre," ", percon.cPerApellidos) AS Contacto
																FROM persona AS per
																INNER JOIN perjuridica AS perjur ON per.cPerCodigo=perjur.cPerCodigo
																INNER JOIN perdireccion AS perdir ON perdir.cPerCodigo=perjur.cPerCodigo
																INNER JOIN perdocumento AS perdoc ON perdoc.cPerCodigo=perjur.cPerCodigo
																INNER JOIN perrelacion AS perrel ON perrel.cPerJuridica=perjur.cPerCodigo AND perrel.nPerRelTipo=2018
																INNER JOIN persona AS percon ON percon.cPerCodigo=perrel.cPerCodigo
																WHERE percon.nPerEstado=1
																AND per.nPerEstado=1		
																AND( ("',cPerNombre,'" = "-") 	 OR ( per.cPerNombre like "',cPerNombre,'%")) 
																AND( ("',cPerDocNumero ,'" = "-") OR ( perdoc.cPerDocNumero like "',cPerDocNumero ,'%")) 
																AND( ("',cPerContacto,'" = "-" ) OR ( CONCAT(percon.cPerNombre," ", percon.cPerApellidos) like "',cPerContacto,'%"))
																ORDER BY per.cPerNombre ASC
																LIMIT  ',nOriReg,',',nCanReg);
			prepare consulta FROM @sentencia;
			execute consulta;
		ELSE
			SELECT per.cPerCodigo, per.cPerNombre, perdoc.cPerDocNumero, perdir.cPerDirDescripcion, CONCAT(percon.cPerNombre,' ', percon.cPerApellidos) AS Contacto
			FROM persona AS per
			INNER JOIN perjuridica AS perjur ON per.cPerCodigo=perjur.cPerCodigo
			INNER JOIN perdireccion AS perdir ON perdir.cPerCodigo=perjur.cPerCodigo
			INNER JOIN perdocumento AS perdoc ON perdoc.cPerCodigo=perjur.cPerCodigo
			INNER JOIN perrelacion AS perrel ON perrel.cPerJuridica=perjur.cPerCodigo AND perrel.nPerRelTipo=2018
			INNER JOIN persona AS percon ON percon.cPerCodigo=perrel.cPerCodigo
			WHERE percon.nPerEstado=1
			AND per.nPerEstado=1		
			AND( (cPerNombre ='-') 	 OR ( per.cPerNombre like concat(cPerNombre,'%')) )
			AND( (cPerDocNumero='-') OR ( perdoc.cPerDocNumero like concat(cPerDocNumero,'%')) )
			AND( (cPerContacto='-' ) OR ( CONCAT(percon.cPerNombre,' ', percon.cPerApellidos) like  concat(cPerContacto,'%')))
			ORDER BY per.cPerNombre ASC;
		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_PerRelacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_PerRelacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_PerRelacion`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), nPerRelTipo Int(4), cPerJuridica Varchar(20), nPerTipo Int(4), cPerNombres Varchar(100), nPerDocTipo Int(4), cPerDocNumero Varchar(100), nPerMailTipo Int(4), cPerMail Varchar(100), nPerTelTipo Int(4), cPerTelNumero Varchar(100))
BEGIN
	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('
															SELECT 	persona.cPerCodigo, persona.nPerTipo, persona.cPerNombre, persona.cPerApellidos,	
																			perdocumento.nPerDocTipo, perdocumento.cPerDocNumero,
																			permail.nPerMailTipo, permail.cPerMail,
																			pertelefono.nPerTelTipo, pertelefono.cPerTelNumero,
																			perrelacion.nPerRelTipo, perrelacion.cPerJuridica
															FROM persona 
															INNER JOIN perrelacion ON persona.cPerCodigo=perrelacion.cPerCodigo
															INNER JOIN perdocumento ON perrelacion.cPerCodigo=perdocumento.cPerCodigo
															INNER JOIN permail ON perrelacion.cPerCodigo=permail.cPerCodigo
															INNER JOIN pertelefono ON perrelacion.cPerCodigo=pertelefono.cPerCodigo
															WHERE perrelacion.nPerRelEstado=1
															AND 	persona.nPerEstado=1
															AND 	perdocumento.nPerDocEstado=1
															AND 	permail.nPerMailEstado=1
															AND 	pertelefono.nPerTelEstado=1
															AND		( (',nPerRelTipo,'	=	0  ) 	OR 	(	perrelacion.nPerRelTipo		= ',nPerRelTipo,') )
															AND		( (',nPerRelTipo,'	=	0  ) 	OR 	(	permail.nPerRelTipo				= ',nPerRelTipo,') )
															AND		( (',nPerRelTipo,'	=	0  ) 	OR 	(	pertelefono.nPerRelTipo		= ',nPerRelTipo,') )
															AND		( (',nPerTipo,'			=	0  ) 	OR 	(	persona.nPerTipo 					= ',nPerTipo,') )			
															AND		( (',nPerDocTipo,'	=	0  ) 	OR 	(	perdocumento.nPerDocTipo 	= ',nPerDocTipo,') )
															AND		( (',nPerMailTipo,'	=	0  ) 	OR 	(	permail.nPerMailTipo 			= ',nPerMailTipo,') )
															AND		( (',nPerTelTipo,'	=	0  ) 	OR 	(	pertelefono.nPerTelTipo		= ',nPerTelTipo,') )
															AND		( ("',cPerJuridica,'" 	= "-") 	OR 	( perrelacion.cPerJuridica 		LIKE "',cPerJuridica,'%" ) )
															AND		( ("',cPerNombres,'" 	= "-") 	OR 	( CONCAT(persona.cPerNombre," ",persona.cPerApellidos) LIKE "',cPerNombres,'%") )
															AND		( ("',cPerDocNumero,'"= "-") 	OR 	( perdocumento.cPerDocNumero 	LIKE "',cPerDocNumero,'%" ) )
															AND		( ("',cPerMail,'" 		= "-") 	OR 	( permail.cPerMail 						LIKE "',cPerMail,'%") )
															AND		( ("',cPerTelNumero,'"= "-") 	OR 	( pertelefono.cPerTelNumero 	LIKE "',cPerTelNumero,'%") )
															ORDER BY persona.cPerCodigo
															LIMIT  ',nOriReg,',',nCanReg,';');
			PREPARE consulta FROM @sentencia;
			EXECUTE consulta;

	ELSE

			SELECT 	persona.cPerCodigo, persona.nPerTipo, persona.cPerNombre, persona.cPerApellidos,	
							perdocumento.nPerDocTipo, perdocumento.cPerDocNumero,
							permail.nPerMailTipo, permail.cPerMail,
							pertelefono.nPerTelTipo, pertelefono.cPerTelNumero,
							perrelacion.nPerRelTipo, perrelacion.cPerJuridica
			FROM persona 
			INNER JOIN perrelacion ON persona.cPerCodigo=perrelacion.cPerCodigo
			INNER JOIN perdocumento ON perrelacion.cPerCodigo=perdocumento.cPerCodigo
			INNER JOIN permail ON perrelacion.cPerCodigo=permail.cPerCodigo
			INNER JOIN pertelefono ON perrelacion.cPerCodigo=pertelefono.cPerCodigo
			WHERE perrelacion.nPerRelEstado=1
			AND 	persona.nPerEstado=1
			AND 	perdocumento.nPerDocEstado=1
			AND 	permail.nPerMailEstado=1
			AND 	pertelefono.nPerTelEstado=1
			AND		( (nPerRelTipo	=	0  ) 	OR 	(	perrelacion.nPerRelTipo		= nPerRelTipo) )
			AND		( (nPerRelTipo	=	0  ) 	OR 	(	permail.nPerRelTipo				= nPerRelTipo) )
			AND		( (nPerRelTipo	=	0  ) 	OR 	(	pertelefono.nPerRelTipo		= nPerRelTipo) )
			AND		( (nPerTipo			=	0  ) 	OR 	(	persona.nPerTipo 					= nPerTipo) )			
			AND		( (nPerDocTipo	=	0  ) 	OR 	(	perdocumento.nPerDocTipo 	= nPerDocTipo) )
			AND		( (nPerMailTipo	=	0  ) 	OR 	(	permail.nPerMailTipo 			= nPerMailTipo) )
			AND		( (nPerTelTipo	=	0  ) 	OR 	(	pertelefono.nPerTelTipo		= nPerTelTipo) )
			AND		( (cPerJuridica ='-') 	OR 	( perrelacion.cPerJuridica 		LIKE CONCAT(cPerJuridica,'%') ) )
			AND		( (cPerNombres ='-') 		OR 	( CONCAT(persona.cPerNombre,' ',persona.cPerApellidos) LIKE CONCAT(cPerNombres,'%')) )
			AND		( (cPerDocNumero ='-') 	OR 	( perdocumento.cPerDocNumero 	LIKE CONCAT(cPerDocNumero,'%') ) )
			AND		( (cPerMail ='-') 			OR 	( permail.cPerMail 						LIKE CONCAT(cPerMail,'%')) )
			AND		( (cPerTelNumero ='-') 	OR 	( pertelefono.cPerTelNumero 	LIKE CONCAT(cPerTelNumero,'%')) )
			ORDER BY persona.cPerCodigo;

	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_seleccionar_personas
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_seleccionar_personas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_seleccionar_personas`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cPerApellidos varchar(500), cPerNombre varchar(500), cPerDocNumero varchar(500), cPerMail varchar(500))
BEGIN

	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('SELECT persona.cPerCodigo,
				persona.cPerNombre,
				persona.cPerApellidos AS Apellidos ,
				IFNULL(pertelefono.nPerTelTipo,"-") nPerTelTipo,
				IFNULL(pertelefono.cPerTelNumero,"-") cPerTelNumero,
				IFNULL(permail.cPerMail,"-") cPerMail,
				IFNULL(perdocumento.cPerDocNumero,"-") cPerDocNumero,
				IFNULL(pernatural.nPerNatEstCivil,"-")nPerNatEstCivil,
				IFNULL(perdireccion.cPerDirDescripcion,"-") cPerDirDescripcion,
				RIGHT(persona.cPerCodigo,5)
		FROM	pernatural
		Inner Join persona ON persona.cPerCodigo = pernatural.cPerCodigo
		Left Join permail ON persona.cPerCodigo = permail.cPerCodigo
		Left Join perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo AND perdocumento.nPerDocTipo = 2
		Left Join perdireccion ON persona.cPerCodigo = perdireccion.cPerCodigo AND perdireccion.nPerDirTipo	= 1
		Left Join pertelefono ON persona.cPerCodigo = pertelefono.cPerCodigo AND pertelefono.nPerTelTipo = 2
		WHERE   persona.nPerTipo     = 1
    AND persona.nPerEstado       <>0
		AND( ("',cPerNombre,'" ="-"  ) OR ( persona.cPerNombre like "',cPerNombre,'%") )
		AND( ("',cPerApellidos,'" ="-"  ) OR (persona.cPerApellidos like "',cPerApellidos,'%") )
		AND( ("',cPerMail,'" ="-" ) OR ( permail.cPerMail like "',cPerMail,'%") )
		AND( ("',cPerDocNumero,'" ="-"  ) OR ( perdocumento.cPerDocNumero like"',cPerDocNumero,'%"))
		ORDER BY persona.cPerApellidos, persona.cPerNombre DESC
		LIMIT  ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

	ELSE

		SELECT 	persona.cPerCodigo,
				persona.cPerNombre,
				Case(concat(pernatural.cPerNatApePaterno,'  ' , pernatural.cPerNatApeMaterno)/'-')
					When 1 then 'No Registrado'
					Else concat(pernatural.cPerNatApePaterno,'  ' , pernatural.cPerNatApeMaterno)
				End AS Apellidos ,
				IFNULL(pertelefono.nPerTelTipo,'-') nPerTelTipo,
				IFNULL(pertelefono.cPerTelNumero, '-') cPerTelNumero,
				IFNULL(permail.cPerMail, '-') cPerMail,
				IFNULL(perdocumento.cPerDocNumero, '-') cPerDocNumero,
				IFNULL(pernatural.nPerNatEstCivil, '-')nPerNatEstCivil,
				IFNULL(perdireccion.cPerDirDescripcion, '-') cPerDirDescripcion,
				RIGHT(persona.cPerCodigo,5)
		FROM	pernatural
		Inner Join persona 		 ON persona.cPerCodigo = pernatural.cPerCodigo
		Left Join permail 		 ON persona.cPerCodigo = permail.cPerCodigo
		Left Join perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo AND perdocumento.nPerDocTipo = 2
		Left Join perdireccion ON persona.cPerCodigo = perdireccion.cPerCodigo AND perdireccion.nPerDirTipo	= 1
		Left Join pertelefono  ON persona.cPerCodigo = pertelefono.cPerCodigo AND pertelefono.nPerTelTipo = 2		
		WHERE persona.nPerTipo  = 1
    AND persona.nPerEstado  <>0
		AND( (cPerNombre ='-') 		OR ( persona.cPerNombre like concat(cPerNombre,'%')) )
		AND( (cPerApellidos ='-') OR ( concat(pernatural.cPerNatApePaterno,' ' , pernatural.cPerNatApeMaterno) like concat(cPerApellidos,'%') ) )
		AND( (cPerMail ='-') 			OR ( permail.cPerMail like concat(cPerMail,'%') ) )
		AND( (cPerDocNumero ='-') OR ( perdocumento.cPerDocNumero like concat(cPerDocNumero,'%')) )
		ORDER BY concat(pernatural.cPerNatApePaterno,' ' , pernatural.cPerNatApeMaterno), persona.cPerNombre DESC;

	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Seleccionar_Personas_nPerTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Seleccionar_Personas_nPerTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Seleccionar_Personas_nPerTipo`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cPerApellidos varchar(500), cPerNombre varchar(500), cPerDocNumero varchar(500), nPerRelTipo INT(11))
BEGIN
	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('
					SELECT 		
										persona.cPerCodigo, persona.nPerTipo, 
										persona.cPerNombre, persona.cPerApellidos,	
										perdocumento.nPerDocTipo, perdocumento.cPerDocNumero,
										perrelacion.nPerRelTipo, perrelacion.cPerJuridica,
										perdireccion.cPerDirDescripcion
						FROM persona 
						INNER JOIN perrelacion  ON persona.cPerCodigo = perrelacion.cPerCodigo
						INNER JOIN perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo
						INNER JOIN pernatural   ON persona.cPerCodigo = pernatural.cPerCodigo
						LEFT JOIN perdireccion ON persona.cPerCodigo = perdireccion.cPerCodigo
						WHERE persona.nPerTipo  = 1
						AND persona.nPerEstado  <>0
						AND perrelacion.nPerRelEstado = 1
						AND( ("',cPerNombre,'" ="-") 	 OR ( persona.cPerNombre like concat("',cPerNombre,'%")) )
						AND( ("',cPerApellidos,'" ="-") OR ( concat(pernatural.cPerNatApePaterno," " , pernatural.cPerNatApeMaterno) like concat("',cPerApellidos,'%") ) )		
						AND( ("',cPerDocNumero,'" ="-") OR ( perdocumento.cPerDocNumero like concat("',cPerDocNumero,'%")) )
						AND( (',nPerRelTipo,'=0) 			OR ( perrelacion.nPerRelTipo=',nPerRelTipo ,') )
						ORDER BY concat(pernatural.cPerNatApePaterno," " , pernatural.cPerNatApeMaterno), persona.cPerNombre DESC
					LIMIT  ',nOriReg,',',nCanReg);
					prepare consulta FROM @sentencia;
					execute consulta;

	ELSE
						SELECT 		
										persona.cPerCodigo, persona.nPerTipo, 
										persona.cPerNombre, persona.cPerApellidos,	
										perdocumento.nPerDocTipo, perdocumento.cPerDocNumero,	
										perrelacion.nPerRelTipo, perrelacion.cPerJuridica ,
										perdireccion.cPerDirDescripcion
						FROM persona 
						INNER JOIN perrelacion  ON persona.cPerCodigo = perrelacion.cPerCodigo
						INNER JOIN perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo
						INNER JOIN pernatural   ON persona.cPerCodigo = pernatural.cPerCodigo
						LEFT JOIN perdireccion ON persona.cPerCodigo = perdireccion.cPerCodigo
						WHERE persona.nPerTipo  = 1						
						AND persona.nPerEstado  <>0
						AND perrelacion.nPerRelEstado = 1
						AND( (cPerNombre ='-') 		OR ( persona.cPerNombre like concat(cPerNombre,'%')) )
						AND( (cPerApellidos ='-') OR ( concat(pernatural.cPerNatApePaterno,' ' , pernatural.cPerNatApeMaterno) like concat(cPerApellidos,'%') ) )		
						AND( (cPerDocNumero ='-') OR ( perdocumento.cPerDocNumero like concat(cPerDocNumero,'%')) )
						AND( (nPerRelTipo=0) 			OR ( perrelacion.nPerRelTipo=nPerRelTipo ) )
						ORDER BY concat(pernatural.cPerNatApePaterno,' ' , pernatural.cPerNatApeMaterno), persona.cPerNombre DESC;
		

	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Selecionar_Parametro_ParCoordena
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Selecionar_Parametro_ParCoordena`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Selecionar_Parametro_ParCoordena`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4),cParNombre varchar(100), cParDescripcion varchar(100),  nParClase INT(11))
BEGIN
IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('
			SELECT 
							parametro.nParCodigo, parametro.nParClase,
							parametro.cParJerarquia , parametro.cParDescripcion ,
							parametro.cParNombre, 
							parcoordenada.cParLatitud, parcoordenada.cParLonguitud,
							parcoordenada.cParAltitud,parcoordenada.cObservacion
					FROM parametro 	
					INNER JOIN  parcoordenada ON parametro.nParCodigo= parcoordenada.nParCodigo
					WHERE parametro.nParTipo=1000
					AND parcoordenada.nEstado=1 
					AND( ("',cParDescripcion ,'" ="-")	OR ( parametro.cParDescripcion like concat("',cParDescripcion ,'%")) )
					AND( ("',cParNombre ,'" ="-" ) 		OR ( parametro.cParNombre like concat("',cParNombre ,'%")) )		
					AND parametro.nParClase=',nParClase,' ORDER BY parametro.nParCodigo DESC 
				LIMIT  ',nOriReg,',',nCanReg,' ;');

				prepare consulta FROM @sentencia;
					execute consulta;

	ELSE

				SELECT 
						parametro.nParCodigo, parametro.nParClase,
						parametro.cParJerarquia , parametro.cParDescripcion ,
						parametro.cParNombre, 
						parcoordenada.cParLatitud, parcoordenada.cParLonguitud,
						parcoordenada.cParAltitud,parcoordenada.cObservacion
				FROM parametro 	
				INNER JOIN  parcoordenada ON parametro.nParCodigo= parcoordenada.nParCodigo
				WHERE parametro.nParTipo=1000
				AND parcoordenada.nEstado=1 
				AND( (cParDescripcion ='-')	OR ( parametro.cParDescripcion like concat(cParDescripcion ,'%')) )
				AND( (cParNombre ='-') 		OR ( parametro.cParNombre like concat(cParNombre,'%')) )		
				AND parametro.nParClase=nParClase
				ORDER BY parametro.nParCodigo DESC ;
		END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_SubPermisos_By_Usuario_Jerarquia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_SubPermisos_By_Usuario_Jerarquia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_SubPermisos_By_Usuario_Jerarquia`(nPerTipo int(4), nPerEstado int(4), nPerUsuEstado Int(4), nPerUsuAccEstado Int(4), nParClase Int(4), cPerCodigo  varchar(20), nCanJerarquia Int(4), cJerarquia nVarChar(50), nPerUsuAccGrupo Int(4), nParJerarquia Int(4))
BEGIN
	SELECT 
		persona.cPerCodigo,
		persona.cPerNombre,
		persona.nPerTipo,
		perusuacceso.nPerUsuAccGrupo,
    perusuacceso.nPerUsuAccCodigo,
		perusuacceso.nPerUsuAccEstado,
		parametro.cParJerarquia,
		parametro.cParNombre ,
    Concat(left(parametro.cParDescripcion,1),lower(right(parametro.cParDescripcion,(length(parametro.cParDescripcion)-1)))) AS NombreMenu,
		(length(parametro.cParJerarquia)) as CanJerarquia
	FROM persona
  INNER JOIN perusuario   ON persona.cPerCodigo    = perusuario.cPerCodigo
  INNER JOIN perusuacceso ON perusuario.cPerCodigo = perusuacceso.cPerCodigo
  INNER JOIN parametro    ON parametro.nParCodigo  = perusuacceso.nPerUsuAccCodigo AND  parametro.nParClase = perusuacceso.nPerUsuAccObjCodigo
	WHERE   persona.nPerTipo           = nPerTipo
  AND persona.nPerEstado             <> nPerEstado
  AND perusuario.nPerUsuEstado       <> nPerUsuEstado
  AND perusuacceso.nPerUsuAccEstado  <> nPerUsuAccEstado
  AND parametro.nParClase            = nParClase
  AND persona.cPerCodigo             = cPerCodigo
	AND LENGTH(parametro.cParJerarquia)= (nCanJerarquia+2)
	AND LEFT(parametro.cParJerarquia,nParJerarquia)= cJerarquia
	AND perusuacceso.nPerUsuAccGrupo	 = nPerUsuAccGrupo
	ORDER BY parametro.cParJerarquia ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Traslado_Encargado_Destino000
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Traslado_Encargado_Destino000`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Traslado_Encargado_Destino000`(cDocCodigo varchar(20))
BEGIN
	SELECT	persona.cPerCodigo,
					persona.cPerNombre,
					persona.cPerApellidos,
					almacen.cParNombre,
					almacen.cParDescripcion
	FROM persona 
	INNER JOIN parparametro AS relacion ON persona.cPerCodigo=relacion.nParSrcCodigo
	INNER JOIN parametro AS almacen ON almacen.nParCodigo=relacion.nParDstCodigo AND almacen.nParClase=1017
	WHERE relacion.nParSrcClase=2014 
	AND relacion.nParDstClase=1017
	AND almacen.nParCodigo IN (SELECT docbieregdistribucion.nAlmDestino
														 FROM docbieregdistribucion
														 WHERE docbieregdistribucion.cDocCodigo=cDocCodigo
														);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Get_Usuario_By_Clave_UserName
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Get_Usuario_By_Clave_UserName`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Get_Usuario_By_Clave_UserName`(cUserName varchar(50),cUserClave varchar(50))
BEGIN
	SELECT  perusuario.cPerCodigo,
		 persona.cPerNombre,
		 persona.cPerApellidos
	FROM    perusuario
	Inner Join persona ON persona.cPerCodigo = perusuario.cPerCodigo
	WHERE   perusuario.cPerUsuCodigo  =cUserName
  AND perusuario.cPerUsuClave   = cUserClave
  AND perusuario.nPerUsuEstado  <> 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_Ficha3
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_Ficha3`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_Ficha3`(nOriReg int(4), nCanReg int(4), nPagRegistro int(4) , nombres varchar(1000))
BEGIN
	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT(' 
					SELECT ficha_p.nParCodigo AS nFicCodigo,
					 ficha_d.cDocCodigo AS cFicCodigo,
					 DATE_FORMAT(ficha_d.dDocFecha, "%d/%m/%Y") AS dFicFecha ,
						persona.cPerCodigo, CONCAT(persona.cPerNombre," ", persona.cPerApellidos) AS nombres
					FROM  parametro AS ficha_p 
					INNER JOIN docparametro  ON docparametro.nParCodigo = ficha_p.nParCodigo AND ficha_p.nParClase=2066 
																																													AND docparametro.nParClase=2066
					INNER JOIN documentos AS ficha_d ON   docparametro.cDocCodigo = ficha_d.cDocCodigo
					INNER JOIN docpersona AS pescador ON ficha_d.cDocCodigo=pescador.cDocCodigo AND pescador.nDocTipo=1009 
																																															AND pescador.nDocPerTipo=14
																																															AND pescador.nPerRelacion=2005
									INNER JOIN persona ON pescador.cPerCodigo=persona.cPerCodigo
					WHERE  ficha_p.nParTipo = 1000 
				  AND 	( ("',nombres,'" = "-") 				OR (CONCAT(persona.cPerNombre," ", persona.cPerApellidos) LIKE "',nombres,'%") )
					ORDER BY  DATE_FORMAT(ficha_d.dDocFecha, "%d/%m/%Y") DESC
						LIMIT  ',nOriReg,',',nCanReg,';');
					prepare consulta FROM @sentencia;
					execute consulta;

	ELSE
		
					SELECT ficha_p.nParCodigo AS nFicCodigo,
					 ficha_d.cDocCodigo AS cFicCodigo,
					 DATE_FORMAT(ficha_d.dDocFecha, '%d/%m/%Y') AS dFicFecha ,
						persona.cPerCodigo, CONCAT(persona.cPerNombre,' ', persona.cPerApellidos) AS nombres
					FROM  parametro AS ficha_p
					INNER JOIN docparametro  ON docparametro.nParCodigo = ficha_p.nParCodigo AND ficha_p.nParClase=2066 
																																													AND docparametro.nParClase=2066
					INNER JOIN documentos AS ficha_d ON   docparametro.cDocCodigo = ficha_d.cDocCodigo
					INNER JOIN docpersona AS pescador ON ficha_d.cDocCodigo=pescador.cDocCodigo AND pescador.nDocTipo=1009 
																																															AND pescador.nDocPerTipo=14
																																															AND pescador.nPerRelacion=2005
									INNER JOIN persona ON pescador.cPerCodigo=persona.cPerCodigo
					WHERE  ficha_p.nParTipo = 1000 
					AND 	( (nombres ='-' ) 				OR (CONCAT(persona.cPerNombre,' ', persona.cPerApellidos) LIKE CONCAT(nombres ,'%')) )
					ORDER BY  DATE_FORMAT(ficha_d.dDocFecha, '%d/%m/%Y') DESC ;
	END IF ;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_Fichas
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_Fichas`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_Fichas`(nOriReg int(4), nCanReg int(4), nPagRegistro int(4), nDocTipo int(4), nombres varchar(1000), cParNombre varchar(1000), cParDescripcion varchar(1000))
BEGIN

	IF  (nPagRegistro = 1 ) THEN

		SET @sentencia = CONCAT('SELECT 	ficha_p.nParCodigo AS nFicCodigo, ficha_d.cDocCodigo cFicCodigo, DATE_FORMAT(ficha_d.dDocFecha, "%d/%m/%Y") AS dFicFecha,
																		embarcacion_p.nParCodigo AS nEmbCodigo, embarcacion_p.cParNombre AS cEmbNombre, embarcacion_p.cParDescripcion AS cEmbDescripcion,
																		persona.cPerCodigo, CONCAT(persona.cPerNombre," ",persona.cPerApellidos) AS nombres
														FROM parametro AS ficha_p
														INNER JOIN docparametro AS ficha ON ficha_p.nParCodigo=ficha.nParCodigo AND ficha_p.nParClase=2066 
																																																		AND ficha.nParClase=2066
														INNER JOIN documentos AS ficha_d ON ficha.cDocCodigo=ficha_d.cDocCodigo
														INNER JOIN docparametro AS embarcacion ON ficha_d.cDocCodigo=embarcacion.cDocCodigo AND ficha_d.nDocTipo=',nDocTipo,'
																																																								AND embarcacion.nParClase=2042
														INNER JOIN parametro AS embarcacion_p ON embarcacion.nParCodigo=embarcacion_p.nParCodigo AND embarcacion_p.nParClase=2042
														INNER JOIN docpersona AS pescador ON ficha_d.cDocCodigo=pescador.cDocCodigo AND pescador.nDocTipo=',nDocTipo,'
																																																				AND pescador.nDocPerTipo=14
																																																				AND pescador.nPerRelacion=2005
														INNER JOIN persona ON pescador.cPerCodigo=persona.cPerCodigo

														WHERE ( ("',cParNombre,'" = "-") 			OR (embarcacion_p.cParNombre 															LIKE "',cParNombre,'%") )
														AND 	( ("',cParDescripcion,'" = "-") OR (embarcacion_p.cParDescripcion 												LIKE "',cParDescripcion,'%") )
														AND 	( ("',nombres,'" = "-") 				OR (CONCAT(persona.cPerNombre," ", persona.cPerApellidos) LIKE "',nombres,'%") )
														AND 	ficha_d.nDocTipo=',nDocTipo,'
														ORDER BY ficha_p.cParJerarquia ASC
														LIMIT  ',nOriReg,',',nCanReg,';');
					prepare consulta FROM @sentencia;
					execute consulta;

	ELSE
				SELECT 	ficha_p.nParCodigo AS nFicCodigo, ficha_d.cDocCodigo cFicCodigo, DATE_FORMAT(ficha_d.dDocFecha, '%d/%m/%Y') AS dFicFecha,
								embarcacion_p.nParCodigo AS nEmbCodigo, embarcacion_p.cParNombre AS cEmbNombre, embarcacion_p.cParDescripcion AS cEmbDescripcion,
								persona.cPerCodigo, CONCAT(persona.cPerNombre,' ', persona.cPerApellidos) AS nombres
				FROM parametro AS ficha_p
				INNER JOIN docparametro AS ficha ON ficha_p.nParCodigo=ficha.nParCodigo AND ficha_p.nParClase=2066 
																																								AND ficha.nParClase=2066
				INNER JOIN documentos AS ficha_d ON ficha.cDocCodigo=ficha_d.cDocCodigo
				INNER JOIN docparametro AS embarcacion ON ficha_d.cDocCodigo=embarcacion.cDocCodigo AND ficha_d.nDocTipo=nDocTipo 
																																														AND embarcacion.nParClase=2042
				INNER JOIN parametro AS embarcacion_p ON embarcacion.nParCodigo=embarcacion_p.nParCodigo AND embarcacion_p.nParClase=2042
				INNER JOIN docpersona AS pescador ON ficha_d.cDocCodigo=pescador.cDocCodigo AND pescador.nDocTipo=nDocTipo 
																																										AND pescador.nDocPerTipo=14
																																										AND pescador.nPerRelacion=2005
				INNER JOIN persona ON pescador.cPerCodigo=persona.cPerCodigo
				WHERE ( (cParNombre ='-' ) 			OR (embarcacion_p.cParNombre 															LIKE CONCAT(cParNombre ,'%')) )
				AND 	( (cParDescripcion ='-' ) OR (embarcacion_p.cParDescripcion 												LIKE CONCAT(cParDescripcion ,'%')) )
				AND 	( (nombres ='-' ) 				OR (CONCAT(persona.cPerNombre,' ', persona.cPerApellidos) LIKE CONCAT(nombres ,'%')) )
				AND ficha_d.nDocTipo=nDocTipo
		ORDER BY ficha_p.cParJerarquia ASC;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_Parametro_by_cParDescripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_Parametro_by_cParDescripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_Parametro_by_cParDescripcion`(nParClase int(4), cParDescripcion varchar(1000))
BEGIN
	#Routine body goes here...
	SELECT parametro.nParCodigo, parametro.cParNombre, parametro.cParDescripcion
	FROM parametro
	WHERE parametro.nParClase=nParClase
	AND ( (cParDescripcion ='-' ) OR ( parametro.cParDescripcion LIKE CONCAT(cParDescripcion ,'%')) )
	AND parametro.nParTipo<>0
	LIMIT 5;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_Parametro_by_nParCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_Parametro_by_nParCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_Parametro_by_nParCodigo`(nParClase int(4), nParCodigo int(4))
BEGIN
	#Routine body goes here...
	SELECT parametro.nParCodigo, parametro.cParNombre, parametro.cParDescripcion
	FROM parametro
	WHERE parametro.nParClase=nParClase
	AND parametro.nParCodigo=nParCodigo
	LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_ParCoordenada_by_nParCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_ParCoordenada_by_nParCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_ParCoordenada_by_nParCodigo`(nParClase int(4), nParCodigo int(4))
BEGIN
	#Routine body goes here...
	SELECT parcoordenada.cParLatitud, parcoordenada.cParLonguitud, parcoordenada.cParAltitud
	FROM parcoordenada
	WHERE parcoordenada.nParClase=nParClase
	AND parcoordenada.nParCodigo=nParCodigo
	LIMIT 1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_ParDetalle
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_ParDetalle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_ParDetalle`(nOriReg int(4), nCanReg int(4), nPagRegistro int(4), nParClase int(4), nParItem int(4), nParItemS Int(4), cParDetTexto text, cParDetTxtRef varchar(1000))
BEGIN

		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('
																SELECT	parametro.nParCodigo, 
																				parametro.cParNombre, 
																				pardetalle.cParDetTexto, 
																				pardetalle.cParDetTxtRef, 
																				parametro.nParTipo
																FROM pardetalle
																INNER JOIN parametro ON pardetalle.nParCodigo=parametro.nParCodigo
																WHERE parametro.nParTipo<>0
																AND 	parametro.nParClase	=',nParClase,'	
																AND 	pardetalle.nParClase=',nParClase,'
																AND		pardetalle.nParItem	=',nParItem,'
																AND 	pardetalle.nParItemS=',nParItemS,'
																AND( ("',cParDetTexto  ,'" ="-"  ) OR (pardetalle.cParDetTexto LIKE "',cParDetTexto ,'%") )
																AND( ("',cParDetTxtRef  ,'" ="-"  ) OR (pardetalle.cParDetTxtRef LIKE "',cParDetTxtRef ,'%") )
																ORDER BY parametro.cParJerarquia  ASC
														LIMIT ',nOriReg,',',nCanReg,';');
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	parametro.nParCodigo, 
							parametro.cParNombre, 
							pardetalle.cParDetTexto, 
							pardetalle.cParDetTxtRef, 
							parametro.nParTipo
			FROM pardetalle
			INNER JOIN parametro ON pardetalle.nParCodigo=parametro.nParCodigo
			WHERE parametro.nParTipo<>0
			AND 	parametro.nParClase	=nParClase	
			AND 	pardetalle.nParClase=nParClase
			AND		pardetalle.nParItem	=nParItem
			AND 	pardetalle.nParItemS=nParItemS
			AND( (cParDetTexto  ='-' ) OR (pardetalle.cParDetTexto  LIKE CONCAT(cParDetTexto ,'%')) )
			AND( (cParDetTxtRef ='-' ) OR (pardetalle.cParDetTxtRef LIKE CONCAT(cParDetTxtRef,'%')) )
			ORDER BY parametro.cParJerarquia  ASC;

		END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_ParDetalle_by_nParCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_ParDetalle_by_nParCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_ParDetalle_by_nParCodigo`(nParClase int(4),nParCodigo int(4),nPatItemS int(4),nParItem int(4))
BEGIN
	#Routine body goes here...
	SELECT 
			pardetalle.nParCodigo , 
			pardetalle.cParDetTexto,
			pardetalle.cParDetTxtRef
	FROM pardetalle
	WHERE pardetalle.nParClase=nParClase
	AND pardetalle.nParCodigo=nParCodigo
	AND pardetalle.nParItemS=nPatItemS
	AND pardetalle.nParItem=nParItem;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_ParDetalle_cParDetTxtRef
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_ParDetalle_cParDetTxtRef`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_ParDetalle_cParDetTxtRef`(nOriReg int(4), nCanReg int(4), nPagRegistro int(4), nParClase int(4), nParItemS Int(4), nParItem int(4), cParNombre varchar(100), cParDescripcion varchar(100), cParDetTexto text, cParDetTxtRef varchar(1000),  visible_ varchar(100))
BEGIN

		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('
																SELECT	parametro.nParCodigo, 
																				parametro.cParJerarquia,
																				parametro.cParNombre,
																				parametro.cParDescripcion,
																				pardetalle.cParDetTxtRef AS enlace,
																				CASE parametro.nParTipo WHEN 1000 THEN "TODOS" WHEN 2000 THEN "USUARIOS" END AS visible, 
																				parametro.nParTipo
																FROM 				parametro
																INNER JOIN 	pardetalle ON parametro.nParCodigo=pardetalle.nParCodigo
																WHERE parametro.nParClase="',nParClase,'"
																AND 	pardetalle.nParClase="',nParClase,'"
																AND 	pardetalle.nParItem="',nParItem,'"
																AND 	pardetalle.nParItemS="',nParItemS,'"
																AND 	parametro.nParTipo<>0
																AND 		( ("',cParNombre,'" 		="-" ) OR (parametro.cParNombre  			LIKE "',cParNombre,'%") )
																AND 		( ("',cParDescripcion,'"="-" ) OR (parametro.cParDescripcion  LIKE "',cParDescripcion,'%") )
																AND 		( ("',cParDetTexto,'" 	="-" ) OR (pardetalle.cParDetTexto  	LIKE "',cParDetTexto,'%") )
																AND 		( ("',cParDetTxtRef,'" 	="-" ) OR (pardetalle.cParDetTxtRef  	LIKE "',cParDetTxtRef,'%") )
																HAVING  ( ("',visible_,'" 			="-" ) OR (visible  									LIKE "',visible_ ,'%") )
																ORDER BY parametro.cParJerarquia ASC
																LIMIT ',nOriReg,',',nCanReg,';');
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	parametro.nParCodigo, 
							parametro.cParJerarquia,
							parametro.cParNombre,
							parametro.cParDescripcion,
							pardetalle.cParDetTxtRef AS enlace,
							CASE parametro.nParTipo WHEN 1000 THEN 'TODOS' WHEN 2000 THEN 'USUARIOS' END AS visible, 
							parametro.nParTipo
			FROM 				parametro
			INNER JOIN 	pardetalle ON parametro.nParCodigo=pardetalle.nParCodigo
			WHERE parametro.nParClase=nParClase
			AND 	pardetalle.nParClase=nParClase
			AND 	pardetalle.nParItem=nParItem
			AND 	pardetalle.nParItemS=nParItemS
			AND 	parametro.nParTipo<>0
			AND 			( (cParNombre  			='-' ) OR (parametro.cParNombre  			LIKE CONCAT(cParNombre, '%')) )
			AND 			( (cParDescripcion 	='-' ) OR (parametro.cParDescripcion  LIKE CONCAT(cParDescripcion, '%')) )
			AND 			( (cParDetTexto 		='-' ) OR (pardetalle.cParDetTexto  	LIKE CONCAT(cParDetTexto, '%')) )
			AND 			( (cParDetTxtRef	 	='-' ) OR (pardetalle.cParDetTxtRef  	LIKE CONCAT(cParDetTxtRef, '%')) )
			HAVING  	( (visible_  				='-' ) OR (visible  									LIKE CONCAT(visible_, '%')) )
			ORDER BY 	parametro.cParJerarquia ASC;

		END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11))
BEGIN
				SELECT 
							parametro.cParNombre , 
							parametro.cParDescripcion  , 
							parparametro.nParSrcCodigo , 
							parparametro.nParDstCodigo ,
							parparametro.cValor
				FROM parametro 
				INNER JOIN parparametro ON parametro.nParCodigo = parparametro.nParSrcCodigo 
				WHERE parametro.nParClase = nParSrcClase 
				AND parparametro.nParSrcClase = nParSrcClase
				AND parparametro.nParDstClase = nParDstClase 
				AND parparametro.nParSrcCodigo = nParSrcCodigo 
				AND parparametro.nParDstCodigo = nParDstCodigo 
				AND	parparametro.nParEstado=1
				ORDER BY		parparametro.cValor DESC;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_ParParExt_by_nIntSrcCodigo_nIntDstCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_ParParExt_by_nIntSrcCodigo_nIntDstCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_ParParExt_by_nIntSrcCodigo_nIntDstCodigo`(nIntSrcClase int(4), nIntSrcCodigo int(4), nIntDstClase int(4), nIntDstCodigo int(4), nObjTipo int(4))
BEGIN
	#Routine body goes here...
		SELECT 
					parametro.nParCodigo,
					parametro.cParNombre,
					parametro.cParDescripcion,
					parparext.nObjCodigo,
					parparext.cValor
		FROM parparext
		INNER JOIN parparametro ON parparametro.nParSrcCodigo=parparext.nIntSrcCodigo
														AND parparametro.nParSrcClase=parparext.nIntSrcClase
														AND parparametro.nParDstCodigo=parparext.nIntDstCodigo													
														AND parparametro.nParDstClase=parparext.nIntDstClase
		INNER JOIN parametro 		ON parametro.nParCodigo=parparametro.nParSrcCodigo
														AND parametro.nParClase=parparametro.nParSrcClase
		WHERE parparext.nIntSrcClase	=nIntSrcClase
		AND parparext.nIntDstClase		=nIntDstClase 		
		AND parparext.nIntSrcCodigo		=nIntSrcCodigo
		AND parparext.nIntDstCodigo		=nIntDstCodigo
		AND parparext.nObjTipo				=nObjTipo
	;

	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_PerDireccion_by_cPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_PerDireccion_by_cPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_PerDireccion_by_cPerCodigo`(cPerCodigo varchar(20))
BEGIN
	#Routine body goes here...
	SELECT perdireccion.cPerDirDescripcion
	FROM perdireccion
	WHERE perdireccion.cPerCodigo=cPerCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_PerJuridica_by_nPerJurRubro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_PerJuridica_by_nPerJurRubro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_PerJuridica_by_nPerJurRubro`(nPerJurRubro int(11))
BEGIN

	SELECT persona.cPerCodigo, 
persona.cPerNombre, 
persona.cPerApellidos, 
perjuridica.cPerJurDescripcion, 
parametro.nParCodigo, 
parametro.cParDescripcion
	FROM persona
	INNER JOIN perjuridica ON persona.cPerCodigo=perjuridica.cPerCodigo
	INNER JOIN parametro ON perjuridica.nPerJurRubro=parametro.nParCodigo
	WHERE persona.nPerEstado=1
	AND	perjuridica.nPerJurRubro=nPerJurRubro
	AND parametro.nParClase=1006
	AND parametro.nParTipo=1000;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_PerNatural_by_cPerCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_PerNatural_by_cPerCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_PerNatural_by_cPerCodigo`(cPerCodigo varchar(20))
BEGIN
	#Routine body goes here...
	SELECT	persona.cPerCodigo, CONCAT(persona.cPerApellidos, ' ', persona.cPerNombre) AS cPerNombres
	FROM persona 
	INNER JOIN pernatural ON persona.cPerCodigo=pernatural.cPerCodigo
	WHERE persona.cPerCodigo=cPerCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_PerNatural_by_cPerNombre
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_PerNatural_by_cPerNombre`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_PerNatural_by_cPerNombre`(cPerNombre varchar(100))
BEGIN
	#Routine body goes here...

SELECT persona.cPerCodigo, CONCAT(persona.cPerApellidos,' ',persona.cPerNombre) AS cPerNombre, perdocumento.cPerDocNumero
	FROM persona
	INNER JOIN pernatural ON persona.cPerCodigo=pernatural.cPerCodigo
	INNER JOIN perdocumento ON pernatural.cPerCodigo=perdocumento.cPerCodigo
	WHERE perdocumento.nPerDocTipo=1
	AND ( (cPerNombre ='-' ) OR ( CONCAT(persona.cPerApellidos,' ',persona.cPerNombre) LIKE CONCAT(cPerNombre ,'%')) )
LIMIT 10 ;

/*
	SELECT persona.cPerCodigo, CONCAT(persona.cPerApellidos,' ',persona.cPerNombre) AS cPerNombre
	FROM persona
	INNER JOIN pernatural ON persona.cPerCodigo=pernatural.cPerCodigo
	AND ( (cPerNombre ='-' ) OR ( CONCAT(persona.cPerApellidos,' ',persona.cPerNombre) LIKE CONCAT(cPerNombre ,'%')) )

	LIMIT 10;*/

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_get_Persona_By_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_get_Persona_By_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_get_Persona_By_nPerRelTipo`(cPerCodigo varchar(20) , nPerRelTipo int(4))
BEGIN

						SELECT 		
										persona.cPerCodigo, 									
										persona.cPerNombre, 
										persona.cPerApellidos,	
										perdocumento.nPerDocTipo, 
										perdocumento.cPerDocNumero,	
										perrelacion.nPerRelTipo, 
										perrelacion.cPerJuridica
						FROM persona 
						INNER JOIN perrelacion  ON persona.cPerCodigo = perrelacion.cPerCodigo
						INNER JOIN perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo
						INNER JOIN pernatural   ON persona.cPerCodigo = pernatural.cPerCodigo
						WHERE persona.nPerTipo  = 1						
						AND persona.nPerEstado  <>0
						AND perrelacion.nPerRelEstado = 1					
						AND( (nPerRelTipo=0 ) 			OR ( perrelacion.nPerRelTipo=nPerRelTipo ) )
						AND ((cPerCodigo=0 ) OR (persona.cPerCodigo = cPerCodigo ))
						ORDER BY concat(pernatural.cPerNatApePaterno,' ' , pernatural.cPerNatApeMaterno), persona.cPerNombre DESC;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Reporte_Ficha2
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Reporte_Ficha2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Reporte_Ficha2`(nDocTipo INT(4) , nParCodigoDesembarque int(11) , FechaInic  varchar(15) , FechaFin varchar(15) , nPerCodigo varchar(20) , nParCodigoEmbarcaion int(11) )
BEGIN
		-- sql para los reportes ficha socio economica 
		SELECT 
					ficha_p.nParCodigo AS nFicCodigo, 
					ficha_d.cDocCodigo cFicCodigo, 
					DATE_FORMAT(ficha_d.dDocFecha, '%d/%m/%Y') AS dFicFecha,
					embarcacion_p.nParCodigo AS nEmbCodigo, 
					embarcacion_p.cParNombre AS cEmbNombre, 
					embarcacion_p.cParDescripcion AS cEmbDescripcion,
					desembarque_p.nParCodigo AS nDesCodigo , 
					desembarque_p.cParDescripcion AS cDesDescripcion , 
					persona.cPerCodigo, 
					perdocumento.cPerDocNumero ,
					CONCAT(persona.cPerNombre,' ', persona.cPerApellidos) AS nombres

						FROM parametro AS ficha_p
						INNER JOIN docparametro AS ficha ON ficha_p.nParCodigo=ficha.nParCodigo AND ficha_p.nParClase=2066 
																																										AND ficha.nParClase=2066
						INNER JOIN documentos AS ficha_d ON ficha.cDocCodigo=ficha_d.cDocCodigo
						INNER JOIN docparametro AS embarcacion ON ficha_d.cDocCodigo=embarcacion.cDocCodigo AND embarcacion.nParClase=2042

						INNER JOIN parametro AS embarcacion_p ON embarcacion.nParCodigo=embarcacion_p.nParCodigo AND embarcacion_p.nParClase=2042
						INNER JOIN docpersona AS pescador ON ficha_d.cDocCodigo=pescador.cDocCodigo AND pescador.nDocPerTipo=14
																																												AND pescador.nPerRelacion=2005
						INNER JOIN persona ON pescador.cPerCodigo=persona.cPerCodigo 
						INNER JOIN perdocumento ON perdocumento.cPerCodigo = persona.cPerCodigo AND perdocumento.nPerDocTipo = 1 
						
						
						INNER JOIN docparametro AS desembarque ON  ficha_d.cDocCodigo=desembarque.cDocCodigo AND desembarque.nParClase=2040
						INNER JOIN parametro AS desembarque_p  ON  desembarque.nParCodigo=desembarque_p.nParCodigo AND desembarque_p.nParClase=2040
		WHERE 
			 ficha_d.nDocTipo=nDocTipo  -- 1008: FICHA 2 
			AND ( (nParCodigoDesembarque = 0 ) OR (desembarque_p.nParCodigo =nParCodigoDesembarque) )
			AND ( (FechaInic = '-') OR (ficha_d.dDocFecha >= FechaInic ) )
	    AND ( (FechaFin  = '-') OR (ficha_d.dDocFecha <= FechaFin  ) )
			AND ( (nPerCodigo= '-') OR (persona.cPerCodigo = nPerCodigo ) )
			AND ( (nParCodigoEmbarcaion  = 0 ) OR (embarcacion_p.nParCodigo=nParCodigoEmbarcaion  ) )

		ORDER BY 	CONCAT(persona.cPerNombre,' ', persona.cPerApellidos) , cEmbDescripcion ASC 

;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Seleccionar_Parametro_By_nParClase
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Seleccionar_Parametro_By_nParClase`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Seleccionar_Parametro_By_nParClase`(nParClase int(11))
BEGIN
	SELECT parametro.nParCodigo,
			 parametro.cParNombre,
			 parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParClase	= nParClase
		AND parametro.nParTipo 		= 1000	
		ORDER BY parametro.cParDescripcion ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_DocDepartamento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_DocDepartamento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_DocDepartamento`(cDocCodigo varchar(20), nParCodigo INT(11), nParClase INT(11) , cDocDepValor varchar(20), cDocDepGlosa varchar(300))
BEGIN

	 INSERT INTO docdepartamento (
				docdepartamento.cDocCodigo, 
				docdepartamento.nParCodigo, 
				docdepartamento.nParClase, 
				docdepartamento.cDocDepValor, 
				docdepartamento.cDocDepGlosa
				) 
		VALUES (cDocCodigo, nParCodigo, nParClase, cDocDepValor, cDocDepGlosa);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_DocDistrito
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_DocDistrito`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_DocDistrito`(cDocCodigo varchar(20), nParCodigo INT(11), nParClase INT(11) , cDocDisValor varchar(20), cDocDisGlosa varchar(300))
BEGIN

	 INSERT INTO docdistrito (
				docdistrito.cDocCodigo, 
				docdistrito.nParCodigo, 
				docdistrito.nParClase, 
				docdistrito.cDocDisValor, 
				docdistrito.cDocDisGlosa
				) 
		VALUES (cDocCodigo, nParCodigo, nParClase, cDocDisValor, cDocDisGlosa);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_DocPais
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_DocPais`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_DocPais`(cDocCodigo varchar(20), nParCodigo INT(11), nParClase INT(11) , cDocPaiValor varchar(20), cDocPaiGlosa varchar(300))
BEGIN

	 INSERT INTO docpais (
				docpais.cDocCodigo, 
				docpais.nParCodigo, 
				docpais.nParClase, 
				docpais.cDocPaiValor, 
				docpais.cDocPaiGlosa
				) 
		VALUES (cDocCodigo, nParCodigo, nParClase, cDocPaiValor, cDocPaiGlosa);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_set_DocParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_set_DocParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_set_DocParametro`(cDocCodigo varchar(50), nParClase int(11), nParCodigo int(11), cDocParObservacion varchar(100))
BEGIN
	
	INSERT INTO docparametro(docparametro.cDocCodigo,
													docparametro.nParClase,
													docparametro.nParCodigo,
													docparametro.cDocParObservacion)
	VALUES(cDocCodigo,
				nParClase,
				nParCodigo,
				cDocParObservacion);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_set_DocPersona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_set_DocPersona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_set_DocPersona`(cDocCodigo varchar(20), nDocPerTipo int(11), cPerCodigo varchar(20), nPerRelacion int(11),  nDocTipo int(11))
BEGIN
	
	INSERT INTO docpersona(docpersona.cDocCodigo,
												 docpersona.nDocPerTipo,
												 docpersona.cPerCodigo,
												 docpersona.nPerRelacion,
												 docpersona.nDocTipo)
	VALUES(cDocCodigo,
				 nDocPerTipo,
				 cPerCodigo,
				 nPerRelacion,
				 nDocTipo);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_DocPresupuesto
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_DocPresupuesto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_DocPresupuesto`(cDocCodigo varchar(20) , nParCodigo INT(11) , nParClase INT(11) , cDocPreValor VARCHAR(100) , cDocParGlosa VARCHAR(250))
BEGIN
		INSERT INTO docpresupuesto (
			docpresupuesto.cDocCodigo, 
			docpresupuesto.nParCodigo, 
			docpresupuesto.nParClase, 
			docpresupuesto.cDocPreValor, 
			docpresupuesto.cDocParGlosa, 
			docpresupuesto.nDocPreEstado
			)
			 VALUES (cDocCodigo, nParCodigo, nParClase, cDocPreValor, cDocParGlosa, 1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_DocProvincia
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_DocProvincia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_DocProvincia`(cDocCodigo varchar(20), nParCodigo INT(11), nParClase INT(11) , cDocProValor varchar(20), cDocProGlosa varchar(300))
BEGIN

	 INSERT INTO docprovincia (
				docprovincia.cDocCodigo, 
				docprovincia.nParCodigo, 
				docprovincia.nParClase, 
				docprovincia.cDocProValor, 
				docprovincia.cDocProGlosa
				) 
		VALUES (cDocCodigo, nParCodigo, nParClase, cDocProValor, cDocProGlosa);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_set_Documento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_set_Documento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_set_Documento`(dDocFecha varchar(20), cDocObserv varchar(1000), nDocTipo int(11))
BEGIN


	-- GENERANDO CODIGO UNICO
	SELECT @pcDocCodigo := RIGHT(UUID_SHORT(),14);
	
	-- SENTENCIA1: registrar documento de compra
	INSERT INTO documentos (documentos.cDocCodigo, 
													documentos.dDocFecha, 
													documentos.cDocObserv, 
													documentos.nDocTipo, 
													documentos.nEstado)
	VALUES(@pcDocCodigo, 
				STR_TO_DATE(dDocFecha,'%d/%m/%Y'),
				cDocObserv,
				nDocTipo,
				1);


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_set_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_set_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_set_Parametro`(cParNombre varchar(1000), cParDescripcion varchar(1000), nParClase int(11))
BEGIN
	DECLARE nParCodigo INT;
	DECLARE cParJerarquia VARCHAR(50);

  SELECT 	IFNULL( MAX(parametro.nParCodigo)+1 , 1 ) INTO nParCodigo
	FROM		parametro
	WHERE		parametro.nParClase = nParClase;

  SELECT 	LPAD(IFNULL( MAX(parametro.cParJerarquia)+1 , 1001 ),4,'0') INTO cParJerarquia
	FROM 		parametro
	WHERE 	parametro.nParClase=nParClase;

	INSERT INTO parametro (parametro.nParCodigo,
												 parametro.nParClase,
												 parametro.cParJerarquia,
												 parametro.cParNombre,
												 parametro.cParDescripcion,
												 parametro.nParTipo)
  VALUES(nParCodigo, nParClase, cParJerarquia, cParNombre, cParDescripcion,	1000);

	SELECT nParCodigo, cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_set_ParDetalle
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_set_ParDetalle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_set_ParDetalle`(nParCodigo int(4), nParClase int(4), nParItem int(4), nParItemS int(4), cParDetTexto text, cParDetTxtRef varchar(1000))
BEGIN
	#Routine body goes here...
	INSERT INTO pardetalle (pardetalle.nParCodigo, 
													pardetalle.nParClase, 
													pardetalle.nParItem,
													pardetalle.nParItemS,
													pardetalle.cParDetTexto,
													pardetalle.cParDetTxtRef)
	VALUES(	nParCodigo, 
					nParClase, 
					nParItem, 
					nParItemS, 
					cParDetTexto, 
					cParDetTxtRef);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_set_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_set_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_set_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cValor varchar(100))
BEGIN
	
		INSERT INTO parparametro (parparametro.nParSrcCodigo,
															parparametro.nParSrcClase,
															parparametro.nParDstCodigo,
															parparametro.nParDstClase,
															parparametro.cValor,
															parparametro.nParEstado)
		VALUES (nParSrcCodigo,
						nParSrcClase,
						nParDstCodigo,
						nParDstClase,
						cValor,
						1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_set_ParParExt
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_set_ParParExt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_set_ParParExt`(nIntSrcCodigo Int(11), nIntSrcClase Int(11), nIntDstCodigo Int(11), nIntDstClase Int(11), nObjCodigo Int(11), nObjTipo Int(11), cValor Varchar(1000))
BEGIN
	#Routine body goes here...
	INSERT INTO parparext (parparext.nIntSrcCodigo, parparext.nIntSrcClase,
												 parparext.nIntDstCodigo, parparext.nIntDstClase,
												 parparext.nObjCodigo, parparext.nObjTipo,
												 parparext.cValor)
	VALUES(	nIntSrcCodigo, nIntSrcClase, 
					nIntDstCodigo, nIntDstClase, 
					nObjCodigo, nObjTipo, 
					cValor);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_PerDomicilio
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_PerDomicilio`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_PerDomicilio`(cPerCodigo VARCHAR(20), nParCodigo INT(11) , nParClase INT(11), cPerDomValor VARCHAR(250), dPerDomFecha DATE)
BEGIN
		
		INSERT INTO perdomicilio (
						perdomicilio.cPerCodigo, 
						perdomicilio.nParCodigo, 
						perdomicilio.nParClase, 
						perdomicilio.cPerDomValor, 
						perdomicilio.dPerDomFecha, 
						perdomicilio.nPerDomEstado
						) 
		VALUES (cPerCodigo, nParCodigo, nParClase, cPerDomValor, dPerDomFecha, 1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_PerGrado
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_PerGrado`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_PerGrado`(cPerCodigo VARCHAR(20) , nParCodigo INT(11), nParClase INT(11), nPerGraValor INT(11), cPerGraGlosa VARCHAR(500), dPerGraGlosa DATE)
BEGIN
	INSERT INTO pergrado (
			pergrado.cPerCodigo, 
			pergrado.nParCodigo, 
			pergrado.nParClase, 
			pergrado.nPerGraValor, 
			pergrado.cPerGraGlosa, 
			pergrado.dPerGraGlosa, 
			pergrado.nPerGraEstado) 
	VALUES (cPerCodigo, nParCodigo, nParClase, nPerGraValor, cPerGraGlosa, dPerGraGlosa, 1);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Set_PerParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Set_PerParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Set_PerParametro`(cPerCodigo VARCHAR(20), nParCodigo INT(11), nParClase INT(11), nPerParValor  INT(1), cPerParGlosa VARCHAR(250))
BEGIN
		INSERT INTO perparametro (
				perparametro.cPerCodigo, 
				perparametro.nParCodigo, 
				perparametro.nParClase, 
				perparametro.nPerParValor, 
				perparametro.cPerParGlosa, 
				perparametro.nPerParEstado
				) 
		VALUES (cPerCodigo, nParCodigo, nParClase, nPerParValor, cPerParGlosa, 1);


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_grl_Upd_PerNatural_nPerNatEstCivil
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_grl_Upd_PerNatural_nPerNatEstCivil`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_grl_Upd_PerNatural_nPerNatEstCivil`(cPerCodigo varchar(20), nPerNatEstCivil INT(4))
BEGIN
	
	UPDATE pernatural
	SET pernatural.nPerNatEstCivil=nPerNatEstCivil
	WHERE pernatural.cPerCodigo=cPerCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_Documento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_Documento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_Documento`(dDocFecha varchar(50), cDocObserv varchar(100), nDocTipo int(11), nEstado int(11))
BEGIN

	-- GENERANDO CODIGO UNICO
 SELECT @pcDocCodigo := RIGHT(UUID_SHORT(),14);
	-- SENTENCIA1: registrar documento de compra

	INSERT INTO documentos (documentos.cDocCodigo, 
													documentos.dDocFecha, 
													documentos.cDocObserv, 
													documentos.nDocTipo, 
													documentos.nEstado)
	VALUES(@pcDocCodigo, 
				dDocFecha,
				cDocObserv,
				nDocTipo,
				nEstado);


		-- delvolvemos el codigo 
	SELECT  @pcDocCodigo AS pcDocCodigo  ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_Parametro`(cParNombre varchar(1000), cParDescripcion varchar(1000), nParClase int(11))
BEGIN
	DECLARE nParCodigo INT;
	DECLARE cParJerarquia VARCHAR(500);

  SELECT 	IFNULL( MAX(parametro.nParCodigo)+1 , 1 ) INTO nParCodigo
	FROM		parametro
	WHERE		parametro.nParClase = nParClase;

  SELECT 	LPAD(IFNULL( MAX(parametro.cParJerarquia)+1 , 1001 ),4,'0') INTO cParJerarquia
	FROM 		parametro
	WHERE 	parametro.nParClase=nParClase AND parametro.nParCodigo <> 0;

	INSERT INTO parametro (parametro.nParCodigo,
												 parametro.nParClase,
												 parametro.cParJerarquia,
												 parametro.cParNombre,
												 parametro.cParDescripcion,
												 parametro.nParTipo)
  VALUES(nParCodigo, nParClase, cParJerarquia, cParNombre, cParDescripcion,	1000);

	SELECT nParCodigo, cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_ParCoordenada
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_ParCoordenada`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_ParCoordenada`(nParCodigo INT(11), nParClase INT(11), cParLatitud VARCHAR(100), cParLonguitud VARCHAR(100),  cParAltitud VARCHAR(100),  cObservacion TEXT)
BEGIN
	INSERT INTO parcoordenada(parcoordenada.nParCodigo, parcoordenada.nParClase, parcoordenada.cParLatitud, 
		parcoordenada.cParLonguitud, parcoordenada.cParAltitud, parcoordenada.cObservacion, parcoordenada.nEstado) 
	VALUES (nParCodigo, nParClase, cParLatitud, cParLonguitud, cParAltitud, cObservacion, 1);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_ParDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_ParDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_ParDireccion`(nParCodigo INT(11), nParClase INT(11), cUbigCodigo varchar(20), cParGlosa TEXT)
BEGIN
	
	INSERT INTO pardireccion (nParCodigo, nParClase, cUbigCodigo, cParGlosa, nParDirEstado)
	VALUES (nParCodigo, nParClase, cUbigCodigo, cParGlosa, 1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cValor varchar(255), nParEstado int(11))
BEGIN

		INSERT INTO parparametro (parparametro.nParSrcCodigo,
															parparametro.nParSrcClase,
															parparametro.nParDstCodigo,
															parparametro.nParDstClase,
															parparametro.cValor,
															parparametro.nParEstado)
		VALUES (nParSrcCodigo ,
						nParSrcClase ,
						nParDstCodigo ,
						nParDstClase ,
						cValor ,
						nParEstado );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_PerDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_PerDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_PerDireccion`(cPerCodigo varchar(20), cPerDirDescripcion varchar(100), nPerDirTipo int(11), nUbiCodigo int(11))
BEGIN
	
INSERT INTO perdireccion (perdireccion.cPerCodigo,
												 perdireccion.cPerDirDescripcion,
												perdireccion.nPerDirTipo,
												perdireccion.nUbiCodigo)
VALUES(cPerCodigo, cPerDirDescripcion, nPerDirTipo, nUbiCodigo);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_PerDocumento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_PerDocumento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_PerDocumento`(cPerCodigo varchar(20), cPerDocNumero varchar(20), nPerDocCategoria int(11), dPerDocCaducidad varchar(20), nPerDocEstado int(11), nPerDocTipo int(11))
BEGIN
	
	INSERT INTO perdocumento(	perdocumento.cPerCodigo,
														perdocumento.nPerDocTipo ,
														perdocumento.cPerDocNumero, 
														perdocumento.nPerDocCategoria, 
														perdocumento.dPerDocCaducidad, 
														perdocumento.nPerDocEstado
														)
	VALUES(cPerCodigo,
				 nPerDocTipo ,
				 cPerDocNumero,
				 nPerDocCategoria,
				 dPerDocCaducidad,
				 nPerDocEstado
				 );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_PerJuridica
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_PerJuridica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_PerJuridica`(cPerCodigo varchar(20), nPerJurRubro int(11), nPerJurTipoEmpresa int(11), cPerJurDescripcion varchar(100), nPerEmpresa int(11))
BEGIN

	INSERT INTO perjuridica (perjuridica.cPerCodigo, 
														perjuridica.nPerJurRubro,
														perjuridica.nPerJurTipoEmpresa, 
														perjuridica.cPerJurDescripcion, 
														perjuridica.nPerEmpresa)
	VALUES(cPerCodigo,
					nPerJurRubro,
					nPerJurTipoEmpresa,
					cPerJurDescripcion,
					nPerEmpresa);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_PerNatural
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_PerNatural`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_PerNatural`(cPerCodigo varchar(20), cPerNatApePaterno varchar(100), cPerNatApeMaterno varchar(100), nPerNatSexo int(11), nPerNatEstCivil int(11))
BEGIN
	
	INSERT INTO pernatural(pernatural.cPerCodigo,
												pernatural.cPerNatApePaterno,
												pernatural.cPerNatApeMaterno,
												pernatural.nPerNatSexo,
												pernatural.nPerNatEstCivil)
	VALUES(cPerCodigo,
				cPerNatApePaterno,
				cPerNatApeMaterno,
				nPerNatSexo,
				nPerNatEstCivil);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_PerRelacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_PerRelacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_PerRelacion`(cPerCodigo varchar(20), cPerJuridica varchar(20), nPerRelTipo int(11))
BEGIN

		INSERT INTO perrelacion(perrelacion.cPerCodigo,
														perrelacion.nPerRelTipo,
														perrelacion.cPerJuridica,
														perrelacion.nPerRelEstado,
														perrelacion.dPerRelacion,
														perrelacion.cPerObservacion)
		VALUES(	cPerCodigo,
						nPerRelTipo,
						cPerJuridica,
						1,
						CURDATE(),
						IFNULL((SELECT parametro.cParDescripcion
						 FROM parametro
						 WHERE parametro.nParClase=1005
						 AND parametro.nParCodigo=nPerRelTipo),'-'));

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_Persona`(cPerNombre varchar(500), cPerApellidos varchar(500), dPerNacimiento varchar(20), nPerTipo int(11), nPerEstado int(11))
BEGIN
	/*generar codigo de persona*/
	SELECT @ncPerCodigo := RIGHT(UUID_SHORT(),10);
	/*registrar persona*/
	INSERT INTO persona(persona.cPerCodigo, 
											persona.cPerNombre, 
											persona.cPerApellidos, 
											persona.dPerNacimiento, 
											persona.nPerTipo, 
											persona.nPerEstado)
	VALUES (@ncPerCodigo, 
					cPerNombre, 
					cPerApellidos, 
					STR_TO_DATE(dPerNacimiento ,'%d-%m-%Y'), 
					nPerTipo, 
					nPerEstado); 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Ins_Transaccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Ins_Transaccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Ins_Transaccion`(nOpeCodigo int(11), cPerCodigo  varchar(20), cComputer varchar(250), cTraDescripcion varchar(250))
BEGIN

	insert into transaccion
		(cTraCodigo, nOpeCodigo, cPerCodigo, dTraFecha, cComputer, cTraDescripcion)
	values
		(CONCAT( CAST(replace(replace(replace(now(),'-',''),' ',''),':','') AS CHAR), LEFT(CAST(  REPLACE(UUID(),'-','') AS CHAR),36)),
		  nOpeCodigo,
		  cPerCodigo,
		  now(),
		  cComputer,
		  cTraDescripcion );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Precios_BienRegistro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Precios_BienRegistro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Precios_BienRegistro`(nBieRegCodigo int(11))
BEGIN
	
	SELECT precio.nParCodigo, precio.cParDescripcion, precios.cValor
	FROM bienregistro 			AS biereg
	INNER JOIN parametro 		AS producto ON producto.nParCodigo=biereg.nBieCodigo AND producto.nParClase=1010
	INNER JOIN parparametro	AS precios	ON precios.nParDstCodigo=producto.nParCodigo AND precios.nParDstClase=1010 AND precios.nParSrcClase=1016
	INNER JOIN parametro		AS precio		ON precio.nParCodigo=precios.nParSrcCodigo AND precio.nParClase=1016
	WHERE biereg.nBieRegCodigo=nBieRegCodigo
	AND 	precios.nParEstado=1
	AND 	precio.nParCodigo NOT IN(1,2)

	UNION

	SELECT 1, 'PRECIO VENTA', servicio.nSerImporte
	FROM bienregistro 				AS biereg
	INNER JOIN parametro 			AS producto ON producto.nParCodigo=biereg.nBieCodigo 		AND producto.nParClase=1010
	INNER JOIN ctacteservicio AS servicio ON servicio.nBieCodigo=producto.nParCodigo
	WHERE biereg.nBieRegCodigo=nBieRegCodigo
	 
	UNION

	SELECT 2, 'PRECIO COMPRA', kardex.fImporte
	FROM bienregistro AS biereg 
	INNER JOIN kardex ON biereg.nBieRegCodigo=kardex.nBieRegCodigo
	INNER JOIN parametro AS producto ON producto.nParCodigo=biereg.nBieCodigo AND producto.nParClase=1010
	WHERE kardex.nKarEstado=1
	AND biereg.nbieestado=1
	AND biereg.nBieRegCodigo=nBieRegCodigo
	ORDER BY nParCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_Parametro`(cParNombre varchar(1000), cParDescripcion varchar(1000), nParClase int(11))
BEGIN
	DECLARE nParCodigo INT;
	DECLARE cParJerarquia VARCHAR(500);

  SELECT 	IFNULL( MAX(parametro.nParCodigo)+1 , 1 ) INTO nParCodigo
	FROM		parametro
	WHERE		parametro.nParClase = nParClase;

  SELECT 	LPAD(IFNULL( MAX(parametro.cParJerarquia)+1 , 1001 ),4,'0') INTO cParJerarquia
	FROM 		parametro
	WHERE 	parametro.nParClase=nParClase;

	INSERT INTO parametro (parametro.nParCodigo,
												 parametro.nParClase,
												 parametro.cParJerarquia,
												 parametro.cParNombre,
												 parametro.cParDescripcion,
												 parametro.nParTipo)
  VALUES(nParCodigo, nParClase, cParJerarquia, cParNombre, cParDescripcion,	1000);

	SELECT nParCodigo, cParJerarquia;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11),cValor varchar(100),nParEstado int(11))
BEGIN
	INSERT INTO parparametro (parparametro.nParSrcCodigo,
														parparametro.nParSrcClase,
														parparametro.nParDstCodigo,
														parparametro.nParDstClase,
														parparametro.cValor,
														parparametro.nParEstado)
	VALUES (nParSrcCodigo,
					nParSrcClase,
					nParDstCodigo,
					nParDstClase,
					cValor,
					nParEstado);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_PerDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_PerDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_PerDireccion`(cPerCodigo varchar(20), cPerDirDescripcion varchar(500), nPerDirTipo int(11), nUbiCodigo int(11), cPerDirGlosa varchar(500), nPerRelTipo int(11))
BEGIN
	
INSERT INTO perdireccion (perdireccion.cPerCodigo,
													perdireccion.cPerDirDescripcion,
													perdireccion.nPerDirTipo,
													perdireccion.nUbiCodigo,
													perdireccion.cPerDirGlosa,
													perdireccion.nPerRelTipo,
												  perdireccion.nPerDirEstado)
VALUES(cPerCodigo, cPerDirDescripcion, nPerDirTipo, nUbiCodigo, cPerDirGlosa, nPerRelTipo, 1);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_PerJuridica
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_PerJuridica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_PerJuridica`(cPerNombre varchar(250), cPerDocNumero varchar(250),nPerRep int(11), nPerJurRubro Int(4), cPerDirDescripcion varchar(500), nPerCodigo varchar(20), cPerObservacion varchar(250))
BEGIN
	SELECT @pcPerCodigo := MAX(CAST((cPerCodigo) AS SIGNED))+1
	FROM persona;
	-- REGISTRAR PERSONA
	INSERT INTO persona (cPerCodigo, 
												cPerNombre, 
												nPerTipo, 
												nPerEstado)
	VALUES (@pcPerCodigo,
					cPerNombre,
					2,
					1);
	-- REGISTRAR PERSONA JURIDICA
	INSERT INTO perjuridica (perjuridica.cPerCodigo, 
														perjuridica.nPerJurRubro,
														perjuridica.nPerJurTipoEmpresa, 
														perjuridica.cPerJurDescripcion, 
														nPerEmpresa)
	VALUES(@pcPerCodigo,
					nPerJurRubro,
					1,
					'',
					0);
	/*
	INSERT INTO pertelefono(pertelefono.cPerCodigo,pertelefono.nPerTelTipo ,pertelefono.cPerTelNumero)
	VALUES(@pcPerCodigo,nPerTelTipo,cPerTelNumero);
	*/
	-- REGISTRAR DOCUMENTO
	INSERT INTO perdocumento (perdocumento.cPerCodigo,
														perdocumento.nPerDocTipo,
														perdocumento.cPerDocNumero,
														perdocumento.nPerDocEstado )
	VALUES(@pcPerCodigo,
					7,
					cPerDocNumero,
					1);
	-- REGISTRAR DIRECCION
	INSERT INTO perdireccion (perdireccion.cPerCodigo,
														perdireccion.nUbiCodigo,
														perdireccion.nPerDirTipo,
														perdireccion.cPerDirDescripcion)
	VALUES(@pcPerCodigo,
					1,
					1,
					cPerDirDescripcion);
	/*-- REGISTRAR CONTACTO
	IF nPerCodigo<>0 OR nPerCodigo<>"" THEN
		INSERT INTO percontacto (percontacto.cPerJurCodigo,
															percontacto.cPerCodigo,
															percontacto.nPerConEstado,
															percontacto.cPerObservacion)
		VALUES(@pcPerCodigo,
						nPerCodigo,
						1,
						cPerObservacion);
	END IF;
	-- REGISTRAR REPRESENTANTE
	IF nPerRep <>0 OR nPerRep<>"" THEN
		INSERT INTO perrelacion (perrelacion.cPerCodigo,
															perrelacion.nPerRelTipo,
															perrelacion.cPerJuridica,
															perrelacion.nPerRelEstado,
															perrelacion.dPerRelacion)
		VALUES (nPerRep, 
						2017, -- DE LA CLASE 1005
						@pcPerCodigo, 
						1, 
						now());
	END IF;*/

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_PerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_PerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_PerMail`(cPerCodigo varchar(20), nPerMailTipo int(11), cPerMail varchar(100), nPerRelTipo int(11))
BEGIN
	#Routine body goes here...
	INSERT INTO permail(permail.cPerCodigo,
											permail.nPerMailTipo,
											permail.cPerMail,
											permail.nPerRelTipo,
											permail.nPerMailEstado)
	VALUES(cPerCodigo,
				 nPerMailTipo,
				 cPerMail,
				 nPerRelTipo,
				 1);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_PerRelacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_PerRelacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_PerRelacion`(cPerCodigo varchar(20), nPerRelTipo int(11), cPerJuridica varchar(20), cPerObservacion varchar(100))
BEGIN
	#Routine body goes here...
	INSERT INTO perrelacion(perrelacion.cPerCodigo, 
													perrelacion.nPerRelTipo, 
													perrelacion.cPerJuridica,
													perrelacion.nPerRelEstado,
													perrelacion.dPerRelacion,
													perrelacion.cPerObservacion)
	VALUES(	cPerCodigo, 
					nPerRelTipo, 
					cPerJuridica, 
					1, 
					NOW(), 
					cPerObservacion);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_Persona`(cPerNatApePaterno varchar(250), cPerNatApeMaterno varchar(250), cPerNombre varchar(250), nPerTipDoc Int(4), cPerDocNumero varchar(250), dPerNacimiento varchar(20), nPerNatSexo Int(4), nPerNatEstCivil Int(4), cPerDirDescripcion varchar(500))
BEGIN
	/*crear un codigo de persona*/
	SELECT @ncPerCodigo := MAX(CAST((cPerCodigo) AS SIGNED))+1
	FROM persona;
	/*registrar persona*/
	INSERT INTO persona(persona.cPerCodigo, 
											persona.cPerNombre, 
											persona.cPerApellidos, 
											persona.dPerNacimiento, 
											persona.nPerTipo, 
											persona.nPerEstado)
	VALUES (@ncPerCodigo, 
					cPerNombre, 
					CONCAT(cPerNatApePaterno ,' ',cPerNatApeMaterno), 
					STR_TO_DATE(dPerNacimiento ,'%d-%m-%Y'), 
					1, 
					1); 
	/*registrar persona natural*/
	INSERT INTO pernatural(pernatural.cPerCodigo, 
												pernatural.cPerNatApePaterno, 
												pernatural.cPerNatApeMaterno, 
												pernatural.nPerNatSexo, 
												pernatural.nPerNatEstCivil)
	VALUES(@ncPerCodigo, 
					cPerNatApePaterno, 
					cPerNatApeMaterno, 
					nPerNatSexo, 
					nPerNatEstCivil);
	/*-- registrar telefono
	IF (cPerTelNumero<>"") THEN
		INSERT INTO pertelefono(pertelefono.cPerCodigo, pertelefono.nPerTelTipo, pertelefono.cPerTelNumero)
		VALUES(@ncPerCodigo, nPerTelTipo, cPerTelNumero);
	END IF;
	-- registrar e-mail
	IF (cPerMail<>"") THEN
		INSERT INTO permail(permail.cPerCodigo, permail.nPerMailTipo, permail.cPerMail)
		VALUES(@ncPerCodigo, 1, cPerMail);
	END IF;*/
	/*registrar documento de identidad*/
	INSERT INTO perdocumento(perdocumento.cPerCodigo, 
														perdocumento.nPerDocTipo, 
														perdocumento.cPerDocNumero, 
														perdocumento.nPerDocEstado)
	VALUES(@ncPerCodigo, 
					nPerTipDoc, 
					cPerDocNumero,
					1);
	/*registrar direccion*/
	INSERT INTO perdireccion(perdireccion.cPerCodigo, 
														perdireccion.nUbiCodigo, 
														perdireccion.nPerDirTipo, 
														perdireccion.cPerDirDescripcion)
	VALUES(@ncPerCodigo, 
					1, 
					1, 
					cPerDirDescripcion);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Reg_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Reg_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Reg_PerTelefono`(cPerCodigo varchar(20), cPerTelNumero varchar(100), nPerTelTipo int(11), nPerRelTipo int(11))
BEGIN
	#Routine body goes here...
	INSERT INTO pertelefono (pertelefono.cPerCodigo,
													 pertelefono.cPerTelNumero,
													 pertelefono.nPerTelTipo,
													 pertelefono.nPerRelTipo,
													 pertelefono.nPerTelEstado)
	VALUES(cPerCodigo, 
				 cPerTelNumero, 
				 nPerTelTipo,
				 nPerRelTipo,
				 1);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Seleccionar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Seleccionar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Seleccionar_Parametro`(nParClase int(11))
BEGIN
		SELECT parametro.nParCodigo, 
				parametro.cParNombre, 
				parametro.cParDescripcion
		FROM parametro
		WHERE parametro.nParTipo	= 1000
		AND 	parametro.nParClase	= nParClase
		ORDER BY parametro.cParDescripcion ASC ,  parametro.nParCodigo ASC;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Seleccionar_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Seleccionar_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Seleccionar_ParParametro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cParDescripcion1 varchar(255),nParSrcClase int(11) ,cParDescripcion2 varchar(255), nParDstClase int(11))
BEGIN
		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('SELECT parparametro.nParSrcCodigo,
							parametro1.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,
							parametro2.cParDescripcion AS cParDstDescripcion,
							parparametro.cValor
						FROM parametro parametro1
						INNER JOIN parparametro 					ON parparametro.nParSrcCodigo=parametro1.nParCodigo AND parparametro.nParSrcClase=',nParSrcClase,'
						INNER JOIN parametro parametro2 	ON parparametro.nParDstCodigo=parametro2.nParCodigo AND parparametro.nParDstClase=',nParDstClase,'
						WHERE parametro1.nParClase=',nParSrcClase,'
						AND parametro2.nParClase=',nParDstClase,'
						AND parametro1.nParTipo=1000
						AND parametro2.nParTipo=1000
						AND parparametro.nParEstado = 1
						AND( ("',cParDescripcion1 ,'" ="-"  ) OR (parametro1.cParDescripcion like "',cParDescripcion1 ,'%") )
						AND( ("',cParDescripcion2 ,'" ="-"  ) OR (parametro2.cParDescripcion like "',cParDescripcion2 ,'%") )
						ORDER BY parametro1.cParDescripcion  ASC
				LIMIT ',nOriReg,',',nCanReg);
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	parparametro.nParSrcCodigo,
							parametro1.cParDescripcion AS cParSrcDescripcion,
							parparametro.nParDstCodigo,
							parametro2.cParDescripcion AS cParDstDescripcion,
							parparametro.cValor
			FROM parametro parametro1
			INNER JOIN parparametro 					ON parparametro.nParSrcCodigo=parametro1.nParCodigo AND parparametro.nParSrcClase=nParSrcClase
			INNER JOIN parametro parametro2 	ON parparametro.nParDstCodigo=parametro2.nParCodigo AND parparametro.nParDstClase=nParDstClase
			WHERE parametro1.nParClase	= nParSrcClase
			AND parametro2.nParClase		= nParDstClase
			AND parametro1.nParTipo		= 1000
			AND parametro2.nParTipo		= 1000
			AND parparametro.nParEstado = 1
			AND( (cParDescripcion1 ='-' ) OR (parametro1.cParDescripcion like concat(cParDescripcion1 ,'%')) )
			AND( (cParDescripcion2 ='-'  ) OR (parametro2.cParDescripcion like concat(cParDescripcion2 ,'%')) )
			ORDER BY parametro1.cParDescripcion  ASC;

		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Seleccionar_ParParametro3
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Seleccionar_ParParametro3`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Seleccionar_ParParametro3`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cGruNombre VARCHAR(100), nGruClase INT(11), cSubNombre VARCHAR(100), nSubClase INT(11), cFamNombre VARCHAR(100), nFamClase INT(11))
BEGIN
		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('	SELECT	grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,sfg.cValor AS cGruValor,
																				subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
																				familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre,fsf.cValor AS cFamValor
																FROM parametro AS familia
																INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
																INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
																INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
																INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo
																WHERE familia.nParClase=',nFamClase,'
																AND familia.nParTipo=1000
																AND fsf.nParSrcClase=',nFamClase,'
																AND fsf.nParDstClase=',nSubClase,'
																AND fsf.nParEstado=1
																AND subfamilia.nParClase=',nSubClase,'
																AND subfamilia.nParTipo=1000
																AND sfg.nParSrcClase=',nSubClase,'
																AND sfg.nParDstClase=',nGruClase,'
																AND sfg.nParEstado=1
																AND grupo.nParClase=',nGruClase,'
																AND grupo.nParTipo=1000
																AND( ("',cGruNombre,'" ="-"  ) OR (grupo.cParDescripcion 			LIKE "',cGruNombre,'%") )
																AND( ("',cSubNombre,'" ="-"  ) OR (subfamilia.cParDescripcion LIKE "',cSubNombre,'%") )
																AND( ("',cFamNombre,'" ="-"  ) OR (familia.cParDescripcion 		LIKE "',cFamNombre,'%") )
																ORDER BY grupo.nParCodigo
																LIMIT ',nOriReg,',',nCanReg);
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre, sfg.cValor AS cGruValor,
							subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
							familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre, fsf.cValor AS cFamValor
			FROM parametro AS familia
			INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
			INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
			INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
			INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo				
			WHERE familia.nParClase=nFamClase
			AND familia.nParTipo=1000
			AND fsf.nParSrcClase=nFamClase
			AND fsf.nParDstClase=nSubClase
			AND fsf.nParEstado=1
			AND subfamilia.nParClase=nSubClase
			AND subfamilia.nParTipo=1000
			AND sfg.nParSrcClase=nSubClase
			AND sfg.nParDstClase=nGruClase
			AND sfg.nParEstado=1
			AND grupo.nParClase=nGruClase
			AND grupo.nParTipo=1000
			AND( (cGruNombre ='-' ) OR (grupo.cParDescripcion 			LIKE CONCAT(cGruNombre ,'%')) )
			AND( (cSubNombre ='-' ) OR (subfamilia.cParDescripcion 	LIKE CONCAT(cSubNombre ,'%')) )
			AND( (cFamNombre ='-' ) OR (familia.cParDescripcion 		LIKE CONCAT(cFamNombre ,'%')) )
			ORDER BY grupo.nParCodigo;

		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Seleccionar_ParParametro4
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Seleccionar_ParParametro4`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Seleccionar_ParParametro4`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cModNombre varchar(100), nModClase int(11),cGruNombre varchar(100), nGruClase int(11), cSubNombre varchar(100), nSubClase int(11), cFamNombre varchar(100), nFamClase int(11))
BEGIN
		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('	SELECT	modelo.nParCodigo AS nModCodigo, modelo.cParDescripcion AS cModNombre,
																				grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,
																				subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
																				familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre
																FROM parametro AS familia
																INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
																INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
																INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
																INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo
																INNER JOIN parparametro AS gm					ON grupo.nParCodigo=gm.nParSrcCodigo
																INNER JOIN parametro		AS modelo 		ON gm.nParDstCodigo=modelo.nParCodigo	
																WHERE familia.nParClase=',nFamClase,'
																AND familia.nParTipo=1000
																AND fsf.nParSrcClase=',nFamClase,'
																AND fsf.nParDstClase=',nSubClase,'
																AND fsf.nParEstado=1
																AND subfamilia.nParClase=',nSubClase,'
																AND subfamilia.nParTipo=1000
																AND sfg.nParSrcClase=',nSubClase,'
																AND sfg.nParDstClase=',nGruClase,'
																AND sfg.nParEstado=1
																AND grupo.nParClase=',nGruClase,'
																AND grupo.nParTipo=1000
																AND gm.nParSrcClase=',nGruClase,'
																AND gm.nParDstClase=',nModClase,'
																AND gm.nParEstado=1
																AND modelo.nParClase=',nModClase,'
																AND modelo.nParTipo=1000
																AND( ("',cModNombre,'" ="-"  ) OR (modelo.cParDescripcion 		LIKE "',cModNombre,'%") )
																AND( ("',cGruNombre,'" ="-"  ) OR (grupo.cParDescripcion 			LIKE "',cGruNombre,'%") )
																AND( ("',cSubNombre,'" ="-"  ) OR (subfamilia.cParDescripcion LIKE "',cSubNombre,'%") )
																AND( ("',cFamNombre,'" ="-"  ) OR (familia.cParDescripcion 		LIKE "',cFamNombre,'%") )
																ORDER BY modelo.nParCodigo
																LIMIT ',nOriReg,',',nCanReg);
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	modelo.nParCodigo AS nModCodigo, modelo.cParDescripcion AS cModNombre,
							grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,
							subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
							familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre
			FROM parametro AS familia
			INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
			INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
			INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
			INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo
			INNER JOIN parparametro AS gm					ON grupo.nParCodigo=gm.nParSrcCodigo
			INNER JOIN parametro		AS modelo 		ON gm.nParDstCodigo=modelo.nParCodigo	
			WHERE familia.nParClase=nFamClase
			AND familia.nParTipo=1000
			AND fsf.nParSrcClase=nFamClase
			AND fsf.nParDstClase=nSubClase
			AND fsf.nParEstado=1
			AND subfamilia.nParClase=nSubClase
			AND subfamilia.nParTipo=1000
			AND sfg.nParSrcClase=nSubClase
			AND sfg.nParDstClase=nGruClase
			AND sfg.nParEstado=1
			AND grupo.nParClase=nGruClase
			AND grupo.nParTipo=1000
			AND gm.nParSrcClase=nGruClase
			AND gm.nParDstClase=nModClase
			AND gm.nParEstado=1
			AND modelo.nParClase=nModClase
			AND modelo.nParTipo=1000
			AND( (cModNombre ='-' ) OR (modelo.cParDescripcion 			LIKE CONCAT(cModNombre ,'%')) )
			AND( (cGruNombre ='-' ) OR (grupo.cParDescripcion 			LIKE CONCAT(cGruNombre ,'%')) )
			AND( (cSubNombre ='-' ) OR (subfamilia.cParDescripcion 	LIKE CONCAT(cSubNombre ,'%')) )
			AND( (cFamNombre ='-' ) OR (familia.cParDescripcion 		LIKE CONCAT(cFamNombre ,'%')) )
			ORDER BY modelo.nParCodigo;

		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Seleccionar_ParParametro5
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Seleccionar_ParParametro5`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Seleccionar_ParParametro5`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), cProNombre varchar(100), nProClase int(11), cModNombre varchar(100), nModClase int(11),cGruNombre varchar(100), nGruClase int(11), cSubNombre varchar(100), nSubClase int(11), cFamNombre varchar(100), nFamClase int(11))
BEGIN
		IF  (nPagRegistro = 1 ) THEN

			SET @sentencia = CONCAT('	SELECT	producto.nParCodigo AS nProCodigo, producto.cParDescripcion AS cProNombre,
																				modelo.nParCodigo AS nModCodigo, modelo.cParDescripcion AS cModNombre,
																				grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,
																				subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
																				familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre
																FROM parametro AS familia
																INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
																INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
																INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
																INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo
																INNER JOIN parparametro AS gm					ON grupo.nParCodigo=gm.nParSrcCodigo
																INNER JOIN parametro		AS modelo 		ON gm.nParDstCodigo=modelo.nParCodigo
																INNER JOIN parparametro AS mp					ON modelo.nParCodigo=mp.nParSrcCodigo
																INNER JOIN parametro		AS producto		ON mp.nParDstCodigo=producto.nParCodigo
																WHERE familia.nParClase=',nFamClase,'
																AND familia.nParTipo=1000
																AND fsf.nParSrcClase=',nFamClase,'
																AND fsf.nParDstClase=',nSubClase,'
																AND fsf.nParEstado=1
																AND subfamilia.nParClase=',nSubClase,'
																AND subfamilia.nParTipo=1000
																AND sfg.nParSrcClase=',nSubClase,'
																AND sfg.nParDstClase=',nGruClase,'
																AND sfg.nParEstado=1
																AND grupo.nParClase=',nGruClase,'
																AND grupo.nParTipo=1000
																AND gm.nParSrcClase=',nGruClase,'
																AND gm.nParDstClase=',nModClase,'
																AND gm.nParEstado=1
																AND modelo.nParClase=',nModClase,'
																AND modelo.nParTipo=1000
																AND mp.nParSrcClase=',nModClase,'
																AND mp.nParDstClase=',nProClase,'
																AND mp.nParEstado=1
																AND producto.nParClase=',nProClase,'
																AND producto.nParTipo=1000
																AND( ("',cProNombre,'" ="-"  ) OR (producto.cParDescripcion 	LIKE "',cProNombre,'%") )
																AND( ("',cModNombre,'" ="-"  ) OR (modelo.cParDescripcion 		LIKE "',cModNombre,'%") )
																AND( ("',cGruNombre,'" ="-"  ) OR (grupo.cParDescripcion 			LIKE "',cGruNombre,'%") )
																AND( ("',cSubNombre,'" ="-"  ) OR (subfamilia.cParDescripcion LIKE "',cSubNombre,'%") )
																AND( ("',cFamNombre,'" ="-"  ) OR (familia.cParDescripcion 		LIKE "',cFamNombre,'%") )
																ORDER BY producto.nParCodigo
																LIMIT ',nOriReg,',',nCanReg);
				prepare consulta FROM @sentencia;
				execute consulta;

		ELSE

			SELECT	producto.nParCodigo AS nProCodigo, producto.cParDescripcion AS cProNombre,
							modelo.nParCodigo AS nModCodigo, modelo.cParDescripcion AS cModNombre,
							grupo.nParCodigo AS nGruCodigo, grupo.cParDescripcion AS cGruNombre,
							subfamilia.nParCodigo AS nSubCodigo, subfamilia.cParDescripcion AS cSubNombre,
							familia.nParCodigo AS nFamCodigo, familia.cParDescripcion AS cFamNombre
			FROM parametro AS familia
			INNER JOIN parparametro	AS fsf 				ON familia.nParCodigo=fsf.nParSrcCodigo			
			INNER JOIN parametro 		AS subfamilia ON fsf.nParDstCodigo=subfamilia.nParCodigo	
			INNER JOIN parparametro	AS sfg 				ON subfamilia.nParCodigo=sfg.nParSrcCodigo	
			INNER JOIN parametro 		AS grupo 			ON sfg.nParDstCodigo=grupo.nParCodigo
			INNER JOIN parparametro AS gm					ON grupo.nParCodigo=gm.nParSrcCodigo
			INNER JOIN parametro		AS modelo 		ON gm.nParDstCodigo=modelo.nParCodigo
			INNER JOIN parparametro AS mp					ON modelo.nParCodigo=mp.nParSrcCodigo
			INNER JOIN parametro		AS producto		ON mp.nParDstCodigo=producto.nParCodigo
			WHERE familia.nParClase=nFamClase
			AND familia.nParTipo=1000
			AND fsf.nParSrcClase=nFamClase
			AND fsf.nParDstClase=nSubClase
			AND fsf.nParEstado=1
			AND subfamilia.nParClase=nSubClase
			AND subfamilia.nParTipo=1000
			AND sfg.nParSrcClase=nSubClase
			AND sfg.nParDstClase=nGruClase
			AND sfg.nParEstado=1
			AND grupo.nParClase=nGruClase
			AND grupo.nParTipo=1000
			AND gm.nParSrcClase=nGruClase
			AND gm.nParDstClase=nModClase
			AND gm.nParEstado=1
			AND modelo.nParClase=nModClase
			AND modelo.nParTipo=1000
			AND mp.nParSrcClase=nModClase
			AND mp.nParDstClase=nProClase
			AND gm.nParEstado=1
			AND producto.nParClase=nProClase
			AND producto.nParTipo=1000
			AND( (cProNombre ='-' ) OR (producto.cParDescripcion 		LIKE CONCAT(cProNombre ,'%')) )
			AND( (cModNombre ='-' ) OR (modelo.cParDescripcion 			LIKE CONCAT(cModNombre ,'%')) )
			AND( (cGruNombre ='-' ) OR (grupo.cParDescripcion 			LIKE CONCAT(cGruNombre ,'%')) )
			AND( (cSubNombre ='-' ) OR (subfamilia.cParDescripcion 	LIKE CONCAT(cSubNombre ,'%')) )
			AND( (cFamNombre ='-' ) OR (familia.cParDescripcion 		LIKE CONCAT(cFamNombre ,'%')) )
			ORDER BY producto.nParCodigo;

		END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Seleccionar_PerDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Seleccionar_PerDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Seleccionar_PerDireccion`(cPerCodigo varchar(20), nPerRelTipo int(11), nPerDirTipo int(11))
BEGIN
	#Routine body goes here...
	SELECT perdireccion.cPerDirGlosa, perdireccion.cPerDirDescripcion, perdireccion.nPerDirTipo
	FROM perdireccion
	WHERE perdireccion.cPerCodigo=cPerCodigo
	AND ( (nPerRelTipo=0) OR (perdireccion.nPerRelTipo=nPerRelTipo) )
	AND ( (nPerDirTipo=0) OR (perdireccion.nPerDirTipo=nPerDirTipo) )
	AND perdireccion.nPerDirEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Seleccionar_PerJurica_By_nPerJurRubro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Seleccionar_PerJurica_By_nPerJurRubro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Seleccionar_PerJurica_By_nPerJurRubro`(nOriReg Int(4), nCanReg Int(4), nPagRegistro Int(4), nPerJurRubro INT(4) ,  cPerDocNumero varchar(20) , cPerNombre varchar(200),  cPerApellidos varchar(300))
BEGIN

IF(nPagRegistro = 1 ) THEN 
	SET @sentencia = CONCAT('SELECT 
							persona.cPerCodigo, 		
							persona.cPerNombre,		
							persona.cPerApellidos, 		
							perjuridica.cPerJurDescripcion , 
							perdocumento.cPerDocNumero
					FROM persona
					INNER JOIN perjuridica ON persona.cPerCodigo=perjuridica.cPerCodigo	
					INNER JOIN perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo
					WHERE persona.nPerEstado=1
					AND	perdocumento.nPerDocEstado = 1 
					AND perjuridica.nPerJurRubro = ',nPerJurRubro,'
					AND( ("',cPerApellidos ,'" ="-"  ) OR ( persona.cPerApellidos like "',cPerApellidos ,'%") )
					AND( ("',cPerNombre ,'" ="-"  ) OR ( persona.cPerNombre like "',cPerNombre ,'%") )
					AND( ("',cPerDocNumero ,'" ="-"  ) OR ( perdocumento.cPerDocNumero like "',cPerDocNumero ,'%") )
				ORDER BY 	perjuridica.cPerJurDescripcion ASC
				LIMIT ',nOriReg,',',nCanReg);
		prepare consulta FROM @sentencia;
		execute consulta;

ELSE
		SELECT 
				persona.cPerCodigo, 		
				persona.cPerNombre,		
				persona.cPerApellidos, 		
				perjuridica.cPerJurDescripcion , 
				perdocumento.cPerDocNumero
		FROM persona
		INNER JOIN perjuridica ON persona.cPerCodigo=perjuridica.cPerCodigo	
		INNER JOIN perdocumento ON persona.cPerCodigo = perdocumento.cPerCodigo
		WHERE persona.nPerEstado=1
		AND	perdocumento.nPerDocEstado = 1 
		AND perjuridica.nPerJurRubro = nPerJurRubro  
		AND ((cPerApellidos ='-') OR (persona.cPerApellidos LIKE CONCAT(cPerApellidos ,'%') ))
		AND ((cPerNombre = '-') OR persona.cPerNombre LIKE CONCAT(cPerNombre , '%'))
		AND ((cPerDocNumero = '-') OR perdocumento.cPerDocNumero LIKE CONCAT(cPerDocNumero , '%'))		
		ORDER BY persona.cPerApellidos  ASC
;

END IF ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_DocParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_DocParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_DocParametro`(cDocCodigo varchar(50), nParClase int(11), nParCodigo int(11), cDocParObservacion varchar(100))
BEGIN
	
	INSERT INTO docparametro(docparametro.cDocCodigo,
													docparametro.nParClase,
													docparametro.nParCodigo,
													docparametro.cDocParObservacion)
	VALUES(cDocCodigo,
				nParClase,
				nParCodigo,
				cDocParObservacion);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_Parametro`(cParNombre varchar(1000), cParDescripcion varchar(1000), nParClase int(11))
BEGIN
-- Generar codigo para el parametro
  SELECT @pnParCodigo := MAX(CAST((nParCodigo) AS SIGNED))+1
	FROM parametro
	WHERE parametro.nParClase=nParClase;
-- Generar jerarquia para el parametro
  SELECT @pcParJerarquia:= MAX(CAST((cParJerarquia) AS SIGNED))+1
	FROM parametro
	WHERE parametro.nParClase=nParClase;

	INSERT INTO parametro(parametro.nParCodigo,
												parametro.nParClase,
												parametro.cParJerarquia,
												parametro.cParNombre,
												parametro.cParDescripcion,
												parametro.nParTipo)
  VALUES (@pnParCodigo,
					nParClase,
					LPAD(@pcParJerarquia,4,'0'),
					cParNombre,
					cParDescripcion,
					1000);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cValor varchar(100), nParEstado int(11))
BEGIN

	/*INSERT INTO parparametro (parparametro.nParSrcCodigo,
														parparametro.nParSrcClase,
														parparametro.nParDstCodigo,
														parparametro.nParDstClase,
														parparametro.cValor,
														parparametro.nParEstado)
	VALUES (nParSrcCodigo,
					nParSrcClase,
					nParDstCodigo,
					nParDstClase,
					cValor,
					nParEstado);*/

	IF nParEstado=1 THEN
		INSERT INTO parparametro (parparametro.nParSrcCodigo,
															parparametro.nParSrcClase,
															parparametro.nParDstCodigo,
															parparametro.nParDstClase,
															parparametro.cValor,
															parparametro.nParEstado)
		VALUES (nParSrcCodigo,
						nParSrcClase,
						nParDstCodigo,
						nParDstClase,
						cValor,
						1);
	END IF;
	IF nParEstado=2 THEN
		UPDATE parparametro
		SET parparametro.cValor = cValor
		WHERE parparametro.nParSrcCodigo = nParSrcCodigo
		AND parparametro.nParSrcClase = nParSrcClase
		AND parparametro.nParDstCodigo = nParDstCodigo
		AND parparametro.nParDstClase = nParDstClase
		AND parparametro.nParEstado = 1;
	END IF;
	IF nParEstado=3 THEN
		UPDATE parparametro
		SET parparametro.nParEstado = 0
		WHERE parparametro.nParSrcCodigo = nParSrcCodigo
		AND parparametro.nParSrcClase = nParSrcClase
		AND parparametro.nParDstCodigo = nParDstCodigo
		AND parparametro.nParDstClase = nParDstClase
		AND parparametro.nParEstado = 1;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_ParParametro_By_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_ParParametro_By_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_ParParametro_By_Parametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11),nParDstClase int(11), cValor varchar(100))
BEGIN
	IF(nParDstCodigo='-')THEN
		SELECT 	@nParCodigo := MAX(CAST((nParCodigo) AS SIGNED))
		FROM 		parametro 
		WHERE 	parametro.nParClase=nParDstClase;    		
		CALL usp_Set_ParParametro(nParSrcCodigo, nParSrcClase, @nParCodigo, nParDstClase, cValor, 1);
	ELSE
		UPDATE parparametro
		SET parparametro.nParSrcCodigo = nParSrcCodigo,
				parparametro.cValor = cValor
		WHERE parparametro.nParSrcClase = 2012
		AND parparametro.nParDstClase = 1017
		AND parparametro.nParDstCodigo = nParDstCodigo ;		
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_ParParExt
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_ParParExt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_ParParExt`(nIntSrcCodigo Int(11), nIntSrcClase Int(11), nIntDstCodigo Int(11), nIntDstClase Int(11), nObjCodigo Int(11), nObjTipo Int(11), cValor Varchar(100))
BEGIN
	#Routine body goes here...
	INSERT INTO parparext (parparext.nIntSrcCodigo, parparext.nIntSrcClase,
												 parparext.nIntDstCodigo, parparext.nIntDstClase,
												 parparext.nObjCodigo, parparext.nObjTipo,
												 parparext.cValor)
	VALUES(	nIntSrcCodigo, nIntSrcClase, 
					nIntDstCodigo, nIntDstClase, 
					nObjCodigo, nObjTipo, 
					cValor);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerCuenta_By_nParSrcCod_nParDstCod_cValor_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerCuenta_By_nParSrcCod_nParDstCod_cValor_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerCuenta_By_nParSrcCod_nParDstCod_cValor_nPerRelTipo`(nParSrcCodigo int(11), nParDstCodigo int(11), cValor varchar(20), estado int(11), nPerRelTipo int(11))
BEGIN	
	
	IF estado=1 THEN
			SELECT @pnPerCtaCodigo:=(RIGHT(UUID_SHORT(),8));
			INSERT INTO percuenta(percuenta.nPerCtaCodigo,
														percuenta.cPerCodigo,
														percuenta.cNroCuenta,
														percuenta.nPerCtaTipo,
														percuenta.cPerJurCodigo,
														percuenta.nMonCodigo,
														percuenta.nPerCtaEstado)
			VALUES(@pnPerCtaCodigo,
						 nParSrcCodigo,
						 cValor,
						 nParDstCodigo,
						 (SELECT perjuridica.cPerCodigo
							FROM perjuridica
							WHERE perjuridica.nPerEmpresa=1),
						 1,
						 nPerRelTipo);
	END IF;
	IF estado=2 THEN
			UPDATE percuenta
			SET percuenta.cNroCuenta=cValor
			WHERE percuenta.cPerCodigo = nParSrcCodigo
			AND percuenta.nPerCtaTipo = nParDstCodigo
			AND percuenta.nPerCtaEstado=nPerRelTipo;
	END IF;
	IF estado=3 THEN
		UPDATE percuenta
		SET percuenta.nPerCtaEstado=CONCAT(nPerRelTipo,'0')
		WHERE percuenta.cPerCodigo= nParSrcCodigo
		AND percuenta.nPerCtaEstado = nPerRelTipo
		AND percuenta.nPerCtaTipo = nParDstCodigo;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerMail_By_cPerCodigo_nPerMailTipo_cPerMail_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerMail_By_cPerCodigo_nPerMailTipo_cPerMail_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerMail_By_cPerCodigo_nPerMailTipo_cPerMail_nPerRelTipo`(cPerCodigo varchar(20), nPerMailTipo int(11), cPerMail varchar(100), estado int(11), nPerRelTipo int(11))
BEGIN	
	/*IF NOT EXISTS(SELECT permail.cPerMail 
								FROM 	permail
								WHERE permail.cPerCodigo=cPerCodigo
								AND	permail.nPerMailTipo=nPerMailTipo
								AND permail.nPerRelTipo = nPerRelTipo ) THEN
		INSERT INTO permail(permail.cPerCodigo,
												permail.nPerMailTipo,
												permail.cPerMail,
												permail.nPerRelTipo)
		VALUES(	cPerCodigo, 
						nPerMailTipo, 
						cPerMail,
						nPerRelTipo );
	ELSE
		UPDATE permail
		SET permail.cPerMail=cPerMail
		WHERE permail.cPerCodigo=cPerCodigo
		AND permail.nPerMailTipo=nPerMailTipo
		AND permail.nPerRelTipo = nPerRelTipo ;		
	END IF;*/
	IF estado=1 THEN
		INSERT INTO permail(permail.cPerCodigo,
												permail.nPerMailTipo,
												permail.cPerMail,
												permail.nPerRelTipo)
		VALUES(	cPerCodigo, 
						nPerMailTipo, 
						cPerMail,
						nPerRelTipo );
	END IF;
	IF estado=2 THEN
		UPDATE permail
		SET permail.cPerMail=cPerMail
		WHERE permail.cPerCodigo=cPerCodigo
		AND permail.nPerMailTipo=nPerMailTipo
		AND permail.nPerRelTipo = nPerRelTipo ;	
	END IF;
	IF estado=3 THEN
		UPDATE permail
		SET permail.nPerRelTipo = concat(nPerRelTipo, '0')
		WHERE permail.cPerCodigo = cPerCodigo
		AND permail.nPerRelTipo = nPerRelTipo
		AND permail.nPerMailTipo = nPerMailTipo;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerRelacion_By_cPerCodigo_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerRelacion_By_cPerCodigo_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerRelacion_By_cPerCodigo_nPerRelTipo`(cPerCodigo varchar(20), nPerRelTipo int(11))
BEGIN
	IF NOT EXISTS(SELECT * 
								FROM perrelacion 
								WHERE perrelacion.cPerCodigo=cPerCodigo 
								AND perrelacion.nPerRelEstado=1
								AND perrelacion.nPerRelTipo=nPerRelTipo )THEN
		INSERT INTO perrelacion(perrelacion.cPerCodigo,
														perrelacion.nPerRelTipo,
														perrelacion.cPerJuridica,
														perrelacion.nPerRelEstado,
														perrelacion.dPerRelacion,
														perrelacion.cPerObservacion)
		VALUES(	cPerCodigo,
						nPerRelTipo,
						(SELECT perjuridica.cPerCodigo
						FROM perjuridica
						WHERE perjuridica.nPerEmpresa=1),
						1,
						CURDATE(),
						(SELECT parametro.cParDescripcion
						 FROM parametro
						 WHERE parametro.nParClase=1005
						 AND parametro.nParCodigo=nPerRelTipo));
	
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_Persona`(cPerCodigo varchar(20), cPerNombre varchar(500), cPerApellidos varchar(500), dPerNacimiento varchar(20), nPerTipo int(11), nPerEstado int(11))
BEGIN
	/*registrar persona*/
	INSERT INTO persona(persona.cPerCodigo, 
											persona.cPerNombre, 
											persona.cPerApellidos, 
											persona.dPerNacimiento, 
											persona.nPerTipo, 
											persona.nPerEstado)
	VALUES (cPerCodigo, 
					cPerNombre, 
					cPerApellidos, 
					STR_TO_DATE(dPerNacimiento ,'%d-%m-%Y'), 
					nPerTipo, 
					nPerEstado); 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Set_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Set_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Set_PerTelefono`(cPerCodigo varchar(20), cPerTelNumero varchar(100), nPerTelTipo int(11))
BEGIN

	INSERT INTO pertelefono (pertelefono.cPerCodigo,
													pertelefono.cPerTelNumero,
													pertelefono.nPerTelTipo)
	VALUES(cPerCodigo, cPerTelNumero, nPerTelTipo);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Estado_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Estado_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Estado_Parametro`(nParCodigo int(11), nParClase int(11) ,  nParTipo int(4))
BEGIN
  UPDATE parametro SET
				parametro.nParTipo= nParTipo 
	WHERE parametro.nParCodigo=nParCodigo
		AND parametro.nParClase=nParClase ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Estado_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Estado_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Estado_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11)  ,nParDstCodigo int(11), nParDstClase int(11) , nParEstado int(4))
BEGIN
	UPDATE parparametro
	SET parparametro.nParEstado = nParEstado 
	WHERE( (nParSrcCodigo = 0 ) OR ( parparametro.nParSrcCodigo=nParSrcCodigo))
	AND ( (nParDstCodigo = 0 ) OR (parparametro.nParDstCodigo=nParDstCodigo))
	AND ( (nParSrcClase = 0 ) OR (parparametro.nParSrcClase=nParSrcClase)) 
	AND ( (nParDstClase=0) OR (parparametro.nParDstClase=nParDstClase));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Estado_ParParmetro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Estado_ParParmetro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Estado_ParParmetro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), nParEstado int(11))
BEGIN
			UPDATE parparametro
			SET parparametro.nParEstado = nParEstado
			WHERE parparametro.nParSrcCodigo = nParSrcCodigo
			AND parparametro.nParSrcClase = nParSrcClase
			AND ( ( nParDstCodigo = '-1' ) OR ( parparametro.nParDstCodigo = nParDstCodigo ) )
			AND ( ( nParDstClase = '-1' ) OR (parparametro.nParDstClase = nParDstClase) )
		;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Parametro`(nParCodigo int(11), cParNombre varchar(255), cParDescripcion varchar(255), nParClase  int(11))
BEGIN
		UPDATE parametro
		SET parametro.cParNombre=cParNombre,
				parametro.cParDescripcion=cParDescripcion
		WHERE parametro.nParCodigo = nParCodigo
		AND parametro.nParClase = nParClase
		AND parametro.nParTipo = 1000;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_ParCoordenada
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_ParCoordenada`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_ParCoordenada`(nParCodigo INT(11), nParClase INT(11), cParLatitud VARCHAR(100), cParLonguitud VARCHAR(100),  cParAltitud VARCHAR(100),  cObservacion TEXT)
BEGIN
		UPDATE parcoordenada SET  
			parcoordenada.cParLatitud = cParLatitud ,
			parcoordenada.cParLonguitud = cParLonguitud,
			parcoordenada.cParAltitud = cParAltitud,
			parcoordenada.cObservacion = cObservacion 
		WHERE
		 parcoordenada.nEstado=1 
		 AND parcoordenada.nParCodigo = nParCodigo 
		 AND	parcoordenada.nParClase = nParClase;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_ParDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_ParDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_ParDireccion`(nParCodigo int, nParClase int , cUbigCodigo varchar(20) ,cParGlosa text)
BEGIN

		UPDATE  pardireccion SET 
			pardireccion.cUbigCodigo =cUbigCodigo ,
			pardireccion.cParGlosa = cParGlosa
		WHERE  pardireccion.nParCodigo =nParCodigo   AND pardireccion.nParClase =  nParClase;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_ParParametro`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cValor varchar(250))
BEGIN

	UPDATE parparametro
	SET parparametro.cValor=cValor
	WHERE parparametro.nParSrcCodigo=nParSrcCodigo
	AND parparametro.nParSrcClase=nParSrcClase
	AND parparametro.nParDstCodigo=nParDstCodigo
	AND parparametro.nParDstClase=nParDstClase;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_ParParametro_nParSrcCodigo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_ParParametro_nParSrcCodigo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_ParParametro_nParSrcCodigo`(nParSrcCodigo int(11), nParSrcClase int(11), nParDstCodigo int(11), nParDstClase int(11), cValor varchar(100))
BEGIN
	
	UPDATE parparametro
	SET parparametro.cValor=cValor, 
		parparametro.nParSrcCodigo=nParSrcCodigo
	WHERE parparametro.nParDstCodigo=nParDstCodigo
	AND parparametro.nParSrcClase=nParSrcClase	
	AND parparametro.nParDstClase=nParDstClase;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_ParParExt
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_ParParExt`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_ParParExt`(nIntSrcClase int(11), nIntSrcCodigo int(11), nIntDstClase int(11), nIntDstCodigo int(11), nObjTipo int(11), nObjCodigo int(11), cValor varchar(20))
BEGIN
	#Routine body goes here...
			UPDATE parparext
			SET parparext.cValor = cValor
			WHERE parparext.nIntSrcClase=nIntSrcClase
			AND		parparext.nIntDstClase=nIntDstClase
			AND		parparext.nObjTipo=nObjTipo
			AND 	parparext.nIntSrcCodigo=nIntSrcCodigo
			AND		parparext.nIntDstCodigo=nIntDstCodigo
			AND		parparext.nObjCodigo=nObjCodigo;
			/*SELECT nIntSrcCodigo, nIntSrcClase, nIntDstCodigo, nIntDstClase, nObjCodigo, nObjTipo;*/
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerDireccion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerDireccion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerDireccion`(cPerCodigo varchar(20), nUbiCodigo int(11), nPerDirTipo int(11), cPerDirDescripcion varchar(100))
BEGIN
	
	UPDATE perdireccion
	SET perdireccion.cPerDirDescripcion=cPerDirDescripcion,
			perdireccion.nUbiCodigo=nUbiCodigo,
			perdireccion.nPerDirTipo=nPerDirTipo
	WHERE perdireccion.cPerCodigo=cPerCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerDireccion_cPerDirDescripcion
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerDireccion_cPerDirDescripcion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerDireccion_cPerDirDescripcion`(cPerCodigo varchar(20), cPerDirDescripcion varchar(100), nPerDirTipo int(4), nPerRelTipo int(4))
BEGIN
	#Routine body goes here...
	UPDATE perdireccion
	SET perdireccion.cPerDirDescripcion=cPerDirDescripcion
	WHERE perdireccion.cPerCodigo=cPerCodigo
	AND perdireccion.nPerDirTipo=nPerDirTipo
	AND perdireccion.nPerRelTipo=nPerRelTipo
	AND perdireccion.nPerDirEstado=1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerDocumento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerDocumento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerDocumento`(cPerCodigo varchar(20), cPerDocNumero varchar(20), nPerDocTipo int(11), nPerDocCategoria int(11), nPerDocEstado int(11), dPerDocCaducidad varchar(20))
BEGIN
	
	UPDATE perdocumento
	SET perdocumento.cPerDocNumero=cPerDocNumero,
			perdocumento.nPerDocTipo=nPerDocTipo,
			perdocumento.nPerDocCategoria=nPerDocCategoria,
			perdocumento.nPerDocEstado=nPerDocEstado,
			perdocumento.dPerDocCaducidad=STR_TO_DATE(dPerDocCaducidad , '%d-%m-%Y')
	WHERE perdocumento.cPerCodigo=cPerCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerDocumento_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerDocumento_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerDocumento_cPerDocNumero`(cPerCodigo varchar(20), nPerDocTipo int(4), cPerDocNumero varchar(100))
BEGIN
	#Routine body goes here...
	UPDATE perdocumento
	SET perdocumento.cPerDocNumero=cPerDocNumero
	WHERE perdocumento.nPerDocEstado=1
	AND perdocumento.nPerDocTipo=nPerDocTipo
	AND perdocumento.cPerCodigo=cPerCodigo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerJuridica
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerJuridica`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerJuridica`(PerCodigo varchar(20), nPerJurRubro int(11), nPerJurTipoEmpresa int(11), cPerJurDescripcion varchar(200) , nPerEmpresa int(11))
BEGIN
UPDATE perjuridica SET 
nPerJurRubro = nPerJurRubro , 
nPerJurTipoEmpresa= nPerJurTipoEmpresa  , 
cPerJurDescripcion= cPerJurDescripcion  , 
nPerEmpresa=  nPerEmpresa  
WHERE (perjuridica.cPerCodigo = PerCodigo );

/*
	UPDATE perjuridica
	SET
			perjuridica.nPerJurRubro=nPerJurRubro,
			perjuridica.nPerJurTipoEmpresa=nPerJurTipoEmpresa,
			perjuridica.nPerEmpresa=nPerEmpresa,
			perjuridica.cPerJurDescripcion=cPerJurDescripcion
	WHERE perjuridica.cPerCodigo = cPerCodigo ;
*/
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerMail`(cPerCodigo varchar(20), nPerMailTipo int(11), cPerMail varchar(100), nPerRelTipo int(11))
BEGIN
	#Routine body goes here...
	UPDATE	permail
	SET	permail.nPerMailTipo=nPerMailTipo,
			permail.cPerMail=cPerMail
	WHERE permail.cPerCodigo=cPerCodigo
	AND permail.nPerRelTipo=nPerRelTipo;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerMail_cPerMail
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerMail_cPerMail`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerMail_cPerMail`(cPerCodigo varchar(20), cPerMail varchar(100), nPerMailTipo int(4), nPerRelTipo int(4))
BEGIN
	#Routine body goes here...
	UPDATE permail
	SET permail.cPerMail=cPerMail
	WHERE permail.cPerCodigo=cPerCodigo
	AND permail.nPerMailTipo=nPerMailTipo
	AND permail.nPerRelTipo=nPerRelTipo
	AND permail.nPerMailEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerNatural
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerNatural`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerNatural`(cPerCodigo varchar(20), cPerNatApePaterno varchar(100), cPerNatApeMaterno varchar(100), nPerNatSexo int(11), nPerNatEstCivil int(11))
BEGIN
	
	UPDATE pernatural
	SET pernatural.cPerNatApePaterno=cPerNatApePaterno,
			pernatural.cPerNatApeMaterno=cPerNatApeMaterno,
			pernatural.nPerNatSexo=nPerNatSexo,
			pernatural.nPerNatEstCivil=nPerNatEstCivil
	WHERE pernatural.cPerCodigo=cPerCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerRelacion_By_cPerCodigo_nPerRelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerRelacion_By_cPerCodigo_nPerRelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerRelacion_By_cPerCodigo_nPerRelTipo`(cPerCodigo varchar(20), nPerRelTipo int(11))
BEGIN

	UPDATE perrelacion
	SET perrelacion.nPerRelEstado=0
	WHERE perrelacion.nPerRelEstado=1
	AND perrelacion.cPerJuridica= (SELECT perjuridica.cPerCodigo
																	FROM perjuridica
																	WHERE perjuridica.nPerEmpresa=1)
	AND perrelacion.cPerCodigo=cPerCodigo
	AND perrelacion.nPerRelTipo=nPerRelTipo;


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_Persona
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_Persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_Persona`(cPerCodigo varchar(20), cPerNombre varchar(100), cPerApellidos varchar(100), dPerNacimiento varchar(20), nPerTipo int(11), nPerEstado int(11))
BEGIN
	UPDATE persona
	SET persona.cPerNombre		=	cPerNombre,
			persona.cPerApellidos	=	cPerApellidos,
			persona.dPerNacimiento=	STR_TO_DATE(dPerNacimiento ,'%d-%m-%Y'),
			persona.nPerTipo			= nPerTipo,
			persona.nPerEstado		= nPerEstado
	WHERE persona.cPerCodigo	=  cPerCodigo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerTelefono
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerTelefono`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerTelefono`(cPerCodigo varchar(20), nPerTelTipo int(11), cPerTelNumero varchar(100), nPerRelTipo int(11))
BEGIN
	#Routine body goes here...
	UPDATE pertelefono
	SET	pertelefono.nPerTelTipo=nPerTelTipo,
			pertelefono.cPerTelNumero=cPerTelNumero
	WHERE pertelefono.cPerCodigo=cPerCodigo
	AND pertelefono.nPerRelTipo=nPerRelTipo;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerTelefono_cPerTelNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerTelefono_cPerTelNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerTelefono_cPerTelNumero`(cPerCodigo varchar(20), cPerTelNumero varchar(100), nPerTelTipo int(4), nPerRelTipo int(4))
BEGIN
	#Routine body goes here...
	UPDATE pertelefono
	SET pertelefono.cPerTelNumero=cPerTelNumero
	WHERE pertelefono.cPerCodigo=cPerCodigo
	AND pertelefono.nPerTelTipo=nPerTelTipo
	AND pertelefono.nPerRelTipo=nPerRelTipo
	AND pertelefono.nPerTelEstado=1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerTelefono_cPerTelNumero_nPerTelTipo
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerTelefono_cPerTelNumero_nPerTelTipo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerTelefono_cPerTelNumero_nPerTelTipo`(cPerCodigo varchar(20), cPerTelNumero varchar(100), nPerTelTipo int(4), nPerRelTipo int(4) , nPerTelTipoNew INT(4))
BEGIN
	#Routine body goes here...
	UPDATE pertelefono
	SET pertelefono.cPerTelNumero=cPerTelNumero , 
			pertelefono.nPerTelTipo=nPerTelTipoNew , 
			pertelefono.nPerTelEstado=1
	WHERE pertelefono.cPerCodigo=cPerCodigo
	AND pertelefono.nPerTelTipo=nPerTelTipo
	AND pertelefono.nPerRelTipo=nPerRelTipo
	;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Upd_PerUsuario_By_cPerCodigo_cPerUsuClave
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Upd_PerUsuario_By_cPerCodigo_cPerUsuClave`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Upd_PerUsuario_By_cPerCodigo_cPerUsuClave`(cPerCodigo varchar(20), cPerUsuClave varchar(100))
BEGIN
	
	UPDATE perusuario
	SET perusuario.cPerUsuClave=cPerUsuClave 
	WHERE perusuario.cPerCodigo=cPerCodigo 
	AND perusuario.nPerUsuEstado=1;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_DocParmetro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_DocParmetro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_DocParmetro`(cDocCodigo varchar(20) ,  nParClase  int(4), nParCodigo int(4))
BEGIN
	
	SELECT docparametro.cDocCodigo,
				docparametro.nParClase,
				docparametro.nParCodigo,
				docparametro.cDocParObservacion
	FROM docparametro 
	WHERE  
			  ((cDocCodigo = '-' ) OR (docparametro.cDocCodigo =cDocCodigo ))
		AND	((nParClase  = 0 ) OR (docparametro.nParClase = nParClase ))
		AND	((nParCodigo = 0) OR (docparametro.nParCodigo = nParCodigo)) ;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_Parametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_Parametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_Parametro`(nParClase int(11), cParNombre varchar(500), cParDescripcion varchar(500))
BEGIN

		SELECT 	parametro.nParCodigo, 
						parametro.cParNombre, 
						cParDescripcion
		FROM parametro
		WHERE parametro.nParTipo = 1000
		AND	parametro.nParClase = nParClase
		AND ( ( cParNombre 			= "-" ) OR ( parametro.cParNombre 			= cParNombre ) )
		AND	( ( cParDescripcion = "-" ) OR ( parametro.cParDescripcion 	= cParDescripcion ) );

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_ParParametro
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_ParParametro`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_ParParametro`(nParSrcCodigo INT ,nParSrcClase INT , nParDstCodigo INT, nParDstClase INT ,nParEstado INT)
BEGIN

		IF (nParEstado=2 ) THEN
					SELECT  parparametro.nParSrcCodigo,
									parparametro.nParSrcClase,
									parparametro.nParDstCodigo,
									parparametro.nParDstClase,
									parparametro.cValor,
									parparametro.nParEstado
					FROM parparametro 
					WHERE parparametro.nParSrcCodigo= nParSrcCodigo
					AND parparametro.nParSrcClase= nParSrcClase
					AND parparametro.nParDstCodigo= nParDstCodigo
					AND parparametro.nParDstClase= nParDstClase 
					AND parparametro.nParEstado IN (0,1);
		ELSE
				SELECT  parparametro.nParSrcCodigo,
									parparametro.nParSrcClase,
									parparametro.nParDstCodigo,
									parparametro.nParDstClase,
									parparametro.cValor,
									parparametro.nParEstado
					FROM parparametro 
					WHERE parparametro.nParSrcCodigo= nParSrcCodigo
					AND parparametro.nParSrcClase= nParSrcClase
					AND parparametro.nParDstCodigo= nParDstCodigo
					AND parparametro.nParDstClase= nParDstClase 
					AND parparametro.nParEstado= nParEstado;

		END IF ;


		
				 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_PerDocumento
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_PerDocumento`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_PerDocumento`(cPerCodigo varchar(20), nPerDocTipo int(4), cPerDocNumero varchar(20) )
BEGIN
	SELECT 
		cPerCodigo, 
		nPerDocTipo, 
		cPerDocNumero, 
		nPerDocEstado 
	FROM perdocumento	
	WHERE perdocumento.nPerDocEstado = 1 
	AND ((cPerDocNumero = '-') OR (perdocumento.cPerDocNumero = cPerDocNumero))
	AND ((cPerCodigo = '-') OR (perdocumento.cPerCodigo = cPerCodigo ))
	AND ((nPerDocTipo= 0 ) OR (perdocumento.nPerDocTipo = nPerDocTipo ))
		;
	

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_PerDomicilion_By_cPerDomValor
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_PerDomicilion_By_cPerDomValor`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_PerDomicilion_By_cPerDomValor`(cPerDomValor varchar(200))
BEGIN
		-- para buscar una empresa si tiene registros cPerDomValor esto siver para no permitir eliminar a una empresa si tiene registros 
-- relacionados 
		SELECT 
					cPerCodigo, 
					nParCodigo, 
					nParClase,
					cPerDomValor 
		FROM perdomicilio 	
		WHERE perdomicilio.cPerDomValor = cPerCodigo   ; 

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for usp_Validar_PerRelacion_By_cPerDocNumero
-- ----------------------------
DROP PROCEDURE IF EXISTS `usp_Validar_PerRelacion_By_cPerDocNumero`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_Validar_PerRelacion_By_cPerDocNumero`(nPerTipo int(11), nPerRelTipo int(11), nPerDocTipo int(11), cPerDocNumero varchar(20))
BEGIN
	#Routine body goes here...
	SELECT persona.cPerCodigo, persona.cPerNombre, persona.cPerApellidos,
				perdocumento.nPerDocTipo, perdocumento.cPerDocNumero
	FROM persona
	INNER JOIN perrelacion ON persona.cPerCodigo=perrelacion.cPerCodigo
	INNER JOIN perdocumento ON perrelacion.cPerCodigo=perdocumento.cPerCodigo
	WHERE perrelacion.nPerRelEstado=1
	AND perdocumento.nPerDocEstado=1
	AND persona.nPerEstado=1
	AND	( (nPerTipo	=	0  ) 		OR 	(persona.nPerTipo = nPerTipo) )
	AND	( (nPerDocTipo	=	0  ) 		OR 	(perdocumento.nPerDocTipo = nPerDocTipo) )
	AND	( (nPerRelTipo	=	0  ) 		OR 	(perrelacion.nPerRelTipo = nPerRelTipo) )
	AND	( (cPerDocNumero	=	"-")	OR	(perdocumento.cPerDocNumero LIKE CONCAT(cPerDocNumero,"%")) );
END
;;
DELIMITER ;
