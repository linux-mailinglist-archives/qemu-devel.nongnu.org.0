Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7854CB67F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 06:38:25 +0100 (CET)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPeAS-0007sL-6r
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 00:38:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1m-0002X3-Ta
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:26 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=05403f1d5=alistair.francis@opensource.wdc.com>)
 id 1nPe1j-0001cx-Fm
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 00:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646285363; x=1677821363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/5tCj7ol249FUH1KshjRPA7xPDrsV4lcg6F8IggF7hM=;
 b=TEEI1AThDypHqL1Yx3sGunVTpqkQO0ayQYjkXeCyhuWpGin009pto4zU
 692IxtRPmeZuCclhEuA9LYZvRa9xsRSRNWzz45jBO7rDm2/2HZmP70OXq
 4n0iyhCaU3tealpMPsrUUnjLwLBanHtrQ0AKgDDpQQ2/RVGsdrwZX8Z66
 C2zi+aAr/l7qP4sTTyZCo4fKtDGhzUEB4Y5UPDvRGr1G6sHbog57SE2nJ
 WwEZkOmx+3AM7rXceJkorr0AnAhEGukbw4GJRYm+LardcZVkVS4fDM1kK
 VqUcBqlMXIvrWsvBFVLs2XUggmvuFN+VlOPJel+JZbeGOKuh1PPPV1egA A==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="306258530"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 13:29:20 +0800
IronPort-SDR: 3dwSfGBaFfCPH/ZTw+Ets/0LKDbiYshV9BpAf34W5uAr315BYsdxprOMD0QYfVjCagsWubA4hu
 Nn/tspJXdtS9rEfGfbnmr8uNqj1tWWqg0dDirW1NRsk5W07VrIXZk79xRbE2Mnlfkscce4inms
 7H7lJFUKG/7/hCv4+4ytUtjsvVhmL0+DXM00CwckT9yJJTViooob2L8oZ/deemd+72tv99ta1S
 P/dVhKPAPYxcdsxbXjJPIjrGojHFO+vnxIZqljRtDnadZH4khBSulyP9rOqCtRcxvNDT3hWhuI
 o1Cn0WoyJU09Qp8D1Fil0p72
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:00:43 -0800
IronPort-SDR: 3mGjFn5VQENPZxqD32vaLgVURMkQASLSFlycUGbS1sI/JIYIRuIQu0AeDTTg89BdxmRkchljSe
 3JC4MVJko/CRKO6HTfj8ixb69earKH+k6CfWeG1JXYFvITvMe3IOraht6JkNBwn6+xU3vLmvtw
 YqJ2viSUlTiZZGrrd25hp32lF1i6OebhJIUJefChQcRVsWoQvJG3nxWzbKNs1rHMOPfc+vBpct
 +jfjwN8PI8heW7e1dE0wjz6GQ0I9vF90SKS6QSXdldCdmtGtZFJktL1d7OzcN0BkrcDhhP3wd/
 R6s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 21:29:21 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K8KKr52d1z1SVp2
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 21:29:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1646285358; x=1648877359; bh=/5tCj7ol249FUH1Ksh
 jRPA7xPDrsV4lcg6F8IggF7hM=; b=ETyMjjEo60HOMqleOeYFEaaksi0uj+6o/H
 ClquxBJPCpOFKHAuX2b6gN9S5D53NhhisSs4o0K7yxo++NlmFo9vPSo2D+WrpGdI
 ULaXE0kuMFJgCvbSd96QGwLgDc9o+LE3DSy2xt3iwIaISdKW79o1N+IWJYatlUB+
 38Qez6t9e44XrY/2QGsIi9q/Sz9J34NH7OpnC4kTX+su620ry+20zmeTUtIZVXiT
 S6ssXm8J3SfTTn6Widfy4WGsLkQ089T/WtyTgAGmZrEKLX1WKxaJApzdqjOqPRe5
 B0VIJP8YvvFPX71/H/2CxsoMWPNmddynRY8B4pXv+QuSMODjfQNA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7h8rPCMcX5Ds for <qemu-devel@nongnu.org>;
 Wed,  2 Mar 2022 21:29:18 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.101])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K8KKk2MP4z1Rvlx;
 Wed,  2 Mar 2022 21:29:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/13] target/riscv: add support for zhinx/zhinxmin
