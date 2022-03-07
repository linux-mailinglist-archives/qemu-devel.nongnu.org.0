Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1A4D00EC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:16:37 +0100 (CET)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREA8-00089T-CJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:16:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDuv-0008JB-8G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:00:53 -0500
Received: from [2a00:1450:4864:20::636] (port=41973
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nRDur-0001g1-1k
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:00:52 -0500
Received: by mail-ej1-x636.google.com with SMTP id a8so32122105ejc.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 06:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=4P8gGs11koLaLa8F3i2VlYO0DzhKoETPB0J3MKYHOMA=;
 b=LofSpF8+T5u8PL3yk571BYP8tjHbPyJqDD8FwiKaziG4k8eX1EGr9ySw/aqXxX2BUW
 /tlGWjz1+3olhTTZT53WW33b4vS97rRSbYRbF5Nf94ksM5tsBLNEgai5k+No6d4NJGiS
 nxMAVtkblFfntuu/vu9RRgTviRmqskY7iGRf1XoFEqJYinKHY7L5tjsr2zI0V7WGaUPm
 Xi7vEYc4Xa20Da4RuTAduQDynZsFctpqG7njQoZyLqKwNspSpXy/dbxasCVfVtQyLSBF
 EM9FQiT9Wl7TcKy2AnqH4zJu0rQjjnHVlBeoJqc8LFXpFiPCXphwMBg/UwAaxbrqcIu+
 2weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=4P8gGs11koLaLa8F3i2VlYO0DzhKoETPB0J3MKYHOMA=;
 b=eE96Fk5gd0HszhrTQxcya6G3MUykWBDvXNZUDDE5oT1X/IVbjAA6Zt7F+xaGYoiG7S
 /36DOVAnhw5QXHBJh+cXTubLyuizjIAUVUUqOPtUVWnbUOMygYUTTCMOM1opOa/kfuNo
 RiN3jKnO271lRv0clJilIN5QdiY54VIqhPuCTyPZyM2J8DoskAVa4Adzf17jMUkGPe1W
 SSSNQUWzYXuUVU45nismehkugwmZlSTyyeZcWp8jslzFnXssQjw1f5a6g0OWkFwEKK2L
 NKDE8Z9u3CzgSv8gk69fyBMFOJHcQIrAa/viO2dAKH8mlBQz9BU22o3ucAz38lzeUZNT
 bBfA==
X-Gm-Message-State: AOAM532wXyt894vPiARuY/QHB4IHUmZIQpVQGdxAXrzu+QD3/TkAPPXG
 YN4wHbUtMU7JkutMgP8exVU=
X-Google-Smtp-Source: ABdhPJxQkyA580PlidrifpQRZPsxHLa8DNJ7jSRTXLAa9m3CSC5ctClIkc1HLNju3xkbh0KgqAOe2Q==
X-Received: by 2002:a17:906:1e13:b0:6ce:e50c:2a9c with SMTP id
 g19-20020a1709061e1300b006cee50c2a9cmr9185141ejj.546.1646661646758; 
 Mon, 07 Mar 2022 06:00:46 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-143-092.89.12.pool.telefonica.de.
 [89.12.143.92]) by smtp.gmail.com with ESMTPSA id
 w12-20020a17090649cc00b006d0bee77b9asm4773947ejv.72.2022.03.07.06.00.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Mar 2022 06:00:46 -0800 (PST)
Date: Mon, 07 Mar 2022 14:00:43 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 11/13] hw/isa/isa-bus: Remove isabus_dev_print()
In-Reply-To: <20220307134353.1950-12-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-12-philippe.mathieu.daude@gmail.com>
Message-ID: <33A31839-55A7-4498-A07B-5473BCF77A3C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

