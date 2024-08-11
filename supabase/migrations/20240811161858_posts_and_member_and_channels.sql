drop policy "Enable insert for authenticated users only" on "public"."posts";

alter table "public"."posts" drop constraint "posts_user_id_key";

alter table "public"."posts" drop constraint "post_pkey";

drop index if exists "public"."post_pkey";

drop index if exists "public"."posts_user_id_key";

create table "public"."members" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "user_id" uuid,
    "channel_id" uuid,
    "join_at" timestamp with time zone
);


alter table "public"."members" enable row level security;

ALTER TABLE "public"."channel_categories" ADD COLUMN "new_id" uuid DEFAULT gen_random_uuid();

ALTER TABLE "public"."channel_categories" DROP COLUMN "id";

ALTER TABLE "public"."channel_categories" RENAME COLUMN "new_id" TO "id";

ALTER TABLE "public"."channel_categories" ADD PRIMARY KEY ("id");

-- alter table "public"."channel_categories" alter column "id" drop identity;

-- alter table "public"."channel_categories" alter column "id" set data type uuid using "id"::uuid;

-- alter table "public"."channel_categories" alter column "id" set default gen_random_uuid();

alter table "public"."channels" add column "description" text;

alter table "public"."channels" add column "icon" text default ''::text;

alter table "public"."channels" add column "slug" text default ''::text;

-- alter table "public"."channels" alter column "id" drop identity;

-- alter table "public"."channels" alter column "id" set data type uuid using "id"::uuid;

-- alter table "public"."channels" alter column "id" set default gen_random_uuid();

ALTER TABLE "public"."channels" ADD COLUMN "new_id" uuid DEFAULT gen_random_uuid();

ALTER TABLE "public"."channels" DROP COLUMN "id";

ALTER TABLE "public"."channels" RENAME COLUMN "new_id" TO "id";

ALTER TABLE "public"."channels" ADD PRIMARY KEY ("id");

alter table "public"."posts" add column "channel_id" uuid;

alter table "public"."posts" add column "pinned" boolean default false;

alter table "public"."posts" add column "published" boolean default true;

-- alter table "public"."posts" alter column "id" set default gen_random_uuid();

-- alter table "public"."posts" alter column "id" drop identity;

-- alter table "public"."posts" alter column "id" set data type uuid using "id"::uuid;

ALTER TABLE "public"."posts" ALTER COLUMN "id" DROP IDENTITY IF EXISTS;

-- ALTER TABLE "public"."posts" ALTER COLUMN "id" SET DEFAULT gen_random_uuid();

ALTER TABLE "public"."posts" ADD COLUMN "uuid_id" uuid DEFAULT gen_random_uuid();

UPDATE "public"."posts" SET "uuid_id" = gen_random_uuid();

ALTER TABLE "public"."posts" DROP COLUMN "id";

ALTER TABLE "public"."posts" RENAME COLUMN "uuid_id" TO "id";

-- ALTER TABLE "public"."posts" ADD PRIMARY KEY ("id");

alter table "public"."posts" alter column "slug" drop not null;

alter table "public"."posts" alter column "user_id" set default auth.uid();

alter table "public"."posts" alter column "user_id" set not null;

alter table "public"."profiles" add column "quote" text;

CREATE UNIQUE INDEX members_pkey ON public.members USING btree (id);

CREATE UNIQUE INDEX posts_pkey ON public.posts USING btree (id);

alter table "public"."members" add constraint "members_pkey" PRIMARY KEY using index "members_pkey";

alter table "public"."posts" add constraint "posts_pkey" PRIMARY KEY using index "posts_pkey";

alter table "public"."channels" add constraint "channels_channel_category_fkey" FOREIGN KEY (channel_category) REFERENCES channel_categories(id) not valid;

alter table "public"."channels" validate constraint "channels_channel_category_fkey";

alter table "public"."members" add constraint "members_channel_id_fkey" FOREIGN KEY (channel_id) REFERENCES channels(id) not valid;

alter table "public"."members" validate constraint "members_channel_id_fkey";

alter table "public"."members" add constraint "members_user_id_fkey" FOREIGN KEY (user_id) REFERENCES profiles(id) not valid;

alter table "public"."members" validate constraint "members_user_id_fkey";

alter table "public"."posts" add constraint "posts_channel_id_fkey" FOREIGN KEY (channel_id) REFERENCES channels(id) not valid;

alter table "public"."posts" validate constraint "posts_channel_id_fkey";

grant delete on table "public"."members" to "anon";

grant insert on table "public"."members" to "anon";

grant references on table "public"."members" to "anon";

grant select on table "public"."members" to "anon";

grant trigger on table "public"."members" to "anon";

grant truncate on table "public"."members" to "anon";

grant update on table "public"."members" to "anon";

grant delete on table "public"."members" to "authenticated";

grant insert on table "public"."members" to "authenticated";

grant references on table "public"."members" to "authenticated";

grant select on table "public"."members" to "authenticated";

grant trigger on table "public"."members" to "authenticated";

grant truncate on table "public"."members" to "authenticated";

grant update on table "public"."members" to "authenticated";

grant delete on table "public"."members" to "service_role";

grant insert on table "public"."members" to "service_role";

grant references on table "public"."members" to "service_role";

grant select on table "public"."members" to "service_role";

grant trigger on table "public"."members" to "service_role";

grant truncate on table "public"."members" to "service_role";

grant update on table "public"."members" to "service_role";

create policy "Enable read access for all users"
on "public"."channel_categories"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."channels"
as permissive
for select
to public
using (true);


create policy "Enable read access for all users"
on "public"."members"
as permissive
for select
to public
using (true);



