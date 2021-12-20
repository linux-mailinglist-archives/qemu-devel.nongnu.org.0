Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC447A436
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:11:52 +0100 (CET)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAxj-0004Yj-4u
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjw-00082K-QD
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:36 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAju-00081R-5H
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976254; x=1671512254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C5DzQIhbYWBRS4M8bZAC+im4rOI5vt/7zMr3Jb02aCA=;
 b=RjF856iDjnyBfwaAc6zeKB3tJGhCdjZ3vFTqejvEqPBmBVTIHyV5WZfh
 ReuX3qcHQGrOvvoDq2BFRbuhn5lsOLdr+OEi6LaYlQuQ9jZJqRw3nPmAR
 ikIJU638ZbyVOJYXx7Q3JlKuPRGN909dwS2PmE9AdEeC5BeYp+iLDMqtl
 V5bJJbRn2Duk+jHM56+YN6P2pBJcl8oH8QgzUFFuSddyiqeNVYEEczPxF
 J/BmS5phrCnryRcU9voePxtbea51glIK7ljIyRGwpue4HpU0zN3r9FM9d
 qe5Vv86iFsYCBQltP3HQ+3vge/v3rOIij0UyaVrp5jqMUFQflOmAQ+RuO g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661867"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:32 +0800
IronPort-SDR: B88ESCLLU/9b3xuUkcK/JidOB8buUKLA3wXoIcJ0ktzVMCntWLhbF6pZfsYhho9BTO+08udHZS
 EMzRb3UHV1vfPFZ9UFLH8MHLPMzCpLOnb8u6C+Qsl5fkQL1gL4gPmYBTTODW+eI4GtA7CDdR/0
 CLqkuYVvhLW9CYBnLLasANE04Jcdxurfx267xJINOT7KEdKK2QFhsT+cvUYqagiuKKrQFoVuJ6
 vTeVWNZR2+E3wGuZTkyTaEKx89pgo+UIMWznf1C+bUZqWjOGnDLZPA8tL5CVG8pc1rKginS5Ky
 KdWqfdVUVcpMJF6MIeKEL3L7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:22 -0800
IronPort-SDR: +tS+WO3rtFAuJZOCNsWMUNG7UocSlWFyafcjZHtfz8spVRe3accGKzJKvXkGw94cbP3wrA83Ls
 DqlNBQjbS/NljZitSF9rsWQl/VhiWinx60DSB1j9gM9o149+HI04pVLnWDh6St33LOFtzQLSOv
 debEw9Y+4jSml/p2f81eD1W7QAgn5wuDeDu45QSZuQIsFL5wZA1C77zvmRiqr2+yOZ0jhcN0Ge
 SMPYoRO+3FxXhogbsF+OdtQJVSvgo5BE78aDwHDr2OlQfdF9dvEZ9s8h3GDIzpMuLLN3eZ0uSN
 9JQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS4r2VvQz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976251; x=1642568252; bh=C5DzQIhbYWBRS4M8bZ
 AC+im4rOI5vt/7zMr3Jb02aCA=; b=cxzCpEJx7fangcDj9TzyJ5W/UFefT2nNTL
 8OHpDPsrrQVmhi3xZ6Udp/jmCS/N2Y8knimkxqVOrhU7emt4HLrpikl7mtXG5T6l
 emuhzwxwQoh3y2RT6toqvkBr/pxRqk3ag5QAJq+nv7DWTWCtlbM9ddV4nXFO1zdt
 Jib0rFj1RtXtQorenx23/na+cyo2dAA3Kf5jbil5NAfUrmVmoe4rjLmteHsKgcbt
 /zxFR6cPbB4vg1V7oG6Dw+yssRn5dnwTSzqdPywOv89Zf8luFygi2R6vROskmu/o
 gKF5Jrru7lui6gEZl3UrTQy+X7fohyLwzIjQCwolOukcHVrj2QWw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id tED7JCxFGV2e for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:31 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS4k32Pqz1RvTg;
 Sun, 19 Dec 2021 20:57:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/88] target/riscv: zfh: half-precision convert and move
Date: Mon, 20 Dec 2021 14:55:40 +1000
Message-Id: <20211220045705.62174-4-alistair.francis@opensource.wdc.com>
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

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211210074329.5775-4-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                     |  12 +
 target/riscv/insn32.decode                |  19 ++
 target/riscv/fpu_helper.c                 |  67 +++++
 target/riscv/translate.c                  |  10 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 288 ++++++++++++++++++++++
 5 files changed, 396 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c6c0323faf..b50672d168 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -74,6 +74,18 @@ DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, =
i64, i64)
 DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_d_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_h_d, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_w_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_wu_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_l_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
=20
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 66c231a301..ba40f3e7f8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -739,5 +739,24 @@ fsub_h     0000110  ..... ..... ... ..... 1010011 @r=
_rm
 fmul_h     0001010  ..... ..... ... ..... 1010011 @r_rm
 fdiv_h     0001110  ..... ..... ... ..... 1010011 @r_rm
 fsqrt_h    0101110  00000 ..... ... ..... 1010011 @r2_rm
+fsgnj_h    0010010  ..... ..... 000 ..... 1010011 @r
+fsgnjn_h   0010010  ..... ..... 001 ..... 1010011 @r
+fsgnjx_h   0010010  ..... ..... 010 ..... 1010011 @r
 fmin_h     0010110  ..... ..... 000 ..... 1010011 @r
 fmax_h     0010110  ..... ..... 001 ..... 1010011 @r
