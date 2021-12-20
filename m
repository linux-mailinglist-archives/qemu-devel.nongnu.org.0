Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8947A432
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:09:22 +0100 (CET)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzAvI-0000kr-PJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:09:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkI-0008Nh-Ck
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:59 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAk9-00081R-Dl
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976269; x=1671512269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y8/lb7AwQxwMbzKdbXHtxrfPjYt7J7XMSjaO0MavwLk=;
 b=aAFOsr02wA1pg5dHueAn7jrrll75FCQ87Kejn+R6Ilb1n0GvHKEf9VFH
 43GCrSje+Vm/z1umOYoTW2qctKH6dV0li9Uvf/s0qE460cnROg/tM7r6n
 wWndLeBH975t20SqBP9HnZptNakKKoDsDZw9wBn9IHbH7Cv1cMd0udIwn
 DIDgNeUDIoHPOm1gxGy+pQtkRjk1yfP26KtL+Ikokie5MzGLGh/+0WKba
 dBvJxH809OHjaLV2NVJV0VN+l3USTivu3tRyHwdySFw9aNrc333QlsPxE
 nKfoLZ/Y6YEd6HRUZVrYamz9e3AA0ZDURm5VnOraHDRLGwYHuKtY+VDhC A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292661885"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:57:48 +0800
IronPort-SDR: NAK5GiECHRi7hvXj4wnfkbS1Tq41NqkL4rR+NZZYeqGq+IeH8K1EKhu2A/1TeqzcR2dF+V/zGM
 7JCir1uhjJIp8GzpYcnphQSouJW0aZZc5yj/xlQq4OwsnL8cGFoesGSg1Lc81U2lm1ggbTfyM4
 TCrbuctvks2m4Nwva2HrZp54xExbdt/oCy/1ZVl3vRIklRm8OSHbzi7qbZjU6O9Dm1xpanOf1G
 I1vLfOgIVzovM8wL+hUchwwEGFRTLfWn2ghgPiN4Lc5zopBqe4Y9+X6uKWSHYYX//YGuKRRqSe
 jUoOZBllaDtB9SDYEYmXcOWh
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:38 -0800
IronPort-SDR: NwquymLBkEGihxQkiQgj5oDk+DaG6bLRdBdobS4RikHZOlwf76KMXkqWRUI4gC8czhXK+vtVXH
 rX3RnjJNtfGa1DGry5n3TfhU6njVyNEg72JNoX1S+V/3uXuHg8ZiQqx0f9CBrL2fQVnFcQLinF
 6eszIufl4JIdR0Er0ggQ1jBJoYk4BYYAbrYAE9dl5RzcDPT1C2CsWUPdTWGYrZgCojbMPnG6Uj
 8m/5me9z4s/nkvD4c9aMu5OAwsURVTQg66KubPfMzQ+a/6rjJ8QSAZ7EKmFECLRTGp20SpFo22
 L3k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:57:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS582qrkz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:57:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976267; x=1642568268; bh=y8/lb7AwQxwMbzKdbX
 HtxrfPjYt7J7XMSjaO0MavwLk=; b=Csmj0eopompdrAIdyOWRox3KK5ut58iHcQ
 Lj4DDOlXtqsW5zunSiF3yg7Sd9a4AepewRdjOH0rKi0/acLdf0YVt2gXEyGW6ByK
 a4P+CvC4hbokaxPJZb6xqvNG9wjN6nXEWhgQ/N1lvvwKuXA7VF5Pw279Lxzespiv
 36buT+m0nr4pEcRjoN4YG+oqm0tF3XRpJ94Pqs2DGgCvi/yk1H7gQO/oXV88MStD
 yhUbGwEnoZZROuv9EvGZqY3H2RJCxaAd6dC0yrbIsNPzrY8uF3ZcoCvnW0Ekgb8z
 nBp0hV2vL99584kbOO1XnNqzasPCBIDdEccdfAFhgCgMKAXNYirw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0asOJpN7z2dp for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:57:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5467j5z1RtVG;
 Sun, 19 Dec 2021 20:57:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/88] target/riscv: zfh: implement zfhmin extension
Date: Mon, 20 Dec 2021 14:55:44 +1000
Message-Id: <20211220045705.62174-8-alistair.francis@opensource.wdc.com>
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

Zfhmin extension is a subset of Zfh extension, consisting only of data
transfer and conversion instructions.

If enabled, only the following instructions from Zfh extension are
included:
  * flh, fsh, fmv.x.h, fmv.h.x, fcvt.s.h, fcvt.h.s
  * If D extension is present: fcvt.d.h, fcvt.h.d

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211210074329.5775-8-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                        |  1 +
 target/riscv/translate.c                  |  2 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 22 ++++++++++++++--------
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 570c49f365..ef677f9092 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -313,6 +313,7 @@ struct RISCVCPU {
         bool ext_ifencei;
         bool ext_icsr;
         bool ext_zfh;
+        bool ext_zfhmin;
=20
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 93f9ec0c8b..d445954dc7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -74,6 +74,7 @@ typedef struct DisasContext {
     bool virt_enabled;
     bool ext_ifencei;
     bool ext_zfh;
+    bool ext_zfhmin;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -644,6 +645,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->frm =3D -1;  /* unknown rounding mode */
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
     ctx->ext_zfh =3D cpu->cfg.ext_zfh;
+    ctx->ext_zfhmin =3D cpu->cfg.ext_zfhmin;
     ctx->vlen =3D cpu->cfg.vlen;
     ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
     ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/ins=
n_trans/trans_rvzfh.c.inc
index 0549e25fb4..5a7cac8958 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -22,13 +22,19 @@
     }                         \
 } while (0)
=20
+#define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
+    if (!(ctx->ext_zfh || ctx->ext_zfhmin)) { \
+        return false;                         \
+    }                                         \
+} while (0)
+
 static bool trans_flh(DisasContext *ctx, arg_flh *a)
 {
     TCGv_i64 dest;
     TCGv t0;
=20
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
     t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -50,7 +56,7 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
     TCGv t0;
=20
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
     t0 =3D get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
@@ -283,7 +289,7 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_=
h *a)
 static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -296,7 +302,7 @@ static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcv=
t_s_h *a)
 static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
=20
     gen_set_rm(ctx, a->rm);
@@ -311,7 +317,7 @@ static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcv=
t_d_h *a)
 static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
@@ -324,7 +330,7 @@ static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcv=
t_h_s *a)
 static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
     REQUIRE_EXT(ctx, RVD);
=20
     gen_set_rm(ctx, a->rm);
@@ -441,7 +447,7 @@ static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fc=
vt_h_wu *a)
 static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
     TCGv dest =3D dest_gpr(ctx, a->rd);
=20
@@ -461,7 +467,7 @@ static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_=
x_h *a)
 static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
 {
     REQUIRE_FPU;
-    REQUIRE_ZFH(ctx);
+    REQUIRE_ZFH_OR_ZFHMIN(ctx);
=20
     TCGv t0 =3D get_gpr(ctx, a->rs1, EXT_ZERO);
=20
--=20
2.31.1


