Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721EF4B320A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:34:21 +0100 (CET)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgMm-0001LE-Gj
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:34:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsI-00084E-Qa
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:55 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfs3-0000Ln-Fl
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624156; x=1676160156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XiNO+2m9meUooasqQsb3xrY672W0NC8Lav1VobbXiFM=;
 b=rt00joc2wxEpQhW3rCVhcs73M4JhopD9MYVQTx146adZoKGvxUah7SuP
 wsVT/7KZ7SE3vqoLTdm2Ulck41ABzt3yfTbhLdbi3cAHY/rPpD0LZPQgI
 ilxz1OQmO84vLUXb2L8tfG7+rBzg6b2ODcbBkI9TIhR+tUezktYc6Ontd
 9kZSUPsXU+Iulc5l8iHJlymTB98sVQLxZWTjWaNc+4LO8U+sx5i6y9fRD
 5Yye0al9rIDzXmhhUACVkqARyWT8D9vg1U/CFtFap6mJR/cvuE5CJksKI
 4Epo6ujqj5+I6gEa/XmVzbqThRE7vW20nkAIG65rWWgNirjBgcTtocliq Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710169"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:35 +0800
IronPort-SDR: h96pGzFtun8DLR5vqU99qeXDpKb+/eVSLzrJc2H/DrK7/nfzKGXy0fJ9NY2HeUPjJdX1+ro+lQ
 1oeqVBbWLHo18TqvnC0EhxTDjgAciyY8o0rwCPPWV59JaYf+8Cpi1+3S8HCqHMiijTILpNI8+l
 bdRaf6baVG4Ewkarm+pAWOvWbbmKzM4tQstZR5OgbH/umkhNooQKTOyX2xgnFHDXa14J/3SzXH
 TMztUKCsJeensKVHeiMFuMA5dK7KFhYewOLvVGw34vpyIVAp/UXufxqrZ2WhAxUmzcEGG/ha9k
 MBXQj/k5rHj2/CSYVDijjEvX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:34:19 -0800
IronPort-SDR: zB/8TviXpY+WzKUI7f6K3euy0bB8/Q3q34oGYmMA0AONHNSbLGT0Pqk1QQTx2odPbxG+srVvB8
 Ireup3jpTHpp/6lM8ssxEkfUHK6paJ/PRqN92Jb+aRFLrxl6Mj8ljEWAhceDCdr2i/QMd7Qt9n
 NyJGZqLjKPx03mZfLRYsSypCUsHiEVQHG6XZtmBjmo0TllZ0J+3GRZ/fBaWBa9cItMG+QcELm5
 K0Ek09v4NAQnCAzOrrxhNGNaaTGIt47Ulj9CPEYY0Yxzyrbrth0wfMUb6Ja17avcF9sKARVUaZ
 Zy4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzY47ckz1SVp1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624152; x=1647216153; bh=XiNO+2m9meUooasqQs
 b3xrY672W0NC8Lav1VobbXiFM=; b=VyN30oD1EBgx9T8G0KPXno/m2v/CmMl9b3
 P2cHG3C+laYsbWgPZjAG0/we6qhagZ3McTbP3RV78yiuovu9PkTsP0cFpfLTIvzd
 5rXG8sGceGOe9QmjVHgc/J2uhRpXW6NpkR2ASHeIFR7HxodksfYWpVqF9fVV3zLF
 8sbgpKjbbFi6HdU7qagUaWz96SEi8qt00yXveMEx4YDt60VtuQjKiO+gmjNr/wto
 c4HxQ8EK4UCwc8wO9LeaxyhPROLaYIKt0+UW/BQ/uClyfllLI4mAH15iyAmjPxwz
 Y/C9y5IDbmypVqd1R2DcYAVe1TZolZTRWelXxdrCt9ImPHl8GgKw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uYieBdDFahhe for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:32 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzS5hgFz1Rwrw;
 Fri, 11 Feb 2022 16:02:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/40] target/riscv: Implement AIA local interrupt priorities
Date: Sat, 12 Feb 2022 10:00:11 +1000
Message-Id: <20220212000031.3946524-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The AIA spec defines programmable 8-bit priority for each local interrupt
at M-level, S-level and VS-level so we extend local interrupt processing
to consider AIA interrupt priorities. The AIA CSRs which help software
configure local interrupt priorities will be added by subsequent patches.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220204174700.534953-10-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  12 ++
 target/riscv/cpu.c        |  19 +++
 target/riscv/cpu_helper.c | 281 +++++++++++++++++++++++++++++++++++---
 target/riscv/machine.c    |   3 +
 4 files changed, 294 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6b6df57c42..89e9cc558d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -192,6 +192,10 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
