Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E751C7C87C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:22:49 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrNJ-000577-4J
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrG8-0005yR-6z
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrG6-0004AM-9U
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:15:24 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40592)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrG6-00048u-0f
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:15:22 -0400
Received: by mail-wr1-x442.google.com with SMTP id r1so70310838wrl.7
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNk53UNeX1NNAe+JEukLVQQBwgjFTkD+CslUIM9XJKY=;
 b=CriTWfqh07MbCdF67DxGcRMN6e7Kn9RZy1Mr3l+QOXfFRamsvzGk5h1DluzoWOJJTh
 Iipcr4LvGa61bd5NstOSXzLny956jJg8TCfj2Q3F1qVPZhh07YxJT4lij3CJMkHMUmfh
 VwOf0zZc5DPJghjCbEXz8kynKjzXoK4uSxk0vnqMGOI/3IjP/NkNgkToa5y791XNfGDa
 7t4lWxMk5lgxeK3Z8k4/oliGCFB5SZ6z7oAfpFEXoJWuLRSn/qzFwghvqirRJLcQS0Lp
 bBjzJaaYOukVi0gkCcgKSYOccLz83aZVQdulmN77Tu/r9TnjEGufc+fL52djck+3XPpD
 A1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNk53UNeX1NNAe+JEukLVQQBwgjFTkD+CslUIM9XJKY=;
 b=TiHL/CsWtWroRq9YM8o6ZiWt0dsAZ6ejCS5TGtqcXOZOgus8o/4EHwA9ujHDnPCu82
 lPHb0m3RVH4mr+csOl32wpLphuIzk1nSClsxIqQpcyjEWO6o/cdADc3SBAsR59qAeZjn
 C6eTya52kxxyepuM+eA8dUxSZTX5dJGXI/BDLLD3yX5+UkoS6vhRkckjmhmvw30mwheC
 pJTHLgR6I0NGlM5oN3ETITjx5uaPFC3jM1bvLZO2+4Y2lkvKVIWXG1y90VmPKvsyPPge
 HLtEnegtvRkIPDGpe7hONWy+KDtDEupWlsnNOzBEjDVXr63LefPZY5fNMv9l3BvcRbZb
 E35A==
X-Gm-Message-State: APjAAAWaFI5m1aHInmr/wTupo/NpxzbBccAXJ+DoZGv3Fr5Y9AtchIa6
 JYU8v0hjYl+ADAfd1US9iDwsnQ==
X-Google-Smtp-Source: APXvYqwEL+HRYl+to53QdI3zzo4Ve/gImLgw1E+ljn4uESILli2/kXFGrrxyMKNO597m9WFExR241Q==
X-Received: by 2002:a5d:680d:: with SMTP id
 w13mr137497767wru.141.1564589720861; 
 Wed, 31 Jul 2019 09:15:20 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id w67sm89738808wma.24.2019.07.31.09.15.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:15:17 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C5C71FFA3;
 Wed, 31 Jul 2019 17:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:06:43 +0100
Message-Id: <20190731160719.11396-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v4 18/54] cputlb: introduce
 get_page_addr_code_hostp
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
Cc: aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, bobby.prani@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

This will be used by plugins to get the host address
of instructions.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c      | 14 +++++++++++++-
 include/exec/exec-all.h | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a01e04c5416..21ba71ea9dd 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1015,7 +1015,8 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
   victim_tlb_hit(env, mmu_idx, index, offsetof(CPUTLBEntry, TY), \
                  (ADDR) & TARGET_PAGE_MASK)
 
-tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp)
 {
     uintptr_t mmu_idx = cpu_mmu_index(env, true);
     uintptr_t index = tlb_index(env, mmu_idx, addr);
@@ -1040,13 +1041,24 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
          *    than a target page, so we must redo the MMU check every insn
          *  - TLB_MMIO: region is not backed by RAM
          */
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
 /* Probe for whether the specified guest write access is permitted.
  * If it is not permitted then an exception will be taken in the same
  * way as if this were a real write access (and we will not return).
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 8b1c3d5b9db..90045e77c1f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,6 +21,7 @@
 #define EXEC_ALL_H
 
 #include "exec/tb-context.h"
+#include "exec/cpu_ldst.h"
 #include "sysemu/cpus.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
@@ -492,6 +493,26 @@ static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
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
@@ -509,6 +530,23 @@ static inline void mmap_unlock(void) {}
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


