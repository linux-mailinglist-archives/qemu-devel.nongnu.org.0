Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8379F4B31D9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:19:58 +0100 (CET)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIg8p-0000RF-Vj
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrc-0006X9-EG
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:08 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfra-0000IU-2R
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624127; x=1676160127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1NCQMayyILJx0qmjiORUeu5+IWQLva2eYMHLewQNNkk=;
 b=qTq4zSypO+PHmN6BQKh6bSCvlf2yLuwTA0Tvgqt+VxLOTUSuozU9UPs3
 cw3bdZ0Fpqjd/JYz7QTxHk/gT/7dZ3b5WU5mNkvwqYN0KkZee4AR4LAzP
 IwNPBH4IM55J6HEBka1E0ULJBukFacytgvCB7SyLqqSMcHoE0YW9zCpTn
 PiuF9cuM+x0wPI7/EmX1pGzVJxWfp0OIa9355J8Mse7yiQvcTzFzGKJgW
 U8R0FMA3AuXdVCcfSaSwp7qluBJwr2yK1RNvBgJAXID37Fsm+go9Q5Wel
 lFTK1OUl5bOa3SJI5t3qJ8bWWpPuXeVFX5ZBbsIwh/b1I3LbakjmJvX3F A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710116"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:06 +0800
IronPort-SDR: DmqyWbyYDq24731gxZF4ZKmxAqy2G7yBia7fks8cupfx/qNo3/r2HFdoB6NqHcmtOpYGuOIt9Z
 o8XTKluMl4TxuGG6bfU5O0b4KKmXyrqArA2GOZI/leqNK4Ng0EYFhNgMe4ditk4Uvej2NAm+fX
 1KyKQwqOBYwoHyf6Egx4lP36zx83Hkv5s/y4RS78rs4MUHUw3YoCMgHRTba/uNOBnVIaXaMP4J
 +AVSUWQn/89ybRNe2jfwzq9LWEg4CDelZAHrAeIez7NiTSDkLFCSEy6v32FzqQLhR/Rxs7coRi
 Tz7LmEaqWxFlKHApX80IOtSb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:50 -0800
IronPort-SDR: M3fk2dtOFNriFXSK0RSiRndQnWOIyUOL42bzrZsTgq+nLGVWxHlT4PZSJFsi78txaCob4+4tYQ
 mbDEjLyy+fYzOyBu10G5NxCUDMbuSY+DD6hp3/RIllVHgtPOjVDkinv7OVVyJPAOkDyxW0fpjG
 4cNc+nZ3D+KJ9w5fMy0n+aE8o8yKZYaL6UbEXXAeMk+PUNGnaYcF1bxmbDRvDHa0dvDYj9/EYc
 Eb9c+tXlzCzAwgcLMIM51N4dp+n9epQAjm/fFZSlcFgTEnjG00ZNajMGQd7MWSO67wA0nc+OVS
 BOA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:04 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVz04zkHz1SVp1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624123; x=1647216124; bh=1NCQMayyILJx0qmjiO
 RUeu5+IWQLva2eYMHLewQNNkk=; b=pFEZcK5G1wHXH0H0GpN5K9mx0TFvs9sKDp
 2Dn/HLU3Gw17vkocuiUzU1FgY+JqmG5nnbCtTrRFGiHsAGCVuA19aa++jXuFsLMn
 5iOpD+yQ0PJZUfjSKLgHnjDm70bMpPYWmNfjMq6Eid5CqVGOt4/Q67M7GjHmG/M8
 QYzje2Oxx+DGYq0eBp4/nmHW46SFOE1Pw2o9YI5mOjICZaEH/heKkPF4QIaNGxSC
 Eqf9ehf8T2XKcXg/6jG9TPImhazk5txY5OxxhAEQQLjVAZ3nLXzpWeycowzeih1Z
 fhyERtoNY8NNsGDiitx1s9YIzjJldn3dNdmSrbMhF9v+/FFxW0Mw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id egGRtkANuL-N for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:03 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVyv6dkPz1Rwrw;
 Fri, 11 Feb 2022 16:01:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 14/40] target/riscv: Implement hgeie and hgeip CSRs
Date: Sat, 12 Feb 2022 10:00:05 +1000
Message-Id: <20220212000031.3946524-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

