Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF222073
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 00:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRlh0-0005cM-DW
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 18:51:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.bobek@gmail.com>) id 1hRlbI-0001JI-Up
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.bobek@gmail.com>) id 1hRlbH-0005VA-88
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:16 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:39225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hRlbH-0005U5-3E
	for qemu-devel@nongnu.org; Fri, 17 May 2019 18:45:15 -0400
Received: by mail-yb1-xb44.google.com with SMTP id a3so41178ybr.6
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 15:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vpgsr3Dz5tYkOfTAdvJCbJ3RLyITFgDknol3fJuhD2w=;
	b=ADAwan8AEyWxPWevOBMAhGNBcVOmHWOapB1h89tgYqpzWIs1+NTN7wUzaBo584NYX+
	OWLwGPVoqDLFWJDTWXvQ8JBuyvMPwGJjc+2Ee+mMtxWpH/4BBsDy7ltW2uVS4wKMojV7
	xYhJToMw0QXP9GoBY6UiOPT5GfXL4GhnUGnK9+o7pv5Msm3M7Oc3qK+zJMfs/xQtl4hO
	xN9cXnybL+M1tRyE7MDi8fRlqIQjLtkdMDlw8/I/0ePdoa9qi+iY6cbAlw650EMPUwSS
	jGkmye5Is1YMIQl/OTjn22zHCSLW5yb8OTR7njrHP1RSctLju+TpiPrB3EbmgJ7tpxyE
	MhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vpgsr3Dz5tYkOfTAdvJCbJ3RLyITFgDknol3fJuhD2w=;
	b=EQ5ZDsgynuLzXRzVLLtvpHjQmwlgi8NzRCNXo6oQZIpmxouHfvkc6KfUl7iLwI04Yq
	LbaHfrBN4PrtyfU2tE61o7T5/c7JaXBpj4kT6qa9TCpc988+gJRaoVUSr8Yh2P/UiRJQ
	ZL6kot21Gu+P1uq/vRQFPWBC/d+MO9jsQkHzFmR6NzA0Uc4HXb4h7h2pruKS5Qbzjpf2
	HlHUmVMe/SITa3x3dufRtV49MifFPdM6XJGx8FMu1LfjfYhOIkHUAMJkKEViDZZn6Hc6
	0TXUPNU3gW6xeReRwAUVX3MsukHuHEopLwDs3XylIhHHALQwVRfmDEPB5y16wuRWOPlh
	aD9A==
X-Gm-Message-State: APjAAAWb+Gc5iCJUPHWWmVBkN2GSoTJ6S7p26KHev9Ls1kZgc6E0hJRO
	yCfhHMcVC9a0ETS5fUxcR9iE9fVBmLr8Cw==
X-Google-Smtp-Source: APXvYqwhaYk2u3KkUnnXA0PWgMlLsqjderwit0pdVG9MxOGfGo0iHVNg+R7hcvQvL4RiJSt7xBNTiw==
X-Received: by 2002:a25:7156:: with SMTP id m83mr27227169ybc.57.1558133114381; 
	Fri, 17 May 2019 15:45:14 -0700 (PDT)
