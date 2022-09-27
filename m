Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AA15EBB85
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:33:25 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od55o-00063F-Bu
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48C-0005e6-NH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:48 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od489-0001Ix-6I
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260305; x=1695796305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N266dCsPnh4l0atlFrJgTB6RphVexYpVDW7esZm8d+o=;
 b=Me/bUh44pnghFoE7KIjMcJs//Jb81ceoR06hbhxA/OGDoiSjW3OYn2AI
 5E/l3sy56jXMWpX/6ev/w7iBtXFC63yzTEZEV+kyh1t3N6x+j6b91wIPx
 rjGlwc2Z+Orsvjv2Rucq+CXgeiC/HyUBRSC1+TXHOsTfQBbUfx6yahSSC
 ZavHoMXsWOGNqpOeJYdJTB7hDhD3IvHtmHeGszHNge0851j7GQcQ6z+1n
 YVD3d0YmqMobg8PQngRfttnvGNwNAyDwHHPyRjfMrTjcPvl4p3anak0Wy
 GwqjBGpMCQ4/QiOBCe115YL6fOT8iVZdEbldRI/8UQql6oIyaFe1iVq41 A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530895"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:32 +0800
IronPort-SDR: Vzk4a/XHNssD4tirMos5/NauERflnk5mpWMf9TzlFI+YwRzcv0E6hkuWEG8cdUxNTNwufnlgv5
 oWNTlg6/ZoGXZ4Z2gvXhv31/PtqrDRiRjPbe97uJAFeXsT3ub9soW6csPYx+SYSnpTHwDwKsNG
 WIuuxlY/Elo2GX1DLzKfHkSqaGSX6Vj8iH+p6qTNe/sZSEmvDAuyEjkq8EwkplAI2cM0x9BvV8
 m3s8BdN/oqPuGnkH0Xad03/N4uwKSgtuYcWiduIjTC/okRbhKaBbU9vTq/81nxQ1wPoVP1YDCt
 ZXzub6N0G62cZnAeh6zqkfnK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:29 -0700
IronPort-SDR: AXuhqoFlsX5IEO2/N3nXIdVehWBG6+F36iiIeLfTqLQKlIjnbGWSZnVal+3sZXrZ5KTiB9MuBN
 W5DLYl4xJJHuIziS/OLwWV1D0yPnz/O8++0WuZZSmGoMKImWEsYhcSEuZkZ1pI7AVRWZrE61ID
 PG7H17OvEP/BCSX9fZbG2dMEa5irxVrCVfFzlmRstBQ6mOZlm7wVNt85q/1vaGSVFmvbEHrtjm
 iWS1Gp/uAcK+RTIWcZygyGSd0zP8D+bJ1DpNKFzSKjQwh+xTEfjChaPcnbSDWKN3mj2frQbtc/
 XRU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sc36plz1RwtC
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260291; x=1666852292; bh=N266dCsPnh4l0atlFr
 JgTB6RphVexYpVDW7esZm8d+o=; b=S1ZFub3jeAfoExpGxeWZdyCR8a4/z65vGD
 qHpl2ZEc1sHTI0csr3Hb+UHf/TzELFEAzhV7fwqejvN+/uFABCVtGYB2VMLdwohT
 BKjTiam0jO3A8FPFAWuDblQ3SlTRv+NULEV/IimBQ5Eg3kh3/bsnLkmyhrLDkGKz
 2347FpR3O6cU40JhBD3z0x7Vj57huNyW1eIH+glvuQgAJzf43IjqhtIDZVBswOXL
 FN6CBbYkdFEXpeSlqzf/fO0Ghz7UTZzo8ABJSGmNZsu/ZJK9goGC8dlgGt/b//z6
 JXYZORhkdplfsHZP+9dtRbM8lPDhDwpiHz1CirGriDlUI8h3ZBXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nHfp7Wh1cGzW for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sY3Cqwz1RvTr;
 Mon, 26 Sep 2022 23:31:29 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 13/22] target/riscv: debug: Determine the trigger type from
 tdata1.type
Date: Tue, 27 Sep 2022 16:30:55 +1000
Message-Id: <20220927063104.2846825-14-alistair.francis@opensource.wdc.com>
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

Current RISC-V debug assumes that only type 2 trigger is supported.
To allow more types of triggers to be supported in the future
(e.g. type 6 trigger, which is similar to type 2 trigger with additional
 functionality), we should determine the trigger type from tdata1.type.

