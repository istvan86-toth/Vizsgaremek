BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "RaktarAPI_termek" (
	"Termek_id"	integer NOT NULL,
	"Termeknev"	varchar(500) NOT NULL,
	"Ar"	integer NOT NULL,
	"Mennyiseg"	integer NOT NULL,
	PRIMARY KEY("Termek_id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2023-05-04 19:13:18.564305'),
 (2,'auth','0001_initial','2023-05-04 19:13:18.579270'),
 (3,'admin','0001_initial','2023-05-04 19:13:18.600208'),
 (4,'admin','0002_logentry_remove_auto_add','2023-05-04 19:13:18.611179'),
 (5,'admin','0003_logentry_add_action_flag_choices','2023-05-04 19:13:18.620171'),
 (6,'contenttypes','0002_remove_content_type_name','2023-05-04 19:13:18.635626'),
 (7,'auth','0002_alter_permission_name_max_length','2023-05-04 19:13:18.645599'),
 (8,'auth','0003_alter_user_email_max_length','2023-05-04 19:13:18.655573'),
 (9,'auth','0004_alter_user_username_opts','2023-05-04 19:13:18.663551'),
 (10,'auth','0005_alter_user_last_login_null','2023-05-04 19:13:18.674522'),
 (11,'auth','0006_require_contenttypes_0002','2023-05-04 19:13:18.678512'),
 (12,'auth','0007_alter_validators_add_error_messages','2023-05-04 19:13:18.687487'),
 (13,'auth','0008_alter_user_username_max_length','2023-05-04 19:13:18.700472'),
 (14,'auth','0009_alter_user_last_name_max_length','2023-05-04 19:13:18.710426'),
 (15,'auth','0010_alter_group_name_max_length','2023-05-04 19:13:18.720402'),
 (16,'auth','0011_update_proxy_permissions','2023-05-04 19:13:18.726406'),
 (17,'auth','0012_alter_user_first_name_max_length','2023-05-04 19:13:18.735704'),
 (18,'sessions','0001_initial','2023-05-04 19:13:18.742556'),
 (19,'RaktarAPI','0001_initial','2023-05-04 19:33:51.049315');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (1,'1','Termekek object (1)',1,'[{"added": {}}]',7,1,'2023-05-04 19:34:08.705272'),
 (2,'1','Termekek object (1)',2,'[]',7,1,'2023-05-07 16:26:14.700160'),
 (3,'2','Termek object (2)',1,'[{"added": {}}]',8,1,'2023-05-07 19:58:23.283167'),
 (4,'3','Termek object (3)',1,'[{"added": {}}]',8,1,'2023-05-07 20:16:49.207257'),
 (5,'4','Termek object (4)',1,'[{"added": {}}]',8,1,'2023-05-07 20:31:33.056513'),
 (6,'5','Termek object (5)',1,'[{"added": {}}]',8,1,'2023-05-07 20:32:10.149960'),
 (7,'5','sas',3,'',8,1,'2023-05-07 20:36:52.145190'),
 (8,'4','sas',3,'',8,1,'2023-05-07 20:36:52.150176'),
 (9,'3','ddd',3,'',8,1,'2023-05-07 20:36:52.156160'),
 (10,'2','g',3,'',8,1,'2023-05-07 20:36:52.160156'),
 (11,'1','sas',3,'',8,1,'2023-05-07 20:36:52.165136'),
 (12,'6','LG Plazma TV',1,'[{"added": {}}]',8,1,'2023-05-07 20:37:09.812794'),
 (13,'7','Samsung LED TV',1,'[{"added": {}}]',8,1,'2023-05-07 20:37:30.671932'),
 (14,'8','Xbox 360',1,'[{"added": {}}]',8,1,'2023-05-07 20:37:47.447417'),
 (15,'9','Playstation PS4',1,'[{"added": {}}]',8,1,'2023-05-07 20:38:21.981764'),
 (16,'10','ASUS ROG laptop',1,'[{"added": {}}]',8,1,'2023-05-07 20:39:04.181926'),
 (17,'11','ASUS Zephyrius laptop',1,'[{"added": {}}]',8,1,'2023-05-07 20:39:28.124845');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'RaktarAPI','termekek'),
 (8,'RaktarAPI','termek');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_termekek','Can add termekek'),
 (26,7,'change_termekek','Can change termekek'),
 (27,7,'delete_termekek','Can delete termekek'),
 (28,7,'view_termekek','Can view termekek');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$600000$ABSbSopAIgIwfJQcrtfjCE$jYyvY8VQjlnKHTaIELP1KiDqL76ic3IfOxa7ZsgqbeQ=','2023-05-07 13:36:45.986222',1,'admin','','',1,1,'2023-05-04 19:17:50.969912','');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('6vbos9fa2vjt1whgzjdhumcltp0d3ke6','.eJxVjEEOwiAQAP_C2RCWIAWP3n0DWXYXqRqalPZk_Lsh6UGvM5N5q4T7VtPeZU0zq4sCdfplGekpbQh-YLsvmpa2rXPWI9GH7fq2sLyuR_s3qNjr2IJlg945NkE8FZApEkLM1sbCvjiGiFIkBB-gGEfuHC2CkGUxOU7q8wXokzg3:1pueUu:c4ww1SIzl2pKeJwg3hVWyNbZFlmjZpriz84QFSoQoAA','2023-05-18 19:20:12.285741');
INSERT INTO "RaktarAPI_termek" ("Termek_id","Termeknev","Ar","Mennyiseg") VALUES (6,'LG Plazma TV',100000,3),
 (7,'Samsung LED TV',120000,10),
 (8,'Xbox 360',60000,20),
 (9,'Playstation PS4',90000,500),
 (10,'ASUS ROG laptop',340000,13),
 (11,'ASUS Zephyrius laptop',800000,10);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
