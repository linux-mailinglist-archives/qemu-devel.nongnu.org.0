Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39824AB683
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:24:20 +0100 (CET)
Received: from localhost ([::1]:54898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzJr-0007v7-Ps
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrT-0005oK-2V
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:59 -0500
Received: from [2a00:1450:4864:20::329] (port=53787
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrN-0001sp-5q
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:56 -0500
Received: by mail-wm1-x329.google.com with SMTP id n8so9210141wmk.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jEqv+UBOrkMdjzyf1FqnnCO4wjX7wiLSDLm24owZNXg=;
 b=RSxEy5ld4Gn0mL76cGHPnGI/KAmdbiuoFRSqy0XADud6sC+gIekUTTz3JmDRONRPAY
 STxgTKJqJxbVcfqIR/mCSF9okogGt6JutM3XwXnWL5aH230/fZsHuo8z1pTFyWehYH9I
 Ns+XCj7OHL9gwKv222wYhtqbIK+4IFgOOUEOdGjpF0T903NYRxEoFw1FxIe29qvNeAKa
 k3m7vTARt8WTJ6ELA42RAEgb7SipyX3N4W5m5nHaDMeBGxLvJ3h2B3noar7N1WsjmBGl
 qCEFkwWcIJquRjvGLQqevBbZYfYyCnINBZbbnh7LFXJxW+9Hs8bzvXhPJTCYZk+kQUhc
 hSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jEqv+UBOrkMdjzyf1FqnnCO4wjX7wiLSDLm24owZNXg=;
 b=gBgmTiRUoR4tUEHtg2ffAx2PpXlOFgOEjijZSDNUG4MamFfwAp7TOkKw2VcmuLWP68
 nXe6U6jJMRzBng4Htk3UWh3NIpYe4onrYemVGLdl1SLd3SDE4tbMfHr2VbALyZXjkp3g
 ZBIbH2jPd8aRlHC9In7AO/6+WoG7vXsQBQ4Z32RwSWfRU5mlwgtPZJr0j5sIAX3z1TYT
 SKm3FL0yOrR9dFVQM8yYuA93f91nOYNF1sqgtYrOK78TdVGCuaKWbp5+aHRmywEuMNEV
 nNj8PjZXZe/Tu0XsKhmmON7d9/LSqJ5/Z2AeeFvtWdxa2GLX2TfvcWTvGOCCINqDRq1W
 sHxA==
X-Gm-Message-State: AOAM532n7cO0NOetORRE3lplQkL856DqOWSDBmtB/aNAL8qojnjxvWtx
 dsuJ9gyxTfg8s5FX4gkJOsGQaAwIuZ8=
X-Google-Smtp-Source: ABdhPJwM2MVt3OjOhM+9cdlRx++/MhgBFaJIzGx2BxmzXaHXUNGAxvwH5DRmVB+OeV04+dKhNK8C9Q==
X-Received: by 2002:a05:600c:410b:: with SMTP id
 j11mr107771wmi.110.1644220486674; 
 Sun, 06 Feb 2022 23:54:46 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d7sm11605161wri.117.2022.02.06.23.54.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:46 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 04/21] exec: Make cpu_memory_rw_debug() target agnostic
Date: Mon,  7 Feb 2022 08:54:09 +0100
Message-Id: <20220207075426.81934-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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
---
 cpu.c                     | 6 +++---
 include/exec/cpu-all.h    | 4 ----
 include/exec/cpu-common.h | 4 ++++
 softmmu/cpus.c            | 2 +-
 softmmu/physmem.c         | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/cpu.c b/cpu.c
index 016bf06a1a..97d42b6b2a 100644
--- a/cpu.c
+++ b/cpu.c
@@ -395,11 +395,11 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
 
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
 
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 84caf5c3d9..c0f0fab28a 100644
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
index cd1d7328a1..8031ebc680 100644
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
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23bca46b07..7f15106dd9 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -32,7 +32,7 @@
 #include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
 #include "sysemu/hw_accel.h"
-#include "exec/exec-all.h"
+#include "exec/cpu-common.h"
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
 #include "sysemu/cpus.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dddf70edf5..eb4b3bcae7 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3435,11 +3435,11 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
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
2.34.1


