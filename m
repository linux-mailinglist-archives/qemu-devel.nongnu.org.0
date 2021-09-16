Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FE240ECF4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:56:42 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzN3-00019B-B5
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGD-0004hA-Ti
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:37 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:30147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzGB-00026z-L3
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828975; x=1663364975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AO1JuK3l7xcyFrzBrmx/exn5X0AAf6QqVyw+XZ3D90c=;
 b=iJQ9V+1afY+woR/75LpIiXvlVo7Yectz98o8BzSRbxVUb4oL6bf7PQZp
 7vnz78+fgmvctL7VLM3K0XekDyNJHvkAwvyiriqoDdTZyE1qjPdAcuVZk
 IJE1yHSJerOGOYa/72Nc+dGjKDNC/kL3vx+MoRSdwive9rGlGSqEAT+zF
 gSzA+fDL2jcT1uAgMBMsj0jYEEyXyjOGv7O0z9XRLNezcDHaE5OAwxUo+
 0OhFvK51ma9gjUtVWm61TKf5Ol8lhM+acGBUUxeC5bwcN20PpQwFI7Icj
 +Q+Nz/PMbQBUL4NCwX04+Z7jIM/ssQuSYJL8dWgm8emDbObBXsT7yRWni g==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="291828391"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:34 +0800
IronPort-SDR: S8c7t4F61SUX0Mz+dLO7oGvVlcHEbA2ZcFKItsLMNiGgDJi7RwrJoxZBqEdm8eQMHzTCvtfnOu
 XdR2yCwxw5USNoEXkVxL76XGgMdq9AuYBiXE1D+qE2bT0hV4neKxSwNxlfZHodiwd389Kir+yO
 8piABV2chNoqY6yxK1Um6ybgadFlGXatEuiKMio675mD0E38M9I2AEnnCMcXxLz113XX4/IxT8
 mWRoqptaqlXP80tD22vCPb3wNMjtnW9q4Bn0vN4BG/r6oUu5Bk3l74vhJlJWd/0/KMj53oMe0C
 QHTCrj3Y/aqQjr+zFc8lAsw3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:55 -0700
IronPort-SDR: Wc8aJVT9bC0fPYVuJVe0OJPeTwkCJkl2I2cWfw25WaKH3PB16kS2deLs4yoRFZ76X6MkwHbI6a
 AYemKvoXKQy5FgcLLY0I1BcePyPVzIy76si+jWhRJ/5pofDkwFMxEkS6VJEC1lw1kpjAK8plur
 FISRrGnoupW3rxnf9lke2Vf5ct78noz+mXuPODnEzwD2gb+jhKDZq8V55AIGJnrCPTMziat9aJ
 1w3kBwE84FQ9p80gJbMyZBp8MIrp4WIzhOiIwDWNjWzFn5vH4uQ7vp0bwvQwcNcdaX05A8G1xz
 LhU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W2Q3S5Bz1Rws7
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631828973; x=1634420974; bh=AO1JuK3l7xcyFrzBrm
 x/exn5X0AAf6QqVyw+XZ3D90c=; b=bn8G9uMzj+p67UmqivkodQUk1UXO1GlLLo
 C2a15TAQJUkSm3TfoBhORhYQSMpe2e4/nY9lSOCD6KptZEf4nr++Y1/W5NspsCvI
 aq+3cMD5ct8BgKR+W4bcYodoxm7OhXZnqsXRr9tiVDOkKq7fvwkDn25WnE/NiOnZ
 ueuDoeBTrVl/uejCwtR24f3ieBYx29FFD0/bpptHfGV89ARWB25F3xT2qEQpVwHO
 izU7E4H6yDPR2P55OPw/UBZSmc/QkOwUmBBoVtXR5YYRw8DcrQx9PyQkYwBjCvue
 EZlqqwloFBiZtKcLFSwvSnadCW/qhoSpd1b6PAuKlCq4jdNYUq7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id MDK2D0THoIz8 for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:33 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W2K5bWxz1RvlV;
 Thu, 16 Sep 2021 14:49:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PULL 04/21] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
Date: Fri, 17 Sep 2021 07:48:47 +1000
Message-Id: <20210916214904.734206-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


