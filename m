Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC576BA15E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 22:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcC5G-00057P-60; Tue, 14 Mar 2023 17:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pcC5E-00056S-E7; Tue, 14 Mar 2023 17:21:24 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pcC5C-0006RJ-Af; Tue, 14 Mar 2023 17:21:24 -0400
Received: by mail-yb1-xb32.google.com with SMTP id u32so10441528ybi.6;
 Tue, 14 Mar 2023 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678828881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hPSe8wAnasgXcJt0a+IX++PvDOBjjq53mtsKqAOleOM=;
 b=iekB6tNedXaoIBQSIxFwNfGzlPQCnQRnD5VhL85/u3aVg9yzUEvFmXZAulSUgEE42V
 sskK9dwKOXMfnLuC7nwKz91/FFvMQHKFX2/V4VstcgqsUpn8e03lnUX+3JcrccF1sOr0
 RgavT1otodnuGSd4Tj+GASd3RrVQDKqQaV1W30dWdR5/cnc2DOgZnUz7Oo4IP0OsRVDW
 gXqAsYPq8+A0Ke9gIEmfwx3mFcXp5cQOOXKv0xv/v1Lsw3NzYI1Te3vtWpwqCDyAJU6F
 uhbCiPIkzmpl2x8i+havWulHJWWA6/ItsYoipKFcgfMBoHX3sI3+LMtvAfksH4y7Jihs
 YwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678828881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hPSe8wAnasgXcJt0a+IX++PvDOBjjq53mtsKqAOleOM=;
 b=B82IfYtcEdsePQ8O4q3VHNot/idBXGqqZCvY6JVxYJeXE70RpSei0472ZQeKBrUrb/
 mAzvlItWoCLNnrZus3kwfO+oFllZC3k8GNMZ3P5D8HhHDBfyYKSo00ujGq01Gve+PWja
 gZmAzMULC5uhq7di8esNP3LV0xF4SB5Gx8gtSvMg/5WPTpkL2HxvSEYxBcHXtWr/UIUw
 lsKhDnVAOkUqHGt3/CXCtT05ToNSxqsTmGnNF6OZhgK1DwmuoypW61YmA+ocEwsjrCyj
 rhziANna9qzHxS4nItCME7MFK2fULSxevOdyXSY2uXwPRt7gEl0MkUP5imB+i5zWrNQn
 A9zQ==
X-Gm-Message-State: AO0yUKWxVKLKq5l4aAR0Jy/SCEPRrEZwqqX19GCwsg7+Nrvub1X1FV4e
 NdrcFd0q7e29onx9ji1kzg+U6uirglOZDLYNvMA=
X-Google-Smtp-Source: AK7set/cJ9FPnvZWI5qx1K1ca8bJv6oZEDrF7w/AgrZPaDWBBxK1LugvTNWjRMdCWViPROQKfccjwL42IuB5qDKSvAQ=
X-Received: by 2002:a25:928c:0:b0:a53:5825:f25b with SMTP id
 y12-20020a25928c000000b00a535825f25bmr24557479ybl.0.1678828879956; Tue, 14
 Mar 2023 14:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
 <20230311144111.30468-3-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20230311144111.30468-3-strahinja.p.jankovic@gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 14 Mar 2023 22:21:08 +0100
Message-ID: <CAPan3Wp0ExihSkk64RFPAS0iw-FoTt2qFZMm=sQ04jr4jTiRMA@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/arm: Add WDT to Allwinner-A10 and Cubieboard
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000074ef805f6e2cfff"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb32.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000074ef805f6e2cfff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Strahinja,


On Sat, Mar 11, 2023 at 3:42=E2=80=AFPM Strahinja Jankovic <
strahinjapjankovic@gmail.com> wrote:

