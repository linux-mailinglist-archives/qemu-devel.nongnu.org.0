Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F904CB686
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:41:42 +0100 (CET)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeDd-0005WG-Nn
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:41:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1c-0002Ix-Jr
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:17 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:40211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1Y-0001Qo-VA
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285352; x=1677821352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0yp508kCJ21b0ZtcmKpbvrnR3j3hxzsjza6uDnTQ0o=;
 b=pa4hG9p7+WKy26IzoJsRBNwpDnVxrC+kb8wuquobV+NE6INoF5sdMhqA
 W5dXkqwHsNTJ6MU8kkFkrPjMeOFUbSQ9XnuToGZxUI3XU7UnfMBGaenyQ
 LfdMhXkQs7y7f/l+RI4ps/fchRu5hBr3JjVUA4ibr4cHUplIgns1zY1+x
 hAp+IuON6HBf3dt6ndIvmgsRS2jXc7cuObGv3AP0R4o/QtTL3kAEMmprE
 RxyOzwb8D167r0r1KkHwrjVHMMF5v8K5W5h9MGaxt12X27xBHnAxsomCb
 RjfWGC3jUtwuP5eWomBwwjc9H1XzVoHqogcWuWKl/LPvYTORX5+QZcwzJ g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="298483252"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:29:11 +0800
IronPort-SDR: fghOvNBKkC7bLAR1Fc4HCOw78xiGB/6uNkV1IfzgR7/2XSOpwKG0WvD7YyUfdmYRrOwybfD1dv
 RPc+kSKCI8hW+0wz08zlB1GKtWx/bQeYLTD/qIcPDY8dppRz/dLGa4nRkBAvddhDBUVIf/Waau
 P0cJ8ystCy9kdP9TMyMqi4jBP3Rv1OIpd7fCQiROxtZgaVzTaOCgDOhczFkBrQY0ozaubCVHMZ
 cKD987Ubk/piOQDKYh/3wGbj7y/nm6V6/dBuTkrcSJioaIAOYJNCYMA0kz2KeWZeOEUUPKILtF
 KpIAQf0A6j4rlhgUQRxpvQtr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:33 -0800
IronPort-SDR: AUsb/DiYmlzrCsBVdrkhf/egp+0ZWiNAw2Q24iGR06ZKKNKxq2yPb9C/aX7uonu92TkeOhTUPY
 HxduuZvzBjQ3haRrlP8cu3AeOczpFQKcDelp24q3g40SfW1/VwlTvFOSUKU0wqI3VvFULIpGcu
 x9yCCUGQJDngDZBeW00tyaIUrmQWUlDHLMp41Wm/lLvR+Cw9B3HJSpurjzTReWkEIa48S4dhZB
 BwyopxGjbHSWFZqUQZfGIU3u37s6if8kLRzB6ZNRAFnpW7IaVkDUEEXZTD7OO52TemOgUspv42
 x6k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:29:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKf5g4Bz1SHwl
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:29:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285348; x=1648877349; bh=o0yp508kCJ21b0Ztcm
 KpbvrnR3j3hxzsjza6uDnTQ0o=; b=MYabmqW8aHuQ6aNzP1xSFZaE2zsdQxqS0C
 KLwF/v7DWpvf9TP93na51qCQFUAuSNPTIyildDW90hKIAUAPYwpNAEzcLSaDDIky
 bGVGsDXA7rKNzmRwqvCWTVDMZ0Y6O3eCWPS9U2EqB9p6b5VGhtZhWr2fbrjmnund
 oeDI9me4Vb5soxr1fNugh573OuIoo9UIAvCqBv7hlYf9p1D8znQG0ONbBlKMl1QJ
 BQqKep1mb5LQqCfW3C3d5UuZ2UMOXO0//7zmP9SuahA7Ih2J+TqZFpVPtQ0uMRKB
 6HAO7gXa6NBu72j592PiGfaM8RiRRa9buV/KOG+87kP1NOUo4UEg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LyYYQIo_ZX6a for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:29:08 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KKW2Vbcz1Rvlx;
 Wed,  2 Mar 2022 21:29:02 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 ardxwe <ardxwe@gmail.com>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/13] target/riscv: add support for zfinx
