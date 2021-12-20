Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3141947A431
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:08:28 +0100 (CET)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAuR-0000HO-7h
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjz-00089E-PJ
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAjx-00081R-Ms
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976257; x=1671512257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jqqgCjrIUkO15aehtYBi6sJcZSzabw13ECX8KiCAKhg=;
 b=FRv3spf3bZeefE6W3MFbsV10ppLfvsJd+aPXN4GvPO88C0JpzES95Spo
 cGhzKtmg08HavveKb72Kk6oaamXUW2KAOMaWusmo2aQqinLHwlbQAsvYm
 QkWxr1dr9WdtfzFGwabzdD+bhTPksCAu23LA3srBZsi6QxP1kn+orC1Lj
 3RPuwyVqRCJHY5WaQ+b/zbaIli0qi84cZwvQkLLzL2fYoCkbxn3ueIHQL
 2nYrX8kd+4aO3YfkLRN8l1+feKUBl2Vi975ackLuoOsW8UAPkKMr8QVyx
 lqffnw1JmJ8M6Md0TEhcqgkuXJmxVY9ApK/HgGZFYg4OMlsXbWEfxmvwr Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661873"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:36 +0800
IronPort-SDR: jf5IHaOFHtVqOQwugTv2AqjWqME5zsePakz6rtq+Z024126ZjPz0cLhoyoFihiYVdNq2mRhIyH
 GhYieqm61In+o6/E2S2pozCzacROIwxk++niR5+yWOLXuJJEyLX5m+FrX6LRhJ2dt+8Y49VzKL
 Y1sRmt7P5rR0WHn6dnK0slVXTI3Ng9rTsfRWP1kEAidTqKt13QkdbTEKGhBkc7ynmHhlI+wjd0
 dm5ZE/j+eL83x3NV5UthKX1JcYErnF/helsaA+gz9AWlZ7bRzspq4GB50nralKk/Dzd4oqMk9g
 y0bYrYN13gSdN83Zxv0w2TLb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:26 -0800
IronPort-SDR: I2I7L4FmP/qT8eKXGhwVarsvLoYitnm4MMNhVcBItoap2tV7qhzH4ImAUvON03sa/mOkh8tbib
 m8hwI67m+lTJnftd+HfAYCOcRCfpbHEHcEAC3ZM7QIy7KHYfRav7x1FfBNvHpdBBM/mZLrvc8P
 HZ7g1K8xtLJWADt5BHqN0UJGibJxMKQdZp39GUvU6GFsNpy42UwFo4jTuHscJf0eTmT0JTdOOa
 Z10+8ZJrA5Dtp5rKGJ1bPPjDxNSCnYW6VzvDjJpAQO3t55q75dlMdXt4L2tjG3bMeH96wFyduF
 ry0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS4w54V6z1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:36 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976256; x=1642568257; bh=jqqgCjrIUkO15aehtY
 Bi6sJcZSzabw13ECX8KiCAKhg=; b=dOuhegGvwXl2CxGgtKVUPEkrHR/reGQKLy
 bqkXquE4oluY82yXdJZPDwojyp4fvS13DqcWI1LG5+D/kTMS67vpqioCd13iSioh
 UeaurQ6DwyH0UBctcbnjAmxr7+s/Ov+9HtP3qQLaO9jODmmk9c4z4wNMbxP+kU70
 +Rp02gO72S9VBSzr6ENDkY5Vz0iKTKdlIE4drU0ExEFZR1JPQ8EwyM42Oqq1gFSy
 zGBdCaQhLcnDqI5Cg7ilFz9ou75tigNde+SOZACmOer49u5Ut5VQd5SZ5IYtOHIw
 TZzl6Lsnpx8fBteoySjsFUiwiPdyidIfeRe0boFSM8oK2VxxX/+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KFA4z5TKzQfP for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:36 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS4r1Mz0z1RtVG;
 Sun, 19 Dec 2021 20:57:31 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/88] target/riscv: zfh: half-precision floating-point compare
Date: Mon, 20 Dec 2021 14:55:41 +1000
Message-Id: <20211220045705.62174-5-alistair.francis@opensource.wdc.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211210074329.5775-5-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                     |  3 ++
 target/riscv/insn32.decode                |  3 ++
 target/riscv/fpu_helper.c                 | 21 +++++++++++++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 37 +++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b50672d168..9c89521d4a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -74,6 +74,9 @@ DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i=
64, i64)
 DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_3(fle_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(flt_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(feq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_h, TCG_CALL_NO_RWG, i64, env, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ba40f3e7f8..3906c9fb20 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -751,6 +751,9 @@ fcvt_d_h   0100001  00010 ..... ... ..... 1010011 @r2=
_rm
 fcvt_w_h   1100010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_wu_h  1100010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
+feq_h      1010010  ..... ..... 010 ..... 1010011 @r
+flt_h      1010010  ..... ..... 001 ..... 1010011 @r
+fle_h      1010010  ..... ..... 000 ..... 1010011 @r
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 2ed9b03193..ec2009ee65 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -461,6 +461,27 @@ uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t=
 rs1)
     return nanbox_h(float16_sqrt(frs1, &env->fp_status));
 }
=20
+target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return float16_le(frs1, frs2, &env->fp_status);
+}
+
+target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return float16_lt(frs1, frs2, &env->fp_status);
+}
+
+target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2=
)
+{
+    float16 frs1 =3D check_nanbox_h(rs1);
+    float16 frs2 =3D check_nanbox_h(rs2);
+    return float16_eq_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 =3D check_nanbox_h(rs1);
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index d125025766..8d0959a667 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -335,6 +335,43 @@ static bool trans_fcvt_h_d(DisasContext *ctx, arg_fc=
vt_h_d *a)
     return true;
 }
=20
+static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_helper_feq_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_helper_flt_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest =3D dest_gpr(ctx, a->rd);
+
+    gen_helper_fle_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
--=20
2.31.1