=20
+    /* Machine and Supervisor interrupt priorities */
+    uint8_t miprio[64];
+    uint8_t siprio[64];
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -204,6 +208,9 @@ struct CPURISCVState {
     target_ulong hgeip;
     uint64_t htimedelta;
=20
+    /* Hypervisor controlled virtual interrupt priorities */
+    uint8_t hviprio[64];
+
     /* Upper 64-bits of 128-bit CSRs */
     uint64_t mscratchh;
     uint64_t sscratchh;
@@ -415,6 +422,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction=
 f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
);
+uint8_t riscv_cpu_default_priority(int irq);
+int riscv_cpu_mirq_pending(CPURISCVState *env);
+int riscv_cpu_sirq_pending(CPURISCVState *env);
+int riscv_cpu_vsirq_pending(CPURISCVState *env);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ff766acc21..5fb0a61036 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -400,6 +400,10 @@ void restore_state_to_opc(CPURISCVState *env, Transl=
ationBlock *tb,
=20
 static void riscv_cpu_reset(DeviceState *dev)
 {
+#ifndef CONFIG_USER_ONLY
+    uint8_t iprio;
+    int i, irq, rdzero;
+#endif
     CPUState *cs =3D CPU(dev);
     RISCVCPU *cpu =3D RISCV_CPU(cs);
     RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
@@ -432,6 +436,21 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->miclaim =3D MIP_SGEIP;
     env->pc =3D env->resetvec;
     env->two_stage_lookup =3D false;
+
+    /* Initialized default priorities of local interrupts. */
+    for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
+        iprio =3D riscv_cpu_default_priority(i);
+        env->miprio[i] =3D (i =3D=3D IRQ_M_EXT) ? 0 : iprio;
+        env->siprio[i] =3D (i =3D=3D IRQ_S_EXT) ? 0 : iprio;
+        env->hviprio[i] =3D 0;
+    }
+    i =3D 0;
+    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
+        if (!rdzero) {
+            env->hviprio[irq] =3D env->miprio[irq];
+        }
+        i++;
+    }
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 37c58a891b..1a9534d6d7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -152,36 +152,275 @@ void riscv_cpu_update_mask(CPURISCVState *env)
 }
=20
 #ifndef CONFIG_USER_ONLY
