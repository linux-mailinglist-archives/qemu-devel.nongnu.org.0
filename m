Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF95B1960
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:54:51 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEFH-00077G-59
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWE6x-00059N-Sx; Thu, 08 Sep 2022 05:46:17 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:45598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWE6v-0004sd-O6; Thu, 08 Sep 2022 05:46:15 -0400
Received: by mail-lf1-x12a.google.com with SMTP id w8so26738571lft.12;
 Thu, 08 Sep 2022 02:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gmB4xLkEoVGsgmYRY+wcxKJmaH33HNlzs0QgZz6kMQ0=;
 b=RsSLsDiPBcQ8ySuF4y8jFx5tufHo15w7hmMS1BZqrgxb1IShMUtwglpTyM24aLfJ0e
 1iorC8+imiV186TaQ+9NtTlEn81E/5oixznG9fbP/IKX0PxFB8lIlAhZxQGvnw0kXJS3
 TB6/hpL7DrbUyeO0pOQc700FrAc5gh1+psl6ZZIsUsXc0MXr8IXJGNB9VuQ1+mZHTAxM
 jg2UWCM4eRxNbiS1wZh6qu13/Mw5vEDLOhzBgE0AF3tGucXTLkjo0gfH3TlO2hSlVGsq
 P4NXGwshixr/siYscCUVJVMeVjOikqpPCm/POLULAqAKrTG1M0R1wGfYXLuvI49E7Rra
 kDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gmB4xLkEoVGsgmYRY+wcxKJmaH33HNlzs0QgZz6kMQ0=;
 b=dowqslyOhlYbFOr2TZ5HDD5LnSKYKzOOX4fvBFgKRier1SE+6wC9VS79Qlj+GZJff1
 Ysoph8RF5HDGnENNtiQMaBJuIBTGA2cUy3oloj6qGN6wvLGi/PnoqJPf9ibOYyNyfRux
 aMkytbwqzo0AmjRmCL+eGLDqGZCH1JQ2T6ZZFF9V69dE6Ga5S5Q0NGP8ic+UyoBPv7rn
 0qTyD01a2e0l4I4MW02fxN55MmOD/GkTjxtL8F0kabn75A2WuCzN6MUOp+NboSgDiiQI
 Ns/C9nJk7QXDfeG8maLN6smPBOk1C6Hq5wbCYVDbqfyzqloe6TDlF09JppLGIIHyD8wU
 4+fg==
X-Gm-Message-State: ACgBeo2J9EIIPlhkwkvVoTcKnkQEvo1BpX/a1TfTr/Yn9Drn7QMtSDbp
 mQQgN5Mez1DXAbNQAFACKkg8hYp1OYFpNou9UMk=
X-Google-Smtp-Source: AA6agR7LSsa8neovevg8rdIGvNbvb8T2pbZq1HSa3ogpQZhPQdbcdEdLbQVXdd9juJfXKdrVQUv2ZUWoD+53UrpUIIQ=
X-Received: by 2002:a05:6512:3e10:b0:498:f317:e57e with SMTP id
 i16-20020a0565123e1000b00498f317e57emr133155lfv.328.1662630371672; Thu, 08
 Sep 2022 02:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-2-arwed.meyer@gmx.de>
In-Reply-To: <20220906194755.98090-2-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Sep 2022 13:45:59 +0400
Message-ID: <CAJ+F1CLLZBQFnCp0n5yeK6fSN7vhRiHnT=SZ8pUkk09kkGsgVA@mail.gmail.com>
Subject: Re: [PATCH 1/4] msmouse: Handle mouse reset
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b2482805e8274ca1"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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

