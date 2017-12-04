/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.16-log : Database - gg
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gg` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gg`;

/*Table structure for table `gg_admin` */

DROP TABLE IF EXISTS `gg_admin`;

CREATE TABLE `gg_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流id',
  `username` varchar(30) NOT NULL COMMENT '管理员姓名',
  `password` varchar(70) NOT NULL COMMENT '管理员密码',
  `email` varchar(40) DEFAULT NULL COMMENT '邮件',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话',
  `power_level` int(4) DEFAULT NULL COMMENT '管理员权限：1-初级 2-中级 3-稍高 4-很高 5-最高',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='kela管理员表';

/*Data for the table `gg_admin` */

LOCK TABLES `gg_admin` WRITE;

insert  into `gg_admin`(`id`,`username`,`password`,`email`,`phone`,`power_level`,`create_time`,`update_time`) values (1,'杨老大','35048c7fb2c40e8cf4284f7b5ad7278f','13728718164@137.com','13728718164',5,'2017-11-14 19:09:18','2017-11-15 19:09:21'),(3,'lililili','6d0a12493f577c45a550e68eb03b7bf1','lili@lili.com','12345678909',4,NULL,NULL),(4,'lililililili','6d0a12493f577c45a550e68eb03b7bf1','lili@lili.com','12345678909',4,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `gg_cart` */

DROP TABLE IF EXISTS `gg_cart`;

CREATE TABLE `gg_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id,对应GG_user表的主键',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id,对应GG_product表的主键',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `checked` int(4) DEFAULT '1' COMMENT '是否选择 1-已勾选 2-未勾选',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='kela用户购物车表';

/*Data for the table `gg_cart` */

LOCK TABLES `gg_cart` WRITE;

UNLOCK TABLES;

/*Table structure for table `gg_cart_item` */

DROP TABLE IF EXISTS `gg_cart_item`;

