Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29939EB02
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 02:51:04 +0200 (CEST)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqPxP-00065s-J1
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 20:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPf7-0003i3-7X
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:09 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:19707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7863c9c60=alistair.francis@wdc.com>)
 id 1lqPf4-0004b7-O2
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 20:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623112324; x=1654648324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5qbbgNh2/aE9Fr0P1otbimZxeluEatIWSS3R9xmUJFo=;
 b=kmMf6ZYU5jX/LfAkIBdefX0onTy91bqRrOzlojIA2j/csYqR3hMXiQoG
 kQOaQMlIR0o02h0jsfNMQW3WuP4Grmz7A/gMXXM36xNtMjTSHj3kWxsjN
 bktuRGEpZiI5tZwqpJwjuje6LxxhV/6WghPACBRCObvjxyAC247HnnGGM
 zz4SFl/5b2xYrzWtijdTCttVmA4XAfYYHC/xu74JX/+DCfPGwvFZcd5vD
 p6Yovh6YY6ullmRD2Q3DXEe5UQATFsUzsCE+riEY4NepFMFfCNjkjvA6R
 e0YAy777lpsnQTeNk5DD8gxv7lHcdyKwuNNOU6w7b9wkJguxchYJFZDGU Q==;
IronPort-SDR: BZmDKjwPLIX7tXgghsC3gVu75mULMCEukQjX/wi4MSGDn9yMDQnWU1bLm1NRJX48nQ5R+faTYU
 bzfdsKPS00/UR7goqeF4U+5kYA3l88tc0w5odABTtjO65fG1b3lYwXT/QTXJxBgSRqDf6u5wVu
 X/nzy9s1pcFnZFBybKbW5q6K8EW5WIBXBIWHbHwRQQu5ErNwGgMbbmdtY8GX6muBe1wQNIcX8y
 IKAu0mJ8rpeZXAAgXXSR07cdbe3vc0xfQMkEC+KAyPpIO+OKUjmTuE1kcw1N7ewTBq2B41j4jr
 0GY=
X-IronPort-AV: E=Sophos;i="5.83,256,1616428800"; d="scan'208";a="171087461"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2021 08:31:42 +0800
IronPort-SDR: Wo9LqQ7hrA0y/5OxMgdwHY811SdhGTZ4lLaHwov6Ju5qvIV/vBdnKjINXus4wmBIjolP1F4m77
 fJGCWf1ktn9dhJB5aqSQ4deBpIj+vzDp4W/UIuDrxJ5NvFnxrOOBQ4CdYOUJTXEGwe1qIBEbHj
 ri2wTiqE9kKXQwI0QS0/p9CLguKLpLmIEe0GIf3tWZU/rDdwpxLChnp69zNHZTSJieUrYQ2dYu
 6+S44C1aCm2H9X/S3BHMnEvlmhAoO918mZemSp8SyH7aJAWOYYfJouAtrozKAy4reJRal+wH91
 sYHOvThXx5fXGxbdubILnYQ3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:10:49 -0700
IronPort-SDR: jdXzUzORUCNDSPm7bMaCABBratcDqhBIBkdGt6Dg1wZiXlACmj/BtInb7BHvzVk+V3pSUK3+/C
 gDFeQJFBmd0Ow4LGr0ZpXMH3NGbm801Qn65GuD7x+Zh56N7tF9nA3uryVfSgnhS1DDLXPJYS8h
 AcG387k06VrFeH+PbBwxtPqU8DgkJ9hBX738498VQHLv1CNqe/93WLUWcWPEpk2K2LszqBQQQV
 21h9QcBl9Ft242TDe58P/RFb5oPUQ0s6tSXsA4tWabW16zagxWQP33dtqclCeNXo9TA9PjN+79
 kRU=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.82])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2021 17:31:40 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 27/32] target/riscv: rvb: generalized reverse
