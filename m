Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B4C345F70
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:18:22 +0100 (CET)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgvM-0006N4-T8
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lOgsI-0005Cm-9x
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:15:10 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lOgsE-0007O7-Ki
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:15:09 -0400
Received: by mail-ej1-x62c.google.com with SMTP id b7so27039127ejv.1
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dIXgQma9Xq7B9Kpkzv6cgPms0i2jx7k91vgCPOusYqo=;
 b=DCfZp1o7xFDp9F/31TT6jesklY3xIaw4yQBN8YEsmMhKBa2jjeXPwQK1fx32inzwSq
 jU+zpJiMWzaY+JiTjukFLj2/f42p7EjEvb8ZOw8EXWWN9BP90JN7HKNysQPzzwQbVpoR
 I/0Q3iOTOiOoq6ocyxb2+Vq30L7z3DIJka7OHTpz+TTd9X/MVYau47qg2eMFzsRYR2vI
 5GqIRoi55DqrusHq39x1sOtR5QimfKwGZOAOjBOxtPby7zMRv5aAnd+ML4T6ae9BA0FP
 Oin3R48UY06dksxj46FjBj333dUuueaCJgPZdVJ5qhrJzjGOSpC2maGotkuZ113YuNL1
 cVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dIXgQma9Xq7B9Kpkzv6cgPms0i2jx7k91vgCPOusYqo=;
 b=C4onE30bQ5Am2n38v/GRbxaE/Uu8bnAP5TReDzCk2ERzHC+e9H7N6FdHXqwBSpIveK
 +br9RQIvDHf0rZphH68oBf6Uh+WWCNxrHP3zdwDcaeupnWGEB2cTE1UnYPwLlNtNDdKb
 CJZDSfdqA6yAkW67r/EM+tgk4TqMyNQvG8EsYiT4O/9xT/T6utBcQWdqQscffGcKFfd3
 0tQbqP4phkznacWZSgW0Az2a2oTMPOJNfZQYG2Oi3TlwdkxugzFE4hLhknJCzDgiJ6aN
 lNBqO2htC7GiuDMonszHaU+wsmrwKYliF/1x3ld0TAq2DJtT7aTGKrr/BXh0ZbZkRarR
 0wJQ==
X-Gm-Message-State: AOAM531TRRVfsixNwE4fnL1SVoTxscHq/BW1AYMiXIGA8FdonBrRbEPF
 bFTGnOlBUk/dTpBIRzcGSUyAGZJrsg0Lm4Zan8LJTQ==
X-Google-Smtp-Source: ABdhPJzNwNzmvmWTm1fKx8HH9ot/j2hxSTJ5AJ/sgdnHzcdHjary/97Rr8SqblTsGl/ZVpFXXsXJte96jzn77FHYj6o=
X-Received: by 2002:a17:906:7d82:: with SMTP id
 v2mr4913972ejo.524.1616505302841; 
 Tue, 23 Mar 2021 06:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
In-Reply-To: <20210315170636.704201-2-zhlcindy@gmail.com>
From: Li Zhang <li.zhang@ionos.com>
Date: Tue, 23 Mar 2021 14:14:52 +0100
Message-ID: <CAEM4iGG67hQDPVrKbSsSpsrpbc12+ky=ROh26QUqO5C0+q0jXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
To: Li Zhang <zhlcindy@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005a919f05be33f88e"
Received-SPF: permerror client-ip=2a00:1450:4864:20::62c;
 envelope-from=li.zhang@ionos.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Lukas Straub <lukasstraub2@web.de>, alexandr.iarygin@profitbricks.com,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Li Zhang <li.zhang@cloud.ionos.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005a919f05be33f88e
Content-Type: text/plain; charset="UTF-8"

Hi,

Any comments about this patch?

Thanks
Li

On Mon, Mar 15, 2021 at 6:07 PM Li Zhang <zhlcindy@gmail.com> wrote:

