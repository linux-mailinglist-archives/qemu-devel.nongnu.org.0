Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F22ED42F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:22:56 +0100 (CET)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxY3q-0000QF-PH
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxXzs-0007PD-DE
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:18:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kxXzo-0005Oi-K1
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610036322;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=54eAzJpJtJNf0KyZM05TdOBAuJwcQI8FLFYWCbKb7F0=;
 b=DeUPIa2b7ZO/1iXwG45emmnXZDj2tcYwUFzxogTf7Ue/ebDT1KCJWjiihvMiOxrsgyGFBK
 xl/MTMGDNKVKGkjvGBJRkRPUAWD23S2enG7/fMhlbWNeR6qVvQKxlJg5OKADz02eNFx7Y3
 5OPFiUDkhRT89E91wbXTU/Vg8QIBlmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-UyaySwBOM4K2YVQFCMEh2g-1; Thu, 07 Jan 2021 11:18:40 -0500
X-MC-Unique: UyaySwBOM4K2YVQFCMEh2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 335258049CF;
 Thu,  7 Jan 2021 16:18:39 +0000 (UTC)
Received: from redhat.com (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0917360CC3;
 Thu,  7 Jan 2021 16:18:33 +0000 (UTC)
Date: Thu, 7 Jan 2021 16:18:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH] vnc: add qmp to support change authz
Message-ID: <20210107161830.GE1029501@redhat.com>
References: <20210107124657.650-1-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210107124657.650-1-changzihao1@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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

On Thu, Jan 07, 2021 at 08:46:57PM +0800, Zihao Chang wrote:
> This patch add a new qmp 'change-vnc-authz' to support change the
> tls/sasl authz of vm. If index='', unset tlsauthzid/sasl.authzid
> {
>    "execute":"change-vnc-authz",
>    "arguments":{
>       "index":"object-authz-id",
>       "type":"tls/sasl"
>    }
> }

I'm not a fan of adding adhoc new commands for specific properties.

It feels like that is just repeating the design mistakes we made
for years with the CLI where we added countless -set-this-feature-too
args.  We realized this mistake and now have the general purpose
"-display" arg.

If we want to support changing properties on the fly in QMP, then
I think we should do a general purpose "display_update" QMP
command, to replace the existing 'set_pasword', 'expire_password',
'change-vnc-password' commands, and also enable this authz change.

It can also enable changing the TLS credentials object, and the
authentication scheme, and be extensible to any number of other
VNC properties we might like to make configurable in the future.
Similarly it would then be extensible for SPICE and other graphics
backends.

> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  include/ui/console.h |  3 +++
>  monitor/qmp-cmds.c   | 10 ++++++++++
>  qapi/ui.json         | 16 ++++++++++++++++
>  ui/vnc.c             | 32 ++++++++++++++++++++++++++++++++
>  4 files changed, 61 insertions(+)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 5dd21976a3..6b85546105 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -441,6 +441,9 @@ int vnc_display_password(const char *id, const char *password);
>  int vnc_display_pw_expire(const char *id, time_t expires);
>  QemuOpts *vnc_parse(const char *str, Error **errp);
>  int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
> +#ifdef CONFIG_VNC_SASL
> +int vnc_change_authz(const char *id, const char *type, const char *index);
> +#endif
>  
>  /* input.c */
>  int index_from_key(const char *key, size_t key_length);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 34f7e75b7b..085aeb9bec 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -289,6 +289,16 @@ static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
>  }
>  #endif /* !CONFIG_VNC */
>  
> +#ifdef CONFIG_VNC_SASL
> +void qmp_change_vnc_authz(const char *type, const char *index, Error **errp)
> +{
> +    if (vnc_change_authz(NULL, type, index) < 0) {
> +        error_setg(errp, "Could not set authz, type:%s, index:%s",
> +                   type, index);
> +    }
> +}
> +#endif
> +
>  void qmp_change(const char *device, const char *target,
>                  bool has_arg, const char *arg, Error **errp)
>  {
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d08d72b439..37ddeabbd2 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1179,3 +1179,19 @@
>  ##
>  { 'command': 'query-display-options',
>    'returns': 'DisplayOptions' }
> +
> +##
> +# @change-vnc-authz:
> +#
> +# Change the VNC server authz.
> +#
> +# @type:  the new authz type to use with VNC authentication
> +# @index:  the new authz object index to use with VNC authentication
> +#
> +# Since: 5.2
> +#
> +##
> +{ 'command': 'change-vnc-authz',
> +  'data': { 'type' : 'str',
> +            'index': 'str'},
> +  'if': 'defined(CONFIG_VNC_SASL)' }
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 7452ac7df2..f0809290a8 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3276,6 +3276,38 @@ int vnc_display_password(const char *id, const char *password)
>      return 0;
>  }
>  
> +#ifdef CONFIG_VNC_SASL
> +int vnc_change_authz(const char *id, const char *type, const char *index)
> +{
> +    VncDisplay *vd = vnc_display_find(id);
> +
> +    if (!vd) {
> +        return -EINVAL;
> +    }
> +
> +    if (strcmp(type, "sasl") == 0) {
> +        g_free(vd->sasl.authzid);
> +        vd->sasl.authzid = NULL;
> +
> +        if (strcmp(index, "") != 0) {
> +            vd->sasl.authzid = g_strdup(index);
> +        }
> +    } else if (strcmp(type, "tls") == 0) {
> +        g_free(vd->tlsauthzid);
> +        vd->tlsauthzid = NULL;
> +
> +        if (strcmp(index, "") != 0) {
> +            vd->tlsauthzid = g_strdup(index);
> +        }
> +    } else {
> +        error_printf_unless_qmp("unsupport authz type: %s", type);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    return 0;
> +}
> +#endif
> +
>  int vnc_display_pw_expire(const char *id, time_t expires)
>  {
>      VncDisplay *vd = vnc_display_find(id);
> -- 
> 2.23.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


