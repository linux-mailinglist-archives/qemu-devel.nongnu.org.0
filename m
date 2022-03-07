Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423CE4D00DD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:14:46 +0100 (CET)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE8L-000564-Ci
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDu9-0007mj-Pq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:00:13 -0500
Received: from [2a00:1450:4864:20::534] (port=37509
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDu7-0001Ig-UV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:00:05 -0500
Received: by mail-ed1-x534.google.com with SMTP id q17so20041616edd.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=ZTaaOmD4U76L+EqcmL8RZj5WpgFMchQzUSXgiP4Zyrs=;
 b=g4ANE3tp8HmhFxMPSsZgn6vYxLdmuPRitbrqU3wanR8Vz4daUx1mp41LXCMTenqMlj
 NUlQowJE7QOpEn5iql/0Ncp5/gVHAYdhWZ7h8icAHjbCiCJQsVR51v4rNVedB1UPdpz7
 2kWB9TPnVMjkPHPGKRy54pJZTFFQgYjIH0KoKPGPLAUueHq8UsE1QfT6cTBruf1BhG5n
 XxWPg8qDHh2GUlQYbMrKTRRHbzz10mnlttG7p7oHC5iLqGCSn1xMjm/ZVSogpNqc87E2
 MeApr4sLRKanZyf/9wCQLZ6VaOlN/bt8JYRmVnt54If7xZunh4+2V2Uf2l9RHCtgA0xe
 jx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=ZTaaOmD4U76L+EqcmL8RZj5WpgFMchQzUSXgiP4Zyrs=;
 b=IgRmSY+h9+iIC7QMEFwPtsD1OIuNkfH7buBg4VlWo6grsI1hmUzCj3pN22/wwrttJy
 apscN5DSv2ThNBsVA5OjNKS0TyvYf8i12h0lHtBuUiihyX6GbyVKxr+l5dR+cfZYVu1/
 0Gi1RY6iqN0zDkF76l0bpsjGPl7Q1NUsHfnvbZvi36mXYnsbABROZ3R3CM0G6hbuJnrg
 p6C3bjpVwRvTDX1Gx4+kzWWYmDCAGqrqEhidXAiGTqllIb6UynikrZJ0x3w6l4wz55Gc
 iz17n3JvibWNU8XMP1VgujpnwPCk6EPi0HAcLS1XeGKMYZoWBCdl1GiFd+H9wzm7uhLS
 DP3g==
X-Gm-Message-State: AOAM533dt+RDCM3g6SRW5GKgRt8zbe0tw7Mun9p9GFsE2zhfXIoNW4Lm
 1fBbuitsmu/3VbOmff6E2fs=
X-Google-Smtp-Source: ABdhPJw9jFeiotue0nYg88hpdwinyoFxHVtgR4iTjarUQlYtWoJNztbWSjYVjKhZOBdB9rllTRg8zQ==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id
 x1-20020aa7cd81000000b00410d64eaa31mr11180103edv.167.1646661601420; 
 Mon, 07 Mar 2022 06:00:01 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 cy1-20020a0564021c8100b003e359e4f54asm6209825edb.43.2022.03.07.06.00.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 06:00:01 -0800 (PST)
Date: Mon, 07 Mar 2022 13:59:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 10/13] hw/input/pckbd: QOM'ify IRQ numbers
In-Reply-To: <20220307134353.1950-11-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-11-philippe.mathieu.daude@gmail.com>
Message-ID: <D94F12FD-7629-44D0-8588-6F9BC6C021D5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

