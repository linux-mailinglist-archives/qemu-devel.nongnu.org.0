Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E997D3FD14B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:26:37 +0200 (CEST)
Received: from localhost ([::1]:57682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFxV-0005QO-02
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkD-0007uA-8B
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:55 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFkA-0000pL-IJ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462370; x=1661998370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JAw6/S/6EyKwEChkxjR/Y/V/J1bHPL4fMoB8EXHbWjI=;
 b=czjdWrzj3ak4dpMz0lbRw0ViRMS6iss8VQq5DJGQ1/vX8+EchnVnkUqj
 OCtRY3HfLpKS0qsVdwn+2dT8ilOdBEGnlOJ5FxfJ8VN8X7mBwkuzgE2hz
 NAewHRfSU+MOHCajgj6ygV1POPhcESrv8wtfI9Ds2J0l7eBvLK4U99jdL
 N+ekWvuh0k5FpVqhdzsS5AYLyVtDDMNqP8qFje8VLNQQGPmhD8XDtLYmE
 IxLq6SKAVIoAFPJdP0nWXc0BqBpZj7bTQNMkFNcem4TugoQAt8jVfwS5t
 v6G01BhmmJp20qGy46eLPgBDuhnTHmpagNyBa4VdVG36XBAJ2eOC+Bijl w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011786"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:49 +0800
IronPort-SDR: 0vzI0bwpRMnWTY17DUYxtiPkykNrvr0uJQvSd/gQMiEOkQejv1F8Tt5mf/pTuwPBFA3Tcm4Nmt
 qU5eK6Veh0qE1i8jvfhFTppdtAFBZfqhDHLPxZCK6DoRRPnYl7aC4kIihmt4DewMGvkhPKzMUE
 ipNeXXvbhhgCsM7pj8EnOFjGda5j7skJMN8UFsy9PjE1dGIbikqiOSBQqB4Ih1YdlHmSz6Iclg
 ETFPhpOMkW1Wci5/IUXbNbRqpgD2cxyE/y02TebjGgTjkdCyHaUz2F4L+HFlGY2V2dAJP5WQMD
 WhF+38tO1Ll2hdEedUY1zmCh
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:37 -0700
IronPort-SDR: 8t1jb6VeR3qs4ieftNLCRh2Zkel4xzZTds9ifXQGqsZKsMv0VXnQ64vyjSF8ZjXGzGx/FIcz/8
 du8Zu85pES+0c/qXpAhUCGgslPWjD9sHQGzIxAjsc6v2X2qRCzFaCyFLe+FSOOi0tfhYHHwj/o
 exnjYsBmx7vDSzuT7gvg8YQeWYbAMCPcq3cNgc+PGdp3wBVUuXc6eX01v1827kl5EvIpzIMgi6
 JbceJFYvbfTnN3fQyO7AQ4BD7bOhNILA0aGtOHAFh8eDux87oDy+sU6L0JiiQo5HH3roeoRdFd
 IUc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzndX5xKxz1Rwrr
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462363; x=1633054364; bh=JAw6/S/6EyKwEChkxj
 R/Y/V/J1bHPL4fMoB8EXHbWjI=; b=k8zw+/xFwel0V8XLiYHDj6D496quMXC6Qh
 /9Tujmw3bQ2AKhowWd2fuGdqaOlCpQOWcxDKJSL9cBRqQbxqj11aDuj3CGnxXWbl
 KywNREiNJz8ZsB3U/n9I2Dqj0WISjBamzFm8pGtXh61lIKEZiUh7vFgC1aQIRG+o
 cZ8mCBOHRqSeI9lpdfP3izYQgcbQ8S6tclyh2uvXe6MOXrwp+NZ76TQiUREEclGK
 rXUPyZxUvEuvxw2dor7LOQnK32Wtx1+3OIIJfmFAj+40kQ/OnhkNoek8/AY5J9+V
 HLcJCcw9r5E1VqdIAeg4M4/ruXjCvbuJR1/tEYbyfoZM0y5yRzkA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YDNgoTiWWKVL for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:43 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GzndM2ByKz1Rvl9;
 Tue, 31 Aug 2021 19:12:38 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/33] target/riscv: Reorg csr instructions
