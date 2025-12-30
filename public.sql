/*
 Navicat Premium Dump SQL

 Source Server         : xbglxt
 Source Server Type    : PostgreSQL
 Source Server Version : 180001 (180001)
 Source Host           : localhost:5432
 Source Catalog        : test
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 180001 (180001)
 File Encoding         : 65001

 Date: 30/12/2025 18:17:04
*/


-- ----------------------------
-- Sequence structure for dict_item_dict_item_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dict_item_dict_item_id_seq";
CREATE SEQUENCE "public"."dict_item_dict_item_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dict_type_dict_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dict_type_dict_type_id_seq";
CREATE SEQUENCE "public"."dict_type_dict_type_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permission_permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permission_permission_id_seq";
CREATE SEQUENCE "public"."permission_permission_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_permission_role_permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_permission_role_permission_id_seq";
CREATE SEQUENCE "public"."role_permission_role_permission_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."role_role_id_seq";
CREATE SEQUENCE "public"."role_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_permission_user_permission_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_permission_user_permission_id_seq";
CREATE SEQUENCE "public"."user_permission_user_permission_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_role_user_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_role_user_role_id_seq";
CREATE SEQUENCE "public"."user_role_user_role_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_user_id_seq";
CREATE SEQUENCE "public"."user_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for device_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_info";
CREATE TABLE "public"."device_info" (
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_model" varchar(100) COLLATE "pg_catalog"."default",
  "computer_name" varchar(100) COLLATE "pg_catalog"."default",
  "login_username" varchar(100) COLLATE "pg_catalog"."default",
  "project" varchar(100) COLLATE "pg_catalog"."default",
  "dev_room" varchar(100) COLLATE "pg_catalog"."default",
  "job_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "remark" text COLLATE "pg_catalog"."default",
  "self_confirm_id" int8,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default",
  "os_id" int8,
  "memory_id" int8,
  "ssd_id" int8,
  "hdd_id" int8
)
;
COMMENT ON COLUMN "public"."device_info"."device_id" IS '设备编号（主键）';
COMMENT ON COLUMN "public"."device_info"."device_model" IS '主机型号';
COMMENT ON COLUMN "public"."device_info"."computer_name" IS '电脑名';
COMMENT ON COLUMN "public"."device_info"."login_username" IS '登录用户名';
COMMENT ON COLUMN "public"."device_info"."project" IS '所在项目';
COMMENT ON COLUMN "public"."device_info"."dev_room" IS '所在开发室';
COMMENT ON COLUMN "public"."device_info"."job_number" IS '工号（归属用户，外键）';
COMMENT ON COLUMN "public"."device_info"."remark" IS '备注';
COMMENT ON COLUMN "public"."device_info"."self_confirm_id" IS '本人确认ID（关联字典项：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."device_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."device_info"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."device_info"."updater" IS '修改者';
COMMENT ON TABLE "public"."device_info" IS '设备信息表（存储设备硬件配置）';

-- ----------------------------
-- Records of device_info
-- ----------------------------
INSERT INTO "public"."device_info" VALUES ('DEV001', 'Dell XPS', 'PC-DELL-001', 'zhangsan', 'Project A', 'Room101', 'EMP001', NULL, 3, '2025-12-30 00:01:57.379709', '2025-12-30 00:22:01.695568', NULL, 2, 2, 1, 1);
INSERT INTO "public"."device_info" VALUES ('DEV002', 'HP ProBook', 'PC-HP-002', 'lisi', 'Project B', 'Room102', 'EMP002', NULL, 4, '2025-12-30 00:01:57.379709', '2025-12-30 00:22:29.661355', NULL, 2, 2, 1, 1);

