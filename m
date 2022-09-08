Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93145B193F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:51:40 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWECB-0001EC-M5
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWE6W-0004gM-3t; Thu, 08 Sep 2022 05:45:48 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:43883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWE6T-0004qP-C0; Thu, 08 Sep 2022 05:45:47 -0400
Received: by mail-lj1-x22f.google.com with SMTP id bx38so19168951ljb.10;
 Thu, 08 Sep 2022 02:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cVhWDCzQOt2DxGTFC36izHrNlDIP9im6oBIx1Sg5WC0=;
 b=hPd5AFZ+wjoQzWjzV25cmMMpEfIKv3JUeViU7HxGW1f6ob/TM1b3POE7EYmEPkjAjp
 +SWDxbQ7HdiVlCifZscDmEJ4IL1fgICreV597hp6yilMfd9Zh4a/9E0apGAT1b2h5OY4
 pkPsbni9MkxaGtNAprsFuhdWqwNbPcRW5YD3m33Ju0+LNWi2uIN+MIPlj5Jsmut0VAcX
 VK5Df/vUWiI6twKWkQ5Ampc1KTUY9ZRFrOZ9HU/YyI4JySIdT2sPWrtIYEtmpFlYstks
 hB+4ZyvyVtk60cGSQmdKXqmwI77FsrErV+JAvNIH4Z/OONc7za5BXvw+lmnrpqBMklWg
 jCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cVhWDCzQOt2DxGTFC36izHrNlDIP9im6oBIx1Sg5WC0=;
 b=jbX+B0G24ISwIqRY7YGkpXqZkcbT64zn/SA8KohA0S+qULGMr3JQXxipyI95r73pU0
 irP1Wrlr/TRFiTOtC7a84scLOftymHwftmkWshfaPilFor56yXIkCbTlsVG9cDRe9c0o
 /An0l4vp4h/fyir2v/xusFFgbWIZxinJqKb2mdF44LmnsJbshsMG8Hw63pbIgLtWoUja
 UL/mcd4fhq9bNVMkwem/S03tSA4Jm4iFI/RNi9ZAuIdW0x/itsvGA0svIowJODwOuFfi
 nkx68He+0MGPcD5K45US6qTjrx6ih2T3D5wyEA/sW4lqsxcXTN+1JCikyljXcvzArMro
 wv2Q==
X-Gm-Message-State: ACgBeo0lphY/RYZozWTeyKdcmKgm60mEVYMspJGahP/y5uXUpRIP+X1A
 alU2AdeQkeoejZa0GFAtoAIU1IMXnwdyqibcL3A=
X-Google-Smtp-Source: AA6agR5BOKMTPPQlxKwAFQLPCK0aLlOPzLErfVpatPVgdpSXGHvhApWcvECRGxFBT5yF2rcn/qqR+RspRX5TU/J2Ix0=
X-Received: by 2002:a2e:a789:0:b0:267:917b:401b with SMTP id
 c9-20020a2ea789000000b00267917b401bmr2343626ljf.452.1662630342543; Thu, 08
 Sep 2022 02:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-4-arwed.meyer@gmx.de>
In-Reply-To: <20220906194755.98090-4-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Sep 2022 13:45:30 +0400
Message-ID: <CAJ+F1CK6OTMKs0jOiOxu8+qzutQOBEpONFQCZWHXrB1zuu23xA@mail.gmail.com>
Subject: Re: [PATCH 3/4] msmouse: Add pnp data
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f5cb9705e8274a40"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

