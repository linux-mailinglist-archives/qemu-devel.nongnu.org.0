Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FBD4E7AC6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 22:13:07 +0100 (CET)
Received: from localhost ([::1]:55602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXrF4-0001yO-HV
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 17:13:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nXpzb-0001uM-Kv
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nXpza-0008Oa-0r
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648237980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGjrRQRhwwazVS77/7z9CVlwSEBmEEglLcDJQJq9US4=;
 b=i0JUJkTC/Fcoa2HVoS/xd55oVGC8XXsCV5KrvMSHeFGgZPWYh2VWsQpv1Wn5HDhlTqqI3P
 dxCEuBUPjx1YU8sRXnKqEk/FId0J9W0U48FuMAcO8qYD510UeKEm5kn10hNySTjzpyROc3
 syhCBkFnUj6zm51nCzs9PQBcwApswjk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-6lhm-SoENZSUdn79u4fovQ-1; Fri, 25 Mar 2022 15:51:41 -0400
X-MC-Unique: 6lhm-SoENZSUdn79u4fovQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA7373800E93;
 Fri, 25 Mar 2022 19:51:40 +0000 (UTC)
Received: from vp-pc.redhat.com (unknown [10.40.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FBBA7AE0;
 Fri, 25 Mar 2022 19:51:39 +0000 (UTC)
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
To: marcandre.lureau@redhat.com,
	f4bug@amsat.org
Subject: [PATCH v3 1/4] include/qemu: rename Windows context definitions to
 expose bitness
Date: Fri, 25 Mar 2022 22:51:27 +0300
Message-Id: <20220325195130.62090-2-viktor.prutyanov@redhat.com>
In-Reply-To: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
References: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=viktor.prutyanov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=viktor.prutyanov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Mar 2022 17:08:08 -0400
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
Cc: yan@daynix.com, qemu-devel@nongnu.org, viktor.prutyanov@phystech.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Context structure in 64-bit Windows differs from 32-bit one and it
should be reflected in its name.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 contrib/elf2dmp/main.c       |  6 +++---
 dump/win_dump.c              | 14 +++++++-------
 include/qemu/win_dump_defs.h |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
index 20b477d582..b9fc6d230c 100644
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
index c5eb5a9aac..29b6e4f670 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -189,7 +189,7 @@ try_again:
 }
 
 struct saved_context {
-    WinContext ctx;
+    WinContext64 ctx;
     uint64_t addr;
 };
 
@@ -221,7 +221,7 @@ static void patch_and_save_context(WinDumpHeader64 *h,
         CPUX86State *env = &x86_cpu->env;
         uint64_t Prcb;
         uint64_t Context;
-        WinContext ctx;
+        WinContext64 ctx;
 
         if (cpu_memory_rw_debug(first_cpu,
                 KiProcessorBlock + i * sizeof(uint64_t),
@@ -241,8 +241,8 @@ static void patch_and_save_context(WinDumpHeader64 *h,
 
         saved_ctx[i].addr = Context;
 
-        ctx = (WinContext){
-            .ContextFlags = WIN_CTX_ALL,
+        ctx = (WinContext64){
+            .ContextFlags = WIN_CTX64_ALL,
             .MxCsr = env->mxcsr,
 
             .SegEs = env->segs[0].selector,
@@ -284,13 +284,13 @@ static void patch_and_save_context(WinDumpHeader64 *h,
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
@@ -306,7 +306,7 @@ static void restore_context(WinDumpHeader64 *h,
 
     for (i = 0; i < h->NumberProcessors; i++) {
         if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
-                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 1)) {
+                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 1)) {
             warn_report("win-dump: failed to restore CPU #%d context", i);
         }
     }
diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
index 145096e8ee..5a5e5a5e09 100644
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
-- 
2.35.1


