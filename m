Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C754E9A0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 20:45:42 +0200 (CEST)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1uUr-0005fv-6S
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 14:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1uQE-0004AT-5P
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1uQ8-0000rT-3L
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655404842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wgJ5Pn43Q4wRG2p6KvaSlvEknt6xYqjBZ/gGka07/L4=;
 b=KK6Kw9/LKN99pPPUtK7Aegh9TuYIC0ZAEDkGnLnR2+k0iigsGLCILhWw6gfif6nj0vIckY
 xUAd7taD/0Vo4ZuYtt1Qhyh8TUW2eGf06nPxAt0v/Sdy6b/9kcDrQWdY/W66q/JdspgmFB
 FPcBfPwm1r5taXsng6tuQxrwOA306iE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-85jQvHFQP-WWV4uIHOT91Q-1; Thu, 16 Jun 2022 14:40:41 -0400
X-MC-Unique: 85jQvHFQP-WWV4uIHOT91Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 bw25-20020a0560001f9900b002175d64fd29so427963wrb.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 11:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=wgJ5Pn43Q4wRG2p6KvaSlvEknt6xYqjBZ/gGka07/L4=;
 b=fAWFLn3Q27hYq1sVHSnqv27isd89BohqwBa9rXmWaW0LJcmkeWWK4KYNuy+VNCtH+L
 ZgJsqcXgv9myH8gWlOrGz6sIc/2vcsLvstVutmooPY6JISRIkmv0ZzSGI8YfSsg+YG4u
 EzIdNGNeokqdpYA3pPX1w/EC2utlAZNugzb9wVf+uf3Gq3a2m3BbSEXJH5fdJ6QWh4MD
 Oh9goQhtAyZauwmgavvB1XO6A8qBUGokin7+JhfP+NqctMH1YpEWwaffABBxzx7/OZou
 q3xYqJw6Frwh+ClnekQyPJ9/xU/DlOJ8m5laoZPaNVNraFWEM6JJrrKK8cliQReEuNUE
 cRMQ==
X-Gm-Message-State: AJIora/CVs5h3gY5NEgV2BrSxrYdzY0oDy2bw0PJJfhDPgJ2e3tFQev6
 aHT+belAKf2IahtthZeFGzCSYbHXvF6J7CQqCGNh0vtUO3RSEfCx1LlHIQ9X7sB4przhxIlwSDY
 cPQuDcZuFLce2D2M=
X-Received: by 2002:a5d:6484:0:b0:219:eb95:3502 with SMTP id
 o4-20020a5d6484000000b00219eb953502mr5852830wri.692.1655404839225; 
 Thu, 16 Jun 2022 11:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1svmEQM9pMnDgJGbYVw7qo7OunJmnQKAZVCzo5b6NrZWK6AfqT5HSFHfk6Wycv606AKrQnw5Q==
X-Received: by 2002:a5d:6484:0:b0:219:eb95:3502 with SMTP id
 o4-20020a5d6484000000b00219eb953502mr5852800wri.692.1655404838810; 
 Thu, 16 Jun 2022 11:40:38 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 by13-20020a056000098d00b0021a39a56a73sm1996895wrb.106.2022.06.16.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 11:40:37 -0700 (PDT)
Date: Thu, 16 Jun 2022 19:40:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH 2/4] Adding multi-interface support for multi-FD on
 destination side
