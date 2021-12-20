Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B21547A442
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:18:22 +0100 (CET)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB41-0003cs-FM
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:18:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkU-0008Sq-0V
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:12 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:21732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkR-00085t-RH
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976286; x=1671512286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BnWhjXp8B5BJfozPl9ljB+jvyM+y2gE6uOQTslYhQuw=;
 b=GVAEWjUzkkOdj7ZhQEWtO8jo+gcUCwr1URwTqLKBh3eEPxNRYMiPGCBC
 FI7BgmRH3MdvoetBaRTAE75YgNtDtxhcPY0zCYAiS+6i3SqkDjVOHc99g
 9kn6xqr88X3zH8uC7oLCG/aFqPQy8qqYbNh9d6AshbC1uKSbDkCCM04wA
 zUYWkU00N3Ywbev1wMR45GI92J5HzuXnrzF+7Q8q0cWSymrX4ts6L/eSQ
 kaq2ASY92Dh0jgFILXyXuti/YN0IF2EOCekc8fiyseydfZKdqX7Tnq6Rj
 8lgyWGBR8bz0edMZsygzz+Q1lM4MtuLjDG5FuHjszMBPcOIPaZADGuNba A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="193451984"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:05 +0800
IronPort-SDR: cSjfRsTbwtzwtu3bc4OvWtASBrpQ1DM/Lo8KLTjoYSUOSlhx5gHOQS3rqWktSfjhsTmEHCk0QW
 oyOMuMI1gCxrVONv4xwK3KNBH42WI6DcsbOCet54wng2iWZ9A5t5kFOLsT3q1dwXyVH286AUg2
 X1n9C5Vu1ynEYL+qcx8FWeg3avWnkJZD3o/2PCOa6VFj4uZwk7qhlWKEYq70KVmpUvX+pgpYy8
 TA+J5LhmMBMJnTmRNYSlMU3gxZXdNZn9wXQzVwY/mbjTKl0GWu29uvwSchLvLEkR/syd5hogJh
 rY5nzWf+asRszwWmR+bwIRZU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:30:54 -0800
IronPort-SDR: UWwppOpOr2YXgplL3w7+2oyV128bc2nqTKI3c03BboYPjCnvDhC2xLHWF4xtW8Ezdt6pnjs8K4
 4n3kAnAxFBu3UfrxyVcdwCsiNR6y0BHD4XeKTg26Qsm1WwfM7VBta+NbzaygZQmwTmijAKKlZ/
 KWnlL20CYnPZTh7lB5+SzMxJBHG9EbTDeeLtoHPkRMTKpM8TUGVwdY96Tddl6NccsHYElUfInQ
 IJM2ERkSpGNdFCY8eiKLSHAzk2HeB5A6MGc1/fqruo3ss9HrjoFGzy24z9JDR2mz6MVZQBoghy
 1Vw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:06 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5S702yz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976284; x=1642568285; bh=BnWhjXp8B5BJfozPl9
 ljB+jvyM+y2gE6uOQTslYhQuw=; b=GCyCwW9zZXgvZ1FfrdRvtesYHC+Hz7BRJn
 uPAZM2DdEHIm34CpS5xR0GKxUcCH2qZE0dHJGZJkPw07KTszji1ZabC/8xphcaeU
 bduK9VcgxqsVzN27uvpgjrVRsjIYorgwVnsJurWN6UgLMAtp9cSWyqXQnq+iMiNd
 hk4MqhvbsaaelKycf4DV4werHyQLE6JvG0oeldunYsfUGfdfVSZfbmLOKBpFCUN4
 ivdm/lM76hb/yOuTEMdKwY3X1SJtaxBnBQpppOJWODrPLjmL9I8xZbOxD0S/Y56q
 mTx9bT3fpsAzjbR0AXCQHJLjUimjpY1LBENq1F//30XTrKp+8o7g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Fg0mdqg6Jrqv for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:04 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5N1xJVz1RtVG;
 Sun, 19 Dec 2021 20:57:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/88] target/riscv: rvv-1.0: add mstatus VS field
Date: Mon, 20 Dec 2021 14:55:48 +1000
Message-Id: <20211220045705.62174-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-4-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
 target/riscv/csr.c        | 12 +++++++++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5ea2004ae0..48b8f61210 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -352,6 +352,7 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction =
f, CPUState *cs,
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
@@ -395,6 +396,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_=
ulong);
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
+#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
=20
 typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 9913fa9f77..72a716c999 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -375,6 +375,7 @@
 #define MSTATUS_UBE         0x00000040
 #define MSTATUS_MPIE        0x00000080
 #define MSTATUS_SPP         0x00000100
+#define MSTATUS_VS          0x00000600
 #define MSTATUS_MPP         0x00001800
 #define MSTATUS_FS          0x00006000
 #define MSTATUS_XS          0x00018000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9eeed38c7e..8803fe0b14 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -90,12 +90,17 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
=20
 #ifdef CONFIG_USER_ONLY
     flags |=3D TB_FLAGS_MSTATUS_FS;
+    flags |=3D TB_FLAGS_MSTATUS_VS;
 #else
     flags |=3D cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
         flags |=3D env->mstatus & MSTATUS_FS;
     }
=20
+    if (riscv_cpu_vector_enabled(env)) {
+        flags |=3D env->mstatus & MSTATUS_VS;
+    }
+
     if (riscv_has_ext(env, RVH)) {
         if (env->priv =3D=3D PRV_M ||
             (env->priv =3D=3D PRV_S && !riscv_cpu_virt_enabled(env)) ||
@@ -189,11 +194,24 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
     return false;
 }
=20
+/* Return true is vector support is currently enabled */
+bool riscv_cpu_vector_enabled(CPURISCVState *env)
+{
+    if (env->mstatus & MSTATUS_VS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_V=
S)) {
+            return false;
+        }
+        return true;
+    }
+
+    return false;
+}
+
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
     uint64_t mstatus_mask =3D MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL;
+                            MSTATUS64_UXL | MSTATUS_VS;
     bool current_virt =3D riscv_cpu_virt_enabled(env);
=20
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f41954894..9b5bd5d7b4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -273,6 +273,7 @@ static RISCVException write_fcsr(CPURISCVState *env, =
int csrno,
 {
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |=3D MSTATUS_FS;
+    env->mstatus |=3D MSTATUS_VS;
 #endif
     env->frm =3D (val & FSR_RD) >> FSR_RD_SHIFT;
     if (vs(env, csrno) >=3D 0) {
@@ -307,6 +308,9 @@ static RISCVException read_vxrm(CPURISCVState *env, i=
nt csrno,
 static RISCVException write_vxrm(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |=3D MSTATUS_VS;
+#endif
     env->vxrm =3D val;
     return RISCV_EXCP_NONE;
 }
@@ -321,6 +325,9 @@ static RISCVException read_vxsat(CPURISCVState *env, =
int csrno,
 static RISCVException write_vxsat(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |=3D MSTATUS_VS;
+#endif
     env->vxsat =3D val;
     return RISCV_EXCP_NONE;
 }
@@ -335,6 +342,9 @@ static RISCVException read_vstart(CPURISCVState *env,=
 int csrno,
 static RISCVException write_vstart(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |=3D MSTATUS_VS;
+#endif
     env->vstart =3D val;
     return RISCV_EXCP_NONE;
 }
@@ -535,7 +545,7 @@ static RISCVException write_mstatus(CPURISCVState *en=
v, int csrno,
     mask =3D MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-        MSTATUS_TW;
+        MSTATUS_TW | MSTATUS_VS;
=20
     if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
         /*
--=20
2.31.1


