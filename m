Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03093530E3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:48:42 +0200 (CEST)
Received: from localhost ([::1]:57038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRej-0001D2-UH
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYp-0000bO-9J
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:35 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYn-0007kl-78
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:34 -0400
Received: by mail-pf1-x436.google.com with SMTP id x126so4294086pfc.13
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmiU8Ib3T0VJ88NFYW06+nKZ5vZvzPj9TAT+urDNBUk=;
 b=dB84DUhEYrEhzBua6EDu5w0Keo/gAVc1UUNMC+j1lFI8uojPwzL7qVRoIwx4Sm0V8b
 g8au0EsnBxoysArQ95mz67gCjD0Qt+FRv1DHoTiy2ar1OI6UEETUBb0HA8og2CxRfPaE
 eo6WHr7Hf44KyGx6MABgjMsrK8UbkBcgVBh3YJK+uFx9dlh7DMt/T/ejmxniEg/wyCOY
 cDGNVCzzksL1Ffl4JYir1QO6r7gr0+v0aSteRMfj4zbibUjh71ISxuNfZDX8eo9HHiLz
 AOw2ppvXU6VTF5UOLRzNfZwHcSHocvr8gNNFN4qr+uLE0wOa5dr50CZVaMIkgbGULagk
 W+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmiU8Ib3T0VJ88NFYW06+nKZ5vZvzPj9TAT+urDNBUk=;
 b=mrdCW/4CF1tMjrNmSAqml9S0JfEp2yhXPQI7DW1s8rnUsR1rj4+8zQ/iabjubEP6KS
 GLxIqEiRaKtYPryND8nGZwHyRmQ0x19dEujGGueWJMZ2U9MdNg4B/G1bnJkppe5gyGpt
 56ZdELed4LNpYBWYRw/p6kzKmH5VMP8UqFcOOwufbshGofE3OoiFWEU0Eo/hrxVFhkB8
 1X0apDb1biEH4HlHaxLBhvYSV3bszSpzVoWU2f6LoBntcPGj9enseJQ/mV5Qmm6Ca40s
 bc+b09G7y+FH0lFcs82lo7o22KA61GMgbvXueOy8zseIly2+9S6ZWcYAKUTwd5P7XqMo
 HeLg==
X-Gm-Message-State: AOAM531oAJrKUchN27wzxCzpeoedDx5Ugtdogobu0+7XNFCltFNFxlgb
 dCo/Y4zmV0kYcA90hVTyXRewHfUeyGYMDA==
X-Google-Smtp-Source: ABdhPJxceLnvU3HqQ1gvzQ3GlWEihYdibTkjnNp1Wb6E60SyH6JlodS8uW8Xr/jqwsZTsSE6nlsugg==
X-Received: by 2002:aa7:96cc:0:b029:202:6873:8ab4 with SMTP id
 h12-20020aa796cc0000b029020268738ab4mr13744044pfq.42.1617399751811; 
 Fri, 02 Apr 2021 14:42:31 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/11] target/arm: Rename mte_probe1 to mte_probe
Date: Fri,  2 Apr 2021 14:42:15 -0700
Message-Id: <20210402214217.422585-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For consistency with the mte_check1 + mte_checkN merge
to mte_check, rename the probe function as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  | 2 +-
 target/arm/mte_helper.c | 6 +++---
 target/arm/sve_helper.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 34df5acda1..f59490c3fc 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1144,7 +1144,7 @@ FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, SIZEM1, 12, 10)  /* size - 1 */
 
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 41e0e57e1a..b17c7e9f3b 100644
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
index b63ddfc7f9..982240d104 100644
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
2.25.1


