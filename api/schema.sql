CREATE EXTENSION postgis;

CREATE TABLE "User" (
	"id" serial NOT NULL UNIQUE,
	"email" varchar(255) NOT NULL UNIQUE,
	"address" varchar(255),
	"full_name" varchar(50) NOT NULL,
	"area" integer NOT NULL,
	"location" integer NOT NULL,
	CONSTRAINT "User_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Location" (
	"id" serial NOT NULL,
	"location" geometry(point, 4326) NOT NULL,
	"area" integer NOT NULL,
	CONSTRAINT "Location_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Post" (
	"id" serial NOT NULL,
	"content" TEXT,
	"area" integer NOT NULL,
	CONSTRAINT "Post_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Media" (
	"id" serial NOT NULL,
	"type" VARCHAR(20) NOT NULL,
	"link" VARCHAR(255) NOT NULL,
	"post" integer NOT NULL,
	CONSTRAINT "Media_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Comment" (
	"id" serial NOT NULL,
	"text" TEXT NOT NULL,
	"user" integer NOT NULL,
	"post" integer NOT NULL,
	CONSTRAINT "Comment_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Reaction" (
	"id" serial NOT NULL,
	"type" VARCHAR(255) NOT NULL,
	"post" integer NOT NULL,
	CONSTRAINT "Reaction_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Area" (
	"id" serial NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"area" geometry(polygon, 4326) NOT NULL,
	"parent" integer NOT NULL,
	CONSTRAINT "Area_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "User" ADD CONSTRAINT "User_fk0" FOREIGN KEY ("area") REFERENCES "Area"("id");
ALTER TABLE "User" ADD CONSTRAINT "User_fk1" FOREIGN KEY ("location") REFERENCES "Location"("id");

ALTER TABLE "Location" ADD CONSTRAINT "Location_fk0" FOREIGN KEY ("area") REFERENCES "Area"("id");

ALTER TABLE "Post" ADD CONSTRAINT "Post_fk0" FOREIGN KEY ("area") REFERENCES "Location"("id");

ALTER TABLE "Media" ADD CONSTRAINT "Media_fk0" FOREIGN KEY ("post") REFERENCES "Post"("id");

ALTER TABLE "Comment" ADD CONSTRAINT "Comment_fk0" FOREIGN KEY ("user") REFERENCES "User"("id");
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_fk1" FOREIGN KEY ("post") REFERENCES "Post"("id");

ALTER TABLE "Reaction" ADD CONSTRAINT "Reaction_fk0" FOREIGN KEY ("post") REFERENCES "Post"("id");

ALTER TABLE "Area" ADD CONSTRAINT "Area_fk0" FOREIGN KEY ("parent") REFERENCES "Area"("id");
