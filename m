Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22B582343
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:37:41 +0200 (CEST)
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdTt-0001V8-Te
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGdNv-0004qQ-Ro
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGdNr-0003nv-Ao
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658914274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0rtM9FLAfQqHQ48biHyZ0IsrZJYWD/FEDFDnjt+Ceg=;
 b=NwD2gJ5hPv3B8tqvmhplXjsJdajRQJtl9UpFJ55lI4OQJM/D2BgUInvqbGxRgB4gAA77ve
 vfmLdOalK/DLimKL7OQtHdh2d4GeI33x1c8u9ct98P5I+7tGn81Z6tzwaIFLJKLFlrRLoY
 vxOpVCAGbJic6MuJrQfSNUkAud9TTOk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-RT21UOlJOUOXcL1N_GW8Zw-1; Wed, 27 Jul 2022 05:31:10 -0400
X-MC-Unique: RT21UOlJOUOXcL1N_GW8Zw-1
Received: by mail-yb1-f197.google.com with SMTP id
 u6-20020a25b7c6000000b00670862c5b16so13025982ybj.12
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A0rtM9FLAfQqHQ48biHyZ0IsrZJYWD/FEDFDnjt+Ceg=;
 b=lYXiTmB8sBGEuJJTC8T9nvDcjV4kRtZrdImIfqL14HZUSC+qeKXzejDfqn9oWSPLXg
 SOoi+cJ9rBAgMip5yUm4A6znRcJ39WvI48Da37xAOeMRTBTOtv/TSGt4lHYKCimEtAWk
 Qpfs3OJzZ4uZdAWgTSjFsyzBlZxGsx4pamZEmv8NWzTVUNPb4HgG4/hPL/l6Zo09b4WY
 OeAd02XuD2yTrV4MyiFy1CQ9tMnqNhdc8r3nuFv5FUWrodmUaOt/ll9o6zmOorvakeaq
 +sexEuL550hwrNBpsSqnWbd4hDqew3+yPXeTAUcrxI1CSdYCdw9PMWvQEdUbi7n17nFS
 ASRg==
X-Gm-Message-State: AJIora9waQKSOyJUfh6faIJ294sRlVGomTjPOQxLPIwHBrvaHomkyBSh
 Fl404H+LInwR6m+eJ5F6Tdmij7KXEcedDqkX8kDTrkRzgqMSmtmQWv5ZknbvrddaNZ4KV6Oegnc
 wEBZzigtQ3D7Mg8KgMJEmj39PThlGH7c=
X-Received: by 2002:a81:430d:0:b0:31e:60a4:7bc6 with SMTP id
 q13-20020a81430d000000b0031e60a47bc6mr17757770ywa.515.1658914270371; 
 Wed, 27 Jul 2022 02:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tR+SUSu2xfpaT5F/XXaA71xnPahNioje/hwBZQT3JBb0uIWZqAdRWwi/5AvO2qFLSowVgtqpKkVKK8ce3XOn8=
X-Received: by 2002:a81:430d:0:b0:31e:60a4:7bc6 with SMTP id
 q13-20020a81430d000000b0031e60a47bc6mr17757751ywa.515.1658914270135; Wed, 27
 Jul 2022 02:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220727092135.302915-1-thuth@redhat.com>
 <20220727092135.302915-3-thuth@redhat.com>
In-Reply-To: <20220727092135.302915-3-thuth@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 27 Jul 2022 12:30:58 +0300
Message-ID: <CAPMcbCp5BMALXPXMGkmLD8MGvd4aqAEChpa_bdR1khKCHOGpiw@mail.gmail.com>
Subject: Re: [PATCH 2/3] qga: Replace 'blacklist' and 'whitelist' in the guest
 agent sources
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c8dbd105e4c613ed"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000c8dbd105e4c613ed
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Jul 27, 2022 at 12:21 PM Thomas Huth <thuth@redhat.com> wrote:

> Let's use better, more inclusive wording here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qga/qapi-schema.json   |  4 +--
>  qga/guest-agent-core.h |  2 +-
>  qga/commands-posix.c   | 16 ++++++------
>  qga/commands-win32.c   | 10 +++----
>  qga/main.c             | 59 +++++++++++++++++++++---------------------
>  5 files changed, 46 insertions(+), 45 deletions(-)
>
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 869399ea1a..026a56f76c 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -16,8 +16,8 @@
>
>  { 'pragma': { 'doc-required': true } }
>
> -# Whitelists to permit QAPI rule violations; think twice before you
> -# add to them!
> +# Lists with items allowed to permit QAPI rule violations; think twice
> +# before you add to them!
>  { 'pragma': {
>      # Types whose member names may use '_'
>      'member-name-exceptions': [
> diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h
> index 29cd50402f..b4e7c52c61 100644
> --- a/qga/guest-agent-core.h
> +++ b/qga/guest-agent-core.h
> @@ -24,7 +24,7 @@ typedef struct GACommandState GACommandState;
>  extern GAState *ga_state;
>  extern QmpCommandList ga_commands;
>
> -GList *ga_command_blacklist_init(GList *blacklist);
> +GList *ga_command_init_blockedrpcs(GList *blockedrpcs);
>  void ga_command_state_init(GAState *s, GACommandState *cs);
>  void ga_command_state_add(GACommandState *cs,
>                            void (*init)(void),
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 954efed01b..eea819cff0 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -3356,8 +3356,8 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum,
> Error **errp)
>  }
>  #endif
>
> -/* add unsupported commands to the blacklist */
> -GList *ga_command_blacklist_init(GList *blacklist)
> +/* add unsupported commands to the list of blocked RPCs */
> +GList *ga_command_init_blockedrpcs(GList *blockedrpcs)
>  {
>  #if !defined(__linux__)
>      {
> @@ -3370,13 +3370,13 @@ GList *ga_command_blacklist_init(GList *blacklist)
>          char **p = (char **)list;
>
>          while (*p) {
> -            blacklist = g_list_append(blacklist, g_strdup(*p++));
> +            blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
>          }
>      }
>  #endif
>
>  #if !defined(HAVE_GETIFADDRS)
> -    blacklist = g_list_append(blacklist,
> +    blockedrpcs = g_list_append(blockedrpcs,
>                                g_strdup("guest-network-get-interfaces"));
>  #endif
>
> @@ -3390,18 +3390,18 @@ GList *ga_command_blacklist_init(GList *blacklist)
>          char **p = (char **)list;
>
>          while (*p) {
> -            blacklist = g_list_append(blacklist, g_strdup(*p++));
> +            blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
>          }
>      }
>  #endif
>
>  #if !defined(CONFIG_FSTRIM)
> -    blacklist = g_list_append(blacklist, g_strdup("guest-fstrim"));
> +    blockedrpcs = g_list_append(blockedrpcs, g_strdup("guest-fstrim"));
>  #endif
>
> -    blacklist = g_list_append(blacklist, g_strdup("guest-get-devices"));
> +    blockedrpcs = g_list_append(blockedrpcs,
> g_strdup("guest-get-devices"));
>
> -    return blacklist;
> +    return blockedrpcs;
>  }
>
>  /* register init/cleanup routines for stateful command groups */
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 7ed7664715..ec9f55b453 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2005,8 +2005,8 @@ GuestMemoryBlockInfo
> *qmp_guest_get_memory_block_info(Error **errp)
>      return NULL;
>  }
>
> -/* add unsupported commands to the blacklist */
> -GList *ga_command_blacklist_init(GList *blacklist)
> +/* add unsupported commands to the list of blocked RPCs */
> +GList *ga_command_init_blockedrpcs(GList *blockedrpcs)
>  {
>      const char *list_unsupported[] = {
>          "guest-suspend-hybrid",
> @@ -2017,7 +2017,7 @@ GList *ga_command_blacklist_init(GList *blacklist)
>      char **p = (char **)list_unsupported;
>
>      while (*p) {
> -        blacklist = g_list_append(blacklist, g_strdup(*p++));
> +        blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
>      }
>
>      if (!vss_init(true)) {
> @@ -2028,11 +2028,11 @@ GList *ga_command_blacklist_init(GList *blacklist)
>          p = (char **)list;
>
>          while (*p) {
> -            blacklist = g_list_append(blacklist, g_strdup(*p++));
> +            blockedrpcs = g_list_append(blockedrpcs, g_strdup(*p++));
>          }
>      }
>
> -    return blacklist;
> +    return blockedrpcs;
>  }
>
>  /* register init/cleanup routines for stateful command groups */
> diff --git a/qga/main.c b/qga/main.c
> index 74e5c9b10c..5a9d8252e0 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -87,7 +87,7 @@ struct GAState {
>  #endif
>      bool delimit_response;
>      bool frozen;
> -    GList *blacklist;
> +    GList *blockedrpcs;
>      char *state_filepath_isfrozen;
>      struct {
>          const char *log_filepath;
> @@ -107,7 +107,7 @@ struct GAState *ga_state;
>  QmpCommandList ga_commands;
>
>  /* commands that are safe to issue while filesystems are frozen */
> -static const char *ga_freeze_whitelist[] = {
> +static const char *ga_freeze_allowlist[] = {
>      "guest-ping",
>      "guest-info",
>      "guest-sync",
> @@ -363,31 +363,31 @@ static gint ga_strcmp(gconstpointer str1,
> gconstpointer str2)
>  }
>
>  /* disable commands that aren't safe for fsfreeze */
> -static void ga_disable_non_whitelisted(const QmpCommand *cmd, void
> *opaque)
> +static void ga_disable_not_allowed(const QmpCommand *cmd, void *opaque)
>  {
> -    bool whitelisted = false;
> +    bool allowed = false;
>      int i = 0;
>      const char *name = qmp_command_name(cmd);
>
> -    while (ga_freeze_whitelist[i] != NULL) {
> -        if (strcmp(name, ga_freeze_whitelist[i]) == 0) {
> -            whitelisted = true;
> +    while (ga_freeze_allowlist[i] != NULL) {
> +        if (strcmp(name, ga_freeze_allowlist[i]) == 0) {
> +            allowed = true;
>          }
>          i++;
>      }
> -    if (!whitelisted) {
> +    if (!allowed) {
>          g_debug("disabling command: %s", name);
>          qmp_disable_command(&ga_commands, name, "the agent is in frozen
> state");
>      }
>  }
>
> -/* [re-]enable all commands, except those explicitly blacklisted by user
> */
> -static void ga_enable_non_blacklisted(const QmpCommand *cmd, void *opaque)
> +/* [re-]enable all commands, except those explicitly blocked by user */
> +static void ga_enable_non_blocked(const QmpCommand *cmd, void *opaque)
>  {
> -    GList *blacklist = opaque;
> +    GList *blockedrpcs = opaque;
>      const char *name = qmp_command_name(cmd);
>
> -    if (g_list_find_custom(blacklist, name, ga_strcmp) == NULL &&
> +    if (g_list_find_custom(blockedrpcs, name, ga_strcmp) == NULL &&
>          !qmp_command_is_enabled(cmd)) {
>          g_debug("enabling command: %s", name);
>          qmp_enable_command(&ga_commands, name);
> @@ -426,8 +426,8 @@ void ga_set_frozen(GAState *s)
>      if (ga_is_frozen(s)) {
>          return;
>      }
> -    /* disable all non-whitelisted (for frozen state) commands */
> -    qmp_for_each_command(&ga_commands, ga_disable_non_whitelisted, NULL);
> +    /* disable all forbidden (for frozen state) commands */
> +    qmp_for_each_command(&ga_commands, ga_disable_not_allowed, NULL);
>      g_warning("disabling logging due to filesystem freeze");
>      ga_disable_logging(s);
>      s->frozen = true;
> @@ -465,8 +465,8 @@ void ga_unset_frozen(GAState *s)
>          s->deferred_options.pid_filepath = NULL;
>      }
>
> -    /* enable all disabled, non-blacklisted commands */
> -    qmp_for_each_command(&ga_commands, ga_enable_non_blacklisted,
> s->blacklist);
> +    /* enable all disabled, non-blocked commands */
> +    qmp_for_each_command(&ga_commands, ga_enable_non_blocked,
> s->blockedrpcs);
>      s->frozen = false;
>      if (!ga_delete_file(s->state_filepath_isfrozen)) {
>          g_warning("unable to delete %s, fsfreeze may not function
> properly",
> @@ -896,7 +896,8 @@ int64_t ga_get_fd_handle(GAState *s, Error **errp)
>      int64_t handle;
>
>      g_assert(s->pstate_filepath);
> -    /* we blacklist commands and avoid operations that potentially require
> +    /*
> +     * We block commands and avoid operations that potentially require
>       * writing to disk when we're in a frozen state. this includes opening
>       * new files, so we should never get here in that situation
>       */
> @@ -950,8 +951,8 @@ struct GAConfig {
>  #ifdef _WIN32
>      const char *service;
>  #endif
> -    gchar *bliststr; /* blacklist may point to this string */
> -    GList *blacklist;
> +    gchar *bliststr; /* blockedrpcs may point to this string */
> +    GList *blockedrpcs;
>      int daemonize;
>      GLogLevelFlags log_level;
>      int dumpconf;
> @@ -1019,7 +1020,7 @@ static void config_load(GAConfig *config)
>      if (g_key_file_has_key(keyfile, "general", blockrpcs_key, NULL)) {
>          config->bliststr =
>              g_key_file_get_string(keyfile, "general", blockrpcs_key,
> &gerr);
> -        config->blacklist = g_list_concat(config->blacklist,
> +        config->blockedrpcs = g_list_concat(config->blockedrpcs,
>                                            split_list(config->bliststr,
> ","));
>      }
>
> @@ -1079,7 +1080,7 @@ static void config_dump(GAConfig *config)
>                             config->log_level == G_LOG_LEVEL_MASK);
>      g_key_file_set_boolean(keyfile, "general", "retry-path",
>                             config->retry_path);
> -    tmp = list_join(config->blacklist, ',');
> +    tmp = list_join(config->blockedrpcs, ',');
>      g_key_file_set_string(keyfile, "general", "block-rpcs", tmp);
>      g_free(tmp);
>
> @@ -1171,8 +1172,8 @@ static void config_parse(GAConfig *config, int argc,
> char **argv)
>                  qmp_for_each_command(&ga_commands, ga_print_cmd, NULL);
>                  exit(EXIT_SUCCESS);
>              }
> -            config->blacklist = g_list_concat(config->blacklist,
> -                                             split_list(optarg, ","));
> +            config->blockedrpcs = g_list_concat(config->blockedrpcs,
> +                                                split_list(optarg, ","));
>              break;
>          }
>  #ifdef _WIN32
> @@ -1226,7 +1227,7 @@ static void config_free(GAConfig *config)
>  #ifdef CONFIG_FSFREEZE
>      g_free(config->fsfreeze_hook);
>  #endif
> -    g_list_free_full(config->blacklist, g_free);
> +    g_list_free_full(config->blockedrpcs, g_free);
>      g_free(config);
>  }
>
> @@ -1310,7 +1311,7 @@ static GAState *initialize_agent(GAConfig *config,
> int socket_activation)
>              s->deferred_options.log_filepath = config->log_filepath;
>          }
>          ga_disable_logging(s);
> -        qmp_for_each_command(&ga_commands, ga_disable_non_whitelisted,
> NULL);
> +        qmp_for_each_command(&ga_commands, ga_disable_not_allowed, NULL);
>      } else {
>          if (config->daemonize) {
>              become_daemon(config->pid_filepath);
> @@ -1334,10 +1335,10 @@ static GAState *initialize_agent(GAConfig *config,
> int socket_activation)
>          return NULL;
>      }
>
> -    config->blacklist = ga_command_blacklist_init(config->blacklist);
> -    if (config->blacklist) {
> -        GList *l = config->blacklist;
> -        s->blacklist = config->blacklist;
> +    config->blockedrpcs =
> ga_command_init_blockedrpcs(config->blockedrpcs);
> +    if (config->blockedrpcs) {
> +        GList *l = config->blockedrpcs;
> +        s->blockedrpcs = config->blockedrpcs;
>          do {
>              g_debug("disabling command: %s", (char *)l->data);
>              qmp_disable_command(&ga_commands, l->data, NULL);
> --
> 2.31.1
>
>

--000000000000c8dbd105e4c613ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 2=
7, 2022 at 12:21 PM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thu=
th@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Let&#39;s use better, more inclusive wording here.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/qapi-schema.json=C2=A0 =C2=A0|=C2=A0 4 +--<br>
=C2=A0qga/guest-agent-core.h |=C2=A0 2 +-<br>
=C2=A0qga/commands-posix.c=C2=A0 =C2=A0| 16 ++++++------<br>
=C2=A0qga/commands-win32.c=C2=A0 =C2=A0| 10 +++----<br>
=C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 59 ++++++=
+++++++++++++++---------------------<br>
=C2=A05 files changed, 46 insertions(+), 45 deletions(-)<br>
<br>
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>
index 869399ea1a..026a56f76c 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -16,8 +16,8 @@<br>
<br>
=C2=A0{ &#39;pragma&#39;: { &#39;doc-required&#39;: true } }<br>
<br>
-# Whitelists to permit QAPI rule violations; think twice before you<br>
-# add to them!<br>
+# Lists with items allowed to permit QAPI rule violations; think twice<br>
+# before you add to them!<br>
=C2=A0{ &#39;pragma&#39;: {<br>
=C2=A0 =C2=A0 =C2=A0# Types whose member names may use &#39;_&#39;<br>
=C2=A0 =C2=A0 =C2=A0&#39;member-name-exceptions&#39;: [<br>
diff --git a/qga/guest-agent-core.h b/qga/guest-agent-core.h<br>
index 29cd50402f..b4e7c52c61 100644<br>
--- a/qga/guest-agent-core.h<br>
+++ b/qga/guest-agent-core.h<br>
@@ -24,7 +24,7 @@ typedef struct GACommandState GACommandState;<br>
=C2=A0extern GAState *ga_state;<br>
=C2=A0extern QmpCommandList ga_commands;<br>
<br>
-GList *ga_command_blacklist_init(GList *blacklist);<br>
+GList *ga_command_init_blockedrpcs(GList *blockedrpcs);<br>
=C2=A0void ga_command_state_init(GAState *s, GACommandState *cs);<br>
=C2=A0void ga_command_state_add(GACommandState *cs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void (*init)(void),<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 954efed01b..eea819cff0 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -3356,8 +3356,8 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, E=
rror **errp)<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
-/* add unsupported commands to the blacklist */<br>
-GList *ga_command_blacklist_init(GList *blacklist)<br>
+/* add unsupported commands to the list of blocked RPCs */<br>
+GList *ga_command_init_blockedrpcs(GList *blockedrpcs)<br>
=C2=A0{<br>
=C2=A0#if !defined(__linux__)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
@@ -3370,13 +3370,13 @@ GList *ga_command_blacklist_init(GList *blacklist)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **p =3D (char **)list;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (*p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blacklist =3D g_list_append(blac=
klist, g_strdup(*p++));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blockedrpcs =3D g_list_append(bl=
ockedrpcs, g_strdup(*p++));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
=C2=A0#if !defined(HAVE_GETIFADDRS)<br>
-=C2=A0 =C2=A0 blacklist =3D g_list_append(blacklist,<br>
+=C2=A0 =C2=A0 blockedrpcs =3D g_list_append(blockedrpcs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_strdup(&quot;guest-network-get-inte=
rfaces&quot;));<br>
=C2=A0#endif<br>
<br>
@@ -3390,18 +3390,18 @@ GList *ga_command_blacklist_init(GList *blacklist)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **p =3D (char **)list;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (*p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blacklist =3D g_list_append(blac=
klist, g_strdup(*p++));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blockedrpcs =3D g_list_append(bl=
ockedrpcs, g_strdup(*p++));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
<br>
=C2=A0#if !defined(CONFIG_FSTRIM)<br>
-=C2=A0 =C2=A0 blacklist =3D g_list_append(blacklist, g_strdup(&quot;guest-=
fstrim&quot;));<br>
+=C2=A0 =C2=A0 blockedrpcs =3D g_list_append(blockedrpcs, g_strdup(&quot;gu=
est-fstrim&quot;));<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 blacklist =3D g_list_append(blacklist, g_strdup(&quot;guest-=
get-devices&quot;));<br>
+=C2=A0 =C2=A0 blockedrpcs =3D g_list_append(blockedrpcs, g_strdup(&quot;gu=
est-get-devices&quot;));<br>
<br>
-=C2=A0 =C2=A0 return blacklist;<br>
+=C2=A0 =C2=A0 return blockedrpcs;<br>
=C2=A0}<br>
<br>
=C2=A0/* register init/cleanup routines for stateful command groups */<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 7ed7664715..ec9f55b453 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2005,8 +2005,8 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info=
(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
-/* add unsupported commands to the blacklist */<br>
-GList *ga_command_blacklist_init(GList *blacklist)<br>
+/* add unsupported commands to the list of blocked RPCs */<br>
+GList *ga_command_init_blockedrpcs(GList *blockedrpcs)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *list_unsupported[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;guest-suspend-hybrid&quot;,<br>
@@ -2017,7 +2017,7 @@ GList *ga_command_blacklist_init(GList *blacklist)<br=
>
=C2=A0 =C2=A0 =C2=A0char **p =3D (char **)list_unsupported;<br>
<br>
=C2=A0 =C2=A0 =C2=A0while (*p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blacklist =3D g_list_append(blacklist, g_strdu=
p(*p++));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 blockedrpcs =3D g_list_append(blockedrpcs, g_s=
trdup(*p++));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!vss_init(true)) {<br>
@@ -2028,11 +2028,11 @@ GList *ga_command_blacklist_init(GList *blacklist)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D (char **)list;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (*p) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blacklist =3D g_list_append(blac=
klist, g_strdup(*p++));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 blockedrpcs =3D g_list_append(bl=
ockedrpcs, g_strdup(*p++));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return blacklist;<br>
+=C2=A0 =C2=A0 return blockedrpcs;<br>
=C2=A0}<br>
<br>
=C2=A0/* register init/cleanup routines for stateful command groups */<br>
diff --git a/qga/main.c b/qga/main.c<br>
index 74e5c9b10c..5a9d8252e0 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -87,7 +87,7 @@ struct GAState {<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0bool delimit_response;<br>
=C2=A0 =C2=A0 =C2=A0bool frozen;<br>
-=C2=A0 =C2=A0 GList *blacklist;<br>
+=C2=A0 =C2=A0 GList *blockedrpcs;<br>
=C2=A0 =C2=A0 =C2=A0char *state_filepath_isfrozen;<br>
=C2=A0 =C2=A0 =C2=A0struct {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *log_filepath;<br>
@@ -107,7 +107,7 @@ struct GAState *ga_state;<br>
=C2=A0QmpCommandList ga_commands;<br>
<br>
=C2=A0/* commands that are safe to issue while filesystems are frozen */<br=
>
-static const char *ga_freeze_whitelist[] =3D {<br>
+static const char *ga_freeze_allowlist[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;guest-ping&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;guest-info&quot;,<br>
=C2=A0 =C2=A0 =C2=A0&quot;guest-sync&quot;,<br>
@@ -363,31 +363,31 @@ static gint ga_strcmp(gconstpointer str1, gconstpoint=
er str2)<br>
=C2=A0}<br>
<br>
=C2=A0/* disable commands that aren&#39;t safe for fsfreeze */<br>
-static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque=
)<br>
+static void ga_disable_not_allowed(const QmpCommand *cmd, void *opaque)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool whitelisted =3D false;<br>
+=C2=A0 =C2=A0 bool allowed =3D false;<br>
=C2=A0 =C2=A0 =C2=A0int i =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0const char *name =3D qmp_command_name(cmd);<br>
<br>
-=C2=A0 =C2=A0 while (ga_freeze_whitelist[i] !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(name, ga_freeze_whitelist[i]) =3D=
=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 whitelisted =3D true;<br>
+=C2=A0 =C2=A0 while (ga_freeze_allowlist[i] !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(name, ga_freeze_allowlist[i]) =3D=
=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allowed =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i++;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (!whitelisted) {<br>
+=C2=A0 =C2=A0 if (!allowed) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;disabling command: %s&quot;=
, name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_disable_command(&amp;ga_commands, nam=
e, &quot;the agent is in frozen state&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-/* [re-]enable all commands, except those explicitly blacklisted by user *=
/<br>
-static void ga_enable_non_blacklisted(const QmpCommand *cmd, void *opaque)=
<br>
+/* [re-]enable all commands, except those explicitly blocked by user */<br=
>
+static void ga_enable_non_blocked(const QmpCommand *cmd, void *opaque)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 GList *blacklist =3D opaque;<br>
+=C2=A0 =C2=A0 GList *blockedrpcs =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0const char *name =3D qmp_command_name(cmd);<br>
<br>
-=C2=A0 =C2=A0 if (g_list_find_custom(blacklist, name, ga_strcmp) =3D=3D NU=
LL &amp;&amp;<br>
+=C2=A0 =C2=A0 if (g_list_find_custom(blockedrpcs, name, ga_strcmp) =3D=3D =
NULL &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!qmp_command_is_enabled(cmd)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;enabling command: %s&quot;,=
 name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_enable_command(&amp;ga_commands, name=
);<br>
@@ -426,8 +426,8 @@ void ga_set_frozen(GAState *s)<br>
=C2=A0 =C2=A0 =C2=A0if (ga_is_frozen(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 /* disable all non-whitelisted (for frozen state) commands *=
/<br>
-=C2=A0 =C2=A0 qmp_for_each_command(&amp;ga_commands, ga_disable_non_whitel=
isted, NULL);<br>
+=C2=A0 =C2=A0 /* disable all forbidden (for frozen state) commands */<br>
+=C2=A0 =C2=A0 qmp_for_each_command(&amp;ga_commands, ga_disable_not_allowe=
d, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_warning(&quot;disabling logging due to filesystem fre=
eze&quot;);<br>
=C2=A0 =C2=A0 =C2=A0ga_disable_logging(s);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;frozen =3D true;<br>
@@ -465,8 +465,8 @@ void ga_unset_frozen(GAState *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;deferred_options.pid_filepath =3D N=
ULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 /* enable all disabled, non-blacklisted commands */<br>
-=C2=A0 =C2=A0 qmp_for_each_command(&amp;ga_commands, ga_enable_non_blackli=
sted, s-&gt;blacklist);<br>
+=C2=A0 =C2=A0 /* enable all disabled, non-blocked commands */<br>
+=C2=A0 =C2=A0 qmp_for_each_command(&amp;ga_commands, ga_enable_non_blocked=
, s-&gt;blockedrpcs);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;frozen =3D false;<br>
=C2=A0 =C2=A0 =C2=A0if (!ga_delete_file(s-&gt;state_filepath_isfrozen)) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_warning(&quot;unable to delete %s, fsfr=
eeze may not function properly&quot;,<br>
@@ -896,7 +896,8 @@ int64_t ga_get_fd_handle(GAState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0int64_t handle;<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_assert(s-&gt;pstate_filepath);<br>
-=C2=A0 =C2=A0 /* we blacklist commands and avoid operations that potential=
ly require<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* We block commands and avoid operations that potentia=
lly require<br>
=C2=A0 =C2=A0 =C2=A0 * writing to disk when we&#39;re in a frozen state. th=
is includes opening<br>
=C2=A0 =C2=A0 =C2=A0 * new files, so we should never get here in that situa=
tion<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
@@ -950,8 +951,8 @@ struct GAConfig {<br>
=C2=A0#ifdef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0const char *service;<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 gchar *bliststr; /* blacklist may point to this string */<br=
>
-=C2=A0 =C2=A0 GList *blacklist;<br>
+=C2=A0 =C2=A0 gchar *bliststr; /* blockedrpcs may point to this string */<=
br>
+=C2=A0 =C2=A0 GList *blockedrpcs;<br>
=C2=A0 =C2=A0 =C2=A0int daemonize;<br>
=C2=A0 =C2=A0 =C2=A0GLogLevelFlags log_level;<br>
=C2=A0 =C2=A0 =C2=A0int dumpconf;<br>
@@ -1019,7 +1020,7 @@ static void config_load(GAConfig *config)<br>
=C2=A0 =C2=A0 =C2=A0if (g_key_file_has_key(keyfile, &quot;general&quot;, bl=
ockrpcs_key, NULL)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config-&gt;bliststr =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_key_file_get_string(keyfi=
le, &quot;general&quot;, blockrpcs_key, &amp;gerr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;blacklist =3D g_list_concat(config-=
&gt;blacklist,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;blockedrpcs =3D g_list_concat(confi=
g-&gt;blockedrpcs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0split_list(config-&gt;bliststr, &quot;,&quot;));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1079,7 +1080,7 @@ static void config_dump(GAConfig *config)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;log_level =3D=3D G_LOG_LEVEL_MASK);<br>
=C2=A0 =C2=A0 =C2=A0g_key_file_set_boolean(keyfile, &quot;general&quot;, &q=
uot;retry-path&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;retry_path);<br>
-=C2=A0 =C2=A0 tmp =3D list_join(config-&gt;blacklist, &#39;,&#39;);<br>
+=C2=A0 =C2=A0 tmp =3D list_join(config-&gt;blockedrpcs, &#39;,&#39;);<br>
=C2=A0 =C2=A0 =C2=A0g_key_file_set_string(keyfile, &quot;general&quot;, &qu=
ot;block-rpcs&quot;, tmp);<br>
=C2=A0 =C2=A0 =C2=A0g_free(tmp);<br>
<br>
@@ -1171,8 +1172,8 @@ static void config_parse(GAConfig *config, int argc, =
char **argv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_for_each_=
command(&amp;ga_commands, ga_print_cmd, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(EXIT_SUC=
CESS);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;blacklist =3D g_list_=
concat(config-&gt;blacklist,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0split_list(optarg, &quot;,&quot;));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config-&gt;blockedrpcs =3D g_lis=
t_concat(config-&gt;blockedrpcs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 split_list(optarg, &quot;,&quot;));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#ifdef _WIN32<br>
@@ -1226,7 +1227,7 @@ static void config_free(GAConfig *config)<br>
=C2=A0#ifdef CONFIG_FSFREEZE<br>
=C2=A0 =C2=A0 =C2=A0g_free(config-&gt;fsfreeze_hook);<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 g_list_free_full(config-&gt;blacklist, g_free);<br>
+=C2=A0 =C2=A0 g_list_free_full(config-&gt;blockedrpcs, g_free);<br>
=C2=A0 =C2=A0 =C2=A0g_free(config);<br>
=C2=A0}<br>
<br>
@@ -1310,7 +1311,7 @@ static GAState *initialize_agent(GAConfig *config, in=
t socket_activation)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;deferred_options.log_=
filepath =3D config-&gt;log_filepath;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ga_disable_logging(s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_for_each_command(&amp;ga_commands, ga_disa=
ble_non_whitelisted, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_for_each_command(&amp;ga_commands, ga_disa=
ble_not_allowed, NULL);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (config-&gt;daemonize) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0become_daemon(config-&gt;pi=
d_filepath);<br>
@@ -1334,10 +1335,10 @@ static GAState *initialize_agent(GAConfig *config, =
int socket_activation)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 config-&gt;blacklist =3D ga_command_blacklist_init(config-&g=
t;blacklist);<br>
-=C2=A0 =C2=A0 if (config-&gt;blacklist) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GList *l =3D config-&gt;blacklist;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;blacklist =3D config-&gt;blacklist;<br>
+=C2=A0 =C2=A0 config-&gt;blockedrpcs =3D ga_command_init_blockedrpcs(confi=
g-&gt;blockedrpcs);<br>
+=C2=A0 =C2=A0 if (config-&gt;blockedrpcs) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GList *l =3D config-&gt;blockedrpcs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;blockedrpcs =3D config-&gt;blockedrpcs;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_debug(&quot;disabling com=
mand: %s&quot;, (char *)l-&gt;data);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_disable_command(&amp;ga=
_commands, l-&gt;data, NULL);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000c8dbd105e4c613ed--