-static int riscv_cpu_local_irq_pending(CPURISCVState *env)
+
+/*
+ * The HS-mode is allowed to configure priority only for the
+ * following VS-mode local interrupts:
+ *
+ * 0  (Reserved interrupt, reads as zero)
+ * 1  Supervisor software interrupt
+ * 4  (Reserved interrupt, reads as zero)
+ * 5  Supervisor timer interrupt
+ * 8  (Reserved interrupt, reads as zero)
+ * 13 (Reserved interrupt)
+ * 14 "
+ * 15 "
+ * 16 "
+ * 18 Debug/trace interrupt
+ * 20 (Reserved interrupt)
+ * 22 "
+ * 24 "
+ * 26 "
+ * 28 "
+ * 30 (Reserved for standard reporting of bus or system errors)
+ */
+
+static const int hviprio_index2irq[] =3D {
+    0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
+static const int hviprio_index2rdzero[] =3D {
+    1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
+
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero=
)
+{
+    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <=3D index) {
+        return -EINVAL;
+    }
+
+    if (out_irq) {
+        *out_irq =3D hviprio_index2irq[index];
+    }
+
+    if (out_rdzero) {
+        *out_rdzero =3D hviprio_index2rdzero[index];
+    }
+
+    return 0;
+}
+
+/*
+ * Default priorities of local interrupts are defined in the
+ * RISC-V Advanced Interrupt Architecture specification.
+ *
+ * ----------------------------------------------------------------
+ *  Default  |
+ *  Priority | Major Interrupt Numbers
+ * ----------------------------------------------------------------
+ *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
+ *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
+ *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
+ *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
+ *           |
+ *           | 11 (0b),  3 (03),  7 (07)
+ *           |  9 (09),  1 (01),  5 (05)
+ *           | 12 (0c)
+ *           | 10 (0a),  2 (02),  6 (06)
+ *           |
+ *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
+ *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
+ *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
+ *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
+ * ----------------------------------------------------------------
+ */
+static const uint8_t default_iprio[64] =3D {
+ [63] =3D IPRIO_DEFAULT_UPPER,
+ [62] =3D IPRIO_DEFAULT_UPPER + 1,
+ [31] =3D IPRIO_DEFAULT_UPPER + 2,
+ [30] =3D IPRIO_DEFAULT_UPPER + 3,
+ [61] =3D IPRIO_DEFAULT_UPPER + 4,
+ [60] =3D IPRIO_DEFAULT_UPPER + 5,
+
+ [59] =3D IPRIO_DEFAULT_UPPER + 6,
+ [58] =3D IPRIO_DEFAULT_UPPER + 7,
+ [29] =3D IPRIO_DEFAULT_UPPER + 8,
+ [28] =3D IPRIO_DEFAULT_UPPER + 9,
+ [57] =3D IPRIO_DEFAULT_UPPER + 10,
+ [56] =3D IPRIO_DEFAULT_UPPER + 11,
+
+ [55] =3D IPRIO_DEFAULT_UPPER + 12,
+ [54] =3D IPRIO_DEFAULT_UPPER + 13,
+ [27] =3D IPRIO_DEFAULT_UPPER + 14,
+ [26] =3D IPRIO_DEFAULT_UPPER + 15,
+ [53] =3D IPRIO_DEFAULT_UPPER + 16,
+ [52] =3D IPRIO_DEFAULT_UPPER + 17,
+
+ [51] =3D IPRIO_DEFAULT_UPPER + 18,
+ [50] =3D IPRIO_DEFAULT_UPPER + 19,
+ [25] =3D IPRIO_DEFAULT_UPPER + 20,
+ [24] =3D IPRIO_DEFAULT_UPPER + 21,
+ [49] =3D IPRIO_DEFAULT_UPPER + 22,
+ [48] =3D IPRIO_DEFAULT_UPPER + 23,
+
+ [11] =3D IPRIO_DEFAULT_M,
+ [3]  =3D IPRIO_DEFAULT_M + 1,
+ [7]  =3D IPRIO_DEFAULT_M + 2,
+
+ [9]  =3D IPRIO_DEFAULT_S,
+ [1]  =3D IPRIO_DEFAULT_S + 1,
+ [5]  =3D IPRIO_DEFAULT_S + 2,
+
+ [12] =3D IPRIO_DEFAULT_SGEXT,
+
+ [10] =3D IPRIO_DEFAULT_VS,
+ [2]  =3D IPRIO_DEFAULT_VS + 1,
+ [6]  =3D IPRIO_DEFAULT_VS + 2,
+
+ [47] =3D IPRIO_DEFAULT_LOWER,
+ [46] =3D IPRIO_DEFAULT_LOWER + 1,
+ [23] =3D IPRIO_DEFAULT_LOWER + 2,
+ [22] =3D IPRIO_DEFAULT_LOWER + 3,
+ [45] =3D IPRIO_DEFAULT_LOWER + 4,
+ [44] =3D IPRIO_DEFAULT_LOWER + 5,
+
+ [43] =3D IPRIO_DEFAULT_LOWER + 6,
+ [42] =3D IPRIO_DEFAULT_LOWER + 7,
+ [21] =3D IPRIO_DEFAULT_LOWER + 8,
+ [20] =3D IPRIO_DEFAULT_LOWER + 9,
+ [41] =3D IPRIO_DEFAULT_LOWER + 10,
+ [40] =3D IPRIO_DEFAULT_LOWER + 11,
+
+ [39] =3D IPRIO_DEFAULT_LOWER + 12,
+ [38] =3D IPRIO_DEFAULT_LOWER + 13,
+ [19] =3D IPRIO_DEFAULT_LOWER + 14,
+ [18] =3D IPRIO_DEFAULT_LOWER + 15,
+ [37] =3D IPRIO_DEFAULT_LOWER + 16,
+ [36] =3D IPRIO_DEFAULT_LOWER + 17,
+
+ [35] =3D IPRIO_DEFAULT_LOWER + 18,
+ [34] =3D IPRIO_DEFAULT_LOWER + 19,
+ [17] =3D IPRIO_DEFAULT_LOWER + 20,
+ [16] =3D IPRIO_DEFAULT_LOWER + 21,
+ [33] =3D IPRIO_DEFAULT_LOWER + 22,
+ [32] =3D IPRIO_DEFAULT_LOWER + 23,
+};
+
+uint8_t riscv_cpu_default_priority(int irq)
 {
-    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
+    if (irq < 0 || irq > 63) {
+        return IPRIO_MMAXIPRIO;
+    }
+
+    return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
+};
=20
-    target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
-    target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
+static int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                                    int extirq, unsigned int extirq_def_=
prio,
+                                    uint64_t pending, uint8_t *iprio)
+{
+    int irq, best_irq =3D RISCV_EXCP_NONE;
+    unsigned int prio, best_prio =3D UINT_MAX;
=20
-    target_ulong vsgemask =3D
-                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN=
);
-    target_ulong vsgein =3D (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+    if (!pending) {
+        return RISCV_EXCP_NONE;
+    }
=20
-    target_ulong pending =3D (env->mip | vsgein) & env->mie;
+    irq =3D ctz64(pending);
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return irq;
+    }
=20
-    target_ulong mie    =3D env->priv < PRV_M ||
-                          (env->priv =3D=3D PRV_M && mstatus_mie);
-    target_ulong sie    =3D env->priv < PRV_S ||
-                          (env->priv =3D=3D PRV_S && mstatus_sie);
-    target_ulong hsie   =3D virt_enabled || sie;
-    target_ulong vsie   =3D virt_enabled && sie;
+    pending =3D pending >> irq;
+    while (pending) {
+        prio =3D iprio[irq];
+        if (!prio) {
+            if (irq =3D=3D extirq) {
+                prio =3D extirq_def_prio;
+            } else {
+                prio =3D (riscv_cpu_default_priority(irq) < extirq_def_p=
rio) ?
+                       1 : IPRIO_MMAXIPRIO;
+            }
+        }
+        if ((pending & 0x1) && (prio <=3D best_prio)) {
+            best_irq =3D irq;
+            best_prio =3D prio;
+        }
+        irq++;
+        pending =3D pending >> 1;
+    }
=20
-    target_ulong irqs =3D
-            (pending & ~env->mideleg & -mie) |
-            (pending &  env->mideleg & ~env->hideleg & -hsie) |
-            (pending &  env->mideleg &  env->hideleg & -vsie);
+    return best_irq;
+}
=20
-    if (irqs) {
-        return ctz64(irqs); /* since non-zero */
+static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+{
+    uint32_t gein =3D get_field(env->hstatus, HSTATUS_VGEIN);
+    uint64_t vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+
+    return (env->mip | vsgein) & env->mie;
+}
+
+int riscv_cpu_mirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs =3D riscv_cpu_all_pending(env) & ~env->mideleg &
+                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+                                    irqs, env->miprio);
+}
+
+int riscv_cpu_sirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
+                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                    irqs, env->siprio);
+}
+
+int riscv_cpu_vsirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs =3D riscv_cpu_all_pending(env) & env->mideleg &
+                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                    irqs >> 1, env->hviprio);
+}
+
+static int riscv_cpu_local_irq_pending(CPURISCVState *env)
+{
+    int virq;
+    uint64_t irqs, pending, mie, hsie, vsie;
+
+    /* Determine interrupt enable state of all privilege modes */
+    if (riscv_cpu_virt_enabled(env)) {
+        mie =3D 1;
+        hsie =3D 1;
+        vsie =3D (env->priv < PRV_S) ||
+               (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATU=
S_SIE));
     } else {
-        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
+        mie =3D (env->priv < PRV_M) ||
+              (env->priv =3D=3D PRV_M && get_field(env->mstatus, MSTATUS=
_MIE));
+        hsie =3D (env->priv < PRV_S) ||
+               (env->priv =3D=3D PRV_S && get_field(env->mstatus, MSTATU=
S_SIE));
+        vsie =3D 0;
+    }
+
+    /* Determine all pending interrupts */
+    pending =3D riscv_cpu_all_pending(env);
+
+    /* Check M-mode interrupts */
+    irqs =3D pending & ~env->mideleg & -mie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+                                        irqs, env->miprio);
     }
+
+    /* Check HS-mode interrupts */
+    irqs =3D pending & env->mideleg & ~env->hideleg & -hsie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                        irqs, env->siprio);
+    }
+
+    /* Check VS-mode interrupts */
+    irqs =3D pending & env->mideleg & env->hideleg & -vsie;
+    if (irqs) {
+        virq =3D riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_=
S,
+                                        irqs >> 1, env->hviprio);
+        return (virq <=3D 0) ? virq : virq + 1;
+    }
+
+    /* Indicate no pending interrupt */
+    return RISCV_EXCP_NONE;
 }
=20
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 7d72c2d8a6..30ed77c25f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper =3D {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
=20
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
         VMSTATE_UINTTL(env.vstvec, RISCVCPU),
@@ -235,6 +236,8 @@ const VMStateDescription vmstate_riscv_cpu =3D {
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
+        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
+        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
         VMSTATE_UINTTL(env.pc, RISCVCPU),
         VMSTATE_UINTTL(env.load_res, RISCVCPU),
         VMSTATE_UINTTL(env.load_val, RISCVCPU),
--=20
2.34.1


