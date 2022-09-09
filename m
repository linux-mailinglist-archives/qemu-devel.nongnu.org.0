Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340D75B38D5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 15:22:53 +0200 (CEST)
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWdy4-0002YB-9w
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 09:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWdtl-0007IQ-IX; Fri, 09 Sep 2022 09:18:23 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:39790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWdth-0006iU-Og; Fri, 09 Sep 2022 09:18:20 -0400
Received: by mail-lf1-x134.google.com with SMTP id f11so2623324lfa.6;
 Fri, 09 Sep 2022 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zmFAWkhzgn71o5qFRr2ieA3evO1hJvGjVRgV+3iNyto=;
 b=qUYJSXDNHOxAa6Ok94VktlmrhIQj4y2d0Vrshe28f1QgUPpVJ7Rj7jCULzvSkXNs+a
 0+VeW+axJCCVDCf88IUxV2vcLrs5oqtL7wsUoNOfoDPHQGzgA2/ncqzMJS57cOtYYRle
 DPIasUbAmWgyAVZ3fMVYQrnMsmghOdNUjPn33z8XE8F4NrjS49J2iYWKzQY3pbZ4ai/R
 60YLOcNoW+G6PDxpnM5ypElTc2+8qr6wWQh3nqUX37Q3Kquy4OM2Ojzt1bp566eoiw0+
 MnNdpfZ7jA453IybM+5P4XB6x3o9zi1P292zoArqJNNm/oX14wnn22Swf5EnzSolVIEg
 FEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zmFAWkhzgn71o5qFRr2ieA3evO1hJvGjVRgV+3iNyto=;
 b=B/9D/mlV9zyYWNCtZ4aPRymbBtu2wEyrxpi5riZ+50DjNJ91u1wNNgwvRNktnBo+2Q
 ZiaaXKELNW/DR1arqsZdBxx/+Ow5faZFmi/DzymaQsfPYB+RbZ/hvM7NfSNj3s/oeutd
 syu9WyWKcBWJp2pv+awGE575OuOX/y4Xc/LMJk8nRajrTshSjbuOezoiaNY7w339Qn34
 00ZIxVrn+WgD9wV0edfGvILCZRzbUkuxge8UK+bF5JYTniuuUzofxvTvreyw4/cdzFud
 5LDrw2r1z7cdjuFu2m2VGXbt05ECjksmIVNoR5jYLgVugGayWO7G9yq3vfXjLbUzog/g
 7NlA==
X-Gm-Message-State: ACgBeo2/QHTi+x/tAzizIyLM3YItvsx9x0d9igZe9T1y4hQIlOnxhdW+
 Z1X1uP+crmn3+VduWy9L4WiKAgntsXTCwX8dLb8=
X-Google-Smtp-Source: AA6agR5grzXx+LCG4JbYPSihaLm06GfWx6FlpciujDDt6XZ7o/fkW/nBuhWMZxm3dD6bDJXirTIkfnOfuCqj8bmd2Nw=
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr825978lfb.167.1662729495795; Fri, 09
 Sep 2022 06:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-4-arwed.meyer@gmx.de>
In-Reply-To: <20220908173120.16779-4-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 9 Sep 2022 17:18:04 +0400
Message-ID: <CAJ+F1CLRrh94VU5XDDVHeHGy+1cxZ5WD8rr_1wi5D2ygVoWKdQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] msmouse: Use fifo8 instead of array
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f45f4f05e83e60af"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000f45f4f05e83e60af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 8, 2022 at 9:38 PM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Make use of fifo8 functions instead of implementing own fifo code.
> This makes the code more readable and reduces risk of bugs.
>
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  chardev/msmouse.c | 43 +++++++++++++++++++++----------------------
>  1 file changed, 21 insertions(+), 22 deletions(-)
>
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index 95fa488339..e9aa3eab55 100644
> --- a/chardev/msmouse.c
> +++ b/chardev/msmouse.c
> @@ -24,6 +24,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
> +#include "qemu/fifo8.h"
>  #include "chardev/char.h"
>  #include "chardev/char-serial.h"
>  #include "ui/console.h"
> @@ -34,6 +35,12 @@
>  #define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
>  #define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))
>
> +/* Serial fifo size. */
> +#define MSMOUSE_BUF_SZ 64
>

Why bump to 64 bytes?


