Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2447A4E1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:13:14 +0100 (CET)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBv7-0004nG-P9
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:13:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAox-0004dP-3P
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:47 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoi-0000FH-T1
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976552; x=1671512552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FlLlLdr4SilIqEI0NQGenomt8gxNEi5pbyUvu7RghdE=;
 b=o7ry4S25UxDK+muw1jJJHt17XFaVqAEv+KTy+V4mUF9z4gGVd+7CrMvn
 HZgpbv5cQLk0EBLDU0bvqCMHXjR99IoMixWmbfgM3u/RctggbgVzTO8RM
 12i5lOsRdgVfFJjz1o7zJhf6jYzu5468RWp1y4RVzDbvpv/NjZ9Y0Laxb
 CfmU4E6iIylnZy3ToQ2KPHtlHNsVjSiP7OVX62TCGXvgC5jznFuQr5iKv
 8KR4GALalAFhrxNMNEuA7RPQq8gLnTygfSJe2heYVAsi8lOg7MRLG0wtT
 veBe29H0x6kqUIY6ng1kBI4EKYfikdtEjRmCGjNEyNKuONR9OOBm1hYDc Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662328"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:30 +0800
IronPort-SDR: I9ylj5IjLO/lEo/PwOgBgLtIXeRpQptBywMgKeTEbEjWcV30V4c7pjrCAHxUhkMRj5Mu8Vqjp7
 MLJQ6uMzNRr8MQDi6EYlfwkuiigz/gKveM/s/CWDhvaaDH/JdhYofD04pdX1ngKwf4SFtK5AGC
 +5XVX/lcLGxdn6JiBv2bUb58JCSAlQE5sqrmOMq3ESRTTfOxk8MCqSPuEByU2+FT8mEXz6tCJq
 gFOtWp1Yyk2IPdHqCcpaJOEqe4RqDCd+L4kWPPbKrRbt0cFa68T/KHAYOVoh5MzrcNsSx2RTxj
 pVmwJ+UjXOC6QP8ruXvu/VrN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:19 -0800
IronPort-SDR: rZRZkXIJrpiFLhaSYlZSoakGv+939ncKtG6s5Vr18+yZbFfsVivESCLSSHgA3W7awpPhXbRa7h
 CGXB/2ymcCbx/wb5hK8wuE7e9TNKoGv+X+sfPGPkwAQIVhPnHT5aHt5R5eD1qwn6h6LBQMJrtS
 GcPEWBMikLhVRQkSQ69oG4SGhZ2UungnuKQsYF7Qzu4jLP8SfP0+aGl+IFmcHRE23siTcZcV5J
 mcIrp9HIm+NHQ3Ob3DHy1uppg8g6ni63pmWq15sg4O1EVRY0CUfepDawT74DR2BN4+M/8MrKJH
 Jp8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBY5gBQz1RtVG
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976549; x=1642568550; bh=FlLlLdr4SilIqEI0NQ
 Genomt8gxNEi5pbyUvu7RghdE=; b=t1Yi7h+zYybYPmrNw2dhRrtGXQtkNgtMh4
 UkR+mk4dLqjrPpSjYZm0oIT9S/tBWcTfOw8ZB2qlEfSECMW+r6auCMnFBliH9NPL
 KaRc/qpVjP3lEXy4ryqjlbO2WLnNNl0lSotrDBATOLZNB6vfKQOds0XHXradv3xR
 K/W59E4V/MDRJBRF06iYZ/mP7OV0+NVFaCgwq/S5s+t/WWvCt6wXA+pIdQ161jTM
 xKovOsv/nS/orMsIOIbS5EfHxnucjs1mA/4LbKwUIAqc3v0OjR88lRiRzVGIJIxa
 qOrmf3VmN8uCi8SILs9j0YdazEAgEAPplTwU66LwiZVavvGB16fw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id weDJNJF6I6PO for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:29 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBV0PNKz1RvTg;
 Sun, 19 Dec 2021 21:02:25 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 78/88] target/riscv: rvv-1.0: floating-point reciprocal
 estimate instruction
Date: Mon, 20 Dec 2021 14:56:55 +1000
Message-Id: <20211220045705.62174-79-alistair.francis@opensource.wdc.com>
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

