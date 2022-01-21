Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D5495B1E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:46:39 +0100 (CET)
Received: from localhost ([::1]:49136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAod4-0004OM-LO
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:46:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0V-00086o-2H
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:43 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:53939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0R-0005AO-4D
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744958; x=1674280958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oMicRhehYOvRTi0WCkCo69lWkvqmFDL8RhgCLn31WRg=;
 b=L88++z2DaVamzsuzIr89JQW/hUYAYBl4NtbagqW1OU+YJUTaUwEhqo06
 EsEAVR9jcDFI8PmXsIpCBFTIkUaGxVxMCopdz4YgxgNnsdiQjHhR/FAKa
 ygIpMk9BEr9MmU9+k8SxTZKwbJdZHlIlIaFxd3c53iOVOV9iYWB8m6bxS
 jrKGw3Tw31upeK2bU52QSmb0Gz2E9oO68ABWkusaSNOhij12ekXrOovtI
 arMVOeShM7bWe5xh7NnsNDHj835MK34MCv3inGTkSbPs/gKgp3+RgASmU
 q4JAWYgTNOVHzzIr8BZZqDV/G9fWTmUUAM/4hRXnI3Y7+v5T4O9ITdm9f A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="195814222"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:19 +0800
IronPort-SDR: jRoMhJc5pz8SAjyzKL+3Q5lR0ENyEsO+iqs+w0PrWU3075JNmLMqyZ/9+sIh3avfOk1Q7uLvGC
 keUJQ1NTS4LtoERqyMbDTT6ylUxzBwcPvxlfRJhdscMKl0hUJpg95sPGe9Y1n6N+kPtTKN/96K
 mKVPOYbHE1tVO1TXuqgPp9MlBFJuxKa0nj9ZNV1DQJquMZTCcYL6PiEaYiGvWYSW3ZA+VvzP3l
 WgGhKUkjQj83iY7Og5KiRLcJL1zfdJ801823hRbUSWvG8z7OHswUKAnAGL2LtXzSU7sjvn04Q+
 PzJki+wUyYcl3oLGzr/I1fUW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:47 -0800
IronPort-SDR: YiGO44dCHBcU+Vvst7yXfnha2vFE++Pl989AUnqeMB/Ff3wPMK7xEZ5H38IqqS3pih0/DBK0DU
 uGxKQoWqACALfHBpt+2SqtFARIJEUtgFbmQDzqViUSiU60EYDEoDjhl+VLz0OzzaZOpbdC3cnM
 K4IXzY+qdw+RL1R+Nd12DbK3Dt4j4vLlJ6YEkLKOhf+oZB2L+w0/jo0D19/98LBKDjuK2ByleJ
 qWmByNgpiamAYHqETti7T86X7Id4RiJXe3O6ylHwHrtfC0HGLdPhCaHCKBfGo9/rrMB4/wyzL+
 98A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80q6Vv9z1SVp1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744939; x=1645336940; bh=oMicRhehYOvRTi0WCk
 Co69lWkvqmFDL8RhgCLn31WRg=; b=FZ3ORCljnqCMpdvULcRT1Op+RD7cLudOrZ
 Eb+xdp61YBfjIP3mTaZ+MTsN5fHKdiE94d/ww79/IjCeql/IBI+WbP+stJiuni7v
 2zMUqu5OORDZtqhBGafaCzfoHrjacjmtaosQNYq7Qt1/SUZqUrhcofO88k0wLTVO
 Q1RmzZaopibVh1o9GmwW/c/CEqO4cPhwlBC/zkbJ/S88c1JkQLJG/54Q5emBESRQ
 HBpWHY31oub1BNv7Vi9DOA4tim8AzC+CJWtNDMR09GTod4MbzlMXDvcI58S8FQlt
 TRusQg8jLJLML8Wz7RH2gPGqY7JGU+yFLWknFi1rhzuL/PEGnnmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jAgSKZn7jYxY for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:19 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80m0kKqz1RvlN;
 Thu, 20 Jan 2022 22:02:15 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 52/61] target/riscv: Split pm_enabled into mask and base
Date: Fri, 21 Jan 2022 15:58:21 +1000
Message-Id: <20220121055830.3164408-53-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Use cached cur_pmmask and cur_pmbase to infer the
current PM mode.

This may decrease the TCG IR by one when pm_enabled
is true and pm_base_enabled is false.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-15-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  3 ++-
 target/riscv/cpu_helper.c | 24 ++++++------------------
 target/riscv/translate.c  | 12 ++++++++----
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6fe842edfd..89621e1996 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -448,7 +448,8 @@ FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
 /* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
 FIELD(TB_FLAGS, XL, 20, 2)
 /* If PointerMasking should be applied */
-FIELD(TB_FLAGS, PM_ENABLED, 22, 1)
+FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
+FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b239d721f4..502aee84ab 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -97,27 +97,15 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
         flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
     }
-    if (riscv_has_ext(env, RVJ)) {
-        int priv =3D flags & TB_FLAGS_PRIV_MMU_MASK;
-        bool pm_enabled =3D false;
-        switch (priv) {
-        case PRV_U:
-            pm_enabled =3D env->mmte & U_PM_ENABLE;
-            break;
-        case PRV_S:
-            pm_enabled =3D env->mmte & S_PM_ENABLE;
-            break;
-        case PRV_M:
-            pm_enabled =3D env->mmte & M_PM_ENABLE;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_ENABLED, pm_enabled);
-    }
 #endif
=20
     flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
+    if (env->cur_pmmask < (env->xl =3D=3D MXL_RV32 ? UINT32_MAX : UINT64=
_MAX)) {
+        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
+    }
+    if (env->cur_pmbase !=3D 0) {
+        flags =3D FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
+    }
=20
     *pflags =3D flags;
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 33564d059d..f0bbe80875 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -108,7 +108,8 @@ typedef struct DisasContext {
     /* Space for 3 operands plus 1 extra for address computation. */
     TCGv temp[4];
     /* PointerMasking extension */
-    bool pm_enabled;
+    bool pm_mask_enabled;
+    bool pm_base_enabled;
 } DisasContext;
=20
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -397,12 +398,14 @@ static TCGv get_address(DisasContext *ctx, int rs1,=
 int imm)
     TCGv src1 =3D get_gpr(ctx, rs1, EXT_NONE);
=20
     tcg_gen_addi_tl(addr, src1, imm);
-    if (ctx->pm_enabled) {
+    if (ctx->pm_mask_enabled) {
         tcg_gen_and_tl(addr, addr, pm_mask);
-        tcg_gen_or_tl(addr, addr, pm_base);
     } else if (get_xl(ctx) =3D=3D MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
+    if (ctx->pm_base_enabled) {
+        tcg_gen_or_tl(addr, addr, pm_base);
+    }
     return addr;
 }
=20
@@ -925,7 +928,8 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->cs =3D cs;
     ctx->ntemp =3D 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
-    ctx->pm_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
+    ctx->pm_mask_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENAB=
LED);
+    ctx->pm_base_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENAB=
LED);
     ctx->zero =3D tcg_constant_tl(0);
 }
=20
--=20
2.31.1


