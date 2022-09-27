Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E495EBB33
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:11:49 +0200 (CEST)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4ku-0003AU-PF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48M-0005jj-06
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:05 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48I-0001I9-Py
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260314; x=1695796314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E5lScHhR2kpKa0jugkoNB8Y7Nx/X7x7dhg4eM1YwfwM=;
 b=Y5H3a9dfghcZBaJxWxTWdgpnS+fd9yvNm24mQKwzNlcNZwDuGlSboa9O
 VFDpOQKwt3yUoy3Gy/yoZJoUspiCyxtYKcdhr6JtHghDRJqWBM4rGsGTq
 M2eRlLm3oNyKbvxGcY32e+/6ObMWPVruSZVYNSxQNxt3mVS8e9KLoI3eN
 C0tjgv0i8V4kAilkWLs+8bzktx3LtN36bkpFqUgmaGXR6JuUXSL9Nu9in
 Tddx+TRuhzMM6RdhkoRIloWK/tMFX6AEWvU2UCUe2fWcRNh3FGz+/XEs1
 dzXpVFvVsoIb4R3Oqv82BkZKnFS+d3lKSzREnwIBPigqFz7Qoq84c6XEY A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530907"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:36 +0800
IronPort-SDR: Innm93injVCfjRMikSvu/AWbBwesZS3x1qHSr6hj7n9soU0I6Cw8TOTj5joDO8mt/Tx1GHcoeR
 OpEd8VOdKxOrecPLGlQVK9eWcJuXgqyyb1rxN++ucIxihJUyvFrKXqGEdgR4bMnC77WyZykvYV
 ajs6bGQl7cKKHcnlPuA4H/qeCzSch4vT3gBLKANq18gFuK4C3YMXHyzWbKq5Swr5SonMoMLFa/
 bOgDTECPqjztaZnmPp2TrpUYf08uNu4Rzsow/amrL4Yv+0LQclMWua2XDIMm9SoH0+u8q13nkj
 SrBlzVOmA8d77HN7beo3Ihhz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:33 -0700
IronPort-SDR: HKL5jpZTniMY0+SHstCeShPmp6oU7P6roqQR+bSAiSethBvA6L302LQEB0/4dT6H7PLj/d8Zka
 QjhWBmt0Oo6+w8VrdSifmpAdaz0E//7PrAf4MK8RwMDKjkHecoa+vFlzDIPJW/rrQmlyVfPcMi
 xJ2pH9qPB6h2pqdalnyxtfrDK/o83xM/QQw42C3/tYt5BlOhOHwzesdAGDWvyU8l+HbxOfQYEA
 XXxBT9kEjrRbjuqzCZ4N5LZFO9B57ocbvrwltkyTZ8ztVQ2/0i2sxC4LtdmIMQ4jy0UZnNqMHH
 Y6s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sh0vdwz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260295; x=1666852296; bh=E5lScHhR2kpKa0jugk
 oNB8Y7Nx/X7x7dhg4eM1YwfwM=; b=kIBktA3FtGJuqNo8vgpx9Vid6pD3XqduCg
 ixCrktrR3bhnM/VNab5qOdkMK1VLCp/5iceJ5dgvTBSTHEUy9KeLqKC+2o5lxyDk
 PzjHbIIEckaNVeBq2M17eOfR3LSnFVvImCqlhHfBq950qbIyQh0Ml97IBM2PDJkv
 LetYhjGD7GyfVq065118+f+F/NH2RxVmcutJ38H3z6e14BADzvrJbOTDI/VF4Kyc
 ZeCMdGTpHMdy469/aXSvB3jtWFeT1gy5sQdEKtkJ4SY2dCc+ez2ZvjzpvAqgdagN
 fkn9YDep9PoM4nXVGULDlLKvgOwcgTnVfN3zxRxJIcWSB4U4f9yw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ySpvja6RVR5D for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:35 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sd4Gy4z1RvTr;
 Mon, 26 Sep 2022 23:31:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 15/22] target/riscv: debug: Introduce tdata1, tdata2,
 and tdata3 CSRs