Am 7=2E M=C3=A4rz 2022 13:43:51 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philippe=2Emathieu=2Edaude@gmail=2Ecom>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>All isabus_dev_print() did was to print up to two IRQ numbers per
>device=2E This is redundant if the IRQ numbers are present as QOM
>properties (see e=2Eg=2E the modified tests/qemu-iotests/172=2Eout)=2E
>
>Now that the last devices relying on isabus_dev_print() had their IRQ
>numbers QOM'ified, the contribution of this function ultimately became
>redundant=2E Remove it=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>Message-Id: <20220301220037=2E76555-5-shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>---
> hw/isa/isa-bus=2Ec           | 16 ----------------
> tests/qemu-iotests/172=2Eout | 26 --------------------------
> 2 files changed, 42 deletions(-)
>
>diff --git a/hw/isa/isa-bus=2Ec b/hw/isa/isa-bus=2Ec
>index 6c31398dda=2E=2Eaf5add6a26 100644
>--- a/hw/isa/isa-bus=2Ec
>+++ b/hw/isa/isa-bus=2Ec
>@@ -21,21 +21,18 @@
> #include "qemu/error-report=2Eh"
> #include "qemu/module=2Eh"
> #include "qapi/error=2Eh"
>-#include "monitor/monitor=2Eh"
> #include "hw/sysbus=2Eh"
> #include "sysemu/sysemu=2Eh"
> #include "hw/isa/isa=2Eh"
>=20
> static ISABus *isabus;
>=20
>-static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)=
;
> static char *isabus_get_fw_dev_path(DeviceState *dev);
>=20
> static void isa_bus_class_init(ObjectClass *klass, void *data)
> {
>     BusClass *k =3D BUS_CLASS(klass);
>=20
>-    k->print_dev =3D isabus_dev_print;
>     k->get_fw_dev_path =3D isabus_get_fw_dev_path;
> }
>=20
>@@ -222,19 +219,6 @@ void isa_build_aml(ISABus *bus, Aml *scope)
>     }
> }
>=20
>-static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
>-{
>-    ISADevice *d =3D ISA_DEVICE(dev);
>-
>-    if (d->isairq[1] !=3D -1) {
>-        monitor_printf(mon, "%*sisa irqs %d,%d\n", indent, "",
>-                       d->isairq[0], d->isairq[1]);
>-    } else if (d->isairq[0] !=3D -1) {
>-        monitor_printf(mon, "%*sisa irq %d\n", indent, "",
>-                       d->isairq[0]);
>-    }
>-}
>-
> static void isabus_bridge_class_init(ObjectClass *klass, void *data)
> {
>     DeviceClass *dc =3D DEVICE_CLASS(klass);
>diff --git a/tests/qemu-iotests/172=2Eout b/tests/qemu-iotests/172=2Eout
>index 4cf4d536b4=2E=2E9479b92185 100644
>--- a/tests/qemu-iotests/172=2Eout
>+++ b/tests/qemu-iotests/172=2Eout
>@@ -15,7 +15,6 @@ Testing:
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -43,7 +42,6 @@ Testing: -fda TEST_DIR/t=2Eqcow2
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -81,7 +79,6 @@ Testing: -fdb TEST_DIR/t=2Eqcow2
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -135,7 +132,6 @@ Testing: -fda TEST_DIR/t=2Eqcow2 -fdb TEST_DIR/t=2Eqc=
ow2=2E2
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -190,7 +186,6 @@ Testing: -fdb
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -230,7 +225,6 @@ Testing: -drive if=3Dfloppy,file=3DTEST_DIR/t=2Eqcow2
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -268,7 +262,6 @@ Testing: -drive if=3Dfloppy,file=3DTEST_DIR/t=2Eqcow2=
,index=3D1
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -322,7 +315,6 @@ Testing: -drive if=3Dfloppy,file=3DTEST_DIR/t=2Eqcow2=
 -drive if=3Dfloppy,file=3DTEST_DIR/t
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -380,7 +372,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2 -=
device floppy,drive=3Dnone0
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -418,7 +409,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2 -=
device floppy,drive=3Dnone0,unit=3D1
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -456,7 +446,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2 -=
drive if=3Dnone,file=3DTEST_DIR/t=2Eqco
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -520,7 +509,6 @@ Testing: -fda TEST_DIR/t=2Eqcow2 -drive if=3Dnone,fil=
e=3DTEST_DIR/t=2Eqcow2=2E2 -device fl
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -575,7 +563,6 @@ Testing: -fda TEST_DIR/t=2Eqcow2 -drive if=3Dnone,fil=
e=3DTEST_DIR/t=2Eqcow2=2E2 -device fl
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -630,7 +617,6 @@ Testing: -fdb TEST_DIR/t=2Eqcow2 -drive if=3Dnone,fil=
e=3DTEST_DIR/t=2Eqcow2=2E2 -device fl
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -685,7 +671,6 @@ Testing: -fdb TEST_DIR/t=2Eqcow2 -drive if=3Dnone,fil=
e=3DTEST_DIR/t=2Eqcow2=2E2 -device fl
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -749,7 +734,6 @@ Testing: -drive if=3Dfloppy,file=3DTEST_DIR/t=2Eqcow2=
 -drive if=3Dnone,file=3DTEST_DIR/t=2Eq
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -804,7 +788,6 @@ Testing: -drive if=3Dfloppy,file=3DTEST_DIR/t=2Eqcow2=
 -drive if=3Dnone,file=3DTEST_DIR/t=2Eq
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -865,7 +848,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2 -=
global floppy=2Edrive=3Dnone0 -device
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -933,7 +915,6 @@ Testing: -device floppy
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -958,7 +939,6 @@ Testing: -device floppy,drive-type=3D120
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -983,7 +963,6 @@ Testing: -device floppy,drive-type=3D144
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -1008,7 +987,6 @@ Testing: -device floppy,drive-type=3D288
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -1036,7 +1014,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2=
 -device floppy,drive=3Dnone0,drive-t
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -1074,7 +1051,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2=
 -device floppy,drive=3Dnone0,drive-t
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -1115,7 +1091,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2=
 -device floppy,drive=3Dnone0,logical
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""
>@@ -1153,7 +1128,6 @@ Testing: -drive if=3Dnone,file=3DTEST_DIR/t=2Eqcow2=
 -device floppy,drive=3Dnone0,physica
>             fdtypeA =3D "auto"
>             fdtypeB =3D "auto"
>             fallback =3D "288"
>-            isa irq 6
>             bus: floppy-bus=2E0
>               type floppy-bus
>               dev: floppy, id ""

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>


