Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8172E44C6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 09:45:36 +0200 (CEST)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNuHu-0005Hy-II
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 03:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtWe-0003aK-DQ
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iNtWd-0007nl-00
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:56:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:50925)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iNtWc-0007nD-Q6
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 02:56:42 -0400
Received: by mail-wm1-x329.google.com with SMTP id 11so816786wmk.0
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3XXJ55rizfMHVWoEJhJkoN6kRNivslxLA8FD/i7sBTY=;
 b=FaFhvQ/enAlj+6/0IvcSBmfqTXmTymOIKmSBTlm1ijCY4WQHLpTPp69ahLvxk//dtB
 gR+xCBSBqy2oiYbuEtxlygsiX/zQB5zFcnue1mwxdLKxCcBw3UUnQ6ZXkmaQm+fE0Ye8
 L1wG5d9s0ZPDukEQqn/dZem9GpJF8M+8UEoERfKmKPOAbo+Lx1zNHOhnfguYCWYtbHJT
 vOCOiRX69aOEhyHlXbOIgBLYXEa7GCGrBgW52MIjOjz6g7Z/ZHRdjQwxCwYvx2NEdnVj
 Q88IYpZZHzJRiWVYt0uSpu55kI3I1QRExt3IPFyHzloZo3OifbjbvTBgFmpV5vPdxi7t
 0UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3XXJ55rizfMHVWoEJhJkoN6kRNivslxLA8FD/i7sBTY=;
 b=HMNIIGTm0yh65DHenfXtHUphKPqQwuwfASrU4z0DHFi59DG6JXHYK9/TF8NArPH+G0
 bUOPPUhIycoiB6Mnj8cax38brPfZDOTR6q2HA94hSFvU2G4Y5lzy/fxl+yCQktPP6gem
 82O4rsiaSW6cIR0pesPSpmVL3KXui8uVEBMBJh0mcWAafH4KKXKiyxbr/Val80/bAiHA
 Uhk0lwfaDxtR69m+YnC5e96YO8igi52860ZXIcjd8/4vJAG7eW8LLJD0JV/rbfSLDl49
 adF24/xY571J21pMqKeQaumN+Id+PByXUURWjTrPOB1umI/4cbp8f01CKEhQAtg3KnbZ
 sfaw==
X-Gm-Message-State: APjAAAUPWj3BlvHZdiCto9KK5injMyUMv5NpnGlmHgJZU2XQNXaS398j
 B6dhhqQypFYxjTCXj4VJEtIM6g==
X-Google-Smtp-Source: APXvYqzmQcVrKY6vKZnFo9/r06yac/NhQotDrcTMaqZdeesQf1ipbzaYutjPinRGrY6/Kj1obAPgHA==
X-Received: by 2002:a1c:2344:: with SMTP id j65mr2052716wmj.38.1571986601666; 
 Thu, 24 Oct 2019 23:56:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o18sm1632403wrm.11.2019.10.24.23.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 23:56:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4428E1FFB3;
 Fri, 25 Oct 2019 07:37:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 27/73] cputlb: introduce get_page_addr_code_hostp
Date: Fri, 25 Oct 2019 07:36:27 +0100
Message-Id: <20191025063713.23374-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025063713.23374-1-alex.bennee@linaro.org>
References: <20191025063713.23374-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G. Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

This will be used by plugins to get the host address
of instructions.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a8f90695823..82a5783a2bc 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1051,7 +1051,8 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
  * NOTE: This function will trigger an exception if the page is
  * not executable.
  */
-tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp)
 {
     uintptr_t mmu_idx = cpu_mmu_index(env, true);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1077,13 +1078,24 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
 
     if (unlikely(entry->addr_code & TLB_MMIO)) {
         /* The region is not backed by RAM.  */
+        if (hostp) {
+            *hostp = NULL;
+        }
         return -1;
     }
 
     p = (void *)((uintptr_t)addr + entry->addend);
+    if (hostp) {
+        *hostp = p;
+    }
     return qemu_ram_addr_from_host_nofail(p);
 }
 
+tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
+{
+    return get_page_addr_code_hostp(env, addr, NULL);
+}
+
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
                            CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
 {
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e4206cb1735..eadcf29d0c4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -22,6 +22,7 @@
 
 #include "cpu.h"
 #include "exec/tb-context.h"
+#include "exec/cpu_ldst.h"
 #include "sysemu/cpus.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
@@ -516,6 +517,26 @@ static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
 {
     return addr;
 }
+
+/**
+ * get_page_addr_code_hostp() - user-mode version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * Returns @addr.
+ *
+ * If @hostp is non-NULL, sets *@hostp to the host address where @addr's content
+ * is kept.
+ */
+static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
+                                                      target_ulong addr,
+                                                      void **hostp)
+{
+    if (hostp) {
+        *hostp = g2h(addr);
+    }
+    return addr;
+}
 #else
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
@@ -533,6 +554,23 @@ static inline void mmap_unlock(void) {}
  */
 tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
 
+/**
+ * get_page_addr_code_hostp() - full-system version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * See get_page_addr_code() (full-system version) for documentation on the
+ * return value.
+ *
+ * Sets *@hostp (when @hostp is non-NULL) as follows.
+ * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
+ * to the host address where @addr's content is kept.
+ *
+ * Note: this function can trigger an exception.
+ */
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp);
+
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
-- 
2.20.1


