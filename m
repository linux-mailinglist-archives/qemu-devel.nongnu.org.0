Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C55424DA7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:04:17 +0200 (CEST)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNRw-0007b5-N1
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDv-0004lX-6Z
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:47 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDt-0006fx-9w
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589385; x=1665125385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=er94YNdPEyDm1X3nyxSkXfKoyRKBD5rGyQq8d2Iu0p0=;
 b=TWaOlej3RFIxsm4wYhCMW0l2E74qa0e1LrUYd0AMZqGvkkJ23lN+CJmG
 F5oGiYzpW8YLfVEhXmYOFKyCc2ibFGJAAgzU9EDkPlKJaARtuliGvWntI
 bSb0JZDIlMaFs9qYEWd1b8xxVrnKVPIzd7cjwmaonYQz3iKepWm5rgkzA
 j7OhrpRdYvHn9pvUfnLbEyLRKqBkoa0T5mxo0pKYEUy+cpZqrv6jCP5jY
 l6NT/Zk32NgYNeAFe9o4E1nkh6rz9pPF/hDFILFZ2Ku7caK15Yb+tc8no
 aN1GLXt8kEkAT10T6fS7SkloENaNZRDsE+9Ysj3D8OWibG4bB5DJbfav0 A==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815506"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:43 +0800
IronPort-SDR: lGZ8q7HshtqUSqnB9f/n2pZNHWAYrN9RC+WJX+exo0e48baFwFY/gYeRGPtbqoBKb/UA6mj2s6
 LZbTKZg/kPoYIkly0yr76tTwupt4r0LVuDnom3m/2+6jrH6WFXXkHiiVYAUTlFaedA/NwpRj7s
 zAKmet788aFQORnQ8ECVJCpd7HEHhCih72N9HwgCYY2DrgkPemobrKU8TmTnKu9aaw6++/FUTN
 iKwzB2TE/mDgQiFzZLk2y0GvTwjJrlLz/nl9uM90e8Z3CYczy6pM7ApQ3LwwGNrxrLjiTsyA2Z
 wBD7BiQwGsYYsFer9SH1z2eA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:25:37 -0700
IronPort-SDR: livlMvKyE6HT2r/g2Vl+YjeUyZSU480YxQPtV9HOQtb/fMVxpcd2cyU/euMVujVqwUqSYcawDF
 WwE28JZB4zwqFfFfMHYQlguveqCWsKWl4vJA6BGV8N8Zus4rRM/UZ8rM4CiBL0AxeaOyfBApyg
 5eTlB2llGtGnZtLG5fkaLOCHhBvGKToUiXSWEtDjIJNJgMuyuFlI3wsaa1gq5hxiw/Z3lKWRuS
 OwWftrvYrHdt3POhuQIWEOEnqHUx/PYsxMS5NY6TwYWVG88DK0xf5X7KI5Yycs8tMixULjBOTh
 Gok=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ24R2Q5wz1RvmJ
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589382; x=1636181383; bh=er94YNdPEyDm1X3nyx
 SkXfKoyRKBD5rGyQq8d2Iu0p0=; b=FPwnrVxsgHXYAYmPU8+VPL1iiXRl/+rej0
 NjeI6xeKSDAfcu9vzoUsZgR1s16g2PVuoacm4WPZrZlMS2nj+lb4JQ4bOv6q7jgv
 WPm3Sq+NdrMfHHYiLdci7lbVtg/LKcNZSCuBXrxCrT/N7mhmVQUU01Fu7n9u3+5b
 /ZkB8mJTnk1YGkZXYhZSze7zZLPDknAgxBC0ObpyX9IWylJn7BXnP8BR7jEx0OGO
 zWN97IBXqpABCboJwK5ODnxdgoi8srxzs2irqa+ZoPEkvKLcd+Pvivyb8DOfGxMn
 6PgANUzGfml99JqrlSzAPoozCXIC0YvaLNv/KqMvXdu/KO5/43/Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4Dn0ya47eIWM for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ24K4rnnz1RvTg;
 Wed,  6 Oct 2021 23:49:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/26] target/riscv: Set mstatus_hs.[SD|FS] bits if Clean and
 V=1 in mark_fs_dirty()
Date: Thu,  7 Oct 2021 16:47:42 +1000
Message-Id: <20211007064751.608580-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

When V=3D1, both vsstauts.FS and HS-level sstatus.FS are in effect.
Modifying the floating-point state when V=3D1 causes both fields to
be set to 3 (Dirty).

However, it's possible that HS-level sstatus.FS is Clean and VS-level
vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=3D1.
We can't early return for this case because we still need to set
sstatus.FS to Dirty according to spec.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
Tested-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210921020234.123448-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |  4 ++++
 target/riscv/translate.c | 30 +++++++++++++++++-------------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bd519c9090..9e55b2f5b1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -393,6 +393,7 @@ FIELD(TB_FLAGS, SEW, 5, 3)
 FIELD(TB_FLAGS, VILL, 8, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
=20
 bool riscv_cpu_is_32bit(CPURISCVState *env);
=20
@@ -449,6 +450,9 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState=
 *env, target_ulong *pc,
                 get_field(env->hstatus, HSTATUS_HU))) {
             flags =3D FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
         }
+
+        flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
+                           get_field(env->mstatus_hs, MSTATUS_FS));
     }
 #endif
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b2d3444bc5..d2442f0cf5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -58,6 +58,7 @@ typedef struct DisasContext {
     target_ulong misa;
     uint32_t opcode;
     uint32_t mstatus_fs;
+    uint32_t mstatus_hs_fs;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction=
,
        which we have already installed into env->fp_status.  Or -1 for
@@ -280,27 +281,29 @@ static void gen_jal(DisasContext *ctx, int rd, targ=
et_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd;
+    target_ulong sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
=20
-    if (ctx->mstatus_fs =3D=3D MSTATUS_FS) {
-        return;
-    }
-    /* Remember the state change for the rest of the TB.  */
-    ctx->mstatus_fs =3D MSTATUS_FS;
+    if (ctx->mstatus_fs !=3D MSTATUS_FS) {
+        /* Remember the state change for the rest of the TB. */
+        ctx->mstatus_fs =3D MSTATUS_FS;
=20
-    tmp =3D tcg_temp_new();
-    sd =3D is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+        tmp =3D tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+        tcg_temp_free(tmp);
+    }
=20
-    tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
-    tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
+    if (ctx->virt_enabled && ctx->mstatus_hs_fs !=3D MSTATUS_FS) {
+        /* Remember the stage change for the rest of the TB. */
+        ctx->mstatus_hs_fs =3D MSTATUS_FS;
=20
-    if (ctx->virt_enabled) {
+        tmp =3D tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
         tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
+        tcg_temp_free(tmp);
     }
-    tcg_temp_free(tmp);
 }
 #else
 static inline void mark_fs_dirty(DisasContext *ctx) { }
@@ -539,6 +542,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->frm =3D -1;  /* unknown rounding mode */
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
     ctx->vlen =3D cpu->cfg.vlen;
+    ctx->mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS)=
;
     ctx->hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill =3D FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew =3D FIELD_EX32(tb_flags, TB_FLAGS, SEW);
--=20
2.31.1


