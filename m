Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CEF2DEFFE
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 15:27:04 +0100 (CET)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqdCJ-0003ss-Hn
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 09:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1kqdAS-000327-Q8
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 09:25:09 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1kqdAQ-0000eZ-IF
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 09:25:08 -0500
Received: by mail-qv1-xf34.google.com with SMTP id a4so2055632qvd.12
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U6R+D7HvrEmNvQsAbsurPQ8PG0AZSaTodOUUSRyCfzQ=;
 b=eoUVKNylTT748xHvjraAmbVl4mZEb3QEgBVvKjYRLTgf+uY3i/Xv6GZC08xjOwww9V
 PSGAsho5kahBp6jXV3pvzL8mGxKxQRJMp8397s6EE9aMSAoon7rsD8XOXdMoHxKMBBOj
 COUXR4D14IzJO5wONpw3j9NZvRMR5wB9dhz6U87OzJPWuZD17Hk88vgmSXbxJ++cIg+f
 Bqd1XUcp1G1UBIfXv47XQuAUbiy98ozr02HlqA2eWObnsbdYsnDrgxZAsfnaYR2+TiH8
 N4WQe1tJQ8qa2Ojdq0oHy+q89VG7PzzM6Mb60XPjmHSzjHfq/XN1UdgxYs3fcQ1uqOjY
 6SOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6R+D7HvrEmNvQsAbsurPQ8PG0AZSaTodOUUSRyCfzQ=;
 b=jTBMAcr6GZRToGdxfIFm+cGPwAh4Pw01+ohLYpQix9eLYXm8N2T7PGiejOc/knASVG
 UUMSvfq2hTF1T/Ktmuo1rTNHzVjk63gCc2dQI733hoe0Yxvoepna18IJozAiwkwzB19z
 Vlp42O7WfJlzcwy9dw3IY7Wzlkgj7MV6OXLuGdsVhDyeMgL388h3fqCZxvl2rGCkl5RY
 bZM9T7EIXot17aixe2QbG7/gS8PFtdV84yIDuFSjxaOYp26MA/y/Oe9oNR9JYDAm7qRM
 X+5lcw7tzAGSw/lq293fko2JwrvYUbK4791huEnOiamz7iFxF2jxmyxECg2VRjJMTCMc
 RV8w==
X-Gm-Message-State: AOAM531buNTWHM8jN3UQaU33MP8RkBLTBN9mV6koWB92W0Rc8kh8Sa5/
 oAgWiUuR+zIw0DT8as1x30UsG45tn2Gw3D3HpcQ=
X-Google-Smtp-Source: ABdhPJygPvhyapvS8EoqHLYetFEMx/Bx/EN6dEdDnyo/bs6BkZNeFeZLNpWo5Bf6BJ2xctlJyE/GYeF3sp71/FdpAKY=
X-Received: by 2002:a0c:83e1:: with SMTP id k88mr9896582qva.60.1608387905191; 
 Sat, 19 Dec 2020 06:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20201219111934.5540-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20201219111934.5540-1-mark.cave-ayland@ilande.co.uk>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Sat, 19 Dec 2020 15:24:52 +0100
Message-ID: <CAAM0arO18dtN6UHUxdKkgR6AeE8zrcm28smP6ctGe_ReqrMOtA@mail.gmail.com>
Subject: Re: [PATCH] sun4m: don't connect two qemu_irqs directly to the same
 input
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: multipart/alternative; boundary="000000000000c003ba05b6d1fd21"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=a.tarasenko@gmail.com; helo=mail-qv1-xf34.google.com
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c003ba05b6d1fd21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 19 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3., 12:19 Mark Cave-Ayland <=
mark.cave-ayland@ilande.co.uk>:

> The sun4m board code connects both of the IRQ outputs of each ESCC to the
> same slavio input qemu_irq. Connecting two qemu_irqs outputs directly to
> the
> same input is not valid as it produces subtly wrong behaviour (for instan=
ce
> if both the IRQ lines are high, and then one goes low, the PIC input will
> see
> this as a high-to-low transition even though the second IRQ line should
> still
> be holding it high).
>
> This kind of wiring needs an explicitly created OR gate; add one.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>

Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

