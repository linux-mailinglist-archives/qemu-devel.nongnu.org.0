Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C635AFEE1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:22:35 +0200 (CEST)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqKP-0000Iz-DC
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2r-0003c6-It
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq2n-0004Ot-4m
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537860; x=1694073860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNTnTkLxZWpxArUveUUoPoICQ3+pylA20Esq16wfTCQ=;
 b=HAVFgt7XVbo1pHultemjWvMW2bpyHDwwDE75Hqx1gme7Zis9h+G1x2mu
 asEwBIRfYsv2JPrw/nAMtY8bYoMCTCxCo1Ls5HwJVtYQId5jTqYpQxIHx
 yjjNWuYyw/EO8/5FPqltExYMuoy4zf5Ee/CIuQzS707bPPcQIRpVm8he3
 jNYjQtxkw3KGuNEQ53w6FS6z5XndWg4FUkDWfb2tdukU1y7mXEacn0vzH
 DUmUIY/jlSLdjxqfXcmUazMe9ZecIOrgLPXJhIzrD7xE2zbwWXDlRfmpq
 uhjCDSao2F1Ssg9kTZ9qQ1O4OD5j0ezTJS3HrxQ3HCUJ4r2l3FQdCtQho g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714936"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:15 +0800
IronPort-SDR: fWi7W8KQUnyWxn3SvQ949SoiMV2IaQF2OYm3kTi+2GmIggPqbA3zrY/9Tc7TGFZqQJ1Yc15phY
 CFvEt/2KmAO/qgySYLyMC58uSSqYSWEB49VI4Eh3HTgyWMiSfY5WGmqpb5y39HSb2nqa/q+7Y7
 wq5Xb3MdP0dMa24Lc033xmjkInelw+C7JXwiMCUe+RcgvSqNio8bjSXWa83A1U6Pcq+b8vIJ2z
 bsa5h3HX6QYTNon26/oslOQoazP163lackpFlCVs5OpPJ5SxkQ+v7pF6icC11xQqS5gXQ+9nmF
 ZeTqCm/V5OyLp52fIwcSzt53
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:12 -0700
IronPort-SDR: JVn8k/AXtvZUkAc6zuwVHc6Th9ga5/Y0RSk8dSIPdHCzEZwJl0bCmHKNEGI+1q763mMN1tMWfU
 l740Ua4OfhyCINfYIOiKo0Hi84V6hLwkWl41BZsV25x8BnvvI1dfYTROjQ32luABB5Aptnib7u
 PmHNLhn/9vXcDOoAS8uC9RTKGESg3rq7MzIgZ3Mlg8cHrEbKTpxcItnq+JXsoWjhjECwpvflCA
 4NiFGn23ifIRMwzgZMaXSYkP21k1rgluI3FeHbjRe4vcmW2Fux6THqaNcWbUxrTYDbUPN16NHs
 lpE=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:14 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Rahul Pathak <rpathak@ventanamicro.com>
Subject: [PULL 02/44] target/riscv: Force disable extensions if priv spec
 version does not match
Date: Wed,  7 Sep 2022 10:03:11 +0200
Message-Id: <20220907080353.111926-3-alistair.francis@wdc.com>
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

We should disable extensions in riscv_cpu_realize() if minimum required
priv spec version is not satisfied. This also ensures that machines with
priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
extensions.

Fixes: a775398be2e9 ("target/riscv: Add isa extenstion strings to the device tree")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Message-Id: <20220630061150.905174-3-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 150 ++++++++++++++++++++++++++++-----------------
 1 file changed, 94 insertions(+), 56 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..cab74faaca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -43,9 +43,82 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
     const char *name;
-    bool enabled;
+    bool multi_letter;
+    int min_version;
+    int ext_enable_offset;
 };
 