--000000000000f5cb9705e8274a40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 7, 2022 at 2:05 AM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Make msmouse send serial pnp data.
> Enables you to see nice qemu device name in Win9x.
>
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
> ---
>  chardev/msmouse.c | 101 +++++++++++++++++++++++++++++++---------------
>  1 file changed, 68 insertions(+), 33 deletions(-)
>
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index 0ecf26a436..b4ddaee778 100644
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
> @@ -34,6 +35,25 @@
>  #define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
>  #define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))
>
> +/* Serial PnP for 6 bit devices/mice sends all ASCII chars - 0x20 */
> +#define M(c) (c - 0x20)
> +/* Serial fifo size. */
> +#define MSMOUSE_BUF_SZ 64
> +
> +/* Mouse ID: Send "M3" cause we behave like a 3 button logitech mouse. *=
/
> +const uint8_t mouse_id[] =3D {'M', '3'};
> +/*
> + * PnP start "(", PnP version (1.0), vendor ID, product ID, '\\',
> + * serial ID (omitted), '\\', MS class name, '\\', driver ID (omitted),
> '\\',
> + * product description, checksum, ")"
> + * Missing parts are inserted later.
> + */
> +const uint8_t pnp_data[] =3D {M('('), 1, '$', M('Q'), M('M'), M('U'),
> +                         M('0'), M('0'), M('0'), M('1'),
> +                         M('\\'), M('\\'),
> +                         M('M'), M('O'), M('U'), M('S'), M('E'),
> +                         M('\\'), M('\\')};
> +
>  struct MouseChardev {
>      Chardev parent;
>
> @@ -42,8 +62,7 @@ struct MouseChardev {
>      int axis[INPUT_AXIS__MAX];
>      bool btns[INPUT_BUTTON__MAX];
>      bool btnc[INPUT_BUTTON__MAX];
> -    uint8_t outbuf[32];
> -    int outlen;
> +    Fifo8 outbuf;
>

Could you make this outbuf replacement a different patch?


>  };
>  typedef struct MouseChardev MouseChardev;
>
> @@ -54,21 +73,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
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
> @@ -94,12 +107,11 @@ static void msmouse_queue_event(MouseChardev *mouse)
>          mouse->btnc[INPUT_BUTTON_MIDDLE]) {
>          bytes[3] |=3D (mouse->btns[INPUT_BUTTON_MIDDLE] ? 0x20 : 0x00);
>          mouse->btnc[INPUT_BUTTON_MIDDLE] =3D false;
> -        count =3D 4;
> +        count++;
>      }
>
> -    if (mouse->outlen <=3D sizeof(mouse->outbuf) - count) {
> -        memcpy(mouse->outbuf + mouse->outlen, bytes, count);
> -        mouse->outlen +=3D count;
> +    if (fifo8_num_free(&mouse->outbuf) >=3D count) {
> +        fifo8_push_all(&mouse->outbuf, bytes, count);
>      } else {
>          /* queue full -> drop event */
>      }
> @@ -155,11 +167,22 @@ static int msmouse_chr_write(struct Chardev *s,
> const uint8_t *buf, int len)
>      return len;
>  }
>
> +static QemuInputHandler msmouse_handler =3D {
> +    .name  =3D "QEMU Microsoft Mouse",
> +    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
> +    .event =3D msmouse_input_event,
> +    .sync  =3D msmouse_input_sync,
> +};
> +
>  static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
>  {
>      MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
> -    int c;
> +    int c, i, j;
> +    uint8_t bytes[MSMOUSE_BUF_SZ / 2];
>      int *targ =3D (int *)arg;
> +    const uint8_t hexchr[16] =3D {M('0'), M('1'), M('2'), M('3'), M('4')=
,
> M('5'),
> +                             M('6'), M('7'), M('8'), M('9'), M('A'),
> M('B'),
> +                             M('C'), M('D'), M('E'), M('F')};
>
>      switch (cmd) {
>      case CHR_IOCTL_SERIAL_SET_TIOCM:
> @@ -168,13 +191,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, voi=
d
> *arg)
>          if (MSMOUSE_PWR(mouse->tiocm)) {
>              if (!MSMOUSE_PWR(c)) {
>                  /*
> -                 * Power on after reset: send "M3"
> -                 * cause we behave like a 3 button logitech
> -                 * mouse.
> +                 * Power on after reset: Send ID and PnP data
> +                 * No need to check fifo space as it is empty at this
> point.
> +                 */
> +                fifo8_push_all(&mouse->outbuf, mouse_id,
> sizeof(mouse_id));
> +                /* Add PnP data: */
> +                fifo8_push_all(&mouse->outbuf, pnp_data,
> sizeof(pnp_data));
> +                /*
> +                 * Add device description from qemu handler name.
> +                 * Make sure this all fits into the queue beforehand!
>                   */
> -                mouse->outbuf[0] =3D 'M';
> -                mouse->outbuf[1] =3D '3';
> -                mouse->outlen =3D 2;
> +                c =3D M(')');
> +                for (i =3D 0; msmouse_handler.name[i]; i++) {
> +                    bytes[i] =3D M(msmouse_handler.name[i]);
> +                    c +=3D bytes[i];
> +                }
> +                /* Calc more of checksum */
> +                for (j =3D 0; j < sizeof(pnp_data); j++) {
> +                    c +=3D pnp_data[j];
> +                }
> +                c &=3D 0xff;
> +                bytes[i++] =3D hexchr[c >> 4];
> +                bytes[i++] =3D hexchr[c & 0x0f];
> +                bytes[i++] =3D M(')');
> +                fifo8_push_all(&mouse->outbuf, bytes, i);
>                  /* Start sending data to serial. */
>                  msmouse_chr_accept_input(chr);
>              }
> @@ -184,7 +224,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void
> *arg)
>           * Reset mouse buffers on power down.
>           * Mouse won't send anything without power.
>           */
> -        mouse->outlen =3D 0;
> +        fifo8_reset(&mouse->outbuf);
>          memset(mouse->axis, 0, sizeof(mouse->axis));
>          for (c =3D INPUT_BUTTON__MAX - 1; c >=3D 0; c--) {
>              mouse->btns[c] =3D false;
> @@ -206,15 +246,9 @@ static void char_msmouse_finalize(Object *obj)
>      MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
>
>      qemu_input_handler_unregister(mouse->hs);
> +    fifo8_destroy(&mouse->outbuf);
>  }
>
> -static QemuInputHandler msmouse_handler =3D {
> -    .name  =3D "QEMU Microsoft Mouse",
> -    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
> -    .event =3D msmouse_input_event,
> -    .sync  =3D msmouse_input_sync,
> -};
> -
>
 static void msmouse_chr_open(Chardev *chr,
>                               ChardevBackend *backend,
>                               bool *be_opened,
> @@ -226,6 +260,7 @@ static void msmouse_chr_open(Chardev *chr,
>      mouse->hs =3D qemu_input_handler_register((DeviceState *)mouse,
>                                              &msmouse_handler);
>      mouse->tiocm =3D 0;
> +    fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
>
 }
>
>  static void char_msmouse_class_init(ObjectClass *oc, void *data)
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f5cb9705e8274a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 7, 2022 at 2:05 AM Arwe=
d Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de">arwed.meyer@gmx.de</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Make ms=
mouse send serial pnp data.<br>
Enables you to see nice qemu device name in Win9x.<br>
<br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br>
---<br>
=C2=A0chardev/msmouse.c | 101 +++++++++++++++++++++++++++++++--------------=
-<br>
=C2=A01 file changed, 68 insertions(+), 33 deletions(-)<br>
<br>
diff --git a/chardev/msmouse.c b/chardev/msmouse.c<br>
index 0ecf26a436..b4ddaee778 100644<br>
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
@@ -34,6 +35,25 @@<br>
=C2=A0#define MSMOUSE_HI2(n)=C2=A0 (((n) &amp; 0xc0) &gt;&gt; 6)<br>
=C2=A0#define MSMOUSE_PWR(cm) (cm &amp; (CHR_TIOCM_RTS | CHR_TIOCM_DTR))<br=
>
<br>
+/* Serial PnP for 6 bit devices/mice sends all ASCII chars - 0x20 */<br>
+#define M(c) (c - 0x20)<br>
+/* Serial fifo size. */<br>
+#define MSMOUSE_BUF_SZ 64<br>
+<br>
+/* Mouse ID: Send &quot;M3&quot; cause we behave like a 3 button logitech =
mouse. */<br>
+const uint8_t mouse_id[] =3D {&#39;M&#39;, &#39;3&#39;};<br>
+/*<br>
+ * PnP start &quot;(&quot;, PnP version (1.0), vendor ID, product ID, &#39=
;\\&#39;,<br>
+ * serial ID (omitted), &#39;\\&#39;, MS class name, &#39;\\&#39;, driver =
ID (omitted), &#39;\\&#39;,<br>
+ * product description, checksum, &quot;)&quot;<br>
+ * Missing parts are inserted later.<br>
+ */<br>
+const uint8_t pnp_data[] =3D {M(&#39;(&#39;), 1, &#39;$&#39;, M(&#39;Q&#39=
;), M(&#39;M&#39;), M(&#39;U&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0M(&#39;0&#39;), M(&#39;0&#39;), M(&#39;0&#39;), M(&#39;1&#=
39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0M(&#39;\\&#39;), M(&#39;\\&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0M(&#39;M&#39;), M(&#39;O&#39;), M(&#39;U&#39;), M(&#39;S&#=
39;), M(&#39;E&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0M(&#39;\\&#39;), M(&#39;\\&#39;)};<br>
+<br>
=C2=A0struct MouseChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
<br>
@@ -42,8 +62,7 @@ struct MouseChardev {<br>
=C2=A0 =C2=A0 =C2=A0int axis[INPUT_AXIS__MAX];<br>
=C2=A0 =C2=A0 =C2=A0bool btns[INPUT_BUTTON__MAX];<br>
=C2=A0 =C2=A0 =C2=A0bool btnc[INPUT_BUTTON__MAX];<br>
-=C2=A0 =C2=A0 uint8_t outbuf[32];<br>
-=C2=A0 =C2=A0 int outlen;<br>
+=C2=A0 =C2=A0 Fifo8 outbuf;<br>
</blockquote><div><br></div><div>Could you make this outbuf replacement a d=
ifferent patch?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">=C2=A0};<br>
=C2=A0typedef struct MouseChardev MouseChardev;<br>
<br>
@@ -54,21 +73,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,<b=
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
@@ -94,12 +107,11 @@ static void msmouse_queue_event(MouseChardev *mouse)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse-&gt;btnc[INPUT_BUTTON_MIDDLE]) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bytes[3] |=3D (mouse-&gt;btns[INPUT_BUTTO=
N_MIDDLE] ? 0x20 : 0x00);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse-&gt;btnc[INPUT_BUTTON_MIDDLE] =3D f=
alse;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 count =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 count++;<br>
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
@@ -155,11 +167,22 @@ static int msmouse_chr_write(struct Chardev *s, const=
 uint8_t *buf, int len)<br>
=C2=A0 =C2=A0 =C2=A0return len;<br>
=C2=A0}<br>
<br>
+static QemuInputHandler msmouse_handler =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =3D &quot;QEMU Microsoft Mouse&quot;,<br>
+=C2=A0 =C2=A0 .mask=C2=A0 =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,=
<br>
+=C2=A0 =C2=A0 .event =3D msmouse_input_event,<br>
+=C2=A0 =C2=A0 .sync=C2=A0 =3D msmouse_input_sync,<br>
+};<br>
+<br>
=C2=A0static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(chr);<br>
-=C2=A0 =C2=A0 int c;<br>
+=C2=A0 =C2=A0 int c, i, j;<br>
+=C2=A0 =C2=A0 uint8_t bytes[MSMOUSE_BUF_SZ / 2];<br>
=C2=A0 =C2=A0 =C2=A0int *targ =3D (int *)arg;<br>
+=C2=A0 =C2=A0 const uint8_t hexchr[16] =3D {M(&#39;0&#39;), M(&#39;1&#39;)=
, M(&#39;2&#39;), M(&#39;3&#39;), M(&#39;4&#39;), M(&#39;5&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0M(&#39;6&#39;), M(&#39;7&#39;), M(&#39;8&#39=
;), M(&#39;9&#39;), M(&#39;A&#39;), M(&#39;B&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0M(&#39;C&#39;), M(&#39;D&#39;), M(&#39;E&#39=
;), M(&#39;F&#39;)};<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
=C2=A0 =C2=A0 =C2=A0case CHR_IOCTL_SERIAL_SET_TIOCM:<br>
@@ -168,13 +191,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void =
*arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (MSMOUSE_PWR(mouse-&gt;tiocm)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!MSMOUSE_PWR(c)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Power on a=
fter reset: send &quot;M3&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* cause we b=
ehave like a 3 button logitech<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mouse.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Power on a=
fter reset: Send ID and PnP data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* No need to=
 check fifo space as it is empty at this point.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&am=
p;mouse-&gt;outbuf, mouse_id, sizeof(mouse_id));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add PnP data: *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&am=
p;mouse-&gt;outbuf, pnp_data, sizeof(pnp_data));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add device=
 description from qemu handler name.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Make sure =
this all fits into the queue beforehand!<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outbuf[0=
] =3D &#39;M&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outbuf[1=
] =3D &#39;3&#39;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outlen =
=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D M(&#39;)&#39=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; <a h=
ref=3D"http://msmouse_handler.name" rel=3D"noreferrer" target=3D"_blank">ms=
mouse_handler.name</a>[i]; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byte=
s[i] =3D M(<a href=3D"http://msmouse_handler.name" rel=3D"noreferrer" targe=
t=3D"_blank">msmouse_handler.name</a>[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c +=
=3D bytes[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Calc more of ch=
ecksum */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &l=
t; sizeof(pnp_data); j++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c +=
=3D pnp_data[j];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c &amp;=3D 0xff;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[i++] =3D hex=
chr[c &gt;&gt; 4];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[i++] =3D hex=
chr[c &amp; 0x0f];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes[i++] =3D M(&=
#39;)&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&am=
p;mouse-&gt;outbuf, bytes, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Start send=
ing data to serial. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msmouse_chr_a=
ccept_input(chr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -184,7 +224,7 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void *a=
rg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Reset mouse buffers on power down.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Mouse won&#39;t send anything without =
power.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse-&gt;outlen =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_reset(&amp;mouse-&gt;outbuf);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(mouse-&gt;axis, 0, sizeof(mouse-&g=
t;axis));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (c =3D INPUT_BUTTON__MAX - 1; c &gt;=
=3D 0; c--) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mouse-&gt;btns[c] =3D false=
;<br>
@@ -206,15 +246,9 @@ static void char_msmouse_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(obj);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_input_handler_unregister(mouse-&gt;hs);<br>
+=C2=A0 =C2=A0 fifo8_destroy(&amp;mouse-&gt;outbuf);<br>
=C2=A0}<br>
<br>
-static QemuInputHandler msmouse_handler =3D {<br>
-=C2=A0 =C2=A0 .name=C2=A0 =3D &quot;QEMU Microsoft Mouse&quot;,<br>
-=C2=A0 =C2=A0 .mask=C2=A0 =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,=
<br>
-=C2=A0 =C2=A0 .event =3D msmouse_input_event,<br>
-=C2=A0 =C2=A0 .sync=C2=A0 =3D msmouse_input_sync,<br>
-};<br>
-<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0static void msmouse_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool *be_opened,<br>
@@ -226,6 +260,7 @@ static void msmouse_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0mouse-&gt;hs =3D qemu_input_handler_register((DeviceSta=
te *)mouse,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&amp;msmouse_handler);<br>
=C2=A0 =C2=A0 =C2=A0mouse-&gt;tiocm =3D 0;<br>
+=C2=A0 =C2=A0 fifo8_create(&amp;mouse-&gt;outbuf, MSMOUSE_BUF_SZ); <br></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void char_msmouse_class_init(ObjectClass *oc, void *data)<br>
--<br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f5cb9705e8274a40--

