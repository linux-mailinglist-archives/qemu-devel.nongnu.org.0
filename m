Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9B59C4FD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:27:08 +0200 (CEST)
Received: from localhost ([::1]:36550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBCd-0007nS-6E
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ll-00008x-Ln
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:25 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LU-0000pc-6U
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x23so10231570pll.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=HtO4LZZP477l4fezaKu9Yh3w9XE4HiCdIKoUptn6t1w=;
 b=v/XqIg3iMI28YOFRjxKs0QoUJ7dJgPOk2cpUbZ/ivo6a6h3EW/2PPQgwQCjex1uWJI
 azxr1CUrYakkECCOCCiHTt+UZ1m8qzES97qGoCTtpTkMwtMmsHE4bxufuSlYxS7Wlmz4
 nzkZM5no2/dNEsykoa2t3oLwfkpB3oyxFRWKA0LJyiKxC9APVcNdUTxZHp3aZYJnPCYe
 zVHuccDt1Ffvlu2H/mdgQJd4AhdeVMPmOYL3iKMGBNTE79i28456JgjclL+t4hoipTHu
 z2JB4nXGRDkJ69q8MJJ8XZnKuFp0oHPzWAbJOb+OXvMxuTV67cKej9MnuY3RUKSYc0h/
 Gtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=HtO4LZZP477l4fezaKu9Yh3w9XE4HiCdIKoUptn6t1w=;
 b=SMYL81vLUQlbjD5TRPtEYma6ZfMQszjXYgZ3BBf5OfNMjjBdnx3B1HtdGsUNHiNBkn
 5mSjbkls8zQHCcI1h/DtNUIn1eotTyxOe6cpzDrZ9esYoCU6A7OPFEsKm7SMz/lBsplr
 K58kgkpT9SsU5gd1Ed/rj/QvSvL1BcjqZzQWLnStzJv2LbiGJBaasz2bIwrB+kFMRu8O
 uEusL2yYqNh7w5tyb5boKEmRZBNnm1NA5NlxLZ/8rrp76MktuW7SgGeHWHm0QU00N9kV
 SFTTo22QhCHUb9zrmCsW8n/4vWUAIoCkfhAEgjf/MEjpm8xlfpoLG2VWXcsoy3e6AaNK
 SNwg==
X-Gm-Message-State: ACgBeo2BVZuaqxWYaqf54LbZ5N4IKTEpSaHuiRlJTUGOWITtc527e5k1
 DAL09e8FRcA6WmEWZe2Iv0Fq/xCZmCymFw==
X-Google-Smtp-Source: AA6agR689/FoxnqzkSQ7b8rAavzlpTrYLRLcCsJ5mbgTFby6pznKGrHy/51GHnn+hpExptJvC/xX7w==
X-Received: by 2002:a17:90b:3b41:b0:1fb:5376:fb06 with SMTP id
 ot1-20020a17090b3b4100b001fb5376fb06mr1590279pjb.240.1661182086809; 
 Mon, 22 Aug 2022 08:28:06 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 30/66] target/arm: Hoist read of *is_secure in
 S1_ptw_translate
Date: Mon, 22 Aug 2022 08:27:05 -0700
Message-Id: <20220822152741.1617527-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Rename the argument to is_secure_ptr, and introduce a
local variable is_secure with the value.  We only write
back to the pointer toward the end of the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7c0a4316a3..dbe5852af6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -207,24 +207,26 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
+                               hwaddr addr, bool *is_secure_ptr,
                                ARMMMUFaultInfo *fi)
 {
+    bool is_secure = *is_secure_ptr;
+
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2, *is_secure)) {
-        ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S
-                                          : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
+                                         : ARMMMUIdx_Stage2;
         GetPhysAddrResult s2 = {};
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 *is_secure, false, &s2, fi);
+                                 is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -237,19 +239,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
 
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+            if (is_secure) {
+                is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+                is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
+            *is_secure_ptr = is_secure;
         } else {
-            assert(!*is_secure);
+            assert(!is_secure);
         }
 
         addr = s2.phys;
-- 
2.34.1


