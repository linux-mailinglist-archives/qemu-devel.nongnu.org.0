Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58584B3204
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:32:27 +0100 (CET)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgKw-0007OJ-40
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:32:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsD-00080G-H2
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:46 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfs9-0000MP-KE
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624160; x=1676160160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ILRsvaVKfvY1nUzfLjMDeXgsaNnM92qUB0iNCpDeCuE=;
 b=XGVQGmAfBGQXqwK7LkGMr5LeyACc5ZPaDlL6l+nU2M4d2BbJJmKx3iLz
 L2TSIhyGI1wGJVi14ftLPhKfn+nSqr2bBS8GwHPZsX0FY/eNRRqngaGFZ
 6WUv+QzWyyqOSZqxg10Vj8JeZatRELP/s/3pK6VEhHS6ZQUXRC6Drznuw
 7gQMnbzet9Ux5Bm+j7p1NoeF2ty5IdU5rb8EgUk+kgQfPw9rwLYZZ1+Xd
 bkIHBkbrXiVRWi+yR3Gr0aYlyEaNjnQsWTP8shaWhhz22u+yLDfooVjdx
 pJq94E5pWXB0m7Si0rU7jD/7Yc9fFzmUBz8wl6TAlTZn2G9JWE2AFxCn8 Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="197552466"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:38 +0800
IronPort-SDR: tooDZbTW2vBVUsuV9hD1hdmJEIpcWKH8wSxMkAtCa8nVjOcXhtPjwkZ7K+s78FcKNgLOyKlq3s
 NssZC1SZDEyz850hlJszXmsAHtFXgiq7sHmJAAOeUFXOfhZRyjaKQemqBcFpPFDJoEyrvpdiAy
 l+hlUGiuZOSyKkd75a5TwhAEULa8L48XzGS1uB4QmAG+rzBKYYkUN/M9qL2SINnz2PoI9ZNppK
 kInm34Xa++5fKGsLfpd2R+P6rVRKC7qweUnpV/nwiUzaLr3SY9KCmkzAQ3PkNz7wmacyECHq7g
 fcDnS2TLgAa1jiXvgs+IOI0I
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:34 -0800
IronPort-SDR: 7ORB/V3e0oHgVRUomp/7wBGJXH4ET5qrDyqUaBvO8fScsXjZNYPDgs6R9Tnb9bsH5VKOl96+ow
 vwn3OA8XsG2VAVDS1hl048iFItXwiFAmwt7nEMNAnAIUPtyqIGbLIDDKzdEcxLJbvOGptElLyV
 2Y3MdI+0ZdNMD8CY+B1rH8FMO8nlInym3PerviJbd5mw3wXnUlqf77xb8M6sRuINwE5ntTNQR7
 sltbG8BjfDQoaWGP/YHAP/zCCRp12brTFDsNl2WXHlBaiHW8J0APKyqe5HOB1BaSzqfo8eCzi+
 CtU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzg54vCz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624157; x=1647216158; bh=ILRsvaVKfvY1nUzfLj
 MDeXgsaNnM92qUB0iNCpDeCuE=; b=q9n3GaBQoiI85U2JD/b34YFGuedIO7Ah3t
 v6i8uCXinFitzwyrzrnVGRWPXticEXipNpypmPLrUKmdPVqBX3wg0AEGEeFny948
 kG/cfx8FrBh3RzjORpHfvkr+2gz3TJK0nkXqkFKj1E7vWz/hmtQK2bY3FAM+kDA6
 uvi+rc0+525SeMEew1NCiyyD1BHyK3rDlmNeHEuX52tl8ki6MqG9ZEr/vuGD0XBG
 qKkSz4CJY7Gt/GbL84bZhGVerLyoH+XENKDQcie/Flgs+HcVJ2fYyqVceuNqfmhm
 RwmMCP57QvIxdG7MOiiKtNCs+BhTzvUO28Sx4y78HvtSSn957EtQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id xxdsFVjs_LSI for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:37 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzY38LYz1SHwl;
 Fri, 11 Feb 2022 16:02:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 21/40] target/riscv: Implement AIA CSRs for 64 local interrupts
 on RV32