---
>  hw/sparc/Kconfig |  1 +
>  hw/sparc/sun4m.c | 23 ++++++++++++++++++-----
>  2 files changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig
> index 91805afab6..8dcb10086f 100644
> --- a/hw/sparc/Kconfig
> +++ b/hw/sparc/Kconfig
> @@ -14,6 +14,7 @@ config SUN4M
>      select M48T59
>      select STP2000
>      select CHRP_NVRAM
> +    select OR_IRQ
>
>  config LEON3
>      bool
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 8686371318..c06c43be18 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -50,6 +50,7 @@
>  #include "hw/misc/empty_slot.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/irq.h"
> +#include "hw/or-irq.h"
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "trace.h"
> @@ -848,7 +849,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef
> *hwdef,
>      uint32_t initrd_size;
>      DriveInfo *fd[MAX_FD];
>      FWCfgState *fw_cfg;
> -    DeviceState *dev;
> +    DeviceState *dev, *ms_kb_orgate, *serial_orgate;
>      SysBusDevice *s;
>      unsigned int smp_cpus =3D machine->smp.cpus;
>      unsigned int max_cpus =3D machine->smp.max_cpus;
> @@ -994,10 +995,16 @@ static void sun4m_hw_init(const struct sun4m_hwdef
> *hwdef,
>      qdev_prop_set_uint32(dev, "chnAtype", escc_kbd);
>      s =3D SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_connect_irq(s, 0, slavio_irq[14]);
> -    sysbus_connect_irq(s, 1, slavio_irq[14]);
>      sysbus_mmio_map(s, 0, hwdef->ms_kb_base);
>
> +    /* Logically OR both its IRQs together */
> +    ms_kb_orgate =3D DEVICE(object_new(TYPE_OR_IRQ));
> +    object_property_set_int(OBJECT(ms_kb_orgate), "num-lines", 2,
> &error_fatal);
> +    qdev_realize_and_unref(ms_kb_orgate, NULL, &error_fatal);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(ms_kb_orgate, 0));
> +    sysbus_connect_irq(s, 1, qdev_get_gpio_in(ms_kb_orgate, 1));
> +    qdev_connect_gpio_out(DEVICE(ms_kb_orgate), 0, slavio_irq[14]);
> +
>      dev =3D qdev_new(TYPE_ESCC);
>      qdev_prop_set_uint32(dev, "disabled", 0);
>      qdev_prop_set_uint32(dev, "frequency", ESCC_CLOCK);
> @@ -1009,10 +1016,16 @@ static void sun4m_hw_init(const struct sun4m_hwde=
f
> *hwdef,
>
>      s =3D SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
> -    sysbus_connect_irq(s, 0, slavio_irq[15]);
> -    sysbus_connect_irq(s, 1,  slavio_irq[15]);
>      sysbus_mmio_map(s, 0, hwdef->serial_base);
>
> +    /* Logically OR both its IRQs together */
> +    serial_orgate =3D DEVICE(object_new(TYPE_OR_IRQ));
> +    object_property_set_int(OBJECT(serial_orgate), "num-lines", 2,
> &error_fatal);
> +    qdev_realize_and_unref(serial_orgate, NULL, &error_fatal);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in(serial_orgate, 0));
> +    sysbus_connect_irq(s, 1, qdev_get_gpio_in(serial_orgate, 1));
> +    qdev_connect_gpio_out(DEVICE(serial_orgate), 0, slavio_irq[15]);
> +
>      if (hwdef->apc_base) {
>          apc_init(hwdef->apc_base, qemu_allocate_irq(cpu_halt_signal,
> NULL, 0));
>      }
> --
> 2.20.1
>
>

