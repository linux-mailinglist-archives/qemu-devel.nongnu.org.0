Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839A43DA9D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:59:58 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxW9-0003dK-8n
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHP-0008RC-N4
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:43 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHM-000571-DM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396280; x=1666932280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ex8P5OZzdQADn82ihFvoY8GX9Xe4swqx4TgtYsQsBSU=;
 b=BhOfORDzS4lXfeiijdvGlu5EO0J9f1oLfE8iR1VAaaFeoijaOWzynmjK
 RnHLuvxQDSnJWcaEwhiKc6F9rm1stklf9iwrNr5Ku+f9ubbSZ0LhhmqbM
 k1hRhY3eG8p+V/PGDM/GNiltJglXS64Zqx9A4VJn/PUWFIdYcKW743YBv
 Hai6rpcd419+vR1bGKyH4wzQWQ2dbHjeLY1yhYW4BDvNBvf7Mahfp7MRT
 cpYDQTVBRdRqeL5qDf/0QVvE+cSHIkuQRmEIilrM0EGy3uKKj1CfNZEhX
 49+UWIEvlwBsZKtKGiMlTdqXemO+5BA37DV0kOBAvQqhoy++7B2woBEwn A==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975509"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:39 +0800
IronPort-SDR: 6KavCrSaMqLVZILFfh6tU1ZTZ9qlaxMdghxuXkrjp8bbQz2UtEzPzJ8dCukxQkouKuMsYv7JLp
 zZAQLxQD3+VHhth+3I1a/evmbby6akB0rDYoncFr8p8aXEtOXDcnG4mHsOQmSfHwvy9WJIWTPX
 iSKdPLVQt3e11fmoF+7f0H5ouHiLmRX5NYgZdQMkIVdE8GvpB8WbnUFqaDbbKje43dXR2zT7uQ
 ikxnHA5gezs8QuNKbsKq4/D5jqVsvCAroZ5iWs9RW5Vv2WYxZKjm5Q4wB1wwazi6xvfi4fNNEM
 ggVZdUDyR6XdLPsZK5KB/0+A
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:18:33 -0700
IronPort-SDR: zMMIDxuDbUKbBQTy59hDp3ZsNHO11EtzQKT9cLPPHRQVfKYkJpKfMTtJbQFck3EFr3q7xinL2b
 dYNupEC0BLknvlWPgw3V1+Kv8Rlvrlz8rP2CQmMBVVsHhKyYWwTX6QE+zCbQVSIY4qd5u1gqwO
 3XQaUf6CwpPOr8yon6aJzkSKUpez+NFa7smWA5zV3yk007u3IduaYqX8EzeGNy5E68ZGow3Eiu
 w2pyOKUPVkevp7X/KzpupcNtHbOhrfbbGxqaxQ4VkTUWxjTS6XWVY7yUxFjF93PnoQGYH/WzHb
 gaI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJQ3LJyz1RtVv
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396277; x=1637988278; bh=ex8P5OZzdQADn82ihF
 voY8GX9Xe4swqx4TgtYsQsBSU=; b=kazjgB8GWlxehkF4iQJrvFBSeKVNYEdtuo
 XeFKC66g5J3I9q6Fk156haM52Fk01oMiuCq3ReNkN+YyALNXw/qnCP10+vW3pdlB
 hAypdH4PLMxX2QN0MH61q5KL2Y+CgIfv3V9unU3ooa3rxlvSMY8vkfKzV7yfksEv
 RdG8dMaJCa+pqUrDRhWotwfIgzTTBvtZwbeWYX9WHeuyXVMtoJP1XeRSdeLSolf6
 aW83bQpKnZkoyh5YdcMMTosOIEzsWzcpATJ0CmFTuknt+tOEP5y0vsUZrwMCSV2g
 8BjoFB4icEvO4x+FwmoMpdKHzLEhI2rP7dp7bG0L/FvmOtWt2NbQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3fin86qletXa for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:37 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJK3QY3z1RtVl;
 Wed, 27 Oct 2021 21:44:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/18] target/riscv: Support CSRs required for RISC-V PM
 extension except for the h-mode
