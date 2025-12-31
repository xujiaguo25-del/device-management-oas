/*
 Navicat Premium Dump SQL

 Source Server         : test
 Source Server Type    : PostgreSQL
 Source Server Version : 180001 (180001)
 Source Host           : localhost:5432
 Source Catalog        : test2
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 180001 (180001)
 File Encoding         : 65001

 Date: 31/12/2025 15:58:12
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
  "hdd_id" int8,
  "creater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."device_info"."device_id" IS '機器番号（プライマリキー）';
COMMENT ON COLUMN "public"."device_info"."device_model" IS 'ホストモデル';
COMMENT ON COLUMN "public"."device_info"."computer_name" IS 'コンピュータ名';
COMMENT ON COLUMN "public"."device_info"."login_username" IS 'ログインユーザ名';
COMMENT ON COLUMN "public"."device_info"."project" IS '所属プロジェクト';
COMMENT ON COLUMN "public"."device_info"."dev_room" IS '所属開発室';
COMMENT ON COLUMN "public"."device_info"."job_number" IS '従業員番号（所属ユーザ、外部キー）';
COMMENT ON COLUMN "public"."device_info"."remark" IS '備考';
COMMENT ON COLUMN "public"."device_info"."self_confirm_id" IS '本人確認ID（辞書項目：CONFIRM_STATUS 関連）';
COMMENT ON COLUMN "public"."device_info"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."device_info"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."device_info"."updater" IS '更新者';
COMMENT ON COLUMN "public"."device_info"."os_id" IS 'OSID（辞書項目：OS_TYPE 関連）';
COMMENT ON COLUMN "public"."device_info"."memory_id" IS 'メモリID（辞書項目：MEMORY_SIZE 関連）';
COMMENT ON COLUMN "public"."device_info"."ssd_id" IS 'SSDID（辞書項目：SSD_SIZE 関連）';
COMMENT ON COLUMN "public"."device_info"."hdd_id" IS 'HDDID（辞書項目：HDD_SIZE 関連）';
COMMENT ON COLUMN "public"."device_info"."creater" IS '作成者';
COMMENT ON TABLE "public"."device_info" IS '機器情報テーブル（機器ハードウェア構成を保存）';

-- ----------------------------
-- Records of device_info
-- ----------------------------
INSERT INTO "public"."device_info" VALUES ('DEV001', 'Dell Latitude 5430', 'DEV-001-PC', 'tanaka.t', 'システム開発', '開発室1', 'EMP001', '日常開発用', 1401, '2025-12-31 14:55:10.988413', '2025-12-31 14:55:10.988413', NULL, 401, 1101, 1201, 1301, 'admin');
INSERT INTO "public"."device_info" VALUES ('DEV002', 'MacBook Pro 14', 'DEV-002-PC', 'suzuki.h', 'アプリ開発', '開発室1', 'EMP002', 'モバイルアプリ開発用', 1401, '2025-12-31 14:55:10.988413', '2025-12-31 14:55:10.988413', NULL, 403, 1102, 1202, 1302, 'admin');
INSERT INTO "public"."device_info" VALUES ('DEV003', 'HP ProBook 450', 'GEN-001-PC', 'sato.k', '事務処理', '総務室', 'EMP003', '文書作成・会計処理用', 1401, '2025-12-31 14:55:10.988413', '2025-12-31 14:55:10.988413', NULL, 402, 1101, 1201, 1301, 'admin');

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
  "updater" varchar(100) COLLATE "pg_catalog"."default",
  "creater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."device_ip"."ip_id" IS 'IP番号（プライマリキー）';
COMMENT ON COLUMN "public"."device_ip"."device_id" IS '機器番号（外部キー）';
COMMENT ON COLUMN "public"."device_ip"."ip_address" IS 'IPアドレス（ユニーク）';
COMMENT ON COLUMN "public"."device_ip"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."device_ip"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."device_ip"."updater" IS '更新者';
COMMENT ON COLUMN "public"."device_ip"."creater" IS '作成者';
COMMENT ON TABLE "public"."device_ip" IS '機器IPテーブル（機器に関連するIPアドレスを保存）';

-- ----------------------------
-- Records of device_ip
-- ----------------------------
INSERT INTO "public"."device_ip" VALUES ('IP001', 'DEV001', '192.168.1.101', '2025-12-31 14:58:05.869066', '2025-12-31 14:58:05.869066', NULL, 'admin');
INSERT INTO "public"."device_ip" VALUES ('IP002', 'DEV002', '192.168.1.102', '2025-12-31 14:58:05.869066', '2025-12-31 14:58:05.869066', NULL, 'admin');
INSERT INTO "public"."device_ip" VALUES ('IP003', 'DEV003', '192.168.2.101', '2025-12-31 14:58:05.869066', '2025-12-31 14:58:05.869066', NULL, 'admin');

-- ----------------------------
-- Table structure for device_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."device_permission";
CREATE TABLE "public"."device_permission" (
  "permission_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
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
  "creater" varchar(100) COLLATE "pg_catalog"."default",
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."device_permission"."permission_id" IS '権限番号（プライマリキー）';
COMMENT ON COLUMN "public"."device_permission"."device_id" IS '機器番号（外部キー：device_info 関連）';
COMMENT ON COLUMN "public"."device_permission"."domain_status_id" IS 'ドメイン状態ID（辞書項目：DOMAIN_STATUS 関連）';
COMMENT ON COLUMN "public"."device_permission"."domain_group" IS 'ドメイン内グループ名';
COMMENT ON COLUMN "public"."device_permission"."no_domain_reason" IS 'ドメイン未参加理由';
COMMENT ON COLUMN "public"."device_permission"."smartit_status_id" IS 'SmartIT状態ID（辞書項目：SMARTIT_STATUS 関連）';
COMMENT ON COLUMN "public"."device_permission"."no_smartit_reason" IS 'SmartIT未インストール理由';
COMMENT ON COLUMN "public"."device_permission"."usb_status_id" IS 'USB状態ID（辞書項目：USB_STATUS 関連）';
COMMENT ON COLUMN "public"."device_permission"."usb_reason" IS 'USB使用許可理由';
COMMENT ON COLUMN "public"."device_permission"."usb_expire_date" IS 'USB使用有効期限';
COMMENT ON COLUMN "public"."device_permission"."antivirus_status_id" IS ' antivirus状態ID（辞書項目：ANTIVIRUS_STATUS 関連）';
COMMENT ON COLUMN "public"."device_permission"."no_symantec_reason" IS 'Symantec未導入理由';
COMMENT ON COLUMN "public"."device_permission"."remark" IS '備考';
COMMENT ON COLUMN "public"."device_permission"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."device_permission"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."device_permission"."creater" IS '作成者';
COMMENT ON COLUMN "public"."device_permission"."updater" IS '更新者';
COMMENT ON TABLE "public"."device_permission" IS '機器使用権限テーブル（機器のドメイン、USB等の権限を保存：機器単位管理）';

-- ----------------------------
-- Records of device_permission
-- ----------------------------
INSERT INTO "public"."device_permission" VALUES ('PERM001', 'DEV001', 201, 'DEV-GROUP', '', 1501, '', 101, '開発用データの転送が必要', '2026-12-31', 301, '', '開発業務用機器', '2025-12-31 15:02:56.171466', '2025-12-31 15:02:56.171466', 'admin', NULL);
INSERT INTO "public"."device_permission" VALUES ('PERM002', 'DEV002', 201, 'DEV-GROUP', '', 1501, '', 102, '機密データ漏洩防止のため', NULL, 301, '', '機密プロジェクト用', '2025-12-31 15:02:56.171466', '2025-12-31 15:02:56.171466', 'admin', NULL);
INSERT INTO "public"."device_permission" VALUES ('PERM003', 'DEV003', 201, 'GEN-GROUP', '', 1501, '', 101, '文書データの受け渡しが必要', '2026-12-31', 301, '', '総務事務用', '2025-12-31 15:02:56.171466', '2025-12-31 15:02:56.171466', 'admin', NULL);

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
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "creater" varchar(100) COLLATE "pg_catalog"."default",
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."dict_item"."dict_item_id" IS '辞書項目ID（プライマリキー）';
COMMENT ON COLUMN "public"."dict_item"."dict_type_id" IS '辞書タイプID（外部キー）';
COMMENT ON COLUMN "public"."dict_item"."dict_item_code" IS '辞書項目コード（同タイプ内ユニーク）';
COMMENT ON COLUMN "public"."dict_item"."dict_item_name" IS '辞書項目名';
COMMENT ON COLUMN "public"."dict_item"."sort" IS 'ソート番号';
COMMENT ON COLUMN "public"."dict_item"."is_enabled" IS '有効フラグ（0=無効、1=有効）';
COMMENT ON COLUMN "public"."dict_item"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."dict_item"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."dict_item"."creater" IS '作成者';
COMMENT ON COLUMN "public"."dict_item"."updater" IS '更新者';
COMMENT ON TABLE "public"."dict_item" IS '辞書項目テーブル（固定値を保存）';

-- ----------------------------
-- Records of dict_item
-- ----------------------------
INSERT INTO "public"."dict_item" VALUES (101, 1, 'ENABLED', '使用許可', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (102, 1, 'DISABLED', '使用禁止', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (201, 2, 'JOINED', '参加済み', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (202, 2, 'NOT_JOINED', '未参加', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (301, 3, 'INSTALLED', '導入済み', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (302, 3, 'NOT_INSTALLED', '未導入', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (401, 4, 'WINDOWS10', 'Windows 10', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (402, 4, 'WINDOWS11', 'Windows 11', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (403, 4, 'MACOS', 'macOS Ventura', 3, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (501, 5, 'ADMIN', '管理者', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (502, 5, 'USER', '一般ユーザ', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1101, 11, '16GB', '16ギガバイト', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1102, 11, '32GB', '32ギガバイト', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1201, 12, '512GB', '512ギガバイト', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1202, 12, '1TB', '1テラバイト', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1301, 13, '1TB', '1テラバイト', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1302, 13, '2TB', '2テラバイト', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1401, 14, 'CONFIRMED', '確認済み', 1, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1402, 14, 'NOT_CONFIRMED', '未確認', 2, 1, '2025-12-31 14:50:37.734756', '2025-12-31 14:50:37.734756', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1501, 15, 'ENABLED', '有効', 1, 1, '2025-12-31 15:02:48.902919', '2025-12-31 15:02:48.902919', 'admin', NULL);
INSERT INTO "public"."dict_item" VALUES (1502, 15, 'DISABLED', '無効', 2, 1, '2025-12-31 15:02:48.902919', '2025-12-31 15:02:48.902919', 'admin', NULL);

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
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "creater" varchar(100) COLLATE "pg_catalog"."default",
  "updater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."dict_type"."dict_type_id" IS '辞書タイプID（プライマリキー）';
COMMENT ON COLUMN "public"."dict_type"."dict_type_code" IS '辞書タイプコード（ユニーク）';
COMMENT ON COLUMN "public"."dict_type"."dict_type_name" IS '辞書タイプ名';
COMMENT ON COLUMN "public"."dict_type"."description" IS '辞書タイプ説明';
COMMENT ON COLUMN "public"."dict_type"."is_enabled" IS '有効フラグ（0=無効、1=有効）';
COMMENT ON COLUMN "public"."dict_type"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."dict_type"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."dict_type"."creater" IS '作成者';
COMMENT ON COLUMN "public"."dict_type"."updater" IS '更新者';
COMMENT ON TABLE "public"."dict_type" IS '辞書タイプテーブル（全ての固定値分類を管理）';

-- ----------------------------
-- Records of dict_type
-- ----------------------------
INSERT INTO "public"."dict_type" VALUES (1, 'USB_STATUS', 'USB使用状態', 'USBポートの使用権限状態を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (2, 'DOMAIN_STATUS', 'ドメイン状態', '機器のドメイン参加状態を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (3, 'ANTIVIRUS_STATUS', 'ウイルス対策状態', 'ウイルス対策ソフトの導入状態を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (4, 'OS_TYPE', 'OS種別', '機器のオペレーティングシステム種別を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (5, 'USER_TYPE', 'ユーザ種別', 'システムユーザの役割種別を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (11, 'MEMORY_SPEC', 'メモリ仕様', '機器のメモリ容量を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (12, 'SSD_SPEC', 'SSD仕様', '機器のSSD容量を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (13, 'HDD_SPEC', 'HDD仕様', '機器のHDD容量を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (14, 'SELF_CONFIRM', '自己確認状態', '機器情報の自己確認状態を管理', 1, '2025-12-31 14:50:27.402795', '2025-12-31 14:50:27.402795', 'admin', NULL);
INSERT INTO "public"."dict_type" VALUES (15, 'SMARTIT_STATUS', 'SmartIT状態', 'SmartITの導入/有効状態を管理', 1, '2025-12-31 15:02:48.900854', '2025-12-31 15:02:48.900854', 'admin', NULL);

-- ----------------------------
-- Table structure for monitor_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."monitor_info";
CREATE TABLE "public"."monitor_info" (
  "monitor_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default",
  "creater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."monitor_info"."monitor_id" IS 'モニター番号（プライマリキー）';
COMMENT ON COLUMN "public"."monitor_info"."device_id" IS '機器番号（外部キー）';
COMMENT ON COLUMN "public"."monitor_info"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."monitor_info"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."monitor_info"."updater" IS '更新者';
COMMENT ON COLUMN "public"."monitor_info"."creater" IS '作成者';
COMMENT ON TABLE "public"."monitor_info" IS 'モニター情報テーブル（機器に関連するモニターを保存）';

-- ----------------------------
-- Records of monitor_info
-- ----------------------------
INSERT INTO "public"."monitor_info" VALUES ('MON001', 'DEV001', '2025-12-31 14:58:15.535993', '2025-12-31 14:58:15.535993', NULL, 'admin');
INSERT INTO "public"."monitor_info" VALUES ('MON002', 'DEV002', '2025-12-31 14:58:15.535993', '2025-12-31 14:58:15.535993', NULL, 'admin');
INSERT INTO "public"."monitor_info" VALUES ('MON003', 'DEV003', '2025-12-31 14:58:15.535993', '2025-12-31 14:58:15.535993', NULL, 'admin');

-- ----------------------------
-- Table structure for sampling_check
-- ----------------------------
DROP TABLE IF EXISTS "public"."sampling_check";
CREATE TABLE "public"."sampling_check" (
  "sampling_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "job_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "device_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "installed_software" bool,
  "disposal_measures" text COLLATE "pg_catalog"."default",
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default",
  "creater" varchar(100) COLLATE "pg_catalog"."default",
  "report_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "update_date" date NOT NULL,
  "screen_saver_pwd" bool,
  "usb_interface" bool,
  "security_patch" bool,
  "antivirus_protection" bool,
  "boot_authentication" bool
)
;
COMMENT ON COLUMN "public"."sampling_check"."sampling_id" IS 'サンプリングチェック番号（プライマリキー）';
COMMENT ON COLUMN "public"."sampling_check"."job_number" IS '従業員番号（外部キー）';
COMMENT ON COLUMN "public"."sampling_check"."device_id" IS '機器番号（外部キー）';
COMMENT ON COLUMN "public"."sampling_check"."installed_software" IS 'インストールソフトウェア';
COMMENT ON COLUMN "public"."sampling_check"."disposal_measures" IS '処置措置';
COMMENT ON COLUMN "public"."sampling_check"."name" IS '氏名';
COMMENT ON COLUMN "public"."sampling_check"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."sampling_check"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."sampling_check"."updater" IS '更新者';
COMMENT ON COLUMN "public"."sampling_check"."creater" IS '作成者';
COMMENT ON COLUMN "public"."sampling_check"."report_id" IS 'レポート番号';
COMMENT ON COLUMN "public"."sampling_check"."update_date" IS '更新日';
COMMENT ON COLUMN "public"."sampling_check"."screen_saver_pwd" IS 'スクリーンセーバーパスワード状態';
COMMENT ON COLUMN "public"."sampling_check"."usb_interface" IS 'USBインターフェース状態';
COMMENT ON COLUMN "public"."sampling_check"."security_patch" IS 'セキュリティパッチ状態';
COMMENT ON COLUMN "public"."sampling_check"."antivirus_protection" IS 'ウイルス防護状態ID';
COMMENT ON COLUMN "public"."sampling_check"."boot_authentication" IS '起動認証状態';
COMMENT ON TABLE "public"."sampling_check" IS 'サンプリングチェックテーブル（サンプリングチェック詳細を保存）';

-- ----------------------------
-- Records of sampling_check
-- ----------------------------
INSERT INTO "public"."sampling_check" VALUES ('CHECK001', 'EMP001', 'DEV001', 't', '特に問題なし', '田中 太郎', '2025-12-31 15:27:21.312083', '2025-12-31 15:27:21.312083', NULL, 'admin', 'REP202512', '2025-12-10', 't', 't', 't', 't', 't');
INSERT INTO "public"."sampling_check" VALUES ('CHECK002', 'EMP002', 'DEV002', 't', '特に問題なし', '鈴木 花子', '2025-12-31 15:27:21.312083', '2025-12-31 15:27:21.312083', NULL, 'admin', 'REP202512', '2025-12-10', 't', 't', 't', 't', 't');
INSERT INTO "public"."sampling_check" VALUES ('CHECK003', 'EMP003', 'DEV003', 't', '特に問題なし', '佐藤 健', '2025-12-31 15:27:21.312083', '2025-12-31 15:27:21.312083', NULL, 'admin', 'REP202512', '2025-12-10', 't', 't', 't', 't', 't');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "dept_id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "job_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "user_type_id" int8 NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "create_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "update_time" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updater" varchar(100) COLLATE "pg_catalog"."default",
  "creater" varchar(100) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."user"."dept_id" IS '部署番号';
COMMENT ON COLUMN "public"."user"."name" IS '氏名';
COMMENT ON COLUMN "public"."user"."job_number" IS '従業員番号（ユニーク、機器/権限関連）';
COMMENT ON COLUMN "public"."user"."user_type_id" IS 'ユーザタイプID（辞書項目：USER_TYPE 関連）';
COMMENT ON COLUMN "public"."user"."password" IS 'パスワード（暗号化保存）';
COMMENT ON COLUMN "public"."user"."create_time" IS '作成日時';
COMMENT ON COLUMN "public"."user"."update_time" IS '更新日時';
COMMENT ON COLUMN "public"."user"."updater" IS '更新者';
COMMENT ON COLUMN "public"."user"."creater" IS '作成者';
COMMENT ON TABLE "public"."user" IS 'ユーザテーブル（ユーザ基本情報を保存）';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user" VALUES ('DEPT001', '田中 太郎', 'EMP001', 502, '加密文字列1', '2025-12-31 14:52:34.003289', '2025-12-31 14:52:34.003289', 'admin', 'admin');
INSERT INTO "public"."user" VALUES ('DEPT001', '鈴木 花子', 'EMP002', 502, '加密文字列2', '2025-12-31 14:52:34.003289', '2025-12-31 14:52:34.003289', 'admin', 'admin');
INSERT INTO "public"."user" VALUES ('DEPT002', '佐藤 健', 'EMP003', 502, '加密文字列3', '2025-12-31 14:52:34.003289', '2025-12-31 14:52:34.003289', 'admin', 'admin');
INSERT INTO "public"."user" VALUES ('DEPT003', '山口 亮', 'EMP000', 501, '加密文字列0', '2025-12-31 14:52:34.003289', '2025-12-31 14:52:34.003289', 'admin', 'admin');

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
SELECT setval('"public"."dict_item_dict_item_id_seq"', 98, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dict_type_dict_type_id_seq"
OWNED BY "public"."dict_type"."dict_type_id";
SELECT setval('"public"."dict_type_dict_type_id_seq"', 23, true);

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
CREATE INDEX "fk_permission_device" ON "public"."device_permission" USING btree (
  "device_id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
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
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("job_number");

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
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_device_id_fkey" FOREIGN KEY ("device_id") REFERENCES "public"."device_info" ("device_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."device_permission" ADD CONSTRAINT "device_permission_domain_status_id_fkey" FOREIGN KEY ("domain_status_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
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
-- Foreign Keys structure for table sampling_check
-- ----------------------------
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_device_id_fkey" FOREIGN KEY ("device_id") REFERENCES "public"."device_info" ("device_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."sampling_check" ADD CONSTRAINT "sampling_check_job_number_fkey" FOREIGN KEY ("job_number") REFERENCES "public"."user" ("job_number") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_user_type_id_fkey" FOREIGN KEY ("user_type_id") REFERENCES "public"."dict_item" ("dict_item_id") ON DELETE SET NULL ON UPDATE CASCADE;