> This patch adds WDT to Allwinner-A10 and Cubieboard.
> WDT is added as an overlay to the Timer module memory map.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  docs/system/arm/cubieboard.rst | 1 +
>  hw/arm/Kconfig                 | 1 +
>  hw/arm/allwinner-a10.c         | 7 +++++++
>  include/hw/arm/allwinner-a10.h | 2 ++
>  4 files changed, 11 insertions(+)
>
> diff --git a/docs/system/arm/cubieboard.rst
> b/docs/system/arm/cubieboard.rst
> index 8d485f5435..58c4a2d3ea 100644
> --- a/docs/system/arm/cubieboard.rst
> +++ b/docs/system/arm/cubieboard.rst
> @@ -15,3 +15,4 @@ Emulated devices:
>  - USB controller
>  - SATA controller
>  - TWI (I2C) controller
> +- Watchdog timer
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b5aed4aff5..ec15248536 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -325,6 +325,7 @@ config ALLWINNER_A10
>      select ALLWINNER_A10_PIC
>      select ALLWINNER_A10_CCM
>      select ALLWINNER_A10_DRAMC
> +    select ALLWINNER_WDT
>      select ALLWINNER_EMAC
>      select ALLWINNER_I2C
>      select AXP209_PMU
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index b7ca795c71..b0ea3f7f66 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -38,6 +38,7 @@
>  #define AW_A10_EHCI_BASE        0x01c14000
>  #define AW_A10_OHCI_BASE        0x01c14400
>  #define AW_A10_SATA_BASE        0x01c18000
> +#define AW_A10_WDT_BASE         0x01c20c90
>

Unfortunately I couldn't find any details about the watchdog in the
Allwinner A10 datasheet "A10_Datasheet.pdf", except for a very brief
summary in chapter 9.1 in the Timer Controller. But I did find that linux
is using this same base address and registers with the shared driver code
in drivers/watchdog/sunxi_wdt.c.

Looks good to me.

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>