> +
> +/* Mouse ID: Send "M3" cause we behave like a 3 button logitech mouse. *=
/
> +const uint8_t mouse_id[] =3D {'M', '3'};
> +
>  struct MouseChardev {
>      Chardev parent;
>
> @@ -42,8 +49,7 @@ struct MouseChardev {
>      int axis[INPUT_AXIS__MAX];
>      bool btns[INPUT_BUTTON__MAX];
>      bool btnc[INPUT_BUTTON__MAX];
> -    uint8_t outbuf[32];
> -    int outlen;
> +    Fifo8 outbuf;
>  };
>  typedef struct MouseChardev MouseChardev;
>
> @@ -54,21 +60,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
>  static void msmouse_chr_accept_input(Chardev *chr)
>  {
>      MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
> -    int len;
> +    uint32_t len_out, len;
>
> -    len =3D qemu_chr_be_can_write(chr);
> -    if (len > mouse->outlen) {
> -        len =3D mouse->outlen;
> -    }
> -    if (!len) {
> +    len_out =3D qemu_chr_be_can_write(chr);
> +    if (!len_out || fifo8_is_empty(&mouse->outbuf)) {
>          return;
>      }
> -
> -    qemu_chr_be_write(chr, mouse->outbuf, len);
> -    mouse->outlen -=3D len;
> -    if (mouse->outlen) {
> -        memmove(mouse->outbuf, mouse->outbuf + len, mouse->outlen);
> -    }
> +    len =3D MIN(fifo8_num_used(&mouse->outbuf), len_out);
> +    qemu_chr_be_write(chr, fifo8_pop_buf(&mouse->outbuf, len, &len_out),
> +            len_out);
>  }
>
>  static void msmouse_queue_event(MouseChardev *mouse)
> @@ -94,12 +94,11 @@ static void msmouse_queue_event(MouseChardev *mouse)
>          mouse->btnc[INPUT_BUTTON_MIDDLE]) {
>          bytes[3] |=3D (mouse->btns[INPUT_BUTTON_MIDDLE] ? 0x20 : 0x00);
>          mouse->btnc[INPUT_BUTTON_MIDDLE] =3D false;
> -        count =3D 4;
> +        count++;
>

a bit superfluous,  ok

     }
>
> -    if (mouse->outlen <=3D sizeof(mouse->outbuf) - count) {
> -        memcpy(mouse->outbuf + mouse->outlen, bytes, count);
> -        mouse->outlen +=3D count;
> +    if (fifo8_num_free(&mouse->outbuf) >=3D count) {
> +        fifo8_push_all(&mouse->outbuf, bytes, count);
>      } else {
>          /* queue full -> drop event */
>      }
> @@ -172,9 +171,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void
> *arg)
>                   * cause we behave like a 3 button logitech
>                   * mouse.
>                   */
> -                mouse->outbuf[0] =3D 'M';
> -                mouse->outbuf[1] =3D '3';
> -                mouse->outlen =3D 2;
> +                fifo8_push_all(&mouse->outbuf, mouse_id,
> sizeof(mouse_id));
>                  /* Start sending data to serial. */
>                  msmouse_chr_accept_input(chr);
>              }
> @@ -184,7 +181,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void
> *arg)
>           * Reset mouse buffers on power down.
>           * Mouse won't send anything without power.
>           */
> -        mouse->outlen =3D 0;
> +        fifo8_reset(&mouse->outbuf);
>          memset(mouse->axis, 0, sizeof(mouse->axis));
>          memset(mouse->btns, false, sizeof(mouse->btns));
>          memset(mouse->btnc, false, sizeof(mouse->btns));
> @@ -204,6 +201,7 @@ static void char_msmouse_finalize(Object *obj)
>      MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
>
>      qemu_input_handler_unregister(mouse->hs);
> +    fifo8_destroy(&mouse->outbuf);
>  }
>
>  static QemuInputHandler msmouse_handler =3D {
> @@ -224,6 +222,7 @@ static void msmouse_chr_open(Chardev *chr,
>      mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
>                                              &msmouse_handler);
>      mouse->tiocm =3D 0;
> +    fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
>  }
>
>  static void char_msmouse_class_init(ObjectClass *oc, void *data)
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f45f4f05e83e60af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 9:38 PM Arwe=
d Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de">arwed.meyer@gmx.de</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Make us=
e of fifo8 functions instead of implementing own fifo code.<br>
This makes the code more readable and reduces risk of bugs.<br>
<br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br></blockquote><div>=C2=A0</div><di=
v><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/msmouse.c | 43 +++++++++++++++++++++----------------------<br=
>
=C2=A01 file changed, 21 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/chardev/msmouse.c b/chardev/msmouse.c<br>
index 95fa488339..e9aa3eab55 100644<br>
--- a/chardev/msmouse.c<br>
+++ b/chardev/msmouse.c<br>
@@ -24,6 +24,7 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
+#include &quot;qemu/fifo8.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;chardev/char-serial.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
@@ -34,6 +35,12 @@<br>
=C2=A0#define MSMOUSE_HI2(n)=C2=A0 (((n) &amp; 0xc0) &gt;&gt; 6)<br>
=C2=A0#define MSMOUSE_PWR(cm) (cm &amp; (CHR_TIOCM_RTS | CHR_TIOCM_DTR))<br=
>
<br>
+/* Serial fifo size. */<br>
+#define MSMOUSE_BUF_SZ 64<br></blockquote><div><br></div><div>Why bump to =
64 bytes?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
+/* Mouse ID: Send &quot;M3&quot; cause we behave like a 3 button logitech =
mouse. */<br>
+const uint8_t mouse_id[] =3D {&#39;M&#39;, &#39;3&#39;};<br>
+<br>
=C2=A0struct MouseChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
<br>
@@ -42,8 +49,7 @@ struct MouseChardev {<br>
=C2=A0 =C2=A0 =C2=A0int axis[INPUT_AXIS__MAX];<br>
=C2=A0 =C2=A0 =C2=A0bool btns[INPUT_BUTTON__MAX];<br>
=C2=A0 =C2=A0 =C2=A0bool btnc[INPUT_BUTTON__MAX];<br>
-=C2=A0 =C2=A0 uint8_t outbuf[32];<br>
-=C2=A0 =C2=A0 int outlen;<br>
+=C2=A0 =C2=A0 Fifo8 outbuf;<br>
=C2=A0};<br>
=C2=A0typedef struct MouseChardev MouseChardev;<br>
<br>
@@ -54,21 +60,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,<b=
r>
=C2=A0static void msmouse_chr_accept_input(Chardev *chr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(chr);<br>
-=C2=A0 =C2=A0 int len;<br>
+=C2=A0 =C2=A0 uint32_t len_out, len;<br>
<br>
-=C2=A0 =C2=A0 len =3D qemu_chr_be_can_write(chr);<br>
-=C2=A0 =C2=A0 if (len &gt; mouse-&gt;outlen) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D mouse-&gt;outlen;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (!len) {<br>
+=C2=A0 =C2=A0 len_out =3D qemu_chr_be_can_write(chr);<br>
+=C2=A0 =C2=A0 if (!len_out || fifo8_is_empty(&amp;mouse-&gt;outbuf)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 qemu_chr_be_write(chr, mouse-&gt;outbuf, len);<br>
-=C2=A0 =C2=A0 mouse-&gt;outlen -=3D len;<br>
-=C2=A0 =C2=A0 if (mouse-&gt;outlen) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmove(mouse-&gt;outbuf, mouse-&gt;outbuf + l=
en, mouse-&gt;outlen);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 len =3D MIN(fifo8_num_used(&amp;mouse-&gt;outbuf), len_out);=
<br>
+=C2=A0 =C2=A0 qemu_chr_be_write(chr, fifo8_pop_buf(&amp;mouse-&gt;outbuf, =
len, &amp;len_out),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len_out);<br>
=C2=A0}<br>
<br>
=C2=A0static void msmouse_queue_event(MouseChardev *mouse)<br>
@@ -94,12 +94,11 @@ static void msmouse_queue_event(MouseChardev *mouse)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse-&gt;btnc[INPUT_BUTTON_MIDDLE]) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes[3] |=3D (mouse-&gt;btns[INPUT_BUTTO=
N_MIDDLE] ? 0x20 : 0x00);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse-&gt;btnc[INPUT_BUTTON_MIDDLE] =3D f=
alse;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 count++;<br></blockquote><div><br></div><div>a=
 bit superfluous,=C2=A0 ok</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (mouse-&gt;outlen &lt;=3D sizeof(mouse-&gt;outbuf) - coun=
t) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(mouse-&gt;outbuf + mouse-&gt;outlen, by=
tes, count);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outlen +=3D count;<br>
+=C2=A0 =C2=A0 if (fifo8_num_free(&amp;mouse-&gt;outbuf) &gt;=3D count) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&amp;mouse-&gt;outbuf, bytes, c=
ount);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* queue full -&gt; drop event */<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -172,9 +171,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *a=
rg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * cause we b=
ehave like a 3 button logitech<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * mouse.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outbuf[0=
] =3D &#39;M&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outbuf[1=
] =3D &#39;3&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outlen =
=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&am=
p;mouse-&gt;outbuf, mouse_id, sizeof(mouse_id));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Start send=
ing data to serial. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msmouse_chr_a=
ccept_input(chr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -184,7 +181,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *a=
rg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Reset mouse buffers on power down.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Mouse won&#39;t send anything without =
power.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outlen =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_reset(&amp;mouse-&gt;outbuf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(mouse-&gt;axis, 0, sizeof(mouse-&g=
t;axis));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(mouse-&gt;btns, false, sizeof(mous=
e-&gt;btns));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(mouse-&gt;btnc, false, sizeof(mous=
e-&gt;btns));<br>
@@ -204,6 +201,7 @@ static void char_msmouse_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_input_handler_unregister(mouse-&gt;hs);<br>
+=C2=A0 =C2=A0 fifo8_destroy(&amp;mouse-&gt;outbuf);<br>
=C2=A0}<br>
<br>
=C2=A0static QemuInputHandler msmouse_handler =3D {<br>
@@ -224,6 +222,7 @@ static void msmouse_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0mouse-&gt;hs =3D qemu_input_handler_register((DeviceSta=
te *)mouse,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;msmouse_handler);<br>
=C2=A0 =C2=A0 =C2=A0mouse-&gt;tiocm =3D 0;<br>
+=C2=A0 =C2=A0 fifo8_create(&amp;mouse-&gt;outbuf, MSMOUSE_BUF_SZ);<br>
=C2=A0}<br>
<br>
=C2=A0static void char_msmouse_class_init(ObjectClass *oc, void *data)<br>
--<br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f45f4f05e83e60af--