Date: Tue, 27 Sep 2022 16:30:57 +1000
Message-Id: <20220927063104.2846825-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Replace type2_trigger_t with the real tdata1, tdata2, and tdata3 CSRs,
which allows us to support more types of triggers in the future.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20220909134215.1843865-4-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |   6 ++-
 target/riscv/debug.h   |   7 ---
 target/riscv/debug.c   | 103 +++++++++++++++--------------------------
 target/riscv/machine.c |  20 ++------
 4 files changed, 48 insertions(+), 88 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 73bcad3c9b..b131fa8c8e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -324,7 +324,11 @@ struct CPUArchState {
=20
     /* trigger module */
     target_ulong trigger_cur;
-    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
+    target_ulong tdata1[RV_MAX_TRIGGERS];
+    target_ulong tdata2[RV_MAX_TRIGGERS];
+    target_ulong tdata3[RV_MAX_TRIGGERS];
+    struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
+    struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
=20
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index c422553c27..76146f373a 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -44,13 +44,6 @@ typedef enum {
     TRIGGER_TYPE_NUM
 } trigger_type_t;
=20
-typedef struct {
-    target_ulong mcontrol;
-    target_ulong maddress;
-    struct CPUBreakpoint *bp;
-    struct CPUWatchpoint *wp;
-} type2_trigger_t;
-
 /* tdata1 field masks */
=20
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 45aae87ec3..06feef7d67 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -91,8 +91,7 @@ static inline target_ulong extract_trigger_type(CPURISC=
VState *env,
 static inline target_ulong get_trigger_type(CPURISCVState *env,
                                             target_ulong trigger_index)
 {
-    target_ulong tdata1 =3D env->type2_trig[trigger_index].mcontrol;
-    return extract_trigger_type(env, tdata1);
+    return extract_trigger_type(env, env->tdata1[trigger_index]);
 }
=20
 static inline target_ulong build_tdata1(CPURISCVState *env,
@@ -188,6 +187,8 @@ static inline void warn_always_zero_bit(target_ulong =
val, target_ulong mask,
     }
 }
=20
+/* type 2 trigger */
+
 static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong c=
trl)
 {
     uint32_t size, sizelo, sizehi =3D 0;
@@ -247,8 +248,8 @@ static target_ulong type2_mcontrol_validate(CPURISCVS=
tate *env,
=20
 static void type2_breakpoint_insert(CPURISCVState *env, target_ulong ind=
ex)
 {
-    target_ulong ctrl =3D env->type2_trig[index].mcontrol;
-    target_ulong addr =3D env->type2_trig[index].maddress;
+    target_ulong ctrl =3D env->tdata1[index];
+    target_ulong addr =3D env->tdata2[index];
     bool enabled =3D type2_breakpoint_enabled(ctrl);
     CPUState *cs =3D env_cpu(env);
     int flags =3D BP_CPU | BP_STOP_BEFORE_ACCESS;
@@ -259,7 +260,7 @@ static void type2_breakpoint_insert(CPURISCVState *en=
v, target_ulong index)
     }
=20
     if (ctrl & TYPE2_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, &env->type2_trig[index].b=
p);
+        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[inde=
x]);
     }
=20
     if (ctrl & TYPE2_LOAD) {
@@ -273,10 +274,10 @@ static void type2_breakpoint_insert(CPURISCVState *=
env, target_ulong index)
         size =3D type2_breakpoint_size(env, ctrl);
         if (size !=3D 0) {
             cpu_watchpoint_insert(cs, addr, size, flags,
-                                  &env->type2_trig[index].wp);
+                                  &env->cpu_watchpoint[index]);
         } else {
             cpu_watchpoint_insert(cs, addr, 8, flags,
-                                  &env->type2_trig[index].wp);
+                                  &env->cpu_watchpoint[index]);
         }
     }
 }