>  #define AW_A10_RTC_BASE         0x01c20d00
>  #define AW_A10_I2C0_BASE        0x01c2ac00
>
> @@ -92,6 +93,8 @@ static void aw_a10_init(Object *obj)
>      object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN4I)=
;
>
>      object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN4I);
> +
> +    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN4I);
>  }
>
>  static void aw_a10_realize(DeviceState *dev, Error **errp)
> @@ -203,6 +206,10 @@ static void aw_a10_realize(DeviceState *dev, Error
> **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, AW_A10_I2C0_BASE);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0, qdev_get_gpio_in(dev=
,
> 7));
> +
> +    /* WDT */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0, AW_A10_WDT_BASE,
> 1);
>  }
>
>  static void aw_a10_class_init(ObjectClass *oc, void *data)
> diff --git a/include/hw/arm/allwinner-a10.h
> b/include/hw/arm/allwinner-a10.h
> index 095afb225d..cd1465c613 100644
> --- a/include/hw/arm/allwinner-a10.h
> +++ b/include/hw/arm/allwinner-a10.h
> @@ -13,6 +13,7 @@
>  #include "hw/misc/allwinner-a10-ccm.h"
>  #include "hw/misc/allwinner-a10-dramc.h"
>  #include "hw/i2c/allwinner-i2c.h"
> +#include "hw/watchdog/allwinner-wdt.h"
>  #include "sysemu/block-backend.h"
>
>  #include "target/arm/cpu.h"
> @@ -41,6 +42,7 @@ struct AwA10State {
>      AwSdHostState mmc0;
>      AWI2CState i2c0;
>      AwRtcState rtc;
> +    AwWdtState wdt;
>      MemoryRegion sram_a;
>      EHCISysBusState ehci[AW_A10_NUM_USB];
>      OHCISysBusState ohci[AW_A10_NUM_USB];
> --
> 2.30.2
>
>

--=20
Niek Linnenbank

--000000000000074ef805f6e2cfff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Strahinja,</div><br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 1=
1, 2023 at 3:42=E2=80=AFPM Strahinja Jankovic &lt;<a href=3D"mailto:strahin=
japjankovic@gmail.com">strahinjapjankovic@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">This patch adds WDT to A=
llwinner-A10 and Cubieboard.<br>
WDT is added as an overlay to the Timer module memory map.<br>
<br>
Signed-off-by: Strahinja Jankovic &lt;<a href=3D"mailto:strahinja.p.jankovi=
c@gmail.com" target=3D"_blank">strahinja.p.jankovic@gmail.com</a>&gt;<br>
---<br>
=C2=A0docs/system/arm/cubieboard.rst | 1 +<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 +<br>
=C2=A0hw/arm/allwinner-a10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++<b=
r>
=C2=A0include/hw/arm/allwinner-a10.h | 2 ++<br>
=C2=A04 files changed, 11 insertions(+)<br>
<br>
diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rs=
t<br>
index 8d485f5435..58c4a2d3ea 100644<br>
--- a/docs/system/arm/cubieboard.rst<br>
+++ b/docs/system/arm/cubieboard.rst<br>
@@ -15,3 +15,4 @@ Emulated devices:<br>
=C2=A0- USB controller<br>
=C2=A0- SATA controller<br>
=C2=A0- TWI (I2C) controller<br>
+- Watchdog timer<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index b5aed4aff5..ec15248536 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -325,6 +325,7 @@ config ALLWINNER_A10<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_PIC<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_CCM<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_A10_DRAMC<br>
+=C2=A0 =C2=A0 select ALLWINNER_WDT<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_EMAC<br>
=C2=A0 =C2=A0 =C2=A0select ALLWINNER_I2C<br>
=C2=A0 =C2=A0 =C2=A0select AXP209_PMU<br>
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c<br>
index b7ca795c71..b0ea3f7f66 100644<br>
--- a/hw/arm/allwinner-a10.c<br>
+++ b/hw/arm/allwinner-a10.c<br>
@@ -38,6 +38,7 @@<br>
=C2=A0#define AW_A10_EHCI_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c14000<br>
=C2=A0#define AW_A10_OHCI_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c14400<br>
=C2=A0#define AW_A10_SATA_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c18000<br>
+#define AW_A10_WDT_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c20c90<br></b=
lockquote><div><br></div><div>Unfortunately I couldn&#39;t find any details=
 about the watchdog in the Allwinner A10 datasheet &quot;A10_Datasheet.pdf&=
quot;, except for a very brief</div><div>summary in chapter 9.1 in the Time=
r Controller. But I did find that linux is using this same base address and=
 registers with the shared driver code in drivers/watchdog/sunxi_wdt.c.</di=
v><div><br></div><div>Looks good to me.</div><div><br></div><div>Reviewed-b=
y: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinn=
enbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=C2=A0#define AW_A10_RTC_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01c20d00<b=
r>
=C2=A0#define AW_A10_I2C0_BASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x01c2ac00<br>
<br>
@@ -92,6 +93,8 @@ static void aw_a10_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;mmc0&quot;, &amp;s-&=
gt;mmc0, TYPE_AW_SDHOST_SUN4I);<br>
<br>
=C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;rtc&quot;, &amp;s-&g=
t;rtc, TYPE_AW_RTC_SUN4I);<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;wdt&quot;, &amp;s-&gt;wdt=
, TYPE_AW_WDT_SUN4I);<br>
=C2=A0}<br>
<br>
=C2=A0static void aw_a10_realize(DeviceState *dev, Error **errp)<br>
@@ -203,6 +206,10 @@ static void aw_a10_realize(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), &amp;er=
ror_fatal);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0, AW_=
A10_I2C0_BASE);<br>
=C2=A0 =C2=A0 =C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0, =
qdev_get_gpio_in(dev, 7));<br>
+<br>
+=C2=A0 =C2=A0 /* WDT */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;wdt), &amp;error_fa=
tal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&amp;s-&gt;wdt), 0, A=
W_A10_WDT_BASE, 1);<br>
=C2=A0}<br>
<br>
=C2=A0static void aw_a10_class_init(ObjectClass *oc, void *data)<br>
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.=
h<br>
index 095afb225d..cd1465c613 100644<br>
--- a/include/hw/arm/allwinner-a10.h<br>
+++ b/include/hw/arm/allwinner-a10.h<br>
@@ -13,6 +13,7 @@<br>
=C2=A0#include &quot;hw/misc/allwinner-a10-ccm.h&quot;<br>
=C2=A0#include &quot;hw/misc/allwinner-a10-dramc.h&quot;<br>
=C2=A0#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
+#include &quot;hw/watchdog/allwinner-wdt.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
@@ -41,6 +42,7 @@ struct AwA10State {<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState mmc0;<br>
=C2=A0 =C2=A0 =C2=A0AWI2CState i2c0;<br>
=C2=A0 =C2=A0 =C2=A0AwRtcState rtc;<br>
+=C2=A0 =C2=A0 AwWdtState wdt;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a;<br>
=C2=A0 =C2=A0 =C2=A0EHCISysBusState ehci[AW_A10_NUM_USB];<br>
=C2=A0 =C2=A0 =C2=A0OHCISysBusState ohci[AW_A10_NUM_USB];<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--000000000000074ef805f6e2cfff--