Date: Sat, 12 Feb 2022 10:00:12 +1000
Message-Id: <20220212000031.3946524-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Anup Patel <anup.patel@wdc.com>

The AIA specification adds new CSRs for RV32 so that RISC-V hart can
support 64 local interrupts on both RV32 and RV64.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-11-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  14 +-
 target/riscv/cpu_helper.c |  10 +-
 target/riscv/csr.c        | 560 +++++++++++++++++++++++++++++++-------
 target/riscv/machine.c    |  10 +-
 4 files changed, 474 insertions(+), 120 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 89e9cc558d..2dc2485bb4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -172,12 +172,12 @@ struct CPURISCVState {
      */
     uint64_t mstatus;
=20
-    target_ulong mip;
+    uint64_t mip;
=20
-    uint32_t miclaim;
+    uint64_t miclaim;
=20
-    target_ulong mie;
-    target_ulong mideleg;
+    uint64_t mie;
+    uint64_t mideleg;
=20
     target_ulong satp;   /* since: priv-1.10.0 */
     target_ulong stval;
@@ -199,7 +199,7 @@ struct CPURISCVState {
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
-    target_ulong hideleg;
+    uint64_t hideleg;
     target_ulong hcounteren;
     target_ulong htval;
     target_ulong htinst;
@@ -456,8 +456,8 @@ void riscv_cpu_list(void);
 #ifndef CONFIG_USER_ONLY
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t val=
ue);
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t val=
ue);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t=
),
                              uint32_t arg);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1a9534d6d7..430060dcd8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -585,7 +585,7 @@ bool riscv_cpu_two_stage_lookup(int mmu_idx)
     return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 }
=20
-int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
+int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env =3D &cpu->env;
     if (env->miclaim & interrupts) {
@@ -596,11 +596,11 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint3=
2_t interrupts)
     }
 }
=20
-uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t val=
ue)
+uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t val=
ue)
 {
     CPURISCVState *env =3D &cpu->env;
     CPUState *cs =3D CPU(cpu);
-    uint32_t gein, vsgein =3D 0, old =3D env->mip;
+    uint64_t gein, vsgein =3D 0, old =3D env->mip;
     bool locked =3D false;
=20
     if (riscv_cpu_virt_enabled(env)) {
@@ -1306,7 +1306,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
     bool async =3D !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause =3D cs->exception_index & RISCV_EXCP_INT_MASK;
-    target_ulong deleg =3D async ? env->mideleg : env->medeleg;
+    uint64_t deleg =3D async ? env->mideleg : env->medeleg;
     target_ulong tval =3D 0;
     target_ulong htval =3D 0;
     target_ulong mtval2 =3D 0;
@@ -1373,7 +1373,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
-            target_ulong hdeleg =3D async ? env->hideleg : env->hedeleg;
+            uint64_t hdeleg =3D async ? env->hideleg : env->hedeleg;
=20
             if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1)) =
{
                 /* Trap to VS mode */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b23195b479..d8283160b1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -158,6 +158,15 @@ static RISCVException any32(CPURISCVState *env, int =
csrno)
=20
 }