Date: Tue,  8 Jun 2021 10:29:42 +1000
Message-Id: <20210608002947.1649775-28-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608002947.1649775-1-alistair.francis@wdc.com>
References: <20210608002947.1649775-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7863c9c60=alistair.francis@wdc.com;
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210505160620.15723-13-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  4 ++
 target/riscv/insn32.decode              |  4 ++
 target/riscv/bitmanip_helper.c          | 64 +++++++++++++++++++++++++
 target/riscv/translate.c                | 28 +++++++++++
 target/riscv/insn_trans/trans_rvb.c.inc | 31 ++++++++++++
 target/riscv/meson.build                |  1 +
 6 files changed, 132 insertions(+)
 create mode 100644 target/riscv/bitmanip_helper.c

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7267593c3..f81b8faf3b 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -58,6 +58,10 @@ DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
+/* Bitmanip */
+DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+
 /* Special functions */
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
 DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 71a9a182c0..6b5e276a9f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -684,6 +684,7 @@ slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
+grev       0110100 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -692,6 +693,7 @@ bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
+grevi      01101. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -708,6 +710,7 @@ slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
+grevw      0110100 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -715,3 +718,4 @@ binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
+greviw     0110100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
new file mode 100644
index 0000000000..c625adaded
--- /dev/null
+++ b/target/riscv/bitmanip_helper.c
@@ -0,0 +1,64 @@
+/*
+ * RISC-V Bitmanip Extension Helpers for QEMU.
+ *
+ * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
+ * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "tcg/tcg.h"
+
+static const uint64_t adjacent_masks[] = {
+    dup_const(MO_8, 0x55),
+    dup_const(MO_8, 0x33),
+    dup_const(MO_8, 0x0f),
+    dup_const(MO_16, 0xff),
+    dup_const(MO_32, 0xffff),
+    UINT32_MAX
+};
+
+static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
+{
+    return ((x & mask) << shift) | ((x & ~mask) >> shift);
+}
+
+static target_ulong do_grev(target_ulong rs1,
+                            target_ulong rs2,
+                            int bits)
+{
+    target_ulong x = rs1;
+    int i, shift;
+
+    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
+        if (rs2 & shift) {
+            x = do_swap(x, adjacent_masks[i], shift);
+        }
+    }
+
+    return x;
+}
+
+target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
+{
+    return do_grev(rs1, rs2, TARGET_LONG_BITS);
+}
+
+target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_grev(rs1, rs2, 32);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c09b93f1b8..8deb05add4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -627,6 +627,28 @@ static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_gen_not_tl(ret, ret);
 }
 
+static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    TCGv source1 = tcg_temp_new();
+    TCGv source2;
+
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt == (TARGET_LONG_BITS - 8)) {
+        /* rev8, byte swaps */
+        tcg_gen_bswap_tl(source1, source1);
+    } else {
+        source2 = tcg_temp_new();
+        tcg_gen_movi_tl(source2, a->shamt);
+        gen_helper_grev(source1, source1, source2);
+        tcg_temp_free(source2);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 static void gen_ctzw(TCGv ret, TCGv arg1)
 {
     tcg_gen_ori_tl(ret, arg1, (target_ulong)MAKE_64BIT_MASK(32, 32));
@@ -699,6 +721,12 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free_i32(t2);
 }
 
+static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_grev(ret, arg1, arg2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 429738db15..281e0ffae9 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -197,6 +197,23 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, tcg_gen_rotl_tl);
 }
 
+static bool trans_grev(DisasContext *ctx, arg_grev *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_helper_grev);
+}
+
+static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_grevi(ctx, a);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -329,3 +346,17 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftw(ctx, a, gen_rolw);
 }
+
+static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_grevw);
+}
+
+static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_grevw);
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index af6c3416b7..d5e0bc93ea 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -16,6 +16,7 @@ riscv_ss.add(files(
   'gdbstub.c',
   'op_helper.c',
   'vector_helper.c',
+  'bitmanip_helper.c',
   'translate.c',
 ))
 
-- 
2.31.1


