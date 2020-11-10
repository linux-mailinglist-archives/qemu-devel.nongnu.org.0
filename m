Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE62ACE70
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:13:12 +0100 (CET)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcL1r-0000PE-KV
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxw-0004sK-Jh
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:08 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=57671029a=alistair.francis@wdc.com>)
 id 1kcKxu-0000Tc-36
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604981597; x=1636517597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dBVH1AiPrQJzIXrJQv9sb9KTme4xl27I6RGEnwZSTeM=;
 b=dCy9AUS/abY8SsI0DCjO96G+LfyS9XlseLhYJAaEnAttakknsOjVI6Zr
 cX3YTuXmXsw9tjk5nXquBx6S8MAMbtGCt+VS/1yPEGLbEDMzayfJ3c85h
 zekPL+rYEByxp0FFDke8LFVMxL+NihUnTrNzEcSvgWGuiDw3vz7Pw4iMD
 GLte5viX8WzM+LBdr8+BFUj+wDywv0Y2lIldglQ3Hp3cUeAkgKbT75hFb
 LGu6UJA+LB0gwyOS4R4MN2Dkx2Z7cQIfqwND75dolquEIQWZeoMD8FIMf
 u9OTYIh3f/hVJjVby6UGmthUPjPGB4RiNeON00I+0ZpZg9Rxd/XOPrlX4 A==;
IronPort-SDR: FZX3QTHnNnHTig6yhIvydptm8GxpE9qM3P7D27aNVe9ssH9i7BekovWr2GpvNb1T0XsWpbySK2
 JxwLnYPCb2rYMh3ShFtpUsgRubZ0oxH+Wp9rM2inYVU9BhF8DcVrNcIGcL/Lj0KzxFRpfCgrLF
 WJEKwFuJZlTMrLNh3TdT6HGzGEsR3ipwcbfrWfg1dtE8GdByWa9id11Zsf+arVhbJh/Ru07QDC
 HOUTkEZKZqn6gixvBMzdPfYZrA/Z2rdLajtroHxP9xwBl+3pzl0J0JIMH7nueWbXk68N4lr6G4
 FJI=
X-IronPort-AV: E=Sophos;i="5.77,465,1596470400"; d="scan'208";a="255803595"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Nov 2020 12:13:08 +0800
IronPort-SDR: g6JzmYGIc13dd2HAxibaK349w2egSgbO4m53GACBbX5fcRaixY9U/m1a8uLsJWaRzQ4k+jveKU
 B1B6QNHRlIuVJSw1caXS6s2rvx/WmPQsxi+UAyCNO0IqUJ623j5XZEbfHxzjjsvmwGR4Ybcr7Y
 hsxz4bOlVyIydZkq0Uw/57jjh0FU8tED9iMBNm9vf7LDAsZPddcJ4dUxAL39ItO8TeF06mR+x3
 BUNEnHGf03WK9/43LYgQyQe7T/8VlcELdxxHs827fKMwVvIeo7v5DFgFlEtNUWPOe3oRKZkl09
 NfPCA/F0tiN8CLFUcD7g+Nb1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 19:55:01 -0800
IronPort-SDR: Pk9F2em3yyoO8M/AgAwOSmKXN6cwP457QD1SOL4E8PCCR8xTK0oVaJtNHDCu2s2C7kr03EPhH9
 r35fC2kESVXmNToewHhbDkru56MZ/GiiGwaWy+BfIoIsrJ9tkGESKx+1WG/7sY5D58AeutZz+o
 VPoL/fPukEVUv5d52fARa9UI4VDbdIrSJsCXsBCMKdBW8i+hixaYF0vQ/5CCoxeeV3l5QNb/L3
 n3XAkTlGE8JzTuQ6Tj/ZD7IJlXItdO4Al1FF6xOKMf7uxnNXqR1B/YdGqsgJ337PmnR/x3xCZW
 wg4=
WDCIronportException: Internal
Received: from usa001882.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.209])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Nov 2020 20:08:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 2/6] target/riscv: Set the virtualised MMU mode when doing hyp
 accesses