Date: Wed,  1 Sep 2021 12:09:52 +1000
Message-Id: <20210901020958.458454-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Introduce csrr and csrw helpers, for read-only and write-only insns.

Note that we do not properly implement this in riscv_csrrw, in that
we cannot distinguish true read-only (rs1 =3D=3D 0) from any other zero
write_mask another source register -- this should still raise an
exception for read-only registers.

Only issue gen_io_start for CF_USE_ICOUNT.
Use ctx->zero for csrrc.
Use get_gpr and dest_gpr.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-19-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |   6 +-
 target/riscv/op_helper.c                |  18 +--
 target/riscv/insn_trans/trans_rvi.c.inc | 174 +++++++++++++++++-------
 3 files changed, 132 insertions(+), 66 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 415e37bc37..460eee9988 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -65,9 +65,9 @@ DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl=
)
 DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
=20
 /* Special functions */
-DEF_HELPER_3(csrrw, tl, env, tl, tl)
-DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
-DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
+DEF_HELPER_2(csrr, tl, env, int)
+DEF_HELPER_3(csrw, void, env, int, tl)
+DEF_HELPER_4(csrrw, tl, env, int, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 3c48e739ac..ee7c24efe7 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -37,11 +37,10 @@ void helper_raise_exception(CPURISCVState *env, uint3=
2_t exception)
     riscv_raise_exception(env, exception, 0);
 }
