Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3D407EA3
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:35:09 +0200 (CEST)
Received: from localhost ([::1]:51774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSRg-00078C-T3
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mPSQq-0006Ny-Rs
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:34:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mPSQo-0002Jl-JX
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:34:16 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so2346914wmd.5
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7KDel/6fT/zxuhAhVK/hxhN9hb9xsLrcwEt69rhso04=;
 b=p7FvOH715o7RBmYx6Mg8jtsALeRd6PCo7Iewm+b7CTbMXxL3DttPFQLAKsQv4lZJ2Y
 bhYj6G+xIBi8MyjdMUM3M0gRCFfjkpMfW5qqfZxeKiUjvRkoM79EkVsg1rqSGVR5xea6
 OrHRRTTRnlCCFFhmBL4XZtocriWiZdML15apHCaSdMzZtTIyGEwF2OAPKxwGo9ir3kBE
 wpLW5yY+bCSzSz0TprrKZbXg2glj4wAkfv5vtAglawRAvlb8lu3oDv8/pRkpr2w7P2nT
 qiGDYj3N/japuMD5NEierdLCp/tdFEMM+CB8wU41/F7JwG1tbFbyPPsVt33pGlfysmh6
 WCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7KDel/6fT/zxuhAhVK/hxhN9hb9xsLrcwEt69rhso04=;
 b=vskHoxc9du8lLUn1bDbUssIXlibDPw9OlIjGSJaXAu7dtTY41GgeoUUm9B2JLSGrlF
 zAoG73C2ZfgSeIFMk2/3zKv3qqdYdj7RSXxj8PuQmSqMGiKlKoBIgb6jSzK1Pv93Q8ET
 UbKWcHQccg+HvbnRZO3M8XYkfipzhOqERnAlGI9R64VVcOjC8fWySeX1U5Xt7d+PbTfk
 30mI9p0lRSwBlIz+X296Laki6lLqPwThGeiOlcIRzg+PtJzxwozi8It4TcUJ8zNX3+8n
 zsqEIyDh7BQDY9oF+6gQTq9oGFl8iElLNJNr+j1ST3ske2AT5oipF+lJWFKpIGGvCk0T
 kVjw==
X-Gm-Message-State: AOAM531uOeWqYSys9LC5iq2HitunDA6dhfiFMv6ksfpx9RlB2bzd4Viv
 e270pPjJ4qGihRoO3692vIopypiOgvulRJdyycI=
X-Google-Smtp-Source: ABdhPJwR3wZRdSwtPqu8LmJJ5xxbty89Hq3LirUh7G50rM0vrjfwdOOS9iKQQxr2eQcQifRALflOgOu0zHeXwVYKs8A=
X-Received: by 2002:a1c:a713:: with SMTP id q19mr7340354wme.42.1631464452207; 
 Sun, 12 Sep 2021 09:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
 <20210912125203.7114-3-vr_qemu@t-online.de>
In-Reply-To: <20210912125203.7114-3-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 12 Sep 2021 20:34:00 +0400
Message-ID: <CAJ+F1C+44=SHr3aaKW-zHfdRKOzYfC3e+Hsbm=C0Z2T8fUoH6g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ui/console: remove chardev frontend connected test
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Content-Type: multipart/alternative; boundary="000000000000233b5205cbceebd1"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32e.google.com
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

--000000000000233b5205cbceebd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 4:53 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:

> The test if the chardev frontend is connected in
> kbd_put_keysym_console() is redundant, because the call
> to qemu_chr_be_can_write() in kbd_send_chars() tests
> the connected condition again.
>
> Remove the redundant test whether the chardev frontend
> is connected.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/console.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index 7b276bfc6c..a06442ed86 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -28,10 +28,11 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qemu/fifo8.h"
> +#include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
>  #include "qemu/timer.h"
> -#include "chardev/char-fe.h"
> +#include "chardev/char.h"
>  #include "trace.h"
>  #include "exec/memory.h"
>  #include "io/channel-file.h"
> @@ -1126,7 +1127,6 @@ static void kbd_send_chars(QemuConsole *s)
>  void kbd_put_keysym_console(QemuConsole *s, int keysym)
>  {
>      uint8_t buf[16], *q;
> -    CharBackend *be;
>      int c;
>      uint32_t free;
>
> @@ -1170,12 +1170,9 @@ void kbd_put_keysym_console(QemuConsole *s, int
> keysym)
>          if (s->echo) {
>              vc_chr_write(s->chr, buf, q - buf);
>          }
> -        be =3D s->chr->be;
> -        if (be && be->chr_read) {
> -            free =3D fifo8_num_free(&s->out_fifo);
> -            fifo8_push_all(&s->out_fifo, buf, MIN(free, q - buf));
> -            kbd_send_chars(s);
> -        }
> +        free =3D fifo8_num_free(&s->out_fifo);
> +        fifo8_push_all(&s->out_fifo, buf, MIN(free, q - buf));
> +        kbd_send_chars(s);
>          break;
>      }
>  }
> --
> 2.31.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000233b5205cbceebd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 12, 2021 at 4:53 PM Volke=
r R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-online.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">The test if the chardev frontend is connected in<br>
kbd_put_keysym_console() is redundant, because the call<br>
to qemu_chr_be_can_write() in kbd_send_chars() tests<br>
the connected condition again.<br>
<br>
Remove the redundant test whether the chardev frontend<br>
is connected.<br>
<br>
Signed-off-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.d=
e" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/console.c | 13 +++++--------<br>
=C2=A01 file changed, 5 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/ui/console.c b/ui/console.c<br>
index 7b276bfc6c..a06442ed86 100644<br>
--- a/ui/console.c<br>
+++ b/ui/console.c<br>
@@ -28,10 +28,11 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-commands-ui.h&quot;<br>
=C2=A0#include &quot;qemu/fifo8.h&quot;<br>
+#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
-#include &quot;chardev/char-fe.h&quot;<br>
+#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;exec/memory.h&quot;<br>
=C2=A0#include &quot;io/channel-file.h&quot;<br>
@@ -1126,7 +1127,6 @@ static void kbd_send_chars(QemuConsole *s)<br>
=C2=A0void kbd_put_keysym_console(QemuConsole *s, int keysym)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint8_t buf[16], *q;<br>
-=C2=A0 =C2=A0 CharBackend *be;<br>
=C2=A0 =C2=A0 =C2=A0int c;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t free;<br>
<br>
@@ -1170,12 +1170,9 @@ void kbd_put_keysym_console(QemuConsole *s, int keys=
ym)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;echo) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vc_chr_write(s-&gt;chr, buf=
, q - buf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 be =3D s-&gt;chr-&gt;be;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (be &amp;&amp; be-&gt;chr_read) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free =3D fifo8_num_free(&amp;s-&=
gt;out_fifo);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&amp;s-&gt;out_fi=
fo, buf, MIN(free, q - buf));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kbd_send_chars(s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free =3D fifo8_num_free(&amp;s-&gt;out_fifo);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&amp;s-&gt;out_fifo, buf, MIN(f=
ree, q - buf));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kbd_send_chars(s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000233b5205cbceebd1--

