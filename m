Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9D250ACFF
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:57:28 +0200 (CEST)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhc0-0004do-0q
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJE-00077d-Lc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:05 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJA-0005T7-G5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587880; x=1682123880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=13XW22YX1/vUWb+xM6+DTq3Y9iBQCleYpM6Xj4+Ah9Q=;
 b=V4IOQZu9Oa6RuARD36XX1PNM2OC9wcPj4XHKnMf7NumOVjowoj1j5bLS
 5XSwid+UYdNARpSYG94CwOzpSk1QX1tbXUdgHBWnNNHR79tbB5jZt+giL
 86OPG0jzZdYFzQhD8PLA/U6aHB2SadcbD6NPw6YYKDZlPhy4G82bkIay+
 dTJ9+92jF8qxYRT+h+pN11tih7uHM1LVZofcdImzkN2zZgQ+lwRt7N5Vu
 y6p8HMhf4FjuYEsoEXwwxt36NTzedqg8plg+zwMcpyC1QoitPAuwarmzF
 fNXI2RrJTBnB+QxePpqIAW5Gx26pa8FEnAOjJrujo3sHk2UgjVAYMKQTg w==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="302715752"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:37:46 +0800
IronPort-SDR: 39jSAAdU5hUvPALe0U7OKW97PXCEODKnb5bS1H3h2WmlRLX/k/bWjupLq+UcwkHAUnbKPTOoZ0
 7xioKuz6yIv4HKhukZWlz3TkILo1NoN8NDVcLYMSIZxp0tWHdEjTSiCviim5zUW56z03rpan2Q
 C2ngInmkfc41cN0AqcHJCh6hraF5ZhoDxjLRsL4yo366Qyb1JLvF6Lpsmn+cejg+NqFhikDA9S
 SkPx7LIuoMWJelQ+SFRh7D2QpXQuISt3tfltsC8MkzJt1X6pThu7dmdIm7kMiymXhFvQalWnza
 UPft0XycDBE4POM/592WIFhQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:03 -0700
IronPort-SDR: MYLAGsfftMmO10t4lgGhYWlFKncQmAa1BRVUR2aZmEeHXLUnPaC0UWZkYTjlnE/fKJ8BaiHVOS
 QQlqruRmmVTz8IWKS/PdKL3e4j0gXXhyu+RafkMknf9p5AfHEFxq4YBCg+RsRYqPdCngbM+RYG
 2NHn9pPbtvEdUTnY573vtQWIsQ8+J7bqmlrWpvMduVnwBIVJtaN/+cJ53UeZXxp+V6V4G2OTwx
 +ww8wd6RhmDWxKaDvlghYYMVeYj9RzP/DeZy99YhxnmmSPHfCd9K/3CTdSo8Bxmx7JIwgxRunS
 aHo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:37:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVL3x0yz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:37:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587865; x=1653179866; bh=13XW22YX1/vUWb+xM6
 +DTq3Y9iBQCleYpM6Xj4+Ah9Q=; b=rj03Q5RHKABSajBYObtOoRGBhiAApqcXfi
 e54qu1AEYBfZRpARDxN4x4IY9a9bFLaEn3WbAedOOGg/01M/n+5vhLT1bkRwl9Xu
 d2nwOavNxjlldqVYPUhH19FoJBv9a9It1qoqELiyxgF7AuuwEOEZ95jxPONe2CrY
 3+ogUNl6NwkIbq157mIKHG0nvHYkL+8Kq1CJJrmhWAOlFI/UbPra5uwirTvLBIRv
 uwwcrd3sp8yfTVxS1KRJb5DQQWym+/D2vDvkqFNb9SE5Pz8wlOStqmLURbdQl9RM
 tHKYSgU6zcIRR30n7COLtyL4IqFVw0G/075M1HCRadphoj0rpFgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fEung4SrexHx for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:37:45 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVH1T4Fz1SVp1;
 Thu, 21 Apr 2022 17:37:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 11/31] target/riscv: Add initial support for the Sdtrig
 extension
Date: Fri, 22 Apr 2022 10:36:36 +1000
Message-Id: <20220422003656.1648121-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Bin Meng <bin.meng@windriver.com>

This adds initial support for the Sdtrig extension via the Trigger
Module, as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stab=
le.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220315065529.62198-2-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |   5 +
 target/riscv/debug.h     | 108 +++++++++++++
 target/riscv/debug.c     | 339 +++++++++++++++++++++++++++++++++++++++
 target/riscv/meson.build |   1 +
 4 files changed, 453 insertions(+)
 create mode 100644 target/riscv/debug.h
 create mode 100644 target/riscv/debug.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b90ca8268e..ff3eee4087 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -106,6 +106,7 @@ typedef struct CPUArchState CPURISCVState;