--000000000000b2482805e8274ca1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 7, 2022 at 2:03 AM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Detect mouse reset via RTS or DTR line:
> Don't send or process anything while in reset.
> When coming out of reset, send ID sequence first thing.
> This allows msmouse to be detected by common mouse drivers.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
> ---
>  chardev/msmouse.c | 65 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index eb9231dcdb..0ecf26a436 100644
> --- a/chardev/msmouse.c
> +++ b/chardev/msmouse.c
> @@ -25,17 +25,20 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "chardev/char.h"
> +#include "chardev/char-serial.h"
>  #include "ui/console.h"
>  #include "ui/input.h"
>  #include "qom/object.h"
>
> -#define MSMOUSE_LO6(n) ((n) & 0x3f)
> -#define MSMOUSE_HI2(n) (((n) & 0xc0) >> 6)
> +#define MSMOUSE_LO6(n)  ((n) & 0x3f)
> +#define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
> +#define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))
>
>  struct MouseChardev {
>      Chardev parent;
>
>      QemuInputHandlerState *hs;
> +    int tiocm;
>      int axis[INPUT_AXIS__MAX];
>      bool btns[INPUT_BUTTON__MAX];
>      bool btnc[INPUT_BUTTON__MAX];
> @@ -109,6 +112,11 @@ static void msmouse_input_event(DeviceState *dev,
> QemuConsole *src,
>      InputMoveEvent *move;
>      InputBtnEvent *btn;
>
> +    /* Ignore events if serial mouse powered down. */
> +    if (!MSMOUSE_PWR(mouse->tiocm)) {
> +        return;
> +    }
> +
>      switch (evt->type) {
>      case INPUT_EVENT_KIND_REL:
>          move =3D evt->u.rel.data;
> @@ -132,6 +140,11 @@ static void msmouse_input_sync(DeviceState *dev)
>      MouseChardev *mouse =3D MOUSE_CHARDEV(dev);
>      Chardev *chr =3D CHARDEV(dev);
>
> +    /* Ignore events if serial mouse powered down. */
> +    if (!MSMOUSE_PWR(mouse->tiocm)) {
> +        return;
> +    }
> +
>      msmouse_queue_event(mouse);
>      msmouse_chr_accept_input(chr);
>  }
> @@ -142,6 +155,52 @@ static int msmouse_chr_write(struct Chardev *s, cons=
t
> uint8_t *buf, int len)
>      return len;
>  }
>
> +static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
> +{
> +    MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
> +    int c;
> +    int *targ =3D (int *)arg;
> +
> +    switch (cmd) {
> +    case CHR_IOCTL_SERIAL_SET_TIOCM:
> +        c =3D mouse->tiocm;
> +        mouse->tiocm =3D *(int *)arg;
> +        if (MSMOUSE_PWR(mouse->tiocm)) {
> +            if (!MSMOUSE_PWR(c)) {
> +                /*
> +                 * Power on after reset: send "M3"
> +                 * cause we behave like a 3 button logitech
> +                 * mouse.
> +                 */
> +                mouse->outbuf[0] =3D 'M';
> +                mouse->outbuf[1] =3D '3';
> +                mouse->outlen =3D 2;
> +                /* Start sending data to serial. */
> +                msmouse_chr_accept_input(chr);
> +            }
> +            break;
> +        }
> +        /*
> +         * Reset mouse buffers on power down.
> +         * Mouse won't send anything without power.
> +         */
> +        mouse->outlen =3D 0;
> +        memset(mouse->axis, 0, sizeof(mouse->axis));
> +        for (c =3D INPUT_BUTTON__MAX - 1; c >=3D 0; c--) {
> +            mouse->btns[c] =3D false;
> +            mouse->btnc[c] =3D false;
> +        }
>

Why not memset those fields as well?


> +        break;
> +    case CHR_IOCTL_SERIAL_GET_TIOCM:
> +        /* Remember line control status. */
> +        *targ =3D mouse->tiocm;
> +        break;
> +    default:
> +        return -ENOTSUP;
> +    }
> +    return 0;
> +}
> +
>  static void char_msmouse_finalize(Object *obj)
>  {
>      MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
> @@ -166,6 +225,7 @@ static void msmouse_chr_open(Chardev *chr,
>      *be_opened =3D false;
>      mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
>                                              &msmouse_handler);
> +    mouse->tiocm =3D 0;
>  }
>
>  static void char_msmouse_class_init(ObjectClass *oc, void *data)
> @@ -175,6 +235,7 @@ static void char_msmouse_class_init(ObjectClass *oc,
> void *data)
>      cc->open =3D msmouse_chr_open;
>      cc->chr_write =3D msmouse_chr_write;
>      cc->chr_accept_input =3D msmouse_chr_accept_input;
> +    cc->chr_ioctl =3D msmouse_ioctl;
>  }
>
>  static const TypeInfo char_msmouse_type_info =3D {
> --
> 2.34.1
>
>
>
lgtm otherwise,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000b2482805e8274ca1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 7, 2022 at 2:03 AM Arwe=
d Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=3D"_blank">arwed.m=
eyer@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Detect mouse reset via RTS or DTR line:<br>
Don&#39;t send or process anything while in reset.<br>
When coming out of reset, send ID sequence first thing.<br>
This allows msmouse to be detected by common mouse drivers.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/77" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/77</a><br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br>
---<br>
=C2=A0chardev/msmouse.c | 65 +++++++++++++++++++++++++++++++++++++++++++++-=
-<br>
=C2=A01 file changed, 63 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/msmouse.c b/chardev/msmouse.c<br>
index eb9231dcdb..0ecf26a436 100644<br>
--- a/chardev/msmouse.c<br>
+++ b/chardev/msmouse.c<br>
@@ -25,17 +25,20 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
+#include &quot;chardev/char-serial.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;ui/input.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
<br>
-#define MSMOUSE_LO6(n) ((n) &amp; 0x3f)<br>
-#define MSMOUSE_HI2(n) (((n) &amp; 0xc0) &gt;&gt; 6)<br>
+#define MSMOUSE_LO6(n)=C2=A0 ((n) &amp; 0x3f)<br>
+#define MSMOUSE_HI2(n)=C2=A0 (((n) &amp; 0xc0) &gt;&gt; 6)<br>
+#define MSMOUSE_PWR(cm) (cm &amp; (CHR_TIOCM_RTS | CHR_TIOCM_DTR))<br>
<br>
=C2=A0struct MouseChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
<br>
=C2=A0 =C2=A0 =C2=A0QemuInputHandlerState *hs;<br>
+=C2=A0 =C2=A0 int tiocm;<br>
=C2=A0 =C2=A0 =C2=A0int axis[INPUT_AXIS__MAX];<br>
=C2=A0 =C2=A0 =C2=A0bool btns[INPUT_BUTTON__MAX];<br>
=C2=A0 =C2=A0 =C2=A0bool btnc[INPUT_BUTTON__MAX];<br>
@@ -109,6 +112,11 @@ static void msmouse_input_event(DeviceState *dev, Qemu=
Console *src,<br>
=C2=A0 =C2=A0 =C2=A0InputMoveEvent *move;<br>
=C2=A0 =C2=A0 =C2=A0InputBtnEvent *btn;<br>
<br>
+=C2=A0 =C2=A0 /* Ignore events if serial mouse powered down. */<br>
+=C2=A0 =C2=A0 if (!MSMOUSE_PWR(mouse-&gt;tiocm)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0switch (evt-&gt;type) {<br>
=C2=A0 =C2=A0 =C2=A0case INPUT_EVENT_KIND_REL:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D evt-&gt;u.rel.data;<br>
@@ -132,6 +140,11 @@ static void msmouse_input_sync(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(dev);<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr =3D CHARDEV(dev);<br>
<br>
+=C2=A0 =C2=A0 /* Ignore events if serial mouse powered down. */<br>
+=C2=A0 =C2=A0 if (!MSMOUSE_PWR(mouse-&gt;tiocm)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0msmouse_queue_event(mouse);<br>
=C2=A0 =C2=A0 =C2=A0msmouse_chr_accept_input(chr);<br>
=C2=A0}<br>
@@ -142,6 +155,52 @@ static int msmouse_chr_write(struct Chardev *s, const =
uint8_t *buf, int len)<br>
=C2=A0 =C2=A0 =C2=A0return len;<br>
=C2=A0}<br>
<br>
+static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)<br>
+{<br>
+=C2=A0 =C2=A0 MouseChardev *mouse =3D MOUSE_CHARDEV(chr);<br>
+=C2=A0 =C2=A0 int c;<br>
+=C2=A0 =C2=A0 int *targ =3D (int *)arg;<br>
+<br>
+=C2=A0 =C2=A0 switch (cmd) {<br>
+=C2=A0 =C2=A0 case CHR_IOCTL_SERIAL_SET_TIOCM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D mouse-&gt;tiocm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;tiocm =3D *(int *)arg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MSMOUSE_PWR(mouse-&gt;tiocm)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!MSMOUSE_PWR(c)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Power on a=
fter reset: send &quot;M3&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* cause we b=
ehave like a 3 button logitech<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mouse.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outbuf[0=
] =3D &#39;M&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outbuf[1=
] =3D &#39;3&#39;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outlen =
=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Start sending d=
ata to serial. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msmouse_chr_accept=
_input(chr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Reset mouse buffers on power down.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Mouse won&#39;t send anything without =
power.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outlen =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(mouse-&gt;axis, 0, sizeof(mouse-&gt;axi=
s));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (c =3D INPUT_BUTTON__MAX - 1; c &gt;=3D 0;=
 c--) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;btns[c] =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;btnc[c] =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Why not =
memset those fields as well?</div><div>=C2=A0<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CHR_IOCTL_SERIAL_GET_TIOCM:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember line control status. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *targ =3D mouse-&gt;tiocm;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0static void char_msmouse_finalize(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(obj);<br>
@@ -166,6 +225,7 @@ static void msmouse_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0*be_opened =3D false;<br>
=C2=A0 =C2=A0 =C2=A0mouse-&gt;hs =3D qemu_input_handler_register((DeviceSta=
te *)mouse,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;msmouse_handler);<br>
+=C2=A0 =C2=A0 mouse-&gt;tiocm =3D 0;<br>
=C2=A0}<br>
<br>
=C2=A0static void char_msmouse_class_init(ObjectClass *oc, void *data)<br>
@@ -175,6 +235,7 @@ static void char_msmouse_class_init(ObjectClass *oc, vo=
id *data)<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;open =3D msmouse_chr_open;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_write =3D msmouse_chr_write;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_accept_input =3D msmouse_chr_accept_input;<b=
r>
+=C2=A0 =C2=A0 cc-&gt;chr_ioctl =3D msmouse_ioctl;<br>
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo char_msmouse_type_info =3D {<br>
--<br>
2.34.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>lgtm otherwise,</div><div>Reviewed-b=
y: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com=
" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></div><br>-- <br=
><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b2482805e8274ca1--

