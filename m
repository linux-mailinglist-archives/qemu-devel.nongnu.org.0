Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FA4AFD40
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 20:23:27 +0100 (CET)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHsYm-0007da-Ek
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 14:23:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHrng-0002kD-HR
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:34:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHrnY-0002HP-CN
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644431660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rRlZJPOGpf/uRTclIiNx0CyitReB0wkJHUQ23IXbbG4=;
 b=Lt9BotYYpBaajqsskVXsoORuQI4PCveuvghlJPm/P1dcyxDu9kac8T37z2rg2SFPTlr3UE
 xM57b4cjZ6iYwjvLWFasiBCKmeV4R6qNW1lNiU/DQQoylsNpXMPFc+jsmn9g4qSNRec2E4
 B13qeQI/e1YeBNrWdXXOsebbZV0mLGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-d6bYRG0COGWBGUP1MaVibA-1; Wed, 09 Feb 2022 13:34:19 -0500
X-MC-Unique: d6bYRG0COGWBGUP1MaVibA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABEDA84DA43;
 Wed,  9 Feb 2022 18:34:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 775A57A40F;
 Wed,  9 Feb 2022 18:33:27 +0000 (UTC)
Date: Wed, 9 Feb 2022 18:33:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 2/3] qapi/ui: display-reload: add possibility to
 change listen address
Message-ID: <YgQI8dUX92WNCdX0@redhat.com>
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
 <20220118160909.2502374-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20220118160909.2502374-3-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: bleal@redhat.com, armbru@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, crosa@redhat.com,
 marcandre.lureau@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 05:09:08PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Add possibility to change addresses where VNC server listens for new
> connections. Prior to 6.0 this functionality was available through
> 'change' qmp command which was deleted.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/about/removed-features.rst |  3 ++-
>  qapi/ui.json                    |  6 +++++-
>  include/ui/console.h            |  2 +-
>  monitor/qmp-cmds.c              |  4 +---
>  ui/vnc.c                        | 37 ++++++++++++++++++++++++++-------
>  5 files changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 4c4da20d0f..b92626a74e 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -355,7 +355,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
>  ``change`` (removed in 6.0)
>  '''''''''''''''''''''''''''
>  
> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
> +``display-reload`` instead.
>  
>  ``query-events`` (removed in 6.0)
>  '''''''''''''''''''''''''''''''''
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..4c4448f378 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1293,12 +1293,16 @@
>  # Specify the VNC reload options.
>  #
>  # @tls-certs: reload tls certs or not.
> +# @addresses: If specified, change set of addresses
> +#             to listen for connections. Addresses configured
> +#             for websockets are not touched. (since 7.0)
>  #
>  # Since: 6.0
>  #
>  ##
>  { 'struct': 'DisplayReloadOptionsVNC',
> -  'data': { '*tls-certs': 'bool' } }
> +  'data': { '*tls-certs': 'bool',
> +            '*addresses': ['SocketAddress'] } }

So I'm having second thoughts on this, because I think we in fact need to
distinguish between reloads of state related to existing configuration
vs applying changes to the actual configuration.

For example,  when I think about the 'tls-certs' option here, it
lets us reload the existing TLS credentials from disk. ie it lets
the user re-write the TLS file content on disk and then tell QEMU
to reload the files.

An equally valuable option would be to tell QEMU to simply use a
completely different set of TLS files on disk, rather than re-writing
in place.  We don't have this feature now, but I think we should
anticipate it in the design.

So I'm going to suggest that instead of 'display-reload', we should
have a general purpose 'display-update' command for modifying existing
config and , leave 'display-reload' purely for re-loading state, not
changing config.

Essentially 'display-reload' is about re-starting QEMU displays
with the same config, while 'display-update' is about restarting
with a new config.

This shouldn't be too much work to achieve in your patch. Just
clone everything related to the 'display-reload' QMP command
boilerplate, replacing 'reload' with 'update' throughout and
discarding the 'tls-certs' bits leaving only your 'addresses'
bit.

We can use this 'display-update' command for making pasword
and auth config changes possible too later.

>  
>  ##
>  # @DisplayReloadOptions:
> diff --git a/include/ui/console.h b/include/ui/console.h
> index f590819880..b052027915 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -512,7 +512,7 @@ int vnc_display_password(const char *id, const char *password);
>  int vnc_display_pw_expire(const char *id, time_t expires);
>  void vnc_parse(const char *str);
>  int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
> -bool vnc_display_reload_certs(const char *id,  Error **errp);
> +bool vnc_display_reload(DisplayReloadOptionsVNC *arg, Error **errp);
>  
>  /* input.c */
>  int index_from_key(const char *key, size_t key_length);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 14e3beeaaf..ad45baa12b 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -356,9 +356,7 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
>      switch (arg->type) {
>      case DISPLAY_RELOAD_TYPE_VNC:
>  #ifdef CONFIG_VNC
> -        if (arg->u.vnc.has_tls_certs && arg->u.vnc.tls_certs) {
> -            vnc_display_reload_certs(NULL, errp);
> -        }
> +        vnc_display_reload(&arg->u.vnc, errp);
>  #else
>          error_setg(errp, "vnc is invalid, missing 'CONFIG_VNC'");
>  #endif
> diff --git a/ui/vnc.c b/ui/vnc.c
> index fa0fb736d3..a86bd6335e 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -587,16 +587,10 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
>      return prev;
>  }
>  
> -bool vnc_display_reload_certs(const char *id, Error **errp)
> +static bool vnc_display_reload_certs(VncDisplay *vd, Error **errp)
>  {
> -    VncDisplay *vd = vnc_display_find(id);
>      QCryptoTLSCredsClass *creds = NULL;
>  
> -    if (!vd) {
> -        error_setg(errp, "Can not find vnc display");
> -        return false;
> -    }
> -
>      if (!vd->tlscreds) {
>          error_setg(errp, "vnc tls is not enabled");
>          return false;
> @@ -3973,6 +3967,35 @@ static int vnc_display_listen(VncDisplay *vd,
>      return 0;
>  }
>  
> +bool vnc_display_reload(DisplayReloadOptionsVNC *arg, Error **errp)
> +{
> +    VncDisplay *vd = vnc_display_find(NULL);
> +
> +    if (!vd) {
> +        error_setg(errp, "Can not find vnc display");
> +        return false;
> +    }
> +
> +    if (arg->has_tls_certs && arg->tls_certs) {
> +        if (!vnc_display_reload_certs(vd, errp)) {
> +            return false;
> +        }
> +    }
> +
> +    if (arg->has_addresses) {
> +        if (vd->listener) {
> +            qio_net_listener_disconnect(vd->listener);
> +            object_unref(OBJECT(vd->listener));
> +            vd->listener = NULL;
> +        }
> +
> +        if (vnc_display_listen(vd, arg->addresses, NULL, errp) < 0) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
>  
>  void vnc_display_open(const char *id, Error **errp)
>  {
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


