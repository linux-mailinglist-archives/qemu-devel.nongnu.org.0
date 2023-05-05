Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDDF6F7A83
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujwj-00024c-LO; Thu, 04 May 2023 21:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvU-00014j-JH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:01 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvR-00087F-3A
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:59 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-517bdc9e81dso565460a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248875; x=1685840875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0bxKSCSa5QVRZAElH/ASf7kECM7kPPJ9uPPjJAQxQU=;
 b=Acozb0kyBipjhCMhrtCO+BYM5SdUNi8qHPnn1w5qr05MbUJ3kAz/V1ZKO0FijJvxeH
 3ZGQT3y/Fp/3srsbecWlSLQH0iy/EcToGNm4yzANIBuf/NZnMvPNFO7n6MSmC07MbFJn
 TKv86JJqL46yTZyV2GrLU7Uax76D0jb71nKbzkoRUW6J5aABo3p3Nqb/H+4kYVWGTjYX
 w5HDu3wTNpyRNof50I5hXbW3V3BdVdXGVjAkak9bauRx8V1J9aflQteDWuvPwvlpBPVN
 iCArQessLBOnnhj09+NigXsyKAN7BHI1qa2MjHIa4AcveMsvb04CzkgW1agrGJyV8lls
 dN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248875; x=1685840875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0bxKSCSa5QVRZAElH/ASf7kECM7kPPJ9uPPjJAQxQU=;
 b=GSNJlUumpzCYM8Hyo6LhmF+yQ2ZKZQgBsOQ9hv7+xcrfGBrPaiHd5xdO+PpzVR3dgV
 8B/+LAx46Rr+JkUNqNenva+xR5Tqz+8SX8zbEhKAkMP3iKOX4HiL9q9rz8Zefs4S39Mi
 4f6pRsiH/YkwujcfJjk8VVyDglE3zJx+ahfWDJQFaLx+k/pSPrPitCZ5mV9Q8ouV22wn
 6ruI1+wgaT5Sb04jdgXGxI8XHTf7lfXL+rAmfrVn/JBcC1ChM9VIwHovCBuOVlcjX7WY
 GSoNdLeRtk16Njcn7ZPED3m64naL86LYnmbXtWQuZPYm4qCtj9UmKArn7C7LllLIgxGT
 Isuw==
X-Gm-Message-State: AC+VfDzwJwiNGZJxTSJbrjiuQkzqe7KSHkLoOocI+yrVqWDwWF0+GJL/
 Cjk8mseoK45oeNcNfVh+SGqsn80aZbbkEw==
X-Google-Smtp-Source: ACHHUZ4tS5bp+ZjAGi0DKQYnJsrsCcvBr17y0eNSPZNuLvA2TR+CjYiNyyHKgvTgoPwpNBr560N/BA==
X-Received: by 2002:a17:903:22c9:b0:1aa:cf25:41d0 with SMTP id
 y9-20020a17090322c900b001aacf2541d0mr7640007plg.33.1683248875096; 
 Thu, 04 May 2023 18:07:55 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:54 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 80/89] target/riscv: Reorg access check in get_physical_address
Date: Fri,  5 May 2023 11:02:32 +1000
Message-Id: <20230505010241.21812-81-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

We were effectively computing the protection bits twice,
once while performing access checks and once while returning
the valid bits to the caller.  Reorg so we do this once.

Move the computation of mxr close to its single use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-25-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-25-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 69 ++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c7c384bae3..7849e18554 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -747,7 +747,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
-                                int *prot, vaddr addr,
+                                int *ret_prot, vaddr addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
                                 bool first_stage, bool two_stage,
@@ -779,20 +779,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
         *physical = addr;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
 
-    *prot = 0;
+    *ret_prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
-
-    if (first_stage == true) {
-        mxr = get_field(env->mstatus, MSTATUS_MXR);
-    } else {
-        mxr = get_field(env->vsstatus, MSTATUS_MXR);
-    }
+    int levels, ptidxbits, ptesize, vm, sum, widened;
 
     if (first_stage == true) {
         if (use_background) {
@@ -835,7 +829,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
       levels = 5; ptidxbits = 9; ptesize = 8; break;
     case VM_1_10_MBARE:
         *physical = addr;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     default:
       g_assert_not_reached();
@@ -970,6 +964,27 @@ restart:
         return TRANSLATE_FAIL;
     }
 
+    int prot = 0;
+    if (pte & PTE_R) {
+        prot |= PAGE_READ;
+    }
+    if (pte & PTE_W) {
+        prot |= PAGE_WRITE;
+    }
+    if (pte & PTE_X) {
+        bool mxr;
+
+        if (first_stage == true) {
+            mxr = get_field(env->mstatus, MSTATUS_MXR);
+        } else {
+            mxr = get_field(env->vsstatus, MSTATUS_MXR);
+        }
+        if (mxr) {
+            prot |= PAGE_READ;
+        }
+        prot |= PAGE_EXEC;
+    }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
@@ -982,17 +997,9 @@ restart:
         /* Supervisor PTE flags when not S mode */
         return TRANSLATE_FAIL;
     }
-    if (access_type == MMU_DATA_LOAD &&
-        !((pte & PTE_R) || ((pte & PTE_X) && mxr))) {
-        /* Read access check failed */
-        return TRANSLATE_FAIL;
-    }
-    if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
-        /* Write access check failed */
-        return TRANSLATE_FAIL;
-    }
-    if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
-        /* Fetch access check failed */
+
+    if (!((prot >> access_type) & 1)) {
+        /* Access check failed */
         return TRANSLATE_FAIL;
     }
 
@@ -1057,20 +1064,16 @@ restart:
                   (vpn & (((target_ulong)1 << ptshift) - 1))
                  ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
 
-    /* set permissions on the TLB entry */
-    if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
-        *prot |= PAGE_READ;
-    }
-    if (pte & PTE_X) {
-        *prot |= PAGE_EXEC;
-    }
     /*
-     * Add write permission on stores or if the page is already dirty,
-     * so that we TLB miss on later writes to update the dirty bit.
+     * Remove write permission unless this is a store, or the page is
+     * already dirty, so that we TLB miss on later writes to update
+     * the dirty bit.
      */
-    if ((pte & PTE_W) && (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
-        *prot |= PAGE_WRITE;
+    if (access_type != MMU_DATA_STORE && !(pte & PTE_D)) {
+        prot &= ~PAGE_WRITE;
     }
+    *ret_prot = prot;
+
     return TRANSLATE_SUCCESS;
 }
 
-- 
2.40.0