Date: Thu,  3 Mar 2022 15:28:01 +1000
Message-Id: <20220303052804.529967-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

  - update extension check REQUIRE_ZFINX_OR_F
  - update single float point register read/write
  - disable nanbox_s check

Co-authored-by: ardxwe <ardxwe@gmail.com>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220211043920.28981-4-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   2 +-
 target/riscv/internals.h                |  16 +-
 target/riscv/fpu_helper.c               |  89 +++----
 target/riscv/translate.c                |  93 ++++++-
 target/riscv/insn_trans/trans_rvf.c.inc | 314 ++++++++++++++++--------
 5 files changed, 369 insertions(+), 145 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 72cc2582f4..89195aad9d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -38,7 +38,7 @@ DEF_HELPER_FLAGS_2(fcvt_s_w, TCG_CALL_NO_RWG, i64, env,=
 tl)
 DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_1(fclass_s, TCG_CALL_NO_RWG_SE, tl, i64)
+DEF_HELPER_FLAGS_2(fclass_s, TCG_CALL_NO_RWG_SE, tl, env, i64)
=20
 /* Floating Point - Double Precision */
 DEF_HELPER_FLAGS_3(fadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 065e8162a2..6237bb3115 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -46,13 +46,23 @@ enum {
     RISCV_FRM_ROD =3D 8,  /* Round to Odd */
 };
=20
-static inline uint64_t nanbox_s(float32 f)
+static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
 {
-    return f | MAKE_64BIT_MASK(32, 32);
+    /* the value is sign-extended instead of NaN-boxing for zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (int32_t)f;
+    } else {
+        return f | MAKE_64BIT_MASK(32, 32);
+    }
 }
=20
-static inline float32 check_nanbox_s(uint64_t f)
+static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
 {
+    /* Disable NaN-boxing check when enable zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (uint32_t)f;
+    }
+
     uint64_t mask =3D MAKE_64BIT_MASK(32, 32);
=20
     if (likely((f & mask) =3D=3D mask)) {
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 4a5982d594..63ca703459 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -98,10 +98,11 @@ static uint64_t do_fmadd_h(CPURISCVState *env, uint64=
_t rs1, uint64_t rs2,
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs=
2,
                            uint64_t rs3, int flags)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
-    float32 frs3 =3D check_nanbox_s(rs3);
-    return nanbox_s(float32_muladd(frs1, frs2, frs3, flags, &env->fp_sta=
tus));
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
+    float32 frs3 =3D check_nanbox_s(env, rs3);
+    return nanbox_s(env, float32_muladd(frs1, frs2, frs3, flags,
+                                        &env->fp_status));
 }
=20
 uint64_t helper_fmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2=
,
@@ -183,124 +184,124 @@ uint64_t helper_fnmadd_h(CPURISCVState *env, uint=
64_t frs1, uint64_t frs2,
=20
 uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(float32_add(frs1, frs2, &env->fp_status));
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_add(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fsub_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(float32_sub(frs1, frs2, &env->fp_status));
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_sub(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fmul_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(float32_mul(frs1, frs2, &env->fp_status));
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_mul(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fdiv_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(float32_div(frs1, frs2, &env->fp_status));
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
+    return nanbox_s(env, float32_div(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
+    return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float32_minnum(frs1, frs2, &env->fp_status) :
                     float32_minimum_number(frs1, frs2, &env->fp_status))=
;
 }
=20
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
-    return nanbox_s(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
+    return nanbox_s(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float32_maxnum(frs1, frs2, &env->fp_status) :
                     float32_maximum_number(frs1, frs2, &env->fp_status))=
;
 }
=20
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    return nanbox_s(float32_sqrt(frs1, &env->fp_status));
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    return nanbox_s(env, float32_sqrt(frs1, &env->fp_status));
 }
=20
 target_ulong helper_fle_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
     return float32_le(frs1, frs2, &env->fp_status);
 }
=20
 target_ulong helper_flt_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
     return float32_lt(frs1, frs2, &env->fp_status);
 }
=20
 target_ulong helper_feq_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
-    float32 frs2 =3D check_nanbox_s(rs2);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
+    float32 frs2 =3D check_nanbox_s(env, rs2);
     return float32_eq_quiet(frs1, frs2, &env->fp_status);
 }
=20
 target_ulong helper_fcvt_w_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
     return float32_to_int32(frs1, &env->fp_status);
 }
=20
 target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
     return (int32_t)float32_to_uint32(frs1, &env->fp_status);
 }
=20
 target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
     return float32_to_int64(frs1, &env->fp_status);
 }
=20
 target_ulong helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
     return float32_to_uint64(frs1, &env->fp_status);
 }
=20
 uint64_t helper_fcvt_s_w(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(int32_to_float32((int32_t)rs1, &env->fp_status));
+    return nanbox_s(env, int32_to_float32((int32_t)rs1, &env->fp_status)=
);
 }
=20
 uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(uint32_to_float32((uint32_t)rs1, &env->fp_status));
+    return nanbox_s(env, uint32_to_float32((uint32_t)rs1, &env->fp_statu=
s));
 }
=20
 uint64_t helper_fcvt_s_l(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(int64_to_float32(rs1, &env->fp_status));
+    return nanbox_s(env, int64_to_float32(rs1, &env->fp_status));
 }
=20
 uint64_t helper_fcvt_s_lu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
+    return nanbox_s(env, uint64_to_float32(rs1, &env->fp_status));
 }
=20
-target_ulong helper_fclass_s(uint64_t rs1)
+target_ulong helper_fclass_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
     return fclass_s(frs1);
 }
=20
@@ -340,12 +341,12 @@ uint64_t helper_fmax_d(CPURISCVState *env, uint64_t=
 frs1, uint64_t frs2)
=20
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
 {
-    return nanbox_s(float64_to_float32(rs1, &env->fp_status));
+    return nanbox_s(env, float64_to_float32(rs1, &env->fp_status));
 }
=20
 uint64_t helper_fcvt_d_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
     return float32_to_float64(frs1, &env->fp_status);
 }
=20
@@ -539,14 +540,14 @@ uint64_t helper_fcvt_h_lu(CPURISCVState *env, targe=
t_ulong rs1)
=20
 uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
 {
-    float32 frs1 =3D check_nanbox_s(rs1);
+    float32 frs1 =3D check_nanbox_s(env, rs1);
     return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
 }
=20
 uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 =3D check_nanbox_h(rs1);
-    return nanbox_s(float16_to_float32(frs1, true, &env->fp_status));
+    return nanbox_s(env, float16_to_float32(frs1, true, &env->fp_status)=
);
 }
=20
 uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index c7232de326..10cf37be41 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -101,6 +101,9 @@ typedef struct DisasContext {
     TCGv zero;
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
+    /* Space for 4 operands(1 dest and <=3D3 src) for float point comput=
ation */
+    TCGv_i64 ftemp[4];
+    uint8_t nftemp;
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
@@ -380,6 +383,86 @@ static void gen_set_gpr128(DisasContext *ctx, int re=
g_num, TCGv rl, TCGv rh)
     }
 }
