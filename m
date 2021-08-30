Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151673FB73B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 15:49:22 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKhf7-0006gP-5b
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 09:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxG-0007Gv-5v
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:35:35 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8697c1236=alistair.francis@opensource.wdc.com>)
 id 1mKZxB-0007mD-Vq
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630301729; x=1661837729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V1Q1eyaUKg34qe5BkhYmnC+g3xItY5QViYtDFWipPLs=;
 b=asj4cw66+pMuMzdBklaV51zGh5cs6qU9hK7UePi3gl+h/mBWqhela27F
 aLDsXLW4dH8PPd6yAmZVsZ0MgZc9w0R6xlLN2hZhYzlGF/+SI329Di4MN
 QTCtNhgEdREzr9jf8m6dt266YMMNiemyeHcgz60e8ILl+6Fev7paxJTc1
 R9NAR3hurlgNRO34810KUKNvnZboeNjd6p/NHifMyVm/s+Ks2ZAYEi3xz
 xF6fRXJ2W4TkMWI8zUZxYwa7x5n7IE8sU3nYH1RQ0/dnjOgAQ0j5JH2lJ
 6pX/rFuQnqjDbO1QA1WifRDW2jZtGGI5NPlpMaFDR/XmzH5RcYBp2BFb2 Q==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="290336898"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 13:35:02 +0800
IronPort-SDR: 7vp3oVP/1M7nuRNtxIyJFmhgnEE90dLEvbvGM5NEguVTUJAc/6U35KRvfhH8yohsA47jBG6jWC
 kVnM/eokjkcv3NxXN2muPt4YzbxJj887sb9iccNfe4R/AcWMtKpmgher1xBu2g7NOAyNAkt8wz
 gTfvUcrZMS1Is5h2OszHsXm7Vxp1Kr0k6/n79iQBoMt5CIDT3523wKNCKzYIFHOhovuDrw1a/+
 l//5Qfy73rGr/evAKx4izxHUWD7zibcYEyK73HY4/J/aK//2npiMDAwweRGbRwEcMdRtCb/pf+
 PJSO/pBHdBDU1N8vIL18jPC5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:11:51 -0700
IronPort-SDR: 4Y4sc/1o6IWncCGabwNLc/T6ZEYkEG1ROtYOgWtQ6ZkCs0p9TXnNp+h0xK93VysJ7gQ5hwTqfn
 2wBGDgTGu8Ci/8w3mf8U+vFgoBooZppohh2FUnp9rPaaORYvCp5IdeL104HIOSnj+yXU4jx7oe
 ZM3rZUvXyB3fzlJk4kD3ClUoEKSGHfam21EIPsxgjck7JsjWKGaZz/w4emKEHxm1YpMdrEsyvt
 wnWaylbYIVMIPNyk5K+ckT5TPX78FPiP+074XVm0OvGVegGNhNcqeLd9/8d+bqSKlB0MsMboqN
 SVU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 22:35:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GyfCm0ZbWz1RvlV
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:35:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1630301699; x=1632893700; bh=V1Q1eya
 UKg34qe5BkhYmnC+g3xItY5QViYtDFWipPLs=; b=Wb8qZSxTqqB1hKounZp8A/j
 VfMEd5R6dF2Ie4OeS7O1hxHS9cxIyn24HiMXFKJLWD14rk996XLF2sgwFYXNpBBv
 1M4MxlpEcSe1zULJlriyCAzv+K+D1BaiGr+1LOWnUjR9L5d6zjfOUSrzBhy3JBLP
 4Qh2u1YRe56EaGCsWoRESmZ8C9yx3zDuiBbjxOE04ZYMc9FY/ZARQVlR8sg0/E5T
 5cK2kKjLC2glcoPco09H84dLSdnpL53nV/M7YfZP2Wmh8FGtAaD+IjHaGZmMIHUN
 ey78fG7E304vy9Hgb2U4sgi7HcUzb1NTN/9hHPPBO1QM9xObqqrHNs2xeIz9D9Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xOMBODlhghfT for <qemu-devel@nongnu.org>;
 Sun, 29 Aug 2021 22:34:59 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GyfCg3FPRz1Rvl9;
 Sun, 29 Aug 2021 22:34:54 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 3/5] hw/intc: ibex_plic: Convert the PLIC to use RISC-V CPU
 GPIO lines
Date: Mon, 30 Aug 2021 15:34:49 +1000
Message-Id: <0a76946981852f5bd15f0c37ab35b253371027a8.1630301632.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
References: <069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=8697c1236=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 09:40:47 -0400
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


