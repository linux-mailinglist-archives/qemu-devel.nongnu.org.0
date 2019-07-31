Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F67C898
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:26:34 +0200 (CEST)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrQv-0006Y6-EM
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45017)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPg-0004jW-DD
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPf-0000Fh-8f
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:16 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrPf-0000Eo-2W
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:15 -0400
Received: by mail-wr1-x442.google.com with SMTP id p13so70341376wru.10
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xUIrrQym9hhHiF/ew6BTz6jTay6S+r9Vm5o3Xaev8Hs=;
 b=pe5a9RDdmLDJXrO4vomLHcNnwWulzPfhQIU+Vx6E0POxF7lnvb/Ou387A0TG+PVU4+
 DRj0bfJpQ71cW6V8rK0XPJOB0cKb7oLvEw8MXHQyACjIMVWbh/CMEXST0X7NIOmkTXZG
 ck59fQClGudA6f9TnBoQmZTutGPa7JTBQ4ajP1sTlmOs0tjsSNVUglGoLdzDsXNIxWES
 7nE2nYjL7CmrUvzyVq3pXIaQovyuxXy5Z3UT8b1AJ5ksZQxm+Cqc1M37yhU+TOaP+WV1
 W3Gnhl6m8cdl0erAvKk2BLTF2uqNyBkGI1GeLaZZAdmiY3EvcXVyRMt5WIw6wFnNFIwb
 D46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xUIrrQym9hhHiF/ew6BTz6jTay6S+r9Vm5o3Xaev8Hs=;
 b=s35Iwh72qXfFusBXE9lt6ZCIKWxyvC70fBZAZHfpnrPRWiPNgehzqqvBREi1MxPSPK
 JkAyQSeShMnfO0SQ5Ij9XPURAAv14TrhO6FQKtVnfRji4t1XXUNgUus8EnX7TFqgJ89i
 bRvD85M8i36jHoQXNSE29rBQL6zBP2GBhmJd+RDCiX4qH4PkEIK7h/BoGKB4HAv0D11b
 2b7N9iL9TOCbPEFf+7Wq9q8u0yZ+TGNYojENngnTJx+Rs6he6jQWdGPHe4Wro+G3r+TE
 NzrNEvXOX7aaSt7sIjt4Q3+SLHGlP9nGayYzgjgOx0nEGC6T8iLVbEp4AVvlJB84mdit
 53Jw==
X-Gm-Message-State: APjAAAUw048b9gZXNZQpbKKNtNbz+b2uHokW8RqHGXC360tUAuX9oZD4
 JeT5m87it7xvYJqncydlVRWmNg==
X-Google-Smtp-Source: APXvYqwxlB6/H/TsA842jlg4Tulj9fgHDp0BVeGsZR2fhODR2vGXK4+p08LFLaZsFl3ZIc9GG9Ftrw==
X-Received: by 2002:a5d:48cf:: with SMTP id p15mr87208181wrs.151.1564590313855; 
 Wed, 31 Jul 2019 09:25:13 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id f70sm91237513wme.22.2019.07.31.09.25.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:25:12 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0747E1FF9F;
 Wed, 31 Jul 2019 17:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:06:42 +0100
Message-Id: <20190731160719.11396-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v4 17/54] cputlb: document get_page_addr_code
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

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c      |  5 -----
 include/exec/exec-all.h | 24 +++++++++++++++++++++---
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index bffdb251580..a01e04c5416 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1015,11 +1015,6 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
   victim_tlb_hit(env, mmu_idx, index, offsetof(CPUTLBEntry, TY), \
                  (ADDR) & TARGET_PAGE_MASK)
 
-/* NOTE: this function can trigger an exception */
-/* NOTE2: the returned address is not exactly the physical address: it
- * is actually a ram_addr_t (in system mode; the user mode emulation
- * version of this function returns a guest virtual address).
- */
 tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr)
 {
     uintptr_t mmu_idx = cpu_mmu_index(env, true);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 16034ee651e..8b1c3d5b9db 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -480,7 +480,15 @@ void mmap_lock(void);
 void mmap_unlock(void);
 bool have_mmap_lock(void);
 
-static inline tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
+/**
+ * get_page_addr_code() - user-mode version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * Returns @addr.
+ */
+static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
+                                                target_ulong addr)
 {
     return addr;
 }
@@ -488,8 +496,18 @@ static inline tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong
 static inline void mmap_lock(void) {}
 static inline void mmap_unlock(void) {}
 
-/* cputlb.c */
-tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr);
+/**
+ * get_page_addr_code() - full-system version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * If we cannot translate and execute from the entire RAM page, or if
+ * the region is not backed by RAM, returns -1. Otherwise, returns the
+ * ram_addr_t corresponding to the guest code at @addr.
+ *
+ * Note: this function can trigger an exception.
+ */
+tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
 
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
-- 
2.20.1