CREATE TABLE `gg_cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车子表id',
  `cart_id` int(11) DEFAULT NULL COMMENT '购物车id,对应GG_cart表的主键',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id，对应GG_product表的主键',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(400) DEFAULT NULL COMMENT '商品主图地址',
  `quantity` int(6) DEFAULT NULL COMMENT '商品加入购物车数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cart_id_index` (`cart_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='kela购物车明细表';

/*Data for the table `gg_cart_item` */

LOCK TABLES `gg_cart_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `gg_category` */

DROP TABLE IF EXISTS `gg_category`;

CREATE TABLE `gg_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类id,当id=0的时候是一级目录',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `descrition` varchar(200) DEFAULT NULL COMMENT '类别66字简短描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '类别状态：1-正常，0-废弃',
  `sort_order` int(4) DEFAULT NULL COMMENT '排序编号：同类相等则自然排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='kela商品分类表';

/*Data for the table `gg_category` */

LOCK TABLES `gg_category` WRITE;

insert  into `gg_category`(`id`,`parent_id`,`name`,`descrition`,`status`,`sort_order`,`create_time`,`update_time`) values (1,0,'第一个顶级分类',NULL,1,NULL,'2017-11-16 15:09:06','2017-11-16 15:09:06'),(3,0,NULL,NULL,1,NULL,'2017-11-16 15:10:46','2017-11-16 15:10:46'),(4,3,'hhh','123',1,NULL,'2017-11-16 15:13:53','2017-11-16 15:13:53'),(5,3,'aaa','456',1,NULL,'2017-11-16 15:14:03','2017-11-16 15:14:03'),(6,4,'hhh',NULL,1,NULL,'2017-11-16 15:15:23','2017-11-16 15:15:23'),(8,4,'第一个首级分类',NULL,1,NULL,'2017-11-16 15:53:46','2017-11-16 15:53:46');

UNLOCK TABLES;

/*Table structure for table `gg_order` */

DROP TABLE IF EXISTS `gg_order`;

CREATE TABLE `gg_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id,对应GG_user表的主键',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `shipping_id` int(11) DEFAULT NULL COMMENT '地址id，对应GG_shipping表的主键',
  `payment` decimal(12,2) DEFAULT NULL COMMENT '实际支付金额',
  `payment_type` int(2) DEFAULT '1' COMMENT '支付类型：1-在线',
  `postage` int(4) DEFAULT NULL COMMENT '运费：单位元',
  `status` int(4) DEFAULT NULL COMMENT '订单状态：0-已取消 10-未付款 20-已付款 40-已发货 50-交易成功 60-交易关闭',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='kela订单表';

/*Data for the table `gg_order` */

LOCK TABLES `gg_order` WRITE;

insert  into `gg_order`(`id`,`user_id`,`order_no`,`shipping_id`,`payment`,`payment_type`,`postage`,`status`,`payment_time`,`send_time`,`end_time`,`close_time`,`create_time`,`update_time`) values (1,1,123456091,1,'1000.00',1,10,20,'2017-11-27 11:43:03',NULL,NULL,NULL,NULL,NULL),(2,1,1511939255106,2,'2000.00',1,0,0,NULL,NULL,NULL,NULL,'2017-11-29 15:07:35','2017-11-29 15:07:35'),(3,1,1511940967140,2,'2000.00',1,0,40,NULL,NULL,NULL,NULL,'2017-11-29 15:36:06','2017-11-29 16:45:53');

UNLOCK TABLES;

/*Table structure for table `gg_order_item` */

DROP TABLE IF EXISTS `gg_order_item`;

CREATE TABLE `gg_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id,对应GG_user表的主键',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `product_id` int(11) DEFAULT NULL COMMENT '商品id，对应GG_product表的主键',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(400) DEFAULT NULL COMMENT '商品主图地址',
  `product_images` varchar(800) DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(12,2) DEFAULT NULL COMMENT '商品下单时价格',
  `quantity` int(6) DEFAULT NULL COMMENT '商品购买数量',
  `total_price` decimal(12,2) DEFAULT NULL COMMENT '商品总价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`user_id`,`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='kela订单明细表';

/*Data for the table `gg_order_item` */

LOCK TABLES `gg_order_item` WRITE;

insert  into `gg_order_item`(`id`,`user_id`,`order_no`,`product_id`,`product_name`,`product_image`,`product_images`,`current_unit_price`,`quantity`,`total_price`,`create_time`,`update_time`) values (1,1,123456091,1,'修改信息',NULL,NULL,'100.00',10,'1000.00','2017-11-25 10:14:41','2017-11-28 10:14:45'),(2,1,1511939255106,5,'珀金','main_image',NULL,'100.00',10,'1000.00','2017-11-29 15:07:35','2017-11-29 15:07:35'),(3,1,1511939255106,6,'手链','main_image',NULL,'100.00',10,'1000.00','2017-11-29 15:07:35','2017-11-29 15:07:35'),(4,1,1511940967140,4,'白银','hello',NULL,'100.00',10,'1000.00','2017-11-29 15:36:06','2017-11-29 15:36:06'),(5,1,1511940967140,3,'黄金',NULL,NULL,'100.00',10,'1000.00','2017-11-29 15:36:06','2017-11-29 15:36:06');

UNLOCK TABLES;

/*Table structure for table `gg_order_post` */

DROP TABLE IF EXISTS `gg_order_post`;

CREATE TABLE `gg_order_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id,对应GG_user表的主键',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `post_company` varchar(50) DEFAULT NULL COMMENT '物流公司',
  `post_number` varchar(50) DEFAULT NULL COMMENT '物流编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='kela订单物流表';

/*Data for the table `gg_order_post` */

LOCK TABLES `gg_order_post` WRITE;

insert  into `gg_order_post`(`id`,`user_id`,`order_no`,`post_company`,`post_number`,`create_time`,`update_time`) values (2,1,1511940967140,'铁通快递','12345','2017-11-29 18:26:59','2017-11-29 18:26:59');

UNLOCK TABLES;

/*Table structure for table `gg_pay_info` */

DROP TABLE IF EXISTS `gg_pay_info`;

CREATE TABLE `gg_pay_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付信息id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id,对应GG_user表的主键',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `pay_platform` int(11) DEFAULT NULL COMMENT '支付平台：1-支付宝 2-微信',
  `platform_number` varchar(200) DEFAULT NULL COMMENT '支付平台流水号',
  `platform_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='kela支付信息表';

/*Data for the table `gg_pay_info` */

LOCK TABLES `gg_pay_info` WRITE;

insert  into `gg_pay_info`(`id`,`user_id`,`order_no`,`pay_platform`,`platform_number`,`platform_status`,`create_time`,`update_time`) values (1,1,123456091,1,'2017112721001004570200386396','TRADE_SUCCESS','2017-11-27 11:43:20','2017-11-27 11:43:20');

UNLOCK TABLES;

/*Table structure for table `gg_product` */

DROP TABLE IF EXISTS `gg_product`;

CREATE TABLE `gg_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_id` int(11) DEFAULT NULL COMMENT '分类id,对应GG_category表的主键',
  `name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '商品别名，保存商品的材质',
  `main_image` varchar(400) DEFAULT NULL COMMENT '商品主图，url相对地址',
  `sub_images` varchar(800) DEFAULT NULL COMMENT '图片地址，json格式，扩展用',
  `detail` text COMMENT '商品详情',
  `price` decimal(12,2) NOT NULL COMMENT '商品原价',
  `new_price` decimal(12,2) NOT NULL COMMENT '折后价',
  `discount` int(4) DEFAULT '100' COMMENT '商品折扣，默认100 -> 100%',
  `stock` int(11) DEFAULT '0' COMMENT '库存量（单位：件）',
  `status` int(3) DEFAULT '1' COMMENT '商品状态：1-在售 2-售完 3-下架',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='kela商品表';

/*Data for the table `gg_product` */

LOCK TABLES `gg_product` WRITE;

insert  into `gg_product`(`id`,`category_id`,`name`,`subtitle`,`main_image`,`sub_images`,`detail`,`price`,`new_price`,`discount`,`stock`,`status`,`create_time`,`update_time`) values (1,5,'修改信息','材质hello','主图地址','1',NULL,'100.00','100.00',100,100,2,'2017-11-15 16:27:07','2017-11-20 18:59:32'),(2,5,'新增一个商品信息','材质hello','主图地址',NULL,NULL,'100.00','100.00',100,100,1,'2017-11-20 17:53:12','2017-11-20 17:53:12'),(3,5,'黄金','材质666',NULL,NULL,NULL,'100.00','100.00',100,90,1,'2017-11-22 13:03:14','2017-11-29 15:36:06'),(4,5,'白银','hello','hello',NULL,NULL,'100.00','100.00',100,90,1,'2017-11-22 13:04:11','2017-11-29 15:36:06'),(5,5,'珀金','铂金钻戒','main_image','sub_images',NULL,'100.00','100.00',100,100,1,'2017-11-22 11:54:58','2017-11-29 15:16:27'),(6,5,'手链','手链','main_image','sub_images',NULL,'100.00','100.00',100,100,1,'2017-11-23 11:56:16','2017-11-29 15:16:27');

UNLOCK TABLES;

/*Table structure for table `gg_shipping` */

DROP TABLE IF EXISTS `gg_shipping`;

CREATE TABLE `gg_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id,对应GG_user表的主键',
  `receiver_name` varchar(60) DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '收件人电话',
  `receiver_mobile` varchar(20) DEFAULT NULL COMMENT '收件人手机',
  `receiver_province` varchar(20) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(60) DEFAULT NULL COMMENT '市份',
  `receiver_district` varchar(30) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(210) DEFAULT NULL COMMENT '详细地址',
  `receiver_zip` varchar(10) DEFAULT NULL COMMENT '邮编',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='kela用户收货地址表';

/*Data for the table `gg_shipping` */

LOCK TABLES `gg_shipping` WRITE;

insert  into `gg_shipping`(`id`,`user_id`,`receiver_name`,`receiver_phone`,`receiver_mobile`,`receiver_province`,`receiver_city`,`receiver_district`,`receiver_address`,`receiver_zip`,`create_time`,`update_time`) values (1,1,'我是一个修改项','0755 6543210','13728718164','广东省','深圳市','南山区','前海金融总经理门店',NULL,NULL,'2017-11-22 18:16:05'),(2,1,'羊老二','0755 6543210','13728718164','广东省','深圳市','南山区','开开心心有限集团',NULL,'2017-11-22 17:25:36','2017-11-22 17:25:36'),(3,1,'羊老三','0755 6543210','13728718164','广东省','深圳市','南山区','开开心心有限集团',NULL,'2017-11-22 17:26:03','2017-11-22 17:26:03'),(4,1,'羊老四','0755 6543210','13728718164','广东省','深圳市','南山区','开开心心有限集团',NULL,'2017-11-22 17:30:01','2017-11-22 17:30:01');

UNLOCK TABLES;

/*Table structure for table `gg_user` */

DROP TABLE IF EXISTS `gg_user`;

CREATE TABLE `gg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) NOT NULL COMMENT '用户名称',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
  `phone` varchar(25) DEFAULT NULL COMMENT '用户电话',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `question` varchar(300) DEFAULT NULL COMMENT '用户找回密码问题',
  `answer` varchar(300) DEFAULT NULL COMMENT '用户找回密码答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='kela用户表';

/*Data for the table `gg_user` */

LOCK TABLES `gg_user` WRITE;

insert  into `gg_user`(`id`,`username`,`password`,`email`,`phone`,`create_time`,`update_time`,`question`,`answer`) values (1,'羊老大','35048c7fb2c40e8cf4284f7b5ad7278f','1212@12.com','123456784','2017-11-15 14:37:17','2017-11-15 17:12:33','问题','答案'),(2,'羊老二','35048c7fb2c40e8cf4284f7b5ad7278f','123@163.com','12345678901','2017-11-15 16:02:24','2017-11-15 16:02:24',NULL,NULL),(3,'羊老4','35048c7fb2c40e8cf4284f7b5ad7278f','123@1634.com','123456784901','2017-11-15 16:12:01','2017-11-15 16:12:01',NULL,NULL);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