Date: Thu,  3 Mar 2022 15:28:03 +1000
Message-Id: <20220303052804.529967-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
References: <20220303052804.529967-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=05403f1d5=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

  - update extension check REQUIRE_ZHINX_OR_ZFH and REQUIRE_ZFH_OR_ZFHMIN=
_OR_ZHINX_OR_ZHINXMIN
  - update half float point register read/write
  - disable nanbox_h check

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220211043920.28981-6-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                     |   2 +-
 target/riscv/internals.h                  |  16 +-
 target/riscv/fpu_helper.c                 |  89 +++---
 target/riscv/insn_trans/trans_rvzfh.c.inc | 332 +++++++++++++++-------
 4 files changed, 296 insertions(+), 143 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 89195aad9d..26bbab2fab 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -90,7 +90,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env,=
 tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
+DEF_HELPER_FLAGS_2(fclass_h, TCG_CALL_NO_RWG_SE, tl, env, i64)
=20
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 6237bb3115..dbb322bfa7 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -72,13 +72,23 @@ static inline float32 check_nanbox_s(CPURISCVState *e=
nv, uint64_t f)
     }
 }
=20
-static inline uint64_t nanbox_h(float16 f)
+static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
 {
-    return f | MAKE_64BIT_MASK(16, 48);
+    /* the value is sign-extended instead of NaN-boxing for zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (int16_t)f;
+    } else {
+        return f | MAKE_64BIT_MASK(16, 48);
+    }
 }
=20
-static inline float16 check_nanbox_h(uint64_t f)
+static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
 {
+    /* Disable nanbox check when enable zfinx */
+    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        return (uint16_t)f;
+    }
+
     uint64_t mask =3D MAKE_64BIT_MASK(16, 48);
=20
     if (likely((f & mask) =3D=3D mask)) {
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 63ca703459..5699c9517f 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -89,10 +89,11 @@ void helper_set_rod_rounding_mode(CPURISCVState *env)
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs=
2,
                            uint64_t rs3, int flags)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
-    float16 frs3 =3D check_nanbox_h(rs3);
-    return nanbox_h(float16_muladd(frs1, frs2, frs3, flags, &env->fp_sta=
tus));
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
+    float16 frs3 =3D check_nanbox_h(env, rs3);
+    return nanbox_h(env, float16_muladd(frs1, frs2, frs3, flags,
+                                        &env->fp_status));
 }
=20
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs=
2,
@@ -417,146 +418,146 @@ target_ulong helper_fclass_d(uint64_t frs1)
=20
 uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
-    return nanbox_h(float16_add(frs1, frs2, &env->fp_status));
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_add(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fsub_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
-    return nanbox_h(float16_sub(frs1, frs2, &env->fp_status));
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_sub(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fmul_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
-    return nanbox_h(float16_mul(frs1, frs2, &env->fp_status));
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_mul(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fdiv_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
-    return nanbox_h(float16_div(frs1, frs2, &env->fp_status));
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
+    return nanbox_h(env, float16_div(frs1, frs2, &env->fp_status));
 }
=20
 uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
-    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
+    return nanbox_h(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float16_minnum(frs1, frs2, &env->fp_status) :
                     float16_minimum_number(frs1, frs2, &env->fp_status))=
;
 }
=20
 uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
-    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
+    return nanbox_h(env, env->priv_ver < PRIV_VERSION_1_11_0 ?
                     float16_maxnum(frs1, frs2, &env->fp_status) :
                     float16_maximum_number(frs1, frs2, &env->fp_status))=
;
 }
=20
 uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    return nanbox_h(float16_sqrt(frs1, &env->fp_status));
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    return nanbox_h(env, float16_sqrt(frs1, &env->fp_status));
 }
=20
 target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
     return float16_le(frs1, frs2, &env->fp_status);
 }
=20
 target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
     return float16_lt(frs1, frs2, &env->fp_status);
 }
=20
 target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
-    float16 frs2 =3D check_nanbox_h(rs2);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
+    float16 frs2 =3D check_nanbox_h(env, rs2);
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
=20
-target_ulong helper_fclass_h(uint64_t rs1)
+target_ulong helper_fclass_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
     return fclass_h(frs1);
 }
=20
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
     return float16_to_int32(frs1, &env->fp_status);
 }
=20
 target_ulong helper_fcvt_wu_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
     return (int32_t)float16_to_uint32(frs1, &env->fp_status);
 }
=20
 target_ulong helper_fcvt_l_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
     return float16_to_int64(frs1, &env->fp_status);
 }