--000000000000c003ba05b6d1fd21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=81=D0=B1, 19 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3., 12:=
19 Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">ma=
rk.cave-ayland@ilande.co.uk</a>&gt;:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">The sun4m board code connects both of the IRQ outputs of each ESCC to the=
<br>
same slavio input qemu_irq. Connecting two qemu_irqs outputs directly to th=
e<br>
same input is not valid as it produces subtly wrong behaviour (for instance=
<br>
if both the IRQ lines are high, and then one goes low, the PIC input will s=
ee<br>
this as a high-to-low transition even though the second IRQ line should sti=
ll<br>
be holding it high).<br>
<br>
This kind of wiring needs an explicitly created OR gate; add one.<br>
<br>
Signed-off-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilan=
de.co.uk" target=3D"_blank" rel=3D"noreferrer">mark.cave-ayland@ilande.co.u=
k</a>&gt;<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Reviewed-by: Artyom Tarasenko &lt;<a href=3D"mailto:atar4qemu@gma=
il.com">atar4qemu@gmail.com</a>&gt;</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0hw/sparc/Kconfig |=C2=A0 1 +<br>
=C2=A0hw/sparc/sun4m.c | 23 ++++++++++++++++++-----<br>
=C2=A02 files changed, 19 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/sparc/Kconfig b/hw/sparc/Kconfig<br>
index 91805afab6..8dcb10086f 100644<br>
--- a/hw/sparc/Kconfig<br>
+++ b/hw/sparc/Kconfig<br>
@@ -14,6 +14,7 @@ config SUN4M<br>
=C2=A0 =C2=A0 =C2=A0select M48T59<br>
=C2=A0 =C2=A0 =C2=A0select STP2000<br>
=C2=A0 =C2=A0 =C2=A0select CHRP_NVRAM<br>
+=C2=A0 =C2=A0 select OR_IRQ<br>
<br>
=C2=A0config LEON3<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c<br>
index 8686371318..c06c43be18 100644<br>
--- a/hw/sparc/sun4m.c<br>
+++ b/hw/sparc/sun4m.c<br>
@@ -50,6 +50,7 @@<br>
=C2=A0#include &quot;hw/misc/empty_slot.h&quot;<br>
=C2=A0#include &quot;hw/misc/unimp.h&quot;<br>
=C2=A0#include &quot;hw/irq.h&quot;<br>
+#include &quot;hw/or-irq.h&quot;<br>
=C2=A0#include &quot;hw/loader.h&quot;<br>
=C2=A0#include &quot;elf.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
@@ -848,7 +849,7 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwd=
ef,<br>
=C2=A0 =C2=A0 =C2=A0uint32_t initrd_size;<br>
=C2=A0 =C2=A0 =C2=A0DriveInfo *fd[MAX_FD];<br>
=C2=A0 =C2=A0 =C2=A0FWCfgState *fw_cfg;<br>
-=C2=A0 =C2=A0 DeviceState *dev;<br>
+=C2=A0 =C2=A0 DeviceState *dev, *ms_kb_orgate, *serial_orgate;<br>
=C2=A0 =C2=A0 =C2=A0SysBusDevice *s;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int smp_cpus =3D machine-&gt;smp.cpus;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int max_cpus =3D machine-&gt;smp.max_cpus;<br>
@@ -994,10 +995,16 @@ static void sun4m_hw_init(const struct sun4m_hwdef *h=
wdef,<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint32(dev, &quot;chnAtype&quot;, escc_kb=
d);<br>
=C2=A0 =C2=A0 =C2=A0s =3D SYS_BUS_DEVICE(dev);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize_and_unref(s, &amp;error_fatal);<br>
-=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, slavio_irq[14]);<br>
-=C2=A0 =C2=A0 sysbus_connect_irq(s, 1, slavio_irq[14]);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(s, 0, hwdef-&gt;ms_kb_base);<br>
<br>
+=C2=A0 =C2=A0 /* Logically OR both its IRQs together */<br>
+=C2=A0 =C2=A0 ms_kb_orgate =3D DEVICE(object_new(TYPE_OR_IRQ));<br>
+=C2=A0 =C2=A0 object_property_set_int(OBJECT(ms_kb_orgate), &quot;num-line=
s&quot;, 2, &amp;error_fatal);<br>
+=C2=A0 =C2=A0 qdev_realize_and_unref(ms_kb_orgate, NULL, &amp;error_fatal)=
;<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, qdev_get_gpio_in(ms_kb_orgate, 0));=
<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(s, 1, qdev_get_gpio_in(ms_kb_orgate, 1));=
<br>
+=C2=A0 =C2=A0 qdev_connect_gpio_out(DEVICE(ms_kb_orgate), 0, slavio_irq[14=
]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0dev =3D qdev_new(TYPE_ESCC);<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint32(dev, &quot;disabled&quot;, 0);<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint32(dev, &quot;frequency&quot;, ESCC_C=
LOCK);<br>
@@ -1009,10 +1016,16 @@ static void sun4m_hw_init(const struct sun4m_hwdef =
*hwdef,<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D SYS_BUS_DEVICE(dev);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize_and_unref(s, &amp;error_fatal);<br>
-=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, slavio_irq[15]);<br>
-=C2=A0 =C2=A0 sysbus_connect_irq(s, 1,=C2=A0 slavio_irq[15]);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(s, 0, hwdef-&gt;serial_base);<br>
<br>
+=C2=A0 =C2=A0 /* Logically OR both its IRQs together */<br>
+=C2=A0 =C2=A0 serial_orgate =3D DEVICE(object_new(TYPE_OR_IRQ));<br>
+=C2=A0 =C2=A0 object_property_set_int(OBJECT(serial_orgate), &quot;num-lin=
es&quot;, 2, &amp;error_fatal);<br>
+=C2=A0 =C2=A0 qdev_realize_and_unref(serial_orgate, NULL, &amp;error_fatal=
);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, qdev_get_gpio_in(serial_orgate, 0))=
;<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(s, 1, qdev_get_gpio_in(serial_orgate, 1))=
;<br>
+=C2=A0 =C2=A0 qdev_connect_gpio_out(DEVICE(serial_orgate), 0, slavio_irq[1=
5]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (hwdef-&gt;apc_base) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apc_init(hwdef-&gt;apc_base, qemu_allocat=
e_irq(cpu_halt_signal, NULL, 0));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div></div></div>

--000000000000c003ba05b6d1fd21--

