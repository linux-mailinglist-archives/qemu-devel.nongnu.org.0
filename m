Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB8407E6C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:09:25 +0200 (CEST)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPS2m-0002sc-T7
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mPRsx-0003Ok-N3
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:59:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mPRsv-0004V8-Fv
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:59:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id 140so1420330wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BrVz6A+eMto/teio3G1ySns+rRKJDOhP2Xeg9UYvBR8=;
 b=UFz+iUmGg4cNyTXioEXWN5qmNEa1W9KxZiTxhHTk0FsrZqeDoIPBwSNYsVBXDVSEvq
 9BLak6er9qdnOu3odg11OUCaz5kc/Zty63S0CzkZm6/KILei9bOfUM5g2M5pF/ibTT5t
 rsTiIGKjtxrAhlyl2kDPc0QCJQNeGpZWwqxSjQs9kDAubwb35JlHVRYpQbDurKxtynOH
 Gvxf4mMDNuhOzAJCLt7RBd7Udpwtp5iAz8kNmIA2bpTeo3BLnvvKqZKrJ5BuJUUcje5S
 HtBaucNLEhwDo9Yk22njhWddc3iKmZy3Mmx2KVMK0q7OJW4aB7Mq3sf26EzJPgzItaUk
 JcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BrVz6A+eMto/teio3G1ySns+rRKJDOhP2Xeg9UYvBR8=;
 b=45m9I9NgkVL5sUAt+4+Abrk9gHPoqW/ba81xk2sqUsUwk8CgOhQVffinN5Wpr1Mi3E
 P9G1IGCZGT1MntpyKUqjW9s4Mr+nuVo0X6ufRIFAuK7w+xyElIc/W/cc/URN7EyFvtm+
 I00RlHeAnruB9RU7IeGhug6GpRSGfqM6oQKYgwgi37Jm6KbMR5DbxGPKHuSrIq+nI0WZ
 AQevT0vifAk9Oiwtw0lJszxGAa+j7Mjzy0NkkjFStopMtQHp6maQF80Ewk41kL66bJDs
 8CcFb/L6piLqcMOII1dGX/boPI6twoB2nvFKfGpEkrLp4mY9iRuL7TdYt1AxtJYd+PjY
 g0Gw==
X-Gm-Message-State: AOAM531CN2vAA3BV0rd1XIdQt7GVVdHyewMZdVqQHM+0XZRtZ1hDdQdX
 +FUpb+jo/vo/V2MRtbNhCqUa0ULjx+beoEtzT1sBniA6c+k=
X-Google-Smtp-Source: ABdhPJzs5jgBuzfgA221pTljNHVscnd9VfCnMOHXNkKsvnhUlD7Q1k+f2qkhCIpJ678JbIFaUip8nGWPAV/lPe0fqio=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr7330584wmh.140.1631462351270; 
 Sun, 12 Sep 2021 08:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
 <20210912125203.7114-2-vr_qemu@t-online.de>
In-Reply-To: <20210912125203.7114-2-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 12 Sep 2021 19:59:00 +0400
Message-ID: <CAJ+F1C+C7UKcK392agAYpSP4xBsWkoC0FavkFQv+tYTZ5vo88A@mail.gmail.com>
Subject: Re: [PATCH 2/3] ui/console: replace kbd_timer with chr_accept_input
 callback
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: multipart/alternative; boundary="000000000000e9765205cbce6d3f"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9765205cbce6d3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 5:03 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:

> There's a ChardevClass chr_accept_input() callback function that
> can replace the write retry timer.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/console.c | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index e6ce29024c..7b276bfc6c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -116,7 +116,6 @@ struct QemuConsole {
>      Chardev *chr;
>      /* fifo for key pressed */
>      Fifo8 out_fifo;
> -    QEMUTimer *kbd_timer;
>      CoQueue dump_queue;
>
>      QTAILQ_ENTRY(QemuConsole) next;
> @@ -1106,30 +1105,21 @@ static int vc_chr_write(Chardev *chr, const
> uint8_t *buf, int len)
>      return len;
>  }
>
> -static void kbd_send_chars(void *opaque)
> +static void kbd_send_chars(QemuConsole *s)
>  {
> -    QemuConsole *s =3D opaque;
>      uint32_t len, avail;
>
>      len =3D qemu_chr_be_can_write(s->chr);
>      avail =3D fifo8_num_used(&s->out_fifo);
> -    if (len > avail) {
> -        len =3D avail;
> -    }
> -    while (len > 0) {
> +    while (len > 0 && avail > 0) {
>          const uint8_t *buf;
>          uint32_t size;
>
> -        buf =3D fifo8_pop_buf(&s->out_fifo, len, &size);
> +        buf =3D fifo8_pop_buf(&s->out_fifo, MIN(len, avail), &size);
>          qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
> -        len -=3D size;
> +        len =3D qemu_chr_be_can_write(s->chr);
>          avail -=3D size;
>      }
> -    /* characters are pending: we send them a bit later (XXX:
> -       horrible, should change char device API) */
> -    if (avail > 0) {
> -        timer_mod(s->kbd_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) +
> 1);
> -    }
>  }
>
>  /* called when an ascii key is pressed */
> @@ -2141,6 +2131,14 @@ int qemu_console_get_height(QemuConsole *con, int
> fallback)
>      return con ? surface_height(con->surface) : fallback;
>  }
>
> +static void vc_chr_accept_input(Chardev *chr)
> +{
> +    VCChardev *drv =3D VC_CHARDEV(chr);
> +    QemuConsole *s =3D drv->console;
> +
> +    kbd_send_chars(s);
> +}
> +
>  static void vc_chr_set_echo(Chardev *chr, bool echo)
>  {
>      VCChardev *drv =3D VC_CHARDEV(chr);
> @@ -2189,7 +2187,6 @@ static void text_console_do_init(Chardev *chr,
> DisplayState *ds)
>      int g_height =3D 24 * FONT_HEIGHT;
>
>      fifo8_create(&s->out_fifo, 16);
> -    s->kbd_timer =3D timer_new_ms(QEMU_CLOCK_REALTIME, kbd_send_chars, s=
);
>      s->ds =3D ds;
>
>      s->y_displayed =3D 0;
> @@ -2439,6 +2436,7 @@ static void char_vc_class_init(ObjectClass *oc, voi=
d
> *data)
>      cc->parse =3D qemu_chr_parse_vc;
>      cc->open =3D vc_chr_open;
>      cc->chr_write =3D vc_chr_write;
> +    cc->chr_accept_input =3D vc_chr_accept_input;
>      cc->chr_set_echo =3D vc_chr_set_echo;
>  }
>
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e9765205cbce6d3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 12, 2021 at 5:03 PM Volke=
r R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-online.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">There&#39;s a ChardevClass chr_accept_input() callback function that<br>
can replace the write retry timer.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/console.c | 28 +++++++++++++---------------<br>
=C2=A01 file changed, 13 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index e6ce29024c..7b276bfc6c 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -116,7 +116,6 @@ struct QemuConsole {<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr;<br>
=C2=A0 =C2=A0 =C2=A0/* fifo for key pressed */<br>
=C2=A0 =C2=A0 =C2=A0Fifo8 out_fifo;<br>
-=C2=A0 =C2=A0 QEMUTimer *kbd_timer;<br>
=C2=A0 =C2=A0 =C2=A0CoQueue dump_queue;<br>
<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_ENTRY(QemuConsole) next;<br>
@@ -1106,30 +1105,21 @@ static int vc_chr_write(Chardev *chr, const uint8_t=
 *buf, int len)<br>
=C2=A0 =C2=A0 =C2=A0return len;<br>
=C2=A0}<br>
<br>
-static void kbd_send_chars(void *opaque)<br>
+static void kbd_send_chars(QemuConsole *s)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 QemuConsole *s =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t len, avail;<br>
<br>
=C2=A0 =C2=A0 =C2=A0len =3D qemu_chr_be_can_write(s-&gt;chr);<br>
=C2=A0 =C2=A0 =C2=A0avail =3D fifo8_num_used(&amp;s-&gt;out_fifo);<br>
-=C2=A0 =C2=A0 if (len &gt; avail) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 while (len &gt; 0) {<br>
+=C2=A0 =C2=A0 while (len &gt; 0 &amp;&amp; avail &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t *buf;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t size;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D fifo8_pop_buf(&amp;s-&gt;out_fifo, len=
, &amp;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D fifo8_pop_buf(&amp;s-&gt;out_fifo, MIN=
(len, avail), &amp;size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_be_write(s-&gt;chr, (uint8_t *)b=
uf, size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qemu_chr_be_can_write(s-&gt;chr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avail -=3D size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 /* characters are pending: we send them a bit later (XXX:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0horrible, should change char device API) */<br>
-=C2=A0 =C2=A0 if (avail &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;kbd_timer, qemu_clock_get_ms(Q=
EMU_CLOCK_REALTIME) + 1);<br>
-=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0/* called when an ascii key is pressed */<br>
@@ -2141,6 +2131,14 @@ int qemu_console_get_height(QemuConsole *con, int fa=
llback)<br>
=C2=A0 =C2=A0 =C2=A0return con ? surface_height(con-&gt;surface) : fallback=
;<br>
=C2=A0}<br>
<br>
+static void vc_chr_accept_input(Chardev *chr)<br>
+{<br>
+=C2=A0 =C2=A0 VCChardev *drv =3D VC_CHARDEV(chr);<br>
+=C2=A0 =C2=A0 QemuConsole *s =3D drv-&gt;console;<br>
+<br>
+=C2=A0 =C2=A0 kbd_send_chars(s);<br>
+}<br>
+<br>
=C2=A0static void vc_chr_set_echo(Chardev *chr, bool echo)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VCChardev *drv =3D VC_CHARDEV(chr);<br>
@@ -2189,7 +2187,6 @@ static void text_console_do_init(Chardev *chr, Displa=
yState *ds)<br>
=C2=A0 =C2=A0 =C2=A0int g_height =3D 24 * FONT_HEIGHT;<br>
<br>
=C2=A0 =C2=A0 =C2=A0fifo8_create(&amp;s-&gt;out_fifo, 16);<br>
-=C2=A0 =C2=A0 s-&gt;kbd_timer =3D timer_new_ms(QEMU_CLOCK_REALTIME, kbd_se=
nd_chars, s);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;ds =3D ds;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;y_displayed =3D 0;<br>
@@ -2439,6 +2436,7 @@ static void char_vc_class_init(ObjectClass *oc, void =
*data)<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;parse =3D qemu_chr_parse_vc;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;open =3D vc_chr_open;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_write =3D vc_chr_write;<br>
+=C2=A0 =C2=A0 cc-&gt;chr_accept_input =3D vc_chr_accept_input;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_set_echo =3D vc_chr_set_echo;<br>
=C2=A0}<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e9765205cbce6d3f--

