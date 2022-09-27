Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307275EBECE
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:40:00 +0200 (CEST)
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od74J-0002UG-5i
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od6mz-00062F-H1; Tue, 27 Sep 2022 05:22:08 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1od6mx-0002Bg-6S; Tue, 27 Sep 2022 05:22:05 -0400
Received: by mail-lj1-x232.google.com with SMTP id g20so10219973ljg.7;
 Tue, 27 Sep 2022 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Qa1WdwI4TtPF4U7ED4Km5+OtewqK6Q3Yy3sffooumZw=;
 b=FIoT0bH31gT74N4fussLLgTdqqOQiO+RmctY+XJDfX6cCogFHW1bEUEeOJiwzZC64a
 F0In9tHAIS24twVlPfCIxTuwhwMiIkdmbrMHta6nklTteCsSHhMOmj9jArQ1FLoa+Dq3
 S/gUOScVLaK7sREkSy6r8x8f6hIXAsaQMqK5AITWO/tf10NaH3l4/bqqZrXv8sXTEaF7
 tyQdFvnsPcIf5dA010+A1m3TS8jo85uK5GzuoEzCKHfZfrclP8RfMPOesZ1qNCuHeDJP
 0mDlRPF35TRAT/F14PIfY4xSSOlNXj8btV6aJ5ePS4w/duBmAHuDIUSUbngSjjS0LreJ
 IxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Qa1WdwI4TtPF4U7ED4Km5+OtewqK6Q3Yy3sffooumZw=;
 b=F0GfqqqDUIs2Ab+T27y/Vz5wTeEOFyUlOzJLelzRlf9+z1XkRs1tyhJjEdCVxCLV/D
 ut7mc0L121bWyjd2YEtQx6iFvCui/hJ2YBb/7+Kt6/8x8fhhoWNFvaiDVpkwi/TupIE5
 m8WQdAgZAanTq52MRS9S82L1DL8hLY2DrUe60+0uhTbB9AUtwkNZCprkN4bPF3j3TMta
 8KgLr4XKKhoBkMNyrE7/+EENtVKgPnQ6o4PSz6gEGC39Qrbk5D+Q8pW1UdRR7Y6/ly7d
 wtiqH3Ih7ebylVbohp9u7I06klaHicy5lKSzu2DyXsEtqVqP3wNEuqKyiNq3s9Ylx23q
 2iOw==
X-Gm-Message-State: ACrzQf3a8m+0JPsLNelkDrCqZs7w3n6ya9XhEYopyPAofp+3NruJ3XZZ
 50bcQjRllHdNWSIWdz38WKRxVyK0sB+33inLITA=
X-Google-Smtp-Source: AMsMyM6gdVfff1YE4hElBd8S6ks22+Uo7UVTA88jKPQkomHWRPJM1naZFQ6wTll/S/j2yWTUaoKxxDZk0R88sIDwK7Y=
X-Received: by 2002:a2e:8917:0:b0:26a:a520:db52 with SMTP id
 d23-20020a2e8917000000b0026aa520db52mr8833058lji.289.1664270520782; Tue, 27
 Sep 2022 02:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220911181840.8933-1-arwed.meyer@gmx.de>
 <20220911181840.8933-2-arwed.meyer@gmx.de>
In-Reply-To: <20220911181840.8933-2-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Sep 2022 13:21:49 +0400
Message-ID: <CAJ+F1CLi9pmLywWjxDzMCgLAm-NZx3Otq8okkBt2=Ca6TQjxXg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] msmouse: Handle mouse reset
To: Arwed Meyer <arwed.meyer@gmx.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003393ab05e9a52d16"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000003393ab05e9a52d16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Sep 11, 2022 at 10:39 PM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Detect mouse reset via RTS or DTR line:
> Don't send or process anything while in reset.
> When coming out of reset, send ID sequence first thing.
> This allows msmouse to be detected by common mouse drivers.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>

lgtm,
Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

It would be great to open an issue on gitlab wrt migration handling that
Peter pointed out in v2 (
https://patchew.org/QEMU/20220908173120.16779-1-arwed.meyer@gmx.de/20220908=
173120.16779-2-arwed.meyer@gmx.de/)
and perhaps a comment with this patch that links to the issue?


---
>  chardev/msmouse.c | 63 +++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 2 deletions(-)
>
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index eb9231dcdb..95fa488339 100644
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
> @@ -142,6 +155,50 @@ static int msmouse_chr_write(struct Chardev *s, cons=
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
> +        memset(mouse->btns, false, sizeof(mouse->btns));
> +        memset(mouse->btnc, false, sizeof(mouse->btns));
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
> @@ -166,6 +223,7 @@ static void msmouse_chr_open(Chardev *chr,
>      *be_opened =3D false;
>      mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
>                                              &msmouse_handler);
> +    mouse->tiocm =3D 0;
>  }
>
>  static void char_msmouse_class_init(ObjectClass *oc, void *data)
> @@ -175,6 +233,7 @@ static void char_msmouse_class_init(ObjectClass *oc,
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

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003393ab05e9a52d16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 11, 2022 at 10:39 PM Ar=
wed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de">arwed.meyer@gmx.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Detec=
t mouse reset via RTS or DTR line:<br>
Don&#39;t send or process anything while in reset.<br>
When coming out of reset, send ID sequence first thing.<br>
This allows msmouse to be detected by common mouse drivers.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/77" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/77</a><br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br></blockquote><div><br></div><div>=
lgtm,</div><div>Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marc=
andre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br>=
</div><div>It would be great to open an issue on gitlab wrt migration handl=
ing that Peter pointed out in v2 (<a href=3D"https://patchew.org/QEMU/20220=
908173120.16779-1-arwed.meyer@gmx.de/20220908173120.16779-2-arwed.meyer@gmx=
.de/">https://patchew.org/QEMU/20220908173120.16779-1-arwed.meyer@gmx.de/20=
220908173120.16779-2-arwed.meyer@gmx.de/</a>) and perhaps a comment with th=
is patch that links to the issue?</div><div><br></div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/msmouse.c | 63 +++++++++++++++++++++++++++++++++++++++++++++-=
-<br>
=C2=A01 file changed, 61 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/chardev/msmouse.c b/chardev/msmouse.c<br>
index eb9231dcdb..95fa488339 100644<br>
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
@@ -142,6 +155,50 @@ static int msmouse_chr_write(struct Chardev *s, const =
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(mouse-&gt;btns, false, sizeof(mouse-&gt=
;btns));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(mouse-&gt;btnc, false, sizeof(mouse-&gt=
;btns));<br>
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
@@ -166,6 +223,7 @@ static void msmouse_chr_open(Chardev *chr,<br>
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
@@ -175,6 +233,7 @@ static void char_msmouse_class_init(ObjectClass *oc, vo=
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003393ab05e9a52d16--