=20
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
+#include "debug.h"
 #endif
=20
 #define RV_VLEN_MAX 1024
@@ -279,6 +280,10 @@ struct CPUArchState {
     pmp_table_t pmp_state;
     target_ulong mseccfg;
=20
+    /* trigger module */
+    target_ulong trigger_cur;
+    type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
+
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
new file mode 100644
index 0000000000..fbc5f946e2
--- /dev/null
+++ b/target/riscv/debug.h
@@ -0,0 +1,108 @@
+/*
+ * QEMU RISC-V Native Debug Support
+ *
+ * Copyright (c) 2022 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RISCV_DEBUG_H
+#define RISCV_DEBUG_H
+
+/* trigger indexes implemented */
+enum {
+    TRIGGER_TYPE2_IDX_0 =3D 0,
+    TRIGGER_TYPE2_IDX_1,
+    TRIGGER_TYPE2_NUM,
+    TRIGGER_NUM =3D TRIGGER_TYPE2_NUM
+};
+
+/* register index of tdata CSRs */
+enum {
+    TDATA1 =3D 0,
+    TDATA2,
+    TDATA3,
+    TDATA_NUM
+};
+
+typedef enum {
+    TRIGGER_TYPE_NO_EXIST =3D 0,      /* trigger does not exist */
+    TRIGGER_TYPE_AD_MATCH =3D 2,      /* address/data match trigger */
+    TRIGGER_TYPE_INST_CNT =3D 3,      /* instruction count trigger */
+    TRIGGER_TYPE_INT =3D 4,           /* interrupt trigger */
+    TRIGGER_TYPE_EXCP =3D 5,          /* exception trigger */
+    TRIGGER_TYPE_AD_MATCH6 =3D 6,     /* new address/data match trigger =
*/
+    TRIGGER_TYPE_EXT_SRC =3D 7,       /* external source trigger */
+    TRIGGER_TYPE_UNAVAIL =3D 15       /* trigger exists, but unavailable=
 */
+} trigger_type_t;
+
+typedef struct {
+    target_ulong mcontrol;
+    target_ulong maddress;
+    struct CPUBreakpoint *bp;
+    struct CPUWatchpoint *wp;
+} type2_trigger_t;
+
+/* tdata field masks */
+
+#define RV32_TYPE(t)    ((uint32_t)(t) << 28)
+#define RV32_TYPE_MASK  (0xf << 28)
+#define RV32_DMODE      BIT(27)
+#define RV64_TYPE(t)    ((uint64_t)(t) << 60)
+#define RV64_TYPE_MASK  (0xfULL << 60)
+#define RV64_DMODE      BIT_ULL(59)
+
+/* mcontrol field masks */
+
+#define TYPE2_LOAD      BIT(0)
+#define TYPE2_STORE     BIT(1)
+#define TYPE2_EXEC      BIT(2)
+#define TYPE2_U         BIT(3)
+#define TYPE2_S         BIT(4)
+#define TYPE2_M         BIT(6)
+#define TYPE2_MATCH     (0xf << 7)
+#define TYPE2_CHAIN     BIT(11)
+#define TYPE2_ACTION    (0xf << 12)
+#define TYPE2_SIZELO    (0x3 << 16)
+#define TYPE2_TIMING    BIT(18)
+#define TYPE2_SELECT    BIT(19)
+#define TYPE2_HIT       BIT(20)
+#define TYPE2_SIZEHI    (0x3 << 21) /* RV64 only */
+
+/* access size */
+enum {
+    SIZE_ANY =3D 0,
+    SIZE_1B,
+    SIZE_2B,
+    SIZE_4B,
+    SIZE_6B,
+    SIZE_8B,
+    SIZE_10B,
+    SIZE_12B,
+    SIZE_14B,
+    SIZE_16B,
+    SIZE_NUM =3D 16
+};
+
+bool tdata_available(CPURISCVState *env, int tdata_index);
+
+target_ulong tselect_csr_read(CPURISCVState *env);
+void tselect_csr_write(CPURISCVState *env, target_ulong val);
+
+target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
+void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong v=
al);
+
+#endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
new file mode 100644
index 0000000000..c8cec39217
--- /dev/null
+++ b/target/riscv/debug.c
@@ -0,0 +1,339 @@
+/*
+ * QEMU RISC-V Native Debug Support
+ *
+ * Copyright (c) 2022 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This provides the native debug support via the Trigger Module, as def=
ined
+ * in the RISC-V Debug Specification:
+ * https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stab=
le.pdf
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "trace.h"
+#include "exec/exec-all.h"
+
+/*
+ * The following M-mode trigger CSRs are implemented:
+ *
+ * - tselect
+ * - tdata1
+ * - tdata2
+ * - tdata3
+ *
+ * We don't support writable 'type' field in the tdata1 register, so the=
re is
+ * no need to implement the "tinfo" CSR.
+ *
+ * The following triggers are implemented:
+ *
+ * Index | Type |          tdata mapping | Description
+ * ------+------+------------------------+------------
+ *     0 |    2 |         tdata1, tdata2 | Address / Data Match
+ *     1 |    2 |         tdata1, tdata2 | Address / Data Match
+ */
+
+/* tdata availability of a trigger */
+typedef bool tdata_avail[TDATA_NUM];
+
+static tdata_avail tdata_mapping[TRIGGER_NUM] =3D {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] =3D { true, true, fals=
e },
+};
+
+/* only breakpoint size 1/2/4/8 supported */
+static int access_size[SIZE_NUM] =3D {
+    [SIZE_ANY] =3D 0,
+    [SIZE_1B]  =3D 1,
+    [SIZE_2B]  =3D 2,
+    [SIZE_4B]  =3D 4,
+    [SIZE_6B]  =3D -1,
+    [SIZE_8B]  =3D 8,
+    [6 ... 15] =3D -1,
+};
+
+static inline target_ulong trigger_type(CPURISCVState *env,
+                                        trigger_type_t type)
+{
+    target_ulong tdata1;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        tdata1 =3D RV32_TYPE(type);
+        break;
+    case MXL_RV64:
+        tdata1 =3D RV64_TYPE(type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return tdata1;
+}
+
+bool tdata_available(CPURISCVState *env, int tdata_index)
+{
+    if (unlikely(tdata_index >=3D TDATA_NUM)) {
+        return false;
+    }
+
+    if (unlikely(env->trigger_cur >=3D TRIGGER_NUM)) {
+        return false;
+    }
+
+    return tdata_mapping[env->trigger_cur][tdata_index];
+}
+
+target_ulong tselect_csr_read(CPURISCVState *env)
+{
+    return env->trigger_cur;
+}
+
+void tselect_csr_write(CPURISCVState *env, target_ulong val)
+{
+    /* all target_ulong bits of tselect are implemented */
+    env->trigger_cur =3D val;
+}
+
+static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val=
,
+                                    trigger_type_t t)
+{
+    uint32_t type, dmode;
+    target_ulong tdata1;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        type =3D extract32(val, 28, 4);
+        dmode =3D extract32(val, 27, 1);
+        tdata1 =3D RV32_TYPE(t);
+        break;
+    case MXL_RV64:
+        type =3D extract64(val, 60, 4);
+        dmode =3D extract64(val, 59, 1);
+        tdata1 =3D RV64_TYPE(t);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (type !=3D t) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring type write to tdata1 register\n");
+    }
+    if (dmode !=3D 0) {
+        qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
+    }
+
+    return tdata1;
+}
+
+static inline void warn_always_zero_bit(target_ulong val, target_ulong m=
ask,
+                                        const char *msg)
+{
+    if (val & mask) {
+        qemu_log_mask(LOG_UNIMP, "%s bit is always zero\n", msg);
+    }
+}
+
+static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong c=
trl)
+{
+    uint32_t size, sizelo, sizehi =3D 0;
+
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
+        sizehi =3D extract32(ctrl, 21, 2);
+    }
+    sizelo =3D extract32(ctrl, 16, 2);
+    size =3D (sizehi << 2) | sizelo;
+
+    return size;
+}
+
+static inline bool type2_breakpoint_enabled(target_ulong ctrl)
+{
+    bool mode =3D !!(ctrl & (TYPE2_U | TYPE2_S | TYPE2_M));
+    bool rwx =3D !!(ctrl & (TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
+
+    return mode && rwx;
+}
+
+static target_ulong type2_mcontrol_validate(CPURISCVState *env,
+                                            target_ulong ctrl)
+{
+    target_ulong val;
+    uint32_t size;
+
+    /* validate the generic part first */
+    val =3D tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, TYPE2_MATCH, "match");
+    warn_always_zero_bit(ctrl, TYPE2_CHAIN, "chain");
+    warn_always_zero_bit(ctrl, TYPE2_ACTION, "action");
+    warn_always_zero_bit(ctrl, TYPE2_TIMING, "timing");
+    warn_always_zero_bit(ctrl, TYPE2_SELECT, "select");
+    warn_always_zero_bit(ctrl, TYPE2_HIT, "hit");
+
+    /* validate size encoding */
+    size =3D type2_breakpoint_size(env, ctrl);
+    if (access_size[size] =3D=3D -1) {
+        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using=
 SIZE_ANY\n",
+                      size);
+    } else {
+        val |=3D (ctrl & TYPE2_SIZELO);
+        if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
+            val |=3D (ctrl & TYPE2_SIZEHI);
+        }
+    }
+
+    /* keep the mode and attribute bits */
+    val |=3D (ctrl & (TYPE2_U | TYPE2_S | TYPE2_M |
+                    TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
+
+    return val;
+}
+
+static void type2_breakpoint_insert(CPURISCVState *env, target_ulong ind=
ex)
+{
+    target_ulong ctrl =3D env->type2_trig[index].mcontrol;
+    target_ulong addr =3D env->type2_trig[index].maddress;
+    bool enabled =3D type2_breakpoint_enabled(ctrl);
+    CPUState *cs =3D env_cpu(env);
+    int flags =3D BP_CPU | BP_STOP_BEFORE_ACCESS;
+    uint32_t size;
+
+    if (!enabled) {
+        return;
+    }
+
+    if (ctrl & TYPE2_EXEC) {
+        cpu_breakpoint_insert(cs, addr, flags, &env->type2_trig[index].b=
p);
+    }
+
+    if (ctrl & TYPE2_LOAD) {
+        flags |=3D BP_MEM_READ;
+    }
+    if (ctrl & TYPE2_STORE) {
+        flags |=3D BP_MEM_WRITE;
+    }
+
+    if (flags & BP_MEM_ACCESS) {
+        size =3D type2_breakpoint_size(env, ctrl);
+        if (size !=3D 0) {
+            cpu_watchpoint_insert(cs, addr, size, flags,
+                                  &env->type2_trig[index].wp);
+        } else {
+            cpu_watchpoint_insert(cs, addr, 8, flags,
+                                  &env->type2_trig[index].wp);
+        }
+    }
+}
+
+static void type2_breakpoint_remove(CPURISCVState *env, target_ulong ind=
ex)
+{
+    CPUState *cs =3D env_cpu(env);
+
+    if (env->type2_trig[index].bp) {
+        cpu_breakpoint_remove_by_ref(cs, env->type2_trig[index].bp);
+        env->type2_trig[index].bp =3D NULL;
+    }
+
+    if (env->type2_trig[index].wp) {
+        cpu_watchpoint_remove_by_ref(cs, env->type2_trig[index].wp);
+        env->type2_trig[index].wp =3D NULL;
+    }
+}
+
+static target_ulong type2_reg_read(CPURISCVState *env,
+                                   target_ulong trigger_index, int tdata=
_index)
+{
+    uint32_t index =3D trigger_index - TRIGGER_TYPE2_IDX_0;
+    target_ulong tdata;
+
+    switch (tdata_index) {
+    case TDATA1:
+        tdata =3D env->type2_trig[index].mcontrol;
+        break;
+    case TDATA2:
+        tdata =3D env->type2_trig[index].maddress;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return tdata;
+}
+
+static void type2_reg_write(CPURISCVState *env, target_ulong trigger_ind=
ex,
+                            int tdata_index, target_ulong val)
+{
+    uint32_t index =3D trigger_index - TRIGGER_TYPE2_IDX_0;
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        new_val =3D type2_mcontrol_validate(env, val);
+        if (new_val !=3D env->type2_trig[index].mcontrol) {
+            env->type2_trig[index].mcontrol =3D new_val;
+            type2_breakpoint_remove(env, index);
+            type2_breakpoint_insert(env, index);
+        }
+        break;
+    case TDATA2:
+        if (val !=3D env->type2_trig[index].maddress) {
+            env->type2_trig[index].maddress =3D val;
+            type2_breakpoint_remove(env, index);
+            type2_breakpoint_insert(env, index);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
+typedef target_ulong (*tdata_read_func)(CPURISCVState *env,
+                                        target_ulong trigger_index,
+                                        int tdata_index);
+
+static tdata_read_func trigger_read_funcs[TRIGGER_NUM] =3D {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] =3D type2_reg_read,
+};
+
+typedef void (*tdata_write_func)(CPURISCVState *env,
+                                 target_ulong trigger_index,
+                                 int tdata_index,
+                                 target_ulong val);
+
+static tdata_write_func trigger_write_funcs[TRIGGER_NUM] =3D {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] =3D type2_reg_write,
+};
+
+target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
+{
+    tdata_read_func read_func =3D trigger_read_funcs[env->trigger_cur];
+
+    return read_func(env, env->trigger_cur, tdata_index);
+}
+
+void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong v=
al)
+{
+    tdata_write_func write_func =3D trigger_write_funcs[env->trigger_cur=
];
+
+    return write_func(env, env->trigger_cur, tdata_index, val);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 91f0ac32ff..2c20f3dd8e 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -27,6 +27,7 @@ riscv_softmmu_ss =3D ss.source_set()
 riscv_softmmu_ss.add(files(
   'arch_dump.c',
   'pmp.c',
+  'debug.c',
   'monitor.c',
   'machine.c'
 ))
--=20
2.35.1


