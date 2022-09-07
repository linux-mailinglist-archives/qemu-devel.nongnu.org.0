Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FB5B0014
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:12:20 +0200 (CEST)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVr6Y-0005Tt-SZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq55-0004wB-Ux
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:47 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq50-0004UV-Op
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537998; x=1694073998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKyHwCxU/eLzqgG+ojCaKfGbAgedR4nBIgfMA0yAgrw=;
 b=hmbkgF8IwirOcH3QTj0yDdT+XU0tGT4trXW7bWh9gOT8eXONzny3DfPo
 N+yEn4yxnkxle9jzyaXWdFlqrMM+ypUrbh01hQV7Q7g5wxaiHbMDcKOai
 BPQJcLckvE53ZOnJhDlKjl6JbPz4EilREdUXXJNda/B+M4D/UZPaN3paK
 W735HUx9ftzP++V+RwluH0VMDNIMU8+4A5NKzfDBVKxP08wVYEloB8d+X
 NtAB01fG9Bopc2SSNlxnPp0DZu/4Qb+GjOGsoD04vT1hgTcOhik8nlOzg
 SIdTTWBV/bVV9WKfxBgf47nLKALXrFSVwRd0pr3qRY87JeRXXN95ciTNM w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715114"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:20 +0800
IronPort-SDR: /MhC4sY8ztigz6HdRhop4GvhQ91q0H6VjRxulX42lAXdaMDGn+VloNyQx6E4KjqwvyRvfntIkT
 u+fR8ozr6IRwcCCoWtFxMSRyxu+gU7Ygxb2tnc8UCLaI8qolUR4zbGFr38Wd7CDu60k+CokD/+
 fsVKG61EfGZczjykOB3xC7T3qWviegxTQOQMJzTxvRDHfMFCS4MQamwPkYpl7UMmARgU4AK7JW
 6yBJ3Flz0yiKsBB8DSSyDaOxiv+AAbnJHwUD1YBlLxbV9amPyCmApuRC2xJ1EWuOVgMyt8L4pG
 NpZnBzzlBy/XmlNk/gOM3ys/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:18 -0700
IronPort-SDR: gFZebMsf1/L3mWebaLEoU8hmQQ0i3ZIEG2kmavWbc3B+HdQuKktVhxcdcPEoJhdH4gD13Iykak
 5heI0ovsi3RVO+7kAKCRt+eJ2IiYJV7C4nTN8ZbTfM3vJ/wOPWouhsvCcHvp+PJFGtqlPjQ/rr
 exLLc5c5KDfVO5+Cv5JHKrsMy1pzxwHMQBI2BR5MJ4Jlz6wtxfr2OHUjF6SSaePNx/I5Xgrw1B
 fIgSwAam6HODorjD1FOm1OfdAfiMAzVruXZRKQJubHF2QZiB19Pg7EiJZhttjsr8vEu3uxGRI8
 FoE=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:20 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 36/44] target/riscv: Use official extension names for AIA CSRs
Date: Wed,  7 Sep 2022 10:03:45 +0200
Message-Id: <20220907080353.111926-37-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: Anup Patel <apatel@ventanamicro.com>

The arch review of AIA spec is completed and we now have official
extension names for AIA: Smaia (M-mode AIA CSRs) and Ssaia (S-mode
AIA CSRs).

Refer, section 1.6 of the latest AIA v0.3.1 stable specification at
https://github.com/riscv/riscv-aia/releases/download/0.3.1-draft.32/riscv-interrupts-032.pdf)

Based on above, we update QEMU RISC-V to:
1) Have separate config options for Smaia and Ssaia extensions
   which replace RISCV_FEATURE_AIA in CPU features
2) Not generate AIA INTC compatible string in virt machine

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220820042958.377018-1-apatel@ventanamicro.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  4 ++--
 hw/intc/riscv_imsic.c     |  4 +++-
 hw/riscv/virt.c           | 13 ++-----------
 target/riscv/cpu.c        |  9 ++++-----
 target/riscv/cpu_helper.c |  3 ++-
 target/riscv/csr.c        | 24 ++++++++++++++++++------
 6 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4be4b82a83..081cd05544 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -85,7 +85,6 @@ enum {
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA,
-    RISCV_FEATURE_AIA,
     RISCV_FEATURE_DEBUG
 };
 
@@ -439,6 +438,8 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_zmmul;
+    bool ext_smaia;
+    bool ext_ssaia;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
@@ -459,7 +460,6 @@ struct RISCVCPUConfig {
     bool mmu;
     bool pmp;
     bool epmp;
-    bool aia;
     bool debug;
     uint64_t resetvec;
 
diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
index 8615e4cc1d..4d4d5b50ca 100644
--- a/hw/intc/riscv_imsic.c
+++ b/hw/intc/riscv_imsic.c
@@ -344,9 +344,11 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
 
     /* Force select AIA feature and setup CSR read-modify-write callback */
     if (env) {
-        riscv_set_feature(env, RISCV_FEATURE_AIA);
         if (!imsic->mmode) {
+            rcpu->cfg.ext_ssaia = true;
             riscv_cpu_set_geilen(env, imsic->num_pages - 1);
+        } else {
+            rcpu->cfg.ext_smaia = true;
         }
         riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
                                       riscv_imsic_rmw, imsic);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 686341a0e2..ff8c0df5cd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -260,17 +260,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_add_subnode(mc->fdt, intc_name);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
             intc_phandles[cpu]);
-        if (riscv_feature(&s->soc[socket].harts[cpu].env,
-                          RISCV_FEATURE_AIA)) {
-            static const char * const compat[2] = {
-                "riscv,cpu-intc-aia", "riscv,cpu-intc"
-            };
-            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
-                                      (char **)&compat, ARRAY_SIZE(compat));
-        } else {
-            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
-                "riscv,cpu-intc");
-        }
+        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
+            "riscv,cpu-intc");
         qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e0d5941230..26d44df446 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -99,6 +99,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
+    ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
@@ -666,10 +668,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.aia) {
-        riscv_set_feature(env, RISCV_FEATURE_AIA);
-    }
-
     if (cpu->cfg.debug) {
         riscv_set_feature(env, RISCV_FEATURE_DEBUG);
     }
@@ -1038,7 +1036,8 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
+    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
+    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 650574accf..05c0c8d777 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -307,6 +307,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
                                     int extirq, unsigned int extirq_def_prio,
                                     uint64_t pending, uint8_t *iprio)
 {
+    RISCVCPU *cpu = env_archcpu(env);
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
 
@@ -315,7 +316,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
     }
 
     irq = ctz64(pending);
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    if (!((extirq == IRQ_M_EXT) ? cpu->cfg.ext_smaia : cpu->cfg.ext_ssaia)) {
         return irq;
     }
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4a7078f7d1..3ddf309055 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -257,7 +257,9 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 static int aia_any(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_smaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -266,7 +268,9 @@ static int aia_any(CPURISCVState *env, int csrno)
 
 static int aia_any32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_smaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -293,7 +297,9 @@ static int smode32(CPURISCVState *env, int csrno)
 
 static int aia_smode(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -302,7 +308,9 @@ static int aia_smode(CPURISCVState *env, int csrno)
 
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -358,7 +366,9 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 
 static int aia_hmode(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
      }
 
@@ -367,7 +377,9 @@ static int aia_hmode(CPURISCVState *env, int csrno)
 
 static int aia_hmode32(CPURISCVState *env, int csrno)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!cpu->cfg.ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.37.2