-- ----------------------------
-- Table structure for device_ip
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_ip";
CREATE TABLE "public"."device_ip" (
  "ip_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "ip_address" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."device_ip"."ip_id" IS 'IP编号（主键）';
COMMENT ON COLUMN "public"."device_ip"."device_id" IS '设备编号（外键）';
COMMENT ON COLUMN "public"."device_ip"."ip_address" IS 'IP地址（唯一）';
COMMENT ON COLUMN "public"."device_ip"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."device_ip"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."device_ip"."updater" IS '修改者';
COMMENT ON TABLE "public"."device_ip" IS '设备IP表（存储设备关联的IP地址）';

-- ----------------------------
-- Records of device_ip
-- ----------------------------
INSERT INTO "public"."device_ip" VALUES ('IP001', 'DEV001', '192.168.1.101', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."device_ip" VALUES ('IP002', 'DEV002', '192.168.1.102', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- Table structure for device_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_permission";
CREATE TABLE "public"."device_permission" (
  "permission_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "job_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "domain_status_id" int8,
  "domain_group" varchar(100) COLLATE "pg_catalog"."default",
  "no_domain_reason" text COLLATE "pg_catalog"."default",
  "smartit_status_id" int8,
  "no_smartit_reason" text COLLATE "pg_catalog"."default",
  "usb_status_id" int8,
  "usb_reason" text COLLATE "pg_catalog"."default",
  "usb_expire_date" date,
  "antivirus_status_id" int8,
  "no_symantec_reason" text COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default",
  "computer_name" varchar(100) COLLATE "pg_catalog"."default",
  "login_username" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."device_permission"."permission_id" IS '权限编号（主键）';
COMMENT ON COLUMN "public"."device_permission"."job_number" IS '工号（外键）';
COMMENT ON COLUMN "public"."device_permission"."domain_status_id" IS '域状态ID（关联字典项：DOMAIN_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."domain_group" IS '域内组名';
COMMENT ON COLUMN "public"."device_permission"."no_domain_reason" IS '不加域理由';
COMMENT ON COLUMN "public"."device_permission"."smartit_status_id" IS 'SmartIT状态ID（关联字典项：SMARTIT_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."no_smartit_reason" IS '不安装SmartIT理由';
COMMENT ON COLUMN "public"."device_permission"."usb_status_id" IS 'USB状态ID（关联字典项：USB_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."usb_reason" IS 'USB开通理由';
COMMENT ON COLUMN "public"."device_permission"."usb_expire_date" IS 'USB使用截至日期';
COMMENT ON COLUMN "public"."device_permission"."antivirus_status_id" IS '防病毒状态ID（关联字典项：ANTIVIRUS_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."no_symantec_reason" IS '无Symantec理由';
COMMENT ON COLUMN "public"."device_permission"."remark" IS '备注';
COMMENT ON COLUMN "public"."device_permission"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."device_permission"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."device_permission"."updater" IS '修改者';
COMMENT ON COLUMN "public"."device_permission"."computer_name" IS 'コンピュータ名';
COMMENT ON COLUMN "public"."device_permission"."login_username" IS 'ログインユーザ名';
COMMENT ON TABLE "public"."device_permission" IS '设备使用权限表（存储设备域、USB等权限）';

-- ----------------------------
-- Records of device_permission
-- ----------------------------
INSERT INTO "public"."device_permission" VALUES ('PERM_DEV001', 'EMP001', 7, NULL, NULL, 9, NULL, 11, NULL, NULL, 13, NULL, NULL, '2025-12-30 00:01:57.379709', '2025-12-30 16:50:39.27444', NULL, 'PC-DELL-001', 'zhangsan');
INSERT INTO "public"."device_permission" VALUES ('PERM_DEV002', 'EMP002', 8, NULL, NULL, 10, NULL, 12, NULL, NULL, 14, NULL, NULL, '2025-12-30 00:01:57.379709', '2025-12-30 16:50:39.27444', NULL, 'PC-HP-002', 'lisi');

-- ----------------------------
-- Table structure for dict_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."dict_item";
CREATE TABLE "public"."dict_item" (
  "dict_item_id" int8 NOT NULL DEFAULT nextval('dict_item_dict_item_id_seq'::regclass),
  "dict_type_id" int8 NOT NULL,
  "dict_item_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_item_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 DEFAULT 0,
  "is_enabled" int2 NOT NULL DEFAULT 1,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."dict_item"."dict_item_id" IS '字典项ID（主键）';
COMMENT ON COLUMN "public"."dict_item"."dict_type_id" IS '字典类型ID（外键）';
COMMENT ON COLUMN "public"."dict_item"."dict_item_code" IS '字典项编码（同类型内唯一）';
COMMENT ON COLUMN "public"."dict_item"."dict_item_name" IS '字典项名称';
COMMENT ON COLUMN "public"."dict_item"."sort" IS '排序号';
COMMENT ON COLUMN "public"."dict_item"."is_enabled" IS '是否启用（0=禁用，1=启用）';
COMMENT ON COLUMN "public"."dict_item"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."dict_item"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."dict_item" IS '字典项表（存储具体的固定取值）';

-- ----------------------------
-- Records of dict_item
-- ----------------------------
INSERT INTO "public"."dict_item" VALUES (1, 1, 'ADMIN', '管理员', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (2, 1, 'USER', '普通用户', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (3, 2, 'CONFIRMED', '已确认', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (4, 2, 'UNCONFIRMED', '未确认', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (5, 3, 'EXISTS', '存在', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (6, 3, 'NOT_EXISTS', '不存在', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (7, 4, 'JOINED', '已加入', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (8, 4, 'NOT_JOINED', '未加入', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (9, 5, 'INSTALLED', '已安装', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (10, 5, 'NOT_INSTALLED', '未安装', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (11, 6, 'ENABLED', '已启用', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (12, 6, 'DISABLED', '已禁用', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (13, 7, 'INSTALLED', '已安装', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (14, 7, 'NOT_INSTALLED', '未安装', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (15, 8, 'PASS', '通过', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (16, 8, 'FAIL', '未通过', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (17, 9, 'SEALED', '已封条', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (18, 9, 'NOT_SEALED', '未封条', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (19, 10, 'UP_TO_DATE', '最新', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (20, 10, 'OUT_OF_DATE', '过期', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (21, 11, 'ENABLED', '已开启', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (22, 11, 'DISABLED', '已关闭', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (23, 12, 'REQUIRED', '需要', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (24, 12, 'NOT_REQUIRED', '不需要', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (25, 13, 'Windows10', 'Windows10', 1, 1, '2025-12-30 00:20:20.051383', '2025-12-30 00:21:18.765407');
INSERT INTO "public"."dict_item" VALUES (26, 13, 'Windows 11', 'Windows 11', 2, 1, '2025-12-30 00:20:20.051383', '2025-12-30 00:21:19.481051');
INSERT INTO "public"."dict_item" VALUES (27, 14, '16.0', '16.0G', 1, 1, '2025-12-30 00:20:20.05333', '2025-12-30 00:21:31.368278');
INSERT INTO "public"."dict_item" VALUES (28, 14, '8.0', '8.0G', 2, 1, '2025-12-30 00:20:20.05333', '2025-12-30 00:21:33.243521');
INSERT INTO "public"."dict_item" VALUES (29, 15, '256.0', '256.0G', 1, 1, '2025-12-30 00:20:20.053988', '2025-12-30 00:21:38.745074');
INSERT INTO "public"."dict_item" VALUES (30, 15, '512.0', '512.0G', 2, 1, '2025-12-30 00:20:20.053988', '2025-12-30 00:21:40.271569');
INSERT INTO "public"."dict_item" VALUES (31, 16, '1024.0', '1024.0G', 1, 1, '2025-12-30 00:20:20.054598', '2025-12-30 00:21:41.598239');
INSERT INTO "public"."dict_item" VALUES (32, 16, '512.0', '512.0G', 2, 1, '2025-12-30 00:20:20.054598', '2025-12-30 00:21:44.011196');

-- ----------------------------
-- Table structure for dict_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."dict_type";
CREATE TABLE "public"."dict_type" (
  "dict_type_id" int8 NOT NULL DEFAULT nextval('dict_type_dict_type_id_seq'::regclass),
  "dict_type_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_type_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "is_enabled" int2 NOT NULL DEFAULT 1,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."dict_type"."dict_type_id" IS '字典类型ID（主键）';
COMMENT ON COLUMN "public"."dict_type"."dict_type_code" IS '字典类型编码（唯一）';
COMMENT ON COLUMN "public"."dict_type"."dict_type_name" IS '字典类型名称';
COMMENT ON COLUMN "public"."dict_type"."description" IS '字典类型描述';
COMMENT ON COLUMN "public"."dict_type"."is_enabled" IS '是否启用（0=禁用，1=启用）';
COMMENT ON COLUMN "public"."dict_type"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."dict_type"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."dict_type" IS '字典类型表（管理所有固定取值的分类）';

-- ----------------------------
-- Records of dict_type
-- ----------------------------
INSERT INTO "public"."dict_type" VALUES (1, 'USER_TYPE', '用户类型', '区分不同类型的用户', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (2, 'CONFIRM_STATUS', '确认状态', '是否确认的状态', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (3, 'EXIST_STATUS', '存在状态', '是否存在的状态', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (4, 'DOMAIN_STATUS', '域状态', '设备的域状态', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (5, 'SMARTIT_STATUS', 'SmartIT状态', '是否安装SmartIT', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (6, 'USB_STATUS', 'USB状态', 'USB接口的状态', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (7, 'ANTIVIRUS_STATUS', '防病毒状态', '防病毒软件状态', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (8, 'CHECK_RESULT', '检查结果', '抽样检查的结果状态', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (9, 'USB_SEAL_STATUS', 'USB封条状态', 'USB接口是否封条', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (10, 'PATCH_STATUS', '补丁状态', '安全补丁状态', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (11, 'ANTIVIRUS_PROTECTION_STATUS', '病毒防护状态', '病毒防护是否开启', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (12, 'BOOT_AUTH_STATUS', '开机认证状态', '开机是否需要认证', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (13, 'OS_TYPE', '操作系统类型', '存储设备的操作系统类型', 1, '2025-12-30 00:20:13.519898', '2025-12-30 00:20:13.519898');
INSERT INTO "public"."dict_type" VALUES (14, 'MEMORY_SIZE', '内存大小', '存储设备的内存容量（单位：G）', 1, '2025-12-30 00:20:13.521018', '2025-12-30 00:20:13.521018');
INSERT INTO "public"."dict_type" VALUES (15, 'SSD_SIZE', '固态硬盘大小', '存储设备的固态硬盘容量（单位：G）', 1, '2025-12-30 00:20:13.521463', '2025-12-30 00:20:13.521463');
INSERT INTO "public"."dict_type" VALUES (16, 'HDD_SIZE', '机械硬盘大小', '存储设备的机械硬盘容量（单位：G）', 1, '2025-12-30 00:20:13.521895', '2025-12-30 00:20:13.521895');

-- ----------------------------
-- Table structure for monitor_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."monitor_info";
CREATE TABLE "public"."monitor_info" (
  "monitor_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."monitor_info"."monitor_id" IS '显示器编号（主键）';
COMMENT ON COLUMN "public"."monitor_info"."device_id" IS '设备编号（外键）';
COMMENT ON COLUMN "public"."monitor_info"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."monitor_info"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."monitor_info"."updater" IS '修改者';
COMMENT ON TABLE "public"."monitor_info" IS '显示器信息表（存储设备关联的显示器）';

-- ----------------------------
-- Records of monitor_info
-- ----------------------------
INSERT INTO "public"."monitor_info" VALUES ('MON001', 'DEV001', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."monitor_info" VALUES ('MON002', 'DEV002', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- Table structure for monthly_check_report
-- ----------------------------
DROP TABLE IF EXISTS "public"."monthly_check_report";
CREATE TABLE "public"."monthly_check_report" (
  "report_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "update_date" date NOT NULL,
  "security_promoter" varchar(100) COLLATE "pg_catalog"."default",
  "security_responsible" varchar(100) COLLATE "pg_catalog"."default",
  "quality_dept" varchar(100) COLLATE "pg_catalog"."default",
  "check_remark" text COLLATE "pg_catalog"."default",
  "check_description" text COLLATE "pg_catalog"."default",
  "work_area" varchar(100) COLLATE "pg_catalog"."default",
  "dept_id" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."monthly_check_report"."report_id" IS '报告编号（主键）';
COMMENT ON COLUMN "public"."monthly_check_report"."update_date" IS '更新日期';
COMMENT ON COLUMN "public"."monthly_check_report"."security_promoter" IS '信息安全推进人';
COMMENT ON COLUMN "public"."monthly_check_report"."security_responsible" IS '信息安全责任人';
COMMENT ON COLUMN "public"."monthly_check_report"."quality_dept" IS '品质管理部';
COMMENT ON COLUMN "public"."monthly_check_report"."check_remark" IS '检查备注';
COMMENT ON COLUMN "public"."monthly_check_report"."check_description" IS '检查说明';
COMMENT ON COLUMN "public"."monthly_check_report"."work_area" IS '工作区域';
COMMENT ON COLUMN "public"."monthly_check_report"."dept_id" IS '部门号（外键）';
COMMENT ON COLUMN "public"."monthly_check_report"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."monthly_check_report"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."monthly_check_report"."updater" IS '修改者';
COMMENT ON TABLE "public"."monthly_check_report" IS '月度检查报告表（存储月度安全检查总报告）';

-- ----------------------------
-- Records of monthly_check_report
-- ----------------------------
INSERT INTO "public"."monthly_check_report" VALUES ('REPORT001', '2025-12-01', '王五', '赵六', '品质部', NULL, NULL, 'AreaA', 'DEPT001', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- Table structure for non_sampling_check
-- ----------------------------
DROP TABLE IF EXISTS "public"."non_sampling_check";
CREATE TABLE "public"."non_sampling_check" (
  "non_sampling_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "report_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "private_mobile_dev_id" int8,
  "unrecorded_wifi_id" int8,
  "floor_access_closed_id" int8,
  "public_mobile_dev_out_id" int8,
  "ic_card_worn_id" int8,
  "copier_no_doc_id" int8,
  "printer_no_doc_id" int8,
  "no_idle_device_id" int8,
  "desk_no_doc_id" int8,
  "disposal_measures" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."non_sampling_check"."non_sampling_id" IS '非抽样检查编号（主键）';
COMMENT ON COLUMN "public"."non_sampling_check"."report_id" IS '报告编号（外键）';
COMMENT ON COLUMN "public"."non_sampling_check"."private_mobile_dev_id" IS '私人移动设备状态ID（关联字典项：EXIST_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."unrecorded_wifi_id" IS '未备案WiFi状态ID（关联字典项：EXIST_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."floor_access_closed_id" IS '楼层门禁状态ID（关联字典项：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."public_mobile_dev_out_id" IS '公用移动设备带出状态ID（关联字典项：EXIST_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."ic_card_worn_id" IS 'IC卡佩带状态ID（关联字典项：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."copier_no_doc_id" IS '复印机文档遗留状态ID（关联字典项：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."printer_no_doc_id" IS '打印机文档遗留状态ID（关联字典项：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."no_idle_device_id" IS '闲散设备状态ID（关联字典项：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."desk_no_doc_id" IS '办公桌文档遗留状态ID（关联字典项：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."disposal_measures" IS '处置措施';
COMMENT ON COLUMN "public"."non_sampling_check"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."non_sampling_check"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."non_sampling_check"."updater" IS '修改者';
COMMENT ON TABLE "public"."non_sampling_check" IS '非抽样检查表（存储非抽样检查细节）';

-- ----------------------------
-- Records of non_sampling_check
-- ----------------------------
INSERT INTO "public"."non_sampling_check" VALUES ('NSC001', 'REPORT001', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-30 00:01:57.379709', '2025-12-30 00:18:06.386484', NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission";
CREATE TABLE "public"."permission" (
  "permission_id" int8 NOT NULL DEFAULT nextval('permission_permission_id_seq'::regclass),
  "permission_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "permission_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "resource_type" varchar(20) COLLATE "pg_catalog"."default",
  "resource_key" varchar(100) COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."permission"."permission_id" IS '权限ID（主键）';
COMMENT ON COLUMN "public"."permission"."permission_name" IS '权限名称';
COMMENT ON COLUMN "public"."permission"."permission_code" IS '权限编码（唯一）';
COMMENT ON COLUMN "public"."permission"."resource_type" IS '资源类型（菜单/按钮/接口）';
COMMENT ON COLUMN "public"."permission"."resource_key" IS '资源标识（如菜单URL）';
COMMENT ON COLUMN "public"."permission"."description" IS '权限描述';
COMMENT ON COLUMN "public"."permission"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."permission" IS '权限表（存储系统权限）';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO "public"."permission" VALUES (1, '查看用户', 'PERM_VIEW_USER', '菜单', '/user/list', NULL, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."permission" VALUES (2, '编辑用户', 'PERM_EDIT_USER', '按钮', '/user/edit', NULL, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."permission" VALUES (3, '查看设备', 'PERM_VIEW_DEVICE', '菜单', '/device/list', NULL, '2025-12-30 00:01:57.379709');

-- ----------------------------
-- Table structure for permission_device_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission_device_info";
CREATE TABLE "public"."permission_device_info" (
  "permission_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."permission_device_info"."permission_id" IS '权限编号（外键，关联device_permission.permission_id）';
COMMENT ON COLUMN "public"."permission_device_info"."device_id" IS '设备编号（主键）';
COMMENT ON COLUMN "public"."permission_device_info"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."permission_device_info"."updater" IS '修改者';
COMMENT ON TABLE "public"."permission_device_info" IS '权限设备信息表（关联设备与权限）';

-- ----------------------------
-- Records of permission_device_info
-- ----------------------------

-- ----------------------------
-- Table structure for permission_ip
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission_ip";
CREATE TABLE "public"."permission_ip" (
  "ip_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "permission_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "ip_address" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default",
  "is_deleted" int2 NOT NULL DEFAULT 0
)
;
COMMENT ON COLUMN "public"."permission_ip"."ip_id" IS 'IP番号（主キー）';
COMMENT ON COLUMN "public"."permission_ip"."permission_id" IS '権限番号（外部キー、device_permission.permission_idに関連）';
COMMENT ON COLUMN "public"."permission_ip"."ip_address" IS 'IPアドレス';
COMMENT ON COLUMN "public"."permission_ip"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."permission_ip"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."permission_ip"."updater" IS '更新者';
COMMENT ON COLUMN "public"."permission_ip"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';
COMMENT ON TABLE "public"."permission_ip" IS '権限IP情報テーブル（機器権限とIPを紐づけ）';

-- ----------------------------
-- Records of permission_ip
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS "public"."role";
CREATE TABLE "public"."role" (
  "role_id" int8 NOT NULL DEFAULT nextval('role_role_id_seq'::regclass),
  "role_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "role_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."role"."role_id" IS '角色ID（主键）';
COMMENT ON COLUMN "public"."role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."role"."role_code" IS '角色编码（唯一）';
COMMENT ON COLUMN "public"."role"."description" IS '角色描述';
COMMENT ON COLUMN "public"."role"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."role"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."role" IS '角色表（存储系统角色）';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO "public"."role" VALUES (1, '系统管理员', 'ROLE_ADMIN', '拥有系统所有权限', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role" VALUES (2, '普通用户', 'ROLE_USER', '拥有普通用户权限', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permission";
CREATE TABLE "public"."role_permission" (
  "role_permission_id" int8 NOT NULL DEFAULT nextval('role_permission_role_permission_id_seq'::regclass),
  "role_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."role_permission"."role_permission_id" IS '角色权限关联ID（主键）';
COMMENT ON COLUMN "public"."role_permission"."role_id" IS '角色ID（外键）';
COMMENT ON COLUMN "public"."role_permission"."permission_id" IS '权限ID（外键）';
COMMENT ON COLUMN "public"."role_permission"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."role_permission" IS '角色权限关联表（实现角色-权限映射）';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO "public"."role_permission" VALUES (1, 1, 1, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role_permission" VALUES (2, 1, 2, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role_permission" VALUES (3, 1, 3, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role_permission" VALUES (4, 2, 3, '2025-12-30 00:01:57.379709');

-- ----------------------------
-- Table structure for sampling_check
-- ----------------------------
DROP TABLE IF EXISTS "public"."sampling_check";
CREATE TABLE "public"."sampling_check" (
  "sampling_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "job_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "screen_saver_pwd_id" int8,
  "installed_software" text COLLATE "pg_catalog"."default",
  "disposal_measures" text COLLATE "pg_catalog"."default",
  "usb_interface_id" int8,
  "security_patch_id" int8,
  "antivirus_protection_id" int8,
  "boot_authentication_id" int8,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sampling_check"."sampling_id" IS '抽样检查编号（主键）';
COMMENT ON COLUMN "public"."sampling_check"."job_number" IS '工号（外键）';
COMMENT ON COLUMN "public"."sampling_check"."device_id" IS '设备编号（外键）';
COMMENT ON COLUMN "public"."sampling_check"."screen_saver_pwd_id" IS '密码屏保状态ID（关联字典项：CHECK_RESULT）';
COMMENT ON COLUMN "public"."sampling_check"."installed_software" IS '安装软件';
COMMENT ON COLUMN "public"."sampling_check"."disposal_measures" IS '处置措施';
COMMENT ON COLUMN "public"."sampling_check"."usb_interface_id" IS 'USB接口状态ID（关联字典项：USB_SEAL_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."security_patch_id" IS '安全补丁状态ID（关联字典项：PATCH_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."antivirus_protection_id" IS '病毒防护状态ID（关联字典项：ANTIVIRUS_PROTECTION_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."boot_authentication_id" IS '开机认证状态ID（关联字典项：BOOT_AUTH_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."name" IS '姓名（关联用户表）';
COMMENT ON COLUMN "public"."sampling_check"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."sampling_check"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."sampling_check"."updater" IS '修改者';
COMMENT ON TABLE "public"."sampling_check" IS '抽样检查表（存储抽样检查细节）';

-- ----------------------------
-- Records of sampling_check
-- ----------------------------
INSERT INTO "public"."sampling_check" VALUES ('SC001', 'EMP001', 'DEV001', 1, NULL, NULL, 1, 1, 1, 2, '张三', '2025-12-30 00:01:57.379709', '2025-12-30 00:19:11.833172', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "user_id" int8 NOT NULL DEFAULT nextval('user_user_id_seq'::regclass),
  "dept_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "job_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "user_type_id" int8,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."user"."user_id" IS '用户ID（主键）';
COMMENT ON COLUMN "public"."user"."dept_id" IS '部门号';
COMMENT ON COLUMN "public"."user"."name" IS '姓名';
COMMENT ON COLUMN "public"."user"."job_number" IS '工号（唯一，关联设备/权限）';
COMMENT ON COLUMN "public"."user"."user_type_id" IS '用户类型ID（关联字典项：USER_TYPE）';
COMMENT ON COLUMN "public"."user"."password" IS '密码（加密存储）';
COMMENT ON COLUMN "public"."user"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."user"."update_time" IS '修改时间';
COMMENT ON COLUMN "public"."user"."updater" IS '修改者';
COMMENT ON TABLE "public"."user" IS '用户表（存储用户基础信息）';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user" VALUES (1, 'DEPT001', '张三', 'EMP001', 1, 'encrypted_pwd_123', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."user" VALUES (2, 'DEPT002', '李四', 'EMP002', 2, 'encrypted_pwd_456', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- Table structure for user_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_permission";
CREATE TABLE "public"."user_permission" (
  "user_permission_id" int8 NOT NULL DEFAULT nextval('user_permission_user_permission_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL,
  "grant_type" varchar(20) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."user_permission"."user_permission_id" IS '用户权限覆盖ID（主键）';
COMMENT ON COLUMN "public"."user_permission"."user_id" IS '用户ID（外键）';
COMMENT ON COLUMN "public"."user_permission"."permission_id" IS '权限ID（外键）';
COMMENT ON COLUMN "public"."user_permission"."grant_type" IS '授权类型（允许/拒绝）';
COMMENT ON COLUMN "public"."user_permission"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."user_permission" IS '用户权限覆盖表（实现用户个性化权限）';

-- ----------------------------
-- Records of user_permission
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_role";
CREATE TABLE "public"."user_role" (
  "user_role_id" int8 NOT NULL DEFAULT nextval('user_role_user_role_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."user_role"."user_role_id" IS '用户角色关联ID（主键）';
COMMENT ON COLUMN "public"."user_role"."user_id" IS '用户ID（外键）';
COMMENT ON COLUMN "public"."user_role"."role_id" IS '角色ID（外键）';
COMMENT ON COLUMN "public"."user_role"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."user_role" IS '用户角色关联表（实现用户-角色映射）';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO "public"."user_role" VALUES (1, 1, 1, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."user_role" VALUES (2, 2, 2, '2025-12-30 00:01:57.379709');

-- ----------------------------
-- Function structure for update_modified_column
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."update_modified_column"();
CREATE FUNCTION "public"."update_modified_column"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
    NEW.update_time = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dict_item_dict_item_id_seq"
OWNED BY "public"."dict_item"."dict_item_id";
SELECT setval('"public"."dict_item_dict_item_id_seq"', 32, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dict_type_dict_type_id_seq"
OWNED BY "public"."dict_type"."dict_type_id";
SELECT setval('"public"."dict_type_dict_type_id_seq"', 16, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permission_permission_id_seq"
OWNED BY "public"."permission"."permission_id";
SELECT setval('"public"."permission_permission_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_permission_role_permission_id_seq"
OWNED BY "public"."role_permission"."role_permission_id";
SELECT setval('"public"."role_permission_role_permission_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."role_role_id_seq"
OWNED BY "public"."role"."role_id";
SELECT setval('"public"."role_role_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_permission_user_permission_id_seq"
OWNED BY "public"."user_permission"."user_permission_id";
SELECT setval('"public"."user_permission_user_permission_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_role_user_role_id_seq"
OWNED BY "public"."user_role"."user_role_id";
SELECT setval('"public"."user_role_user_role_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_user_id_seq"
OWNED BY "public"."user"."user_id";
SELECT setval('"public"."user_user_id_seq"', 2, true);

-- ----------------------------
-- Indexes structure for table device_info
-- ----------------------------
CREATE INDEX "fk_device_hdd" ON "public"."device_info" USING btree (
  "hdd_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_device_memory" ON "public"."device_info" USING btree (
  "memory_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_device_os" ON "public"."device_info" USING btree (
  "os_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_device_self_confirm" ON "public"."device_info" USING btree (
  "self_confirm_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_device_ssd" ON "public"."device_info" USING btree (
  "ssd_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_device_user" ON "public"."device_info" USING btree (
  "job_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table device_info
-- ----------------------------
CREATE TRIGGER "trigger_update_device_info" BEFORE UPDATE ON "public"."device_info"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table device_info
-- ----------------------------
ALTER TABLE "public"."device_info" ADD CONSTRAINT "device_info_pkey" PRIMARY KEY ("device_id");

-- ----------------------------
-- Indexes structure for table device_ip
-- ----------------------------
CREATE INDEX "fk_device_ip" ON "public"."device_ip" USING btree (
  "device_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_device_ip_address" ON "public"."device_ip" USING btree (
  "ip_address" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table device_ip
-- ----------------------------
CREATE TRIGGER "trigger_update_device_ip" BEFORE UPDATE ON "public"."device_ip"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table device_ip
-- ----------------------------
ALTER TABLE "public"."device_ip" ADD CONSTRAINT "device_ip_pkey" PRIMARY KEY ("ip_id");

-- ----------------------------
-- Indexes structure for table device_permission
-- ----------------------------
CREATE INDEX "fk_permission_antivirus" ON "public"."device_permission" USING btree (
  "antivirus_status_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_permission_domain" ON "public"."device_permission" USING btree (
  "domain_status_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_permission_smartit" ON "public"."device_permission" USING btree (
  "smartit_status_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_permission_usb" ON "public"."device_permission" USING btree (
  "usb_status_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_permission_user" ON "public"."device_permission" USING btree (
  "job_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table device_permission
-- ----------------------------
CREATE TRIGGER "trigger_update_device_permission" BEFORE UPDATE ON "public"."device_permission"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table device_permission
-- ----------------------------
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_pkey" PRIMARY KEY ("permission_id");

-- ----------------------------
-- Indexes structure for table dict_item
-- ----------------------------
CREATE INDEX "fk_dict_item_type" ON "public"."dict_item" USING btree (
  "dict_type_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_dict_type_code_item_code" ON "public"."dict_item" USING btree (
  "dict_type_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "dict_item_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table dict_item
-- ----------------------------
CREATE TRIGGER "trigger_update_dict_item" BEFORE UPDATE ON "public"."dict_item"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table dict_item
-- ----------------------------
ALTER TABLE "public"."dict_item" ADD CONSTRAINT "dict_item_pkey" PRIMARY KEY ("dict_item_id");

-- ----------------------------
-- Indexes structure for table dict_type
-- ----------------------------
CREATE UNIQUE INDEX "uk_dict_type_code" ON "public"."dict_type" USING btree (
  "dict_type_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table dict_type
-- ----------------------------
CREATE TRIGGER "trigger_update_dict_type" BEFORE UPDATE ON "public"."dict_type"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table dict_type
-- ----------------------------
ALTER TABLE "public"."dict_type" ADD CONSTRAINT "dict_type_pkey" PRIMARY KEY ("dict_type_id");

-- ----------------------------
-- Indexes structure for table monitor_info
-- ----------------------------
CREATE INDEX "fk_monitor_device" ON "public"."monitor_info" USING btree (
  "device_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table monitor_info
-- ----------------------------
CREATE TRIGGER "trigger_update_monitor_info" BEFORE UPDATE ON "public"."monitor_info"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table monitor_info
-- ----------------------------
ALTER TABLE "public"."monitor_info" ADD CONSTRAINT "monitor_info_pkey" PRIMARY KEY ("monitor_id");

-- ----------------------------
-- Indexes structure for table monthly_check_report
-- ----------------------------
CREATE INDEX "fk_report_dept" ON "public"."monthly_check_report" USING btree (
  "dept_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table monthly_check_report
-- ----------------------------
CREATE TRIGGER "trigger_update_monthly_check_report" BEFORE UPDATE ON "public"."monthly_check_report"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table monthly_check_report
-- ----------------------------
ALTER TABLE "public"."monthly_check_report" ADD CONSTRAINT "monthly_check_report_pkey" PRIMARY KEY ("report_id");

-- ----------------------------
-- Indexes structure for table non_sampling_check
-- ----------------------------
CREATE INDEX "fk_non_sampling_copier" ON "public"."non_sampling_check" USING btree (
  "copier_no_doc_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_desk" ON "public"."non_sampling_check" USING btree (
  "desk_no_doc_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_floor_access" ON "public"."non_sampling_check" USING btree (
  "floor_access_closed_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_ic_card" ON "public"."non_sampling_check" USING btree (
  "ic_card_worn_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_idle_device" ON "public"."non_sampling_check" USING btree (
  "no_idle_device_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_printer" ON "public"."non_sampling_check" USING btree (
  "printer_no_doc_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_private_mobile" ON "public"."non_sampling_check" USING btree (
  "private_mobile_dev_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_public_mobile" ON "public"."non_sampling_check" USING btree (
  "public_mobile_dev_out_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_report" ON "public"."non_sampling_check" USING btree (
  "report_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "fk_non_sampling_unrecorded_wifi" ON "public"."non_sampling_check" USING btree (
  "unrecorded_wifi_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table non_sampling_check
-- ----------------------------
CREATE TRIGGER "trigger_update_non_sampling_check" BEFORE UPDATE ON "public"."non_sampling_check"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table non_sampling_check
-- ----------------------------
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_pkey" PRIMARY KEY ("non_sampling_id");

-- ----------------------------
-- Indexes structure for table permission
-- ----------------------------
CREATE UNIQUE INDEX "uk_permission_code" ON "public"."permission" USING btree (
  "permission_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table permission
-- ----------------------------
ALTER TABLE "public"."permission" ADD CONSTRAINT "permission_pkey" PRIMARY KEY ("permission_id");

-- ----------------------------
-- Indexes structure for table permission_device_info
-- ----------------------------
CREATE INDEX "fk_permission_device_permission" ON "public"."permission_device_info" USING btree (
  "permission_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table permission_device_info
-- ----------------------------
CREATE TRIGGER "trigger_update_permission_device_info" BEFORE UPDATE ON "public"."permission_device_info"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table permission_device_info
-- ----------------------------
ALTER TABLE "public"."permission_device_info" ADD CONSTRAINT "permission_device_info_pkey" PRIMARY KEY ("device_id");

-- ----------------------------
-- Indexes structure for table permission_ip
-- ----------------------------
CREATE INDEX "fk_permission_ip_permission" ON "public"."permission_ip" USING btree (
  "permission_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table permission_ip
-- ----------------------------
CREATE TRIGGER "trigger_update_permission_ip" BEFORE UPDATE ON "public"."permission_ip"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table permission_ip
-- ----------------------------
ALTER TABLE "public"."permission_ip" ADD CONSTRAINT "permission_ip_pkey" PRIMARY KEY ("ip_id");

-- ----------------------------
-- Indexes structure for table role
-- ----------------------------
CREATE UNIQUE INDEX "uk_role_code" ON "public"."role" USING btree (
  "role_code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table role
-- ----------------------------
CREATE TRIGGER "trigger_update_role" BEFORE UPDATE ON "public"."role"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table role
-- ----------------------------
ALTER TABLE "public"."role" ADD CONSTRAINT "role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Indexes structure for table role_permission
-- ----------------------------
CREATE INDEX "fk_role_permission_permission" ON "public"."role_permission" USING btree (
  "permission_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_role_permission_role" ON "public"."role_permission" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_role_permission" ON "public"."role_permission" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "permission_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table role_permission
-- ----------------------------
ALTER TABLE "public"."role_permission" ADD CONSTRAINT "role_permission_pkey" PRIMARY KEY ("role_permission_id");

-- ----------------------------
-- Indexes structure for table sampling_check
-- ----------------------------
CREATE INDEX "fk_sampling_antivirus_protection" ON "public"."sampling_check" USING btree (
  "antivirus_protection_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sampling_boot_auth" ON "public"."sampling_check" USING btree (
  "boot_authentication_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sampling_device" ON "public"."sampling_check" USING btree (
  "device_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sampling_patch" ON "public"."sampling_check" USING btree (
  "security_patch_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sampling_screen_saver" ON "public"."sampling_check" USING btree (
  "screen_saver_pwd_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sampling_usb_interface" ON "public"."sampling_check" USING btree (
  "usb_interface_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_sampling_user" ON "public"."sampling_check" USING btree (
  "job_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table sampling_check
-- ----------------------------
CREATE TRIGGER "trigger_update_sampling_check" BEFORE UPDATE ON "public"."sampling_check"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table sampling_check
-- ----------------------------
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_pkey" PRIMARY KEY ("sampling_id");

-- ----------------------------
-- Indexes structure for table user
-- ----------------------------
CREATE INDEX "fk_user_type" ON "public"."user" USING btree (
  "user_type_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_user_job_number" ON "public"."user" USING btree (
  "job_number" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
CREATE TRIGGER "trigger_update_user" BEFORE UPDATE ON "public"."user"
FOR EACH ROW
EXECUTE PROCEDURE "public"."update_modified_column"();

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Indexes structure for table user_permission
-- ----------------------------
CREATE INDEX "fk_user_permission_permission" ON "public"."user_permission" USING btree (
  "permission_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_user_permission_user" ON "public"."user_permission" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_user_permission" ON "public"."user_permission" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "permission_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table user_permission
-- ----------------------------
ALTER TABLE "public"."user_permission" ADD CONSTRAINT "user_permission_pkey" PRIMARY KEY ("user_permission_id");

-- ----------------------------
-- Indexes structure for table user_role
-- ----------------------------
CREATE INDEX "fk_user_role_role" ON "public"."user_role" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "fk_user_role_user" ON "public"."user_role" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE UNIQUE INDEX "uk_user_role" ON "public"."user_role" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table user_role
-- ----------------------------
ALTER TABLE "public"."user_role" ADD CONSTRAINT "user_role_pkey" PRIMARY KEY ("user_role_id");

-- ----------------------------
-- Foreign Keys structure for table device_info
-- ----------------------------
ALTER TABLE "public"."device_info" ADD CONSTRAINT "device_info_hdd_id_fkey" FOREIGN KEY ("hdd_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."device_info" ADD CONSTRAINT "device_info_job_number_fkey" FOREIGN KEY ("job_number") REFERENCES "public"."user" ("job_number") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."device_info" ADD CONSTRAINT "device_info_memory_id_fkey" FOREIGN KEY ("memory_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."device_info" ADD CONSTRAINT "device_info_os_id_fkey" FOREIGN KEY ("os_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."device_info" ADD CONSTRAINT "device_info_self_confirm_id_fkey" FOREIGN KEY ("self_confirm_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."device_info" ADD CONSTRAINT "device_info_ssd_id_fkey" FOREIGN KEY ("ssd_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table device_ip
-- ----------------------------
ALTER TABLE "public"."device_ip" ADD CONSTRAINT "device_ip_device_id_fkey" FOREIGN KEY ("device_id") REFERENCES "public"."device_info" ("device_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table device_permission
-- ----------------------------
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_antivirus_status_id_fkey" FOREIGN KEY ("antivirus_status_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_domain_status_id_fkey" FOREIGN KEY ("domain_status_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_job_number_fkey" FOREIGN KEY ("job_number") REFERENCES "public"."user" ("job_number") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_smartit_status_id_fkey" FOREIGN KEY ("smartit_status_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_usb_status_id_fkey" FOREIGN KEY ("usb_status_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table dict_item
-- ----------------------------
ALTER TABLE "public"."dict_item" ADD CONSTRAINT "dict_item_dict_type_id_fkey" FOREIGN KEY ("dict_type_id") REFERENCES "public"."dict_type" ("dict_type_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table monitor_info
-- ----------------------------
ALTER TABLE "public"."monitor_info" ADD CONSTRAINT "monitor_info_device_id_fkey" FOREIGN KEY ("device_id") REFERENCES "public"."device_info" ("device_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table non_sampling_check
-- ----------------------------
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_copier_no_doc_id_fkey" FOREIGN KEY ("copier_no_doc_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_desk_no_doc_id_fkey" FOREIGN KEY ("desk_no_doc_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_floor_access_closed_id_fkey" FOREIGN KEY ("floor_access_closed_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_ic_card_worn_id_fkey" FOREIGN KEY ("ic_card_worn_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_no_idle_device_id_fkey" FOREIGN KEY ("no_idle_device_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_printer_no_doc_id_fkey" FOREIGN KEY ("printer_no_doc_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_private_mobile_dev_id_fkey" FOREIGN KEY ("private_mobile_dev_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_public_mobile_dev_out_id_fkey" FOREIGN KEY ("public_mobile_dev_out_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_report_id_fkey" FOREIGN KEY ("report_id") REFERENCES "public"."monthly_check_report" ("report_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."non_sampling_check" ADD CONSTRAINT "non_sampling_check_unrecorded_wifi_id_fkey" FOREIGN KEY ("unrecorded_wifi_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table permission_device_info
-- ----------------------------
ALTER TABLE "public"."permission_device_info" ADD CONSTRAINT "permission_device_info_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."device_permission" ("permission_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table permission_ip
-- ----------------------------
ALTER TABLE "public"."permission_ip" ADD CONSTRAINT "permission_ip_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."device_permission" ("permission_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table role_permission
-- ----------------------------
ALTER TABLE "public"."role_permission" ADD CONSTRAINT "role_permission_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."permission" ("permission_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."role_permission" ADD CONSTRAINT "role_permission_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."role" ("role_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table sampling_check
-- ----------------------------
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_antivirus_protection_id_fkey" FOREIGN KEY ("antivirus_protection_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_boot_authentication_id_fkey" FOREIGN KEY ("boot_authentication_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_device_id_fkey" FOREIGN KEY ("device_id") REFERENCES "public"."device_info" ("device_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_job_number_fkey" FOREIGN KEY ("job_number") REFERENCES "public"."user" ("job_number") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_screen_saver_pwd_id_fkey" FOREIGN KEY ("screen_saver_pwd_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_security_patch_id_fkey" FOREIGN KEY ("security_patch_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_usb_interface_id_fkey" FOREIGN KEY ("usb_interface_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_user_type_id_fkey" FOREIGN KEY ("user_type_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table user_permission
-- ----------------------------
ALTER TABLE "public"."user_permission" ADD CONSTRAINT "user_permission_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."permission" ("permission_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."user_permission" ADD CONSTRAINT "user_permission_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table user_role
-- ----------------------------
ALTER TABLE "public"."user_role" ADD CONSTRAINT "user_role_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."role" ("role_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."user_role" ADD CONSTRAINT "user_role_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."user" ("user_id") ON DELETE CASCADE ON UPDATE CASCADE;
