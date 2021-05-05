Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D274374C1F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:54:07 +0200 (CEST)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRLC-0004uL-Gf
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtb-0001dT-L6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:35 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtZ-00010n-D1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257133; x=1651793133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQcSS1oSxULsvx3rcazGUleTjavqMGxioohI8At+Ha4=;
 b=DBu+BDgW4DiIskhewoe2zeiarPMePrOMFLrEkhAwTk5sYctKugTmRccw
 OJcW0FLQ0XGSmtpvIbcKRh687Tih2fkT0B6lxG6gQ7JKiA3FgGchjZnmT
 1jEx2w8u3WPMLpy79PO4CcQQ7ZX6RH2xZg7cFcorYBQlD7Uz0cJTZn6w9
 8L4ooeBRQOPPIOMvfgXEALUboECrxzUe0nVt+YnmMVcx8jVe13G4dxl1H
 /MfrmDFQ5BLT6uTcD6XO/2irUiwjLAbsVgwpDo+n/lfYFYC2RV+IWeCS6
 FiuowHf9VPqowSg4zfH2LYSfTRvntJaY61rOsDgsVIfMbeMsLlt0clTeA A==;
IronPort-SDR: l+YSUvO/fetGnD2c1Ay53UgRP7seRXgikTNNcafQqIUGTqOavEjVNe0O8VAAJZQNCL8GUBNx1d
 TYUN3EpmhZRmFNc+7uYNWnERcdJ+mSxNJIcxtmV1BQejckDKOAAaYGE7huzmJklkaRYnh684jz
 OS0mORYsNxxMZ9+gyP3H16JG7WO3ZefYSt9of0Q4w9N0oiZ8O9YDqoL3zIekagPl2fTMZAvI1J
 xEi3ZnnF8NZ/TTRZPsuncNZ2K5s772E3lFLTZ0WADS/3tFds9FWCc7cEmIOh06j/P2/WjHVRaE
 B5k=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586011"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:16 +0800
IronPort-SDR: jCxKKnJ9sSZVPdLyJ7EQ/PrcRCRvOoa033IQwvjhIelGilHGHrtcxhp0OtUHQgYj42NPCDGoxA
 R4pd5cy0/Fz30S+UCfHKmJWqtaU5OoxAM1p5cmD7flXfPf5JaHWAR+UB4raj79ZWPgl7tLmC+C
 VLC8IV1VZfx4SgwjDG8rLpgHM5F8UbvR1XmntOCulFkTWnedqW8BnLUCKmYoUuIcWqvigrFd0r
 DKQic2SJN/zW7f8fOag29VhCSN7FTnUd1H1VqUYFucekVbDHZFKO0Xeg6W/dldF1+bwlE2JoJe
 DUqBXn/crTqqohOA2LsmJnsj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:56 -0700
IronPort-SDR: 4GG2t7tP9RSq6K+iNmVv2bPxl6eMo8bGXUmhp+CTe+Na/uobf+0GxkOspTK7v1CF4YF4ND8uAS
 Hq6g3u/GkrCQR4qd5xQBeN9KfdYfJG16Eh+RjRHUgrnhdDdLaxJKq4i+9VmR4zHOECZ7qAB3bx
 mzt3Pux2TvWlhioe+khLMbCv2WoDfpmluNUicCatRUHfOvrR1xrLYAl9dVufAHEW8EVz1drdjI
 65OIu3BUMs3/nqIM6qpKG1jtMkLznmosejZEzPL7IMspKDQ5B4xAp3dgqKNebBrtqjy2Xfp5By
 xMk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:12 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 35/42] target/riscv: Remove the hardcoded HGATP_MODE macro
Date: Thu,  6 May 2021 09:23:05 +1000
Message-Id: <20210505232312.4175486-36-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 665f624bfdc2e3ca64265004b07de7489c77a766.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h   | 11 -----------
 target/riscv/cpu_helper.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 3a0e79e545..d738e2fdbd 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -195,17 +195,6 @@
 #define CSR_HTIMEDELTA      0x605
 #define CSR_HTIMEDELTAH     0x615
 
-#if defined(TARGET_RISCV32)
-#define HGATP_MODE           SATP32_MODE
-#define HGATP_VMID           SATP32_ASID
-#define HGATP_PPN            SATP32_PPN
-#endif
-#if defined(TARGET_RISCV64)
-#define HGATP_MODE           SATP64_MODE
-#define HGATP_VMID           SATP64_ASID
-#define HGATP_PPN            SATP64_PPN
-#endif
-
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1018c0036d..d9defbdd34 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -413,8 +413,13 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         }
         widened = 0;
     } else {
-        base = (hwaddr)get_field(env->hgatp, HGATP_PPN) << PGSHIFT;
-        vm = get_field(env->hgatp, HGATP_MODE);
+        if (riscv_cpu_is_32bit(env)) {
+            base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP32_MODE);
+        } else {
+            base = (hwaddr)get_field(env->hgatp, SATP64_PPN) << PGSHIFT;
+            vm = get_field(env->hgatp, SATP64_MODE);
+        }
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
@@ -618,16 +623,17 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 bool first_stage, bool two_stage)
 {
     CPUState *cs = env_cpu(env);
-    int page_fault_exceptions;
+    int page_fault_exceptions, vm;
+
     if (first_stage) {
-        page_fault_exceptions =
-            get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->satp, SATP_MODE);
+    } else if (riscv_cpu_is_32bit(env)) {
+        vm = get_field(env->hgatp, SATP32_MODE);
     } else {
-        page_fault_exceptions =
-            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
-            !pmp_violation;
+        vm = get_field(env->hgatp, SATP64_MODE);
     }
+    page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
+
     switch (access_type) {
     case MMU_INST_FETCH:
         if (riscv_cpu_virt_enabled(env) && !first_stage) {
-- 
2.31.1


