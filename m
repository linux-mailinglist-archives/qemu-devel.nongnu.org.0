Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FEC3627D4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:37:10 +0200 (CEST)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTL3-0007Vg-UO
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFQ-0000pD-I0
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:21 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTFM-0003kP-Hj
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:31:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id h20so14445380plr.4
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PozZ71039TN9LB2JM2brlhvpMPxTWKRovHdHzz5gXtI=;
 b=IuTR88XR3vpftP4dIptq38W33dAQacYbX+HAk/7/I54jNYdV6yVJQScUYMVLBoJhFE
 o69k/wfZ5WOiRIUALLZlfrF6M9dTWAolkclGwmpqOKSrWfL/0p2t3T0sLH0zapGebjKk
 BXlNRUsDgGGL8LMW5FlTp3hNLSXCjJEIfNw7kDETAou5vzSWV7N4ixaeJW/7FL1TT1tp
 /5aAGfMEk1yNAXrkEzKjcqbqfsL0LtVUKI+hHVt/bw5JGBYoLQDmmLz/ABJcrGnD4gxU
 70KfjeEOeuvzYL1Vu2FVL6isepwakW+KlsOYpleCCRLRe5SEyBxDWLifSMytO+/U7Kp6
 pSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PozZ71039TN9LB2JM2brlhvpMPxTWKRovHdHzz5gXtI=;
 b=DknfaivgYbDKPYsUUgvsXhZKa+DRON6C2ym+UPKZJ8gMd8PFzjp+gL2sTyJqr/dXyo
 YmjuRyUNgU4dzX4aB6OebOsr0KiWbtk5+87XPv1jr0HTEfx9+fFikbHRICmD/58R3b0x
 RLg8hRR9UDzucyAZ3mZlPWo16TSqVFB+nl6sqoZGZgP0hpQjMHzsjlD6V+CNgDT++afJ
 zxsG7B+B3c0+himfvMrelRgaHzzHER2T8W2gMghplrFoWTyFvCFhg/nTGQRteTHG0V58
 emC652EULqjCbfrbuaBk5Mg269Tu6QOyx3KdmJN6W1zohB7R4+Dz/1f3PD0gfrRDHMyi
 n7xQ==
X-Gm-Message-State: AOAM531BYboUQbjGz4snsHhgs62NILskACPetrAo9Q0Vb8lRTbp0YTrI
 HfIykrK94vTBYAJAYsX7zdQVrPsaqddVhw==
X-Google-Smtp-Source: ABdhPJxq+ORWkt/GpYaUI06jg9inslirNqu2vPBtVa/5k/UdWqEol0G2Inbp6O+Ntua2t2MU9l9Otg==
X-Received: by 2002:a17:902:7249:b029:e9:44dc:61a9 with SMTP id
 c9-20020a1709027249b02900e944dc61a9mr10765075pll.32.1618597874992; 
 Fri, 16 Apr 2021 11:31:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id p18sm3057307pju.3.2021.04.16.11.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:31:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/9] target/arm: Rename mte_probe1 to mte_probe
Date: Fri, 16 Apr 2021 11:31:04 -0700
Message-Id: <20210416183106.1516563-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For consistency with the mte_check1 + mte_checkN merge
to mte_check, rename the probe function as well.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  | 2 +-
 target/arm/mte_helper.c | 6 +++---
 target/arm/sve_helper.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index af1db2cd9c..886db56b58 100644
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
index 161425f208..011a1ffa46 100644
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


