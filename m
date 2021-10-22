Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7064443783E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:43:28 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdupT-0007yg-Cj
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulW-0008QP-Hx
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:23 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulU-00013i-DT
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909960; x=1666445960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EV/G3/L/beuAoU7qjn9Sh1uqgs8o/FR+FSpTeGAQbZA=;
 b=R6+lEQVI0Pi0IcTBMANX+2XMfhu/nL9kTIT5SwgZtKeOLXaS0uKdXXJs
 18AYDuJYAm9DKWzxCkk83FLf+inio5Qu01fHRtsXTGN5lfEnrEuHWC5UL
 Wyr2Uv7n2HRAy9pBttWXUTlFWKv+GDzEb55qNrwA8b1Cw/mq3FrUwC7Et
 qi/F93yBK+YBtT1X5RS908oSbunkjs14uedilwnoAk/+TzN+y8B+P8Bu2
 BjEX4fkcB2XFKTOkZvDVS1n/JTwYM1MF3dG5lBg70h431es/e37rBJWwS
 HvqLhOnBWwyq3az7JzsD1rINYUulBC6v1aY7hfjIBGSNbJnCr+6wUh0zO g==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632586"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:18 +0800
IronPort-SDR: x5DI2Fw6IOYTLWf4ZlWNrI7uOiFH+KZ9Fi3k8aFEPZ0DQ2eggiKN+QV3pZjU8Ee6KNA+pt64P7
 E3RLycBP+qojJz5HUjkAqC0SZM5LfaK77d4yMmlIjgma8els4ZHZ++Efn8jJ0LZIFJ/FzHPgxm
 1yirARm+LgRUf7ZrugVybkRZ2au0vtbXDcgLtWUySGmW/nVixGHa+2zvobpig5KduKkxvq5O8i
 bU1DBw8kODjhFltLYPBJaN/eoMVuNpc051prvSOg6sPwaraiAHuFKtq7v76nMwc6nuOrUn7GgS
 zdXWfIYpgX0jMX8zfRGrmeBu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:14:53 -0700
IronPort-SDR: h5T3uCsCkJ6kvplS/1IZ7kqPA9OdrnySAtFY5qDwXhbdOuGlHDZ/eBCbg3XM67QOKpGD9i8ae6
 /tbpdeOFtGQUy1hVvFNu+OPmpc7pQ7RJlfQL84YXMx+hz1sk+xZsvgae1e+NyXseVkjE5nKJSD
 jih5zHyKCjgT79/PsIhZ7Jlt21PlP8yYXrpgo2Z9rmVjcG8OutRb2nSyfTthWXj/BwQUxaWR+Z
 ibm2MlFpTUShwHlHI9mRy7W41MV2BbBkE8v+1vDJOEsEoe6OrWXtP0gS5lxmgmXrt47lTr584t
 89I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQS63KWwz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909958; x=1637501959; bh=EV/G3/L/beuAoU7qjn
 9Sh1uqgs8o/FR+FSpTeGAQbZA=; b=eSmcvAMYjEYzMW0nYHYvQ4FGP8hppIFK/O
 EloH1MVSM/SIelx7v5p8x3GdJff7JydP8PcV95yyrzrcBGiOh2Y4bv2HCV3KoXy9
 JbjCcd8bN6ptxEYtokk7zAfPQZxvmkaLJF+1euTM6yBL9F4YgyLeWvu3MKAA1sRU
 5dEchZdoDX39OphF1oxc+UaCtXu6pS0RVhsJ5iTMbbyUmrlFhNB69XnBhW0C/40S
 E2DPsWFqDjYpjJ7SiMsEV5ddvlMEMqvg0s0AZPiH76b1RaY8uxXA+PQ7fpLkD2ha
 aKF57JTlfKXppi3MbWu7ei5mxVY716hw0JISUk8EZAsgCu/VYTAA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kwnkmqmr8nOw for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:18 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQS206llz1RtVl;
 Fri, 22 Oct 2021 06:39:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/33] target/riscv: Move cpu_get_tb_cpu_state out of line
Date: Fri, 22 Oct 2021 23:37:47 +1000
Message-Id: <20211022133812.3972903-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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

Move the function to cpu_helper.c, as it is large and growing.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-2-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 47 ++-------------------------------------
 target/riscv/cpu_helper.c | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ce42c83bda..f543364d51 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -413,51 +413,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu,=
 target_ulong vtype)
     return cpu->cfg.vlen >> (sew + 3 - lmul);
 }
=20
-static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong=
 *pc,
-                                        target_ulong *cs_base, uint32_t =
*pflags)
-{
-    uint32_t flags =3D 0;
-
-    *pc =3D env->pc;
-    *cs_base =3D 0;
-
-    if (riscv_has_ext(env, RVV)) {
-        uint32_t vlmax =3D vext_get_vlmax(env_archcpu(env), env->vtype);
-        bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl);
-        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL,
-                    FIELD_EX64(env->vtype, VTYPE, VILL));
-        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW,
-                    FIELD_EX64(env->vtype, VTYPE, VSEW));
-        flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
-                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
-        flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
-    } else {
-        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
-    }
-
-#ifdef CONFIG_USER_ONLY
-    flags |=3D TB_FLAGS_MSTATUS_FS;
-#else
-    flags |=3D cpu_mmu_index(env, 0);
-    if (riscv_cpu_fp_enabled(env)) {
-        flags |=3D env->mstatus & MSTATUS_FS;
-    }
-
-    if (riscv_has_ext(env, RVH)) {
-        if (env->priv =3D=3D PRV_M ||
-            (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            (env->priv =3D=3D PRV_U && !riscv_cpu_virt_enabled(env) &&
-                get_field(env->hstatus, HSTATUS_HU))) {
-            flags =3D FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
-        }
-
-        flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
-                           get_field(env->mstatus_hs, MSTATUS_FS));
-    }
-#endif
-
-    *pflags =3D flags;
-}
+void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *pflags);
=20
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d41d5cd27c..14d1d3cb72 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,6 +35,52 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetc=
h)
 #endif
 }
=20
+void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *pflags)
+{
+    uint32_t flags =3D 0;
+
+    *pc =3D env->pc;
+    *cs_base =3D 0;
+
+    if (riscv_has_ext(env, RVV)) {
+        uint32_t vlmax =3D vext_get_vlmax(env_archcpu(env), env->vtype);
+        bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl);
+        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL,
+                    FIELD_EX64(env->vtype, VTYPE, VILL));
+        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW,
+                    FIELD_EX64(env->vtype, VTYPE, VSEW));
+        flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
+                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
+        flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+    } else {
+        flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    flags |=3D TB_FLAGS_MSTATUS_FS;
+#else
+    flags |=3D cpu_mmu_index(env, 0);
+    if (riscv_cpu_fp_enabled(env)) {
+        flags |=3D env->mstatus & MSTATUS_FS;
+    }
+
+    if (riscv_has_ext(env, RVH)) {
+        if (env->priv =3D=3D PRV_M ||
+            (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env)) ||
+            (env->priv =3D=3D PRV_U && !riscv_cpu_virt_enabled(env) &&
+                get_field(env->hstatus, HSTATUS_HU))) {
+            flags =3D FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
+        }
+
+        flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
+                           get_field(env->mstatus_hs, MSTATUS_FS));
+    }
+#endif
+
+    *pflags =3D flags;
+}
+
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
--=20
2.31.1


