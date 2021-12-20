Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B773747A506
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:31:30 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCCn-0001D4-OT
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:31:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoj-0004dD-Au
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:20 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoe-0000Ep-TI
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976548; x=1671512548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZjX3Vw6obau07urmgg//T3OiwXec/2O2W52h5+oplk=;
 b=HSkDC4mCwMjvn8yGHlLRIgKW73bizq5Kc4iDLYfPcRpJUUm0O80n8cs7
 6NKgNtBbqpqt+QuN25e0L6Jr1mLp8/2fAwFBHe+cODBAy7V0sFexHeW++
 MIwAsQ/oMgF5K3qn/8exfjrEhFKVP29bTlIh2U6RtaU6qS8Gx5A/+FDmK
 771Xx8uAt3+1RlhWRyOTSMoNrhWowRIGBLlOcy/vKbtuOrQF+s3y/ZGUy
 bQZ6bhdrbm7Bheh1K/ztQCgZyedDySbPM8F8VlQkCb9pNJP3zhjtcgsyu
 fV1WgzIl4j5lQfzDQ93LxEy+5MBPPs/+VkEl4CQPfuEiO2zSaP+ASwylb g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662325"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:26 +0800
IronPort-SDR: dT1WRZRpTEa3uxPnPNGgSbz02Rw450JOLzND5yL44zZTVabBlIdooBNMVO96ivPeMMxWKXN006
 iMD5WeR/OO2eZmnKTDO9kjV6ouQG73KPByHgUP7tVe4QQMYM4+QXKp3ZExgFMxZMHhXDEnx72l
 hsaDsS5skHzVs5RcbCCR77xATMzgOmALh31cRDVz56OtNEjyyIXJflbas15yYp410DzlEeS6yd
 Wlvw1F03VSwSePUbEq+E360yFePfke6e0g0nnab1pWIrsv1qc8enbr4i8dOZ4IHy/84wYiSasp
 eh0SnpEUOuGZfVB16Vhn1Jzv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:15 -0800
IronPort-SDR: Cr+eObz1lC3RjE6XKRKHylamdeCGhORVGlAzW+mwnQba2gkL4O0Atkj41UEEIaZOOTgZvRC4LV
 o+suq5RGtT5RQgq7NaqLF4ysuGW++HunHHog0TTxUb5Yu2jOA5X05WRTaYpHBUqcl4JpJslvdv
 PaiZej4/VSuLXCpednw7jyTSWMbEWi/SgJdS9O1+iIkwMzjiDOe/K7Kl3gOve/c+y4e7hwjIRN
 4AERiu0sSP0BGAhXjgOQi96f4cJucstGtL1jdNw2Ju/VFmhGRrIDUb4LfS3LZWueRwZyTpy7Zh
 OUk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBV05cFz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976545; x=1642568546; bh=eZjX3Vw6obau07urmg
 g//T3OiwXec/2O2W52h5+oplk=; b=upS6k64iTd1jWaiCXv4FaXFK6oBkkoBcgQ
 hu+OweQSAFnRKi+Ch7ZqTjk61NKe0Ua/FpLsxSK6Yq5rJVYK4KSu6zqURFku1rup
 /61MHq7WR727sgx8tFREf1+1DuzJ4N3/Xl+JQDPWn8+JgcXAECGPbesCe9+FCD4E
 OPgL6usVGkFavMXnSNQPLUzLQFdCz3LAyRqtUuPk5WtZ/RjxG3tbqcpUAY1H2nBh
 aXspQC6fusrUbaMgQaGsCBI4HCNGwYNI315Y+K7eFV2N5Em7yBNTq2mVmLObBqlL
 RzUu86zED85CjRSjO1PLj0OuLCVxehe6MEuqhRh995JqF3yMf83A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oNXEDflkRQic for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:25 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBQ41kPz1RvTg;
 Sun, 19 Dec 2021 21:02:22 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 77/88] target/riscv: rvv-1.0: floating-point reciprocal
 square-root estimate instruction
Date: Mon, 20 Dec 2021 14:56:54 +1000
Message-Id: <20211220045705.62174-78-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

Implement the floating-point reciprocal square-root estimate to 7 bits
instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-70-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   4 +
 target/riscv/insn32.decode              |   1 +
 target/riscv/vector_helper.c            | 183 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |   1 +
 4 files changed, 189 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a717a87a0e..bdf06dfb24 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -841,6 +841,10 @@ DEF_HELPER_5(vfsqrt_v_h, void, ptr, ptr, ptr, env, i=
32)
 DEF_HELPER_5(vfsqrt_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfsqrt_v_d, void, ptr, ptr, ptr, env, i32)
