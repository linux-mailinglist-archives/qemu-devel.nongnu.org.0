Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD10412EF7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:02:36 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZnX-0007vU-Mj
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZg2-0007eH-Rs
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:52 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZg0-0003lr-Vu
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207288; x=1663743288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AO1JuK3l7xcyFrzBrmx/exn5X0AAf6QqVyw+XZ3D90c=;
 b=aE13hpXaUznoRpVOkghseXExJExniVmLelVJOgb/xC8aFk8I65DsH4od
 ISkX3Fxhk/n5y+II6y0MAQh05BlkfzUgNZGR49dKFZYnbho3ktWteFhAI
 PXX4Fo0YAjaA5TEuYESRUkxS5efE4SYgR1DcJy8WBPOqShyAI/Irh6p0u
 FDzZNswX5x1xQscDfL0ApyM9fi9d+5AAz5zBdrRgjS7HHAuzs4h5NzYQK
 D0irr++RJHb7WN+kkOInzNOsF2zrx2ZYUeyoAQHxbr78opWZLNle7fTgU
 M05iKHP+a1auXxgQXShu3y6+l2k/y1YhBvzwWrBoSLxN6AnSxuU+9RZBP g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="180529383"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:54:47 +0800
IronPort-SDR: HX8mWQvxjnur27whV4U/rTC+PYnHgMPORx6x/XUyVpTG/pY1F4jE8sOMAB8x6lxM5ZrYhZb2gs
 Zk4gacNMdjrmM6PARPiSVjdEcizD9PMyCIX6edK9KLU5dw0RaqgkbpGtyw86xZyzOzeW1N8Roz
 lgNCLkmjwo+6fhN85QHHc+N/Tsld7D630cM2DGzX08MhEBYnR0xXMtuaURJT+DaIardgzTMt6/
 wOwdS02W17IL9vopbrBepxU9hJyTNJmH7ykctREksuelR4YMgnmYhST3AxqcYpyoBM27XkN981
 z1dN/i+ewR8JIh+5pPwNy9Ww
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:02 -0700
IronPort-SDR: oeJ/6yK97b5KrL5CbFY2P4Gmtqxu/zJ1o00hZks0+oksZUXF2YMPCWKocpvVmcmsTqTr10Tf2u
 dtYWhSxcBUkpTvk8uARfAOH6507akAZSj8YdmRtSqWbYtXwsoLaNwOE92qDKr9dh2tHE+Wgray
 wVN38rRURHwv3tyMPjyracKe4XOpTUInn0JOO1ZzdsU/sllG/zT46ofqeammm1Ya4Pte6kXGnI
 xOdF20DPEyYw3aoEGkiMjbwMSWqlxWDy0M38Y2mnS/SAp2cCf/3bWdQ+KkObT02RsNqIj5ru/w
 hHk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:54:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBxg6d01z1Rws0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:54:47 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207287; x=1634799288; bh=AO1JuK3l7xcyFrzBrm
 x/exn5X0AAf6QqVyw+XZ3D90c=; b=ssvxBo806cPznaSxB1eyqPr7TTJNDSrgBV
 rwn48xaBHX8vQmczmr0Xtz3eF1Wooz0E/hzGZSs6DcQP76OFGW8h5A8NSLEhPAUe
 xMHu563di9HLfGHlbR0lt1FChrEEPQRCDtza1XoFXbDl4oUtwLt3XvgHsnX5iPoh
 ozweLLfGs5brbuZQ//W3ztnp6eX81YUzhQ2E9rKEBmUl0x65wtNmdR7jbaoyRITt
 CNveeD60xWB+gfANy7t1AesLczuL6Trft283yXooB9McInC1/9IuVpGj1iL+ZARL
 eB+3wZqu8ayqo0WB80QFzahMNKjedDjYLk5RjEVAYl9vI8R9dq/A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YrxdE0lQAdrn for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:54:47 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBxZ3bpKz1RvlH;
 Mon, 20 Sep 2021 23:54:41 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PULL v2 04/21] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
Date: Tue, 21 Sep 2021 16:53:55 +1000
Message-Id: <20210921065412.312381-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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
CPU GPIO lines to set the timer and soft MIP bits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-id: 946e1ef5e268b24084c7ddad84c146de62a56736.1630301632.git.alist=
air.francis@wdc.com
---
 include/hw/intc/sifive_clint.h |  2 +
 hw/intc/sifive_clint.c         | 68 ++++++++++++++++++++++++----------
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clin=
t.h
index a30be0f3d6..921b1561dd 100644
--- a/include/hw/intc/sifive_clint.h
+++ b/include/hw/intc/sifive_clint.h
@@ -40,6 +40,8 @@ typedef struct SiFiveCLINTState {
     uint32_t time_base;
     uint32_t aperture_size;
     uint32_t timebase_freq;
+    qemu_irq *timer_irqs;
+    qemu_irq *soft_irqs;
 } SiFiveCLINTState;
=20
 DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 99c870ced2..ab172d8e40 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -28,6 +28,12 @@
 #include "hw/qdev-properties.h"
 #include "hw/intc/sifive_clint.h"
 #include "qemu/timer.h"
