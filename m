Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD4950B641
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:37:20 +0200 (CEST)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrbE-0004fd-2R
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqLJ-0001Zv-3W
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhqLF-0004st-84
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650622604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1MjqZTYFRrQne6LN0s4LaacTtvSOZRT2GmCtGvpnyg=;
 b=TK9qq7idHM5K1UbW2iV3lckH4fKjpufvCARXhaTpzztBEb90lrAgFo4SqVPd3+5hYVLpSA
 HHnRXB0H4Xtmzg3seK1Yz0qTmMiQplwL2CSe7BU4BxMJTzWkmZ/KJE9lfUDeedrCbekK/O
 kRxv5yOKwOqfr5Lf1K6om40V26Fp6wQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-TT0aefUSOB6uIPWtabqUWA-1; Fri, 22 Apr 2022 06:16:43 -0400
X-MC-Unique: TT0aefUSOB6uIPWtabqUWA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E95BC806613;
 Fri, 22 Apr 2022 10:16:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93B06415F5F;
 Fri, 22 Apr 2022 10:16:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/13] include/qemu: rename Windows context definitions to
 expose bitness
Date: Fri, 22 Apr 2022 14:15:22 +0400
Message-Id: <20220422101525.3260741-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
References: <20220422101525.3260741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 viktor.prutyanov@redhat.com, richard.henderson@linaro.org,
 frankja@linux.ibm.com, Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viktor Prutyanov <viktor.prutyanov@redhat.com>

Context structure in 64-bit Windows differs from 32-bit one and it
should be reflected in its name.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220406171558.199263-2-viktor.prutyanov@redhat.com>
---
 include/qemu/win_dump_defs.h |  8 ++++----
 contrib/elf2dmp/main.c       |  6 +++---
 dump/win_dump.c              | 14 +++++++-------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
index 145096e8ee79..5a5e5a5e0989 100644
--- a/include/qemu/win_dump_defs.h
+++ b/include/qemu/win_dump_defs.h
@@ -97,8 +97,8 @@ typedef struct WinDumpHeader64 {
 #define WIN_CTX_FP  0x00000008L
 #define WIN_CTX_DBG 0x00000010L
 
-#define WIN_CTX_FULL    (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
-#define WIN_CTX_ALL     (WIN_CTX_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
+#define WIN_CTX64_FULL  (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
+#define WIN_CTX64_ALL   (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
 
 #define LIVE_SYSTEM_DUMP    0x00000161
 
@@ -107,7 +107,7 @@ typedef struct WinM128A {
     int64_t high;
 } QEMU_ALIGNED(16) WinM128A;
 
-typedef struct WinContext {
+typedef struct WinContext64 {
     uint64_t PHome[6];
 
     uint32_t ContextFlags;
@@ -174,6 +174,6 @@ typedef struct WinContext {
     uint64_t LastBranchFromRip;
     uint64_t LastExceptionToRip;
     uint64_t LastExceptionFromRip;
-} QEMU_ALIGNED(16) WinContext;
+} QEMU_ALIGNED(16) WinContext64;
 
 #endif /* QEMU_WIN_DUMP_DEFS_H */
diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 20b477d582a4..b9fc6d230ca0 100644
--- a/contrib/elf2dmp/main.c
+++ b/contrib/elf2dmp/main.c
@@ -141,10 +141,10 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb,
     return kdbg;
 }
 
-static void win_context_init_from_qemu_cpu_state(WinContext *ctx,
+static void win_context_init_from_qemu_cpu_state(WinContext64 *ctx,
         QEMUCPUState *s)
 {
-    WinContext win_ctx = (WinContext){
+    WinContext64 win_ctx = (WinContext64){
         .ContextFlags = WIN_CTX_X64 | WIN_CTX_INT | WIN_CTX_SEG | WIN_CTX_CTL,
         .MxCsr = INITIAL_MXCSR,
 
@@ -302,7 +302,7 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
     for (i = 0; i < qe->state_nr; i++) {
         uint64_t Prcb;
         uint64_t Context;
-        WinContext ctx;
+        WinContext64 ctx;
         QEMUCPUState *s = qe->state[i];
 
         if (va_space_rw(vs, kdbg->KiProcessorBlock + sizeof(Prcb) * i,
diff --git a/dump/win_dump.c b/dump/win_dump.c
index fbdbb7bd93a6..e9215e4fd5e5 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -188,7 +188,7 @@ try_again:
 }
 
 struct saved_context {
-    WinContext ctx;
+    WinContext64 ctx;
     uint64_t addr;
 };
 
@@ -220,7 +220,7 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         CPUX86State *env = &x86_cpu->env;
         uint64_t Prcb;
         uint64_t Context;
-        WinContext ctx;
+        WinContext64 ctx;
 
         if (cpu_memory_rw_debug(first_cpu,
                 KiProcessorBlock + i * sizeof(uint64_t),
@@ -240,8 +240,8 @@ static void patch_and_save_context(WinDumpHeader64 *h,
 
         saved_ctx[i].addr = Context;
 
-        ctx = (WinContext){
-            .ContextFlags = WIN_CTX_ALL,
+        ctx = (WinContext64){
+            .ContextFlags = WIN_CTX64_ALL,
             .MxCsr = env->mxcsr,
 
             .SegEs = env->segs[0].selector,
@@ -283,13 +283,13 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         };
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 0)) {
+                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 0)) {
             error_setg(errp, "win-dump: failed to save CPU #%d context", i);
             return;
         }
 
         if (cpu_memory_rw_debug(first_cpu, Context,
-                (uint8_t *)&ctx, sizeof(WinContext), 1)) {
+                (uint8_t *)&ctx, sizeof(WinContext64), 1)) {
             error_setg(errp, "win-dump: failed to write CPU #%d context", i);
             return;
         }
@@ -305,7 +305,7 @@ static void restore_context(WinDumpHeader64 *h,
 
     for (i = 0; i < h->NumberProcessors; i++) {
         if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 1)) {
+                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 1)) {
             warn_report("win-dump: failed to restore CPU #%d context", i);
         }
     }
-- 
2.36.0


