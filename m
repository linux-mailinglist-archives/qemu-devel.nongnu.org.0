Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C43AE7466
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 16:05:03 +0100 (CET)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP6Zp-0002iW-Ip
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 11:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iP6Uj-0007UJ-J3
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:59:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iP6Ui-00043B-4Q
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:59:45 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51787)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iP6Uh-00042j-UP
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 10:59:44 -0400
Received: by mail-wm1-x341.google.com with SMTP id q70so9832657wme.1
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MG1IpXQvrz4SptVhLZ2ZL/egepQYBWYRd+NyOkeOFrk=;
 b=InAaFjoJ0Df8tu1vuD+ZBd/ql3baejSfDlUFPASBNmVp5ugnlLzyjTrjstCpTgKnRg
 suUsPm8cO4eLOekYsVeEO27o9fDJpFeqSb0IUP+Z0kDyWl7g+Yl6nqd7RG8Y8/REY+73
 6mGVuQwDGqRO1ulZo+s+pxycp2lPXgxvzflA4MsHI7uW0Y2nX5IxIrTgSWKgZVYAUBhQ
 A5QIapzUVANWgUaFq3F1exeqhSxEfl050gstB4AcCWYeqhDuTTDRCUKanHkiI1fsfZr1
 u+FgeRU0PvXi3SMc1mKyNVtb2FwQRbZieDDt8cqfH36FSaWlDBxWd2cEsezsWlRWEMsn
 Ivdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MG1IpXQvrz4SptVhLZ2ZL/egepQYBWYRd+NyOkeOFrk=;
 b=GjmJ+E55n2if/MxpFgG+RUhFxiYe7rehPKsM8ze4sCWzO5jOM8e5bkwklAyWeu++Pn
 dPbRfhyX5oixeJY7h74k34rWspiW/SZwn7AhVJHsU15RSbLfEaUIcL8HY66tPDe9NRVv
 ktxc8AME32BTQW6MLbobFCBwBULO0XoyCAIeakPM+8YUTmIZKk9FkvZO4wRdk3T0zE43
 1Rq1ZbMrgwFWa+2oPdoHZlS/b54nl/wkPNlkytp8TaSLk9LnjBaZ9qShYG0lSoFGH8Uk
 +a0GY4kkNG+v3C0wtL2tJ0aO3mIxqUvbRCnFuYvQnmYjtpA1yQBlWTb12Ov0+8xQst9D
 ikMw==
X-Gm-Message-State: APjAAAWSFDOLiROwklBILtv+QOyyKov3mmAjrE8oAIXvnC+RlKFnvzaV
 tGlETUHZWqAw0qzgQKbpcXvko+4b03xInA==
X-Google-Smtp-Source: APXvYqw4fn15a9WwHYWIMJKRwdSgEuhaDgEooNNu4EWnNNQo5vpRdPmSHuJBvnXLOcN2OVBmr6oAGA==
X-Received: by 2002:a1c:2d4b:: with SMTP id t72mr418413wmt.112.1572274782572; 
 Mon, 28 Oct 2019 07:59:42 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id 143sm14842876wmb.33.2019.10.28.07.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 07:59:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/12] exec: Split out variable page size support to
 exec-vary.c
Date: Mon, 28 Oct 2019 15:59:29 +0100
Message-Id: <20191028145937.10914-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028145937.10914-1-richard.henderson@linaro.org>
References: <20191028145937.10914-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patch will play a trick with "const" that will
confuse the compiler about the uses of target_page_bits
within exec.c.  Moving everything to a new file prevents
this confusion.

No functional change so far.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 Makefile.target       |  2 +-
 include/qemu-common.h |  6 +++++
 exec-vary.c           | 57 +++++++++++++++++++++++++++++++++++++++++++
 exec.c                | 34 --------------------------
 4 files changed, 64 insertions(+), 35 deletions(-)
 create mode 100644 exec-vary.c

