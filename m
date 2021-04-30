Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2992436F897
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:42:35 +0200 (CEST)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQbS-0007gO-5f
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTx-0007KJ-Lb
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTv-0001Dh-Ev
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id d4so1560966wru.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rtj3JyD1LQVW/DZxj158TPK3xXuViQZ2hQy3eH6UaFU=;
 b=Nzd6Hj8q7c67MfrXh/L39B5in9WJ0Wit0JVux7pc1jvMsXx2KnGOhEtsuwLWLQxzGL
 h2CtQKLdMCJx98V7pC3KKIsYZqS0mvgaAJ8Ecg9mZ0SH7AXAFShF0Iap8F/Z1glDh+wJ
 mddZGIGJPHLuv3EDKZeV7QmaVuQWb+ZFWKJqY3oyKXpVSg78M3VF+iG0JkipMZZz94+d
 z4yxF1j0MPRygXfE8kbPrMsmAJTOjn99hTsbC7sAlUbEWDF8mjICrXqHaJkpEMd3glEo
 5hbAE4NDUj1LNRJQwIrw6+T1M1pqkbioPLr1nWmHDXojOamGY6rvRvEymFOiUe2nwNKz
 xjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtj3JyD1LQVW/DZxj158TPK3xXuViQZ2hQy3eH6UaFU=;
 b=EXUjqvcsGE9UEUmgfZHoukYp7vobXcWBdM1Jl6ENYL/Z3O6MST9JLZMr1OY8reDHBH
 n+AOH0UhRZSRWUZEYkj9/nvPUwDoDPnCDLlLW+CE0m14xRAbdbApkoGlpqmXCnQOkDES
 /lKeMWD8lA4nJiuzE2tjhiiBEiYPXd/07zHWX2CeZaxsf/YSO++Ik/pMZWwj3NbAhONc
 rg0CUvwZUr9A5eZPCqYK7odQWiSnJCGMleLJS7lqRqEhTNbbyJR8Zze4AszlHMCNi7zH
 2djWhw1WtH5QLyyXiFccIHBvw/g/27H4YDFvegV8jSTi6SEE44hBW5qPZxhUMPmyUpMF
 2qpw==
X-Gm-Message-State: AOAM531yV4tdqDKYWtsmBCI/1l4qZxfyeOsOrSPb6LQDwTyPK4JNK7fv
 T7OOp2EH7AkSqSd9cRQFJB9L/2Zht21jJTEb
X-Google-Smtp-Source: ABdhPJxgmZYzYEbqyFX1abZ3feO4b9gtGcSPfavByhqjEujDz/5KDGHouzYIKRxOTVzOujv6Z7RBgg==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr5832215wrd.367.1619778886167; 
 Fri, 30 Apr 2021 03:34:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/43] target/arm: Rename mte_probe1 to mte_probe
Date: Fri, 30 Apr 2021 11:34:03 +0100
Message-Id: <20210430103437.4140-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

For consistency with the mte_check1 + mte_checkN merge
to mte_check, rename the probe function as well.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416183106.1516563-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h  | 2 +-
 target/arm/mte_helper.c | 6 +++---
 target/arm/sve_helper.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index af1db2cd9c9..886db56b580 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,7 +1145,7 @@ FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
 
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index c91d561ce33..a6fccc6e69e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -121,7 +121,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * exception for inaccessible pages, and resolves the virtual address
      * into the softmmu tlb.
      *
-     * When RA == 0, this is for mte_probe1.  The page is expected to be
+     * When RA == 0, this is for mte_probe.  The page is expected to be
      * valid.  Indicate to probe_access_flags no-fault, then assert that
      * we received a valid page.
      */
@@ -808,12 +808,12 @@ uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 }
 
 /*
- * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
+ * No-fault version of mte_check, to be used by SVE for MemSingleNF.
  * Returns false if the access is Checked and the check failed.  This
  * is only intended to probe the tag -- the validity of the page must
  * be checked beforehand.
  */
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     uint64_t fault;
     int ret = mte_probe_int(env, desc, ptr, 0, &fault);
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b63ddfc7f91..982240d1045 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4869,7 +4869,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Watchpoint hit, see below. */
                 goto do_fault;
             }
-            if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+            if (mtedesc && !mte_probe(env, mtedesc, addr + mem_off)) {
                 goto do_fault;
             }
             /*
@@ -4919,7 +4919,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                      & BP_MEM_READ)) {
                     goto do_fault;
                 }
-                if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+                if (mtedesc && !mte_probe(env, mtedesc, addr + mem_off)) {
                     goto do_fault;
                 }
                 host_fn(vd, reg_off, host + mem_off);
@@ -5588,7 +5588,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 }
                 if (mtedesc &&
                     arm_tlb_mte_tagged(&info.attrs) &&
-                    !mte_probe1(env, mtedesc, addr)) {
+                    !mte_probe(env, mtedesc, addr)) {
                     goto fault;
                 }
 
-- 
2.20.1