=20
+static TCGv_i64 ftemp_new(DisasContext *ctx)
+{
+    assert(ctx->nftemp < ARRAY_SIZE(ctx->ftemp));
+    return ctx->ftemp[ctx->nftemp++] =3D tcg_temp_new_i64();
+}
+
+static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
+{
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        return cpu_fpr[reg_num];
+    }
+
+    if (reg_num =3D=3D 0) {
+        return tcg_constant_i64(0);
+    }
+    switch (get_xl(ctx)) {
+    case MXL_RV32:
+#ifdef TARGET_RISCV32
+    {
+        TCGv_i64 t =3D ftemp_new(ctx);
+        tcg_gen_ext_i32_i64(t, cpu_gpr[reg_num]);
+        return t;
+    }
+#else
+    /* fall through */
+    case MXL_RV64:
+        return cpu_gpr[reg_num];
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static TCGv_i64 dest_fpr(DisasContext *ctx, int reg_num)
+{
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        return cpu_fpr[reg_num];
+    }
+
+    if (reg_num =3D=3D 0) {
+        return ftemp_new(ctx);
+    }
+
+    switch (get_xl(ctx)) {
+    case MXL_RV32:
+        return ftemp_new(ctx);
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+        return cpu_gpr[reg_num];
+#endif
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/* assume t is nanboxing (for normal) or sign-extended (for zfinx) */
+static void gen_set_fpr_hs(DisasContext *ctx, int reg_num, TCGv_i64 t)
+{
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        tcg_gen_mov_i64(cpu_fpr[reg_num], t);
+        return;
+    }
+    if (reg_num !=3D 0) {
+        switch (get_xl(ctx)) {
+        case MXL_RV32:
+#ifdef TARGET_RISCV32
+            tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
+            break;
+#else
+        /* fall through */
+        case MXL_RV64:
+            tcg_gen_mov_i64(cpu_gpr[reg_num], t);
+            break;
+#endif
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
 static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 {
     target_ulong next_pc;
@@ -955,6 +1038,8 @@ static void riscv_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
     ctx->cs =3D cs;
     ctx->ntemp =3D 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
+    ctx->nftemp =3D 0;
+    memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENAB=
LED);
     ctx->pm_base_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENAB=
LED);
     ctx->zero =3D tcg_constant_tl(0);
@@ -976,16 +1061,22 @@ static void riscv_tr_translate_insn(DisasContextBa=
se *dcbase, CPUState *cpu)
     DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
     CPURISCVState *env =3D cpu->env_ptr;
     uint16_t opcode16 =3D translator_lduw(env, &ctx->base, ctx->base.pc_=
next);
+    int i;
=20
     ctx->ol =3D ctx->xl;
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next =3D ctx->pc_succ_insn;
=20
-    for (int i =3D ctx->ntemp - 1; i >=3D 0; --i) {
+    for (i =3D ctx->ntemp - 1; i >=3D 0; --i) {
         tcg_temp_free(ctx->temp[i]);
         ctx->temp[i] =3D NULL;
     }
     ctx->ntemp =3D 0;
+    for (i =3D ctx->nftemp - 1; i >=3D 0; --i) {
+        tcg_temp_free_i64(ctx->ftemp[i]);
+        ctx->ftemp[i] =3D NULL;
+    }
+    ctx->nftemp =3D 0;
=20
     if (ctx->base.is_jmp =3D=3D DISAS_NEXT) {
         target_ulong page_start;
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_=
trans/trans_rvf.c.inc
index 0aac87f7db..a1d3eb52ad 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -20,7 +20,14 @@
=20
 #define REQUIRE_FPU do {\
     if (ctx->mstatus_fs =3D=3D 0) \
-        return false;                       \
+        if (!ctx->cfg_ptr->ext_zfinx) \
+            return false; \
+} while (0)
+
+#define REQUIRE_ZFINX_OR_F(ctx) do {\
+    if (!ctx->cfg_ptr->ext_zfinx) { \
+        REQUIRE_EXT(ctx, RVF); \
+    } \
 } while (0)
=20
 static bool trans_flw(DisasContext *ctx, arg_flw *a)
@@ -55,10 +62,16 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
 static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmadd_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -66,10 +79,16 @@ static bool trans_fmadd_s(DisasContext *ctx, arg_fmad=
d_s *a)
 static bool trans_fmsub_s(DisasContext *ctx, arg_fmsub_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmsub_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -77,10 +96,16 @@ static bool trans_fmsub_s(DisasContext *ctx, arg_fmsu=
b_s *a)
 static bool trans_fnmsub_s(DisasContext *ctx, arg_fnmsub_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmsub_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmsub_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -88,10 +113,16 @@ static bool trans_fnmsub_s(DisasContext *ctx, arg_fn=
msub_s *a)
 static bool trans_fnmadd_s(DisasContext *ctx, arg_fnmadd_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
+
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmadd_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmadd_s(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -99,11 +130,15 @@ static bool trans_fnmadd_s(DisasContext *ctx, arg_fn=
madd_s *a)
 static bool trans_fadd_s(DisasContext *ctx, arg_fadd_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fadd_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fadd_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -111,11 +146,15 @@ static bool trans_fadd_s(DisasContext *ctx, arg_fad=
d_s *a)
 static bool trans_fsub_s(DisasContext *ctx, arg_fsub_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsub_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fsub_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -123,11 +162,15 @@ static bool trans_fsub_s(DisasContext *ctx, arg_fsu=
b_s *a)
 static bool trans_fmul_s(DisasContext *ctx, arg_fmul_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmul_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fmul_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -135,11 +178,15 @@ static bool trans_fmul_s(DisasContext *ctx, arg_fmu=
l_s *a)
 static bool trans_fdiv_s(DisasContext *ctx, arg_fdiv_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fdiv_s(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fdiv_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -147,10 +194,14 @@ static bool trans_fdiv_s(DisasContext *ctx, arg_fdi=
v_s *a)
 static bool trans_fsqrt_s(DisasContext *ctx, arg_fsqrt_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsqrt_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fsqrt_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -158,22 +209,37 @@ static bool trans_fsqrt_s(DisasContext *ctx, arg_fs=
qrt_s *a)
 static bool trans_fsgnj_s(DisasContext *ctx, arg_fsgnj_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     if (a->rs1 =3D=3D a->rs2) { /* FMOV */
-        gen_check_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            gen_check_nanbox_s(dest, src1);
+        } else {
+            tcg_gen_ext32s_i64(dest, src1);
+        }
     } else { /* FSGNJ */
-        TCGv_i64 rs1 =3D tcg_temp_new_i64();
-        TCGv_i64 rs2 =3D tcg_temp_new_i64();
-
-        gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
-
-        /* This formulation retains the nanboxing of rs2. */
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 31);
-        tcg_temp_free_i64(rs1);
-        tcg_temp_free_i64(rs2);
+        TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            TCGv_i64 rs1 =3D tcg_temp_new_i64();
+            TCGv_i64 rs2 =3D tcg_temp_new_i64();
+            gen_check_nanbox_s(rs1, src1);
+            gen_check_nanbox_s(rs2, src2);
+
+            /* This formulation retains the nanboxing of rs2 in normal '=
F'. */
+            tcg_gen_deposit_i64(dest, rs2, rs1, 0, 31);
+
+            tcg_temp_free_i64(rs1);
+            tcg_temp_free_i64(rs2);
+        } else {
+            tcg_gen_deposit_i64(dest, src2, src1, 0, 31);
+            tcg_gen_ext32s_i64(dest, dest);
+        }
     }
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -183,16 +249,27 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_f=
sgnjn_s *a)
     TCGv_i64 rs1, rs2, mask;
=20
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
-    rs1 =3D tcg_temp_new_i64();
-    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
+    rs1 =3D tcg_temp_new_i64();
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        gen_check_nanbox_s(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
     if (a->rs1 =3D=3D a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(31, 1));
+        tcg_gen_xori_i64(dest, rs1, MAKE_64BIT_MASK(31, 1));
     } else {
+        TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
         rs2 =3D tcg_temp_new_i64();
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            gen_check_nanbox_s(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
=20
         /*
          * Replace bit 31 in rs1 with inverse in rs2.
@@ -200,13 +277,17 @@ static bool trans_fsgnjn_s(DisasContext *ctx, arg_f=
sgnjn_s *a)
          */
         mask =3D tcg_constant_i64(~MAKE_64BIT_MASK(31, 1));
         tcg_gen_nor_i64(rs2, rs2, mask);
-        tcg_gen_and_i64(rs1, mask, rs1);
-        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_and_i64(dest, mask, rs1);
+        tcg_gen_or_i64(dest, dest, rs2);
=20
         tcg_temp_free_i64(rs2);
     }
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->cfg_ptr->ext_zfinx) {
+        tcg_gen_ext32s_i64(dest, dest);
+    }
+    gen_set_fpr_hs(ctx, a->rd, dest);
     tcg_temp_free_i64(rs1);
-
     mark_fs_dirty(ctx);
     return true;
 }
@@ -216,28 +297,45 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_f=
sgnjx_s *a)
     TCGv_i64 rs1, rs2;
=20
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
     rs1 =3D tcg_temp_new_i64();
-    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        gen_check_nanbox_s(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
=20
     if (a->rs1 =3D=3D a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(31, 1));
+        tcg_gen_andi_i64(dest, rs1, ~MAKE_64BIT_MASK(31, 1));
     } else {
+        TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
         rs2 =3D tcg_temp_new_i64();
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            gen_check_nanbox_s(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
=20
         /*
          * Xor bit 31 in rs1 with that in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(31, 1));
-        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(31, 1));
+        tcg_gen_xor_i64(dest, rs1, dest);
=20
         tcg_temp_free_i64(rs2);
     }
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->cfg_ptr->ext_zfinx) {
+        tcg_gen_ext32s_i64(dest, dest);
+    }
     tcg_temp_free_i64(rs1);
-
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -245,10 +343,14 @@ static bool trans_fsgnjx_s(DisasContext *ctx, arg_f=
sgnjx_s *a)
 static bool trans_fmin_s(DisasContext *ctx, arg_fmin_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_fmin_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    gen_helper_fmin_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -256,10 +358,14 @@ static bool trans_fmin_s(DisasContext *ctx, arg_fmi=
n_s *a)
 static bool trans_fmax_s(DisasContext *ctx, arg_fmax_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_fmax_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    gen_helper_fmax_s(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -267,12 +373,13 @@ static bool trans_fmax_s(DisasContext *ctx, arg_fma=
x_s *a)
 static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_w_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -280,12 +387,13 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_f=
cvt_w_s *a)
 static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_wu_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -294,14 +402,14 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fm=
v_x_w *a)
 {
     /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
-
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
 #if defined(TARGET_RISCV64)
-    tcg_gen_ext32s_tl(dest, cpu_fpr[a->rs1]);
+    tcg_gen_ext32s_tl(dest, src1);
 #else
-    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
+    tcg_gen_extrl_i64_i32(dest, src1);
 #endif
=20
     gen_set_gpr(ctx, a->rd, dest);
@@ -311,11 +419,13 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fm=
v_x_w *a)
 static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_feq_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_feq_s(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -323,11 +433,13 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_=
s *a)
 static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_flt_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_flt_s(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -335,11 +447,13 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_=
s *a)
 static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_fle_s(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fle_s(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -347,11 +461,12 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_=
s *a)
 static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
-    gen_helper_fclass_s(dest, cpu_fpr[a->rs1]);
+    gen_helper_fclass_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -359,13 +474,14 @@ static bool trans_fclass_s(DisasContext *ctx, arg_f=
class_s *a)
 static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_w(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -373,13 +489,14 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_f=
cvt_s_w *a)
 static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
 {
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_wu(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -388,13 +505,14 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fm=
v_w_x *a)
 {
     /* NOTE: This was FMV.S.X in an earlier version of the ISA spec! */
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
-    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], src);
-    gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
-
+    tcg_gen_extu_tl_i64(dest, src);
+    gen_nanbox_s(dest, dest);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -403,12 +521,13 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_f=
cvt_l_s *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_l_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -417,12 +536,13 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_=
fcvt_lu_s *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_s(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_lu_s(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -431,13 +551,14 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_f=
cvt_s_l *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_l(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -446,13 +567,14 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_=
fcvt_s_lu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_EXT(ctx, RVF);
+    REQUIRE_ZFINX_OR_F(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv src =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, src);
-
+    gen_helper_fcvt_s_lu(dest, cpu_env, src);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
--=20
2.35.1


