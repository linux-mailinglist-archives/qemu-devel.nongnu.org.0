Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9E43783D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:43:26 +0200 (CEST)
Received: from localhost ([::1]:55942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdupR-0007pd-HI
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdult-0000bT-96
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:45 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulq-0001BC-9f
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909981; x=1666445981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HPH4y0KADeR+UCUJfkmTvGU2wlH4unltnWuH24SuZPw=;
 b=THqtcj3Og3y3G+XhdnVVEDcBHffNLdgzsce6VEcvXVVFVvx+gwjoA+aB
 CMIILd6SzKa6teq+0JKCr/YZvE7iHOqjJ94ByyeHB3tk+llvWVKvtUteT
 WytZSvMHBG0PiQetfTDpawO3wR7Ma7lxv/J94gtE8S8UeKT5HoYVqACIx
 +1zynY52YP50m7wwx/mgl7cmJ9cFR0HMWLGmgmgjoRghz9jVWo0g7e/r6
 CddviP4MoEJf7M36Dl6YWHh7EwToeJQJoJjXjKXhPixUzJHXNpL7dSvIE
 hXTTLNDF2rthFShfc7OXsYOoQlZLDyQc/BXD25t5hxjti99QNjufN/p8E w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="183617847"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:39 +0800
IronPort-SDR: Aoqd10DiDdzVJF/ARYEFqRirOwNj6iRbmfIYCVG/D+ulbaKsIbQNAPZvOav28WlPUd7+9p2/Ca
 kpgDsjSvms/+i3ACZvVDBaIxrOLqKakZS6vTUZVA/mUpvvVBunVBrcVJw7uOOqBSp1tVQ1ZXtA
 IQ6cNY0JEnNCmfWYRdpW4IfVRveRClmz7dZgQCsM23HUyg9FNbh3tRDgwroa3YN6CGosrqSi5o
 rplpCHCvPjMGeIBx3CONxAmfZNY2YzlqvwrWkhR5bzAdYfbn25vMLenAe++i0Ho2fzZsnAA4ZW
 yuy2PRmpbe7EQF46EjmL6R+X
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:15 -0700
IronPort-SDR: 2O/DpZX0cdp/59uiyTyYAwr1xhpVzNCpd7OqJIfg/Fz0sggoxIXvEFVeSvDcQn+yPZOdGgfvh/
 S+NJNMruINtEWtEbg1l6olnxn5yaJ/N8GtSON5ItKF+7FNlxVXBk8viN79EXBHXXhaJHkfb/tS
 CdwrT39rm4cldmwLJCxoUIjyZevBxLDR503uomrGSVQEHpcslANs1dw6qgzdRtPweICkKbdD4/
 1Z4RdT4j7/sfef0e/eFUW/j6ssjqEUMyfNLtOfc784xXxYa2IIe/glf4x9jNvwaJ63/XuR1pIJ
 Yv8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSX1Bhkz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909979; x=1637501980; bh=HPH4y0KADeR+UCUJfk
 mTvGU2wlH4unltnWuH24SuZPw=; b=uQCzIyWJXU3lRIKiL0HUJar+FQG+UAdYG9
 EjOhkbm/kBUWx5AqfDsW4aZf23+lH09goMrx6dPuU35YvlcDJSl89puKZif9q/gC
 GVOHkFm/aI4176Run/4L9cxwZ2xhGH6VS9Jzm4It2v+rb0T4tVPF4L4QtesT68MU
 FEI31ievqtubuS9p7nE1sqmrq1dF2x5zRGeAwQGrqFZQNUmpUs3yXKbudPfy3cOR
 3hqlV571Zvo317w+BE6Pw3OllbWe0Nc0sDTc06EzWy5pKH/ZE8bNuaYe5MpY62w1
 8X0nwQbdqOfA+0Achd2DwUTFCo46pvz8uDWYunpdw9uYzYyOBZow==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3-Wenk9Q1952 for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:39 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSR59jpz1RtVl;
 Fri, 22 Oct 2021 06:39:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/33] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
Date: Fri, 22 Oct 2021 23:37:51 +1000
Message-Id: <20211022133812.3972903-13-alistair.francis@opensource.wdc.com>
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

Begin adding support for switching XLEN at runtime.  Extract the
effective XLEN from MISA and MSTATUS and store for use during translation=
.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-6-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu.c        |  8 ++++++++
 target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
 target/riscv/csr.c        |  3 +++
 target/riscv/translate.c  |  2 +-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e23157b05c..a33dc30be8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
 FIELD(TB_FLAGS, HLSX, 10, 1)
 FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
+/* The combination of MXL/SXL/UXL that applies to the current cpu mode. =
*/
+FIELD(TB_FLAGS, XL, 13, 2)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d144af1ab..dd9eccd68e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -355,6 +355,14 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->misa_mxl =3D env->misa_mxl_max;
     env->priv =3D PRV_M;
     env->mstatus &=3D ~(MSTATUS_MIE | MSTATUS_MPRV);
+    if (env->misa_mxl > MXL_RV32) {
+        /*
+         * The reset status of SXL/UXL is undefined, but mstatus is WARL
+         * and we must ensure that the value after init is valid for rea=
d.
+         */
+        env->mstatus =3D set_field(env->mstatus, MSTATUS64_SXL, env->mis=
a_mxl);
+        env->mstatus =3D set_field(env->mstatus, MSTATUS64_UXL, env->mis=
a_mxl);
+    }
     env->mcause =3D 0;
     env->pc =3D env->resetvec;
     env->two_stage_lookup =3D false;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 403f54171d..429afd1f48 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,6 +35,37 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetc=
h)
 #endif
 }
=20
+static RISCVMXL cpu_get_xl(CPURISCVState *env)
+{
+#if defined(TARGET_RISCV32)
+    return MXL_RV32;
+#elif defined(CONFIG_USER_ONLY)
+    return MXL_RV64;
+#else
+    RISCVMXL xl =3D riscv_cpu_mxl(env);
+
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
+    return xl;
+#endif
+}
+
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -78,6 +109,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_u=
long *pc,
     }
 #endif
=20
+    flags =3D FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
+
     *pflags =3D flags;
 }
=20
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9c0753bc8b..c4a479ddd2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
         mstatus =3D set_field(mstatus, MSTATUS32_SD, dirty);
     } else {
         mstatus =3D set_field(mstatus, MSTATUS64_SD, dirty);
+        /* SXL and UXL fields are for now read only */
+        mstatus =3D set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
+        mstatus =3D set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
     }
     env->mstatus =3D mstatus;
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0aa2122529..77cad9bc45 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -514,7 +514,6 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
 #else
     ctx->virt_enabled =3D false;
 #endif
-    ctx->xl =3D env->misa_mxl;
     ctx->misa_ext =3D env->misa_ext;
     ctx->frm =3D -1;  /* unknown rounding mode */
     ctx->ext_ifencei =3D cpu->cfg.ext_ifencei;
@@ -526,6 +525,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     ctx->lmul =3D FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen =3D 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax =3D FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs =3D cs;
     ctx->w =3D false;
     ctx->ntemp =3D 0;
--=20
2.31.1


