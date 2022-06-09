Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9225448AD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:23:45 +0200 (CEST)
Received: from localhost ([::1]:41580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFKG-0005oa-76
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7R-0001ZG-BK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:22 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7P-00062j-Aa
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id o8so3625311wro.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vtklS/jBlWBBb7I5PQy1NemEL8fX7OtzLyw/Jsz+ozc=;
 b=zOs2w1fq0As+FV5dDTJAxBjv5Jv8AqWDwM0JCrfvo4voWsKiQE9oT281dhoO4Ysevn
 Gxp3sQ55J70+EQtksSnBfRBnIFdK8ZBqLANhaW60fHcy7DQwX3NdXAmPvRpdfVagnv+K
 56UINMHkNh7o+Er0DXHfzcOmhoNoWlkxZ84uhqK/nL6qlj4EqroHl995vuZhF+y1ANgf
 wi75YBYK6JU2RI38JwYGNxrjeXr0WWJmj9QgV8FyBFXdfs6cv8meyJvNdff4EXk/b37F
 D2yxhpzyOKWnjOhTIh+AmkGR26UREbIr1X0ik/Kk5EjjclHALfqCTxf6KE5d51vm/rde
 d6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtklS/jBlWBBb7I5PQy1NemEL8fX7OtzLyw/Jsz+ozc=;
 b=kAj0uBSrldl7pxqI7ryxpoaX05brkEGNvsUqCRW0gUo4tVkiRt2fbstbFOnfb+QUZ1
 jnCXIF4kqrglxfxAUfWm8FCFV1m97KMJzWQ826aMf5Tvxx/VtZKX6mW0P/+iMbhX3eRD
 eS8fQGYOYgu2NWf69n8eLIH9gy6yP7h9i5Lhx3KLi7G2TKrXZpEiNoyA5y732V8R4mpO
 Y6G+bjLKCQZ+SAeIJ0MOWoa4tsRY+FcXNmvwAdcxmKPDjnMO1wBp5O7CNK9qpN3VddaW
 thnyV4Za7lxMpktkxxOQSo6jHMa2FoVz0or9fE4H8A19ibdaSTpwT8sI5AQO48LoF4PT
 YpIg==
X-Gm-Message-State: AOAM5323y/Xrvg05hxiLhHcvakrj3JNS2FEkxjykJH2IqD3O0y6tbcaE
 ZefoU2qweNbVZ9awFr+9BTOV3YfDlIamVQ==
X-Google-Smtp-Source: ABdhPJywPfgSq4Es/es1yup3rgJ8DtgqMQM5rABYc94tQNp+MMutvNszzaIZqvXbjIVZ65D4KanDaA==
X-Received: by 2002:a5d:5222:0:b0:213:b7f7:58fe with SMTP id
 i2-20020a5d5222000000b00213b7f758femr31628350wra.620.1654765578602; 
 Thu, 09 Jun 2022 02:06:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/55] target/arm: Pass CPUARMState to arm_ld[lq]_ptw
Date: Thu,  9 Jun 2022 10:05:17 +0100
Message-Id: <20220609090537.1971756-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The use of ARM_CPU to recover env from cs calls
object_class_dynamic_cast, which shows up on the profile.
This is pointless, because all callers already have env, and
the reverse operation, env_cpu, is only pointer arithmetic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-29-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 49e9a1d108e..4d97a248084 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -241,11 +241,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
@@ -270,11 +269,10 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
@@ -409,7 +407,6 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              target_ulong *page_size,
                              ARMMMUFaultInfo *fi)
 {
-    CPUState *cs = env_cpu(env);
     int level = 1;
     uint32_t table;
     uint32_t desc;
@@ -427,7 +424,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                        mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
@@ -466,7 +463,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                            mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
@@ -531,7 +528,6 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                              target_ulong *page_size, ARMMMUFaultInfo *fi)
 {
-    CPUState *cs = env_cpu(env);
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
     uint32_t table;
@@ -553,7 +549,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                        mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
@@ -607,7 +603,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                            mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
@@ -973,7 +969,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
     /* Read an LPAE long-descriptor translation table. */
     ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
@@ -1196,7 +1191,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.25.1


