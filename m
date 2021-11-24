Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68445B76D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:29:57 +0100 (CET)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpobD-0006uc-MJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpoVC-0001BD-Di
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpoV4-0004iS-JZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637745813;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=op9l1houTh0AyZsl7B2PXM1vJGxkSjd2K5RbuoSzYhQ=;
 b=gpS1tI88ryhmMYhKnopL3Gn6F/9BzGSRP76ibJaTpWul+zGQSLhrRrl9qip6eA/dJJInwO
 ydD8bT5rnhEqTmnmvIly9NwHTEh/+4kbA9fIVkhnOKWWZRffaVr29jEwe1V32MUTlupZcC
 wM+ySL7Rc7ooTT6Pe2WLeDmqp/mZfjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-0ilK4vYOOO6ytKFW8o1HZQ-1; Wed, 24 Nov 2021 04:23:30 -0500
X-MC-Unique: 0ilK4vYOOO6ytKFW8o1HZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F0AEC1C1;
 Wed, 24 Nov 2021 09:23:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72A98418E;
 Wed, 24 Nov 2021 09:23:25 +0000 (UTC)
Date: Wed, 24 Nov 2021 09:23:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] qga: replace "blacklist" with "blocklist"
Message-ID: <YZ4Ei1AWr6LeZA+d@redhat.com>
References: <20211124090937.293966-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124090937.293966-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: michael.roth@amd.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 01:09:37PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Let's use a more neutral language for that option.
> 
> "blacklist" is still silently accepted for compatibility reasons.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/interop/qemu-ga.rst   |  4 ++--
>  qga/guest-agent-core.h     |  2 +-
>  qga/commands-posix.c       | 14 ++++++------
>  qga/commands-win32.c       | 10 ++++----
>  qga/main.c                 | 47 ++++++++++++++++++++++----------------
>  tests/unit/test-qga.c      |  8 +++----
>  tests/data/test-qga-config |  2 +-
>  7 files changed, 47 insertions(+), 40 deletions(-)
> 
> diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
> index 3063357bb5d6..706c7b189b0e 100644
> --- a/docs/interop/qemu-ga.rst
> +++ b/docs/interop/qemu-ga.rst
> @@ -79,7 +79,7 @@ Options
>  
>    Daemonize after startup (detach from terminal).
>  
> -.. option:: -b, --blacklist=LIST
> +.. option:: -b, --blocklist=LIST
>  
>    Comma-separated list of RPCs to disable (no spaces, ``?`` to list
>    available RPCs).

IMHO, neither is especially informative because they don't
express what is being disabled. What about.

   -f, --command-filter=LIST

   Comma-separate list of command names to disable.
   No spaces, use ``help`` to list available commands.


> diff --git a/qga/main.c b/qga/main.c
> index 15fd3a4149f4..016e3f160570 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -88,7 +88,7 @@ struct GAState {
>  #endif
>      bool delimit_response;
>      bool frozen;
> -    GList *blacklist;
> +    GList *blocklist;
>      char *state_filepath_isfrozen;
>      struct {
>          const char *log_filepath;
> @@ -257,7 +257,7 @@ QEMU_COPYRIGHT "\n"
>  #ifdef _WIN32
>  "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
>  #endif
> -"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
> +"  -b, --blocklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
>  "                    to list available RPCs)\n"
>  "  -D, --dump-conf   dump a qemu-ga config file based on current config\n"
>  "                    options / command-line parameters to stdout\n"
> @@ -379,13 +379,13 @@ static void ga_disable_non_whitelisted(const QmpCommand *cmd, void *opaque)
>      }
>  }
>  
> -/* [re-]enable all commands, except those explicitly blacklisted by user */
> -static void ga_enable_non_blacklisted(const QmpCommand *cmd, void *opaque)
> +/* [re-]enable all commands, except those explicitly blocklisted by user */
> +static void ga_enable_non_blocklisted(const QmpCommand *cmd, void *opaque)
>  {
> -    GList *blacklist = opaque;
> +    GList *blocklist = opaque;
>      const char *name = qmp_command_name(cmd);
>  
> -    if (g_list_find_custom(blacklist, name, ga_strcmp) == NULL &&
> +    if (g_list_find_custom(blocklist, name, ga_strcmp) == NULL &&
>          !qmp_command_is_enabled(cmd)) {
>          g_debug("enabling command: %s", name);
>          qmp_enable_command(&ga_commands, name);
> @@ -463,8 +463,8 @@ void ga_unset_frozen(GAState *s)
>          s->deferred_options.pid_filepath = NULL;
>      }
>  
> -    /* enable all disabled, non-blacklisted commands */
> -    qmp_for_each_command(&ga_commands, ga_enable_non_blacklisted, s->blacklist);
> +    /* enable all disabled, non-blocklisted commands */
> +    qmp_for_each_command(&ga_commands, ga_enable_non_blocklisted, s->blocklist);
>      s->frozen = false;
>      if (!ga_delete_file(s->state_filepath_isfrozen)) {
>          g_warning("unable to delete %s, fsfreeze may not function properly",
> @@ -894,7 +894,7 @@ int64_t ga_get_fd_handle(GAState *s, Error **errp)
>      int64_t handle;
>  
>      g_assert(s->pstate_filepath);
> -    /* we blacklist commands and avoid operations that potentially require
> +    /* we blocklist commands and avoid operations that potentially require
>       * writing to disk when we're in a frozen state. this includes opening
>       * new files, so we should never get here in that situation
>       */
> @@ -948,8 +948,8 @@ struct GAConfig {
>  #ifdef _WIN32
>      const char *service;
>  #endif
> -    gchar *bliststr; /* blacklist may point to this string */
> -    GList *blacklist;
> +    gchar *bliststr; /* blocklist may point to this string */
> +    GList *blocklist;
>      int daemonize;
>      GLogLevelFlags log_level;
>      int dumpconf;
> @@ -1007,10 +1007,16 @@ static void config_load(GAConfig *config)
>          config->retry_path =
>              g_key_file_get_boolean(keyfile, "general", "retry-path", &gerr);
>      }
> +    if (g_key_file_has_key(keyfile, "general", "blocklist", NULL)) {
> +        config->bliststr =
> +            g_key_file_get_string(keyfile, "general", "blocklist", &gerr);
> +        config->blocklist = g_list_concat(config->blocklist,
> +                                          split_list(config->bliststr, ","));
> +    }
>      if (g_key_file_has_key(keyfile, "general", "blacklist", NULL)) {
>          config->bliststr =
>              g_key_file_get_string(keyfile, "general", "blacklist", &gerr);
> -        config->blacklist = g_list_concat(config->blacklist,
> +        config->blocklist = g_list_concat(config->blocklist,
>                                            split_list(config->bliststr, ","));
>      }

This needs to print a deprecation warning.


We also need to update the QEMU deprecations documentation.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