RV_MAX_TRIGGERS is also introduced in replacement of TRIGGER_TYPE2_NUM.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
[bmeng: fixed MXL_RV128 case, and moved macros to the following patch]
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220909134215.1843865-2-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     |   2 +-
 target/riscv/debug.h   |  13 +--
 target/riscv/csr.c     |   2 +-
 target/riscv/debug.c   | 188 +++++++++++++++++++++++++++++------------
 target/riscv/machine.c |   2 +-
 5 files changed, 140 insertions(+), 67 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 22344a620b..73bcad3c9b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -324,7 +324,7 @@ struct CPUArchState {
=20
     /* trigger module */
     target_ulong trigger_cur;
-    type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
+    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
=20
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 27b9cac6b4..72e4edcd8c 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -22,13 +22,7 @@
 #ifndef RISCV_DEBUG_H
 #define RISCV_DEBUG_H
=20
-/* trigger indexes implemented */
-enum {
-    TRIGGER_TYPE2_IDX_0 =3D 0,
-    TRIGGER_TYPE2_IDX_1,
-    TRIGGER_TYPE2_NUM,
-    TRIGGER_NUM =3D TRIGGER_TYPE2_NUM
-};
+#define RV_MAX_TRIGGERS         2
=20
 /* register index of tdata CSRs */
 enum {
@@ -46,7 +40,8 @@ typedef enum {
     TRIGGER_TYPE_EXCP =3D 5,          /* exception trigger */
     TRIGGER_TYPE_AD_MATCH6 =3D 6,     /* new address/data match trigger =
*/
     TRIGGER_TYPE_EXT_SRC =3D 7,       /* external source trigger */
-    TRIGGER_TYPE_UNAVAIL =3D 15       /* trigger exists, but unavailable=
 */
+    TRIGGER_TYPE_UNAVAIL =3D 15,      /* trigger exists, but unavailable=
 */
+    TRIGGER_TYPE_NUM
 } trigger_type_t;
=20
 typedef struct {
@@ -56,7 +51,7 @@ typedef struct {
     struct CPUWatchpoint *wp;
 } type2_trigger_t;
=20
-/* tdata field masks */
+/* tdata1 field masks */
=20
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
 #define RV32_TYPE_MASK  (0xf << 28)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 092b425196..2c84c29bf0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3070,7 +3070,7 @@ static RISCVException read_tdata(CPURISCVState *env=
, int csrno,
                                  target_ulong *val)
 {
     /* return 0 in tdata1 to end the trigger enumeration */
-    if (env->trigger_cur >=3D TRIGGER_NUM && csrno =3D=3D CSR_TDATA1) {
+    if (env->trigger_cur >=3D RV_MAX_TRIGGERS && csrno =3D=3D CSR_TDATA1=
) {
         *val =3D 0;
         return RISCV_EXCP_NONE;
     }
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index fc6e13222f..9dd468753a 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -52,8 +52,15 @@
 /* tdata availability of a trigger */
 typedef bool tdata_avail[TDATA_NUM];
=20
-static tdata_avail tdata_mapping[TRIGGER_NUM] =3D {
-    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] =3D { true, true, fals=
e },
+static tdata_avail tdata_mapping[TRIGGER_TYPE_NUM] =3D {
+    [TRIGGER_TYPE_NO_EXIST] =3D { false, false, false },
+    [TRIGGER_TYPE_AD_MATCH] =3D { true, true, true },
+    [TRIGGER_TYPE_INST_CNT] =3D { true, false, true },
+    [TRIGGER_TYPE_INT] =3D { true, true, true },
+    [TRIGGER_TYPE_EXCP] =3D { true, true, true },
+    [TRIGGER_TYPE_AD_MATCH6] =3D { true, true, true },
+    [TRIGGER_TYPE_EXT_SRC] =3D { true, false, false },
+    [TRIGGER_TYPE_UNAVAIL] =3D { true, true, true }
 };
=20
 /* only breakpoint size 1/2/4/8 supported */
@@ -67,6 +74,27 @@ static int access_size[SIZE_NUM] =3D {
     [6 ... 15] =3D -1,
 };
=20
+static inline target_ulong extract_trigger_type(CPURISCVState *env,
+                                                target_ulong tdata1)
+{
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        return extract32(tdata1, 28, 4);
+    case MXL_RV64:
+    case MXL_RV128:
+        return extract64(tdata1, 60, 4);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static inline target_ulong get_trigger_type(CPURISCVState *env,
+                                            target_ulong trigger_index)
+{
+    target_ulong tdata1 =3D env->type2_trig[trigger_index].mcontrol;
+    return extract_trigger_type(env, tdata1);
+}
+
 static inline target_ulong trigger_type(CPURISCVState *env,
                                         trigger_type_t type)
 {
@@ -89,15 +117,17 @@ static inline target_ulong trigger_type(CPURISCVStat=
e *env,
=20
 bool tdata_available(CPURISCVState *env, int tdata_index)
 {
+    int trigger_type =3D get_trigger_type(env, env->trigger_cur);
+
     if (unlikely(tdata_index >=3D TDATA_NUM)) {
         return false;
     }
=20
-    if (unlikely(env->trigger_cur >=3D TRIGGER_NUM)) {
+    if (unlikely(env->trigger_cur >=3D RV_MAX_TRIGGERS)) {
         return false;
     }
=20
-    return tdata_mapping[env->trigger_cur][tdata_index];
+    return tdata_mapping[trigger_type][tdata_index];
 }
=20
 target_ulong tselect_csr_read(CPURISCVState *env)
@@ -137,6 +167,7 @@ static target_ulong tdata1_validate(CPURISCVState *en=
v, target_ulong val,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ignoring type write to tdata1 register\n");
     }
+
     if (dmode !=3D 0) {
         qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
     }
@@ -261,9 +292,8 @@ static void type2_breakpoint_remove(CPURISCVState *en=
v, target_ulong index)
 }
=20
 static target_ulong type2_reg_read(CPURISCVState *env,
-                                   target_ulong trigger_index, int tdata=
_index)
+                                   target_ulong index, int tdata_index)
 {
-    uint32_t index =3D trigger_index - TRIGGER_TYPE2_IDX_0;
     target_ulong tdata;
=20
     switch (tdata_index) {
@@ -280,10 +310,9 @@ static target_ulong type2_reg_read(CPURISCVState *en=
v,
     return tdata;
 }
=20
-static void type2_reg_write(CPURISCVState *env, target_ulong trigger_ind=
ex,
+static void type2_reg_write(CPURISCVState *env, target_ulong index,
                             int tdata_index, target_ulong val)
 {
-    uint32_t index =3D trigger_index - TRIGGER_TYPE2_IDX_0;
     target_ulong new_val;
=20
     switch (tdata_index) {
@@ -309,35 +338,64 @@ static void type2_reg_write(CPURISCVState *env, tar=
get_ulong trigger_index,
     return;
 }
=20
-typedef target_ulong (*tdata_read_func)(CPURISCVState *env,
-                                        target_ulong trigger_index,
-                                        int tdata_index);
-
-static tdata_read_func trigger_read_funcs[TRIGGER_NUM] =3D {
-    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] =3D type2_reg_read,
-};
-
-typedef void (*tdata_write_func)(CPURISCVState *env,
-                                 target_ulong trigger_index,
-                                 int tdata_index,
-                                 target_ulong val);
-
-static tdata_write_func trigger_write_funcs[TRIGGER_NUM] =3D {
-    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] =3D type2_reg_write,
-};
-
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
-    tdata_read_func read_func =3D trigger_read_funcs[env->trigger_cur];
+    int trigger_type =3D get_trigger_type(env, env->trigger_cur);
+
+    switch (trigger_type) {
+    case TRIGGER_TYPE_AD_MATCH:
+        return type2_reg_read(env, env->trigger_cur, tdata_index);
+        break;
+    case TRIGGER_TYPE_INST_CNT:
+    case TRIGGER_TYPE_INT:
+    case TRIGGER_TYPE_EXCP:
+    case TRIGGER_TYPE_AD_MATCH6:
+    case TRIGGER_TYPE_EXT_SRC:
+        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
+                      trigger_type);
+        break;
+    case TRIGGER_TYPE_NO_EXIST:
+    case TRIGGER_TYPE_UNAVAIL:
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n=
",
+                      trigger_type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
=20
-    return read_func(env, env->trigger_cur, tdata_index);
+    return 0;
 }
=20
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong v=
al)
 {
-    tdata_write_func write_func =3D trigger_write_funcs[env->trigger_cur=
];
+    int trigger_type;
=20
-    return write_func(env, env->trigger_cur, tdata_index, val);
+    if (tdata_index =3D=3D TDATA1) {
+        trigger_type =3D extract_trigger_type(env, val);
+    } else {
+        trigger_type =3D get_trigger_type(env, env->trigger_cur);
+    }
+
+    switch (trigger_type) {
+    case TRIGGER_TYPE_AD_MATCH:
+        type2_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
+    case TRIGGER_TYPE_INST_CNT:
+    case TRIGGER_TYPE_INT:
+    case TRIGGER_TYPE_EXCP:
+    case TRIGGER_TYPE_AD_MATCH6:
+    case TRIGGER_TYPE_EXT_SRC:
+        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
+                      trigger_type);
+        break;
+    case TRIGGER_TYPE_NO_EXIST:
+    case TRIGGER_TYPE_UNAVAIL:
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n=
",
+                      trigger_type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
 }
=20
 void riscv_cpu_debug_excp_handler(CPUState *cs)
@@ -364,18 +422,28 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
     CPUBreakpoint *bp;
     target_ulong ctrl;
     target_ulong pc;
+    int trigger_type;
     int i;
=20
     QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-        for (i =3D 0; i < TRIGGER_TYPE2_NUM; i++) {
-            ctrl =3D env->type2_trig[i].mcontrol;
-            pc =3D env->type2_trig[i].maddress;
-
-            if ((ctrl & TYPE2_EXEC) && (bp->pc =3D=3D pc)) {
-                /* check U/S/M bit against current privilege level */
-                if ((ctrl >> 3) & BIT(env->priv)) {
-                    return true;
+        for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
+            trigger_type =3D get_trigger_type(env, i);
+
+            switch (trigger_type) {
+            case TRIGGER_TYPE_AD_MATCH:
+                ctrl =3D env->type2_trig[i].mcontrol;
+                pc =3D env->type2_trig[i].maddress;
+
+                if ((ctrl & TYPE2_EXEC) && (bp->pc =3D=3D pc)) {
+                    /* check U/S/M bit against current privilege level *=
/
+                    if ((ctrl >> 3) & BIT(env->priv)) {
+                        return true;
+                    }
                 }
+                break;
+            default:
+                /* other trigger types are not supported or irrelevant *=
/
+                break;
             }
         }
     }
@@ -389,26 +457,36 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs,=
 CPUWatchpoint *wp)
     CPURISCVState *env =3D &cpu->env;
     target_ulong ctrl;
     target_ulong addr;
+    int trigger_type;
     int flags;
     int i;
=20
-    for (i =3D 0; i < TRIGGER_TYPE2_NUM; i++) {
-        ctrl =3D env->type2_trig[i].mcontrol;
-        addr =3D env->type2_trig[i].maddress;
-        flags =3D 0;
+    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
+        trigger_type =3D get_trigger_type(env, i);
=20
-        if (ctrl & TYPE2_LOAD) {
-            flags |=3D BP_MEM_READ;
-        }
-        if (ctrl & TYPE2_STORE) {
-            flags |=3D BP_MEM_WRITE;
-        }
+        switch (trigger_type) {
+        case TRIGGER_TYPE_AD_MATCH:
+            ctrl =3D env->type2_trig[i].mcontrol;
+            addr =3D env->type2_trig[i].maddress;
+            flags =3D 0;
=20
-        if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
-            /* check U/S/M bit against current privilege level */
-            if ((ctrl >> 3) & BIT(env->priv)) {
-                return true;
+            if (ctrl & TYPE2_LOAD) {
+                flags |=3D BP_MEM_READ;
+            }
+            if (ctrl & TYPE2_STORE) {
+                flags |=3D BP_MEM_WRITE;
+            }
+
+            if ((wp->flags & flags) && (wp->vaddr =3D=3D addr)) {
+                /* check U/S/M bit against current privilege level */
+                if ((ctrl >> 3) & BIT(env->priv)) {
+                    return true;
+                }
             }
+            break;
+        default:
+            /* other trigger types are not supported */
+            break;
         }
     }
=20
@@ -417,11 +495,11 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs,=
 CPUWatchpoint *wp)
=20
 void riscv_trigger_init(CPURISCVState *env)
 {
-    target_ulong type2 =3D trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    target_ulong tdata1 =3D trigger_type(env, TRIGGER_TYPE_AD_MATCH);
     int i;
=20
-    /* type 2 triggers */
-    for (i =3D 0; i < TRIGGER_TYPE2_NUM; i++) {
+    /* init to type 2 triggers */
+    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
         /*
          * type =3D TRIGGER_TYPE_AD_MATCH
          * dmode =3D 0 (both debug and M-mode can write tdata)
@@ -435,7 +513,7 @@ void riscv_trigger_init(CPURISCVState *env)
          * chain =3D 0 (unimplemented, always 0)
          * match =3D 0 (always 0, when any compare value equals tdata2)
          */
-        env->type2_trig[i].mcontrol =3D type2;
+        env->type2_trig[i].mcontrol =3D tdata1;
         env->type2_trig[i].maddress =3D 0;
         env->type2_trig[i].bp =3D NULL;
         env->type2_trig[i].wp =3D NULL;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c4e6b3bba4..a23cff4424 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -247,7 +247,7 @@ static const VMStateDescription vmstate_debug =3D {
     .needed =3D debug_needed,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
-        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM=
,
+        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
                              0, vmstate_debug_type2, type2_trigger_t),
         VMSTATE_END_OF_LIST()
     }
--=20
2.37.3


