Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2923E436F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:58:50 +0200 (CEST)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD23V-0007GR-HX
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mD22F-0006Ax-Be
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:57:31 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mD22D-0007qD-GA
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:57:31 -0400
Received: by mail-ej1-x62e.google.com with SMTP id e19so27873485ejs.9
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72WerdWZNa+99lMAoqubOl7GTZ+47RQWKbtQDbIb2Jg=;
 b=Eg4pTBjJYIDm3DCukZ9oe0gncUrpprEGL5LZ4dGbEcbSWEaIkb4sgdeasWaatzl87b
 Qd5L96yikW/btqC1+Nz1kR36PTp4R2p1Ey8r+cClPnzaa42/jRpXBZ1f2oRFmiZAlRRe
 MfIiQnJmLKQXR84V1PpdX1MCmschY8d1YUk5Mt9IaOBtj8bVRc3TT8pF58TF/WKbe/mg
 gUOIm216vhhqL8lwzh97VaB7bYRKByrMk25IhuYMzkcSKPgdMwpVgfLL8+i0Flvq6wuS
 h1GzHCs/pbL9MAbLmJQTN57W9Td6s2pLysKFCPwhcQyT0sWo3D/ppfBLwfRWWvPhZGih
 NIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72WerdWZNa+99lMAoqubOl7GTZ+47RQWKbtQDbIb2Jg=;
 b=Rh8HJwEy3sjh1oaWLZyNVNmHtk1Q92KH/wAsAh6HOb+1HTNOoBn2fhZmZLDdw/eUDm
 3Mryh4WuEzPqUT4T2yjqqIqGjUlJ7ULIuVWMnV9FWO2PUIYveWImq/2vjs2MXKeWXoXI
 7/BQiTn33rn/atgyIRuFO+gQdOw2UNAGTRrf9mZLoWuDpDqXYNPczZznENdgprAH6EoK
 JLvbO1XaHufXElFHtB9tyrUTu0XSQmlEr03PGZ91yjMLxLojVZcOMePnygwpyKqP0M/A
 vq7zm1bp6cLrB2dK5tdThfoqLeIkHKEC3fhP19VvFfhWWF5suFmp8rtJ0uTpZ+r6qzzD
 kz0w==
X-Gm-Message-State: AOAM532Cc35UCtxaFu2Cq4HOHoI74mKR0O236hcfO7WNGfSUq7Jv+Vw5
 HJfF1vOyY+fSquZzCAVzzKsLCuA4/2b+qOihjSI=
X-Google-Smtp-Source: ABdhPJzfZncGs0rcE/ul/l5Vsb5ow8FEvxMI/UFPXaVGdHj4PpWHfLmRSRbNoiVPu0XiaDQ9055NvXjqQefFgMdU+eI=
X-Received: by 2002:a17:906:7d0:: with SMTP id
 m16mr5289449ejc.105.1628503047556; 
 Mon, 09 Aug 2021 02:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <70e3486e-b486-887b-4d57-44a3fd9766ad@t-online.de>
 <20210807192910.26283-1-vr_qemu@t-online.de>
In-Reply-To: <20210807192910.26283-1-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 9 Aug 2021 13:57:16 +0400
Message-ID: <CAJ+F1C+xz_R6gPV6NH0QfsoNLC2hndF8d0FvLqXmL6FJFq9v5g@mail.gmail.com>
Subject: Re: [PATCH] monitor/hmp: schedule qemu_chr_fe_accept_input() after
 read
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: multipart/alternative; boundary="000000000000aa54ca05c91d69b6"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aa54ca05c91d69b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker

On Sat, Aug 7, 2021 at 11:32 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:

> Since commit 584af1f1d9 (ui/gtk: add a keyboard fifo to the VTE
> consoles) a GTK VTE console chardev backend relies on the
> connected chardev frontend to call qemu_chr_fe_accept_input()
> whenever it can receive new characters. The HMP monitor doesn't
> do this. It only schedules a call to qemu_chr_fe_accept_input()
> after it handled a HMP command in monitor_command_cb().
>
> This is a problem if you paste a few characters into the GTK
> monitor console. Even entering a UTF-8 multibyte character leads
> to the same problem.
>
> Schedule a call to qemu_chr_fe_accept_input() after handling the
> received bytes to fix the HMP monitor.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Wouldn't it work to make gd_vc_send_chars() write in a loop (until it
fails)?

If not, I think monitor/qmp.c should be adjusted too.

