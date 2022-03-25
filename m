Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37064E7AC5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 22:10:17 +0100 (CET)
Received: from localhost ([::1]:49822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXrCK-0006D2-TN
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 17:10:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nXpzb-0001uc-OJ
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nXpza-0008Om-15
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648237981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9EdTXTTP0GmZ3oDaHwgsb+4vKTsFeCOVCyDk9xP94Os=;
 b=d4ZNiyS0vt+7sn6MKQrYUInTjQgqgYCoALomEHEMoCpQ+9vk6u7thMIuSY6iR+cKgwoHpg
 1XfMUX0aqgtxenoBpl8bU6dPkpfi1MXE83pYIf4LX1ZCNMY9ll5ceA6iY8UORnXYsWULkb
 4kZpIGYpxSlSThz5UaDBurreTjoJC6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-QWs4KphuOOOfTkCmJ_fXrw-1; Fri, 25 Mar 2022 15:51:44 -0400
X-MC-Unique: QWs4KphuOOOfTkCmJ_fXrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB5C10115FA;
 Fri, 25 Mar 2022 19:51:44 +0000 (UTC)
Received: from vp-pc.redhat.com (unknown [10.40.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4EEF7AE0;
 Fri, 25 Mar 2022 19:51:42 +0000 (UTC)
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
To: marcandre.lureau@redhat.com,
	f4bug@amsat.org
Subject: [PATCH v3 3/4] include/qemu: add 32-bit Windows dump structures
Date: Fri, 25 Mar 2022 22:51:29 +0300
Message-Id: <20220325195130.62090-4-viktor.prutyanov@redhat.com>
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

These structures are required to produce 32-bit guest Windows Complete
Memory Dump. Add 32-bit Windows dump header, CPU context and physical
memory descriptor structures along with corresponding definitions.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/win_dump_defs.h | 107 +++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
index 5a5e5a5e09..73a44e2408 100644
--- a/include/qemu/win_dump_defs.h
+++ b/include/qemu/win_dump_defs.h
@@ -11,11 +11,22 @@
 #ifndef QEMU_WIN_DUMP_DEFS_H
 #define QEMU_WIN_DUMP_DEFS_H
 
+typedef struct WinDumpPhyMemRun32 {
+    uint32_t BasePage;
+    uint32_t PageCount;
+} QEMU_PACKED WinDumpPhyMemRun32;
+
 typedef struct WinDumpPhyMemRun64 {
     uint64_t BasePage;
     uint64_t PageCount;
 } QEMU_PACKED WinDumpPhyMemRun64;
 
+typedef struct WinDumpPhyMemDesc32 {
+    uint32_t NumberOfRuns;
+    uint32_t NumberOfPages;
+    WinDumpPhyMemRun32 Run[86];
+} QEMU_PACKED WinDumpPhyMemDesc32;
+
 typedef struct WinDumpPhyMemDesc64 {
     uint32_t NumberOfRuns;
     uint32_t unused;
@@ -33,6 +44,39 @@ typedef struct WinDumpExceptionRecord {
     uint64_t ExceptionInformation[15];
 } QEMU_PACKED WinDumpExceptionRecord;
 
+typedef struct WinDumpHeader32 {
+    char Signature[4];
+    char ValidDump[4];
+    uint32_t MajorVersion;
+    uint32_t MinorVersion;
+    uint32_t DirectoryTableBase;
+    uint32_t PfnDatabase;
+    uint32_t PsLoadedModuleList;
+    uint32_t PsActiveProcessHead;
+    uint32_t MachineImageType;
+    uint32_t NumberProcessors;
+    union {
+        struct {
+            uint32_t BugcheckCode;
+            uint32_t BugcheckParameter1;
+            uint32_t BugcheckParameter2;
+            uint32_t BugcheckParameter3;
+            uint32_t BugcheckParameter4;
+        };
+        uint8_t BugcheckData[20];
+    };
+    uint8_t VersionUser[32];
+    uint32_t reserved0;
+    uint32_t KdDebuggerDataBlock;
+    union {
+        WinDumpPhyMemDesc32 PhysicalMemoryBlock;
+        uint8_t PhysicalMemoryBlockBuffer[700];
+    };
+    uint8_t reserved1[3200];
+    uint32_t RequiredDumpSpace;
+    uint8_t reserved2[92];
+} QEMU_PACKED WinDumpHeader32;
+
 typedef struct WinDumpHeader64 {
     char Signature[4];
     char ValidDump[4];
@@ -81,25 +125,49 @@ typedef struct WinDumpHeader64 {
     uint8_t reserved[4018];
 } QEMU_PACKED WinDumpHeader64;
 
+typedef union WinDumpHeader {
+    struct {
+        char Signature[4];
+        char ValidDump[4];
+    };
+    WinDumpHeader32 x32;
+    WinDumpHeader64 x64;
+} WinDumpHeader;
+
 #define KDBG_OWNER_TAG_OFFSET64             0x10
 #define KDBG_MM_PFN_DATABASE_OFFSET64       0xC0
 #define KDBG_KI_BUGCHECK_DATA_OFFSET64      0x88
 #define KDBG_KI_PROCESSOR_BLOCK_OFFSET64    0x218
 #define KDBG_OFFSET_PRCB_CONTEXT_OFFSET64   0x338
 
+#define KDBG_OWNER_TAG_OFFSET           KDBG_OWNER_TAG_OFFSET64
+#define KDBG_MM_PFN_DATABASE_OFFSET     KDBG_MM_PFN_DATABASE_OFFSET64
+#define KDBG_KI_BUGCHECK_DATA_OFFSET    KDBG_KI_BUGCHECK_DATA_OFFSET64
+#define KDBG_KI_PROCESSOR_BLOCK_OFFSET  KDBG_KI_PROCESSOR_BLOCK_OFFSET64
+#define KDBG_OFFSET_PRCB_CONTEXT_OFFSET KDBG_OFFSET_PRCB_CONTEXT_OFFSET64
+
 #define VMCOREINFO_ELF_NOTE_HDR_SIZE    24
+#define VMCOREINFO_WIN_DUMP_NOTE_SIZE64 (sizeof(WinDumpHeader64) + \
+                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
+#define VMCOREINFO_WIN_DUMP_NOTE_SIZE32 (sizeof(WinDumpHeader32) + \
+                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
 
 #define WIN_CTX_X64 0x00100000L
+#define WIN_CTX_X86 0x00010000L
 
 #define WIN_CTX_CTL 0x00000001L
 #define WIN_CTX_INT 0x00000002L
 #define WIN_CTX_SEG 0x00000004L
 #define WIN_CTX_FP  0x00000008L
 #define WIN_CTX_DBG 0x00000010L
+#define WIN_CTX_EXT 0x00000020L
 
 #define WIN_CTX64_FULL  (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_FP)
 #define WIN_CTX64_ALL   (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
 
+#define WIN_CTX32_FULL (WIN_CTX_X86 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CTX_SEG)
+#define WIN_CTX32_ALL (WIN_CTX32_FULL | WIN_CTX_FP | WIN_CTX_DBG | WIN_CTX_EXT)
+
 #define LIVE_SYSTEM_DUMP    0x00000161
 
 typedef struct WinM128A {
@@ -107,6 +175,40 @@ typedef struct WinM128A {
     int64_t high;
 } QEMU_ALIGNED(16) WinM128A;
 
+typedef struct WinContext32 {
+    uint32_t ContextFlags;
+
+    uint32_t Dr0;
+    uint32_t Dr1;
+    uint32_t Dr2;
+    uint32_t Dr3;
+    uint32_t Dr6;
+    uint32_t Dr7;
+
+    uint8_t  FloatSave[112];
+
+    uint32_t SegGs;
+    uint32_t SegFs;
+    uint32_t SegEs;
+    uint32_t SegDs;
+
+    uint32_t Edi;
+    uint32_t Esi;
+    uint32_t Ebx;
+    uint32_t Edx;
+    uint32_t Ecx;
+    uint32_t Eax;
+
+    uint32_t Ebp;
+    uint32_t Eip;
+    uint32_t SegCs;
+    uint32_t EFlags;
+    uint32_t Esp;
+    uint32_t SegSs;
+
+    uint8_t ExtendedRegisters[512];
+} QEMU_ALIGNED(16) WinContext32;
+
 typedef struct WinContext64 {
     uint64_t PHome[6];
 
@@ -176,4 +278,9 @@ typedef struct WinContext64 {
     uint64_t LastExceptionFromRip;
 } QEMU_ALIGNED(16) WinContext64;
 
+typedef union WinContext {
+    WinContext32 x32;
+    WinContext64 x64;
+} WinContext;
+
 #endif /* QEMU_WIN_DUMP_DEFS_H */
-- 
2.35.1