Date: Thu, 28 Oct 2021 14:43:33 +1000
Message-Id: <20211028044342.3070385-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-4-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  11 ++
 target/riscv/cpu.c |   2 +
 target/riscv/csr.c | 285 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 298 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1cfc6a53a0..b2422e3f99 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -238,6 +238,17 @@ struct CPURISCVState {
=20
     /* True if in debugger mode.  */
     bool debugger;
+
+    /*
+     * CSRs for PointerMasking extension
+     */
+    target_ulong mmte;
+    target_ulong mpmmask;
+    target_ulong mpmbase;
+    target_ulong spmmask;
+    target_ulong spmbase;
+    target_ulong upmmask;
+    target_ulong upmbase;
 #endif
=20
     float_status fp_status;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 788fa0b11c..6b767a4a0b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -367,6 +367,8 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mcause =3D 0;
     env->pc =3D env->resetvec;
     env->two_stage_lookup =3D false;
+    /* mmte is supposed to have pm.current hardwired to 1 */
+    env->mmte |=3D (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     cs->exception_index =3D RISCV_EXCP_NONE;
     env->load_res =3D -1;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e4d65fcd..9f41954894 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -192,6 +192,16 @@ static RISCVException hmode32(CPURISCVState *env, in=
t csrno)
=20
 }
=20
+/* Checks if PointerMasking registers could be accessed */
+static RISCVException pointer_masking(CPURISCVState *env, int csrno)
+{
+    /* Check if j-ext is present */
+    if (riscv_has_ext(env, RVJ)) {
+        return RISCV_EXCP_NONE;
+    }
+    return RISCV_EXCP_ILLEGAL_INST;
+}
+
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_feature(env, RISCV_FEATURE_PMP)) {
@@ -1425,6 +1435,268 @@ static RISCVException write_pmpaddr(CPURISCVState=
 *env, int csrno,
     return RISCV_EXCP_NONE;
 }
=20
+/*
+ * Functions to access Pointer Masking feature registers
+ * We have to check if current priv lvl could modify
+ * csr in given mode
+ */
+static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
+{
+    int csr_priv =3D get_field(csrno, 0x300);
+    int pm_current;
+
+    /*
+     * If priv lvls differ that means we're accessing csr from higher pr=
iv lvl,
+     * so allow the access
+     */
+    if (env->priv !=3D csr_priv) {
+        return false;
+    }
+    switch (env->priv) {
+    case PRV_M:
+        pm_current =3D get_field(env->mmte, M_PM_CURRENT);
+        break;
+    case PRV_S:
+        pm_current =3D get_field(env->mmte, S_PM_CURRENT);
+        break;
+    case PRV_U:
+        pm_current =3D get_field(env->mmte, U_PM_CURRENT);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    /* It's same priv lvl, so we allow to modify csr only if pm.current=3D=
=3D1 */
+    return !pm_current;
+}
+
+static RISCVException read_mmte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val =3D env->mmte & MMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mmte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    uint64_t mstatus;
+    target_ulong wpri_val =3D val & MMTE_MASK;
+
+    if (val !=3D wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s" TARGET_F=
MT_lx "\n",
+                      "MMTE: WPRI violation written 0x", val,
+                      "vs expected 0x", wpri_val);
+    }
+    /* for machine mode pm.current is hardwired to 1 */
+    wpri_val |=3D MMTE_M_PM_CURRENT;
+
+    /* hardwiring pm.instruction bit to 0, since it's not supported yet =
*/
+    wpri_val &=3D ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
+    env->mmte =3D wpri_val | PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus =3D env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_smte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val =3D env->mmte & SMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_smte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    target_ulong wpri_val =3D val & SMTE_MASK;
+
+    if (val !=3D wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s" TARGET_F=
MT_lx "\n",
+                      "SMTE: WPRI violation written 0x", val,
+                      "vs expected 0x", wpri_val);
+    }
+
+    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    wpri_val |=3D (env->mmte & ~SMTE_MASK);
+    write_mmte(env, csrno, wpri_val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_umte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val =3D env->mmte & UMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_umte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    target_ulong wpri_val =3D val & UMTE_MASK;
+
+    if (val !=3D wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s" TARGET_FMT_lx " %s" TARGET_F=
MT_lx "\n",
+                      "UMTE: WPRI violation written 0x", val,
+                      "vs expected 0x", wpri_val);
+    }
+
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    wpri_val |=3D (env->mmte & ~UMTE_MASK);
+    write_mmte(env, csrno, wpri_val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mpmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val =3D env->mpmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    env->mpmmask =3D val;
+    env->mmte |=3D PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus =3D env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_spmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val =3D env->spmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_spmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->spmmask =3D val;
+    env->mmte |=3D PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus =3D env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_upmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val =3D env->upmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_upmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->upmmask =3D val;
+    env->mmte |=3D PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus =3D env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mpmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val =3D env->mpmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    env->mpmbase =3D val;
+    env->mmte |=3D PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus =3D env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_spmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val =3D env->spmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_spmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->spmbase =3D val;
+    env->mmte |=3D PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus =3D env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_upmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val =3D env->upmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_upmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current=3D=3D0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->upmbase =3D val;
+    env->mmte |=3D PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus =3D env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
 #endif
=20
 /*
@@ -1659,6 +1931,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_PMPADDR14] =3D  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr=
 },
     [CSR_PMPADDR15] =3D  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr=
 },
=20
+    /* User Pointer Masking */
+    [CSR_UMTE]    =3D    { "umte",    pointer_masking, read_umte,    wri=
te_umte    },
+    [CSR_UPMMASK] =3D    { "upmmask", pointer_masking, read_upmmask, wri=
te_upmmask },
+    [CSR_UPMBASE] =3D    { "upmbase", pointer_masking, read_upmbase, wri=
te_upmbase },
+    /* Machine Pointer Masking */
+    [CSR_MMTE]    =3D    { "mmte",    pointer_masking, read_mmte,    wri=
te_mmte    },
+    [CSR_MPMMASK] =3D    { "mpmmask", pointer_masking, read_mpmmask, wri=
te_mpmmask },
+    [CSR_MPMBASE] =3D    { "mpmbase", pointer_masking, read_mpmbase, wri=
te_mpmbase },
+    /* Supervisor Pointer Masking */
+    [CSR_SMTE]    =3D    { "smte",    pointer_masking, read_smte,    wri=
te_smte    },
+    [CSR_SPMMASK] =3D    { "spmmask", pointer_masking, read_spmmask, wri=
te_spmmask },
+    [CSR_SPMBASE] =3D    { "spmbase", pointer_masking, read_spmbase, wri=
te_spmbase },
+
     /* Performance Counters */
     [CSR_HPMCOUNTER3]    =3D { "hpmcounter3",    ctr,    read_zero },
     [CSR_HPMCOUNTER4]    =3D { "hpmcounter4",    ctr,    read_zero },
--=20
2.31.1


