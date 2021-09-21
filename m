Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4876412EE3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:58:14 +0200 (CEST)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZjJ-0002L8-Tj
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZg7-0007gZ-Ma
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:56 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZg5-0003uI-SX
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207292; x=1663743292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w9dqhyHMYdF9AOlQecux0OsVIWEFoz2IeXGIHMuQrRc=;
 b=hxPRXop57cRJ0cmNxHlvaGPFCyu8AKFKzJg995PD9QsDsDay95yAoulz
 SbeHGwHl7SvXB/XCHpQ3yg1mwpqOO5jRsiUnakZqLXOddFwvVucTXHq/C
 PUrcABQQBBfz2UkPx/EFvhNOvZ/pX7FTdAN/0GyoCJTdfs4y34SZVhKIr
 bhRVrc+SRzPKSizd9t3NNI+vsME20yC7Sfa8tkwYoQMFBtWi/CP0is9Gg
 Y+7jHLMe6jKJlOjpF1RZtGdHHm9RH37EujM4cX4265nn5tDJ7DNB00qVh
 bnzct0APHqkWEwMCd0pO74pYTF4NM0Y+0M5DrEvkR6T83DOONQLSCDLeS Q==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="180529388"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:54:50 +0800
IronPort-SDR: +P/f7jShZPE0DF5XOlQ41kL7y2hStOeB3YlHlYqureHau2YSAi5bHR/YeDDJenSEshSN48FlhI
 LByzgyrooU1trW5y1xQ/ZjYQALNGwDFRzSy6/LTPf3Z8PXTRuBym+eXB6WWA5JFBXSo57Ia2ZC
 XKfJ6di8OrVXsVX/YhhwhtfE0tEYUzI7UaH/1F3ZJuDizRIfBbdAi6WkQNePq660cn17q/cy/v
 92etuFf8lTfUDVpzHO6T86a3P+RiA1f7JbLzvvxnp7enNt26hHks/Fd/6Rjvxi6Q1XRahPx4bk
 I+5yScNIPDHmZ+OW7QG/hEIc
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:06 -0700
IronPort-SDR: DVdDUo0+U+lPnhNDtJG4b1VvwaHkdf0UM4w+eQmJADv4N3mZ2pPy6EM8lbiFxC06Mll4q1L6uK
 dAWSV9AzxfxAK5TUllsWOEhVieHtoAAKNxCtsxSjSo/S8N3r6cfS6F9m/Z6iMrWt3R0mMaRsyA
 dHZo3O3nuXLCFjcyFZ4C/AU5RJH4m6alaMD9EjSp7Q1LCIqeJ3Ip890Vq04OquGPwSuhJTJ2BX
 kWGaoVXvWostAdQ4Tn2Nbk3UghCeKLEaSwT7f374pW6e3w4ptyoMwbRZwDUFJLJZV2a/mCg5Rr
 LN0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:54:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBxm333kz1Rws4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:54:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1632207291; x=1634799292; bh=w9dqhyH
 MYdF9AOlQecux0OsVIWEFoz2IeXGIHMuQrRc=; b=dmvPCz4yYUmXhUoIFigziwL
 dNrjiIGUb0813qquv05xr7J2R4r2rM9xCXlkjBC2MyP25hFmNQlIsIb3+LvSIgcQ
 4+zd1M5jFB4OZ+D8sYZGb4+H9ighEDJtTuePcngSdeBJeyiwmoMLMxXhQvWZ0Oib
 YA+XGmTY3lnM/43yfqGQrGrrOn4TwcWo/7Z5CGx1HAzlwWOiiyPxNKhWtM28wzLd
 JzHhhAdIDbY6D9eWHpBKIF45qGx0Ma8ZAdDcwNsmdXVyV38AcquHBaY/djmBg5Oy
 P+AQ3+fls5i/L6Ae5oVykI89jTp/CBYHPRmKEn1rBFRk/Wc7PcSRYqtEi6OxWuw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lJv4rBCEuFzk for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:54:51 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBxh0gWtz1RvlH;
 Mon, 20 Sep 2021 23:54:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 05/21] hw/intc: ibex_plic: Convert the PLIC to use RISC-V
 CPU GPIO lines
Date: Tue, 21 Sep 2021 16:53:56 +1000
Message-Id: <20210921065412.312381-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
CPU GPIO lines to set the external MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 0a76946981852f5bd15f0c37ab35b253371027a8.1630301632.git.alist=
air.francis@wdc.com
---
 include/hw/intc/ibex_plic.h |  2 ++
 hw/intc/ibex_plic.c         | 17 ++++++-----------
 hw/riscv/opentitan.c        |  8 ++++++++
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/hw/intc/ibex_plic.h b/include/hw/intc/ibex_plic.h
index 7fc495db99..d596436e06 100644
--- a/include/hw/intc/ibex_plic.h
+++ b/include/hw/intc/ibex_plic.h
@@ -60,6 +60,8 @@ struct IbexPlicState {
     uint32_t threshold_base;
=20
     uint32_t claim_base;
+
+    qemu_irq *external_irqs;
 };
=20
 #endif /* HW_IBEX_PLIC_H */
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index edf76e4f61..ff430356f8 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -27,6 +27,7 @@
 #include "target/riscv/cpu_bits.h"
 #include "target/riscv/cpu.h"
 #include "hw/intc/ibex_plic.h"
+#include "hw/irq.h"
=20
 static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
 {
@@ -92,19 +93,10 @@ static bool ibex_plic_irqs_pending(IbexPlicState *s, =
uint32_t context)
=20
 static void ibex_plic_update(IbexPlicState *s)
 {
-    CPUState *cpu;
-    int level, i;
+    int i;
=20
     for (i =3D 0; i < s->num_cpus; i++) {
-        cpu =3D qemu_get_cpu(i);
-
-        if (!cpu) {
-            continue;
-        }
-
-        level =3D ibex_plic_irqs_pending(s, 0);
-
-        riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(leve=
l));
+        qemu_set_irq(s->external_irqs[i], ibex_plic_irqs_pending(s, 0));
     }
 }
=20
@@ -268,6 +260,9 @@ static void ibex_plic_realize(DeviceState *dev, Error=
 **errp)
=20
     qdev_init_gpio_in(dev, ibex_plic_irq_request, s->num_sources);
=20
+    s->external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_cpus);
+    qdev_init_gpio_out(dev, s->external_irqs, s->num_cpus);
+
     /*
      * We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 36a41c8b5b..048aced0ec 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -118,6 +118,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     MachineState *ms =3D MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem =3D get_system_memory();
+    int i;
=20
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
@@ -149,6 +150,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].b=
ase);
=20
+    for (i =3D 0; i < ms->smp.cpus; i++) {
+        CPUState *cpu =3D qemu_get_cpu(i);
+
+        qdev_connect_gpio_out(DEVICE(&s->plic), i,
+                              qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
+    }
+
     /* UART */
     qdev_prop_set_chr(DEVICE(&(s->uart)), "chardev", serial_hd(0));
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->uart), errp)) {
--=20
2.31.1