+#define ISA_EXT_DATA_ENTRY(_name, _m_letter, _min_ver, _prop) \
+{#_name, _m_letter, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
+
+/**
+ * Here are the ordering rules of extension naming defined by RISC-V
+ * specification :
+ * 1. All extensions should be separated from other multi-letter extensions
+ *    by an underscore.
+ * 2. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they should be ordered first
+ *    by category, then alphabetically within a category.
+ * 3. Standard supervisor-level extensions (starts with 'S') should be
+ *    listed after standard unprivileged extensions.  If multiple
+ *    supervisor-level extensions are listed, they should be ordered
+ *    alphabetically.
+ * 4. Non-standard extensions (starts with 'X') must be listed after all
+ *    standard extensions. They must be separated from other multi-letter
+ *    extensions by an underscore.
+ */
+static const struct isa_ext_data isa_edata_arr[] = {
+    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
+    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_12_0, ext_v),
+    ISA_EXT_DATA_ENTRY(zicsr, true, PRIV_VERSION_1_10_0, ext_icsr),
+    ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
+    ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
+    ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
+    ISA_EXT_DATA_ENTRY(zba, true, PRIV_VERSION_1_12_0, ext_zba),
+    ISA_EXT_DATA_ENTRY(zbb, true, PRIV_VERSION_1_12_0, ext_zbb),
+    ISA_EXT_DATA_ENTRY(zbc, true, PRIV_VERSION_1_12_0, ext_zbc),
+    ISA_EXT_DATA_ENTRY(zbkb, true, PRIV_VERSION_1_12_0, ext_zbkb),
+    ISA_EXT_DATA_ENTRY(zbkc, true, PRIV_VERSION_1_12_0, ext_zbkc),
+    ISA_EXT_DATA_ENTRY(zbkx, true, PRIV_VERSION_1_12_0, ext_zbkx),
+    ISA_EXT_DATA_ENTRY(zbs, true, PRIV_VERSION_1_12_0, ext_zbs),
+    ISA_EXT_DATA_ENTRY(zk, true, PRIV_VERSION_1_12_0, ext_zk),
+    ISA_EXT_DATA_ENTRY(zkn, true, PRIV_VERSION_1_12_0, ext_zkn),
+    ISA_EXT_DATA_ENTRY(zknd, true, PRIV_VERSION_1_12_0, ext_zknd),
+    ISA_EXT_DATA_ENTRY(zkne, true, PRIV_VERSION_1_12_0, ext_zkne),
+    ISA_EXT_DATA_ENTRY(zknh, true, PRIV_VERSION_1_12_0, ext_zknh),
+    ISA_EXT_DATA_ENTRY(zkr, true, PRIV_VERSION_1_12_0, ext_zkr),
+    ISA_EXT_DATA_ENTRY(zks, true, PRIV_VERSION_1_12_0, ext_zks),
+    ISA_EXT_DATA_ENTRY(zksed, true, PRIV_VERSION_1_12_0, ext_zksed),
+    ISA_EXT_DATA_ENTRY(zksh, true, PRIV_VERSION_1_12_0, ext_zksh),
+    ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
+    ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
+    ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
+    ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
+    ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
+    ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
+    ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
+    ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
+};
+
+static bool isa_ext_is_enabled(RISCVCPU *cpu,
+                               const struct isa_ext_data *edata)
+{
+    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+
+    return *ext_enabled;
+}
+
+static void isa_ext_update_enabled(RISCVCPU *cpu,
+                                   const struct isa_ext_data *edata, bool en)
+{
+    bool *ext_enabled = (void *)&cpu->cfg + edata->ext_enable_offset;
+
+    *ext_enabled = en;
+}
+
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
   "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -530,7 +603,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int priv_version = -1;
+    int i, priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -558,6 +631,23 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /* Force disable extensions if priv spec version does not match */
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
+            (env->priv_ver < isa_edata_arr[i].min_version)) {
+            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
+            warn_report("disabling %s extension for hart 0x%lx because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
+#else
+            warn_report("disabling %s extension because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
+        }
+    }
+
     if (cpu->cfg.mmu) {
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
@@ -1044,67 +1134,15 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
-
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 {
     char *old = *isa_str;
     char *new = *isa_str;
     int i;
 
-    /**
-     * Here are the ordering rules of extension naming defined by RISC-V
-     * specification :
-     * 1. All extensions should be separated from other multi-letter extensions
-     *    by an underscore.
-     * 2. The first letter following the 'Z' conventionally indicates the most
-     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
-     *    If multiple 'Z' extensions are named, they should be ordered first
-     *    by category, then alphabetically within a category.
-     * 3. Standard supervisor-level extensions (starts with 'S') should be
-     *    listed after standard unprivileged extensions.  If multiple
-     *    supervisor-level extensions are listed, they should be ordered
-     *    alphabetically.
-     * 4. Non-standard extensions (starts with 'X') must be listed after all
-     *    standard extensions. They must be separated from other multi-letter
-     *    extensions by an underscore.
-     */
-    struct isa_ext_data isa_edata_arr[] = {
-        ISA_EDATA_ENTRY(zicsr, ext_icsr),
-        ISA_EDATA_ENTRY(zifencei, ext_ifencei),
-        ISA_EDATA_ENTRY(zmmul, ext_zmmul),
-        ISA_EDATA_ENTRY(zfh, ext_zfh),
-        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
-        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
-        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
-        ISA_EDATA_ENTRY(zba, ext_zba),
-        ISA_EDATA_ENTRY(zbb, ext_zbb),
-        ISA_EDATA_ENTRY(zbc, ext_zbc),
-        ISA_EDATA_ENTRY(zbkb, ext_zbkb),
-        ISA_EDATA_ENTRY(zbkc, ext_zbkc),
-        ISA_EDATA_ENTRY(zbkx, ext_zbkx),
-        ISA_EDATA_ENTRY(zbs, ext_zbs),
-        ISA_EDATA_ENTRY(zk, ext_zk),
-        ISA_EDATA_ENTRY(zkn, ext_zkn),
-        ISA_EDATA_ENTRY(zknd, ext_zknd),
-        ISA_EDATA_ENTRY(zkne, ext_zkne),
-        ISA_EDATA_ENTRY(zknh, ext_zknh),
-        ISA_EDATA_ENTRY(zkr, ext_zkr),
-        ISA_EDATA_ENTRY(zks, ext_zks),
-        ISA_EDATA_ENTRY(zksed, ext_zksed),
-        ISA_EDATA_ENTRY(zksh, ext_zksh),
-        ISA_EDATA_ENTRY(zkt, ext_zkt),
-        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
-        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
-        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
-        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
-        ISA_EDATA_ENTRY(svinval, ext_svinval),
-        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
-        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
-    };
-
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].enabled) {
+        if (isa_edata_arr[i].multi_letter &&
+            isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.37.2


