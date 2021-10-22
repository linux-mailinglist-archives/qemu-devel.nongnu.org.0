Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58DE4378A3
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:03:02 +0200 (CEST)
Received: from localhost ([::1]:48916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv8P-0007ao-So
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumg-0001pO-TP
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:35 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdume-0001Qs-Hd
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910031; x=1666446031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DS/XWr3pNjpqgLBujVnjAyIdXduE58PjNTGgxFTWEo=;
 b=ovx/MyhXjkXaaIREObIcW6B+oYIPxNmFSnwYkD835IRzeaYnSKoQG8Gq
 Nik80ikYGAzXLutBGjfVc1LlSnBzJvP+gMeaEqXlNRPb5vbNku/0ZqmKc
 tTrQh9D2XAeSRufjJsv65wYmP3uMXX6IRQF+9g3h8D6Kr4BK8yeXrkhio
 oMx2ns6g6ZB9OfP8AR4yzVQ4SAkGmYK29VAwwnkvOpwLnZHUmS7zU3hCh
 kmrHnb5Ybf0+IZZ6CtCToIfHrQ3vYGU5fH9HkMXDqwQcfqOU7pRuKvBFX
 GGqZ8JxXAnD6tAY6An4Q9FR0WcaQbAJNXFS7PE04S3NmZhp8ExQyz24tt A==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="183617898"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:30 +0800
IronPort-SDR: cFGNN7LcRtIkp4P5ecpbyJ/xLy3P27nrpkiS22V08EJgmchafsxgFIrBVEQ3v2cpzk0KIQIdqF
 wRGICq0mieQ2T5FqB0kfMaZBDp/x0npXvvTs0Ym+WFicVSZHa8K28HUjbgY/UyksCTzD8wKXMh
 9I46edgN5fD6z7izn5bXCGhYbXwrOS6vgPu5eWo1HG1Ksd4hQq0ItHiPYlOV9cF4hYi1ODELJS
 MAscFhBBdTVVBZ4fVkep5VwyaNN3srzNRTWP/J6mdfdTlNdvN415Wq4e+dSpVTlQGT5H9SEWFe
 SxPCgBV7KWpUv4RmuIfXo6iT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:06 -0700
IronPort-SDR: 3bF9b45U+KdAanXmGFFBZYQE/pIoOjZZ1WLlA0hVdzj/g1Lr+7ceGfCXeMceHqXf6MQvZ1idjW
 hD7BPvgs/wDpdj/yJVCVHqi4bulDGevsZ+1bMHzx+N8tbkBpIIU+u4d5Ugpjkwt8BDBYSQcWv2
 MABN1sGGO3ugb66Sg0w8AUhA4f4PSd87sIj3O0DXX04JtHu2nWShdfd7XendnMEr9SQwxxD/Sz
 +VWwxaCm7XfdMOqkquqt8md3AJei1uAQKoFmKnTfuTWKsdN+7ag1hZVmJEsRjymf6WFIeOAyHE
 Q9s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTW4DCnz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:31 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910031; x=1637502032; bh=4DS/XWr3pNjpqgLBuj
 VnjAyIdXduE58PjNTGgxFTWEo=; b=PasnbfC18qRHh3IvS73qg3+V1KN8SrzdOb
 9w71ySwTpm00kzXc+YYVZL39R2F+Ki2oWJO3/OO4P3qPjnoo+y2VvuIZ8nErB7e/
 bUSC8M08JR738BeZJIj+WXTbUr5YnTLw3pZOYlupCP9D2w2yjQ+I9goNgxkQZC9o
 89iZ23JRCm6efg+L1YnxKncoesQ4sWFL0fjR8ZCLHcobCywKGIvhbMRgaqFW2/dj
 UXY0cHg8sO9TF/3kVi9i7ILq1nBeOK1/Qd+N/Hd4VV/ADPfWH/fJGqrObpluSHeg
 /4OGQ2p1v1Evu/4602FUjCJ6tipKBTKCbFatZXpqU4ORzj/+EQQA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oUlvDIMJA908 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTR4c5rz1RtVl;
 Fri, 22 Oct 2021 06:40:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/33] target/riscv: Compute mstatus.sd on demand