=20
-target_ulong helper_csrrw(CPURISCVState *env, target_ulong src,
-        target_ulong csr)
+target_ulong helper_csrr(CPURISCVState *env, int csr)
 {
     target_ulong val =3D 0;
-    RISCVException ret =3D riscv_csrrw(env, csr, &val, src, -1);
+    RISCVException ret =3D riscv_csrrw(env, csr, &val, 0, 0);
=20
     if (ret !=3D RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -49,23 +48,20 @@ target_ulong helper_csrrw(CPURISCVState *env, target_=
ulong src,
     return val;
 }
=20
-target_ulong helper_csrrs(CPURISCVState *env, target_ulong src,
-        target_ulong csr, target_ulong rs1_pass)
+void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
-    target_ulong val =3D 0;
-    RISCVException ret =3D riscv_csrrw(env, csr, &val, -1, rs1_pass ? sr=
c : 0);
+    RISCVException ret =3D riscv_csrrw(env, csr, NULL, src, -1);
=20
     if (ret !=3D RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
     }
-    return val;
 }
=20
-target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
-        target_ulong csr, target_ulong rs1_pass)
+target_ulong helper_csrrw(CPURISCVState *env, int csr,
+                          target_ulong src, target_ulong write_mask)
 {
     target_ulong val =3D 0;
-    RISCVException ret =3D riscv_csrrw(env, csr, &val, 0, rs1_pass ? src=
 : 0);
+    RISCVException ret =3D riscv_csrrw(env, csr, &val, src, write_mask);
=20
     if (ret !=3D RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index 76454fb7e2..920ae0edb3 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -426,80 +426,150 @@ static bool trans_fence_i(DisasContext *ctx, arg_f=
ence_i *a)
     return true;
 }
=20
-#define RISCV_OP_CSR_PRE do {\
-    source1 =3D tcg_temp_new(); \
-    csr_store =3D tcg_temp_new(); \
-    dest =3D tcg_temp_new(); \
-    rs1_pass =3D tcg_temp_new(); \
-    gen_get_gpr(ctx, source1, a->rs1); \
-    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
-    tcg_gen_movi_tl(rs1_pass, a->rs1); \
-    tcg_gen_movi_tl(csr_store, a->csr); \
-    gen_io_start();\
-} while (0)
-
-#define RISCV_OP_CSR_POST do {\
-    gen_set_gpr(ctx, a->rd, dest); \
-    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
-    exit_tb(ctx); \
-    ctx->base.is_jmp =3D DISAS_NORETURN; \
-    tcg_temp_free(source1); \
-    tcg_temp_free(csr_store); \
-    tcg_temp_free(dest); \
-    tcg_temp_free(rs1_pass); \
-} while (0)
+static bool do_csr_post(DisasContext *ctx)
+{
+    /* We may have changed important cpu state -- exit to main loop. */
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+    exit_tb(ctx);
+    ctx->base.is_jmp =3D DISAS_NORETURN;
+    return true;
+}
+
+static bool do_csrr(DisasContext *ctx, int rd, int rc)
+{
+    TCGv dest =3D dest_gpr(ctx, rd);
+    TCGv_i32 csr =3D tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrr(dest, cpu_env, csr);
+    gen_set_gpr(ctx, rd, dest);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrw(DisasContext *ctx, int rc, TCGv src)
+{
+    TCGv_i32 csr =3D tcg_constant_i32(rc);
=20
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrw(cpu_env, csr, src);
+    return do_csr_post(ctx);
+}
+
+static bool do_csrrw(DisasContext *ctx, int rd, int rc, TCGv src, TCGv m=
ask)
+{
+    TCGv dest =3D dest_gpr(ctx, rd);
+    TCGv_i32 csr =3D tcg_constant_i32(rc);
+
+    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
+        gen_io_start();
+    }
+    gen_helper_csrrw(dest, cpu_env, csr, src, mask);
+    gen_set_gpr(ctx, rd, dest);
+    return do_csr_post(ctx);
+}
=20
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrw(dest, cpu_env, source1, csr_store);
-    RISCV_OP_CSR_POST;
-    return true;
+    TCGv src =3D get_gpr(ctx, a->rs1, EXT_NONE);
+
+    /*
+     * If rd =3D=3D 0, the insn shall not read the csr, nor cause any of=
 the
+     * side effects that might occur on a csr read.
+     */
+    if (a->rd =3D=3D 0) {
+        return do_csrw(ctx, a->csr, src);
+    }
+
+    TCGv mask =3D tcg_constant_tl(-1);
+    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
=20
 static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrs(dest, cpu_env, source1, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 =3D=3D 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 =3D=3D 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv ones =3D tcg_constant_tl(-1);
+    TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
=20
 static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrc(dest, cpu_env, source1, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 =3D=3D 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 =3D=3D 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv mask =3D get_gpr(ctx, a->rs1, EXT_ZERO);
+    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
=20
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrw(dest, cpu_env, rs1_pass, csr_store);
-    RISCV_OP_CSR_POST;
-    return true;
+    TCGv src =3D tcg_constant_tl(a->rs1);
+
+    /*
+     * If rd =3D=3D 0, the insn shall not read the csr, nor cause any of=
 the
+     * side effects that might occur on a csr read.
+     */
+    if (a->rd =3D=3D 0) {
+        return do_csrw(ctx, a->csr, src);
+    }
+
+    TCGv mask =3D tcg_constant_tl(-1);
+    return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
=20
 static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrs(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 =3D=3D 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 =3D=3D 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv ones =3D tcg_constant_tl(-1);
+    TCGv mask =3D tcg_constant_tl(a->rs1);
+    return do_csrrw(ctx, a->rd, a->csr, ones, mask);
 }
=20
 static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
 {
-    TCGv source1, csr_store, dest, rs1_pass;
-    RISCV_OP_CSR_PRE;
-    gen_helper_csrrc(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
-    RISCV_OP_CSR_POST;
-    return true;
+    /*
+     * If rs1 =3D=3D 0, the insn shall not write to the csr at all, nor
+     * cause any of the side effects that might occur on a csr write.
+     * Note that if rs1 specifies a register other than x0, holding
+     * a zero value, the instruction will still attempt to write the
+     * unmodified value back to the csr and will cause side effects.
+     */
+    if (a->rs1 =3D=3D 0) {
+        return do_csrr(ctx, a->rd, a->csr);
+    }
+
+    TCGv mask =3D tcg_constant_tl(a->rs1);
+    return do_csrrw(ctx, a->rd, a->csr, ctx->zero, mask);
 }
--=20
2.31.1


