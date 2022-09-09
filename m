Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390D5B38DD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 15:24:14 +0200 (CEST)
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWdzR-0004OZ-CR
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 09:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWdwK-0000v1-MS; Fri, 09 Sep 2022 09:21:00 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:33562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWdwI-00079s-8g; Fri, 09 Sep 2022 09:21:00 -0400
Received: by mail-lj1-x22f.google.com with SMTP id v6so1846482ljj.0;
 Fri, 09 Sep 2022 06:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HwXEy1imY4xs6/vExhPmWIkVEIpc4kDW2yTq1ONoM3g=;
 b=oe2uiPxNcpf0UdFMqIIXAYVrHRkYJEGNpf6Q/+H+exvnJTMbhSH16tYD/PC0k4Ba7O
 npj7gBv3qL9EB44gtcw3qT/0fnW4jMzd7GYU/X1tSzq+l5qn/4VNq/Fhx2s2eYiz3DIu
 K/mfTBlfDqvS1xlHTefV7C1p36mHoYcys0XDFIFf5ctLTXWAkglks5RMoMreCejcbLos
 v3AQmOI7ABOMc1nzU1NuOKU8YHTK1eJOFPs+kcLX+NK4Nd1OrunXmQS1ZeiR2C6mkc6r
 I6jQXbEJmzpkb8jVBzonkwGwiDy6f83gowWA8H5DkAHk54NKp0bZaISP8KZytfeQHOjk
 KcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HwXEy1imY4xs6/vExhPmWIkVEIpc4kDW2yTq1ONoM3g=;
 b=tsjcgR/T3C16BLaiESJOW/bYGxaEvlbEv0JqEaBHOgHC/l0Om5fdTfpNLXaI244JVL
 th8sl5BdrRoUL2EIF0U7K/OrjlwSqnCBQ+fQiV4jMGItQqJ/QhoQ+0Cvhlgh3jGViqcv
 KKhGumBFzFcZDWC/qKzAAS89SD2AXMXtjCoMmb2uiT+GoK82uEBepntFYTONcD0QPfjA
 odKizGewBF9Ja+Huk8WYsw1+KyE41aXtecMUpKSkjWanEqz1bmfXTGCzrDPbSKHMalMh
 apbeTXFwCtqR6WtezABIHU1atx3XLDvdZUhvflWuyAHBCgEkfYOSW1yIqjKkOsq+cLD9
 gFkw==
X-Gm-Message-State: ACgBeo2GRafsbawslrwy8UpOlvpGn4O1snxO8bdA/8RkWrK7Ll2FdGbW
 16v16YiMu6v6cNfzAN5LC4VEssqpQNkJe1FzAwY=
X-Google-Smtp-Source: AA6agR4VtmMLru1BwZ6Op+itHEsC6L3nAVoid4lFOH7UupHjIW4VuMeZYdNYiwwU5v/WLO4lHr4dTGKcA8nZlnFizk0=
X-Received: by 2002:a2e:958c:0:b0:26b:de19:ca51 with SMTP id
 w12-20020a2e958c000000b0026bde19ca51mr1711377ljh.449.1662729656024; Fri, 09
 Sep 2022 06:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-5-arwed.meyer@gmx.de>
In-Reply-To: <20220908173120.16779-5-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 9 Sep 2022 17:20:44 +0400
Message-ID: <CAJ+F1C+C+3d1=kEayy5nUZE-O45K7iiTHeAqU5RebtozZOYT3g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] msmouse: Add pnp data
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000081467d05e83e6a26"
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