The hgeie and hgeip CSRs are required for emulating an external
interrupt controller capable of injecting virtual external interrupt
to Guest/VM running at VS-level.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-4-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  5 +++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu.c        | 67 +++++++++++++++++++++++++++------------
 target/riscv/cpu_helper.c | 37 +++++++++++++++++++--
 target/riscv/csr.c        | 43 +++++++++++++++++--------
 target/riscv/machine.c    |  6 ++--
 6 files changed, 121 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index aacc997d56..f030cb58b2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -161,6 +161,7 @@ struct CPURISCVState {
     target_ulong priv;
     /* This contains QEMU specific information about the virt state. */
     target_ulong virt;
+    target_ulong geilen;
     target_ulong resetvec;
=20
     target_ulong mhartid;
@@ -198,6 +199,8 @@ struct CPURISCVState {
     target_ulong htval;
     target_ulong htinst;
     target_ulong hgatp;
+    target_ulong hgeie;
+    target_ulong hgeip;
     uint64_t htimedelta;
=20
     /* Upper 64-bits of 128-bit CSRs */
@@ -391,6 +394,8 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction =
f, CPUState *cs,
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index e1256a9982..a541705760 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -542,6 +542,7 @@ typedef enum RISCVException {
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
 #define IRQ_LOCAL_MAX                      16
+#define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
=20
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e1224d26dc..f1c268415a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -663,27 +663,53 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
 static void riscv_cpu_set_irq(void *opaque, int irq, int level)
 {
     RISCVCPU *cpu =3D RISCV_CPU(opaque);
+    CPURISCVState *env =3D &cpu->env;
=20
-    switch (irq) {
-    case IRQ_U_SOFT:
-    case IRQ_S_SOFT:
-    case IRQ_VS_SOFT:
-    case IRQ_M_SOFT:
-    case IRQ_U_TIMER:
-    case IRQ_S_TIMER:
-    case IRQ_VS_TIMER:
-    case IRQ_M_TIMER:
-    case IRQ_U_EXT:
-    case IRQ_S_EXT:
-    case IRQ_VS_EXT:
-    case IRQ_M_EXT:
-        if (kvm_enabled()) {
-            kvm_riscv_set_irq(cpu, irq, level);
-        } else {
-            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+    if (irq < IRQ_LOCAL_MAX) {
+        switch (irq) {
+        case IRQ_U_SOFT:
+        case IRQ_S_SOFT:
+        case IRQ_VS_SOFT:
+        case IRQ_M_SOFT:
+        case IRQ_U_TIMER:
+        case IRQ_S_TIMER:
+        case IRQ_VS_TIMER:
+        case IRQ_M_TIMER:
+        case IRQ_U_EXT:
+        case IRQ_S_EXT:
+        case IRQ_VS_EXT:
+        case IRQ_M_EXT:
+             if (kvm_enabled()) {
+                kvm_riscv_set_irq(cpu, irq, level);
+             } else {
+                riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
+             }
+             break;
+        default:
+            g_assert_not_reached();
         }
-        break;
-    default:
+    } else if (irq < (IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX)) {
+        /* Require H-extension for handling guest local interrupts */
+        if (!riscv_has_ext(env, RVH)) {
+            g_assert_not_reached();
+        }
+
+        /* Compute bit position in HGEIP CSR */
+        irq =3D irq - IRQ_LOCAL_MAX + 1;
+        if (env->geilen < irq) {
+            g_assert_not_reached();
+        }
+
+        /* Update HGEIP CSR */
+        env->hgeip &=3D ~((target_ulong)1 << irq);
+        if (level) {
+            env->hgeip |=3D (target_ulong)1 << irq;
+        }
+
+        /* Update mip.SGEIP bit */
+        riscv_cpu_update_mip(cpu, MIP_SGEIP,
+                             BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+    } else {
         g_assert_not_reached();
     }
 }
@@ -696,7 +722,8 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
=20
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
+                      IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
=20
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 327a2c4f1d..698389ba1b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -159,7 +159,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState=
 *env)
     target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
=20
-    target_ulong pending =3D env->mip & env->mie;
+    target_ulong vsgemask =3D
+                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN=
);
+    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+
+    target_ulong pending =3D (env->mip | vsgein) & env->mie;
=20
     target_ulong mie    =3D env->priv < PRV_M ||
                           (env->priv =3D=3D PRV_M && mstatus_mie);
@@ -279,6 +283,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *e=
nv)
     }
 }
=20
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return 0;
+    }
+
+    return env->geilen;
+}
+
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    if (geilen > (TARGET_LONG_BITS - 1)) {
+        return;
+    }
+
+    env->geilen =3D geilen;
+}
+
 bool riscv_cpu_virt_enabled(CPURISCVState *env)
 {
     if (!riscv_has_ext(env, RVH)) {
@@ -322,9 +348,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_=
t mask, uint32_t value)
 {
     CPURISCVState *env =3D &cpu->env;
     CPUState *cs =3D CPU(cpu);
-    uint32_t old =3D env->mip;
+    uint32_t gein, vsgein =3D 0, old =3D env->mip;
     bool locked =3D false;
=20
+    if (riscv_cpu_virt_enabled(env)) {
+        gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
+        vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    }
+
     if (!qemu_mutex_iothread_locked()) {
         locked =3D true;
         qemu_mutex_lock_iothread();
@@ -332,7 +363,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t=
 mask, uint32_t value)
=20
     env->mip =3D (env->mip & ~mask) | (value & mask);
=20
-    if (env->mip) {
+    if (env->mip | vsgein) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c635ffb089..b23195b479 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -883,7 +883,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int=
 csrno,
     RISCVCPU *cpu =3D env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by har=
dware */
     target_ulong mask =3D write_mask & delegable_ints & ~env->miclaim;
-    uint32_t old_mip;
+    uint32_t gin, old_mip;
=20
     if (mask) {
         old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
@@ -891,6 +891,11 @@ static RISCVException rmw_mip(CPURISCVState *env, in=
t csrno,
         old_mip =3D env->mip;
     }
=20
+    if (csrno !=3D CSR_HVIP) {
+        gin =3D get_field(env->hstatus, HSTATUS_VGEIN);
+        old_mip |=3D (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP=
 : 0;
+    }
+
     if (ret_value) {
         *ret_value =3D old_mip;
     }
@@ -1089,7 +1094,7 @@ static RISCVException rmw_vsip(CPURISCVState *env, =
int csrno,
                                target_ulong new_value, target_ulong writ=
e_mask)
 {
     /* Shift the S bits to their VS bit location in mip */
-    int ret =3D rmw_mip(env, 0, ret_value, new_value << 1,
+    int ret =3D rmw_mip(env, csrno, ret_value, new_value << 1,
                       (write_mask << 1) & vsip_writable_mask & env->hide=
leg);
=20
     if (ret_value) {
@@ -1109,7 +1114,7 @@ static RISCVException rmw_sip(CPURISCVState *env, i=
nt csrno,
     if (riscv_cpu_virt_enabled(env)) {
         ret =3D rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask=
);
     } else {
-        ret =3D rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+        ret =3D rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
     }
=20
@@ -1228,7 +1233,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, =
int csrno,
                                target_ulong *ret_value,
                                target_ulong new_value, target_ulong writ=
e_mask)
 {
-    int ret =3D rmw_mip(env, 0, ret_value, new_value,
+    int ret =3D rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hvip_writable_mask);
=20
     if (ret_value) {
@@ -1241,7 +1246,7 @@ static RISCVException rmw_hip(CPURISCVState *env, i=
nt csrno,
                               target_ulong *ret_value,
                               target_ulong new_value, target_ulong write=
_mask)
 {
-    int ret =3D rmw_mip(env, 0, ret_value, new_value,
+    int ret =3D rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hip_writable_mask);
=20
     if (ret_value) {
@@ -1278,15 +1283,27 @@ static RISCVException write_hcounteren(CPURISCVSt=
ate *env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException write_hgeie(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+static RISCVException read_hgeie(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     if (val) {
-        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+        *val =3D env->hgeie;
     }
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException write_hgeie(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
+    val &=3D ((((target_ulong)1) << env->geilen) - 1) << 1;
+    env->hgeie =3D val;
+    /* Update mip.SGEIP bit */
+    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
+                         BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_htval(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1314,11 +1331,11 @@ static RISCVException write_htinst(CPURISCVState =
*env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException write_hgeip(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+static RISCVException read_hgeip(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     if (val) {
-        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+        *val =3D env->hgeip;
     }
     return RISCV_EXCP_NONE;
 }
@@ -2148,10 +2165,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_HIP]         =3D { "hip",         hmode,   NULL,   NULL,     rm=
w_hip           },
     [CSR_HIE]         =3D { "hie",         hmode,   read_hie,         wr=
ite_hie         },
     [CSR_HCOUNTEREN]  =3D { "hcounteren",  hmode,   read_hcounteren,  wr=
ite_hcounteren  },
-    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_zero,        wr=
ite_hgeie       },
+    [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_hgeie,       wr=
ite_hgeie       },
     [CSR_HTVAL]       =3D { "htval",       hmode,   read_htval,       wr=
ite_htval       },
     [CSR_HTINST]      =3D { "htinst",      hmode,   read_htinst,      wr=
ite_htinst      },
-    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_zero,        wr=
ite_hgeip       },
+    [CSR_HGEIP]       =3D { "hgeip",       hmode,   read_hgeip,       NU=
LL              },
     [CSR_HGATP]       =3D { "hgatp",       hmode,   read_hgatp,       wr=
ite_hgatp       },
     [CSR_HTIMEDELTA]  =3D { "htimedelta",  hmode,   read_htimedelta,  wr=
ite_htimedelta  },
     [CSR_HTIMEDELTAH] =3D { "htimedeltah", hmode32, read_htimedeltah, wr=
ite_htimedeltah },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 740e11fcff..7d72c2d8a6 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -78,8 +78,8 @@ static bool hyper_needed(void *opaque)
=20
 static const VMStateDescription vmstate_hyper =3D {
     .name =3D "cpu/hyper",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .needed =3D hyper_needed,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
@@ -89,6 +89,8 @@ static const VMStateDescription vmstate_hyper =3D {
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
         VMSTATE_UINTTL(env.hgatp, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeie, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
=20
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
--=20
2.34.1


