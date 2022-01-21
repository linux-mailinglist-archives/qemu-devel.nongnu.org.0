Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555B495BFE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:34:38 +0100 (CET)
Received: from localhost ([::1]:53584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApNV-0003M9-7S
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:34:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0k-0008Vj-FQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:58 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0i-0004KU-9X
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744976; x=1674280976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sPb+HetLwrLjaLC9HyGtURERyDVL+93C/QX0fIBuGpw=;
 b=Bsj20WcUhXD9/OXXJ7WxUbfMN2DoLYtw9fKB3zaiR4/GduCaQJDPpWBz
 sLEVFtRoF4xQD4CRglOboyb1nLXbEKqPdcY1kzCVKsExkRae78O6uYJnU
 /oqk4A2wKHNJi023fCfOTpMFxCGK84qZRrYKG0CxtRHpTRBiuri16JIjz
 gRSs19trI+3oz0G6lSAnvF9V09IFqX+doTDw0RcqShxei95/GTSlyAMMi
 775G4Fn3XF0AwkLT9a7350A+a0nOwC4oCf/e0KjzrCh9W8qnrbBCsKi8X
 EkfGzZ1VF6hD9Au9abkQ2sU3Z9rkeD5HKU/5ylWSu+v4cpzRXyG/Ymc+V g==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083063"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:41 +0800
IronPort-SDR: yD20GH3M28gCJFFNH2p+BtEJDFlpvW7dN2H0Y4aQJd7QndH+QyLwf6ZH1sCRoT9lDeTVJWJUap
 mv8iISLbC5He34E+vsAMAoE4qU1ube/wBP8/HMaxyMb6tWYG69Ta6Mty0ABTO6xiUgqyeD8LhO
 Qh8DYrwSXacGUkunXvXlSd1uSeYId1IBTW+MZncAp+JSL5wapAp+geFA/GH01VV5laX/jj1kLH
 TFPLzMF71qaxiarcvEJEUtSZClwxt5Mx1Zo2wffzXnZs1Ev4Ejgh4s6zsUPpFwrjWt4cJQXfYH
 ceHefGkmXmGukdgynNSn87/U
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:35:08 -0800
IronPort-SDR: hQBkLilTXlB3aumEDe5s0AbCdu6bXtvlLci1jMppvehZ24DafRKwXuLMiucNAvx7fl3tt3pNxj
 Y2Z20RaUtSWBjKkNWZSEciYOc+awGGO/TuIjKZr2vpi0Z8LqPU3ys3cy9mRLtjrHLgEuodH0mY
 jpUFzagAnLsrd2LJ1GS9Q2KJjTYXSqojQpb90ooHlG21xkE9/gL8dz/oxiKt2v2sl6RbTIaSqu
 xjzoaGzuTXDewMDTAMfV5PViUcZpt7GF83YVYwuSJXNUtaA7WDiJXMErFEKLW2y+clbr7NpyjG
 Kh0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg8046BJTz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744900; x=1645336901; bh=sPb+HetLwrLjaLC9Hy
 GtURERyDVL+93C/QX0fIBuGpw=; b=koptQnfXKTFZUG0r8TUGawIvdajDQ3YZCH
 CIGNGZ+Cm30mu3fdPhdWt8FvxmJ9t5jhtZfJy8thUsb2dcOavSl4/PE7FhdrtLjY
 O2KJTENfNGve1eqKbBCixwhEkonyxhW3+8Ja2blm68ETE+U9mGn6Tojyo7cRUxaO
 N8Hcd8yy/fkzwbcLocPjR4vCT4hK6MLhKiaZl2SVtcMYhiaNKgg6Uykbdhe3tnuJ
 ZboOuFl7GovGvmuXa171bLuqfo9pouo3yhMoyCdZEmoYYELH4aOrSzFfFXRWAJVs
 fYHpFXZNL1N6EcRdlxXW7BkHBcXdRpgZvxteLF5rEW0E0q4KfTRA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FLmqosDI-v9H for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:40 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg8015J05z1RvlN;
 Thu, 20 Jan 2022 22:01:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 43/61] target/riscv: Create xl field in env
Date: Fri, 21 Jan 2022 15:58:12 +1000
Message-Id: <20220121055830.3164408-44-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Current xlen has been used in helper functions and many other places.
The computation of current xlen is not so trivial, so that we should
recompute it as little as possible.