---
>  monitor/hmp.c              |  1 +
>  monitor/monitor-internal.h |  1 +
>  monitor/monitor.c          | 19 +++++++++++++++++--
>  3 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index d50c3124e1..470f56a71d 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1349,6 +1349,7 @@ static void monitor_read(void *opaque, const uint8_=
t
> *buf, int size)
>          for (i =3D 0; i < size; i++) {
>              readline_handle_byte(mon->rs, buf[i]);
>          }
> +        monitor_accept_input(&mon->common);
>      } else {
>          if (size =3D=3D 0 || buf[size - 1] !=3D 0) {
>              monitor_printf(&mon->common, "corrupted command\n");
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 9c3a09cb01..af33c3c617 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -170,6 +170,7 @@ int monitor_puts(Monitor *mon, const char *str);
>  void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
>                         bool use_io_thread);
>  void monitor_data_destroy(Monitor *mon);
> +void monitor_accept_input(Monitor *mon);
>  int monitor_can_read(void *opaque);
>  void monitor_list_append(Monitor *mon);
>  void monitor_fdsets_cleanup(void);
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 46a171bca6..8e3cf4ad98 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -519,13 +519,28 @@ int monitor_suspend(Monitor *mon)
>      return 0;
>  }
>
> -static void monitor_accept_input(void *opaque)
> +static void monitor_accept_input_bh(void *opaque)
>  {
>      Monitor *mon =3D opaque;
>
>      qemu_chr_fe_accept_input(&mon->chr);
>  }
>
> +void monitor_accept_input(Monitor *mon)
> +{
> +    if (!qatomic_mb_read(&mon->suspend_cnt)) {
> +        AioContext *ctx;
> +
> +        if (mon->use_io_thread) {
> +            ctx =3D iothread_get_aio_context(mon_iothread);
> +        } else {
> +            ctx =3D qemu_get_aio_context();
> +        }
> +
> +        aio_bh_schedule_oneshot(ctx, monitor_accept_input_bh, mon);
> +    }
> +}
> +
>  void monitor_resume(Monitor *mon)
>  {
>      if (monitor_is_hmp_non_interactive(mon)) {
> @@ -547,7 +562,7 @@ void monitor_resume(Monitor *mon)
>              readline_show_prompt(hmp_mon->rs);
>          }
>
> -        aio_bh_schedule_oneshot(ctx, monitor_accept_input, mon);
> +        aio_bh_schedule_oneshot(ctx, monitor_accept_input_bh, mon);
>      }
>
>      trace_monitor_suspend(mon, -1);
> --
> 2.26.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000aa54ca05c91d69b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Volker<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 7, 2021 at 11:32=
 PM Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@=
t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Since commit 584af1f1d9 (ui/gtk: add a keyboard fifo to the VTE<=
br>
consoles) a GTK VTE console chardev backend relies on the<br>
connected chardev frontend to call qemu_chr_fe_accept_input()<br>
whenever it can receive new characters. The HMP monitor doesn&#39;t<br>
do this. It only schedules a call to qemu_chr_fe_accept_input()<br>
after it handled a HMP command in monitor_command_cb().<br>
<br>
This is a problem if you paste a few characters into the GTK<br>
monitor console. Even entering a UTF-8 multibyte character leads<br>
to the same problem.<br>
<br>
Schedule a call to qemu_chr_fe_accept_input() after handling the<br>
received bytes to fix the HMP monitor.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Wouldn&#39;t it work to make gd_vc_send_chars() write in a loop (=
until it fails)?</div><div><br></div><div>If not, I think monitor/qmp.c sho=
uld be adjusted too.<br></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
---<br>
=C2=A0monitor/hmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 +<br>
=C2=A0monitor/monitor-internal.h |=C2=A0 1 +<br>
=C2=A0monitor/monitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 ++++++++++++=
+++++--<br>
=C2=A03 files changed, 19 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/monitor/hmp.c b/monitor/hmp.c<br>
index d50c3124e1..470f56a71d 100644<br>
--- a/monitor/hmp.c<br>
+++ b/monitor/hmp.c<br>
@@ -1349,6 +1349,7 @@ static void monitor_read(void *opaque, const uint8_t =
*buf, int size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; size; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readline_handle_byte(mon-&g=
t;rs, buf[i]);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 monitor_accept_input(&amp;mon-&gt;common);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0 || buf[size - 1] !=3D 0=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0monitor_printf(&amp;mon-&gt=
;common, &quot;corrupted command\n&quot;);<br>
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h<br>
index 9c3a09cb01..af33c3c617 100644<br>
--- a/monitor/monitor-internal.h<br>
+++ b/monitor/monitor-internal.h<br>
@@ -170,6 +170,7 @@ int monitor_puts(Monitor *mon, const char *str);<br>
=C2=A0void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bool use_io_thread);<br>
=C2=A0void monitor_data_destroy(Monitor *mon);<br>
+void monitor_accept_input(Monitor *mon);<br>
=C2=A0int monitor_can_read(void *opaque);<br>
=C2=A0void monitor_list_append(Monitor *mon);<br>
=C2=A0void monitor_fdsets_cleanup(void);<br>
diff --git a/monitor/monitor.c b/monitor/monitor.c<br>
index 46a171bca6..8e3cf4ad98 100644<br>
--- a/monitor/monitor.c<br>
+++ b/monitor/monitor.c<br>
@@ -519,13 +519,28 @@ int monitor_suspend(Monitor *mon)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-static void monitor_accept_input(void *opaque)<br>
+static void monitor_accept_input_bh(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Monitor *mon =3D opaque;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_fe_accept_input(&amp;mon-&gt;chr);<br>
=C2=A0}<br>
<br>
+void monitor_accept_input(Monitor *mon)<br>
+{<br>
+=C2=A0 =C2=A0 if (!qatomic_mb_read(&amp;mon-&gt;suspend_cnt)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AioContext *ctx;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mon-&gt;use_io_thread) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx =3D iothread_get_aio_context=
(mon_iothread);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx =3D qemu_get_aio_context();<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(ctx, monitor_accept_in=
put_bh, mon);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0void monitor_resume(Monitor *mon)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (monitor_is_hmp_non_interactive(mon)) {<br>
@@ -547,7 +562,7 @@ void monitor_resume(Monitor *mon)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readline_show_prompt(hmp_mo=
n-&gt;rs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(ctx, monitor_accept_in=
put, mon);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 aio_bh_schedule_oneshot(ctx, monitor_accept_in=
put_bh, mon);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_monitor_suspend(mon, -1);<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aa54ca05c91d69b6--

