Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2660D2E94D8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 13:29:27 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwOzG-0002UG-7C
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 07:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwOxn-00025M-PE
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:27:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwOxl-00017k-88
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609763272;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LF3p4OfJNcCTSp0efHyfWeshXnhrMmxD8N7N+TlRDQo=;
 b=B+KWFx5UcD0T1u7E+OWzCyDo2VgIqycFMpcn1s1gY6Fm39tAPxrxvAAENETWjUf0wN8Tnd
 jYe5WOh7MIdrm3fx3THcVZ7UMoPR6RJEzj/5uwDjHk5WpCgOPs4sNE9jqVhRgefEN30/lZ
 xSECsw/seyNovmAha6i0KHMmycTh014=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-6mkR-OWqOHaClabYPXS6IA-1; Mon, 04 Jan 2021 07:27:50 -0500
X-MC-Unique: 6mkR-OWqOHaClabYPXS6IA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD79B8100;
 Mon,  4 Jan 2021 12:27:49 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.ams2.redhat.com [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D3660BE5;
 Mon,  4 Jan 2021 12:27:43 +0000 (UTC)
Date: Mon, 4 Jan 2021 12:27:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH] vnc: add qmp to support reload vnc tls certificates
Message-ID: <20210104122740.GI640208@redhat.com>
References: <20210104071128.754-1-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210104071128.754-1-changzihao1@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: oscar.zhangbo@huawei.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 04, 2021 at 03:11:28PM +0800, Zihao Chang wrote:
> QEMU loads vnc tls certificates only when vm is started. This patch
> provides a new qmp command to reload vnc tls certificates without
> restart vnc-server/VM.
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  include/ui/console.h |  1 +
>  monitor/qmp-cmds.c   |  7 +++++++
>  qapi/ui.json         | 17 +++++++++++++++++
>  ui/vnc.c             | 20 ++++++++++++++++++++
>  4 files changed, 45 insertions(+)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 5dd21976a3..f05140b662 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -441,6 +441,7 @@ int vnc_display_password(const char *id, const char *password);
>  int vnc_display_pw_expire(const char *id, time_t expires);
>  QemuOpts *vnc_parse(const char *str, Error **errp);
>  int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
> +int vnc_display_reload_cert(const char *id,  Error **errp);
>  
>  /* input.c */
>  int index_from_key(const char *key, size_t key_length);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 34f7e75b7b..90bd08c8ed 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -287,6 +287,13 @@ static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
>          qmp_change_vnc_listen(target, errp);
>      }
>  }
> +
> +void qmp_reload_vnc_cert(Error **errp)
> +{
> +    if (vnc_display_reload_cert(NULL, errp) < 0) {
> +        error_setg(errp, "Reload vnc tls cert failed");

This error message is entirely useless at helping diagnose what
failed. We need to propagate real error messages from the root
cause.

> +    }
> +}
>  #endif /* !CONFIG_VNC */
>  
>  void qmp_change(const char *device, const char *target,
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d08d72b439..bc3ffdb20f 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1179,3 +1179,20 @@
>  ##
>  { 'command': 'query-display-options',
>    'returns': 'DisplayOptions' }
> +
> +##
> +# @reload-vnc-cert:
> +#
> +# Reload certificates for vnc.
> +#
> +# Returns: nothing
> +#
> +# Since: 5.2
> +#
> +# Example:
> +#
> +# -> { "execute": "reload-vnc-cert" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'reload-vnc-cert' }
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 7452ac7df2..b0cfbcf47c 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -582,6 +582,26 @@ VncInfo2List *qmp_query_vnc_servers(Error **errp)
>      return prev;
>  }
>  
> +int vnc_display_reload_cert(const char *id, Error **errp)
> +{
> +    VncDisplay *vd = vnc_display_find(id);
> +
> +    if (!vd) {
> +        return -EINVAL;
> +    }
> +
> +    if (!vd->tlscreds) {
> +        error_printf_unless_qmp("If you want use vnc tls  please enable "
> +                                "vnc tls using '-vnc tls-creds=${tls-obj-id}'.\n");
> +        return -EPERM;

You're passing in a 'Error' object, so use that and don't retyrn errnos

> +    }
> +
> +    object_property_set_bool(OBJECT(vd->tlscreds), "loaded", false, NULL);
> +    object_property_set_bool(OBJECT(vd->tlscreds), "loaded", true, NULL);

This is ignoring all errors which is not at all acceptable. It means on
failure to load the new certs, we're left with a broken creds object
which callers will not expect.

We need to be able to do this in a safe way such that we carry on using
the original TLS certs if loading the new ones fails. This can't be done
using the 'loaded' property- we need an explicit API to reload things.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