=20
 target_ulong helper_fcvt_lu_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
     return float16_to_uint64(frs1, &env->fp_status);
 }
=20
 uint64_t helper_fcvt_h_w(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(int32_to_float16((int32_t)rs1, &env->fp_status));
+    return nanbox_h(env, int32_to_float16((int32_t)rs1, &env->fp_status)=
);
 }
=20
 uint64_t helper_fcvt_h_wu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(uint32_to_float16((uint32_t)rs1, &env->fp_status));
+    return nanbox_h(env, uint32_to_float16((uint32_t)rs1, &env->fp_statu=
s));
 }
=20
 uint64_t helper_fcvt_h_l(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(int64_to_float16(rs1, &env->fp_status));
+    return nanbox_h(env, int64_to_float16(rs1, &env->fp_status));
 }
=20
 uint64_t helper_fcvt_h_lu(CPURISCVState *env, target_ulong rs1)
 {
-    return nanbox_h(uint64_to_float16(rs1, &env->fp_status));
+    return nanbox_h(env, uint64_to_float16(rs1, &env->fp_status));
 }
=20
 uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 =3D check_nanbox_s(env, rs1);
-    return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
+    return nanbox_h(env, float32_to_float16(frs1, true, &env->fp_status)=
);
 }
=20
 uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
     return nanbox_s(env, float16_to_float32(frs1, true, &env->fp_status)=
);
 }
=20
 uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
 {
-    return nanbox_h(float64_to_float16(rs1, true, &env->fp_status));
+    return nanbox_h(env, float64_to_float16(rs1, true, &env->fp_status))=
;
 }
=20
 uint64_t helper_fcvt_d_h(CPURISCVState *env, uint64_t rs1)
 {
-    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs1 =3D check_nanbox_h(env, rs1);
     return float16_to_float64(frs1, true, &env->fp_status);
 }
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index 608c51da2c..5d07150cd0 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -22,12 +22,25 @@
     }                         \
 } while (0)
=20
+#define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
+    if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
+        return false;                  \
+    }                                  \
+} while (0)
+
 #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
     if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin)) { \
         return false;                         \
     }                                         \
 } while (0)