Am 7=2E M=C3=A4rz 2022 13:43:50 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>Exposing the IRQ numbers as QOM properties not only allows them to be
>configurable but also to be printed by standard QOM mechanisms=2E This
>allows isabus_dev_print() to be retired eventually=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>Message-Id: <20220301220037=2E76555-4-shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> hw/input/pckbd=2Ec | 26 ++++++++++++++++++++++----
> 1 file changed, 22 insertions(+), 4 deletions(-)
>
>diff --git a/hw/input/pckbd=2Ec b/hw/input/pckbd=2Ec
>index baba62f357=2E=2Eeb77e12f6f 100644
>--- a/hw/input/pckbd=2Ec
>+++ b/hw/input/pckbd=2Ec
>@@ -26,6 +26,7 @@
> #include "qemu/error-report=2Eh"
> #include "qemu/log=2Eh"
> #include "qemu/timer=2Eh"
>+#include "qapi/error=2Eh"
> #include "hw/isa/isa=2Eh"
> #include "migration/vmstate=2Eh"
> #include "hw/acpi/aml-build=2Eh"
>@@ -671,6 +672,8 @@ struct ISAKBDState {
>     KBDState kbd;
>     bool kbd_throttle;
>     MemoryRegion io[2];
>+    uint8_t kbd_irq;
>+    uint8_t mouse_irq;
> };
>=20
> void i8042_isa_mouse_fake_event(ISAKBDState *isa)
>@@ -734,8 +737,20 @@ static void i8042_realizefn(DeviceState *dev, Error =
**errp)
>     ISAKBDState *isa_s =3D I8042(dev);
>     KBDState *s =3D &isa_s->kbd;
>=20
>-    isa_init_irq(isadev, &s->irq_kbd, 1);
>-    isa_init_irq(isadev, &s->irq_mouse, 12);
>+    if (isa_s->kbd_irq >=3D ISA_NUM_IRQS) {
>+        error_setg(errp, "Maximum value for \"kbd-irq\" is: %u",
>+                   ISA_NUM_IRQS - 1);
>+        return;
>+    }
>+
>+    if (isa_s->mouse_irq >=3D ISA_NUM_IRQS) {
>+        error_setg(errp, "Maximum value for \"mouse-irq\" is: %u",
>+                   ISA_NUM_IRQS - 1);
>+        return;
>+    }
>+
>+    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
>+    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
>=20
>     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
>     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
>@@ -754,6 +769,7 @@ static void i8042_realizefn(DeviceState *dev, Error *=
*errp)
>=20
> static void i8042_build_aml(ISADevice *isadev, Aml *scope)
> {
>+    ISAKBDState *isa_s =3D I8042(isadev);
>     Aml *kbd;
>     Aml *mou;
>     Aml *crs;
>@@ -761,7 +777,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *s=
cope)
>     crs =3D aml_resource_template();
>     aml_append(crs, aml_io(AML_DECODE16, 0x0060, 0x0060, 0x01, 0x01));
>     aml_append(crs, aml_io(AML_DECODE16, 0x0064, 0x0064, 0x01, 0x01));
>-    aml_append(crs, aml_irq_no_flags(1));
>+    aml_append(crs, aml_irq_no_flags(isa_s->kbd_irq));
>=20
>     kbd =3D aml_device("KBD");
>     aml_append(kbd, aml_name_decl("_HID", aml_eisaid("PNP0303")));
>@@ -769,7 +785,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *s=
cope)
>     aml_append(kbd, aml_name_decl("_CRS", crs));
>=20
>     crs =3D aml_resource_template();
>-    aml_append(crs, aml_irq_no_flags(12));
>+    aml_append(crs, aml_irq_no_flags(isa_s->mouse_irq));
>=20
>     mou =3D aml_device("MOU");
>     aml_append(mou, aml_name_decl("_HID", aml_eisaid("PNP0F13")));
>@@ -783,6 +799,8 @@ static void i8042_build_aml(ISADevice *isadev, Aml *s=
cope)
> static Property i8042_properties[] =3D {
>     DEFINE_PROP_BOOL("extended-state", ISAKBDState, kbd=2Eextended_state=
, true),
>     DEFINE_PROP_BOOL("kbd-throttle", ISAKBDState, kbd_throttle, false),
>+    DEFINE_PROP_UINT8("kbd-irq", ISAKBDState, kbd_irq, 1),
>+    DEFINE_PROP_UINT8("mouse-irq", ISAKBDState, mouse_irq, 12),
>     DEFINE_PROP_END_OF_LIST(),
> };
>=20

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>