Date: Fri, 22 Oct 2021 23:38:01 +1000
Message-Id: <20211022133812.3972903-23-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The position of this read-only field is dependent on the current xlen.
Rather than having to compute that difference in many places, compute
it only on read.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-16-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c |  3 +--
 target/riscv/csr.c        | 37 ++++++++++++++++++++++---------------
 target/riscv/translate.c  |  5 ++---
 3 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 429afd1f48..0d1132f39d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -185,10 +185,9 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
=20
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
-    uint64_t sd =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? MSTATUS32_SD : =
MSTATUS64_SD;
     uint64_t mstatus_mask =3D MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL | sd;
+                            MSTATUS64_UXL;
     bool current_virt =3D riscv_cpu_virt_enabled(env);
=20
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c4a479ddd2..69e4d65fcd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -477,10 +477,28 @@ static RISCVException read_mhartid(CPURISCVState *e=
nv, int csrno,
 }
=20
 /* Machine Trap Setup */
+
+/* We do not store SD explicitly, only compute it on demand. */
+static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
+{
+    if ((status & MSTATUS_FS) =3D=3D MSTATUS_FS ||
+        (status & MSTATUS_XS) =3D=3D MSTATUS_XS) {
+        switch (xl) {
+        case MXL_RV32:
+            return status | MSTATUS32_SD;
+        case MXL_RV64:
+            return status | MSTATUS64_SD;
+        default:
+            g_assert_not_reached();
+        }
+    }
+    return status;
+}
+
 static RISCVException read_mstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    *val =3D env->mstatus;
+    *val =3D add_status_sd(riscv_cpu_mxl(env), env->mstatus);
     return RISCV_EXCP_NONE;
 }
=20
@@ -498,7 +516,6 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
 {
     uint64_t mstatus =3D env->mstatus;
     uint64_t mask =3D 0;
-    int dirty;
=20
     /* flush tlb on mstatus fields that affect VM */
     if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
@@ -520,12 +537,7 @@ static RISCVException write_mstatus(CPURISCVState *e=
nv, int csrno,
=20
     mstatus =3D (mstatus & ~mask) | (val & mask);
=20
-    dirty =3D ((mstatus & MSTATUS_FS) =3D=3D MSTATUS_FS) |
-            ((mstatus & MSTATUS_XS) =3D=3D MSTATUS_XS);
-    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
-        mstatus =3D set_field(mstatus, MSTATUS32_SD, dirty);
-    } else {
-        mstatus =3D set_field(mstatus, MSTATUS64_SD, dirty);
+    if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
         /* SXL and UXL fields are for now read only */
         mstatus =3D set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
         mstatus =3D set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
@@ -798,13 +810,8 @@ static RISCVException read_sstatus(CPURISCVState *en=
v, int csrno,
 {
     target_ulong mask =3D (sstatus_v1_10_mask);
=20
-    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
-        mask |=3D SSTATUS32_SD;
-    } else {
-        mask |=3D SSTATUS64_SD;
-    }
-
-    *val =3D env->mstatus & mask;
+    /* TODO: Use SXL not MXL. */
+    *val =3D add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
     return RISCV_EXCP_NONE;
 }
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bed1c2174e..d38f87d718 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -280,7 +280,6 @@ static void gen_jal(DisasContext *ctx, int rd, target=
_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd =3D get_xl(ctx) =3D=3D MXL_RV32 ? MSTATUS32_SD : MST=
ATUS64_SD;
=20
     if (ctx->mstatus_fs !=3D MSTATUS_FS) {
         /* Remember the state change for the rest of the TB. */
@@ -288,7 +287,7 @@ static void mark_fs_dirty(DisasContext *ctx)
=20
         tmp =3D tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
         tcg_temp_free(tmp);
     }
@@ -299,7 +298,7 @@ static void mark_fs_dirty(DisasContext *ctx)
=20
         tmp =3D tcg_temp_new();
         tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
         tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs))=
;
         tcg_temp_free(tmp);
     }
--=20
2.31.1


