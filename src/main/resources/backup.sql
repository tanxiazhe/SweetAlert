PGDMP     #                	    v            scheduledemo    10.4    10.4 B    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            T           1262    27519    scheduledemo    DATABASE     �   CREATE DATABASE scheduledemo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Yi_China.1252' LC_CTYPE = 'Yi_China.1252';
    DROP DATABASE scheduledemo;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            U           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            V           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    27705    qrtz_blob_triggers    TABLE     �   CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);
 &   DROP TABLE public.qrtz_blob_triggers;
       public         postgres    false    3            �            1259    27718    qrtz_calendars    TABLE     �   CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);
 "   DROP TABLE public.qrtz_calendars;
       public         postgres    false    3            �            1259    27679    qrtz_cron_triggers    TABLE       CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);
 &   DROP TABLE public.qrtz_cron_triggers;
       public         postgres    false    3            �            1259    27731    qrtz_fired_triggers    TABLE     2  CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);
 '   DROP TABLE public.qrtz_fired_triggers;
       public         postgres    false    3            �            1259    27645    qrtz_job_details    TABLE     �  CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);
 $   DROP TABLE public.qrtz_job_details;
       public         postgres    false    3            �            1259    27744 
   qrtz_locks    TABLE     �   CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);
    DROP TABLE public.qrtz_locks;
       public         postgres    false    3            �            1259    27726    qrtz_paused_trigger_grps    TABLE     �   CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);
 ,   DROP TABLE public.qrtz_paused_trigger_grps;
       public         postgres    false    3            �            1259    27739    qrtz_scheduler_state    TABLE     �   CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);
 (   DROP TABLE public.qrtz_scheduler_state;
       public         postgres    false    3            �            1259    27666    qrtz_simple_triggers    TABLE     .  CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);
 (   DROP TABLE public.qrtz_simple_triggers;
       public         postgres    false    3            �            1259    27692    qrtz_simprop_triggers    TABLE       CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);
 )   DROP TABLE public.qrtz_simprop_triggers;
       public         postgres    false    3            �            1259    27653    qrtz_triggers    TABLE     }  CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);
 !   DROP TABLE public.qrtz_triggers;
       public         postgres    false    3            I          0    27705    qrtz_blob_triggers 
   TABLE DATA               `   COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
    public       postgres    false    201   �[       J          0    27718    qrtz_calendars 
   TABLE DATA               M   COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
    public       postgres    false    202   �[       G          0    27679    qrtz_cron_triggers 
   TABLE DATA               t   COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
    public       postgres    false    199   \       L          0    27731    qrtz_fired_triggers 
   TABLE DATA               �   COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
    public       postgres    false    204   *\       D          0    27645    qrtz_job_details 
   TABLE DATA               �   COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
    public       postgres    false    196   G\       N          0    27744 
   qrtz_locks 
   TABLE DATA               ;   COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
    public       postgres    false    206   d\       K          0    27726    qrtz_paused_trigger_grps 
   TABLE DATA               M   COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
    public       postgres    false    203   �\       M          0    27739    qrtz_scheduler_state 
   TABLE DATA               n   COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
    public       postgres    false    205   �\       F          0    27666    qrtz_simple_triggers 
   TABLE DATA               �   COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
    public       postgres    false    198   �\       H          0    27692    qrtz_simprop_triggers 
   TABLE DATA               �   COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
    public       postgres    false    200   �\       E          0    27653    qrtz_triggers 
   TABLE DATA               �   COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
    public       postgres    false    197   ]       �
           2606    27712 *   qrtz_blob_triggers qrtz_blob_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 T   ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT qrtz_blob_triggers_pkey;
       public         postgres    false    201    201    201            �
           2606    27725 "   qrtz_calendars qrtz_calendars_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);
 L   ALTER TABLE ONLY public.qrtz_calendars DROP CONSTRAINT qrtz_calendars_pkey;
       public         postgres    false    202    202            �
           2606    27686 *   qrtz_cron_triggers qrtz_cron_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 T   ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT qrtz_cron_triggers_pkey;
       public         postgres    false    199    199    199            �
           2606    27738 ,   qrtz_fired_triggers qrtz_fired_triggers_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);
 V   ALTER TABLE ONLY public.qrtz_fired_triggers DROP CONSTRAINT qrtz_fired_triggers_pkey;
       public         postgres    false    204    204            �
           2606    27652 &   qrtz_job_details qrtz_job_details_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);
 P   ALTER TABLE ONLY public.qrtz_job_details DROP CONSTRAINT qrtz_job_details_pkey;
       public         postgres    false    196    196    196            �
           2606    27748    qrtz_locks qrtz_locks_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);
 D   ALTER TABLE ONLY public.qrtz_locks DROP CONSTRAINT qrtz_locks_pkey;
       public         postgres    false    206    206            �
           2606    27730 6   qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);
 `   ALTER TABLE ONLY public.qrtz_paused_trigger_grps DROP CONSTRAINT qrtz_paused_trigger_grps_pkey;
       public         postgres    false    203    203            �
           2606    27743 .   qrtz_scheduler_state qrtz_scheduler_state_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);
 X   ALTER TABLE ONLY public.qrtz_scheduler_state DROP CONSTRAINT qrtz_scheduler_state_pkey;
       public         postgres    false    205    205            �
           2606    27673 .   qrtz_simple_triggers qrtz_simple_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 X   ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT qrtz_simple_triggers_pkey;
       public         postgres    false    198    198    198            �
           2606    27699 0   qrtz_simprop_triggers qrtz_simprop_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 Z   ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT qrtz_simprop_triggers_pkey;
       public         postgres    false    200    200    200            �
           2606    27660     qrtz_triggers qrtz_triggers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);
 J   ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT qrtz_triggers_pkey;
       public         postgres    false    197    197    197            �
           1259    27764    idx_qrtz_ft_inst_job_req_rcvry    INDEX     �   CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);
 2   DROP INDEX public.idx_qrtz_ft_inst_job_req_rcvry;
       public         postgres    false    204    204    204            �
           1259    27765    idx_qrtz_ft_j_g    INDEX     j   CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);
 #   DROP INDEX public.idx_qrtz_ft_j_g;
       public         postgres    false    204    204    204            �
           1259    27766    idx_qrtz_ft_jg    INDEX     _   CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);
 "   DROP INDEX public.idx_qrtz_ft_jg;
       public         postgres    false    204    204            �
           1259    27767    idx_qrtz_ft_t_g    INDEX     r   CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);
 #   DROP INDEX public.idx_qrtz_ft_t_g;
       public         postgres    false    204    204    204            �
           1259    27768    idx_qrtz_ft_tg    INDEX     c   CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);
 "   DROP INDEX public.idx_qrtz_ft_tg;
       public         postgres    false    204    204            �
           1259    27763    idx_qrtz_ft_trig_inst_name    INDEX     o   CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);
 .   DROP INDEX public.idx_qrtz_ft_trig_inst_name;
       public         postgres    false    204    204            �
           1259    27750    idx_qrtz_j_grp    INDEX     \   CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);
 "   DROP INDEX public.idx_qrtz_j_grp;
       public         postgres    false    196    196            �
           1259    27749    idx_qrtz_j_req_recovery    INDEX     m   CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);
 +   DROP INDEX public.idx_qrtz_j_req_recovery;
       public         postgres    false    196    196            �
           1259    27753    idx_qrtz_t_c    INDEX     [   CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);
     DROP INDEX public.idx_qrtz_t_c;
       public         postgres    false    197    197            �
           1259    27754    idx_qrtz_t_g    INDEX     [   CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);
     DROP INDEX public.idx_qrtz_t_g;
       public         postgres    false    197    197            �
           1259    27751    idx_qrtz_t_j    INDEX     a   CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);
     DROP INDEX public.idx_qrtz_t_j;
       public         postgres    false    197    197    197            �
           1259    27752    idx_qrtz_t_jg    INDEX     X   CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);
 !   DROP INDEX public.idx_qrtz_t_jg;
       public         postgres    false    197    197            �
           1259    27757    idx_qrtz_t_n_g_state    INDEX     r   CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);
 (   DROP INDEX public.idx_qrtz_t_n_g_state;
       public         postgres    false    197    197    197            �
           1259    27756    idx_qrtz_t_n_state    INDEX     ~   CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);
 &   DROP INDEX public.idx_qrtz_t_n_state;
       public         postgres    false    197    197    197    197            �
           1259    27758    idx_qrtz_t_next_fire_time    INDEX     i   CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);
 -   DROP INDEX public.idx_qrtz_t_next_fire_time;
       public         postgres    false    197    197            �
           1259    27760    idx_qrtz_t_nft_misfire    INDEX     u   CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);
 *   DROP INDEX public.idx_qrtz_t_nft_misfire;
       public         postgres    false    197    197    197            �
           1259    27759    idx_qrtz_t_nft_st    INDEX     p   CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);
 %   DROP INDEX public.idx_qrtz_t_nft_st;
       public         postgres    false    197    197    197            �
           1259    27761    idx_qrtz_t_nft_st_misfire    INDEX     �   CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);
 -   DROP INDEX public.idx_qrtz_t_nft_st_misfire;
       public         postgres    false    197    197    197    197            �
           1259    27762    idx_qrtz_t_nft_st_misfire_grp    INDEX     �   CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);
 1   DROP INDEX public.idx_qrtz_t_nft_st_misfire_grp;
       public         postgres    false    197    197    197    197    197            �
           1259    27755    idx_qrtz_t_state    INDEX     _   CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);
 $   DROP INDEX public.idx_qrtz_t_state;
       public         postgres    false    197    197            �
           2606    27713 5   qrtz_blob_triggers qrtz_blob_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 _   ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT qrtz_blob_triggers_sched_name_fkey;
       public       postgres    false    2733    201    201    201    197    197    197            �
           2606    27687 5   qrtz_cron_triggers qrtz_cron_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 _   ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT qrtz_cron_triggers_sched_name_fkey;
       public       postgres    false    199    199    2733    197    197    197    199            �
           2606    27674 9   qrtz_simple_triggers qrtz_simple_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 c   ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT qrtz_simple_triggers_sched_name_fkey;
       public       postgres    false    197    197    198    2733    198    198    197            �
           2606    27700 ;   qrtz_simprop_triggers qrtz_simprop_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_sched_name_fkey FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);
 e   ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT qrtz_simprop_triggers_sched_name_fkey;
       public       postgres    false    200    197    197    197    200    200    2733            �
           2606    27661 +   qrtz_triggers qrtz_triggers_sched_name_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_sched_name_fkey FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);
 U   ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT qrtz_triggers_sched_name_fkey;
       public       postgres    false    196    196    2719    197    197    197    196            I      x������ � �      J      x������ � �      G      x������ � �      L      x������ � �      D      x������ � �      N   1   x�+N�HM)�I-rKL.�/�tJM��	�tww�wtvv����� :V�      K      x������ � �      M      x������ � �      F      x������ � �      H      x������ � �      E      x������ � �     