> From: Li Zhang <li.zhang@cloud.ionos.com>
>
> For some scenarios, it needs to hot-add a monitor device.
> But QEMU doesn't support hotplug yet. It also works by adding
> a monitor with null backend by default and then change its
> backend to socket by QMP command "chardev-change".
>
> So this patch is to support monitor chardev hotswap with QMP.
>
> Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> ---
>  monitor/monitor-internal.h |  3 +++
>  monitor/monitor.c          |  2 +-
>  monitor/qmp.c              | 42 +++++++++++++++++++++++++++++++++++---
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 40903d6386..2df6dd21de 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char
> *list);
>  void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
>                                   Error **errp);
>
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +                               void *opaque);
> +
>  #endif
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index e94f532cf5..2d255bab18 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -157,7 +157,7 @@ static inline bool
> monitor_is_hmp_non_interactive(const Monitor *mon)
>
>  static void monitor_flush_locked(Monitor *mon);
>
> -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
>                                    void *opaque)
>  {
>      Monitor *mon = opaque;
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 2326bd7f9b..55cfb230d9 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -44,6 +44,7 @@ struct QMPRequest {
>      Error *err;
>  };
>  typedef struct QMPRequest QMPRequest;
> +static void monitor_qmp_set_handlers_bh(void *opaque);
>
>  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
>
> @@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
>      g_queue_free(mon->qmp_requests);
>  }
>
> -static void monitor_qmp_setup_handlers_bh(void *opaque)
> +static int monitor_qmp_change(void *opaque)
> +{
> +    MonitorQMP *mon = opaque;
> +
> +    mon->common.use_io_thread =
> +        qemu_chr_has_feature(mon->common.chr.chr,
> QEMU_CHAR_FEATURE_GCONTEXT);
> +
> +    if (mon->common.use_io_thread) {
> +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
> +                                monitor_qmp_set_handlers_bh, mon);
> +    } else {
> +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> +                                 monitor_qmp_read, monitor_qmp_event,
> +                                 monitor_qmp_change, &mon->common, NULL,
> true);
> +    }
> +
> +    if (mon->common.out_watch) {
> +        g_source_remove(mon->common.out_watch);
> +        qemu_mutex_lock(&mon->common.mon_lock);
> +        mon->common.out_watch =
> +        qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
> +                               monitor_unblocked, &mon->common);
> +        qemu_mutex_unlock(&mon->common.mon_lock);
> +    }
> +
> +    return 0;
> +}
> +
> +static void monitor_qmp_set_handlers_bh(void *opaque)
>  {
>      MonitorQMP *mon = opaque;
>      GMainContext *context;
> @@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void
> *opaque)
>      assert(context);
>      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                               monitor_qmp_read, monitor_qmp_event,
> -                             NULL, &mon->common, context, true);
> +                             monitor_qmp_change, &mon->common, context,
> true);
> +
> +}
> +
> +static void monitor_qmp_setup_handlers_bh(void *opaque)
> +{
> +    MonitorQMP *mon = opaque;
> +    monitor_qmp_set_handlers_bh(mon);
>      monitor_list_append(&mon->common);
>  }
>
> @@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error
> **errp)
>      } else {
>          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
>                                   monitor_qmp_read, monitor_qmp_event,
> -                                 NULL, &mon->common, NULL, true);
> +                                 monitor_qmp_change, &mon->common, NULL,
> true);
>          monitor_list_append(&mon->common);
>      }
>  }
> --
> 2.25.1
>
>

--0000000000005a919f05be33f88e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div>Hi,=C2=A0</div><div><br></div><div>Any comments a=
bout this patch?=C2=A0</div><div><br></div><div>Thanks</div><div>Li</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Mar 15, 2021 at 6:07 PM Li Zhang &lt;<a href=3D"mailto:zhlcindy@gmail=
.com">zhlcindy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud=
.ionos.com" target=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
<br>
For some scenarios, it needs to hot-add a monitor device.<br>
But QEMU doesn&#39;t support hotplug yet. It also works by adding<br>
a monitor with null backend by default and then change its<br>
backend to socket by QMP command &quot;chardev-change&quot;.<br>
<br>
So this patch is to support monitor chardev hotswap with QMP.<br>
<br>
Signed-off-by: Li Zhang &lt;<a href=3D"mailto:li.zhang@cloud.ionos.com" tar=
get=3D"_blank">li.zhang@cloud.ionos.com</a>&gt;<br>
---<br>
=C2=A0monitor/monitor-internal.h |=C2=A0 3 +++<br>
=C2=A0monitor/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0monitor/qmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 42 ++=
+++++++++++++++++++++++++++++++++---<br>
=C2=A03 files changed, 43 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h<br>
index 40903d6386..2df6dd21de 100644<br>
--- a/monitor/monitor-internal.h<br>
+++ b/monitor/monitor-internal.h<br>
@@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char *list)=
;<br>
=C2=A0void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);<br>
<br>
+gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque);<br>
+<br>
=C2=A0#endif<br>
diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
index e94f532cf5..2d255bab18 100644<br>
--- a/monitor/monitor.c<br>
+++ b/monitor/monitor.c<br>
@@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(const=
 Monitor *mon)<br>
