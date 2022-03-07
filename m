Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D14D00AB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:05:18 +0100 (CET)
Received: from localhost ([::1]:48858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDzB-00040m-Q5
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDsi-0006eI-G5
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:58:36 -0500
Received: from [2a00:1450:4864:20::62a] (port=43589
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDsg-00012T-Ov
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:58:36 -0500
Received: by mail-ej1-x62a.google.com with SMTP id d10so32089448eje.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=uNtE9f+O5cuVCwnZAFRoalUjRpC9TUlMrKBK/skdjns=;
 b=OYvcd8x7vi3yEwUEH+S/ZegKj/jWmcma5usppkQJBssFqx03pKIaGYn2Db7etIkFmV
 y7vOQr4piCoahK1HIdAgGr+159GbZMZcwP2C27iUhTuPYAeSsD3SmqC+wD4P0gKIcdNF
 9DTK/hKxo7woH1i507f9h+zeiZeid5TKv7Qm785vWzmmFtvlhRclPB3B5DQOqH3GEqM5
 S53sPM2D0V2XFapqfo8KrYx9dvT4NDXoGh1LjO3XUx2wIl5lNRtejw1cCq57gxRGstMF
 xrGFlt67YK+1N9VSiwGHAMMgE+aSsH3OqtisUOeYIR8sHUNGzSHO1RNBPAiZjtSoF22X
 ELDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=uNtE9f+O5cuVCwnZAFRoalUjRpC9TUlMrKBK/skdjns=;
 b=RVH3Vldxet0n+KHfb6I86r0RPc4b6sOzsAX5sqdzEdbqKGySDJvuOLydBh7ZoQ2hFl
 ZZWE1ygMC0NIS4GUDYCwOrCUO5OTezqA9CFPqeiikYw0cZN4XNTvxWfHiw7dirsUm+0n
 nxkypY7RzP8PcT2xG7RKN6b1Ki2byQYLcx1NNxcsXr9Opy1EYRuEpUtcWQ/BdYtYURSr
 jiP5yxAr2mlRFdHW36sFnqhVR4O++mue2L+CQzMtecmbneqTK6+ujPfdBW3YUd1uSFI5
 7AeUI2N9PJdcWG1bPq9Bxk6ph5AWq6uPw5OMMdWqFTnCiyLfIF+7ahG/j3I0z6DzJkMe
 q41g==
X-Gm-Message-State: AOAM532LDrp+3Wdz1z5pC8P8Lj5+Vfd74Dz7tm3ykruouvzQBfWnEhUD
 dulz+SU2/GADw58WMZciPYM=
X-Google-Smtp-Source: ABdhPJwlc7k+bGGGKqNS7yiM/DBFhIxzoof4RQQkqvPVKxZh+yi2uzVndlp6KOFhBXXJURpzcfXn6g==
X-Received: by 2002:a17:906:6547:b0:6bd:e2ad:8c82 with SMTP id
 u7-20020a170906654700b006bde2ad8c82mr9072214ejn.693.1646661508277; 
 Mon, 07 Mar 2022 05:58:28 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 o23-20020a170906861700b006da745f7233sm4727961ejx.5.2022.03.07.05.58.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 05:58:27 -0800 (PST)
Date: Mon, 07 Mar 2022 13:58:25 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 08/13] hw/rtc/mc146818rtc: QOM'ify IRQ number
In-Reply-To: <20220307134353.1950-9-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-9-philippe.mathieu.daude@gmail.com>
Message-ID: <656F546D-8A99-45A3-9278-D24A24B5AFEC@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 7=2E M=C3=A4rz 2022 13:43:48 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Exposing the IRQ number as a QOM property not only allows it to be
>configurable but also to be displayed in HMP:
>
>Before:
>
>(qemu) info qtree
>       =2E=2E=2E
>          dev: mc146818rtc, id ""
>            gpio-out "" 1
>            base_year =3D 0 (0x0)
>            lost_tick_policy =3D "discard"
>
>After:
>
>          dev: mc146818rtc, id ""
>            gpio-out "" 1
>            base_year =3D 0 (0x0)
>            irq =3D 8 (0x8)
>            lost_tick_policy =3D "discard"
>
>The reason the IRQ number didn's show up before is that this device does =
not
>call isa_init_irq()=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>Message-Id: <20220301220037=2E76555-2-shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> hw/isa/piix4=2Ec               |  2 +-
> hw/rtc/mc146818rtc=2Ec         | 13 +++++++++++--
> include/hw/rtc/mc146818rtc=2Eh |  1 +
> 3 files changed, 13 insertions(+), 3 deletions(-)
>
>diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>index f876c71750=2E=2Efc3c8b3fd1 100644
>--- a/hw/isa/piix4=2Ec
>+++ b/hw/isa/piix4=2Ec
>@@ -216,7 +216,7 @@ static void piix4_realize(PCIDevice *dev, Error **err=
p)
>     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
>         return;
>     }
>-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc=2Eirq, RTC_ISA_IRQ);
>+    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc=2Eirq, s->rtc=2Eisairq);
> }
>=20
> static void piix4_init(Object *obj)
>diff --git a/hw/rtc/mc146818rtc=2Ec b/hw/rtc/mc146818rtc=2Ec
>index ac9a60c90e=2E=2Ef235c2ddbe 100644
>--- a/hw/rtc/mc146818rtc=2Ec
>+++ b/hw/rtc/mc146818rtc=2Ec
>@@ -912,6 +912,11 @@ static void rtc_realizefn(DeviceState *dev, Error **=
errp)
>         s->base_year =3D 0;
>     }
>=20
>+    if (s->isairq >=3D ISA_NUM_IRQS) {
>+        error_setg(errp, "Maximum value for \"irq\" is: %u", ISA_NUM_IRQ=
S - 1);
>+        return;
>+    }
>+
>     rtc_set_date_from_host(isadev);
>=20
>     switch (s->lost_tick_policy) {
>@@ -957,15 +962,17 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_=
year, qemu_irq intercept_irq)
> {
>     DeviceState *dev;
>     ISADevice *isadev;
>+    RTCState *s;
>=20
>     isadev =3D isa_new(TYPE_MC146818_RTC);
>     dev =3D DEVICE(isadev);
>+    s =3D MC146818_RTC(isadev);
>     qdev_prop_set_int32(dev, "base_year", base_year);
>     isa_realize_and_unref(isadev, bus, &error_fatal);
>     if (intercept_irq) {
>         qdev_connect_gpio_out(dev, 0, intercept_irq);
>     } else {
>-        isa_connect_gpio_out(isadev, 0, RTC_ISA_IRQ);
>+        isa_connect_gpio_out(isadev, 0, s->isairq);
>     }
>=20
>     object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(isa=
dev),
>@@ -976,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_ye=
ar, qemu_irq intercept_irq)
>=20
> static Property mc146818rtc_properties[] =3D {
>     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
>+    DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
>     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
>                                lost_tick_policy, LOST_TICK_POLICY_DISCAR=
D),
>     DEFINE_PROP_END_OF_LIST(),
>@@ -1011,6 +1019,7 @@ static void rtc_reset_hold(Object *obj)
>=20
> static void rtc_build_aml(ISADevice *isadev, Aml *scope)
> {
>+    RTCState *s =3D MC146818_RTC(isadev);
>     Aml *dev;
>     Aml *crs;
>=20
>@@ -1021,7 +1030,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *s=
cope)
>     crs =3D aml_resource_template();
>     aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
>                            0x01, 0x08));
>-    aml_append(crs, aml_irq_no_flags(RTC_ISA_IRQ));
>+    aml_append(crs, aml_irq_no_flags(s->isairq));
>=20
>     dev =3D aml_device("RTC");
>     aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0B00")));
>diff --git a/include/hw/rtc/mc146818rtc=2Eh b/include/hw/rtc/mc146818rtc=
=2Eh
>index 5b45b22924=2E=2Edeef93f89a 100644
>--- a/include/hw/rtc/mc146818rtc=2Eh
>+++ b/include/hw/rtc/mc146818rtc=2Eh
>@@ -25,6 +25,7 @@ struct RTCState {
>     MemoryRegion coalesced_io;
>     uint8_t cmos_data[128];
>     uint8_t cmos_index;
>+    uint8_t isairq;
>     int32_t base_year;
>     uint64_t base_rtc;
>     uint64_t last_update;

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>


