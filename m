Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C90E4BC619
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 07:54:41 +0100 (CET)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLJde-0000VB-8U
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 01:54:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nLJOi-0005nF-D1
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:39:13 -0500
Received: from rn-mailsvcp-ppex-lapp14.rno.apple.com ([17.179.253.33]:32884
 helo=rn-mailsvcp-ppex-lapp14.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nLJOY-0005jn-8h
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 01:39:10 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp14.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp14.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 21J6ULtW017183; Fri, 18 Feb 2022 22:38:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=mime-version :
 content-transfer-encoding : content-type : from : to : cc : subject : date
 : message-id; s=20180706; bh=oaXv3wVkdGLQAuZ7w+/XlCmt1JSZ0lPtn+8v4hDIIoQ=;
 b=Idn9mz8zHgI8amiCBPmL5NnBGg69MqKo/iUV+lYvI4HPJOwrW8wOBgGxktOXeZ3/R73a
 xrmmP+0XivoRS6khi4AtcTNGNnAZKotuom5nhxwwDV6vzdwFMMJFn25NNwx2r0qu9ScD
 Zd2elBTOzZ74RwpDdrkLpylfjhvw0a9+m1hCIaivF2qLC6bGIPqNwpnjQXKyUcUDjvJj
 P/kqvQaIubZDig8i1AhOdj3DjswsZ2YnZI4xfDuLyevwdE7qZtMNEUjU5K4zRHjeEBsI
 0DHZjg1V7fbUTdjtPYPKlN23oxRAXj2zW8uc2/AyjiHkkjiOXikUb7BQ3BrizSsGxZ1c fg== 
Received: from rn-mailsvcp-mta-lapp04.rno.apple.com
 (rn-mailsvcp-mta-lapp04.rno.apple.com [10.225.203.152])
 by rn-mailsvcp-ppex-lapp14.rno.apple.com with ESMTP id 3e8n96mqey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 18 Feb 2022 22:38:33 -0800
Received: from rn-mailsvcp-mmp-lapp03.rno.apple.com
 (rn-mailsvcp-mmp-lapp03.rno.apple.com [17.179.253.16])
 by rn-mailsvcp-mta-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R7J003QDH48TXA0@rn-mailsvcp-mta-lapp04.rno.apple.com>; 
 Fri, 18 Feb 2022 22:38:33 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp03.rno.apple.com by
 rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R7J00M00GQI2000@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Fri,
 18 Feb 2022 22:38:32 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: a0ba7d280f99f60e8be384013c14f3a8
X-Va-R-CD: 4990798ec739126a18fe526a5e818c7f
X-Va-CD: 0
X-Va-ID: e8527a95-d0db-481f-8f9d-3ea2f7e8c815
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: a0ba7d280f99f60e8be384013c14f3a8
X-V-R-CD: 4990798ec739126a18fe526a5e818c7f
X-V-CD: 0
X-V-ID: 2d6f927f-bd61-4874-914d-e6748ffd7e46
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-19_02:2022-02-17,
 2022-02-19 signatures=0
MIME-version: 1.0
Content-transfer-encoding: 8BIT
Content-type: text/plain; charset=UTF-8
Received: from localhost.localdomain (unknown [17.11.185.55])
 by rn-mailsvcp-mmp-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R7J00Q7AH47J900@rn-mailsvcp-mmp-lapp03.rno.apple.com>; Fri,
 18 Feb 2022 22:38:32 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
To: qemu-devel@nongnu.org
Cc: r.bolshakov@yadro.com, f4bug@amsat.org
Subject: [PATCH v2] hvf: Fix OOB write in RDTSCP instruction decode
Date: Fri, 18 Feb 2022 22:38:31 -0800
Message-id: <20220219063831.35356-1-dirty@apple.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-19_02:2022-02-17,
 2022-02-19 signatures=0
Received-SPF: pass client-ip=17.179.253.33; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp14.apple.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A guest could craft a specific stream of instructions that will have QEMU
write 0xF9 to inappropriate locations in memory.  Add additional asserts
to check for this.  Generate a #UD if there are more than 14 prefix bytes.

Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>

Signed-off-by: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86_decode.c | 12 ++++++++++--
 target/i386/hvf/x86hvf.c     |  8 ++++++++
 target/i386/hvf/x86hvf.h     |  1 +
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index 062713b1a4..5d051252b4 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -24,8 +24,10 @@
 #include "vmx.h"
 #include "x86_mmu.h"
 #include "x86_descr.h"
+#include "x86hvf.h"
 
 #define OPCODE_ESCAPE   0xf
+#define X86_MAX_INSN_PREFIX_LENGTH (14)
 
 static void decode_invalid(CPUX86State *env, struct x86_decode *decode)
 {
@@ -541,7 +543,8 @@ static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
     };
     decode->cmd = group[decode->modrm.reg];
     if (0xf9 == decode->modrm.modrm) {
-        decode->opcode[decode->len++] = decode->modrm.modrm;
+        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
+        decode->opcode[decode->opcode_len++] = decode->modrm.modrm;
         decode->cmd = X86_DECODE_CMD_RDTSCP;
     }
 }
@@ -1847,7 +1850,8 @@ void calc_modrm_operand(CPUX86State *env, struct x86_decode *decode,
 
 static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
 {
-    while (1) {
+    /* At most X86_MAX_INSN_PREFIX_LENGTH prefix bytes. */
+    for (int i = 0; i < X86_MAX_INSN_PREFIX_LENGTH; i++) {
         /*
          * REX prefix must come after legacy prefixes.
          * REX before legacy is ignored.
@@ -1892,6 +1896,8 @@ static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
             return;
         }
     }
+    /* Too many prefixes!  Generate #UD. */
+    hvf_inject_ud(env);
 }
 
 void set_addressing_size(CPUX86State *env, struct x86_decode *decode)
@@ -2090,11 +2096,13 @@ static void decode_opcodes(CPUX86State *env, struct x86_decode *decode)
     uint8_t opcode;
 
     opcode = decode_byte(env, decode);
+    VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
     decode->opcode[decode->opcode_len++] = opcode;
     if (opcode != OPCODE_ESCAPE) {
         decode_opcode_1(env, decode, opcode);
     } else {
         opcode = decode_byte(env, decode);
+        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
         decode->opcode[decode->opcode_len++] = opcode;
         decode_opcode_2(env, decode, opcode);
     }
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 05ec1bddc4..a805c125d9 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -425,6 +425,14 @@ bool hvf_inject_interrupts(CPUState *cpu_state)
             & (CPU_INTERRUPT_INIT | CPU_INTERRUPT_TPR));
 }
 
+void hvf_inject_ud(CPUX86State *env)
+{
+    env->exception_nr = EXCP06_ILLOP;
+    env->exception_injected = 1;
+    env->has_error_code = false;
+    env->error_code = 0;
+}
+
 int hvf_process_events(CPUState *cpu_state)
 {
     X86CPU *cpu = X86_CPU(cpu_state);
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index 99ed8d608d..ef472a32f9 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -22,6 +22,7 @@
 
 int hvf_process_events(CPUState *);
 bool hvf_inject_interrupts(CPUState *);
+void hvf_inject_ud(CPUX86State *);
 void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
 void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
-- 
2.32.0 (Apple Git-132)


