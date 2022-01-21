Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A55495BCF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:22:30 +0100 (CET)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApBj-0002jP-IB
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0R-0007xv-Uv
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:40 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:53946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn02-0005As-7M
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744933; x=1674280933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3vgktb5EDlAfBr28kqak3LKYudEjbo80mWaCphCZPxE=;
 b=gpKVYn9t+4t5EHqKHo9eEqp7bLoICS82Hj2ILW0ABmIzt55cudzdwzcf
 8Ok52sPQEm+ks01Ftob06nPRvLMU5hfMJaAYXkpP6hmieCXEnCMVcms4U
 nM+IxFMMVbY1IJewNURDCDeKB1E7Nd9H5sGgFDGT/XyRx2iSOLn7o9MpT
 l7j891Jr3xurhilm0s/HvmZhsD9D2x2hUyJm+3oz8vS1ncktsEr1MLONf
 8a3pXuP3wvejbBdKzFN0s7LlR0Lu3eUOHcWrt1M/dTPoNlCdEqFQpct4u
 sBHyTy+hHrmnXNUI64VGdXOgakaBqKFx1hoRpJBZQQWRFFj2WL7Sn8zxk A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="195814213"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:11 +0800
IronPort-SDR: bwLe29jwig1hPHslpN33mCTEPLj7iH+0UqnumjJ07Iwu5hIX9x+LGdEzluNaDC6GBg/jxg7S9o
 m82+FcscKUTwkTQ2w29XOJTqQeRMyCHGqImPswHMoSGVUUEfVkaJCBxAmO0crfFpQpYh5+GiWu
 iLVprcCke3k3UwIzMzpriEaXQQpOPN5GDBITYr9phkqsi8Ak5v1Sqt1taHt7/UzF+RUDJN2uNZ
 BooHzZBuvcHnGUM1o7WDsWV6N6ddyRXICXlcsuuO4xAqgfYH1KxqmL3hY4WnJXAY4WOjB5kIhi
 vSuQq6jOvUxsa6VdR5+gv6TI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:38 -0800
IronPort-SDR: rm6zYh60gBsusH+kY0mDwOW05Xo1oe2nJJrMo6XBHtFeJnPjhnE+gtxIejgWY/BZlwgJEb98ct
 kfJidnB9ar5oI6F3f+Rj2xtRdaYaV7pKMXr4YzFnQpIxX3tx+erjYdkqGA/98+8if+tMaFGlvk
 SqwUwsDH6gVDfkM0/KH1xAh7cg60NtuFA3XNuyBUSMv4j9lY8P8qBtZY95mxh+mEki9C6n5l6F
 uYP1rfmExnY2qYccpoxgGhebbwIexCo31sEGkpxmBCwxMyHVwvnkKIn67pb9Wr7h5P0iRDK88w
 H8w=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg80g06wmz1SVp3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744930; x=1645336931; bh=3vgktb5EDlAfBr28kq
 ak3LKYudEjbo80mWaCphCZPxE=; b=GONzIL0b1ucQlyFeQ2wNydSqvwH1hTboIV
 yJ1hElUnJt0Z0pZOw+qKPyU5w4ZHfdfKGCIVDvfSldSOkHOqbn0UwhGXXjlzrRiZ
 OMjeaZfscWJGRNSQIzacs8WysAZQezT+O3vxj6uVthxOPwyzALw2F2nzn2bAtvdK
 8118WbMESy4sRZSFZaPUk11wzuqXcmHP1IzpLxxb/HRyAWoU8NcJVPDm+rQdlppl
 gAHWZxv2QENItgnGUZ6i9Ae3e+cgGx5ZefpZAqkLMGIDZRiXMcVxkmv5JqI0iHgQ
 hy8iXGoEe0fxfR+/WsyxOaoHgEzYRgfN4by0ANdR+j1H6KXvasnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NCnQf2MCFMeh for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg80b2yNpz1RvlN;
 Thu, 20 Jan 2022 22:02:06 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 50/61] target/riscv: Alloc tcg global for cur_pm[mask|base]
Date: Fri, 21 Jan 2022 15:58:19 +1000
Message-Id: <20220121055830.3164408-51-alistair.francis@opensource.wdc.com>
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

Replace the array of pm_mask/pm_base with scalar variables.
Remove the cached array value in DisasContext.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-13-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2a88bd99dc..43e2ec6dce 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -38,8 +38,8 @@ static TCGv_i64 cpu_fpr[32]; /* assume F and D extensio=
ns */
 static TCGv load_res;
 static TCGv load_val;
 /* globals for PM CSRs */
-static TCGv pm_mask[4];
-static TCGv pm_base[4];
+static TCGv pm_mask;
+static TCGv pm_base;
=20
 #include "exec/gen-icount.h"
=20
@@ -109,8 +109,6 @@ typedef struct DisasContext {
     TCGv temp[4];
     /* PointerMasking extension */
     bool pm_enabled;
-    TCGv pm_mask;
-    TCGv pm_base;
 } DisasContext;
=20
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -403,8 +401,8 @@ static TCGv gen_pm_adjust_address(DisasContext *s, TC=
Gv src)
         return src;
     } else {
         temp =3D temp_new(s);
-        tcg_gen_andc_tl(temp, src, s->pm_mask);
-        tcg_gen_or_tl(temp, temp, s->pm_base);
+        tcg_gen_andc_tl(temp, src, pm_mask);
+        tcg_gen_or_tl(temp, temp, pm_base);
         return temp;
     }
 }
@@ -929,10 +927,6 @@ static void riscv_tr_init_disas_context(DisasContext=
Base *dcbase, CPUState *cs)
     ctx->ntemp =3D 0;
     memset(ctx->temp, 0, sizeof(ctx->temp));
     ctx->pm_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_ENABLED);
-    int priv =3D tb_flags & TB_FLAGS_PRIV_MMU_MASK;
-    ctx->pm_mask =3D pm_mask[priv];
-    ctx->pm_base =3D pm_base[priv];
-
     ctx->zero =3D tcg_constant_tl(0);
 }
=20
@@ -1050,19 +1044,9 @@ void riscv_translate_init(void)
                              "load_res");
     load_val =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, loa=
d_val),
                              "load_val");
-#ifndef CONFIG_USER_ONLY
     /* Assign PM CSRs to tcg globals */
-    pm_mask[PRV_U] =3D
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmmask), "upm=
mask");
-    pm_base[PRV_U] =3D
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, upmbase), "upm=
base");
-    pm_mask[PRV_S] =3D
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmmask), "spm=
mask");
-    pm_base[PRV_S] =3D
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, spmbase), "spm=
base");
-    pm_mask[PRV_M] =3D
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmmask), "mpm=
mask");
-    pm_base[PRV_M] =3D
-      tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, mpmbase), "mpm=
base");
-#endif
+    pm_mask =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_=
pmmask),
+                                 "pmmask");
+    pm_base =3D tcg_global_mem_new(cpu_env, offsetof(CPURISCVState, cur_=
pmbase),
+                                 "pmbase");
 }
--=20
2.31.1