+fcvt_h_s   0100010  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_s_h   0100000  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_h_d   0100010  00001 ..... ... ..... 1010011 @r2_rm
+fcvt_d_h   0100001  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_w_h   1100010  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_wu_h  1100010  00001 ..... ... ..... 1010011 @r2_rm
+fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
+fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
+fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
+
+# *** RV64 Zfh Extension (in addition to RV32 Zfh) ***
+fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
+fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 20bb89ad14..2ed9b03193 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -460,3 +460,70 @@ uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t=
 rs1)
     float16 frs1 =3D check_nanbox_h(rs1);
     return nanbox_h(float16_sqrt(frs1, &env->fp_status));
 }
+
+target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return float16_to_int32(frs1, &env->fp_status);
+}
+
+target_ulong helper_fcvt_wu_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return (int32_t)float16_to_uint32(frs1, &env->fp_status);
+}
+
+target_ulong helper_fcvt_l_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return float16_to_int64(frs1, &env->fp_status);
+}
+
+target_ulong helper_fcvt_lu_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return float16_to_uint64(frs1, &env->fp_status);
+}
+
+uint64_t helper_fcvt_h_w(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(int32_to_float16((int32_t)rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_wu(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(uint32_to_float16((uint32_t)rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_l(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(int64_to_float16(rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_lu(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(uint64_to_float16(rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
+{
+    float32 frs1 =3D check_nanbox_s(rs1);
+    return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
+}
+
+uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return nanbox_s(float16_to_float32(frs1, true, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
+{
+    return nanbox_h(float64_to_float16(rs1, true, &env->fp_status));
+}
+
+uint64_t helper_fcvt_d_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    return float16_to_float64(frs1, true, &env->fp_status);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bea87b31b5..93f9ec0c8b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -148,6 +148,16 @@ static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
  *
  * Here, the result is always nan-boxed, even the canonical nan.
  */
+static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max =3D tcg_const_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan =3D tcg_const_i64(0xffffffffffff7e00ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+    tcg_temp_free_i64(t_max);
+    tcg_temp_free_i64(t_nan);
+}
+
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
     TCGv_i64 t_max =3D tcg_constant_i64(0xffffffff00000000ull);
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index 9764d76f8b..d125025766 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -171,6 +171,93 @@ static bool trans_fsqrt_h(DisasContext *ctx, arg_fsq=
rt_h *a)
     return true;
 }
=20
+static bool trans_fsgnj_h(DisasContext *ctx, arg_fsgnj_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    if (a->rs1 =3D=3D a->rs2) { /* FMOV */
+        gen_check_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+    } else {
+        TCGv_i64 rs1 =3D tcg_temp_new_i64();
+        TCGv_i64 rs2 =3D tcg_temp_new_i64();
+
+        gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
+        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
+
+        /* This formulation retains the nanboxing of rs2. */
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 15);
+        tcg_temp_free_i64(rs1);
+        tcg_temp_free_i64(rs2);
+    }
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
+{
+    TCGv_i64 rs1, rs2, mask;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    rs1 =3D tcg_temp_new_i64();
+    gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
+
+    if (a->rs1 =3D=3D a->rs2) { /* FNEG */
+        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(15, 1));
+    } else {
+        rs2 =3D tcg_temp_new_i64();
+        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
+
+        /*
+         * Replace bit 15 in rs1 with inverse in rs2.
+         * This formulation retains the nanboxing of rs1.
+         */
+        mask =3D tcg_const_i64(~MAKE_64BIT_MASK(15, 1));
+        tcg_gen_not_i64(rs2, rs2);
+        tcg_gen_andc_i64(rs2, rs2, mask);
+        tcg_gen_and_i64(rs1, mask, rs1);
+        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
+
+        tcg_temp_free_i64(mask);
+        tcg_temp_free_i64(rs2);
+    }
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
+{
+    TCGv_i64 rs1, rs2;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    rs1 =3D tcg_temp_new_i64();
+    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+
+    if (a->rs1 =3D=3D a->rs2) { /* FABS */
+        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(15, 1));
+    } else {
+        rs2 =3D tcg_temp_new_i64();
+        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        /*
+         * Xor bit 15 in rs1 with that in rs2.
+         * This formulation retains the nanboxing of rs1.
+         */
+        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+
+        tcg_temp_free_i64(rs2);
+    }
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
 static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
 {
     REQUIRE_FPU;
@@ -192,3 +279,204 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fma=
x_h *a)
     mark_fs_dirty(ctx);
     return true;
 }
+
+static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+    return true;
+}
+
+static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+
+    return true;
+}
+
+static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+    return true;
+}
+
+static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+    return true;
+}
+
+static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_wu_h(DisasContext *ctx, arg_fcvt_wu_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_h_w(DisasContext *ctx, arg_fcvt_h_w *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_w(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_wu(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+#if defined(TARGET_RISCV64)
+    /* 16 bits -> 64 bits */
+    tcg_gen_ext16s_tl(dest, cpu_fpr[a->rs1]);
+#else
+    /* 16 bits -> 32 bits */
+    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
+    tcg_gen_ext16s_tl(dest, dest);
+#endif
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+
+    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
+    gen_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rd]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_l_h(DisasContext *ctx, arg_fcvt_l_h *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_l_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_lu_h(DisasContext *ctx, arg_fcvt_lu_h *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_lu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_h_l(DisasContext *ctx, arg_fcvt_h_l *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_l(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_h_lu(DisasContext *ctx, arg_fcvt_h_lu *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_lu(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
--=20
2.31.1