Message-ID: <Yqt5I1sP7YxcU3TK@work-vm>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-3-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609073305.142515-3-het.gala@nutanix.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Het Gala (het.gala@nutanix.com) wrote:
> i) Modified the format of qemu monitor command: ‘migrate-incoming’ by adding
>    a list, each element in the list is to open listeners with a given number
>    of multiFD channels.
> 
> ii) Qemu starts with -incoming flag defer and -multi-fd-incoming defer to
>     allow the modified 'migrate-incoming' command to be used.
> 
> iii) Format for -multi-fd-incoming flag as a comma separated string has been
>      added with each substring containing listener socket address and number
>      of sockets to open.
> 
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  include/qapi/util.h   |   1 +
>  migration/migration.c | 149 ++++++++++++++++++++++++++++++++++++------
>  migration/migration.h |   2 +
>  migration/socket.c    |  11 ++--
>  migration/socket.h    |   3 +-
>  monitor/hmp-cmds.c    |  42 ++++--------
>  qapi/migration.json   |  43 ++++++++++--
>  qapi/qapi-util.c      |  27 ++++++++
>  qemu-options.hx       |  18 +++++
>  softmmu/vl.c          |  30 ++++++++-
>  10 files changed, 265 insertions(+), 61 deletions(-)
> 
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 3041feb3d9..88fb2270db 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -29,6 +29,7 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj,
>                       Error **errp);
>  
>  int parse_qapi_name(const char *name, bool complete);
> +struct strList *strList_from_string(const char *in, char c);
>  
>  /*
>   * For any GenericList @list, insert @element at the front.
> diff --git a/migration/migration.c b/migration/migration.c
> index c408175aeb..9b0ad732e7 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -477,28 +477,39 @@ void migrate_add_address(SocketAddress *address)
>                        QAPI_CLONE(SocketAddress, address));
>  }
>  
> -static void qemu_start_incoming_migration(const char *uri, Error **errp)
> +static void qemu_start_incoming_migration(const char *uri, uint8_t number,
> +                                          int idx, Error **errp)
>  {
>      const char *p = NULL;
>  
> -    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
> -    qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> -    if (strstart(uri, "tcp:", &p) ||
> -        strstart(uri, "unix:", NULL) ||
> -        strstart(uri, "vsock:", NULL)) {
> -        migrate_protocol_allow_multi_channels(true);
> -        socket_start_incoming_migration(p ? p : uri, errp);
> -#ifdef CONFIG_RDMA
> -    } else if (strstart(uri, "rdma:", &p)) {
> -        rdma_start_incoming_migration(p, errp);
> -#endif
> -    } else if (strstart(uri, "exec:", &p)) {
> -        exec_start_incoming_migration(p, errp);
> -    } else if (strstart(uri, "fd:", &p)) {
> -        fd_start_incoming_migration(p, errp);
> +    if (number ==  0) {
> +        migrate_protocol_allow_multi_channels(false); /* reset it anyway */
> +        qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> +        if (strstart(uri, "tcp:", &p) ||
> +            strstart(uri, "unix:", NULL) ||
> +            strstart(uri, "vsock:", NULL)) {
> +            migrate_protocol_allow_multi_channels(true);
> +    #ifdef CONFIG_RDMA
> +        } else if (strstart(uri, "rdma:", &p)) {
> +            rdma_start_incoming_migration(p, errp);
> +    #endif
> +        } else if (strstart(uri, "exec:", &p)) {
> +            exec_start_incoming_migration(p, errp);
> +        } else if (strstart(uri, "fd:", &p)) {
> +            fd_start_incoming_migration(p, errp);
> +        } else {
> +            error_setg(errp, "unknown migration protocol: %s", uri);
> +        }
>      } else {
> -        error_setg(errp, "unknown migration protocol: %s", uri);
> +        /* multi-FD parameters only support tcp network protocols */
> +        if (!strstart(uri, "tcp:", &p)) {
> +            error_setg(errp, "multifd-destination uri supports "
> +                                "tcp protocol only");
> +            return;
> +        }
> +        store_multifd_migration_params(p ? p : uri, NULL, number, idx, errp);
>      }
> +    socket_start_incoming_migration(p ? p : uri, number, errp);
>  }
>  
>  static void process_incoming_migration_bh(void *opaque)
> @@ -2140,7 +2151,17 @@ void migrate_del_blocker(Error *reason)
>      migration_blockers = g_slist_remove(migration_blockers, reason);
>  }
>  
> -void qmp_migrate_incoming(const char *uri, Error **errp)
> +static inline int incoming_multi_fd_uri_parse(const char *str, char delim)
> +{
> +    int count = 0;
> +    for (int i = 0; i < strlen(str); i++) {
> +        count += (str[i] == delim);
> +    }
> +    return count;
> +}

That's a bit more general little helper function; I guess it could go in
util/ somewhere (something like qemu_string_count_delim ???)