=20
+DEF_HELPER_5(vfrsqrt7_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrsqrt7_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrsqrt7_v_d, void, ptr, ptr, ptr, env, i32)
+
 DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c4fdc76a26..6e5f288943 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -560,6 +560,7 @@ vfwmsac_vf      111110 . ..... ..... 101 ..... 101011=
1 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfrsqrt7_v      010011 . ..... 00100 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 22848d6b68..d5f3229bcb 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -18,6 +18,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
+#include "qemu/bitops.h"
 #include "cpu.h"
 #include "exec/memop.h"
 #include "exec/exec-all.h"
@@ -3404,6 +3405,188 @@ GEN_VEXT_V_ENV(vfsqrt_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfsqrt_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfsqrt_v_d, 8, 8)
=20
+/*
+ * Vector Floating-Point Reciprocal Square-Root Estimate Instruction
+ *
+ * Adapted from riscv-v-spec recip.c:
+ * https://github.com/riscv/riscv-v-spec/blob/master/recip.c
+ */
+static uint64_t frsqrt7(uint64_t f, int exp_size, int frac_size)
+{
+    uint64_t sign =3D extract64(f, frac_size + exp_size, 1);
+    uint64_t exp =3D extract64(f, frac_size, exp_size);
+    uint64_t frac =3D extract64(f, 0, frac_size);
+
+    const uint8_t lookup_table[] =3D {
+        52, 51, 50, 48, 47, 46, 44, 43,
+        42, 41, 40, 39, 38, 36, 35, 34,
+        33, 32, 31, 30, 30, 29, 28, 27,
+        26, 25, 24, 23, 23, 22, 21, 20,
+        19, 19, 18, 17, 16, 16, 15, 14,
+        14, 13, 12, 12, 11, 10, 10, 9,
+        9, 8, 7, 7, 6, 6, 5, 4,
+        4, 3, 3, 2, 2, 1, 1, 0,
+        127, 125, 123, 121, 119, 118, 116, 114,
+        113, 111, 109, 108, 106, 105, 103, 102,
+        100, 99, 97, 96, 95, 93, 92, 91,
+        90, 88, 87, 86, 85, 84, 83, 82,
+        80, 79, 78, 77, 76, 75, 74, 73,
+        72, 71, 70, 70, 69, 68, 67, 66,
+        65, 64, 63, 63, 62, 61, 60, 59,
+        59, 58, 57, 56, 56, 55, 54, 53
+    };
+    const int precision =3D 7;
+
+    if (exp =3D=3D 0 && frac !=3D 0) { /* subnormal */
+        /* Normalize the subnormal. */
+        while (extract64(frac, frac_size - 1, 1) =3D=3D 0) {
+            exp--;
+            frac <<=3D 1;
+        }
+
+        frac =3D (frac << 1) & MAKE_64BIT_MASK(0, frac_size);
+    }
+
+    int idx =3D ((exp & 1) << (precision - 1)) |
+                (frac >> (frac_size - precision + 1));
+    uint64_t out_frac =3D (uint64_t)(lookup_table[idx]) <<
+                            (frac_size - precision);
+    uint64_t out_exp =3D (3 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp) /=
 2;
+
+    uint64_t val =3D 0;
+    val =3D deposit64(val, 0, frac_size, out_frac);
+    val =3D deposit64(val, frac_size, exp_size, out_exp);
+    val =3D deposit64(val, frac_size + exp_size, 1, sign);
+    return val;
+}
+
+static float16 frsqrt7_h(float16 f, float_status *s)
+{
+    int exp_size =3D 5, frac_size =3D 10;
+    bool sign =3D float16_is_neg(f);
+
+    /*
+     * frsqrt7(sNaN) =3D canonical NaN
+     * frsqrt7(-inf) =3D canonical NaN
+     * frsqrt7(-normal) =3D canonical NaN
+     * frsqrt7(-subnormal) =3D canonical NaN
+     */
+    if (float16_is_signaling_nan(f, s) ||
+            (float16_is_infinity(f) && sign) ||
+            (float16_is_normal(f) && sign) ||
+            (float16_is_zero_or_denormal(f) && !float16_is_zero(f) && si=
gn)) {
+        s->float_exception_flags |=3D float_flag_invalid;
+        return float16_default_nan(s);
+    }
+
+    /* frsqrt7(qNaN) =3D canonical NaN */
+    if (float16_is_quiet_nan(f, s)) {
+        return float16_default_nan(s);
+    }
+
+    /* frsqrt7(+-0) =3D +-inf */
+    if (float16_is_zero(f)) {
+        s->float_exception_flags |=3D float_flag_divbyzero;
+        return float16_set_sign(float16_infinity, sign);
+    }
+
+    /* frsqrt7(+inf) =3D +0 */
+    if (float16_is_infinity(f) && !sign) {
+        return float16_set_sign(float16_zero, sign);
+    }
+
+    /* +normal, +subnormal */
+    uint64_t val =3D frsqrt7(f, exp_size, frac_size);
+    return make_float16(val);
+}
+
+static float32 frsqrt7_s(float32 f, float_status *s)
+{
+    int exp_size =3D 8, frac_size =3D 23;
+    bool sign =3D float32_is_neg(f);
+
+    /*
+     * frsqrt7(sNaN) =3D canonical NaN
+     * frsqrt7(-inf) =3D canonical NaN
+     * frsqrt7(-normal) =3D canonical NaN
+     * frsqrt7(-subnormal) =3D canonical NaN
+     */
+    if (float32_is_signaling_nan(f, s) ||
+            (float32_is_infinity(f) && sign) ||
+            (float32_is_normal(f) && sign) ||
+            (float32_is_zero_or_denormal(f) && !float32_is_zero(f) && si=
gn)) {
+        s->float_exception_flags |=3D float_flag_invalid;
+        return float32_default_nan(s);
+    }
+
+    /* frsqrt7(qNaN) =3D canonical NaN */
+    if (float32_is_quiet_nan(f, s)) {
+        return float32_default_nan(s);
+    }
+
+    /* frsqrt7(+-0) =3D +-inf */
+    if (float32_is_zero(f)) {
+        s->float_exception_flags |=3D float_flag_divbyzero;
+        return float32_set_sign(float32_infinity, sign);
+    }
+
+    /* frsqrt7(+inf) =3D +0 */
+    if (float32_is_infinity(f) && !sign) {
+        return float32_set_sign(float32_zero, sign);
+    }
+
+    /* +normal, +subnormal */
+    uint64_t val =3D frsqrt7(f, exp_size, frac_size);
+    return make_float32(val);
+}
+
+static float64 frsqrt7_d(float64 f, float_status *s)
+{
+    int exp_size =3D 11, frac_size =3D 52;
+    bool sign =3D float64_is_neg(f);
+
+    /*
+     * frsqrt7(sNaN) =3D canonical NaN
+     * frsqrt7(-inf) =3D canonical NaN
+     * frsqrt7(-normal) =3D canonical NaN
+     * frsqrt7(-subnormal) =3D canonical NaN
+     */
+    if (float64_is_signaling_nan(f, s) ||
+            (float64_is_infinity(f) && sign) ||
+            (float64_is_normal(f) && sign) ||
+            (float64_is_zero_or_denormal(f) && !float64_is_zero(f) && si=
gn)) {
+        s->float_exception_flags |=3D float_flag_invalid;
+        return float64_default_nan(s);
+    }
+
+    /* frsqrt7(qNaN) =3D canonical NaN */
+    if (float64_is_quiet_nan(f, s)) {
+        return float64_default_nan(s);
+    }
+
+    /* frsqrt7(+-0) =3D +-inf */
+    if (float64_is_zero(f)) {
+        s->float_exception_flags |=3D float_flag_divbyzero;
+        return float64_set_sign(float64_infinity, sign);
+    }
+
+    /* frsqrt7(+inf) =3D +0 */
+    if (float64_is_infinity(f) && !sign) {
+        return float64_set_sign(float64_zero, sign);
+    }
+
+    /* +normal, +subnormal */
+    uint64_t val =3D frsqrt7(f, exp_size, frac_size);
+    return make_float64(val);
+}
+
+RVVCALL(OPFVV1, vfrsqrt7_v_h, OP_UU_H, H2, H2, frsqrt7_h)
+RVVCALL(OPFVV1, vfrsqrt7_v_w, OP_UU_W, H4, H4, frsqrt7_s)
+RVVCALL(OPFVV1, vfrsqrt7_v_d, OP_UU_D, H8, H8, frsqrt7_d)
+GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8, 8)
+
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number=
)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number=
)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 53c8573f11..8fe718610a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2407,6 +2407,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)  \
 }
=20
 GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
+GEN_OPFV_TRANS(vfrsqrt7_v, opfv_check, RISCV_FRM_DYN)
=20
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
--=20
2.31.1


