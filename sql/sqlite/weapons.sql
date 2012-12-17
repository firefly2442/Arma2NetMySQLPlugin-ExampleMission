CREATE TABLE "users" (
						"id" INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
						"uid" VARCHAR NOT NULL ,
						"name" VARCHAR NOT NULL ,
						"ammo" VARCHAR ,
						"weapons" VARCHAR ,
						"backpackammo" VARCHAR ,
						"backpackweapons" VARCHAR ,
						"weapononback" VARCHAR ,
						"oabackpack" VARCHAR
					);