> +/* migrate_incoming comes from -incoming flag in qemu process */
> +void migrate_incoming(const char *uri, Error **errp)
>  {
>      Error *local_err = NULL;
>      static bool once = true;
> @@ -2154,11 +2175,99 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
>          return;
>      }
>  
> +    qemu_start_incoming_migration(uri, 0, 0, &local_err);
> +
>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
>          return;
>      }
>  
> -    qemu_start_incoming_migration(uri, &local_err);
> +    if (local_err) {
> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    once = false;

Can you explain what this change is for?

> +}
> +
> +/* multi_fd_migrate_incoming comes from -multi-fd-migrate-incoming flag in qemu process */
> +void multi_fd_migrate_incoming(const char *uri, Error **errp)
> +{
> +    Error *local_err = NULL;
> +    static bool once = true;
> +
> +    if (!once) {
> +        error_setg(errp, "The incoming migration has already been started");
> +        return;
> +    }
> +    if (!runstate_check(RUN_STATE_INMIGRATE)) {
> +        error_setg(errp, "'-multi-fd-incoming' was not specified on the command line");
> +        return;
> +    }
> +
> +    strList *st = strList_from_string(uri, ',');
> +    strList *r = st;
> +    int length = QAPI_LIST_LENGTH(st);
> +    init_multifd_array(length);
> +
> +    for (int i = 0; i < length; i++) {
> +        const char *uri = NULL, *ret = NULL;
> +        const char *str = r->value;
> +        uint8_t multifd_channels = DEFAULT_MIGRATE_MULTIFD_CHANNELS;
> +        int parse_count = incoming_multi_fd_uri_parse(str, ':');
> +        if (parse_count < 2 || parse_count > 3) {
> +            error_setg(errp, "Invalid format of string-id %d in "
> +                             "'-multi-fd-incoming' flag", i);
> +            return;
> +        }
> +        if (parse_count == 3) {
> +            ret = strrchr(str, ':');
> +            uri = g_strndup(str, strlen(str) - strlen(ret));
> +            multifd_channels = atoi(ret + 1);
> +        }
> +        qemu_start_incoming_migration(parse_count == 2 ? str : uri,
> +                                      multifd_channels, i, &local_err);
> +        r = r->next;
> +    }
> +
> +    if (local_err) {
> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    once = false;
> +}
> +
> +/* qmp_migrate_incoming comes from qemu qmp monitor command */
> +void qmp_migrate_incoming(const char *uri, bool has_multi_fd_uri_list,
> +                          MigrateIncomingUriList *cap, Error **errp)
> +{
> +    Error *local_err = NULL;
> +    static bool once = true;
> +
> +    if (!once) {
> +        error_setg(errp, "The incoming migration has already been started");
> +        return;
> +    }
> +
> +    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
> +        return;
> +    }
> +
> +    /* For migration thread */
> +    qemu_start_incoming_migration(uri, 0, 0, &local_err);
> +
> +    /* For Multi-FD */
> +    int length = QAPI_LIST_LENGTH(cap);
> +    init_multifd_array(length);
> +    for (int i = 0; i < length; i++) {
> +        const char *multifd_dst_uri = cap->value->destination_uri;
> +        uint8_t multifd_channels = cap->value->multifd_channels;
> +        qemu_start_incoming_migration(multifd_dst_uri, multifd_channels,
> +                                      i, &local_err);
> +        cap = cap->next;
> +    }
>  
>      if (local_err) {
>          yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> @@ -2194,7 +2303,7 @@ void qmp_migrate_recover(const char *uri, Error **errp)
>       * only re-setup the migration stream and poke existing migration
>       * to continue using that newly established channel.
>       */
> -    qemu_start_incoming_migration(uri, errp);
> +    qemu_start_incoming_migration(uri, 0, 0, errp);
>  }
>  
>  void qmp_migrate_pause(Error **errp)
> diff --git a/migration/migration.h b/migration/migration.h
> index 485d58b95f..fa8717ec9e 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -353,6 +353,8 @@ bool migration_is_setup_or_active(int state);
>  bool migration_is_running(int state);
>  
>  void migrate_init(MigrationState *s);
> +void migrate_incoming(const char *uri, Error **errp);
> +void multi_fd_migrate_incoming(const char *uri_str, Error **errp);
>  bool migration_is_blocked(Error **errp);
>  /* True if outgoing migration has entered postcopy phase */
>  bool migration_in_postcopy(void);
> diff --git a/migration/socket.c b/migration/socket.c
> index 7ca6af8cca..21e0983df2 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -202,17 +202,17 @@ socket_incoming_migration_end(void *opaque)
>  
>  static void
>  socket_start_incoming_migration_internal(SocketAddress *saddr,
> -                                         Error **errp)
> +                                         uint8_t number, Error **errp)
>  {
>      QIONetListener *listener = qio_net_listener_new();
>      MigrationIncomingState *mis = migration_incoming_get_current();
>      size_t i;
> -    int num = 1;
> +    uint8_t num = 1;
>  
>      qio_net_listener_set_name(listener, "migration-socket-listener");
>  
>      if (migrate_use_multifd()) {
> -        num = migrate_multifd_channels();
> +        num = number;

That's a strange line - it suggests you need a better name for both
parameters!

>      }
>  
>      if (qio_net_listener_open_sync(listener, saddr, num, errp) < 0) {
> @@ -239,12 +239,13 @@ socket_start_incoming_migration_internal(SocketAddress *saddr,
>      }
>  }
>  
> -void socket_start_incoming_migration(const char *str, Error **errp)
> +void socket_start_incoming_migration(const char *str,
> +                                     uint8_t number, Error **errp)
>  {
>      Error *err = NULL;
>      SocketAddress *saddr = socket_parse(str, &err);
>      if (!err) {
> -        socket_start_incoming_migration_internal(saddr, &err);
> +        socket_start_incoming_migration_internal(saddr, number, &err);
>      }
>      qapi_free_SocketAddress(saddr);
>      error_propagate(errp, err);
> diff --git a/migration/socket.h b/migration/socket.h
> index bba7f177fe..b9e3699167 100644
> --- a/migration/socket.h
> +++ b/migration/socket.h
> @@ -30,7 +30,8 @@ struct SrcDestAddr {
>  void socket_send_channel_create(QIOTaskFunc f, void *data);
>  int socket_send_channel_destroy(QIOChannel *send);
>  
> -void socket_start_incoming_migration(const char *str, Error **errp);
> +void socket_start_incoming_migration(const char *str, uint8_t number,
> +                                     Error **errp);
>  
>  void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
>                                       Error **errp);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 2db539016a..32a6b67d5f 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -42,6 +42,7 @@
>  #include "qapi/qapi-commands-run-state.h"
>  #include "qapi/qapi-commands-tpm.h"
>  #include "qapi/qapi-commands-ui.h"
> +#include "qapi/util.h"
>  #include "qapi/qapi-visit-net.h"
>  #include "qapi/qapi-visit-migration.h"
>  #include "qapi/qmp/qdict.h"
> @@ -72,32 +73,6 @@ bool hmp_handle_error(Monitor *mon, Error *err)
>      return false;
>  }
>  
> -/*
> - * Produce a strList from a comma separated list.
> - * A NULL or empty input string return NULL.
> - */
> -static strList *strList_from_comma_list(const char *in)
> -{
> -    strList *res = NULL;
> -    strList **tail = &res;
> -
> -    while (in && in[0]) {
> -        char *comma = strchr(in, ',');
> -        char *value;
> -
> -        if (comma) {
> -            value = g_strndup(in, comma - in);
> -            in = comma + 1; /* skip the , */
> -        } else {
> -            value = g_strdup(in);
> -            in = NULL;
> -        }
> -        QAPI_LIST_APPEND(tail, value);
> -    }
> -
> -    return res;
> -}
> -

>  void hmp_info_name(Monitor *mon, const QDict *qdict)
>  {
>      NameInfo *info;
> @@ -1117,7 +1092,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>                                              migrate_announce_params());
>  
>      qapi_free_strList(params->interfaces);
> -    params->interfaces = strList_from_comma_list(interfaces_str);
> +    params->interfaces = strList_from_string(interfaces_str, ',');
>      params->has_interfaces = params->interfaces != NULL;
>      params->id = g_strdup(id);
>      params->has_id = !!params->id;
> @@ -1147,8 +1122,19 @@ void hmp_migrate_incoming(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
>      const char *uri = qdict_get_str(qdict, "uri");
> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
> +    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
> +    MigrateIncomingUriList *caps = NULL;
> +    MigrateIncomingUri *value;
> +
> +    value = g_malloc0(sizeof(*value));
> +    value->destination_uri = (char *)dst_uri;
> +    value->multifd_channels = multifd_channels;
> +    QAPI_LIST_PREPEND(caps, value);
>  
> -    qmp_migrate_incoming(uri, &err);
> +    qmp_migrate_incoming(uri, !!caps, caps, &err);
> +    qapi_free_MigrateIncomingUriList(caps);
>  
>      hmp_handle_error(mon, err);
>  }
> diff --git a/qapi/migration.json b/qapi/migration.json
> index fb259d626b..62a7b22d19 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1527,15 +1527,37 @@
>    'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
>             '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>  
> +##
> +# @MigrateIncomingUri:
> +#
> +# Information regarding which destination listening interface to be connected
> +# and number of multifd channels over that interface.
> +#
> +# @destination-uri: the Uniform Resource Identifier of the destination VM
> +#
> +# @multifd-channels: number of channels used to migrate data in parallel for
> +#                    for specific source-uri and destination-uri.
> +#                    Default value in this case is 2 (Since 4.0)
> +#
> +##
> +{ 'struct' : 'MigrateIncomingUri',
> +  'data' : { 'destination-uri' : 'str',
> +           '*multifd-channels' : 'uint8'} }
> +
>  ##
>  # @migrate-incoming:
>  #
>  # Start an incoming migration, the qemu must have been started
> -# with -incoming defer
> +# with -incoming defer. qemu can also be started with optional
> +# -multi-fd-incoming defer for opening multifd listening sockets
>  #
>  # @uri: The Uniform Resource Identifier identifying the source or
>  #       address to listen on
>  #
> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
> +#                     Resource Identifiers with number of multifd-channels
> +#                     for each pair
> +#
>  # Returns: nothing on success
>  #
>  # Since: 2.3
> @@ -1546,19 +1568,30 @@
>  #    compatible with -incoming and the format of the uri is already exposed
>  #    above libvirt.
>  #
> -# 2. QEMU must be started with -incoming defer to allow migrate-incoming to
> +# 2. multi-fd-uri-list will have list of destination uri as listening sockets
> +#    and multi-fd number of channels on each listening socket.
> +#
> +# 3. QEMU must be started with -incoming defer to allow migrate-incoming to
>  #    be used.
>  #
> -# 3. The uri format is the same as for -incoming
> +# 4. multi-fd-uri-list format is not the same as for -multi-fd-incoming flag.
> +#    For -multi-fd-incoming flag, it is a comma separated list of listener
> +#    sockets with multifd channels.
> +#    Example: -multi-fd-incoming "tcp::6900:4,tcp:11.0.0.0:7789:5".

Why bother with -multi-fd-incoming ?  Just insist on people using
-incoming defer    - I think we'd like to do away with the other forms
of -incoming, it simplifies stuff a lot that way rather than having two
schemes.


>  # Example:
>  #
>  # -> { "execute": "migrate-incoming",
> -#      "arguments": { "uri": "tcp::4446" } }
> +#      "arguments": {"uri": "tcp::6789",
> +#                    "multi-fd-uri-list" : [ {"destination-uri" : "tcp::6900",
> +#                                             "multifd-channels": 4},
> +#                                            {"destination-uri" : "tcp:11.0.0.0:7789",
> +#                                             "multifd-channels": 5} ] } }
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'migrate-incoming', 'data': {'uri': 'str' } }
> +{ 'command': 'migrate-incoming',
> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateIncomingUri'] } }
>  
>  ##
>  # @xen-save-devices-state:
> diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
> index 63596e11c5..9cc43ebcd3 100644
> --- a/qapi/qapi-util.c
> +++ b/qapi/qapi-util.c
> @@ -15,6 +15,7 @@
>  #include "qapi/error.h"
>  #include "qemu/ctype.h"
>  #include "qapi/qmp/qerror.h"
> +#include "qapi/qapi-builtin-types.h"
>  
>  CompatPolicy compat_policy;
>  
> @@ -152,3 +153,29 @@ int parse_qapi_name(const char *str, bool complete)
>      }
>      return p - str;
>  }
> +
> +/*
> + * Produce a strList from a delimiter separated list.
> + * A NULL or empty input string return NULL.
> + */
> +strList *strList_from_string(const char *in, char c)
> +{
> +    strList *res = NULL;
> +    strList **tail = &res;
> +
> +    while (in && in[0]) {
> +        char *ch = strchr(in, c);
> +        char *value;
> +
> +        if (ch) {
> +            value = g_strndup(in, ch - in);
> +            in = ch + 1; /* skip the , */
> +        } else {
> +            value = g_strdup(in);
> +            in = NULL;
> +        }
> +        QAPI_LIST_APPEND(tail, value);
> +    }
> +
> +    return res;
> +}
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 60cf188da4..2e82e41dd5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4480,6 +4480,24 @@ SRST
>      to issuing the migrate\_incoming to allow the migration to begin.
>  ERST
>  
> +DEF("multi-fd-incoming", HAS_ARG, QEMU_OPTION_multi_fd_incoming, \
> +    "-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
> +    "-multi-fd-incoming defer\n" \
> +    "                wait for the URI to be specified via\n" \
> +    "                multi_fd_migrate_incoming\n",
> +    QEMU_ARCH_ALL)
> +SRST
> +``-multi-fd-incoming tcp:[host]:port[:channel][,to=maxport][,ipv4=on|off][,ipv6=on|off]``
> +    Prepare for multi-fd incoming migration, with multi-fd listening sockets
> +    on that connection. Default number of multi-fd channels is 2.
> +
> +``-multi-fd-incoming defer``
> +    Wait for the URI to be specified via multi_fd_migrate\_incoming. The
> +    monitor can be used to change settings (such as migration parameters)
> +    prior to issuing the multi_fd_migrate\_incoming to allow the migration
> +    to begin.
> +ERST
> +
>  DEF("only-migratable", 0, QEMU_OPTION_only_migratable, \
>      "-only-migratable     allow only migratable devices\n", QEMU_ARCH_ALL)
>  SRST
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4c1e94b00e..2f5cf18eff 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -45,7 +45,7 @@
>  #include "sysemu/seccomp.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/xen.h"
> -
> +#include "migration/migration.h"
>  #include "qemu/error-report.h"
>  #include "qemu/sockets.h"
>  #include "qemu/accel.h"
> @@ -167,6 +167,7 @@ typedef struct DeviceOption {
>  static const char *cpu_option;
>  static const char *mem_path;
>  static const char *incoming;
> +static const char *multi_fd_incoming;
>  static const char *loadvm;
>  static const char *accelerators;
>  static bool have_custom_ram_size;
> @@ -2349,6 +2350,11 @@ static void qemu_validate_options(const QDict *machine_opts)
>          error_report("'preconfig' supports '-incoming defer' only");
>          exit(EXIT_FAILURE);
>      }
> +    if (multi_fd_incoming && preconfig_requested &&
> +        strcmp(multi_fd_incoming, "defer") != 0) {
> +        error_report("'preconfig' supports '-multi-fd-incoming defer' only");
> +        exit(EXIT_FAILURE);
> +    }
>  
>  #ifdef CONFIG_CURSES
>      if (is_daemonized() && dpy.type == DISPLAY_TYPE_CURSES) {
> @@ -2621,7 +2627,7 @@ void qmp_x_exit_preconfig(Error **errp)
>      if (incoming) {
>          Error *local_err = NULL;
>          if (strcmp(incoming, "defer") != 0) {
> -            qmp_migrate_incoming(incoming, &local_err);
> +            migrate_incoming(incoming, &local_err);
>              if (local_err) {
>                  error_reportf_err(local_err, "-incoming %s: ", incoming);
>                  exit(1);
> @@ -2630,6 +2636,20 @@ void qmp_x_exit_preconfig(Error **errp)
>      } else if (autostart) {
>          qmp_cont(NULL);
>      }
> +
> +    if (multi_fd_incoming) {
> +        Error *local_err = NULL;
> +        if (strcmp(multi_fd_incoming, "defer") != 0) {
> +            multi_fd_migrate_incoming(multi_fd_incoming, &local_err);
> +            if (local_err) {
> +                error_reportf_err(local_err, "-multi-fd-incoming %s: ",
> +                                multi_fd_incoming);
> +                exit(1);
> +            }
> +        }
> +    } else if (autostart) {
> +        qmp_cont(NULL);
> +    }
>  }
>  
>  void qemu_init(int argc, char **argv, char **envp)
> @@ -3355,6 +3375,12 @@ void qemu_init(int argc, char **argv, char **envp)
>                  }
>                  incoming = optarg;
>                  break;
> +            case QEMU_OPTION_multi_fd_incoming:
> +                if (!multi_fd_incoming) {
> +                    runstate_set(RUN_STATE_INMIGRATE);
> +                }
> +                multi_fd_incoming = optarg;
> +                break;
>              case QEMU_OPTION_only_migratable:
>                  only_migratable = 1;
>                  break;
> -- 
> 2.22.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