<br>
=C2=A0static void monitor_flush_locked(Monitor *mon);<br>
<br>
-static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,<br>
+gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Monitor *mon =3D opaque;<br>
diff --git a/monitor/qmp.c b/monitor/qmp.c<br>
index 2326bd7f9b..55cfb230d9 100644<br>
--- a/monitor/qmp.c<br>
+++ b/monitor/qmp.c<br>
@@ -44,6 +44,7 @@ struct QMPRequest {<br>
=C2=A0 =C2=A0 =C2=A0Error *err;<br>
=C2=A0};<br>
=C2=A0typedef struct QMPRequest QMPRequest;<br>
+static void monitor_qmp_set_handlers_bh(void *opaque);<br>
<br>
=C2=A0QmpCommandList qmp_commands, qmp_cap_negotiation_commands;<br>
<br>
@@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)<br>
=C2=A0 =C2=A0 =C2=A0g_queue_free(mon-&gt;qmp_requests);<br>
=C2=A0}<br>
<br>
-static void monitor_qmp_setup_handlers_bh(void *opaque)<br>
+static int monitor_qmp_change(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 MonitorQMP *mon =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 mon-&gt;common.use_io_thread =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_has_feature(mon-&gt;common.chr.chr, Q=
EMU_CHAR_FEATURE_GCONTEXT);<br>
+<br>
+=C2=A0 =C2=A0 if (mon-&gt;common.use_io_thread) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(iothread_get_aio_conte=
xt(mon_iothread),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_qmp_set_handlers_bh, mon);<b=
r>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_set_handlers(&amp;mon-&gt;common.c=
hr, monitor_can_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_read, monitor_qmp_=
event,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_change, &amp;mon-&=
gt;common, NULL, true);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (mon-&gt;common.out_watch) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_source_remove(mon-&gt;common.out_watch);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock(&amp;mon-&gt;common.mon_lock);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mon-&gt;common.out_watch =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_add_watch(&amp;mon-&gt;common.chr,=
 G_IO_OUT | G_IO_HUP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_unblocked, &amp;mon-&gt;commo=
n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock(&amp;mon-&gt;common.mon_lock=
);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void monitor_qmp_set_handlers_bh(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MonitorQMP *mon =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0GMainContext *context;<br>
@@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque=
)<br>
=C2=A0 =C2=A0 =C2=A0assert(context);<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_set_handlers(&amp;mon-&gt;common.chr, monit=
or_can_read,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_qmp_read, monitor_qmp_event,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &amp;mon-&gt;common, context, true);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_change, &amp;mon-&gt;common, con=
text, true);<br>
+<br>
+}<br>
+<br>
+static void monitor_qmp_setup_handlers_bh(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 MonitorQMP *mon =3D opaque;<br>
+=C2=A0 =C2=A0 monitor_qmp_set_handlers_bh(mon);<br>
=C2=A0 =C2=A0 =C2=A0monitor_list_append(&amp;mon-&gt;common);<br>
=C2=A0}<br>
<br>
@@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_fe_set_handlers(&amp;mon-&gt;com=
mon.chr, monitor_can_read,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_qmp_read, monitor_qmp=
_event,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &amp;mon-&gt;common, NUL=
L, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_qmp_change, &amp;mon-&=
gt;common, NULL, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_list_append(&amp;mon-&gt;common);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000005a919f05be33f88e--

