Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB53D9ADA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:13:14 +0200 (CEST)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ubp-0007oG-Tc
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCk-0004Rc-Cr
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:18 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCi-0002e6-OS
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:18 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d17so4837567plh.10
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PRWthvJqHxBpL5Udb2FSryhMPHjHKQKgHQUt7Gw5z2E=;
 b=R1oEJEg4tU1C18sbFqLDRHq3hhj5uFeg5Ij2luNxHy99S3IkvQs+42a/O2+5AsAKq0
 B3cUqE5IMEIrIWTyAlWHgRQUhvlsy4zMmfKS84+t1dAXSrkz/+EX+n6pOx9EIMR8b4f8
 oY8w20BvEp8szJWmhMprAwqhwYX8ifLUXvuKHc85WtwIUg8ax7QO6F9VC4xJ0Finp+Pa
 yjQUQlvoIUhkWKjlFBwnlW7AVbNhemQS1bGz/eQaP+XWpokfejQTeNxmcVa64EI6Rzh3
 KnurAj66DC1RpN7eEMT3uKJXnClYgvDsh7nLTvl4lRgpOXG4+GnN5b8KSGkKjhVjqiqR
 LzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PRWthvJqHxBpL5Udb2FSryhMPHjHKQKgHQUt7Gw5z2E=;
 b=Aqs7wd9Rh59P430k/OqXorPf9Bg8W4oNCC1woU+/kketG5hqFQ1BiuWL3yLqXWL/eQ
 ieJ0dfyLaA755Q5er8f4Z2opo0/IPsreuM4BueCvQovddY9A4PNGxst+xfEiKfxS4R/p
 3Grglvr2vaHdh2SzxMyEHPeAsucRiz8WV49e8Rf2CFWCyz4GE0qTZySeyXE+gXaag8k2
 /L86fNQvIQMFUC/tksUXYFTacZZSSc99ueRLcQ0GM8buel1dm1V2CJ7CFhCf8tHcwm8f
 Do5Jrj7eYhsRjiEQyFwSeSdD1DvQ5/Z56yxRjeVDHuCm1ZpBnJhpQXON0XP8iC7kzaEn
 ACyg==
X-Gm-Message-State: AOAM5301OT0Mbl8FnW9AsgxAPqzMF0SHHD0k2loTV+IJ6QuWfA3zbNWF
 tGRm+JxrvwCicaqIawCRRVtSIHC+1FInKA==
X-Google-Smtp-Source: ABdhPJzzybP4ON3X2G8dardSHGrA/PhAWAKcrapY6BlfjCbao+DMPUIHXAwG4prbHpjTgXMDzilsRg==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr2521111pjo.22.1627519635567; 
 Wed, 28 Jul 2021 17:47:15 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 21/43] tcg: Split out MemOpIdx to exec/memopidx.h
Date: Wed, 28 Jul 2021 14:46:25 -1000
Message-Id: <20210729004647.282017-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Move this code from tcg/tcg.h to its own header.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memopidx.h | 55 +++++++++++++++++++++++++++++++++++++++++
 include/tcg/tcg.h       | 39 +----------------------------
 2 files changed, 56 insertions(+), 38 deletions(-)
 create mode 100644 include/exec/memopidx.h

diff --git a/include/exec/memopidx.h b/include/exec/memopidx.h
new file mode 100644
index 0000000000..83bce97874
--- /dev/null
+++ b/include/exec/memopidx.h
@@ -0,0 +1,55 @@
+/*
+ * Combine the MemOp and mmu_idx parameters into a single value.
+ *
+ * Authors:
+ *  Richard Henderson <rth@twiddle.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef EXEC_MEMOPIDX_H
+#define EXEC_MEMOPIDX_H 1
+
+#include "exec/memop.h"
+
+typedef uint32_t MemOpIdx;
+
+/**
+ * make_memop_idx
+ * @op: memory operation
+ * @idx: mmu index
+ *
+ * Encode these values into a single parameter.
+ */
+static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
+{
+#ifdef CONFIG_DEBUG_TCG
+    assert(idx <= 15);
+#endif
+    return (op << 4) | idx;
+}
+
+/**
+ * get_memop
+ * @oi: combined op/idx parameter
+ *
+ * Extract the memory operation from the combined value.
+ */
+static inline MemOp get_memop(MemOpIdx oi)
+{
+    return oi >> 4;
+}
+
+/**
+ * get_mmuidx
+ * @oi: combined op/idx parameter
+ *
+ * Extract the mmu index from the combined value.
+ */
+static inline unsigned get_mmuidx(MemOpIdx oi)
+{
+    return oi & 15;
+}
+
+#endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index f91ebd0743..e67ef34694 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -27,6 +27,7 @@
 
 #include "cpu.h"
 #include "exec/memop.h"
+#include "exec/memopidx.h"
 #include "qemu/bitops.h"
 #include "qemu/plugin.h"
 #include "qemu/queue.h"
@@ -1147,44 +1148,6 @@ static inline size_t tcg_current_code_size(TCGContext *s)
     return tcg_ptr_byte_diff(s->code_ptr, s->code_buf);
 }
 
-/* Combine the MemOp and mmu_idx parameters into a single value.  */
-typedef uint32_t MemOpIdx;
-
-/**
- * make_memop_idx
- * @op: memory operation
- * @idx: mmu index
- *
- * Encode these values into a single parameter.
- */
-static inline MemOpIdx make_memop_idx(MemOp op, unsigned idx)
-{
-    tcg_debug_assert(idx <= 15);
-    return (op << 4) | idx;
-}
-
-/**
- * get_memop
- * @oi: combined op/idx parameter
- *
- * Extract the memory operation from the combined value.
- */
-static inline MemOp get_memop(MemOpIdx oi)
-{
-    return oi >> 4;
-}
-
-/**
- * get_mmuidx
- * @oi: combined op/idx parameter
- *
- * Extract the mmu index from the combined value.
- */
-static inline unsigned get_mmuidx(MemOpIdx oi)
-{
-    return oi & 15;
-}
-
 /**
  * tcg_qemu_tb_exec:
  * @env: pointer to CPUArchState for the CPU
-- 
2.25.1


