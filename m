Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31B407E2D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:55:35 +0200 (CEST)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRpO-0007f9-5X
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mPRoP-0006zA-QN
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:54:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mPRoN-0001Dc-Md
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:54:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id x6so10634383wrv.13
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXJU/7L3vfSIaB/lfYYNPcveC05wsn0MSX89N6qr3rY=;
 b=Egw4+ytuCjr4WkPIAgeXoPK4pShVDg9TTbGgjL+XcH+GONciiCNc3NQM9yPx/KB+/p
 DCiJWLPJXpY7LM+NseJ7Kf4iRwF3euB0UxF/DSm3x3LF9hVuC/ORfPrR2oPWzICZvtEa
 eDK/rl9i2gl9Q7yT4xrqVD8BVHNC6Y48a+DZhGLj6wYrwEQJmvWXqjvkLLl1+3R1IUtY
 gDFDhIGJg0VCmVGmPofiF1Pys9aqUx7eA01qpdMbFhattl6TT2vVE3CJMrm1tyY8xpu/
 OmKv4YsTi+zg0q+tQIgp+O03a5Ic5AIs0Y324+tWMo+potBjByXa+HS+jBMNsVN2sfjA
 FcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXJU/7L3vfSIaB/lfYYNPcveC05wsn0MSX89N6qr3rY=;
 b=EEwkk1w6qPW3C/q1FRALqR3pmFFi9DyQDBtv1FVI1yVBp0Od44RLzR5bCGAsAQDj6W
 FaxPoF5J7fKHUfYxo/ZI7pyZMnK7ChobN6u2x8kKBP5HIlfglhJmb10wayrQaoJFAToy
 gAUckcyLvxyJwRff2sKbQaOr4c1uCTg0Kx0Vv5UuPB+bfxkVcZWYu7fkLBMbemuaBEO+
 V0ZW5pinVspZAYKFZ1xcrIHxRJlHmBTNRVVPyvFBSOaqhjMycZmGNBiME5hMPG41d9bO
 yMwb0VO73eboFYkXkddNwOgM26w6aepAcONMvRKnUi/49sA//R6zA9SypvIqthvBVWsi
 zJbQ==
X-Gm-Message-State: AOAM533TNUFB2f0ZzeR8ugANBBl65ib8bsl5FDnLUenHfeg8V0PrmbAv
 w1IKyiaEPTbIPOU9SkU36u4Udj2giND/i82FLmY=
X-Google-Smtp-Source: ABdhPJx2CTi72n1UyItbrUHlbkvq16FZ/jbweg5hw1tmKBgdPp0B4LvxtfJwIv5cbn9mFm9KmXuQSg6dnuXurpABRns=
X-Received: by 2002:adf:e806:: with SMTP id o6mr7890332wrm.239.1631462069289; 
 Sun, 12 Sep 2021 08:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
 <20210912125203.7114-1-vr_qemu@t-online.de>
In-Reply-To: <20210912125203.7114-1-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 12 Sep 2021 19:54:17 +0400
Message-ID: <CAJ+F1CKn+vRiUwrRF9ngSRZH865u5MCRK8jLSu0gpQQkaDDkag@mail.gmail.com>
Subject: Re: [PATCH 1/3] ui/console: replace QEMUFIFO with Fifo8
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: multipart/alternative; boundary="0000000000001ac8a805cbce5d80"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
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

--0000000000001ac8a805cbce5d80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Sep 12, 2021 at 4:53 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:

> One of the two FIFO implementations QEMUFIFO and Fifo8 is
> redundant. Replace QEMUFIFO with Fifo8.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
>  ui/console.c | 86 ++++++++++++----------------------------------------
>  1 file changed, 20 insertions(+), 66 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index eabbbc951c..e6ce29024c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -27,6 +27,7 @@
>  #include "hw/qdev-core.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-ui.h"
> +#include "qemu/fifo8.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
>  #include "qemu/timer.h"
> @@ -62,57 +63,6 @@ enum TTYState {
>      TTY_STATE_CSI,
>  };
>
> -typedef struct QEMUFIFO {
> -    uint8_t *buf;
> -    int buf_size;
> -    int count, wptr, rptr;
> -} QEMUFIFO;
> -
> -static int qemu_fifo_write(QEMUFIFO *f, const uint8_t *buf, int len1)
> -{
> -    int l, len;
> -
> -    l =3D f->buf_size - f->count;
> -    if (len1 > l)
> -        len1 =3D l;
> -    len =3D len1;
> -    while (len > 0) {
> -        l =3D f->buf_size - f->wptr;
> -        if (l > len)
> -            l =3D len;
> -        memcpy(f->buf + f->wptr, buf, l);
> -        f->wptr +=3D l;
> -        if (f->wptr >=3D f->buf_size)
> -            f->wptr =3D 0;
> -        buf +=3D l;
> -        len -=3D l;
> -    }
> -    f->count +=3D len1;
> -    return len1;
> -}
> -
> -static int qemu_fifo_read(QEMUFIFO *f, uint8_t *buf, int len1)
> -{
> -    int l, len;
> -
> -    if (len1 > f->count)
> -        len1 =3D f->count;
> -    len =3D len1;
> -    while (len > 0) {
> -        l =3D f->buf_size - f->rptr;
> -        if (l > len)
> -            l =3D len;
> -        memcpy(buf, f->buf + f->rptr, l);
> -        f->rptr +=3D l;
> -        if (f->rptr >=3D f->buf_size)
> -            f->rptr =3D 0;
> -        buf +=3D l;
> -        len -=3D l;
> -    }
> -    f->count -=3D len1;
> -    return len1;
> -}
> -
>  typedef enum {
>      GRAPHIC_CONSOLE,
>      TEXT_CONSOLE,
> @@ -165,8 +115,7 @@ struct QemuConsole {
>
>      Chardev *chr;
>      /* fifo for key pressed */
> -    QEMUFIFO out_fifo;
> -    uint8_t out_fifo_buf[16];
> +    Fifo8 out_fifo;
>      QEMUTimer *kbd_timer;
>      CoQueue dump_queue;
>
> @@ -1160,21 +1109,25 @@ static int vc_chr_write(Chardev *chr, const
> uint8_t *buf, int len)
>  static void kbd_send_chars(void *opaque)
>  {
>      QemuConsole *s =3D opaque;
> -    int len;
> -    uint8_t buf[16];
> +    uint32_t len, avail;
>
>      len =3D qemu_chr_be_can_write(s->chr);
> -    if (len > s->out_fifo.count)
> -        len =3D s->out_fifo.count;
> -    if (len > 0) {
> -        if (len > sizeof(buf))
> -            len =3D sizeof(buf);
> -        qemu_fifo_read(&s->out_fifo, buf, len);
> -        qemu_chr_be_write(s->chr, buf, len);
> +    avail =3D fifo8_num_used(&s->out_fifo);
> +    if (len > avail) {
> +        len =3D avail;
> +    }
> +    while (len > 0) {
> +        const uint8_t *buf;
> +        uint32_t size;
> +
> +        buf =3D fifo8_pop_buf(&s->out_fifo, len, &size);
> +        qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
> +        len -=3D size;
> +        avail -=3D size;
>      }
>      /* characters are pending: we send them a bit later (XXX:
>         horrible, should change char device API) */
> -    if (s->out_fifo.count > 0) {
> +    if (avail > 0) {
>          timer_mod(s->kbd_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) +
> 1);
>      }
>  }
> @@ -1185,6 +1138,7 @@ void kbd_put_keysym_console(QemuConsole *s, int
> keysym)
>      uint8_t buf[16], *q;
>      CharBackend *be;
>      int c;
> +    uint32_t free;
>

Better call it num_free, to avoid symbol clash (even if we don't use free()
directly), it helps reading and can prevent mistakes.


>      if (!s || (s->console_type =3D=3D GRAPHIC_CONSOLE))
>          return;
> @@ -1228,7 +1182,8 @@ void kbd_put_keysym_console(QemuConsole *s, int
> keysym)
>          }
>          be =3D s->chr->be;
>          if (be && be->chr_read) {
> -            qemu_fifo_write(&s->out_fifo, buf, q - buf);
> +            free =3D fifo8_num_free(&s->out_fifo);
> +            fifo8_push_all(&s->out_fifo, buf, MIN(free, q - buf));
>              kbd_send_chars(s);
>          }
>          break;
> @@ -2233,8 +2188,7 @@ static void text_console_do_init(Chardev *chr,
> DisplayState *ds)
>      int g_width =3D 80 * FONT_WIDTH;
>      int g_height =3D 24 * FONT_HEIGHT;
>
> -    s->out_fifo.buf =3D s->out_fifo_buf;
> -    s->out_fifo.buf_size =3D sizeof(s->out_fifo_buf);
> +    fifo8_create(&s->out_fifo, 16);
>

Missing a fif8_destroy() somewhere

     s->kbd_timer =3D timer_new_ms(QEMU_CLOCK_REALTIME, kbd_send_chars, s);
>      s->ds =3D ds;
>
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001ac8a805cbce5d80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Sep 12, 2021 at 4:53 PM Volker R=C3=
=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-online.de</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">One =
of the two FIFO implementations QEMUFIFO and Fifo8 is<br>
redundant. Replace QEMUFIFO with Fifo8.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
---<br>
=C2=A0ui/console.c | 86 ++++++++++++---------------------------------------=
-<br>
=C2=A01 file changed, 20 insertions(+), 66 deletions(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index eabbbc951c..e6ce29024c 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;hw/qdev-core.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<br>
+#include &quot;qemu/fifo8.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
@@ -62,57 +63,6 @@ enum TTYState {<br>
=C2=A0 =C2=A0 =C2=A0TTY_STATE_CSI,<br>
=C2=A0};<br>
<br>
-typedef struct QEMUFIFO {<br>
-=C2=A0 =C2=A0 uint8_t *buf;<br>
-=C2=A0 =C2=A0 int buf_size;<br>
-=C2=A0 =C2=A0 int count, wptr, rptr;<br>
-} QEMUFIFO;<br>
-<br>
-static int qemu_fifo_write(QEMUFIFO *f, const uint8_t *buf, int len1)<br>
-{<br>
-=C2=A0 =C2=A0 int l, len;<br>
-<br>
-=C2=A0 =C2=A0 l =3D f-&gt;buf_size - f-&gt;count;<br>
-=C2=A0 =C2=A0 if (len1 &gt; l)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len1 =3D l;<br>
-=C2=A0 =C2=A0 len =3D len1;<br>
-=C2=A0 =C2=A0 while (len &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D f-&gt;buf_size - f-&gt;wptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &gt; len)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(f-&gt;buf + f-&gt;wptr, buf, l);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;wptr +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f-&gt;wptr &gt;=3D f-&gt;buf_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;wptr =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D l;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 f-&gt;count +=3D len1;<br>
-=C2=A0 =C2=A0 return len1;<br>
-}<br>
-<br>
-static int qemu_fifo_read(QEMUFIFO *f, uint8_t *buf, int len1)<br>
-{<br>
-=C2=A0 =C2=A0 int l, len;<br>
-<br>
-=C2=A0 =C2=A0 if (len1 &gt; f-&gt;count)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len1 =3D f-&gt;count;<br>
-=C2=A0 =C2=A0 len =3D len1;<br>
-=C2=A0 =C2=A0 while (len &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D f-&gt;buf_size - f-&gt;rptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &gt; len)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(buf, f-&gt;buf + f-&gt;rptr, l);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;rptr +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f-&gt;rptr &gt;=3D f-&gt;buf_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f-&gt;rptr =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D l;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D l;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 f-&gt;count -=3D len1;<br>
-=C2=A0 =C2=A0 return len1;<br>
-}<br>
-<br>
=C2=A0typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0GRAPHIC_CONSOLE,<br>
=C2=A0 =C2=A0 =C2=A0TEXT_CONSOLE,<br>
@@ -165,8 +115,7 @@ struct QemuConsole {<br>
<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr;<br>
=C2=A0 =C2=A0 =C2=A0/* fifo for key pressed */<br>
-=C2=A0 =C2=A0 QEMUFIFO out_fifo;<br>
-=C2=A0 =C2=A0 uint8_t out_fifo_buf[16];<br>
+=C2=A0 =C2=A0 Fifo8 out_fifo;<br>
=C2=A0 =C2=A0 =C2=A0QEMUTimer *kbd_timer;<br>
=C2=A0 =C2=A0 =C2=A0CoQueue dump_queue;<br>
<br>
@@ -1160,21 +1109,25 @@ static int vc_chr_write(Chardev *chr, const uint8_t=
 *buf, int len)<br>
=C2=A0static void kbd_send_chars(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QemuConsole *s =3D opaque;<br>
-=C2=A0 =C2=A0 int len;<br>
-=C2=A0 =C2=A0 uint8_t buf[16];<br>
+=C2=A0 =C2=A0 uint32_t len, avail;<br>
<br>
=C2=A0 =C2=A0 =C2=A0len =3D qemu_chr_be_can_write(s-&gt;chr);<br>
-=C2=A0 =C2=A0 if (len &gt; s-&gt;out_fifo.count)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D s-&gt;out_fifo.count;<br>
-=C2=A0 =C2=A0 if (len &gt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; sizeof(buf))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D sizeof(buf);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fifo_read(&amp;s-&gt;out_fifo, buf, len);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(s-&gt;chr, buf, len);<br>
+=C2=A0 =C2=A0 avail =3D fifo8_num_used(&amp;s-&gt;out_fifo);<br>
+=C2=A0 =C2=A0 if (len &gt; avail) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D avail;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 while (len &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D fifo8_pop_buf(&amp;s-&gt;out_fifo, len=
, &amp;size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(s-&gt;chr, (uint8_t *)buf, s=
ize);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 avail -=3D size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0/* characters are pending: we send them a bit later (XX=
X:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 horrible, should change char device API) */<br>
-=C2=A0 =C2=A0 if (s-&gt;out_fifo.count &gt; 0) {<br>
+=C2=A0 =C2=A0 if (avail &gt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_mod(s-&gt;kbd_timer, qemu_clock_get=
_ms(QEMU_CLOCK_REALTIME) + 1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
@@ -1185,6 +1138,7 @@ void kbd_put_keysym_console(QemuConsole *s, int keysy=
m)<br>
=C2=A0 =C2=A0 =C2=A0uint8_t buf[16], *q;<br>
=C2=A0 =C2=A0 =C2=A0CharBackend *be;<br>
=C2=A0 =C2=A0 =C2=A0int c;<br>
+=C2=A0 =C2=A0 uint32_t free;<br></blockquote><div><br></div><div>Better ca=
ll it num_free, to avoid symbol clash (even if we don&#39;t use free() dire=
ctly), it helps reading and can prevent mistakes.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0if (!s || (s-&gt;console_type =3D=3D GRAPHIC_CONSOLE))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -1228,7 +1182,8 @@ void kbd_put_keysym_console(QemuConsole *s, int keysy=
m)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be =3D s-&gt;chr-&gt;be;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (be &amp;&amp; be-&gt;chr_read) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fifo_write(&amp;s-&gt;out_f=
ifo, buf, q - buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free =3D fifo8_num_free(&amp;s-&=
gt;out_fifo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&amp;s-&gt;out_fi=
fo, buf, MIN(free, q - buf));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kbd_send_chars(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -2233,8 +2188,7 @@ static void text_console_do_init(Chardev *chr, Displa=
yState *ds)<br>
=C2=A0 =C2=A0 =C2=A0int g_width =3D 80 * FONT_WIDTH;<br>
=C2=A0 =C2=A0 =C2=A0int g_height =3D 24 * FONT_HEIGHT;<br>
<br>
-=C2=A0 =C2=A0 s-&gt;out_fifo.buf =3D s-&gt;out_fifo_buf;<br>
-=C2=A0 =C2=A0 s-&gt;out_fifo.buf_size =3D sizeof(s-&gt;out_fifo_buf);<br>
+=C2=A0 =C2=A0 fifo8_create(&amp;s-&gt;out_fifo, 16);<br></blockquote><div>=
<br></div><div>Missing a fif8_destroy() somewhere</div><div> <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0s-&gt;kbd_timer =3D timer_new_ms(QEMU_CLOCK_REALTIME, k=
bd_send_chars, s);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;ds =3D ds;<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001ac8a805cbce5d80--

