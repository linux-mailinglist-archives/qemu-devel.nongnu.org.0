Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68366063E3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:10:49 +0200 (CEST)
Received: from localhost ([::1]:55782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXC4-0001sC-6I
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:10:48 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX58-0004Rg-Ex
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYm-0001NC-Vg
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYl-00010o-3k
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:04 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b4so34069557wrs.1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2Y3bSS+k3hxoNXq3TTLVfWC/ZQb38/6H9U7Vy8kV6Xg=;
 b=q0I3jrwyL7muOo7IbIEbIU9yUlZ9KK+7K4OFRkQdBDhuc3DUr7y7cYu9jCIDpiim0v
 J2d16tl+ODUBxR3crq7HNxbK3J4phzTquk4LBesyUr7hh0NQq9rFstQI6WEQ69TDvsS5
 pi+YqwS2bB/OEKYLI4nEJCvlFU+52+9Eq8i9JlbJHoZb43ZCxGR5rFg9JQakptBfRWuW
 vj/qDKxs2Wxe5bOv1yFWwupqviSzn1mvdphk6j778VG8hY/E2hzeVADiF1iEaEh+y136
 PlGRBlL0Do303n7XAIwmTe+64Iz8YnCbKxfpw2MgBi9u2KXY1zFyd20y1+FZz6YDPiUt
 JlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Y3bSS+k3hxoNXq3TTLVfWC/ZQb38/6H9U7Vy8kV6Xg=;
 b=3LzIfzKx9dFxt1+xHNFXRksfJCZIyXB9sI5JILWmFZ0O0W7Mxwl2xDsXh8ZvrizX2J
 MLGBQZ/8DYzUj+UuF1pPoA0ee2mc/ua6LEE4m8JN+2KobydxRtVsquN/VJojmLpqDQ52
 733Ffb4Sswa2RmK8kYRbaLyIF6bW1nuLQpc6tqI9lfzjNaNZ5qB/mEF516xU/RnAsLE1
 +gs3/2moAhzyDgAggok2pYK4woWhb3OygU08P3Jt10kvZopVlPaNWpoj8aujlnqfgS4y
 M9s5B4hMZncVnSvvJmWugBA51bQl1FO80c9+OH19YKJwO5q3gtp9koC3sH5o+bJzuU4p
 SDYQ==
X-Gm-Message-State: ACrzQf0xTCOWVqg6safxeWhylWRYUweeSMdJfg89dUEd+Ontdg/3n54U
 U1C7T0ehF2+SU5YuNeMhLj8uB2pzajrZsQ==
X-Google-Smtp-Source: AMsMyM7ja8FsX6H+0EBH8cFlnuaC/foGR1a4wuOSuWWNUO+UNmsgFumkZ3ztG3fVrlzJOycigvqTHA==
X-Received: by 2002:adf:f804:0:b0:22e:5a9a:15d9 with SMTP id
 s4-20020adff804000000b0022e5a9a15d9mr8434197wrp.390.1666268521732; 
 Thu, 20 Oct 2022 05:22:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.22.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:22:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] target/arm: Plumb debug into S1Translate
Date: Thu, 20 Oct 2022 13:21:32 +0100
Message-Id: <20221020122146.3177980-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Before using softmmu page tables for the ptw, plumb down
a debug parameter so that we can query page table entries
from gdbstub without modifying cpu state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221011031911.2408754-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 55 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dee69ee7438..8fa0088d98d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,6 +17,7 @@
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
     bool in_secure;
+    bool in_debug;
     bool out_secure;
     hwaddr out_phys;
 } S1Translate;
@@ -230,6 +231,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         S1Translate s2ptw = {
             .in_mmu_idx = s2_mmu_idx,
             .in_secure = is_secure,
+            .in_debug = ptw->in_debug,
         };
         uint64_t hcr;
         int ret;
@@ -2370,13 +2372,15 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     return 0;
 }
 
-bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
-                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                               bool is_secure, GetPhysAddrResult *result,
-                               ARMMMUFaultInfo *fi)
+static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
+                                      target_ulong address,
+                                      MMUAccessType access_type,
+                                      GetPhysAddrResult *result,
+                                      ARMMMUFaultInfo *fi)
 {
+    ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    S1Translate ptw;
+    bool is_secure = ptw->in_secure;
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2392,8 +2396,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             bool is_el0;
             uint64_t hcr;
 
-            ret = get_phys_addr_with_secure(env, address, access_type,
-                                            s1_mmu_idx, is_secure, result, fi);
+            ptw->in_mmu_idx = s1_mmu_idx;
+            ret = get_phys_addr_with_struct(env, ptw, address, access_type,
+                                            result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2413,9 +2418,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                 s2walk_secure = false;
             }
 
-            ptw.in_mmu_idx =
+            ptw->in_mmu_idx =
                 s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-            ptw.in_secure = s2walk_secure;
+            ptw->in_secure = s2walk_secure;
             is_el0 = mmu_idx == ARMMMUIdx_E10_0;
 
             /*
@@ -2427,7 +2432,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             cacheattrs1 = result->cacheattrs;
             memset(result, 0, sizeof(*result));
 
-            ret = get_phys_addr_lpae(env, &ptw, ipa, access_type,
+            ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
                                      is_el0, result, fi);
             fi->s2addr = ipa;
 
@@ -2534,19 +2539,29 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                       is_secure, result, fi);
     }
 
-    ptw.in_mmu_idx = mmu_idx;
-    ptw.in_secure = is_secure;
-
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, &ptw, address, access_type, false,
+        return get_phys_addr_lpae(env, ptw, address, access_type, false,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return get_phys_addr_v6(env, &ptw, address, access_type, result, fi);
+        return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
-        return get_phys_addr_v5(env, &ptw, address, access_type, result, fi);
+        return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
     }
 }
 
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
+{
+    S1Translate ptw = {
+        .in_mmu_idx = mmu_idx,
+        .in_secure = is_secure,
+    };
+    return get_phys_addr_with_struct(env, &ptw, address, access_type,
+                                     result, fi);
+}
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
@@ -2595,12 +2610,16 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    S1Translate ptw = {
+        .in_mmu_idx = arm_mmu_idx(env),
+        .in_secure = arm_is_secure(env),
+        .in_debug = true,
+    };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
     bool ret;
 
-    ret = get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_struct(env, &ptw, addr, MMU_DATA_LOAD, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
-- 
2.25.1