=20
+static int aia_any32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any32(env, csrno);
+}
+
 static RISCVException smode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS)) {
@@ -167,6 +176,24 @@ static RISCVException smode(CPURISCVState *env, int =
csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
=20
+static int smode32(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
+static int aia_smode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode32(env, csrno);
+}
+
 static RISCVException hmode(CPURISCVState *env, int csrno)
 {
     if (riscv_has_ext(env, RVS) &&
@@ -207,6 +234,15 @@ static RISCVException pointer_masking(CPURISCVState =
*env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
=20
+static int aia_hmode32(CPURISCVState *env, int csrno)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return hmode32(env, csrno);
+}
+
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_feature(env, RISCV_FEATURE_PMP)) {
@@ -458,15 +494,15 @@ static RISCVException read_timeh(CPURISCVState *env=
, int csrno,
=20
 /* Machine constants */
=20
-#define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
-#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
-#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
-#define HS_MODE_INTERRUPTS (MIP_SGEIP | VS_MODE_INTERRUPTS)
+#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
+#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
+#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
+#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
=20
-static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |
+static const uint64_t delegable_ints =3D S_MODE_INTERRUPTS |
                                            VS_MODE_INTERRUPTS;
-static const target_ulong vs_delegable_ints =3D VS_MODE_INTERRUPTS;
-static const target_ulong all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERR=
UPTS |
+static const uint64_t vs_delegable_ints =3D VS_MODE_INTERRUPTS;
+static const uint64_t all_ints =3D M_MODE_INTERRUPTS | S_MODE_INTERRUPTS=
 |
                                      HS_MODE_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
@@ -737,40 +773,107 @@ static RISCVException write_medeleg(CPURISCVState =
*env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException read_mideleg(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
+static RISCVException rmw_mideleg64(CPURISCVState *env, int csrno,
+                                    uint64_t *ret_val,
+                                    uint64_t new_val, uint64_t wr_mask)
 {
-    *val =3D env->mideleg;
-    return RISCV_EXCP_NONE;
-}
+    uint64_t mask =3D wr_mask & delegable_ints;
+
+    if (ret_val) {
+        *ret_val =3D env->mideleg;
+    }
+
+    env->mideleg =3D (env->mideleg & ~mask) | (new_val & mask);
=20
-static RISCVException write_mideleg(CPURISCVState *env, int csrno,
-                                    target_ulong val)
-{
-    env->mideleg =3D (env->mideleg & ~delegable_ints) | (val & delegable=
_ints);
     if (riscv_has_ext(env, RVH)) {
         env->mideleg |=3D HS_MODE_INTERRUPTS;
     }
+
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException read_mie(CPURISCVState *env, int csrno,
-                               target_ulong *val)
+static RISCVException rmw_mideleg(CPURISCVState *env, int csrno,
+                                  target_ulong *ret_val,
+                                  target_ulong new_val, target_ulong wr_=
mask)
 {
-    *val =3D env->mie;
-    return RISCV_EXCP_NONE;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_mideleg64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
+    }
+
+    return ret;
 }
=20
-static RISCVException write_mie(CPURISCVState *env, int csrno,
-                                target_ulong val)
+static RISCVException rmw_midelegh(CPURISCVState *env, int csrno,
+                                   target_ulong *ret_val,
+                                   target_ulong new_val,
+                                   target_ulong wr_mask)
 {
-    env->mie =3D (env->mie & ~all_ints) | (val & all_ints);
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_mideleg64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_mie64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
+{
+    uint64_t mask =3D wr_mask & all_ints;
+
+    if (ret_val) {
+        *ret_val =3D env->mie;
+    }
+
+    env->mie =3D (env->mie & ~mask) | (new_val & mask);
+
     if (!riscv_has_ext(env, RVH)) {
-        env->mie &=3D ~MIP_SGEIP;
+        env->mie &=3D ~((uint64_t)MIP_SGEIP);
     }
+
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException rmw_mie(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask=
)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mas=
k)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_mie64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
+    return ret;
+}
+
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -876,17 +979,17 @@ static RISCVException write_mtval(CPURISCVState *en=
v, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException rmw_mip(CPURISCVState *env, int csrno,
-                              target_ulong *ret_value,
-                              target_ulong new_value, target_ulong write=
_mask)
+static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
 {
     RISCVCPU *cpu =3D env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by har=
dware */
-    target_ulong mask =3D write_mask & delegable_ints & ~env->miclaim;
-    uint32_t gin, old_mip;
+    uint64_t old_mip, mask =3D wr_mask & delegable_ints & ~env->miclaim;
+    uint32_t gin;
=20
     if (mask) {
-        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_value & mask));
+        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
         old_mip =3D env->mip;
     }
@@ -896,13 +999,44 @@ static RISCVException rmw_mip(CPURISCVState *env, i=
nt csrno,
         old_mip |=3D (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP=
 : 0;
     }
=20
-    if (ret_value) {
-        *ret_value =3D old_mip;
+    if (ret_val) {
+        *ret_val =3D old_mip;
     }
=20
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException rmw_mip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask=
)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_mip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_miph(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mas=
k)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_mip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
+    return ret;
+}
+
 /* Supervisor Trap Setup */
 static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
                                         Int128 *val)
@@ -943,45 +1077,112 @@ static RISCVException write_sstatus(CPURISCVState=
 *env, int csrno,
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
=20
-static RISCVException read_vsie(CPURISCVState *env, int csrno,
-                                target_ulong *val)
+static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
+                                 uint64_t *ret_val,
+                                 uint64_t new_val, uint64_t wr_mask)
 {
-    /* Shift the VS bits to their S bit location in vsie */
-    *val =3D (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
-    return RISCV_EXCP_NONE;
+    RISCVException ret;
+    uint64_t rval, vsbits, mask =3D env->hideleg & VS_MODE_INTERRUPTS;
+
+    /* Bring VS-level bits to correct position */
+    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
+    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
+    new_val |=3D vsbits << 1;
+    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
+    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
+    wr_mask |=3D vsbits << 1;
+
+    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
+    if (ret_val) {
+        rval &=3D mask;
+        vsbits =3D rval & VS_MODE_INTERRUPTS;
+        rval &=3D ~VS_MODE_INTERRUPTS;
+        *ret_val =3D rval | (vsbits >> 1);
+    }
+
+    return ret;
 }
=20
-static RISCVException read_sie(CPURISCVState *env, int csrno,
-                               target_ulong *val)
+static RISCVException rmw_vsie(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mas=
k)
 {
-    if (riscv_cpu_virt_enabled(env)) {
-        read_vsie(env, CSR_VSIE, val);
-    } else {
-        *val =3D env->mie & env->mideleg;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_vsie64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
     }
-    return RISCV_EXCP_NONE;
+
+    return ret;
 }
=20
-static RISCVException write_vsie(CPURISCVState *env, int csrno,
-                                 target_ulong val)
+static RISCVException rmw_vsieh(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_ma=
sk)
 {
-    /* Shift the S bits to their VS bit location in mie */
-    target_ulong newval =3D (env->mie & ~VS_MODE_INTERRUPTS) |
-                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPT=
S);
-    return write_mie(env, CSR_MIE, newval);
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_vsie64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
+    return ret;
 }
=20
-static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
+static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
 {
+    RISCVException ret;
+    uint64_t mask =3D env->mideleg & S_MODE_INTERRUPTS;
+
     if (riscv_cpu_virt_enabled(env)) {
-        write_vsie(env, CSR_VSIE, val);
+        ret =3D rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
     } else {
-        target_ulong newval =3D (env->mie & ~S_MODE_INTERRUPTS) |
-                              (val & S_MODE_INTERRUPTS);
-        write_mie(env, CSR_MIE, newval);
+        ret =3D rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
     }
=20
-    return RISCV_EXCP_NONE;
+    if (ret_val) {
+        *ret_val &=3D mask;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sie(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask=
)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_sie64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sieh(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mas=
k)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_sie64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
+    return ret;
 }
=20
 static RISCVException read_stvec(CPURISCVState *env, int csrno,
@@ -1089,38 +1290,111 @@ static RISCVException write_stval(CPURISCVState =
*env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
+                                 uint64_t *ret_val,
+                                 uint64_t new_val, uint64_t wr_mask)
+{
+    RISCVException ret;
+    uint64_t rval, vsbits, mask =3D env->hideleg & vsip_writable_mask;
+
+    /* Bring VS-level bits to correct position */
+    vsbits =3D new_val & (VS_MODE_INTERRUPTS >> 1);
+    new_val &=3D ~(VS_MODE_INTERRUPTS >> 1);
+    new_val |=3D vsbits << 1;
+    vsbits =3D wr_mask & (VS_MODE_INTERRUPTS >> 1);
+    wr_mask &=3D ~(VS_MODE_INTERRUPTS >> 1);
+    wr_mask |=3D vsbits << 1;
+
+    ret =3D rmw_mip64(env, csrno, &rval, new_val, wr_mask & mask);
+    if (ret_val) {
+        rval &=3D mask;
+        vsbits =3D rval & VS_MODE_INTERRUPTS;
+        rval &=3D ~VS_MODE_INTERRUPTS;
+        *ret_val =3D rval | (vsbits >> 1);
+    }
+
+    return ret;
+}
+
 static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
-                               target_ulong *ret_value,
-                               target_ulong new_value, target_ulong writ=
e_mask)
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mas=
k)
 {
-    /* Shift the S bits to their VS bit location in mip */
-    int ret =3D rmw_mip(env, csrno, ret_value, new_value << 1,
-                      (write_mask << 1) & vsip_writable_mask & env->hide=
leg);
+    uint64_t rval;
+    RISCVException ret;
=20
-    if (ret_value) {
-        *ret_value &=3D VS_MODE_INTERRUPTS;
-        /* Shift the VS bits to their S bit location in vsip */
-        *ret_value >>=3D 1;
+    ret =3D rmw_vsip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
     }
+
     return ret;
 }
=20
-static RISCVException rmw_sip(CPURISCVState *env, int csrno,
-                              target_ulong *ret_value,
-                              target_ulong new_value, target_ulong write=
_mask)
+static RISCVException rmw_vsiph(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_ma=
sk)
 {
-    int ret;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_vsip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
+{
+    RISCVException ret;
+    uint64_t mask =3D env->mideleg & sip_writable_mask;
=20
     if (riscv_cpu_virt_enabled(env)) {
-        ret =3D rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask=
);
+        ret =3D rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
     } else {
-        ret =3D rmw_mip(env, csrno, ret_value, new_value,
-                      write_mask & env->mideleg & sip_writable_mask);
+        ret =3D rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
     }
=20
-    if (ret_value) {
-        *ret_value &=3D env->mideleg & S_MODE_INTERRUPTS;
+    if (ret_val) {
+        *ret_val &=3D env->mideleg & S_MODE_INTERRUPTS;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_sip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask=
)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_sip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
     }
+
+    return ret;
+}
+
+static RISCVException rmw_siph(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mas=
k)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_sip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
     return ret;
 }
=20
@@ -1215,30 +1489,94 @@ static RISCVException write_hedeleg(CPURISCVState=
 *env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException read_hideleg(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
+static RISCVException rmw_hideleg64(CPURISCVState *env, int csrno,
+                                    uint64_t *ret_val,
+                                    uint64_t new_val, uint64_t wr_mask)
 {
-    *val =3D env->hideleg;
+    uint64_t mask =3D wr_mask & vs_delegable_ints;
+
+    if (ret_val) {
+        *ret_val =3D env->hideleg & vs_delegable_ints;
+    }
+
+    env->hideleg =3D (env->hideleg & ~mask) | (new_val & mask);
     return RISCV_EXCP_NONE;
 }
=20
-static RISCVException write_hideleg(CPURISCVState *env, int csrno,
-                                    target_ulong val)
+static RISCVException rmw_hideleg(CPURISCVState *env, int csrno,
+                                  target_ulong *ret_val,
+                                  target_ulong new_val, target_ulong wr_=
mask)
 {
-    env->hideleg =3D val & vs_delegable_ints;
-    return RISCV_EXCP_NONE;
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_hideleg64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_hidelegh(CPURISCVState *env, int csrno,
+                                   target_ulong *ret_val,
+                                   target_ulong new_val, target_ulong wr=
_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_hideleg64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
+                                 uint64_t *ret_val,
+                                 uint64_t new_val, uint64_t wr_mask)
+{
+    RISCVException ret;
+
+    ret =3D rmw_mip64(env, csrno, ret_val, new_val,
+                    wr_mask & hvip_writable_mask);
+    if (ret_val) {
+        *ret_val &=3D VS_MODE_INTERRUPTS;
+    }
+
+    return ret;
 }
=20
 static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
-                               target_ulong *ret_value,
-                               target_ulong new_value, target_ulong writ=
e_mask)
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mas=
k)
 {
-    int ret =3D rmw_mip(env, csrno, ret_value, new_value,
-                      write_mask & hvip_writable_mask);
+    uint64_t rval;
+    RISCVException ret;
=20
-    if (ret_value) {
-        *ret_value &=3D VS_MODE_INTERRUPTS;
+    ret =3D rmw_hvip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val =3D rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_hviph(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_ma=
sk)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret =3D rmw_hvip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val =3D rval >> 32;
     }
+
     return ret;
 }
=20
@@ -1255,18 +1593,19 @@ static RISCVException rmw_hip(CPURISCVState *env,=
 int csrno,
     return ret;
 }
=20
-static RISCVException read_hie(CPURISCVState *env, int csrno,
-                               target_ulong *val)
+static RISCVException rmw_hie(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask=
)
 {
-    *val =3D env->mie & HS_MODE_INTERRUPTS;
-    return RISCV_EXCP_NONE;
-}
+    uint64_t rval;
+    RISCVException ret;
=20
-static RISCVException write_hie(CPURISCVState *env, int csrno,
-                                target_ulong val)
-{
-    target_ulong newval =3D (env->mie & ~HS_MODE_INTERRUPTS) | (val & HS=
_MODE_INTERRUPTS);
-    return write_mie(env, CSR_MIE, newval);
+    ret =3D rmw_mie64(env, csrno, &rval, new_val, wr_mask & HS_MODE_INTE=
RRUPTS);
+    if (ret_val) {
+        *ret_val =3D rval & HS_MODE_INTERRUPTS;
+    }
+
+    return ret;
 }
=20
 static RISCVException read_hcounteren(CPURISCVState *env, int csrno,
@@ -2124,9 +2463,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
                                                read_mstatus_i128        =
           },
     [CSR_MISA]        =3D { "misa",       any,   read_misa,        write=
_misa, NULL,
                                                read_misa_i128           =
           },
-    [CSR_MIDELEG]     =3D { "mideleg",    any,   read_mideleg,     write=
_mideleg     },
+    [CSR_MIDELEG]     =3D { "mideleg",    any,   NULL,    NULL,    rmw_m=
ideleg       },
     [CSR_MEDELEG]     =3D { "medeleg",    any,   read_medeleg,     write=
_medeleg     },
-    [CSR_MIE]         =3D { "mie",        any,   read_mie,         write=
_mie         },
+    [CSR_MIE]         =3D { "mie",        any,   NULL,    NULL,    rmw_m=
ie           },
     [CSR_MTVEC]       =3D { "mtvec",      any,   read_mtvec,       write=
_mtvec       },
     [CSR_MCOUNTEREN]  =3D { "mcounteren", any,   read_mcounteren,  write=
_mcounteren  },
=20
@@ -2140,10 +2479,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     [CSR_MTVAL]    =3D { "mtval",    any,  read_mtval,    write_mtval   =
 },
     [CSR_MIP]      =3D { "mip",      any,  NULL,    NULL, rmw_mip       =
 },
=20
+    /* Machine-Level High-Half CSRs (AIA) */
+    [CSR_MIDELEGH] =3D { "midelegh", aia_any32, NULL, NULL, rmw_midelegh=
 },
+    [CSR_MIEH]     =3D { "mieh",     aia_any32, NULL, NULL, rmw_mieh    =
 },
+    [CSR_MIPH]     =3D { "miph",     aia_any32, NULL, NULL, rmw_miph    =
 },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status, NULL,
                                               read_sstatus_i128         =
        },
-    [CSR_SIE]        =3D { "sie",        smode, read_sie,        write_s=
ie        },
+    [CSR_SIE]        =3D { "sie",        smode, NULL,   NULL,    rmw_sie=
          },
     [CSR_STVEC]      =3D { "stvec",      smode, read_stvec,      write_s=
tvec      },
     [CSR_SCOUNTEREN] =3D { "scounteren", smode, read_scounteren, write_s=
counteren },
=20
@@ -2158,12 +2502,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
     /* Supervisor Protection and Translation */
     [CSR_SATP]     =3D { "satp",     smode, read_satp,    write_satp    =
  },
=20
+    /* Supervisor-Level High-Half CSRs (AIA) */
+    [CSR_SIEH]       =3D { "sieh",   aia_smode32, NULL, NULL, rmw_sieh }=
,
+    [CSR_SIPH]       =3D { "siph",   aia_smode32, NULL, NULL, rmw_siph }=
,
+
     [CSR_HSTATUS]     =3D { "hstatus",     hmode,   read_hstatus,     wr=
ite_hstatus     },
     [CSR_HEDELEG]     =3D { "hedeleg",     hmode,   read_hedeleg,     wr=
ite_hedeleg     },
-    [CSR_HIDELEG]     =3D { "hideleg",     hmode,   read_hideleg,     wr=
ite_hideleg     },
+    [CSR_HIDELEG]     =3D { "hideleg",     hmode,   NULL,   NULL,     rm=
w_hideleg       },
     [CSR_HVIP]        =3D { "hvip",        hmode,   NULL,   NULL,     rm=
w_hvip          },
     [CSR_HIP]         =3D { "hip",         hmode,   NULL,   NULL,     rm=
w_hip           },
-    [CSR_HIE]         =3D { "hie",         hmode,   read_hie,         wr=
ite_hie         },
+    [CSR_HIE]         =3D { "hie",         hmode,   NULL,   NULL,     rm=
w_hie           },
     [CSR_HCOUNTEREN]  =3D { "hcounteren",  hmode,   read_hcounteren,  wr=
ite_hcounteren  },
     [CSR_HGEIE]       =3D { "hgeie",       hmode,   read_hgeie,       wr=
ite_hgeie       },
     [CSR_HTVAL]       =3D { "htval",       hmode,   read_htval,       wr=
ite_htval       },
@@ -2175,7 +2523,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
=20
     [CSR_VSSTATUS]    =3D { "vsstatus",    hmode,   read_vsstatus,    wr=
ite_vsstatus    },
     [CSR_VSIP]        =3D { "vsip",        hmode,   NULL,    NULL,    rm=
w_vsip          },
-    [CSR_VSIE]        =3D { "vsie",        hmode,   read_vsie,        wr=
ite_vsie        },
+    [CSR_VSIE]        =3D { "vsie",        hmode,   NULL,    NULL,    rm=
w_vsie          },
     [CSR_VSTVEC]      =3D { "vstvec",      hmode,   read_vstvec,      wr=
ite_vstvec      },
     [CSR_VSSCRATCH]   =3D { "vsscratch",   hmode,   read_vsscratch,   wr=
ite_vsscratch   },
     [CSR_VSEPC]       =3D { "vsepc",       hmode,   read_vsepc,       wr=
ite_vsepc       },
@@ -2186,6 +2534,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,      wr=
ite_mtval2      },
     [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,      wr=
ite_mtinst      },
=20
+    /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+    [CSR_HIDELEGH]    =3D { "hidelegh",    aia_hmode32, NULL, NULL, rmw_=
hidelegh },
+    [CSR_HVIPH]       =3D { "hviph",       aia_hmode32, NULL, NULL, rmw_=
hviph },
+    [CSR_VSIEH]       =3D { "vsieh",       aia_hmode32, NULL, NULL, rmw_=
vsieh },
+    [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, rmw_=
vsiph },
+
     /* Physical Memory Protection */
     [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mseccfg=
 },
     [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg =
 },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 30ed77c25f..65e63031ba 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,7 +84,7 @@ static const VMStateDescription vmstate_hyper =3D {
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
         VMSTATE_UINTTL(env.hedeleg, RISCVCPU),
-        VMSTATE_UINTTL(env.hideleg, RISCVCPU),
+        VMSTATE_UINT64(env.hideleg, RISCVCPU),
         VMSTATE_UINTTL(env.hcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
@@ -256,10 +256,10 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         VMSTATE_UINTTL(env.resetvec, RISCVCPU),
         VMSTATE_UINTTL(env.mhartid, RISCVCPU),
         VMSTATE_UINT64(env.mstatus, RISCVCPU),
-        VMSTATE_UINTTL(env.mip, RISCVCPU),
-        VMSTATE_UINT32(env.miclaim, RISCVCPU),
-        VMSTATE_UINTTL(env.mie, RISCVCPU),
-        VMSTATE_UINTTL(env.mideleg, RISCVCPU),
+        VMSTATE_UINT64(env.mip, RISCVCPU),
+        VMSTATE_UINT64(env.miclaim, RISCVCPU),
+        VMSTATE_UINT64(env.mie, RISCVCPU),
+        VMSTATE_UINT64(env.mideleg, RISCVCPU),
         VMSTATE_UINTTL(env.satp, RISCVCPU),
         VMSTATE_UINTTL(env.stval, RISCVCPU),
         VMSTATE_UINTTL(env.medeleg, RISCVCPU),
--=20
2.34.1


