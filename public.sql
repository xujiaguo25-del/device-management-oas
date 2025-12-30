/*
 Navicat Premium Dump SQL

 Source Server         : localhost_5432
 Source Server Type    : PostgreSQL
 Source Server Version : 180001 (180001)
 Source Host           : localhost:5432
 Source Catalog        : test
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 180001 (180001)
 File Encoding         : 65001

 Date: 30/12/2025 00:22:37
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
COMMENT ON COLUMN "public"."device_info"."device_id" IS '機器番号（主キー）';
COMMENT ON COLUMN "public"."device_info"."device_model" IS 'ホスト機種';
COMMENT ON COLUMN "public"."device_info"."computer_name" IS 'コンピュータ名';
COMMENT ON COLUMN "public"."device_info"."login_username" IS 'ログインユーザ名';
COMMENT ON COLUMN "public"."device_info"."project" IS '所属プロジェクト';
COMMENT ON COLUMN "public"."device_info"."dev_room" IS '所属開発室';
COMMENT ON COLUMN "public"."device_info"."job_number" IS '社員番号（所属ユーザー、外部キー）';
COMMENT ON COLUMN "public"."device_info"."remark" IS '備考';
COMMENT ON COLUMN "public"."device_info"."self_confirm_id" IS '本人確認ID（ディクショナリ項目に関連：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."device_info"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."device_info"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."device_info"."updater" IS '更新者';
COMMENT ON TABLE "public"."device_info" IS '機器情報テーブル（機器ハードウェア構成を保存）';

-- ----------------------------
-- device_infoのレコード
-- ----------------------------
INSERT INTO "public"."device_info" VALUES ('DEV001', 'Dell XPS', 'PC-DELL-001', 'zhangsan', 'Project A', 'Room101', 'EMP001', NULL, 3, '2025-12-30 00:01:57.379709', '2025-12-30 00:22:01.695568', NULL, 2, 2, 1, 1);
INSERT INTO "public"."device_info" VALUES ('DEV002', 'HP ProBook', 'PC-HP-002', 'lisi', 'Project B', 'Room102', 'EMP002', NULL, 4, '2025-12-30 00:01:57.379709', '2025-12-30 00:22:29.661355', NULL, 2, 2, 1, 1);

-- ----------------------------
-- device_ipのテーブル構造
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
COMMENT ON COLUMN "public"."device_ip"."ip_id" IS 'IP番号（主キー）';
COMMENT ON COLUMN "public"."device_ip"."device_id" IS '機器番号（外部キー）';
COMMENT ON COLUMN "public"."device_ip"."ip_address" IS 'IPアドレス（ユニーク）';
COMMENT ON COLUMN "public"."device_ip"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."device_ip"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."device_ip"."updater" IS '更新者';
COMMENT ON TABLE "public"."device_ip" IS '機器IPテーブル（機器に紐づくIPアドレスを保存）';

-- ----------------------------
-- device_ipのレコード
-- ----------------------------
INSERT INTO "public"."device_ip" VALUES ('IP001', 'DEV001', '192.168.1.101', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."device_ip" VALUES ('IP002', 'DEV002', '192.168.1.102', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- device_permissionのテーブル構造
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
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."device_permission"."permission_id" IS '権限番号（主キー）';
COMMENT ON COLUMN "public"."device_permission"."job_number" IS '社員番号（外部キー）';
COMMENT ON COLUMN "public"."device_permission"."domain_status_id" IS 'ドメインステータスID（ディクショナリ項目に関連：DOMAIN_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."domain_group" IS 'ドメイン内グループ名';
COMMENT ON COLUMN "public"."device_permission"."no_domain_reason" IS 'ドメイン未加入理由';
COMMENT ON COLUMN "public"."device_permission"."smartit_status_id" IS 'SmartITステータスID（ディクショナリ項目に関連：SMARTIT_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."no_smartit_reason" IS 'SmartIT未インストール理由';
COMMENT ON COLUMN "public"."device_permission"."usb_status_id" IS 'USBステータスID（ディクショナリ項目に関連：USB_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."usb_reason" IS 'USB使用許可理由';
COMMENT ON COLUMN "public"."device_permission"."usb_expire_date" IS 'USB使用有効期限';
COMMENT ON COLUMN "public"."device_permission"."antivirus_status_id" IS 'ウイルス対策ステータスID（ディクショナリ項目に関連：ANTIVIRUS_STATUS）';
COMMENT ON COLUMN "public"."device_permission"."no_symantec_reason" IS 'Symantec未導入理由';
COMMENT ON COLUMN "public"."device_permission"."remark" IS '備考';
COMMENT ON COLUMN "public"."device_permission"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."device_permission"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."device_permission"."updater" IS '更新者';
COMMENT ON TABLE "public"."device_permission" IS '機器使用権限テーブル（機器のドメイン・USB等の権限を保存）';

-- ----------------------------
-- device_permissionのレコード
-- ----------------------------
INSERT INTO "public"."device_permission" VALUES ('PERM_DEV001', 'EMP001', 7, NULL, NULL, 9, NULL, 11, NULL, NULL, 13, NULL, NULL, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."device_permission" VALUES ('PERM_DEV002', 'EMP002', 8, NULL, NULL, 10, NULL, 12, NULL, NULL, 14, NULL, NULL, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- dict_itemのテーブル構造
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
COMMENT ON COLUMN "public"."dict_item"."dict_item_id" IS 'ディクショナリ項目ID（主キー）';
COMMENT ON COLUMN "public"."dict_item"."dict_type_id" IS 'ディクショナリタイプID（外部キー）';
COMMENT ON COLUMN "public"."dict_item"."dict_item_code" IS 'ディクショナリ項目コード（同一タイプ内ユニーク）';
COMMENT ON COLUMN "public"."dict_item"."dict_item_name" IS 'ディクショナリ項目名';
COMMENT ON COLUMN "public"."dict_item"."sort" IS 'ソート番号';
COMMENT ON COLUMN "public"."dict_item"."is_enabled" IS '有効フラグ（0=無効、1=有効）';
COMMENT ON COLUMN "public"."dict_item"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."dict_item"."update_time" IS '更新時間';
COMMENT ON TABLE "public"."dict_item" IS 'ディクショナリ項目テーブル（固定値の具体的な内容を保存）';

-- ----------------------------
-- dict_itemのレコード
-- ----------------------------
INSERT INTO "public"."dict_item" VALUES (1, 1, 'ADMIN', '管理者', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (2, 1, 'USER', '一般ユーザー', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (3, 2, 'CONFIRMED', '確認済', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (4, 2, 'UNCONFIRMED', '未確認', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (5, 3, 'EXISTS', '存在する', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (6, 3, 'NOT_EXISTS', '存在しない', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (7, 4, 'JOINED', '加入済', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (8, 4, 'NOT_JOINED', '未加入', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (9, 5, 'INSTALLED', 'インストール済', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (10, 5, 'NOT_INSTALLED', '未インストール', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (11, 6, 'ENABLED', '有効化済', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (12, 6, 'DISABLED', '無効化済', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (13, 7, 'INSTALLED', 'インストール済', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (14, 7, 'NOT_INSTALLED', '未インストール', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (15, 8, 'PASS', '合格', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (16, 8, 'FAIL', '不合格', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (17, 9, 'SEALED', '封印済', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (18, 9, 'NOT_SEALED', '未封印', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (19, 10, 'UP_TO_DATE', '最新', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (20, 10, 'OUT_OF_DATE', '期限切れ', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (21, 11, 'ENABLED', '有効化済', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (22, 11, 'DISABLED', '無効化済', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (23, 12, 'REQUIRED', '必要', 1, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (24, 12, 'NOT_REQUIRED', '不要', 2, 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_item" VALUES (25, 13, 'Windows10', 'Windows10', 1, 1, '2025-12-30 00:20:20.051383', '2025-12-30 00:21:18.765407');
INSERT INTO "public"."dict_item" VALUES (26, 13, 'Windows 11', 'Windows 11', 2, 1, '2025-12-30 00:20:20.051383', '2025-12-30 00:21:19.481051');
INSERT INTO "public"."dict_item" VALUES (27, 14, '16.0', '16.0G', 1, 1, '2025-12-30 00:20:20.05333', '2025-12-30 00:21:31.368278');
INSERT INTO "public"."dict_item" VALUES (28, 14, '8.0', '8.0G', 2, 1, '2025-12-30 00:20:20.05333', '2025-12-30 00:21:33.243521');
INSERT INTO "public"."dict_item" VALUES (29, 15, '256.0', '256.0G', 1, 1, '2025-12-30 00:20:20.053988', '2025-12-30 00:21:38.745074');
INSERT INTO "public"."dict_item" VALUES (30, 15, '512.0', '512.0G', 2, 1, '2025-12-30 00:20:20.053988', '2025-12-30 00:21:40.271569');
INSERT INTO "public"."dict_item" VALUES (31, 16, '1024.0', '1024.0G', 1, 1, '2025-12-30 00:20:20.054598', '2025-12-30 00:21:41.598239');
INSERT INTO "public"."dict_item" VALUES (32, 16, '512.0', '512.0G', 2, 1, '2025-12-30 00:20:20.054598', '2025-12-30 00:21:44.011196');

-- ----------------------------
-- dict_typeのテーブル構造
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
COMMENT ON COLUMN "public"."dict_type"."dict_type_id" IS 'ディクショナリタイプID（主キー）';
COMMENT ON COLUMN "public"."dict_type"."dict_type_code" IS 'ディクショナリタイプコード（ユニーク）';
COMMENT ON COLUMN "public"."dict_type"."dict_type_name" IS 'ディクショナリタイプ名';
COMMENT ON COLUMN "public"."dict_type"."description" IS 'ディクショナリタイプの説明';
COMMENT ON COLUMN "public"."dict_type"."is_enabled" IS '有効フラグ（0=無効、1=有効）';
COMMENT ON COLUMN "public"."dict_type"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."dict_type"."update_time" IS '更新時間';
COMMENT ON TABLE "public"."dict_type" IS 'ディクショナリタイプテーブル（固定値の分類を管理）';

-- ----------------------------
-- dict_typeのレコード
-- ----------------------------
INSERT INTO "public"."dict_type" VALUES (1, 'USER_TYPE', 'ユーザータイプ', '異なるタイプのユーザーを区別', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (2, 'CONFIRM_STATUS', '確認ステータス', '確認済み/未確認のステータス', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (3, 'EXIST_STATUS', '存在ステータス', '存在する/存在しないのステータス', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (4, 'DOMAIN_STATUS', 'ドメインステータス', '機器のドメイン加入状況', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (5, 'SMARTIT_STATUS', 'SmartITステータス', 'SmartITのインストール状況', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (6, 'USB_STATUS', 'USBステータス', 'USBインターフェースの状況', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (7, 'ANTIVIRUS_STATUS', 'ウイルス対策ステータス', 'ウイルス対策ソフトの状況', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (8, 'CHECK_RESULT', '点検結果', '抜取り点検の結果ステータス', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (9, 'USB_SEAL_STATUS', 'USB封印ステータス', 'USBインターフェースの封印状況', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (10, 'PATCH_STATUS', 'パッチステータス', 'セキュリティパッチの状況', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (11, 'ANTIVIRUS_PROTECTION_STATUS', 'ウイルス防御ステータス', 'ウイルス防御の有効/無効状況', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (12, 'BOOT_AUTH_STATUS', '起動認証ステータス', '起動時の認証要否', 1, '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."dict_type" VALUES (13, 'OS_TYPE', 'OSタイプ', '機器のオペレーティングシステムタイプ', 1, '2025-12-30 00:20:13.519898', '2025-12-30 00:20:13.519898');
INSERT INTO "public"."dict_type" VALUES (14, 'MEMORY_SIZE', 'メモリサイズ', '機器のメモリ容量（単位：G）', 1, '2025-12-30 00:20:13.521018', '2025-12-30 00:20:13.521018');
INSERT INTO "public"."dict_type" VALUES (15, 'SSD_SIZE', 'SSDサイズ', '機器のSSD容量（単位：G）', 1, '2025-12-30 00:20:13.521463', '2025-12-30 00:20:13.521463');
INSERT INTO "public"."dict_type" VALUES (16, 'HDD_SIZE', 'HDDサイズ', '機器のHDD容量（単位：G）', 1, '2025-12-30 00:20:13.521895', '2025-12-30 00:20:13.521895');

-- ----------------------------
-- monitor_infoのテーブル構造
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
COMMENT ON COLUMN "public"."monitor_info"."monitor_id" IS 'モニター番号（主キー）';
COMMENT ON COLUMN "public"."monitor_info"."device_id" IS '機器番号（外部キー）';
COMMENT ON COLUMN "public"."monitor_info"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."monitor_info"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."monitor_info"."updater" IS '更新者';
COMMENT ON TABLE "public"."monitor_info" IS 'モニター情報テーブル（機器に紐づくモニター情報を保存）';

-- ----------------------------
-- monitor_infoのレコード
-- ----------------------------
INSERT INTO "public"."monitor_info" VALUES ('MON001', 'DEV001', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."monitor_info" VALUES ('MON002', 'DEV002', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- monthly_check_reportのテーブル構造
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
COMMENT ON COLUMN "public"."monthly_check_report"."report_id" IS 'レポート番号（主キー）';
COMMENT ON COLUMN "public"."monthly_check_report"."update_date" IS '更新日付';
COMMENT ON COLUMN "public"."monthly_check_report"."security_promoter" IS '情報セキュリティ推進者';
COMMENT ON COLUMN "public"."monthly_check_report"."security_responsible" IS '情報セキュリティ責任者';
COMMENT ON COLUMN "public"."monthly_check_report"."quality_dept" IS '品質管理部';
COMMENT ON COLUMN "public"."monthly_check_report"."check_remark" IS '点検備考';
COMMENT ON COLUMN "public"."monthly_check_report"."check_description" IS '点検説明';
COMMENT ON COLUMN "public"."monthly_check_report"."work_area" IS '作業区域';
COMMENT ON COLUMN "public"."monthly_check_report"."dept_id" IS '部署番号（外部キー）';
COMMENT ON COLUMN "public"."monthly_check_report"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."monthly_check_report"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."monthly_check_report"."updater" IS '更新者';
COMMENT ON TABLE "public"."monthly_check_report" IS '月次点検レポートテーブル（月次セキュリティ点検の総括レポートを保存）';

-- ----------------------------
-- monthly_check_reportのレコード
-- ----------------------------
INSERT INTO "public"."monthly_check_report" VALUES ('REPORT001', '2025-12-01', '王五', '赵六', '品質部', NULL, NULL, 'AreaA', 'DEPT001', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- non_sampling_checkのテーブル構造
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
COMMENT ON COLUMN "public"."non_sampling_check"."non_sampling_id" IS '非抜取り点検番号（主キー）';
COMMENT ON COLUMN "public"."non_sampling_check"."report_id" IS 'レポート番号（外部キー）';
COMMENT ON COLUMN "public"."non_sampling_check"."private_mobile_dev_id" IS '個人モバイル機器ステータスID（ディクショナリ項目に関連：EXIST_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."unrecorded_wifi_id" IS '未登録WiFiステータスID（ディクショナリ項目に関連：EXIST_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."floor_access_closed_id" IS 'フロア入退管理ステータスID（ディクショナリ項目に関連：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."public_mobile_dev_out_id" IS '共有モバイル機器持出しステータスID（ディクショナリ項目に関連：EXIST_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."ic_card_worn_id" IS 'ICカード着用ステータスID（ディクショナリ項目に関連：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."copier_no_doc_id" IS 'コピー機文書遺留ステータスID（ディクショナリ項目に関連：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."printer_no_doc_id" IS 'プリンタ文書遺留ステータスID（ディクショナリ項目に関連：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."no_idle_device_id" IS '未使用機器ステータスID（ディクショナリ項目に関連：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."desk_no_doc_id" IS '机上文書遺留ステータスID（ディクショナリ項目に関連：CONFIRM_STATUS）';
COMMENT ON COLUMN "public"."non_sampling_check"."disposal_measures" IS '処置措置';
COMMENT ON COLUMN "public"."non_sampling_check"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."non_sampling_check"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."non_sampling_check"."updater" IS '更新者';
COMMENT ON TABLE "public"."non_sampling_check" IS '非抜取り点検テーブル（非抜取り点検の詳細情報を保存）';

-- ----------------------------
-- non_sampling_checkのレコード
-- ----------------------------
INSERT INTO "public"."non_sampling_check" VALUES ('NSC001', 'REPORT001', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-30 00:01:57.379709', '2025-12-30 00:18:06.386484', NULL);

-- ----------------------------
-- permissionのテーブル構造
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
COMMENT ON COLUMN "public"."permission"."permission_id" IS '権限ID（主キー）';
COMMENT ON COLUMN "public"."permission"."permission_name" IS '権限名';
COMMENT ON COLUMN "public"."permission"."permission_code" IS '権限コード（ユニーク）';
COMMENT ON COLUMN "public"."permission"."resource_type" IS 'リソースタイプ（メニュー/ボタン/インターフェース）';
COMMENT ON COLUMN "public"."permission"."resource_key" IS 'リソース識別子（メニューURL等）';
COMMENT ON COLUMN "public"."permission"."description" IS '権限の説明';
COMMENT ON COLUMN "public"."permission"."create_time" IS '作成時間';
COMMENT ON TABLE "public"."permission" IS '権限テーブル（システム権限を保存）';

-- ----------------------------
-- permissionのレコード
-- ----------------------------
INSERT INTO "public"."permission" VALUES (1, 'ユーザー参照', 'PERM_VIEW_USER', 'メニュー', '/user/list', NULL, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."permission" VALUES (2, 'ユーザー編集', 'PERM_EDIT_USER', 'ボタン', '/user/edit', NULL, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."permission" VALUES (3, '機器参照', 'PERM_VIEW_DEVICE', 'メニュー', '/device/list', NULL, '2025-12-30 00:01:57.379709');

-- ----------------------------
-- permission_device_infoのテーブル構造
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission_device_info";
CREATE TABLE "public"."permission_device_info" (
  "permission_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."permission_device_info"."permission_id" IS '権限番号（外部キー、device_permission.permission_idに関連）';
COMMENT ON COLUMN "public"."permission_device_info"."device_id" IS '機器番号（主キー）';
COMMENT ON COLUMN "public"."permission_device_info"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."permission_device_info"."updater" IS '更新者';
COMMENT ON TABLE "public"."permission_device_info" IS '権限機器情報テーブル（機器と権限を紐づけ）';

-- ----------------------------
-- permission_device_infoのレコード
-- ----------------------------

-- ----------------------------
-- permission_ipのテーブル構造
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission_ip";
CREATE TABLE "public"."permission_ip" (
  "ip_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "ip_address" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."permission_ip"."ip_id" IS 'IP番号（主キー、device_ip.ip_idに関連）';
COMMENT ON COLUMN "public"."permission_ip"."device_id" IS '機器番号（外部キー）';
COMMENT ON COLUMN "public"."permission_ip"."ip_address" IS 'IPアドレス（device_ip.ip_addressに関連）';
COMMENT ON COLUMN "public"."permission_ip"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."permission_ip"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."permission_ip"."updater" IS '更新者';
COMMENT ON TABLE "public"."permission_ip" IS '権限IP情報テーブル（機器権限とIPを紐づけ）';

-- ----------------------------
-- permission_ipのレコード
-- ----------------------------
INSERT INTO "public"."permission_ip" VALUES ('PIP001', 'DEV001', '192.168.1.101', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."permission_ip" VALUES ('PIP002', 'DEV002', '192.168.1.102', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- roleのテーブル構造
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
COMMENT ON COLUMN "public"."role"."role_id" IS 'ロールID（主キー）';
COMMENT ON COLUMN "public"."role"."role_name" IS 'ロール名';
COMMENT ON COLUMN "public"."role"."role_code" IS 'ロールコード（ユニーク）';
COMMENT ON COLUMN "public"."role"."description" IS 'ロールの説明';
COMMENT ON COLUMN "public"."role"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."role"."update_time" IS '更新時間';
COMMENT ON TABLE "public"."role" IS 'ロールテーブル（システムロールを保存）';

-- ----------------------------
-- roleのレコード
-- ----------------------------
INSERT INTO "public"."role" VALUES (1, 'システム管理者', 'ROLE_ADMIN', 'システムの全権限を保有', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role" VALUES (2, '一般ユーザー', 'ROLE_USER', '一般ユーザーの権限を保有', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709');

-- ----------------------------
-- role_permissionのテーブル構造
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permission";
CREATE TABLE "public"."role_permission" (
  "role_permission_id" int8 NOT NULL DEFAULT nextval('role_permission_role_permission_id_seq'::regclass),
  "role_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."role_permission"."role_permission_id" IS 'ロール権限紐づけID（主キー）';
COMMENT ON COLUMN "public"."role_permission"."role_id" IS 'ロールID（外部キー）';
COMMENT ON COLUMN "public"."role_permission"."permission_id" IS '権限ID（外部キー）';
COMMENT ON COLUMN "public"."role_permission"."create_time" IS '作成時間';
COMMENT ON TABLE "public"."role_permission" IS 'ロール権限紐づけテーブル（ロール-権限のマッピングを実現）';

-- ----------------------------
-- role_permissionのレコード
-- ----------------------------
INSERT INTO "public"."role_permission" VALUES (1, 1, 1, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role_permission" VALUES (2, 1, 2, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role_permission" VALUES (3, 1, 3, '2025-12-30 00:01:57.379709');
INSERT INTO "public"."role_permission" VALUES (4, 2, 3, '2025-12-30 00:01:57.379709');

-- ----------------------------
-- sampling_checkのテーブル構造
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
COMMENT ON COLUMN "public"."sampling_check"."sampling_id" IS '抜取り点検番号（主キー）';
COMMENT ON COLUMN "public"."sampling_check"."job_number" IS '社員番号（外部キー）';
COMMENT ON COLUMN "public"."sampling_check"."device_id" IS '機器番号（外部キー）';
COMMENT ON COLUMN "public"."sampling_check"."screen_saver_pwd_id" IS 'スクリーンセーバーパスワードステータスID（ディクショナリ項目に関連：CHECK_RESULT）';
COMMENT ON COLUMN "public"."sampling_check"."installed_software" IS 'インストール済ソフトウェア';
COMMENT ON COLUMN "public"."sampling_check"."disposal_measures" IS '処置措置';
COMMENT ON COLUMN "public"."sampling_check"."usb_interface_id" IS 'USBインターフェースステータスID（ディクショナリ項目に関連：USB_SEAL_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."security_patch_id" IS 'セキュリティパッチステータスID（ディクショナリ項目に関連：PATCH_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."antivirus_protection_id" IS 'ウイルス防御ステータスID（ディクショナリ項目に関連：ANTIVIRUS_PROTECTION_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."boot_authentication_id" IS '起動認証ステータスID（ディクショナリ項目に関連：BOOT_AUTH_STATUS）';
COMMENT ON COLUMN "public"."sampling_check"."name" IS '氏名（ユーザーテーブルに関連）';
COMMENT ON COLUMN "public"."sampling_check"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."sampling_check"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."sampling_check"."updater" IS '更新者';
COMMENT ON TABLE "public"."sampling_check" IS '抜取り点検テーブル（抜取り点検の詳細情報を保存）';

-- ----------------------------
-- sampling_checkのレコード
-- ----------------------------
INSERT INTO "public"."sampling_check" VALUES ('SC001', 'EMP001', 'DEV001', 1, NULL, NULL, 1, 1, 1, 2, '张三', '2025-12-30 00:01:57.379709', '2025-12-30 00:19:11.833172', NULL);

-- ----------------------------
-- userのテーブル構造
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
COMMENT ON COLUMN "public"."user"."user_id" IS 'ユーザーID（主キー）';
COMMENT ON COLUMN "public"."user"."dept_id" IS '部署番号';
COMMENT ON COLUMN "public"."user"."name" IS '氏名';
COMMENT ON COLUMN "public"."user"."job_number" IS '社員番号（ユニーク、機器/権限に関連）';
COMMENT ON COLUMN "public"."user"."user_type_id" IS 'ユーザータイプID（ディクショナリ項目に関連：USER_TYPE）';
COMMENT ON COLUMN "public"."user"."password" IS 'パスワード（暗号化保存）';
COMMENT ON COLUMN "public"."user"."create_time" IS '作成時間';
COMMENT ON COLUMN "public"."user"."update_time" IS '更新時間';
COMMENT ON COLUMN "public"."user"."updater" IS '更新者';
COMMENT ON TABLE "public"."user" IS 'ユーザーテーブル（ユーザーの基本情報を保存）';

-- ----------------------------
-- userのレコード
-- ----------------------------
INSERT INTO "public"."user" VALUES (1, 'DEPT001', '张三', 'EMP001', 1, 'encrypted_pwd_123', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);
INSERT INTO "public"."user" VALUES (2, 'DEPT002', '李四', 'EMP002', 2, 'encrypted_pwd_456', '2025-12-30 00:01:57.379709', '2025-12-30 00:01:57.379709', NULL);

-- ----------------------------
-- user_permissionのテーブル構造
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
COMMENT ON COLUMN "public"."user_permission"."user_permission_id" IS 'ユーザー権限上書きID（主キー）';
COMMENT ON COLUMN "public"."user_permission"."user_id" IS 'ユーザーID（外部キー）';
COMMENT ON COLUMN "public"."user_permission"."permission_id" IS '権限ID（外部キー）';
COMMENT ON COLUMN "public"."user_permission"."grant_type" IS '付与タイプ（許可/拒否）';
COMMENT ON COLUMN "public"."user_permission"."create_time" IS '作成時間';
COMMENT ON TABLE "public"."user_permission" IS 'ユーザー権限上書きテーブル（ユーザーの個別権限を実現）';

-- ----------------------------
-- user_permissionのレコード
-- ----------------------------

-- ----------------------------
-- user_roleのテーブル構造
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_role";
CREATE TABLE "public"."user_role" (
  "user_role_id" int8 NOT NULL DEFAULT nextval('user_role_user_role_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;
COMMENT ON COLUMN "public"."user_role"."user_role_id" IS 'ユーザーロール紐づけID（主キー）';
COMMENT ON COLUMN "public"."user_role"."user_id" IS 'ユーザーID（外部キー）';
COMMENT ON COLUMN "public"."user_role"."role_id" IS 'ロールID（外部キー）';
COMMENT ON COLUMN "public"."user_role"."create_time" IS '作成時間';
COMMENT ON TABLE "public"."user_role" IS 'ユーザーロール紐づけテーブル（ユーザー-ロールのマッピングを実現）';

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
CREATE INDEX "fk_permission_ip_device" ON "public"."permission_ip" USING btree (
  "device_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
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
ALTER TABLE "public"."permission_ip" ADD CONSTRAINT "permission_ip_device_id_fkey" FOREIGN KEY ("device_id") REFERENCES "public"."device_info" ("device_id") ON DELETE CASCADE ON UPDATE CASCADE;

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


-- 機器情報テーブルに論理削除フィールドを追加
ALTER TABLE "public"."device_info" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."device_info"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 機器IPテーブルに論理削除フィールドを追加
ALTER TABLE "public"."device_ip" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."device_ip"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 機器使用権限テーブルに論理削除フィールドを追加
ALTER TABLE "public"."device_permission" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."device_permission"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- ディクショナリ項目テーブルに論理削除フィールドを追加
ALTER TABLE "public"."dict_item" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."dict_item"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- ディクショナリタイプテーブルに論理削除フィールドを追加
ALTER TABLE "public"."dict_type" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."dict_type"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- モニター情報テーブルに論理削除フィールドを追加
ALTER TABLE "public"."monitor_info" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."monitor_info"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 月次点検レポートテーブルに論理削除フィールドを追加
ALTER TABLE "public"."monthly_check_report" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."monthly_check_report"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 非抜取り点検テーブルに論理削除フィールドを追加
ALTER TABLE "public"."non_sampling_check" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."non_sampling_check"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 権限テーブルに論理削除フィールドを追加
ALTER TABLE "public"."permission" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."permission"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 権限機器情報テーブルに論理削除フィールドを追加
ALTER TABLE "public"."permission_device_info" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."permission_device_info"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 権限IP情報テーブルに論理削除フィールドを追加
ALTER TABLE "public"."permission_ip" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."permission_ip"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- ロールテーブルに論理削除フィールドを追加
ALTER TABLE "public"."role" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."role"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- ロール権限紐づけテーブルに論理削除フィールドを追加
ALTER TABLE "public"."role_permission" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."role_permission"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';

-- 抜取り点検テーブルに論理削除フィールドを追加
ALTER TABLE "public"."sampling_check" 
ADD COLUMN "is_deleted" int2 NOT NULL DEFAULT 0;
COMMENT ON COLUMN "public"."sampling_check"."is_deleted" IS '論理削除フラグ（0=未削除、1=削除済）';