@@ -285,36 +286,17 @@ static void type2_breakpoint_remove(CPURISCVState *=
env, target_ulong index)
 {
     CPUState *cs =3D env_cpu(env);
=20
-    if (env->type2_trig[index].bp) {
-        cpu_breakpoint_remove_by_ref(cs, env->type2_trig[index].bp);
-        env->type2_trig[index].bp =3D NULL;
+    if (env->cpu_breakpoint[index]) {
+        cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
+        env->cpu_breakpoint[index] =3D NULL;
     }
=20
-    if (env->type2_trig[index].wp) {
-        cpu_watchpoint_remove_by_ref(cs, env->type2_trig[index].wp);
-        env->type2_trig[index].wp =3D NULL;
+    if (env->cpu_watchpoint[index]) {
+        cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
+        env->cpu_watchpoint[index] =3D NULL;
     }
 }
=20
-static target_ulong type2_reg_read(CPURISCVState *env,
-                                   target_ulong index, int tdata_index)
-{
-    target_ulong tdata;
-
-    switch (tdata_index) {
-    case TDATA1:
-        tdata =3D env->type2_trig[index].mcontrol;
-        break;
-    case TDATA2:
-        tdata =3D env->type2_trig[index].maddress;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    return tdata;
-}
-
 static void type2_reg_write(CPURISCVState *env, target_ulong index,
                             int tdata_index, target_ulong val)
 {
@@ -323,19 +305,23 @@ static void type2_reg_write(CPURISCVState *env, tar=
get_ulong index,
     switch (tdata_index) {
     case TDATA1:
         new_val =3D type2_mcontrol_validate(env, val);
-        if (new_val !=3D env->type2_trig[index].mcontrol) {
-            env->type2_trig[index].mcontrol =3D new_val;
+        if (new_val !=3D env->tdata1[index]) {
+            env->tdata1[index] =3D new_val;
             type2_breakpoint_remove(env, index);
             type2_breakpoint_insert(env, index);
         }
         break;
     case TDATA2:
-        if (val !=3D env->type2_trig[index].maddress) {
-            env->type2_trig[index].maddress =3D val;
+        if (val !=3D env->tdata2[index]) {
+            env->tdata2[index] =3D val;
             type2_breakpoint_remove(env, index);
             type2_breakpoint_insert(env, index);
         }
         break;
+    case TDATA3:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata3 is not supported for type 2 trigger\n");
+        break;
     default:
         g_assert_not_reached();
     }
@@ -345,30 +331,16 @@ static void type2_reg_write(CPURISCVState *env, tar=
get_ulong index,
=20
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
-    int trigger_type =3D get_trigger_type(env, env->trigger_cur);
-
-    switch (trigger_type) {
-    case TRIGGER_TYPE_AD_MATCH:
-        return type2_reg_read(env, env->trigger_cur, tdata_index);
-        break;
-    case TRIGGER_TYPE_INST_CNT:
-    case TRIGGER_TYPE_INT:
-    case TRIGGER_TYPE_EXCP:
-    case TRIGGER_TYPE_AD_MATCH6:
-    case TRIGGER_TYPE_EXT_SRC:
-        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
-                      trigger_type);
-        break;
-    case TRIGGER_TYPE_NO_EXIST:
-    case TRIGGER_TYPE_UNAVAIL:
-        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n=
",
-                      trigger_type);
-        break;
+    switch (tdata_index) {
+    case TDATA1:
+        return env->tdata1[env->trigger_cur];
+    case TDATA2:
+        return env->tdata2[env->trigger_cur];
+    case TDATA3:
+        return env->tdata3[env->trigger_cur];
     default:
         g_assert_not_reached();
     }
-
-    return 0;
 }
=20
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong v=
al)
@@ -436,8 +408,8 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
=20
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
-                ctrl =3D env->type2_trig[i].mcontrol;
-                pc =3D env->type2_trig[i].maddress;
+                ctrl =3D env->tdata1[i];
+                pc =3D env->tdata2[i];
=20
                 if ((ctrl & TYPE2_EXEC) && (bp->pc =3D=3D pc)) {
                     /* check U/S/M bit against current privilege level *=
/
@@ -471,8 +443,8 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, C=
PUWatchpoint *wp)
=20
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
-            ctrl =3D env->type2_trig[i].mcontrol;
-            addr =3D env->type2_trig[i].maddress;
+            ctrl =3D env->tdata1[i];
+            addr =3D env->tdata2[i];
             flags =3D 0;
=20
             if (ctrl & TYPE2_LOAD) {
@@ -518,9 +490,10 @@ void riscv_trigger_init(CPURISCVState *env)
          * chain =3D 0 (unimplemented, always 0)
          * match =3D 0 (always 0, when any compare value equals tdata2)
          */
-        env->type2_trig[i].mcontrol =3D tdata1;
-        env->type2_trig[i].maddress =3D 0;
-        env->type2_trig[i].bp =3D NULL;
-        env->type2_trig[i].wp =3D NULL;
+        env->tdata1[i] =3D tdata1;
+        env->tdata2[i] =3D 0;
+        env->tdata3[i] =3D 0;
+        env->cpu_breakpoint[i] =3D NULL;
+        env->cpu_watchpoint[i] =3D NULL;
     }
 }
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index a23cff4424..c2a94a82b3 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -229,26 +229,16 @@ static bool debug_needed(void *opaque)
     return riscv_feature(env, RISCV_FEATURE_DEBUG);
 }
=20
-static const VMStateDescription vmstate_debug_type2 =3D {
-    .name =3D "cpu/debug/type2",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
-    .fields =3D (VMStateField[]) {
-        VMSTATE_UINTTL(mcontrol, type2_trigger_t),
-        VMSTATE_UINTTL(maddress, type2_trigger_t),
-        VMSTATE_END_OF_LIST()
-   }
-};
-
 static const VMStateDescription vmstate_debug =3D {
     .name =3D "cpu/debug",
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .needed =3D debug_needed,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
-        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
-                             0, vmstate_debug_type2, type2_trigger_t),
+        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
+        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
+        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
         VMSTATE_END_OF_LIST()
     }
 };
--=20
2.37.3