Implement the floating-point reciprocal estimate to 7 bits instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-71-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   4 +
 target/riscv/insn32.decode              |   1 +
 target/riscv/vector_helper.c            | 191 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |   1 +
 4 files changed, 197 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index bdf06dfb24..ab283d12b7 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -845,6 +845,10 @@ DEF_HELPER_5(vfrsqrt7_v_h, void, ptr, ptr, ptr, env,=
 i32)
 DEF_HELPER_5(vfrsqrt7_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfrsqrt7_v_d, void, ptr, ptr, ptr, env, i32)
=20
+DEF_HELPER_5(vfrec7_v_h, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrec7_v_w, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_5(vfrec7_v_d, void, ptr, ptr, ptr, env, i32)
+
 DEF_HELPER_6(vfmin_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vfmin_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6e5f288943..952768f8de 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -561,6 +561,7 @@ vfwnmsac_vv     111111 . ..... ..... 001 ..... 101011=
1 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
 vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfrsqrt7_v      010011 . ..... 00100 001 ..... 1010111 @r2_vm
+vfrec7_v        010011 . ..... 00101 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d5f3229bcb..946dca53ff 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3587,6 +3587,197 @@ GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2, 2)
 GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4, 4)
 GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8, 8)
=20
+/*
+ * Vector Floating-Point Reciprocal Estimate Instruction
+ *
+ * Adapted from riscv-v-spec recip.c:
+ * https://github.com/riscv/riscv-v-spec/blob/master/recip.c
+ */
+static uint64_t frec7(uint64_t f, int exp_size, int frac_size,
+                      float_status *s)
+{
+    uint64_t sign =3D extract64(f, frac_size + exp_size, 1);
+    uint64_t exp =3D extract64(f, frac_size, exp_size);
+    uint64_t frac =3D extract64(f, 0, frac_size);
+
+    const uint8_t lookup_table[] =3D {
+        127, 125, 123, 121, 119, 117, 116, 114,
+        112, 110, 109, 107, 105, 104, 102, 100,
+        99, 97, 96, 94, 93, 91, 90, 88,
+        87, 85, 84, 83, 81, 80, 79, 77,
+        76, 75, 74, 72, 71, 70, 69, 68,
+        66, 65, 64, 63, 62, 61, 60, 59,
+        58, 57, 56, 55, 54, 53, 52, 51,
+        50, 49, 48, 47, 46, 45, 44, 43,
+        42, 41, 40, 40, 39, 38, 37, 36,
+        35, 35, 34, 33, 32, 31, 31, 30,
+        29, 28, 28, 27, 26, 25, 25, 24,
+        23, 23, 22, 21, 21, 20, 19, 19,
+        18, 17, 17, 16, 15, 15, 14, 14,
+        13, 12, 12, 11, 11, 10, 9, 9,
+        8, 8, 7, 7, 6, 5, 5, 4,
+        4, 3, 3, 2, 2, 1, 1, 0
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
+
+        if (exp !=3D 0 && exp !=3D UINT64_MAX) {
+            /*
+             * Overflow to inf or max value of same sign,
+             * depending on sign and rounding mode.
+             */
+            s->float_exception_flags |=3D (float_flag_inexact |
+                                         float_flag_overflow);
+
+            if ((s->float_rounding_mode =3D=3D float_round_to_zero) ||
+                ((s->float_rounding_mode =3D=3D float_round_down) && !si=
gn) ||
+                ((s->float_rounding_mode =3D=3D float_round_up) && sign)=
) {
+                /* Return greatest/negative finite value. */
+                return (sign << (exp_size + frac_size)) |
+                    (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
+            } else {
+                /* Return +-inf. */
+                return (sign << (exp_size + frac_size)) |
+                    MAKE_64BIT_MASK(frac_size, exp_size);
+            }
+        }
+    }
+
+    int idx =3D frac >> (frac_size - precision);
+    uint64_t out_frac =3D (uint64_t)(lookup_table[idx]) <<
+                            (frac_size - precision);
+    uint64_t out_exp =3D 2 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp;
+
+    if (out_exp =3D=3D 0 || out_exp =3D=3D UINT64_MAX) {
+        /*
+         * The result is subnormal, but don't raise the underflow except=
ion,
+         * because there's no additional loss of precision.
+         */
+        out_frac =3D (out_frac >> 1) | MAKE_64BIT_MASK(frac_size - 1, 1)=
;
+        if (out_exp =3D=3D UINT64_MAX) {
+            out_frac >>=3D 1;
+            out_exp =3D 0;
+        }
+    }
+
+    uint64_t val =3D 0;
+    val =3D deposit64(val, 0, frac_size, out_frac);
+    val =3D deposit64(val, frac_size, exp_size, out_exp);
+    val =3D deposit64(val, frac_size + exp_size, 1, sign);
+    return val;
+}
+
+static float16 frec7_h(float16 f, float_status *s)
+{
+    int exp_size =3D 5, frac_size =3D 10;
+    bool sign =3D float16_is_neg(f);
+
+    /* frec7(+-inf) =3D +-0 */
+    if (float16_is_infinity(f)) {
+        return float16_set_sign(float16_zero, sign);
+    }
+
+    /* frec7(+-0) =3D +-inf */
+    if (float16_is_zero(f)) {
+        s->float_exception_flags |=3D float_flag_divbyzero;
+        return float16_set_sign(float16_infinity, sign);
+    }
+
+    /* frec7(sNaN) =3D canonical NaN */
+    if (float16_is_signaling_nan(f, s)) {
+        s->float_exception_flags |=3D float_flag_invalid;
+        return float16_default_nan(s);
+    }
+
+    /* frec7(qNaN) =3D canonical NaN */
+    if (float16_is_quiet_nan(f, s)) {
+        return float16_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val =3D frec7(f, exp_size, frac_size, s);
+    return make_float16(val);
+}
+
+static float32 frec7_s(float32 f, float_status *s)
+{
+    int exp_size =3D 8, frac_size =3D 23;
+    bool sign =3D float32_is_neg(f);
+
+    /* frec7(+-inf) =3D +-0 */
+    if (float32_is_infinity(f)) {
+        return float32_set_sign(float32_zero, sign);
+    }
+
+    /* frec7(+-0) =3D +-inf */
+    if (float32_is_zero(f)) {
+        s->float_exception_flags |=3D float_flag_divbyzero;
+        return float32_set_sign(float32_infinity, sign);
+    }
+
+    /* frec7(sNaN) =3D canonical NaN */
+    if (float32_is_signaling_nan(f, s)) {
+        s->float_exception_flags |=3D float_flag_invalid;
+        return float32_default_nan(s);
+    }
+
+    /* frec7(qNaN) =3D canonical NaN */
+    if (float32_is_quiet_nan(f, s)) {
+        return float32_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val =3D frec7(f, exp_size, frac_size, s);
+    return make_float32(val);
+}
+
+static float64 frec7_d(float64 f, float_status *s)
+{
+    int exp_size =3D 11, frac_size =3D 52;
+    bool sign =3D float64_is_neg(f);
+
+    /* frec7(+-inf) =3D +-0 */
+    if (float64_is_infinity(f)) {
+        return float64_set_sign(float64_zero, sign);
+    }
+
+    /* frec7(+-0) =3D +-inf */
+    if (float64_is_zero(f)) {
+        s->float_exception_flags |=3D float_flag_divbyzero;
+        return float64_set_sign(float64_infinity, sign);
+    }
+
+    /* frec7(sNaN) =3D canonical NaN */
+    if (float64_is_signaling_nan(f, s)) {
+        s->float_exception_flags |=3D float_flag_invalid;
+        return float64_default_nan(s);
+    }
+
+    /* frec7(qNaN) =3D canonical NaN */
+    if (float64_is_quiet_nan(f, s)) {
+        return float64_default_nan(s);
+    }
+
+    /* +-normal, +-subnormal */
+    uint64_t val =3D frec7(f, exp_size, frac_size, s);
+    return make_float64(val);
+}
+
+RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
+RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
+RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
+GEN_VEXT_V_ENV(vfrec7_v_h, 2, 2)
+GEN_VEXT_V_ENV(vfrec7_v_w, 4, 4)
+GEN_VEXT_V_ENV(vfrec7_v_d, 8, 8)
+
 /* Vector Floating-Point MIN/MAX Instructions */
 RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number=
)
 RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number=
)
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 8fe718610a..ff8f6df8f7 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2408,6 +2408,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)  \
=20
 GEN_OPFV_TRANS(vfsqrt_v, opfv_check, RISCV_FRM_DYN)
 GEN_OPFV_TRANS(vfrsqrt7_v, opfv_check, RISCV_FRM_DYN)
+GEN_OPFV_TRANS(vfrec7_v, opfv_check, RISCV_FRM_DYN)
=20
 /* Vector Floating-Point MIN/MAX Instructions */
 GEN_OPFVV_TRANS(vfmin_vv, opfvv_check)
--=20
2.31.1