=20
+#define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do { \
+    if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin ||          =
\
+          ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr->ext_zhinxmin)) {     =
\
+        return false;                                        \
+    }                                                        \
+} while (0)
+
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
 {
     TCGv_i64 dest;
@@ -73,11 +86,16 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
 static bool trans_fmadd_h(DisasContext *ctx, arg_fmadd_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmadd_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -85,11 +103,16 @@ static bool trans_fmadd_h(DisasContext *ctx, arg_fma=
dd_h *a)
 static bool trans_fmsub_h(DisasContext *ctx, arg_fmsub_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fmsub_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -97,11 +120,16 @@ static bool trans_fmsub_h(DisasContext *ctx, arg_fms=
ub_h *a)
 static bool trans_fnmsub_h(DisasContext *ctx, arg_fnmsub_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmsub_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -109,11 +137,16 @@ static bool trans_fnmsub_h(DisasContext *ctx, arg_f=
nmsub_h *a)
 static bool trans_fnmadd_h(DisasContext *ctx, arg_fnmadd_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+    TCGv_i64 src3 =3D get_fpr_hs(ctx, a->rs3);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fnmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    gen_helper_fnmadd_h(dest, cpu_env, src1, src2, src3);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -121,11 +154,15 @@ static bool trans_fnmadd_h(DisasContext *ctx, arg_f=
nmadd_h *a)
 static bool trans_fadd_h(DisasContext *ctx, arg_fadd_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fadd_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fadd_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -133,11 +170,15 @@ static bool trans_fadd_h(DisasContext *ctx, arg_fad=
d_h *a)
 static bool trans_fsub_h(DisasContext *ctx, arg_fsub_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsub_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fsub_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -145,11 +186,15 @@ static bool trans_fsub_h(DisasContext *ctx, arg_fsu=
b_h *a)
 static bool trans_fmul_h(DisasContext *ctx, arg_fmul_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fmul_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fmul_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -157,11 +202,15 @@ static bool trans_fmul_h(DisasContext *ctx, arg_fmu=
l_h *a)
 static bool trans_fdiv_h(DisasContext *ctx, arg_fdiv_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fdiv_h(cpu_fpr[a->rd], cpu_env,
-                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fdiv_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -169,10 +218,14 @@ static bool trans_fdiv_h(DisasContext *ctx, arg_fdi=
v_h *a)
 static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fsqrt_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fsqrt_h(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -180,23 +233,37 @@ static bool trans_fsqrt_h(DisasContext *ctx, arg_fs=
qrt_h *a)
 static bool trans_fsgnj_h(DisasContext *ctx, arg_fsgnj_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     if (a->rs1 =3D=3D a->rs2) { /* FMOV */
-        gen_check_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            gen_check_nanbox_h(dest, src1);
+        } else {
+            tcg_gen_ext16s_i64(dest, src1);
+        }
     } else {
-        TCGv_i64 rs1 =3D tcg_temp_new_i64();
-        TCGv_i64 rs2 =3D tcg_temp_new_i64();
-
-        gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
-        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
-
-        /* This formulation retains the nanboxing of rs2. */
-        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 15);
-        tcg_temp_free_i64(rs1);
-        tcg_temp_free_i64(rs2);
+        TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            TCGv_i64 rs1 =3D tcg_temp_new_i64();
+            TCGv_i64 rs2 =3D tcg_temp_new_i64();
+            gen_check_nanbox_h(rs1, src1);
+            gen_check_nanbox_h(rs2, src2);
+
+            /* This formulation retains the nanboxing of rs2 in normal '=
Zfh'. */
+            tcg_gen_deposit_i64(dest, rs2, rs1, 0, 15);
+
+            tcg_temp_free_i64(rs1);
+            tcg_temp_free_i64(rs2);
+        } else {
+            tcg_gen_deposit_i64(dest, src2, src1, 0, 15);
+            tcg_gen_ext16s_i64(dest, dest);
+        }
     }
-
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -206,16 +273,29 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_f=
sgnjn_h *a)
     TCGv_i64 rs1, rs2, mask;
=20
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     rs1 =3D tcg_temp_new_i64();
-    gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        gen_check_nanbox_h(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
=20
     if (a->rs1 =3D=3D a->rs2) { /* FNEG */
-        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xori_i64(dest, rs1, MAKE_64BIT_MASK(15, 1));
     } else {
+        TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
         rs2 =3D tcg_temp_new_i64();
-        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
+
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            gen_check_nanbox_h(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
=20
         /*
          * Replace bit 15 in rs1 with inverse in rs2.
@@ -224,12 +304,17 @@ static bool trans_fsgnjn_h(DisasContext *ctx, arg_f=
sgnjn_h *a)
         mask =3D tcg_const_i64(~MAKE_64BIT_MASK(15, 1));
         tcg_gen_not_i64(rs2, rs2);
         tcg_gen_andc_i64(rs2, rs2, mask);
-        tcg_gen_and_i64(rs1, mask, rs1);
-        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_and_i64(dest, mask, rs1);
+        tcg_gen_or_i64(dest, dest, rs2);
=20
         tcg_temp_free_i64(mask);
         tcg_temp_free_i64(rs2);
     }
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->cfg_ptr->ext_zfinx) {
+        tcg_gen_ext16s_i64(dest, dest);
+    }
+    tcg_temp_free_i64(rs1);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -239,27 +324,44 @@ static bool trans_fsgnjx_h(DisasContext *ctx, arg_f=
sgnjx_h *a)
     TCGv_i64 rs1, rs2;
=20
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     rs1 =3D tcg_temp_new_i64();
-    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+    if (!ctx->cfg_ptr->ext_zfinx) {
+        gen_check_nanbox_h(rs1, src1);
+    } else {
+        tcg_gen_mov_i64(rs1, src1);
+    }
=20
     if (a->rs1 =3D=3D a->rs2) { /* FABS */
-        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(15, 1));
+        tcg_gen_andi_i64(dest, rs1, ~MAKE_64BIT_MASK(15, 1));
     } else {
+        TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
         rs2 =3D tcg_temp_new_i64();
-        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        if (!ctx->cfg_ptr->ext_zfinx) {
+            gen_check_nanbox_h(rs2, src2);
+        } else {
+            tcg_gen_mov_i64(rs2, src2);
+        }
=20
         /*
          * Xor bit 15 in rs1 with that in rs2.
          * This formulation retains the nanboxing of rs1.
          */
-        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(15, 1));
-        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+        tcg_gen_andi_i64(dest, rs2, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xor_i64(dest, rs1, dest);
=20
         tcg_temp_free_i64(rs2);
     }
-
+    /* signed-extended intead of nanboxing for result if enable zfinx */
+    if (ctx->cfg_ptr->ext_zfinx) {
+        tcg_gen_ext16s_i64(dest, dest);
+    }
+    tcg_temp_free_i64(rs1);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -267,10 +369,14 @@ static bool trans_fsgnjx_h(DisasContext *ctx, arg_f=
sgnjx_h *a)
 static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_fmin_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    gen_helper_fmin_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -278,10 +384,14 @@ static bool trans_fmin_h(DisasContext *ctx, arg_fmi=
n_h *a)
 static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
-    gen_helper_fmax_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
-                      cpu_fpr[a->rs2]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
+
+    gen_helper_fmax_h(dest, cpu_env, src1, src2);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
     return true;
 }
@@ -289,10 +399,14 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fma=
x_h *a)
 static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_s_h(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
=20
@@ -302,26 +416,32 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_f=
cvt_s_h *a)
 static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZDINX_OR_D(ctx);
+
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_d_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_d_h(dest, cpu_env, src1);
+    gen_set_fpr_d(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
=20
-
     return true;
 }
=20
 static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_s(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
=20
     return true;
@@ -330,12 +450,15 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_f=
cvt_h_s *a)
 static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH_OR_ZFHMIN(ctx);
-    REQUIRE_EXT(ctx, RVD);
+    REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx);
+    REQUIRE_ZDINX_OR_D(ctx);
=20
-    gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_d(ctx, a->rs1);
=20
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_d(dest, cpu_env, src1);
+    gen_set_fpr_hs(ctx, a->rd, dest);
     mark_fs_dirty(ctx);
=20
     return true;
@@ -344,11 +467,13 @@ static bool trans_fcvt_h_d(DisasContext *ctx, arg_f=
cvt_h_d *a)
 static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_feq_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_feq_h(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -356,11 +481,13 @@ static bool trans_feq_h(DisasContext *ctx, arg_feq_=
h *a)
 static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_flt_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_flt_h(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
=20
     return true;
@@ -369,11 +496,13 @@ static bool trans_flt_h(DisasContext *ctx, arg_flt_=
h *a)
 static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
+    TCGv_i64 src2 =3D get_fpr_hs(ctx, a->rs2);
=20
-    gen_helper_fle_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_helper_fle_h(dest, cpu_env, src1, src2);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -381,11 +510,12 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_=
h *a)
 static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
-    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_helper_fclass_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -393,12 +523,13 @@ static bool trans_fclass_h(DisasContext *ctx, arg_f=
class_h *a)
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_w_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_w_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -406,12 +537,13 @@ static bool trans_fcvt_w_h(DisasContext *ctx, arg_f=
cvt_w_h *a)
 static bool trans_fcvt_wu_h(DisasContext *ctx, arg_fcvt_wu_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_wu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_wu_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -419,12 +551,14 @@ static bool trans_fcvt_wu_h(DisasContext *ctx, arg_=
fcvt_wu_h *a)
 static bool trans_fcvt_h_w(DisasContext *ctx, arg_fcvt_h_w *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_w(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_w(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -433,12 +567,14 @@ static bool trans_fcvt_h_w(DisasContext *ctx, arg_f=
cvt_h_w *a)
 static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_wu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_wu(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -482,12 +618,13 @@ static bool trans_fcvt_l_h(DisasContext *ctx, arg_f=
cvt_l_h *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_l_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_l_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -496,12 +633,13 @@ static bool trans_fcvt_lu_h(DisasContext *ctx, arg_=
fcvt_lu_h *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
+    TCGv_i64 src1 =3D get_fpr_hs(ctx, a->rs1);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_lu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_helper_fcvt_lu_h(dest, cpu_env, src1);
     gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
@@ -510,12 +648,14 @@ static bool trans_fcvt_h_l(DisasContext *ctx, arg_f=
cvt_h_l *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_l(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_l(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
@@ -525,12 +665,14 @@ static bool trans_fcvt_h_lu(DisasContext *ctx, arg_=
fcvt_h_lu *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZHINX_OR_ZFH(ctx);
=20
+    TCGv_i64 dest =3D dest_fpr(ctx, a->rd);
     TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
=20
     gen_set_rm(ctx, a->rm);
-    gen_helper_fcvt_h_lu(cpu_fpr[a->rd], cpu_env, t0);
+    gen_helper_fcvt_h_lu(dest, cpu_env, t0);
+    gen_set_fpr_hs(ctx, a->rd, dest);
=20
     mark_fs_dirty(ctx);
     return true;
--=20
2.35.1