diff --git a/Makefile.target b/Makefile.target
index 5e916230c4..ca3d14efe1 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -107,7 +107,7 @@ obj-y += trace/
 
 #########################################################
 # cpu emulator library
-obj-y += exec.o
+obj-y += exec.o exec-vary.o
 obj-y += accel/
 obj-$(CONFIG_TCG) += tcg/tcg.o tcg/tcg-op.o tcg/tcg-op-vec.o tcg/tcg-op-gvec.o
 obj-$(CONFIG_TCG) += tcg/tcg-common.o tcg/optimize.o
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 8d84db90b0..082da59e85 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -74,6 +74,12 @@ void cpu_exec_step_atomic(CPUState *cpu);
  */
 bool set_preferred_target_page_bits(int bits);
 
+/**
+ * finalize_target_page_bits:
+ * Commit the final value set by set_preferred_target_page_bits.
+ */
+void finalize_target_page_bits(void);
+
 /**
  * Sends a (part of) iovec down a socket, yielding when the socket is full, or
  * Receives data into a (part of) iovec from a socket,
diff --git a/exec-vary.c b/exec-vary.c
new file mode 100644
index 0000000000..48c0ab306c
--- /dev/null
+++ b/exec-vary.c
@@ -0,0 +1,57 @@
+/*
+ * Variable page size handling
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "exec/exec-all.h"
+
+#ifdef TARGET_PAGE_BITS_VARY
+int target_page_bits;
+bool target_page_bits_decided;
+#endif
+
+bool set_preferred_target_page_bits(int bits)
+{
+    /*
+     * The target page size is the lowest common denominator for all
+     * the CPUs in the system, so we can only make it smaller, never
+     * larger. And we can't make it smaller once we've committed to
+     * a particular size.
+     */
+#ifdef TARGET_PAGE_BITS_VARY
+    assert(bits >= TARGET_PAGE_BITS_MIN);
+    if (target_page_bits == 0 || target_page_bits > bits) {
+        if (target_page_bits_decided) {
+            return false;
+        }
+        target_page_bits = bits;
+    }
+#endif
+    return true;
+}
+
+void finalize_target_page_bits(void)
+{
+#ifdef TARGET_PAGE_BITS_VARY
+    if (target_page_bits == 0) {
+        target_page_bits = TARGET_PAGE_BITS_MIN;
+    }
+    target_page_bits_decided = true;
+#endif
+}
diff --git a/exec.c b/exec.c
index fb0943cfed..5bf181d23e 100644
--- a/exec.c
+++ b/exec.c
@@ -91,11 +91,6 @@ AddressSpace address_space_memory;
 static MemoryRegion io_mem_unassigned;
 #endif
 
-#ifdef TARGET_PAGE_BITS_VARY
-int target_page_bits;
-bool target_page_bits_decided;
-#endif
-
 CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
 
 /* current CPU in the current thread. It is only valid inside
@@ -109,37 +104,8 @@ int use_icount;
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
 
-bool set_preferred_target_page_bits(int bits)
-{
-    /* The target page size is the lowest common denominator for all
-     * the CPUs in the system, so we can only make it smaller, never
-     * larger. And we can't make it smaller once we've committed to
-     * a particular size.
-     */
-#ifdef TARGET_PAGE_BITS_VARY
-    assert(bits >= TARGET_PAGE_BITS_MIN);
-    if (target_page_bits == 0 || target_page_bits > bits) {
-        if (target_page_bits_decided) {
-            return false;
-        }
-        target_page_bits = bits;
-    }
-#endif
-    return true;
-}
-
 #if !defined(CONFIG_USER_ONLY)
 
-static void finalize_target_page_bits(void)
-{
-#ifdef TARGET_PAGE_BITS_VARY
-    if (target_page_bits == 0) {
-        target_page_bits = TARGET_PAGE_BITS_MIN;
-    }
-    target_page_bits_decided = true;
-#endif
-}
-
 typedef struct PhysPageEntry PhysPageEntry;
 
 struct PhysPageEntry {
-- 
2.17.1