+#include "hw/irq.h"
+
+typedef struct sifive_clint_callback {
+    SiFiveCLINTState *s;
+    int num;
+} sifive_clint_callback;
=20
 static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 {
@@ -39,7 +45,9 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_fr=
eq)
  * Called when timecmp is written to update the QEMU timer or immediatel=
y
  * trigger timer interrupt if mtimecmp <=3D current timer value.
  */
-static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
+static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cp=
u,
+                                       int hartid,
+                                       uint64_t value,
                                        uint32_t timebase_freq)
 {
     uint64_t next;
@@ -51,12 +59,12 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,=
 uint64_t value,
     if (cpu->env.timecmp <=3D rtc_r) {
         /* if we're setting an MTIMECMP value in the "past",
            immediately raise the timer interrupt */
-        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+        qemu_irq_raise(s->timer_irqs[hartid - s->hartid_base]);
         return;
     }
=20
     /* otherwise, set up the future timer interrupt */
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
+    qemu_irq_lower(s->timer_irqs[hartid - s->hartid_base]);
     diff =3D cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND, timebase=
_freq);
@@ -91,8 +99,9 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, u=
int64_t value,
  */
 static void sifive_clint_timer_cb(void *opaque)
 {
-    RISCVCPU *cpu =3D opaque;
-    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
+    sifive_clint_callback *state =3D opaque;
+
+    qemu_irq_raise(state->s->timer_irqs[state->num]);
 }
=20
 /* CPU wants to read rtc or timecmp register */
@@ -158,7 +167,7 @@ static void sifive_clint_write(void *opaque, hwaddr a=
ddr, uint64_t value,
         if (!env) {
             error_report("clint: invalid timecmp hartid: %zu", hartid);
         } else if ((addr & 0x3) =3D=3D 0) {
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(=
value));
+            qemu_set_irq(clint->soft_irqs[hartid - clint->hartid_base], =
value);
         } else {
             error_report("clint: invalid sip write: %08x", (uint32_t)add=
r);
         }
@@ -174,13 +183,13 @@ static void sifive_clint_write(void *opaque, hwaddr=
 addr, uint64_t value,
         } else if ((addr & 0x7) =3D=3D 0) {
             /* timecmp_lo */
             uint64_t timecmp_hi =3D env->timecmp >> 32;
-            sifive_clint_write_timecmp(RISCV_CPU(cpu),
+            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
                 timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase=
_freq);
             return;
         } else if ((addr & 0x7) =3D=3D 4) {
             /* timecmp_hi */
             uint64_t timecmp_lo =3D env->timecmp;
-            sifive_clint_write_timecmp(RISCV_CPU(cpu),
+            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
                 value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase=
_freq);
         } else {
             error_report("clint: invalid timecmp write: %08x", (uint32_t=
)addr);
@@ -226,6 +235,12 @@ static void sifive_clint_realize(DeviceState *dev, E=
rror **errp)
     memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
                           TYPE_SIFIVE_CLINT, s->aperture_size);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+
+    s->timer_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
+
+    s->soft_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
+    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
 }
=20
 static void sifive_clint_class_init(ObjectClass *klass, void *data)
@@ -249,7 +264,6 @@ static void sifive_clint_register_types(void)
=20
 type_init(sifive_clint_register_types)
=20
-
 /*
  * Create CLINT device.
  */
@@ -259,29 +273,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwadd=
r size,
     bool provide_rdtime)
 {
     int i;
+
+    DeviceState *dev =3D qdev_new(TYPE_SIFIVE_CLINT);
+    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
+    qdev_prop_set_uint32(dev, "num-harts", num_harts);
+    qdev_prop_set_uint32(dev, "sip-base", sip_base);
+    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
+    qdev_prop_set_uint32(dev, "time-base", time_base);
+    qdev_prop_set_uint32(dev, "aperture-size", size);
+    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
     for (i =3D 0; i < num_harts; i++) {
         CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
+        RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
         CPURISCVState *env =3D cpu ? cpu->env_ptr : NULL;
+        sifive_clint_callback *cb =3D g_malloc0(sizeof(sifive_clint_call=
back));
+
         if (!env) {
+            g_free(cb);
             continue;
         }
         if (provide_rdtime) {
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_fr=
eq);
         }
+
+        cb->s =3D SIFIVE_CLINT(dev);
+        cb->num =3D i;
         env->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                  &sifive_clint_timer_cb, cpu);
+                                  &sifive_clint_timer_cb, cb);
         env->timecmp =3D 0;
+
+        qdev_connect_gpio_out(dev, i,
+                              qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIME=
R));
+        qdev_connect_gpio_out(dev, num_harts + i,
+                              qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT=
));
     }
=20
-    DeviceState *dev =3D qdev_new(TYPE_SIFIVE_CLINT);
-    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
-    qdev_prop_set_uint32(dev, "num-harts", num_harts);
-    qdev_prop_set_uint32(dev, "sip-base", sip_base);
-    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
-    qdev_prop_set_uint32(dev, "time-base", time_base);
-    qdev_prop_set_uint32(dev, "aperture-size", size);
-    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
     return dev;
 }
--=20
2.31.1


