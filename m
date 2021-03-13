Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C7339F73
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 18:24:42 +0100 (CET)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL80H-0007B1-H8
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 12:24:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lL7y5-00064g-Ai
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:22:25 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:36593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lL7y2-0004rJ-US
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 12:22:25 -0500
Received: by mail-io1-xd2c.google.com with SMTP id n14so29161297iog.3
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 09:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f5CfM4ttgjJ3QGGkuM/jytKgg3zcRkI69ujGC3AZhfc=;
 b=EIxXtOyr3Ix1Ui8hQikClICNwXwQ4sxv0323AipfK4GsKRci7qq7CrlBeK+htYxwgL
 fled5IfxxJgH9smkRUgKx4tmwNjjQ2jtjmBdoVS5i8rbxAyE6G7nrYRu4RS31eJPjPoe
 cBzPD0ol+4Sq1YIn+aMbcBa0tf3tVGj04KKQ1IARJ2nC030EKs67IugFg18uuR1L0yza
 no4dhjqnCxZ3cGRi74EA+m+mLNnJ6bzpOEKc7ISEcfRw2+nayXV07HuKHKHS73wCM1hE
 oflsC+XcERhjJutjIhy1NhGjVmfV3gcOYfAwGlgxSCqgQeRi0D0P5CQEWgTY7yzbLrBx
 dnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f5CfM4ttgjJ3QGGkuM/jytKgg3zcRkI69ujGC3AZhfc=;
 b=ESh0xwfyoIdgnnJr9yQdcQf1FHWgiJI+IPTFMbgTYtNfy7B/0eA7FTN4s6KwZB6RoB
 zc7jy/uhC71EdwvaT+gzxF9reXjmCqIHRC3EECXRnYsFznl+6Dk3SASEq7y+Qr7KD0I9
 RSD3fIw8Xv2nCBdYCLUxfQ9vAXCXUa2WcqTnAt208ZoyDFyEnszbsivnTkBYiUvqaTNy
 uYPkuPmUx7uyC9Tn7maVJsPmaO1frokLSWBiD0ZqWdCNH1aI2s7kfvrNRYsHwNHJ6vej
 zTsg1a/HComSyz14czQJDeyFMLHVgqwJsI2tvGu1dWWgIjnlNdMv5IAaZz5W5xXeujwG
 zB/w==
X-Gm-Message-State: AOAM531bDnvC0rS+XSDBzNviBLdJp2ZGKKt/vP6KHMbbembYVZMTP7Y4
 cl6TOwdfIG8KCjYE4ms9eoiGj/b32LpjBVrIaCE=
X-Google-Smtp-Source: ABdhPJzBZeAY6ZmYHy1Dc6gTOZ7RSlwDNfnp5lQvha3xYk2O0bdK8feva8M24as3g4U7a9nAQxthdCB6Bkc3R4Fm6SA=
X-Received: by 2002:a02:9083:: with SMTP id x3mr3826602jaf.17.1615656141880;
 Sat, 13 Mar 2021 09:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-8-f4bug@amsat.org>
In-Reply-To: <20210313165445.2113938-8-f4bug@amsat.org>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Sat, 13 Mar 2021 22:51:55 +0530
Message-ID: <CAN6ztm_kaTkbBK7=ALMmMSmShzuOx=S2vUBy2N1D-P__T9um2A@mail.gmail.com>
Subject: Re: [PATCH 07/11] hw/gpio/avr_gpio: Add tracing for reads and writes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006a809305bd6e42db"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd2c.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006a809305bd6e42db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Niteesh G S <niteesh.gs@gmail.com>