--00000000000081467d05e83e6a26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2022 at 9:34 PM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Make msmouse send serial pnp data.
> Enables you to see nice qemu device name in Win9x.
>
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  chardev/msmouse.c | 58 ++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 47 insertions(+), 11 deletions(-)
>
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index e9aa3eab55..29eb97fedc 100644
> --- a/chardev/msmouse.c
> +++ b/chardev/msmouse.c
> @@ -35,11 +35,24 @@
>  #define MSMOUSE_HI2(n)  (((n) & 0xc0) >> 6)
>  #define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))
>
> +/* Serial PnP for 6 bit devices/mice sends all ASCII chars - 0x20 */
> +#define M(c) (c - 0x20)
>  /* Serial fifo size. */
>  #define MSMOUSE_BUF_SZ 64
>
>  /* Mouse ID: Send "M3" cause we behave like a 3 button logitech mouse. *=
/
>  const uint8_t mouse_id[] =3D {'M', '3'};
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
>
>  struct MouseChardev {
>      Chardev parent;
> @@ -154,11 +167,22 @@ static int msmouse_chr_write(struct Chardev *s,
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
> @@ -167,11 +191,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, voi=
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
>                   */
>                  fifo8_push_all(&mouse->outbuf, mouse_id,
> sizeof(mouse_id));
> +                /* Add PnP data: */
> +                fifo8_push_all(&mouse->outbuf, pnp_data,
> sizeof(pnp_data));
> +                /*
> +                 * Add device description from qemu handler name.
> +                 * Make sure this all fits into the queue beforehand!
> +                 */
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
> @@ -204,13 +247,6 @@ static void char_msmouse_finalize(Object *obj)
>      fifo8_destroy(&mouse->outbuf);
>  }
>
> -static QemuInputHandler msmouse_handler =3D {
> -    .name  =3D "QEMU Microsoft Mouse",
> -    .mask  =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
> -    .event =3D msmouse_input_event,
> -    .sync  =3D msmouse_input_sync,
> -};
> -
>  static void msmouse_chr_open(Chardev *chr,
>                               ChardevBackend *backend,
>                               bool *be_opened,
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000081467d05e83e6a26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 9:34 PM Arwed =
Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de">arwed.meyer@gmx.de</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Make msmo=
use send serial pnp data.<br>
Enables you to see nice qemu device name in Win9x.<br>
<br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br></blockquote><div><br></div><div>=
lgtm</div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mail=
to:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.c=
om</a>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0chardev/msmouse.c | 58 ++++++++++++++++++++++++++++++++++++++--------=
-<br>
=C2=A01 file changed, 47 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/chardev/msmouse.c b/chardev/msmouse.c<br>
index e9aa3eab55..29eb97fedc 100644<br>
--- a/chardev/msmouse.c<br>
+++ b/chardev/msmouse.c<br>
@@ -35,11 +35,24 @@<br>
=C2=A0#define MSMOUSE_HI2(n)=C2=A0 (((n) &amp; 0xc0) &gt;&gt; 6)<br>
=C2=A0#define MSMOUSE_PWR(cm) (cm &amp; (CHR_TIOCM_RTS | CHR_TIOCM_DTR))<br=
>
<br>
+/* Serial PnP for 6 bit devices/mice sends all ASCII chars - 0x20 */<br>
+#define M(c) (c - 0x20)<br>
=C2=A0/* Serial fifo size. */<br>
=C2=A0#define MSMOUSE_BUF_SZ 64<br>
<br>
=C2=A0/* Mouse ID: Send &quot;M3&quot; cause we behave like a 3 button logi=
tech mouse. */<br>
=C2=A0const uint8_t mouse_id[] =3D {&#39;M&#39;, &#39;3&#39;};<br>
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
<br>
=C2=A0struct MouseChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
@@ -154,11 +167,22 @@ static int msmouse_chr_write(struct Chardev *s, const=
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
@@ -167,11 +191,30 @@ static int msmouse_ioctl(Chardev *chr, int cmd, void =
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fifo8_push_al=
l(&amp;mouse-&gt;outbuf, mouse_id, sizeof(mouse_id));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add PnP data: *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo8_push_all(&am=
p;mouse-&gt;outbuf, pnp_data, sizeof(pnp_data));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add device=
 description from qemu handler name.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Make sure =
this all fits into the queue beforehand!<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
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
@@ -204,13 +247,6 @@ static void char_msmouse_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0fifo8_destroy(&amp;mouse-&gt;outbuf);<br>
=C2=A0}<br>
<br>
-static QemuInputHandler msmouse_handler =3D {<br>
-=C2=A0 =C2=A0 .name=C2=A0 =3D &quot;QEMU Microsoft Mouse&quot;,<br>
-=C2=A0 =C2=A0 .mask=C2=A0 =3D INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,=
<br>
-=C2=A0 =C2=A0 .event =3D msmouse_input_event,<br>
-=C2=A0 =C2=A0 .sync=C2=A0 =3D msmouse_input_sync,<br>
-};<br>
-<br>
=C2=A0static void msmouse_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool *be_opened,<br>
--<br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000081467d05e83e6a26--