Received: from dionysus.attlocal.net
	(69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
	by smtp.gmail.com with ESMTPSA id
	u73sm2480260ywf.62.2019.05.17.15.45.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 15:45:13 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:44:43 -0400
Message-Id: <20190517224450.15566-5-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517224450.15566-1-jan.bobek@gmail.com>
References: <20190517224450.15566-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b44
Subject: [Qemu-devel] [RISU v2 04/11] risu_reginfo_i386: implement
 arch-specific reginfo interface
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jan Bobek <jan.bobek@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CPU-specific code in risu_reginfo_* is expected to define and export
the following symbols:

- arch_long_opts, arch_extra_help, process_arch_opt
- reginfo_size
- reginfo_init
- reginfo_is_eq
- reginfo_dump, reginfo_dump_mismatch

Make risu_reginfo_i386.c implement this interface; and while we're at
it, expand the support to x86_64 as well.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 risu_reginfo_i386.h |  24 ++++----
 risu_reginfo_i386.c | 147 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 127 insertions(+), 44 deletions(-)

diff --git a/risu_reginfo_i386.h b/risu_reginfo_i386.h
index 5bba439..e350f01 100644
--- a/risu_reginfo_i386.h
+++ b/risu_reginfo_i386.h
@@ -12,7 +12,8 @@
 #ifndef RISU_REGINFO_I386_H
 #define RISU_REGINFO_I386_H
 
-/* This is the data structure we pass over the socket.
+/*
+ * This is the data structure we pass over the socket.
  * It is a simplified and reduced subset of what can
  * be obtained with a ucontext_t*
  */
@@ -21,17 +22,14 @@ struct reginfo {
     gregset_t gregs;
 };
 
-#ifndef REG_GS
-/* Assume that either we get all these defines or none */
-#   define REG_GS      0
-#   define REG_FS      1
-#   define REG_ES      2
-#   define REG_DS      3
-#   define REG_ESP     7
-#   define REG_TRAPNO 12
-#   define REG_EIP    14
-#   define REG_EFL    16
-#   define REG_UESP   17
-#endif /* !defined(REG_GS) */
+/*
+ * For i386, the defines are named REG_EAX, etc.
+ * For x86_64, the defines are named REG_RAX, etc.
+ */
+#ifdef __x86_64__
+# define REG_E(X)   REG_R##X
+#else
+# define REG_E(X)   REG_E##X
+#endif
 
 #endif /* RISU_REGINFO_I386_H */
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index e8d671f..c4dc14a 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -10,59 +10,144 @@
  ******************************************************************************/
 
 #include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #include <ucontext.h>
+#include <assert.h>
 
 #include "risu.h"
 #include "risu_reginfo_i386.h"
 
-static void fill_reginfo(struct reginfo *ri, ucontext_t * uc)
+const struct option * const arch_long_opts;
+const char * const arch_extra_help;
+
+void process_arch_opt(int opt, const char *arg)
+{
+    abort();
+}
+
+const int reginfo_size(void)
+{
+    return sizeof(struct reginfo);
+}
+
+/* reginfo_init: initialize with a ucontext */
+void reginfo_init(struct reginfo *ri, ucontext_t *uc)
 {
     int i;
+
+    memset(ri, 0, sizeof(*ri));
+
     for (i = 0; i < NGREG; i++) {
         switch (i) {
-        case REG_ESP:
-        case REG_UESP:
-        case REG_GS:
-        case REG_FS:
-        case REG_ES:
-        case REG_DS:
-        case REG_TRAPNO:
-        case REG_EFL:
-            /* Don't store these registers as it results in mismatches.
-             * In particular valgrind has different values for some
-             * segment registers, and they're boring anyway.
-             * We really shouldn't be ignoring EFL but valgrind doesn't
-             * seem to set it right and I don't care to investigate.
-             */
-            ri->gregs[i] = 0xDEADBEEF;
-            break;
-        case REG_EIP:
-            /* Store the offset from the start of the test image */
+        case REG_E(IP):
+            /* Store the offset from the start of the test image.  */
             ri->gregs[i] = uc->uc_mcontext.gregs[i] - image_start_address;
             break;
-        default:
+        case REG_EFL:
+            /* Store only the "flaggy" bits: SF, ZF, AF, PF, CF.  */
+            ri->gregs[i] = uc->uc_mcontext.gregs[i] & 0xd5;
+            break;
+        case REG_E(SP):
+            /* Ignore the stack.  */
+            ri->gregs[i] = 0xdeadbeef;
+            break;
+        case REG_E(AX):
+        case REG_E(BX):
+        case REG_E(CX):
+        case REG_E(DX):
+        case REG_E(DI):
+        case REG_E(SI):
+        case REG_E(BP):
+#ifdef __x86_64__
+        case REG_R8:
+        case REG_R9:
+        case REG_R10:
+        case REG_R11:
+        case REG_R12:
+        case REG_R13:
+        case REG_R14:
+        case REG_R15:
+#endif
             ri->gregs[i] = uc->uc_mcontext.gregs[i];
             break;
         }
     }
-    /* x86 insns aren't 32 bit but we're not really testing x86 so
-     * this is just to distinguish 'do compare' from 'stop'
+
+    /*
+     * x86 insns aren't 32 bit but 3 bytes are sufficient to
+     * distinguish 'do compare' from 'stop'.
      */
-    ri->faulting_insn = *((uint32_t *) uc->uc_mcontext.gregs[REG_EIP]);
+    ri->faulting_insn = *(uint32_t *)uc->uc_mcontext.gregs[REG_E(IP)];
 }
 
-static char *regname[] = {
-    "GS", "FS", "ES", "DS", "EDI", "ESI", "EBP", "ESP",
-    "EBX", "EDX", "ECX", "EAX", "TRAPNO", "ERR", "EIP",
-    "CS", "EFL", "UESP", "SS", 0
+/* reginfo_is_eq: compare the reginfo structs, returns nonzero if equal */
+int reginfo_is_eq(struct reginfo *m, struct reginfo *a)
+{
+    return 0 == memcmp(m, a, sizeof(*m));
+}
+
+static const char *const regname[NGREG] = {
+    [REG_EFL] = "eflags",
+#ifdef __x86_64__
+    [REG_RIP] = "rip",
+    [REG_RAX] = "rax",
+    [REG_RBX] = "rbx",
+    [REG_RCX] = "rcx",
+    [REG_RDX] = "rdx",
+    [REG_RDI] = "rdi",
+    [REG_RSI] = "rsi",
+    [REG_RBP] = "rbp",
+    [REG_RSP] = "rsp",
+    [REG_R8]  = "r8",
+    [REG_R9]  = "r9",
+    [REG_R10] = "r10",
+    [REG_R11] = "r11",
+    [REG_R12] = "r12",
+    [REG_R13] = "r13",
+    [REG_R14] = "r14",
+    [REG_R15] = "r15",
+#else
+    [REG_EIP] = "eip",
+    [REG_EAX] = "eax",
+    [REG_EBX] = "ebx",
+    [REG_ECX] = "ecx",
+    [REG_EDX] = "edx",
+    [REG_EDI] = "edi",
+    [REG_ESI] = "esi",
+    [REG_EBP] = "ebp",
+    [REG_ESP] = "esp",
+#endif
 };
 
-static void dump_reginfo(struct reginfo *ri)
+#ifdef __x86_64__
+# define PRIxREG   "%016llx"
+#else
+# define PRIxREG   "%08x"
+#endif
+
+/* reginfo_dump: print state to a stream, returns nonzero on success */
+int reginfo_dump(struct reginfo *ri, FILE *f)
 {
     int i;
-    fprintf(stderr, "  faulting insn %x\n", ri->faulting_insn);
+    fprintf(f, "  faulting insn %x\n", ri->faulting_insn);
     for (i = 0; i < NGREG; i++) {
-        fprintf(stderr, "  %s: %x\n", regname[i] ? regname[i] : "???",
-                ri->gregs[i]);
+        if (regname[i]) {
+            fprintf(f, "  %-6s: " PRIxREG "\n", regname[i], ri->gregs[i]);
+        }
     }
+    return !ferror(f);
+}
+
+int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE *f)
+{
+    int i;
+    for (i = 0; i < NGREG; i++) {
+        if (m->gregs[i] != a->gregs[i]) {
+            assert(regname[i]);
+            fprintf(f, "Mismatch: %s: " PRIxREG " v " PRIxREG "\n",
+                    regname[i], m->gregs[i], a->gregs[i]);
+        }
+    }
+    return !ferror(f);
 }
-- 
2.20.1


