Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1903E3524
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 13:11:42 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCKEv-00030Q-Oe
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 07:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCKDD-0000lX-3S
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:09:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCKDB-0001oQ-MK
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:09:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id x17so7202592wmc.5
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=//QOsMcD3tFm4ZPkQ7uMXA3J+aZ71YJiTMzd5TccQ1I=;
 b=RhDmz1uznQomJyKYVnhYMy7Ok/vu8/wZRtvJVX/heU5QCYRL9YwNMRN1rdIyDk3T70
 t8UYtwjIcjU1ar39zDVEH20BoRzVD0HXnwW9KMSAfyxsgi/IFGbDYTTbL8doVt76xjEv
 Zy9tAAmm4/WNarCso4TZoTT+1EjCF4mblbSSBIsAAZD1GuGfYRt+vkOnHRauMzJRFEIm
 Uc8KerqyZgmjOj0mPfgwTYE3EAcRjSR6gMIISmEGL/MzZ9pNLuxz+h68PpW/bfWJ/cYO
 JisXvKSGP0Ucy0wA/6BN98h1BpvKLGeHNTlwgdb8Qt+o+FZA0mCm2ESZJEJD0U8oMzrJ
 RFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=//QOsMcD3tFm4ZPkQ7uMXA3J+aZ71YJiTMzd5TccQ1I=;
 b=E3nFZWccgq3OOyKluoogSX9BU9917Uv4oEI9fo/XLsIcA0QL1gQFpBH73+gSYN9czk
 mKYkNYRaqbND7T28KEft7ezFV10J5EOCN52X9K5ugnOqUes21pCwrAQLFamtpJpUL0Ru
 COSD16sc/yuNNyCFbcYHUAyVhqmRAiB1xyaQyNcpLsJubNMIzJv6xnbjMj3xd7S5cWBq
 egYT9au7Cd/+SS1AWtc78oRay03j9GjzrocX/A4tbr7PAjkRVSCM7whFzRlA+MpTK5DL
 wWnBM/MNQsadNn5jLt/ridx54uly71oltQ69s+9z2eq3mf1ZM3olODT6Kqzjgl5TuWiH
 eZpQ==
X-Gm-Message-State: AOAM531RXNXK+YYd8i5lWRfSj82/p6F+blp9CNMeCl7ZA/aWAHc+65Yi
 NIbxS7A1xaMeLa9uzZgS4RnJK0xM4p/k7PZUzOU=
X-Google-Smtp-Source: ABdhPJyb136XwUrvi/k/Qrd+S4a564jLDhMo0+P/BV9udVSuUh7pVpGDlcG7VmmYpwdKL7gMDazsHw==
X-Received: by 2002:a1c:1dcf:: with SMTP id
 d198mr24282566wmd.103.1628334591893; 
 Sat, 07 Aug 2021 04:09:51 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s14sm11091169wmc.25.2021.08.07.04.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 04:09:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/2] disas/nios2: Simplify endianess conversion
Date: Sat,  7 Aug 2021 13:09:39 +0200
Message-Id: <20210807110939.95853-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807110939.95853-1-f4bug@amsat.org>
References: <20210807110939.95853-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 12b6e9b27d4 ("disas: Clean up CPUDebug initialization")
the disassemble_info->bfd_endian enum is set for all targets in
target_disas(). We can directly call print_insn_nios2() and simplify.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/disas/dis-asm.h |  3 +--
 disas/nios2.c           | 22 +++-------------------
 target/nios2/cpu.c      |  6 +-----
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 524f29196d9..08e1beec854 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -455,8 +455,7 @@ int print_insn_crisv32          (bfd_vma, disassemble_info*);
 int print_insn_crisv10          (bfd_vma, disassemble_info*);
 int print_insn_microblaze       (bfd_vma, disassemble_info*);
 int print_insn_ia64             (bfd_vma, disassemble_info*);
-int print_insn_big_nios2        (bfd_vma, disassemble_info*);
-int print_insn_little_nios2     (bfd_vma, disassemble_info*);
+int print_insn_nios2(bfd_vma, disassemble_info*);
 int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
diff --git a/disas/nios2.c b/disas/nios2.c
index d124902ae3e..98ac07d72e9 100644
--- a/disas/nios2.c
+++ b/disas/nios2.c
@@ -3478,9 +3478,7 @@ nios2_disassemble (bfd_vma address, unsigned long opcode,
    instruction word at the address given, and prints the disassembled
    instruction on the stream info->stream using info->fprintf_func. */
 
-static int
-print_insn_nios2 (bfd_vma address, disassemble_info *info,
-		  enum bfd_endian endianness)
+int print_insn_nios2(bfd_vma address, disassemble_info *info)
 {
     bfd_byte buffer[INSNLEN];
     int status;
@@ -3488,7 +3486,7 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
     status = (*info->read_memory_func)(address, buffer, INSNLEN, info);
     if (status == 0) {
         unsigned long insn;
-        if (endianness == BFD_ENDIAN_BIG) {
+        if (info->endian == BFD_ENDIAN_BIG) {
             insn = (unsigned long) bfd_getb32(buffer);
         } else {
             insn = (unsigned long) bfd_getl32(buffer);
@@ -3501,7 +3499,7 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
         status = (*info->read_memory_func)(address, buffer, 2, info);
         if (status == 0) {
             unsigned long insn;
-            if (endianness == BFD_ENDIAN_BIG) {
+            if (info->endian == BFD_ENDIAN_BIG) {
                 insn = (unsigned long) bfd_getb16(buffer);
             } else {
                 insn = (unsigned long) bfd_getl16(buffer);
@@ -3514,17 +3512,3 @@ print_insn_nios2 (bfd_vma address, disassemble_info *info,
     (*info->memory_error_func)(status, address, info);
     return -1;
 }
-
-/* These two functions are the main entry points, accessed from
-   disassemble.c.  */
-int
-print_insn_big_nios2 (bfd_vma address, disassemble_info *info)
-{
-  return print_insn_nios2 (address, info, BFD_ENDIAN_BIG);
-}
-
-int
-print_insn_little_nios2 (bfd_vma address, disassemble_info *info)
-{
-  return print_insn_nios2 (address, info, BFD_ENDIAN_LITTLE);
-}
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 5e37defef80..5b503b5bb99 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -146,11 +146,7 @@ static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     /* NOTE: NiosII R2 is not supported yet. */
     info->mach = bfd_arch_nios2;
-#ifdef TARGET_WORDS_BIGENDIAN
-    info->print_insn = print_insn_big_nios2;
-#else
-    info->print_insn = print_insn_little_nios2;
-#endif
+    info->print_insn = print_insn_nios2;
 }
 
 static int nios2_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
-- 
2.31.1


