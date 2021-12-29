Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4594815F5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 18:57:16 +0100 (CET)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2dCM-0005BD-TK
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 12:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n2d8S-0001Kl-9X
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 12:53:12 -0500
Received: from [2a00:1450:4864:20::142] (port=33739
 helo=mail-lf1-x142.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n2d8O-0005jM-IG
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 12:53:11 -0500
Received: by mail-lf1-x142.google.com with SMTP id k21so49610945lfu.0
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 09:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=riBVAdahOh471qHDokINOcrL7d+ZO77k+Ex3yGKqQZc=;
 b=gT9JDDEC1jauZ+g8NHmC/9Remy/0f5iLyT66CbTJHz1MURWrl+Z68hkgXc3RBRVmMu
 nHB11ITpMhduV1Z2GJblpqjvwHj46EeZXit/KCc/VvKoCdqJwn7uvqMOodQffyuYJvPU
 9ce18MIyCD88t86j73xGAQKRNjkdb5W9kXx65XqYj+IkHosC1vX0GnkPjSLqi4z4PQjZ
 3N4TnNBMCRk2wKcuythdkziJgfS1wLpX8t37zGyAXEY86z8GELqVYBiOAKWRZYXTecu/
 tBtAA7FpcUkVB5viRkf/iqeW0O5wWCt20dXW4yCnJKF/H7RGhKjYJ++XWbgutlWhkb99
 Es4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=riBVAdahOh471qHDokINOcrL7d+ZO77k+Ex3yGKqQZc=;
 b=Giqn+9pxMskLD7wOSmBZE5Ce7RWpkOvV8FWhuQRz8sAi6e3x+SjtzFExV5/JZWbhuw
 ijFG0WiDDdRKrAmUZLrCzHf8Vi8cF1PipDdw5UQgdQfSz3HW6OcVLOVwxZPVnNEQO065
 Vkxqowwtip2IXkjMdOFahU7YfRT1Q1gDtLCNuqID8FkO+J1HPC+3XhD6aOpk2zS/QA85
 TJNlRoT7xARzO1fbEEnDq2qONBnBdFxC/g+foxvHmQLHAoVw4LA11Mn2Sn/wEqDa6T0J
 tok0Jus6dFe1ECivED1c1nKWeS6xv0TqwUY7tYSLQw3/gD3cmaiPSAY5V2CFnvfcLxSd
 eBZw==
X-Gm-Message-State: AOAM532Ppw1cWXsQq9cSO9k0OpkkYGzuj7ZDjDXJrGaQqPzhmvmjkPA3
 VJsXbdpin9kYbInq/G4wvN3kcCdpy6bwznJv
X-Google-Smtp-Source: ABdhPJwB0q8NqkNr1nH6f6+VCbjh/jD/YeAYBJJdojeSRA2Le/CMdhdhXGGH2B8yW3X05Huidt3+/A==
X-Received: by 2002:ac2:4ace:: with SMTP id m14mr24605895lfp.312.1640800386744; 
 Wed, 29 Dec 2021 09:53:06 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id s19sm2265123lfi.263.2021.12.29.09.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 09:53:06 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, qemu-devel@nongnu.org
Subject: [PATCH 2/2] dump/win_dump: add 32-bit guest Windows support
Date: Wed, 29 Dec 2021 20:52:55 +0300
Message-Id: <20211229175255.133073-3-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229175255.133073-1-viktor.prutyanov@phystech.edu>
References: <20211229175255.133073-1-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::142
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x142.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before this patch, 'dump-guest-memory -w' was accepting only 64-bit
dump header provided by guest through vmcoreinfo and thus was unable
to produce 32-bit guest Windows dump. So, add 32-bit guest Windows
dumping support.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 dump/win_dump.c | 293 ++++++++++++++++++++++++++++++------------------
 hmp-commands.hx |   2 +-
 2 files changed, 186 insertions(+), 109 deletions(-)

diff --git a/dump/win_dump.c b/dump/win_dump.c
index c5eb5a9aac..98d3c82078 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -24,11 +24,25 @@
 #include "hw/misc/vmcoreinfo.h"
 #include "win_dump.h"
 
-static size_t write_run(WinDumpPhyMemRun64 *run, int fd, Error **errp)
+#define WIN_DUMP_PTR_SIZE (x64 ? sizeof(uint64_t) : sizeof(uint32_t))
+
+#define _WIN_DUMP_FIELD(f) (x64 ? h->x64.f : h->x32.f)
+#define WIN_DUMP_FIELD(field) _WIN_DUMP_FIELD(field)
+
+#define _WIN_DUMP_FIELD_PTR(f) (x64 ? (void *)&h->x64.f : (void *)&h->x32.f)
+#define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)
+
+#define _WIN_DUMP_FIELD_SIZE(f) (x64 ? sizeof(h->x64.f) : sizeof(h->x32.f))
+#define WIN_DUMP_FIELD_SIZE(field) _WIN_DUMP_FIELD_SIZE(field)
+
+#define WIN_DUMP_CTX_SIZE (x64 ? sizeof(WinContext64) : sizeof(WinContext32))
+
+static size_t write_run(uint64_t base_page, uint64_t page_count,
+        int fd, Error **errp)
 {
     void *buf;
-    uint64_t addr = run->BasePage << TARGET_PAGE_BITS;
-    uint64_t size = run->PageCount << TARGET_PAGE_BITS;
+    uint64_t addr = base_page << TARGET_PAGE_BITS;
+    uint64_t size = page_count << TARGET_PAGE_BITS;
     uint64_t len, l;
     size_t total = 0;
 
@@ -57,15 +71,16 @@ static size_t write_run(WinDumpPhyMemRun64 *run, int fd, Error **errp)
     return total;
 }
 
-static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
+static void write_runs(DumpState *s, WinDumpHeader *h, bool x64, Error **errp)
 {
-    WinDumpPhyMemDesc64 *desc = &h->PhysicalMemoryBlock;
-    WinDumpPhyMemRun64 *run = desc->Run;
+    uint64_t BasePage, PageCount;
     Error *local_err = NULL;
     int i;
 
-    for (i = 0; i < desc->NumberOfRuns; i++) {
-        s->written_size += write_run(run + i, s->fd, &local_err);
+    for (i = 0; i < WIN_DUMP_FIELD(PhysicalMemoryBlock.NumberOfRuns); i++) {
+        BasePage = WIN_DUMP_FIELD(PhysicalMemoryBlock.Run[i].BasePage);
+        PageCount = WIN_DUMP_FIELD(PhysicalMemoryBlock.Run[i].PageCount);
+        s->written_size += write_run(BasePage, PageCount, s->fd, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -73,30 +88,45 @@ static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
     }
 }
 
-static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
+static int cpu_read_ptr(bool x64, CPUState *cpu, uint64_t addr, uint64_t *ptr)
+{
+    int ret;
+    uint32_t ptr32;
+    uint64_t ptr64;
+
+    ret = cpu_memory_rw_debug(cpu, addr, x64 ? (void *)&ptr64 : (void *)&ptr32,
+            WIN_DUMP_PTR_SIZE, 0);
+
+    *ptr = x64 ? ptr64 : ptr32;
+
+    return ret;
+}
+
+static void patch_mm_pfn_database(WinDumpHeader *h, bool x64, Error **errp)
 {
     if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_MM_PFN_DATABASE_OFFSET64,
-            (uint8_t *)&h->PfnDatabase, sizeof(h->PfnDatabase), 0)) {
+            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_MM_PFN_DATABASE_OFFSET,
+            WIN_DUMP_FIELD_PTR(PfnDatabase),
+            WIN_DUMP_FIELD_SIZE(PfnDatabase), 0)) {
         error_setg(errp, "win-dump: failed to read MmPfnDatabase");
         return;
     }
 }
 
