-- public.ord_transfers definition

-- Drop table

-- DROP TABLE public.ord_transfers;

CREATE TABLE public.ord_transfers (
	id bigserial NOT NULL,
	inscription_id text NOT NULL,
	block_height int4 NOT NULL,
	old_satpoint text NULL,
	new_satpoint text NOT NULL,
	new_pkscript text NOT NULL,
	new_wallet text NULL,
	sent_as_fee bool NOT NULL,
	CONSTRAINT ord_transfers_pk PRIMARY KEY (id)
);
CREATE INDEX ord_transfers_block_height_idx ON public.ord_transfers USING btree (block_height);
CREATE INDEX ord_transfers_inscription_id_idx ON public.ord_transfers USING btree (inscription_id);


-- public.ord_number_to_id definition

-- Drop table

-- DROP TABLE public.ord_number_to_id;

CREATE TABLE public.ord_number_to_id (
	id bigserial NOT NULL,
	inscription_number int8 NOT NULL,
	inscription_id text NOT NULL,
	block_height int4 NOT NULL,
	CONSTRAINT ord_number_to_id_pk PRIMARY KEY (id)
);
CREATE INDEX ord_number_to_id_block_height_idx ON public.ord_number_to_id USING btree (block_height);
CREATE UNIQUE INDEX ord_number_to_id_inscription_id_idx ON public.ord_number_to_id USING btree (inscription_id);
CREATE UNIQUE INDEX ord_number_to_id_inscription_number_idx ON public.ord_number_to_id USING btree (inscription_number);


-- public.ord_content definition

-- Drop table

-- DROP TABLE public.ord_content;

CREATE TABLE public.ord_content (
	id bigserial NOT NULL,
	inscription_id text NOT NULL,
	"content" jsonb NULL,
	text_content text NULL,
	content_type text NOT NULL,
	block_height int4 NOT NULL,
	CONSTRAINT ord_content_pk PRIMARY KEY (id)
);
CREATE INDEX ord_content_block_height_idx ON public.ord_content USING btree (block_height);
CREATE UNIQUE INDEX ord_content_inscription_id_idx ON public.ord_content USING btree (inscription_id);


-- public.block_hashes definition

-- Drop table

-- DROP TABLE public.block_hashes;

CREATE TABLE public.block_hashes (
	id bigserial NOT NULL,
	block_height int4 NOT NULL,
	block_hash text NOT NULL,
	CONSTRAINT block_hashes_pk PRIMARY KEY (id)
);
CREATE UNIQUE INDEX block_hashes_block_height_idx ON public.block_hashes USING btree (block_height);


-- public.ord_indexer_reorg_stats definition

-- Drop table

-- DROP TABLE public.ord_indexer_reorg_stats;

CREATE TABLE public.ord_indexer_reorg_stats (
	id bigserial NOT NULL,
	reorg_tm int8 NOT NULL,
	old_block_height int4 NOT NULL,
	new_block_height int4 NOT NULL,
	CONSTRAINT ord_indexer_reorg_stats_pk PRIMARY KEY (id)
);


-- public.ord_indexer_work_stats definition

-- Drop table

-- DROP TABLE public.ord_indexer_work_stats;

CREATE TABLE public.ord_indexer_work_stats (
	id bigserial NOT NULL,
	main_min_block_height int4 NULL,
	main_max_block_height int4 NULL,
	ord_sql_query_count int4 NULL,
	new_inscription_count int4 NULL,
	transfer_count int4 NULL,
	ord_index_tm int4 NULL,
	ord_sql_tm int4 NULL,
	update_log_tm int4 NULL,
	all_tm int4 NULL,
	ts timestamptz NOT NULL DEFAULT now(),
	CONSTRAINT ord_indexer_work_stats_pk PRIMARY KEY (id)
);
