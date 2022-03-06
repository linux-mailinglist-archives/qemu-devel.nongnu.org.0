Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17604CEB9D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:03:52 +0100 (CET)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqYB-0003U2-TW
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:03:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUx-0000Mw-W6
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:33 -0500
Received: from [2a00:1450:4864:20::32e] (port=43836
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUv-0003oP-LA
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so4893725wmq.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hf7bfn2NDQl8QJroqEZfIkgs6K9JXsrKL2jIgOmtsyM=;
 b=Zt7bU7jmOcnTZmCqAb2+FKLzubO65jmE4UIvD3kvF44i4B/udXDxw3yZk5oq8cqY0H
 qPqrw0H/fFfbgaPPOEJFqkFx7r69GeEWSeavch/WQBgoSFEQ8meBuh66mrpQqoDRYcuI
 2CmQiLh+CSH31OCDI7uvoI2lxAfX3x9JUYm1pfsbDMjQgej6lHWNXYbI4e/v6AALV8UT
 0HEIYwXB967Hen10s8CKMWCbVIPafUecFPfbHNMJGwct+/BfqUHQNycOCa3/7W766C4N
 aVo9KPlKEMimcTFfNH3U6bEBK0fXIdlACGn2xYTCS4IUray62aXbM0Zl7DpNMnR49kiz
 n7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hf7bfn2NDQl8QJroqEZfIkgs6K9JXsrKL2jIgOmtsyM=;
 b=Hs26c/M/kq64X+ruIe49+XWBdu7giynoNHN137XKiEZZRKLfBILktWGqKUlOfPUimM
 w6MK2bh/icgi9irXEoU9Xt9KOVTtcCBX1zT+C3Zc4oi/7ANkEFRw1eM2O6aUGw0Yxt+U
 bn8pxFxigLEFeJ2bVEVPIjovlKw0c90cAn9+LzLwonhk7cqce+3LHINrevkk2nPme/DA
 WzRfHRNwbLSs0Fw5SL74XJa6ct+SS22jdQ4gt5wnWO08WgIuxaBRmqNbV+x/hXdP7uEF
 PMcpWgYbHQbg0CxYoeKqTZrcyudmIP5ZclKgFbm+XflNaavZFpUoD4AzP9RcXWBdv8vf
 N1Ig==
X-Gm-Message-State: AOAM53345RFv9KLsHO9lH3Q7nDEMBr9ZDpLSletPMoSAcQpJHaiQ47g6
 PoJTuOP0TIk7mTsCa8QW5LFegIsGeTw=
X-Google-Smtp-Source: ABdhPJyrnhrbi+frsOk5J8cx3URkg4gkRhBaoZ09LHzB2c69ZwSERvmeUs2ZEy5iLUiKJfMW5QNGJg==
X-Received: by 2002:a05:600c:4e94:b0:381:84cf:e9b0 with SMTP id
 f20-20020a05600c4e9400b0038184cfe9b0mr5616215wmq.79.1646571624798; 
 Sun, 06 Mar 2022 05:00:24 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 u15-20020a056000038f00b001f1e57a74e2sm2750597wrf.4.2022.03.06.05.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] exec: Make cpu_memory_rw_debug() target agnostic
Date: Sun,  6 Mar 2022 13:59:31 +0100
Message-Id: <20220306130000.8104-5-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu_memory_rw_debug() is declared in "exec/cpu-all.h" which
contains target-specific declarations. To be able to use it
from target agnostic source, move the declaration to the
generic "exec/cpu-common.h" header.

Replace the target-specific 'target_ulong' type by 'vaddr'
which better reflects the argument type, and is target agnostic.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-5-f4bug@amsat.org>
---
 include/exec/cpu-all.h    | 4 ----
 include/exec/cpu-common.h | 4 ++++
 cpu.c                     | 6 +++---
 softmmu/cpus.c            | 2 +-
 softmmu/physmem.c         | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 84caf5c3d9f..c0f0fab28a1 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -433,10 +433,6 @@ int cpu_exec(CPUState *cpu);
 void tcg_exec_realizefn(CPUState *cpu, Error **errp);
 void tcg_exec_unrealizefn(CPUState *cpu);
 
-/* Returns: 0 on success, -1 on error */
-int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        void *ptr, target_ulong len, bool is_write);
-
 /**
  * cpu_set_cpustate_pointers(cpu)
  * @cpu: The cpu object
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index cd1d7328a1d..8031ebc680c 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -128,6 +128,10 @@ int ram_block_discard_range(RAMBlock *rb, uint64_t start, size_t length);
 
 #endif
 
+/* Returns: 0 on success, -1 on error */
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write);
+
 /* vl.c */
 extern int singlestep;
 
diff --git a/cpu.c b/cpu.c
index 3ea38aea707..d5d4cbf8cb7 100644
--- a/cpu.c
+++ b/cpu.c
@@ -415,11 +415,11 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
 
 /* physical memory access (slow version, mainly for debug) */
 #if defined(CONFIG_USER_ONLY)
-int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        void *ptr, target_ulong len, bool is_write)
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write)
 {
     int flags;
-    target_ulong l, page;
+    vaddr l, page;
     void * p;
     uint8_t *buf = ptr;
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 1681844b61d..3f8fae43ba6 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -33,7 +33,7 @@
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
 #include "sysemu/hw_accel.h"
-#include "exec/exec-all.h"
+#include "exec/cpu-common.h"
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
 #include "sysemu/cpus.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index a13289a594a..cf6b2b48995 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3436,11 +3436,11 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
 #include "memory_ldst.c.inc"
 
 /* virtual memory access for debug (includes writing to ROM) */
-int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
-                        void *ptr, target_ulong len, bool is_write)
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write)
 {
     hwaddr phys_addr;
-    target_ulong l, page;
+    vaddr l, page;
     uint8_t *buf = ptr;
 
     cpu_synchronize_state(cpu);
-- 
2.35.1