-static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
+static void patch_bugcheck_data(WinDumpHeader *h, bool x64, Error **errp)
 {
     uint64_t KiBugcheckData;
 
-    if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_KI_BUGCHECK_DATA_OFFSET64,
-            (uint8_t *)&KiBugcheckData, sizeof(KiBugcheckData), 0)) {
+    if (cpu_read_ptr(x64, first_cpu,
+            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_KI_BUGCHECK_DATA_OFFSET,
+            &KiBugcheckData)) {
         error_setg(errp, "win-dump: failed to read KiBugcheckData");
         return;
     }
 
-    if (cpu_memory_rw_debug(first_cpu,
-            KiBugcheckData,
-            h->BugcheckData, sizeof(h->BugcheckData), 0)) {
+    if (cpu_memory_rw_debug(first_cpu, KiBugcheckData,
+            WIN_DUMP_FIELD(BugcheckData),
+            WIN_DUMP_FIELD_SIZE(BugcheckData), 0)) {
         error_setg(errp, "win-dump: failed to read bugcheck data");
         return;
     }
@@ -105,38 +135,42 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
      * If BugcheckCode wasn't saved, we consider guest OS as alive.
      */
 
-    if (!h->BugcheckCode) {
-        h->BugcheckCode = LIVE_SYSTEM_DUMP;
+    if (!WIN_DUMP_FIELD(BugcheckCode)) {
+        *(uint32_t *)WIN_DUMP_FIELD_PTR(BugcheckCode) = LIVE_SYSTEM_DUMP;
     }
 }
 
 /*
  * This routine tries to correct mistakes in crashdump header.
  */
-static void patch_header(WinDumpHeader64 *h)
+static void patch_header(WinDumpHeader *h, bool x64)
 {
     Error *local_err = NULL;
 
-    h->RequiredDumpSpace = sizeof(WinDumpHeader64) +
-            (h->PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BITS);
-    h->PhysicalMemoryBlock.unused = 0;
-    h->unused1 = 0;
+    if (x64) {
+        h->x64.RequiredDumpSpace = sizeof(WinDumpHeader64) +
+            (h->x64.PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BITS);
+        h->x64.PhysicalMemoryBlock.unused = 0;
+        h->x64.unused1 = 0;
+    } else {
+        h->x32.RequiredDumpSpace = sizeof(WinDumpHeader32) +
+            (h->x32.PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BITS);
+    }
 
-    patch_mm_pfn_database(h, &local_err);
+    patch_mm_pfn_database(h, x64, &local_err);
     if (local_err) {
         warn_report_err(local_err);
         local_err = NULL;
     }
-    patch_bugcheck_data(h, &local_err);
+    patch_bugcheck_data(h, x64, &local_err);
     if (local_err) {
         warn_report_err(local_err);
     }
 }
 
-static void check_header(WinDumpHeader64 *h, Error **errp)
+static void check_header(WinDumpHeader *h, bool *x64, Error **errp)
 {
     const char Signature[] = "PAGE";
-    const char ValidDump[] = "DU64";
 
     if (memcmp(h->Signature, Signature, sizeof(h->Signature))) {
         error_setg(errp, "win-dump: invalid header, expected '%.4s',"
@@ -144,23 +178,26 @@ static void check_header(WinDumpHeader64 *h, Error **errp)
         return;
     }
 
-    if (memcmp(h->ValidDump, ValidDump, sizeof(h->ValidDump))) {
-        error_setg(errp, "win-dump: invalid header, expected '%.4s',"
-                         " got '%.4s'", ValidDump, h->ValidDump);
-        return;
+    if (!memcmp(h->ValidDump, "DUMP", sizeof(h->ValidDump))) {
+        *x64 = false;
+    } else if (!memcmp(h->ValidDump, "DU64", sizeof(h->ValidDump))) {
+        *x64 = true;
+    } else {
+        error_setg(errp, "win-dump: invalid header, expected 'DUMP' or 'DU64',"
+                         " got '%.4s'", h->ValidDump);
     }
 }
 
-static void check_kdbg(WinDumpHeader64 *h, Error **errp)
+static void check_kdbg(WinDumpHeader *h, bool x64, Error **errp)
 {
     const char OwnerTag[] = "KDBG";
     char read_OwnerTag[4];
-    uint64_t KdDebuggerDataBlock = h->KdDebuggerDataBlock;
+    uint64_t KdDebuggerDataBlock = WIN_DUMP_FIELD(KdDebuggerDataBlock);
     bool try_fallback = true;
 
 try_again:
     if (cpu_memory_rw_debug(first_cpu,
-            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET64,
+            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET,
             (uint8_t *)&read_OwnerTag, sizeof(read_OwnerTag), 0)) {
         error_setg(errp, "win-dump: failed to read OwnerTag");
         return;
@@ -174,7 +211,7 @@ try_again:
              * we try to use KDBG obtained by guest driver.
              */
 
-            KdDebuggerDataBlock = h->BugcheckParameter1;
+            KdDebuggerDataBlock = WIN_DUMP_FIELD(BugcheckParameter1);
             try_fallback = false;
             goto try_again;
         } else {
@@ -185,7 +222,11 @@ try_again:
         }
     }
 
-    h->KdDebuggerDataBlock = KdDebuggerDataBlock;
+    if (x64) {
+        h->x64.KdDebuggerDataBlock = KdDebuggerDataBlock;
+    } else {
+        h->x32.KdDebuggerDataBlock = KdDebuggerDataBlock;
+    }
 }
 
 struct saved_context {
@@ -193,24 +234,25 @@ struct saved_context {
     uint64_t addr;
 };
 
-static void patch_and_save_context(WinDumpHeader64 *h,
+static void patch_and_save_context(WinDumpHeader *h, bool x64,
                                    struct saved_context *saved_ctx,
                                    Error **errp)
 {
+    uint64_t KdDebuggerDataBlock = WIN_DUMP_FIELD(KdDebuggerDataBlock);
     uint64_t KiProcessorBlock;
     uint16_t OffsetPrcbContext;
     CPUState *cpu;
     int i = 0;
 
-    if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET64,
-            (uint8_t *)&KiProcessorBlock, sizeof(KiProcessorBlock), 0)) {
+    if (cpu_read_ptr(x64, first_cpu,
+            KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET,
+            &KiProcessorBlock)) {
         error_setg(errp, "win-dump: failed to read KiProcessorBlock");
         return;
     }
 
     if (cpu_memory_rw_debug(first_cpu,
-            h->KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET64,
+            KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET,
             (uint8_t *)&OffsetPrcbContext, sizeof(OffsetPrcbContext), 0)) {
         error_setg(errp, "win-dump: failed to read OffsetPrcbContext");
         return;
@@ -223,17 +265,17 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         uint64_t Context;
         WinContext ctx;
 
-        if (cpu_memory_rw_debug(first_cpu,
-                KiProcessorBlock + i * sizeof(uint64_t),
-                (uint8_t *)&Prcb, sizeof(Prcb), 0)) {
+        if (cpu_read_ptr(x64, first_cpu,
+                KiProcessorBlock + i * WIN_DUMP_PTR_SIZE,
+                &Prcb)) {
             error_setg(errp, "win-dump: failed to read"
                              " CPU #%d PRCB location", i);
             return;
         }
 
-        if (cpu_memory_rw_debug(first_cpu,
+        if (cpu_read_ptr(x64, first_cpu,
                 Prcb + OffsetPrcbContext,
-                (uint8_t *)&Context, sizeof(Context), 0)) {
+                &Context)) {
             error_setg(errp, "win-dump: failed to read"
                              " CPU #%d ContextFrame location", i);
             return;
@@ -241,56 +283,88 @@ static void patch_and_save_context(WinDumpHeader64 *h,
 
         saved_ctx[i].addr = Context;
 
-        ctx = (WinContext){
-            .ContextFlags = WIN_CTX_ALL,
-            .MxCsr = env->mxcsr,
-
-            .SegEs = env->segs[0].selector,
-            .SegCs = env->segs[1].selector,
-            .SegSs = env->segs[2].selector,
-            .SegDs = env->segs[3].selector,
-            .SegFs = env->segs[4].selector,
-            .SegGs = env->segs[5].selector,
-            .EFlags = cpu_compute_eflags(env),
-
-            .Dr0 = env->dr[0],
-            .Dr1 = env->dr[1],
-            .Dr2 = env->dr[2],
-            .Dr3 = env->dr[3],
-            .Dr6 = env->dr[6],
-            .Dr7 = env->dr[7],
-
-            .Rax = env->regs[R_EAX],
-            .Rbx = env->regs[R_EBX],
-            .Rcx = env->regs[R_ECX],
-            .Rdx = env->regs[R_EDX],
-            .Rsp = env->regs[R_ESP],
-            .Rbp = env->regs[R_EBP],
-            .Rsi = env->regs[R_ESI],
-            .Rdi = env->regs[R_EDI],
-            .R8  = env->regs[8],
-            .R9  = env->regs[9],
-            .R10 = env->regs[10],
-            .R11 = env->regs[11],
-            .R12 = env->regs[12],
-            .R13 = env->regs[13],
-            .R14 = env->regs[14],
-            .R15 = env->regs[15],
-
-            .Rip = env->eip,
-            .FltSave = {
+        if (x64) {
+            ctx.x64 = (WinContext64){
+                .ContextFlags = WIN_CTX64_ALL,
                 .MxCsr = env->mxcsr,
-            },
-        };
+
+                .SegEs = env->segs[0].selector,
+                .SegCs = env->segs[1].selector,
+                .SegSs = env->segs[2].selector,
+                .SegDs = env->segs[3].selector,
+                .SegFs = env->segs[4].selector,
+                .SegGs = env->segs[5].selector,
+                .EFlags = cpu_compute_eflags(env),
+
+                .Dr0 = env->dr[0],
+                .Dr1 = env->dr[1],
+                .Dr2 = env->dr[2],
+                .Dr3 = env->dr[3],
+                .Dr6 = env->dr[6],
+                .Dr7 = env->dr[7],
+
+                .Rax = env->regs[R_EAX],
+                .Rbx = env->regs[R_EBX],
+                .Rcx = env->regs[R_ECX],
+                .Rdx = env->regs[R_EDX],
+                .Rsp = env->regs[R_ESP],
+                .Rbp = env->regs[R_EBP],
+                .Rsi = env->regs[R_ESI],
+                .Rdi = env->regs[R_EDI],
+                .R8  = env->regs[8],
+                .R9  = env->regs[9],
+                .R10 = env->regs[10],
+                .R11 = env->regs[11],
+                .R12 = env->regs[12],
+                .R13 = env->regs[13],
+                .R14 = env->regs[14],
+                .R15 = env->regs[15],
+
+                .Rip = env->eip,
+                .FltSave = {
+                    .MxCsr = env->mxcsr,
+                },
+            };
+        } else {
+            ctx.x32 = (WinContext32){
+                .ContextFlags = WIN_CTX32_FULL | WIN_CTX_DBG,
+
+                .SegEs = env->segs[0].selector,
+                .SegCs = env->segs[1].selector,
+                .SegSs = env->segs[2].selector,
+                .SegDs = env->segs[3].selector,
+                .SegFs = env->segs[4].selector,
+                .SegGs = env->segs[5].selector,
+                .EFlags = cpu_compute_eflags(env),
+
+                .Dr0 = env->dr[0],
+                .Dr1 = env->dr[1],
+                .Dr2 = env->dr[2],
+                .Dr3 = env->dr[3],
+                .Dr6 = env->dr[6],
+                .Dr7 = env->dr[7],
+
+                .Eax = env->regs[R_EAX],
+                .Ebx = env->regs[R_EBX],
+                .Ecx = env->regs[R_ECX],
+                .Edx = env->regs[R_EDX],
+                .Esp = env->regs[R_ESP],
+                .Ebp = env->regs[R_EBP],
+                .Esi = env->regs[R_ESI],
+                .Edi = env->regs[R_EDI],
+
+                .Eip = env->eip,
+            };
+        }
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 0)) {
+                (uint8_t *)&saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 0)) {
             error_setg(errp, "win-dump: failed to save CPU #%d context", i);
             return;
         }
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&ctx, sizeof(WinContext), 1)) {
+                (uint8_t *)&ctx, WIN_DUMP_CTX_SIZE, 1)) {
             error_setg(errp, "win-dump: failed to write CPU #%d context", i);
             return;
         }
@@ -299,14 +373,14 @@ static void patch_and_save_context(WinDumpHeader64 *h,
     }
 }
 
-static void restore_context(WinDumpHeader64 *h,
+static void restore_context(WinDumpHeader *h, bool x64,
                             struct saved_context *saved_ctx)
 {
     int i;
 
-    for (i = 0; i < h->NumberProcessors; i++) {
+    for (i = 0; i < WIN_DUMP_FIELD(NumberProcessors); i++) {
         if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 1)) {
+                (uint8_t *)&saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 1)) {
             warn_report("win-dump: failed to restore CPU #%d context", i);
         }
     }
@@ -314,69 +388,72 @@ static void restore_context(WinDumpHeader64 *h,
 
 void create_win_dump(DumpState *s, Error **errp)
 {
-    WinDumpHeader64 *h = (WinDumpHeader64 *)(s->guest_note +
-            VMCOREINFO_ELF_NOTE_HDR_SIZE);
+    WinDumpHeader *h = (void *)(s->guest_note + VMCOREINFO_ELF_NOTE_HDR_SIZE);
     X86CPU *first_x86_cpu = X86_CPU(first_cpu);
     uint64_t saved_cr3 = first_x86_cpu->env.cr[3];
     struct saved_context *saved_ctx = NULL;
     Error *local_err = NULL;
+    bool x64;
+    size_t hdr_size;
 
-    if (s->guest_note_size != sizeof(WinDumpHeader64) +
-            VMCOREINFO_ELF_NOTE_HDR_SIZE) {
+    if (s->guest_note_size != VMCOREINFO_WIN_DUMP_NOTE_SIZE32 &&
+            s->guest_note_size != VMCOREINFO_WIN_DUMP_NOTE_SIZE64) {
         error_setg(errp, "win-dump: invalid vmcoreinfo note size");
         return;
     }
 
-    check_header(h, &local_err);
+    check_header(h, &x64, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
     }
 
+    hdr_size = x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32);
+
     /*
      * Further access to kernel structures by virtual addresses
      * should be made from system context.
      */
 
-    first_x86_cpu->env.cr[3] = h->DirectoryTableBase;
+    first_x86_cpu->env.cr[3] = WIN_DUMP_FIELD(DirectoryTableBase);
 
-    check_kdbg(h, &local_err);
+    check_kdbg(h, x64, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out_cr3;
     }
 
-    patch_header(h);
+    patch_header(h, x64);
 
-    saved_ctx = g_new(struct saved_context, h->NumberProcessors);
+    saved_ctx = g_new(struct saved_context, WIN_DUMP_FIELD(NumberProcessors));
 
     /*
      * Always patch context because there is no way
      * to determine if the system-saved context is valid
      */
 
-    patch_and_save_context(h, saved_ctx, &local_err);
+    patch_and_save_context(h, x64, saved_ctx, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out_free;
     }
 
-    s->total_size = h->RequiredDumpSpace;
+    s->total_size = WIN_DUMP_FIELD(RequiredDumpSpace);
 
-    s->written_size = qemu_write_full(s->fd, h, sizeof(*h));
-    if (s->written_size != sizeof(*h)) {
+    s->written_size = qemu_write_full(s->fd, h, hdr_size);
+    if (s->written_size != hdr_size) {
         error_setg(errp, QERR_IO_ERROR);
         goto out_restore;
     }
 
-    write_runs(s, h, &local_err);
+    write_runs(s, h, x64, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out_restore;
     }
 
 out_restore:
-    restore_context(h, saved_ctx);
+    restore_context(h, x64, saved_ctx);
 out_free:
     g_free(saved_ctx);
 out_cr3:
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 3a5aeba3fe..5be65fa679 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1064,7 +1064,7 @@ ERST
                       "-l: dump in kdump-compressed format, with lzo compression.\n\t\t\t"
                       "-s: dump in kdump-compressed format, with snappy compression.\n\t\t\t"
                       "-w: dump in Windows crashdump format (can be used instead of ELF-dump converting),\n\t\t\t"
-                      "    for Windows x64 guests with vmcoreinfo driver only.\n\t\t\t"
+                      "    for Windows x64 and x86 guests with vmcoreinfo driver only.\n\t\t\t"
                       "begin: the starting physical address.\n\t\t\t"
                       "length: the memory size, in bytes.",
         .cmd        = hmp_dump_guest_memory,
-- 
2.31.1