Date: Mon,  9 Nov 2020 19:56:59 -0800
Message-Id: <20201110035703.83786-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201110035703.83786-1-alistair.francis@wdc.com>
References: <20201110035703.83786-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=57671029a=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 23:09:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When performing the hypervisor load/store operations set the MMU mode to
indicate that we are virtualised.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: e411c61a1452cad16853f13cac2fb86dc91ebee8.1604464950.git.alistair.francis@wdc.com
---
 target/riscv/op_helper.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index e20d56dcb8..548c5851ec 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -235,30 +235,31 @@ target_ulong helper_hyp_load(CPURISCVState *env, target_ulong address,
         (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
             get_field(env->hstatus, HSTATUS_HU))) {
         target_ulong pte;
+        int mmu_idx = cpu_mmu_index(env, false) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 
         riscv_cpu_set_two_stage_lookup(env, true);
 
         switch (memop) {
         case MO_SB:
-            pte = cpu_ldsb_data_ra(env, address, GETPC());
+            pte = cpu_ldsb_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         case MO_UB:
-            pte = cpu_ldub_data_ra(env, address, GETPC());
+            pte = cpu_ldub_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         case MO_TESW:
-            pte = cpu_ldsw_data_ra(env, address, GETPC());
+            pte = cpu_ldsw_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         case MO_TEUW:
-            pte = cpu_lduw_data_ra(env, address, GETPC());
+            pte = cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         case MO_TESL:
-            pte = cpu_ldl_data_ra(env, address, GETPC());
+            pte = cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         case MO_TEUL:
-            pte = cpu_ldl_data_ra(env, address, GETPC());
+            pte = cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         case MO_TEQ:
-            pte = cpu_ldq_data_ra(env, address, GETPC());
+            pte = cpu_ldq_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         default:
             g_assert_not_reached();
@@ -284,23 +285,25 @@ void helper_hyp_store(CPURISCVState *env, target_ulong address,
         (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
         (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
             get_field(env->hstatus, HSTATUS_HU))) {
+        int mmu_idx = cpu_mmu_index(env, false) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
+
         riscv_cpu_set_two_stage_lookup(env, true);
 
         switch (memop) {
         case MO_SB:
         case MO_UB:
-            cpu_stb_data_ra(env, address, val, GETPC());
+            cpu_stb_mmuidx_ra(env, address, val, mmu_idx, GETPC());
             break;
         case MO_TESW:
         case MO_TEUW:
-            cpu_stw_data_ra(env, address, val, GETPC());
+            cpu_stw_mmuidx_ra(env, address, val, mmu_idx, GETPC());
             break;
         case MO_TESL:
         case MO_TEUL:
-            cpu_stl_data_ra(env, address, val, GETPC());
+            cpu_stl_mmuidx_ra(env, address, val, mmu_idx, GETPC());
             break;
         case MO_TEQ:
-            cpu_stq_data_ra(env, address, val, GETPC());
+            cpu_stq_mmuidx_ra(env, address, val, mmu_idx, GETPC());
             break;
         default:
             g_assert_not_reached();
@@ -326,15 +329,16 @@ target_ulong helper_hyp_x_load(CPURISCVState *env, target_ulong address,
         (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
             get_field(env->hstatus, HSTATUS_HU))) {
         target_ulong pte;
+        int mmu_idx = cpu_mmu_index(env, false) | TB_FLAGS_PRIV_HYP_ACCESS_MASK;
 
         riscv_cpu_set_two_stage_lookup(env, true);
 
         switch (memop) {
         case MO_TEUW:
-            pte = cpu_lduw_data_ra(env, address, GETPC());
+            pte = cpu_lduw_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         case MO_TEUL:
-            pte = cpu_ldl_data_ra(env, address, GETPC());
+            pte = cpu_ldl_mmuidx_ra(env, address, mmu_idx, GETPC());
             break;
         default:
             g_assert_not_reached();
-- 
2.29.2