Fortunately, xlen only changes in very seldom cases, such as exception,
misa write, mstatus write, cpu reset, migration load. So that we can only
recompute xlen in this places and cache it into CPURISCVState.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-6-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 31 +++++++++++++++++++++++++++++++
 target/riscv/cpu.c        |  1 +
 target/riscv/cpu_helper.c | 34 ++--------------------------------
 target/riscv/csr.c        |  2 ++
 target/riscv/machine.c    | 10 ++++++++++
 5 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 03552f4aaa..7657e22a56 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -146,6 +146,7 @@ struct CPURISCVState {
     uint32_t misa_mxl_max;  /* max mxl for this cpu */
     uint32_t misa_ext;      /* current extensions */
     uint32_t misa_ext_mask; /* max ext for this cpu */
+    uint32_t xl;            /* current xlen */
=20
     /* 128-bit helpers upper part return value */
     target_ulong retxh;
@@ -456,6 +457,36 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *=
env)
 }
 #endif
=20
+#if defined(TARGET_RISCV32)
+#define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
+#else
+static inline RISCVMXL cpu_recompute_xl(CPURISCVState *env)
+{
+    RISCVMXL xl =3D env->misa_mxl;
+#if !defined(CONFIG_USER_ONLY)
+    /*
+     * When emulating a 32-bit-only cpu, use RV32.
+     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
+     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
+     * back to RV64 for lower privs.
+     */
+    if (xl !=3D MXL_RV32) {
+        switch (env->priv) {
+        case PRV_M:
+            break;
+        case PRV_U:
+            xl =3D get_field(env->mstatus, MSTATUS64_UXL);
+            break;
+        default: /* PRV_S | PRV_H */
+            xl =3D get_field(env->mstatus, MSTATUS64_SXL);
+            break;
+        }
+    }
+#endif
+    return xl;
+}
+#endif
+
 /*
  * Encode LMUL to lmul as follows:
  *     LMUL    vlmul    lmul
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c2b570e904..736cf1d4e7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -413,6 +413,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
+    env->xl =3D riscv_cpu_mxl(env);
     cs->exception_index =3D RISCV_EXCP_NONE;
     env->load_res =3D -1;
     set_default_nan_mode(1, &env->fp_status);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index afee770951..8ebcd57af0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,37 +35,6 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetc=
h)
 #endif
 }
=20
-static RISCVMXL cpu_get_xl(CPURISCVState *env)
-{
-#if defined(TARGET_RISCV32)
-    return MXL_RV32;
-#elif defined(CONFIG_USER_ONLY)
-    return MXL_RV64;
-#else
-    RISCVMXL xl =3D riscv_cpu_mxl(env);
-
-    /*
-     * When emulating a 32-bit-only cpu, use RV32.
-     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
-     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
-     * back to RV64 for lower privs.
-     */
-    if (xl !=3D MXL_RV32) {
-        switch (env->priv) {
-        case PRV_M:
-            break;
-        case PRV_U:
-            xl =3D get_field(env->mstatus, MSTATUS64_UXL);
-            break;
-        default: /* PRV_S | PRV_H */
-            xl =3D get_field(env->mstatus, MSTATUS64_SXL);
-            break;
-        }
-    }
-    return xl;
-#endif
-}
-
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -148,7 +117,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
     }
 #endif
=20
-    flags =3D FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+    flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
=20
     *pflags =3D flags;
 }
@@ -364,6 +333,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ul=
ong newpriv)
     }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv =3D newpriv;
+    env->xl =3D cpu_recompute_xl(env);
=20
     /*
      * Clear the load reservation - otherwise a reservation placed in on=
e
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6bc7ee780c..9be2820d2b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -589,6 +589,7 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
         mstatus =3D set_field(mstatus, MSTATUS64_UXL, xl);
     }
     env->mstatus =3D mstatus;
+    env->xl =3D cpu_recompute_xl(env);
=20
     return RISCV_EXCP_NONE;
 }
@@ -704,6 +705,7 @@ static RISCVException write_misa(CPURISCVState *env, =
int csrno,
     /* flush translation cache */
     tb_flush(env_cpu(env));
     env->misa_ext =3D val;
+    env->xl =3D riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
=20
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 098670e680..b76e4db99c 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -214,10 +214,20 @@ static const VMStateDescription vmstate_kvmtimer =3D=
 {
     }
 };
=20
+static int riscv_cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    env->xl =3D cpu_recompute_xl(env);
+    return 0;
+}
+
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
     .version_id =3D 3,
     .minimum_version_id =3D 3,
+    .post_load =3D riscv_cpu_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
--=20
2.31.1