On Sat, Mar 13, 2021 at 10:25 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> From: G S Niteesh Babu <niteesh.gs@gmail.com>
>
> Added tracing for gpio read, write, and update output irq.
>
> 1) trace_avr_gpio_update_ouput_irq
> 2) trace_avr_gpio_read
> 3) trace_avr_gpio_write
>
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
> Message-Id: <20210311135539.10206-3-niteesh.gs@gmail.com>
> [PMD: Added port_name(), display port name in trace events]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/gpio/avr_gpio.c   | 26 +++++++++++++++++++++-----
>  hw/gpio/trace-events |  5 +++++
>  2 files changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c
> index e4c7122e62c..29252d6ccfe 100644
> --- a/hw/gpio/avr_gpio.c
> +++ b/hw/gpio/avr_gpio.c
> @@ -2,6 +2,7 @@
>   * AVR processors GPIO registers emulation.
>   *
>   * Copyright (C) 2020 Heecheol Yang <heecheol.yang@outlook.com>
> + * Copyright (C) 2021 Niteesh Babu G S <niteesh.gs@gmail.com>
>   *
>   * This program is free software; you can redistribute it and/or
>   * modify it under the terms of the GNU General Public License as
> @@ -26,6 +27,12 @@
>  #include "hw/gpio/avr_gpio.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static char port_name(AVRGPIOState *s)
> +{
> +    return 'A' + s->id;
> +}
>
>  static void avr_gpio_reset(DeviceState *dev)
>  {
> @@ -47,32 +54,41 @@ static void avr_gpio_write_port(AVRGPIOState *s,
> uint64_t value)
>
>          if (cur_ddr_pin_val && (cur_port_pin_val !=3D new_port_pin_val))=
 {
>              qemu_set_irq(s->out[pin], new_port_pin_val);
> +            trace_avr_gpio_update_output_irq(port_name(s), pin,
> new_port_pin_val);
>          }
>      }
>      s->reg.port =3D value & s->reg.ddr;
>  }
>  static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned int
> size)
>  {
> +    uint8_t val =3D 0;
>      AVRGPIOState *s =3D (AVRGPIOState *)opaque;
>      switch (offset) {
>      case GPIO_PIN:
> -        return s->reg.pin;
> +        val =3D s->reg.pin;
> +        break;
>      case GPIO_DDR:
> -        return s->reg.ddr;
> +        val =3D s->reg.ddr;
> +        break;
>      case GPIO_PORT:
> -        return s->reg.port;
> +        val =3D s->reg.port;
> +        break;
>      default:
>          g_assert_not_reached();
>          break;
>      }
> -    return 0;
> +
> +    trace_avr_gpio_read(port_name(s), offset, val);
> +    return val;
>  }
>
>  static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t value,
>                                  unsigned int size)
>  {
>      AVRGPIOState *s =3D (AVRGPIOState *)opaque;
> -    value =3D value & 0xF;
> +    value =3D value & 0xFF;
> +
> +    trace_avr_gpio_write(port_name(s), offset, value);
>      switch (offset) {
>      case GPIO_PIN:
>          s->reg.pin =3D value;
> diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
> index 46ab9323bd0..640834597a8 100644
> --- a/hw/gpio/trace-events
> +++ b/hw/gpio/trace-events
> @@ -18,3 +18,8 @@ sifive_gpio_read(uint64_t offset, uint64_t r) "offset
> 0x%" PRIx64 " value 0x%" P
>  sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 "
> value 0x%" PRIx64
>  sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %"
> PRIi64
>  sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %"
> PRIi64 " value %" PRIi64
> +
> +# avr_gpio.c
> +avr_gpio_read(unsigned id, uint64_t offset, uint64_t r) "port %c offset
> 0x%" PRIx64 " value 0x%" PRIx64
> +avr_gpio_write(unsigned id, uint64_t offset, uint64_t value) "port %c
> offset 0x%" PRIx64 " value 0x%" PRIx64
> +avr_gpio_update_output_irq(unsigned id, int64_t line, int64_t value)
> "port %c pin %" PRIi64 " value %" PRIi64
> --
> 2.26.2
>
>

--0000000000006a809305bd6e42db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Rev=
iewed-by: Niteesh G S &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.g=
s@gmail.com</a>&gt;<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Mar 13, 2021 at 10:25 PM Philippe Mat=
hieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_bl=
ank">niteesh.gs@gmail.com</a>&gt;<br>
<br>
Added tracing for gpio read, write, and update output irq.<br>
<br>
1) trace_avr_gpio_update_ouput_irq<br>
2) trace_avr_gpio_read<br>
3) trace_avr_gpio_write<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@gmail.com" target=
=3D"_blank">mrolnik@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210311135539.10206-3-niteesh.gs@gmail.c=
om" target=3D"_blank">20210311135539.10206-3-niteesh.gs@gmail.com</a>&gt;<b=
r>
[PMD: Added port_name(), display port name in trace events]<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0hw/gpio/avr_gpio.c=C2=A0 =C2=A0| 26 +++++++++++++++++++++-----<br>
=C2=A0hw/gpio/trace-events |=C2=A0 5 +++++<br>
=C2=A02 files changed, 26 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/gpio/avr_gpio.c b/hw/gpio/avr_gpio.c<br>
index e4c7122e62c..29252d6ccfe 100644<br>
--- a/hw/gpio/avr_gpio.c<br>
+++ b/hw/gpio/avr_gpio.c<br>
@@ -2,6 +2,7 @@<br>
=C2=A0 * AVR processors GPIO registers emulation.<br>
=C2=A0 *<br>
=C2=A0 * Copyright (C) 2020 Heecheol Yang &lt;<a href=3D"mailto:heecheol.ya=
ng@outlook.com" target=3D"_blank">heecheol.yang@outlook.com</a>&gt;<br>
+ * Copyright (C) 2021 Niteesh Babu G S &lt;<a href=3D"mailto:niteesh.gs@gm=
ail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
=C2=A0 *<br>
=C2=A0 * This program is free software; you can redistribute it and/or<br>
=C2=A0 * modify it under the terms of the GNU General Public License as<br>
@@ -26,6 +27,12 @@<br>
=C2=A0#include &quot;hw/gpio/avr_gpio.h&quot;<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+static char port_name(AVRGPIOState *s)<br>
+{<br>
+=C2=A0 =C2=A0 return &#39;A&#39; + s-&gt;id;<br>
+}<br>
<br>
=C2=A0static void avr_gpio_reset(DeviceState *dev)<br>
=C2=A0{<br>
@@ -47,32 +54,41 @@ static void avr_gpio_write_port(AVRGPIOState *s, uint64=
_t value)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cur_ddr_pin_val &amp;&amp; (cur_port_=
pin_val !=3D new_port_pin_val)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_set_irq(s-&gt;out[pin]=
, new_port_pin_val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_avr_gpio_update_output_irq=
(port_name(s), pin, new_port_pin_val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;reg.port =3D value &amp; s-&gt;reg.ddr;<br>
=C2=A0}<br>
=C2=A0static uint64_t avr_gpio_read(void *opaque, hwaddr offset, unsigned i=
nt size)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 uint8_t val =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0AVRGPIOState *s =3D (AVRGPIOState *)opaque;<br>
=C2=A0 =C2=A0 =C2=A0switch (offset) {<br>
=C2=A0 =C2=A0 =C2=A0case GPIO_PIN:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;reg.pin;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;reg.pin;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0case GPIO_DDR:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;reg.ddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;reg.ddr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0case GPIO_PORT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;reg.port;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;reg.port;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 return 0;<br>
+<br>
+=C2=A0 =C2=A0 trace_avr_gpio_read(port_name(s), offset, val);<br>
+=C2=A0 =C2=A0 return val;<br>
=C2=A0}<br>
<br>
=C2=A0static void avr_gpio_write(void *opaque, hwaddr offset, uint64_t valu=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AVRGPIOState *s =3D (AVRGPIOState *)opaque;<br>
-=C2=A0 =C2=A0 value =3D value &amp; 0xF;<br>
+=C2=A0 =C2=A0 value =3D value &amp; 0xFF;<br>
+<br>
+=C2=A0 =C2=A0 trace_avr_gpio_write(port_name(s), offset, value);<br>
=C2=A0 =C2=A0 =C2=A0switch (offset) {<br>
=C2=A0 =C2=A0 =C2=A0case GPIO_PIN:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;reg.pin =3D value;<br>
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events<br>
index 46ab9323bd0..640834597a8 100644<br>
--- a/hw/gpio/trace-events<br>
+++ b/hw/gpio/trace-events<br>
@@ -18,3 +18,8 @@ sifive_gpio_read(uint64_t offset, uint64_t r) &quot;offse=
t 0x%&quot; PRIx64 &quot; value 0x%&quot; P<br>
=C2=A0sifive_gpio_write(uint64_t offset, uint64_t value) &quot;offset 0x%&q=
uot; PRIx64 &quot; value 0x%&quot; PRIx64<br>
=C2=A0sifive_gpio_set(int64_t line, int64_t value) &quot;line %&quot; PRIi6=
4 &quot; value %&quot; PRIi64<br>
=C2=A0sifive_gpio_update_output_irq(int64_t line, int64_t value) &quot;line=
 %&quot; PRIi64 &quot; value %&quot; PRIi64<br>
+<br>
+# avr_gpio.c<br>
+avr_gpio_read(unsigned id, uint64_t offset, uint64_t r) &quot;port %c offs=
et 0x%&quot; PRIx64 &quot; value 0x%&quot; PRIx64<br>
+avr_gpio_write(unsigned id, uint64_t offset, uint64_t value) &quot;port %c=
 offset 0x%&quot; PRIx64 &quot; value 0x%&quot; PRIx64<br>
+avr_gpio_update_output_irq(unsigned id, int64_t line, int64_t value) &quot=
;port %c pin %&quot; PRIi64 &quot; value %&quot; PRIi64<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div>

--0000000000006a809305bd6e42db--

