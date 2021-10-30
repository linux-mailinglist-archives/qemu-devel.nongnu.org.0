Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8644062C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 02:04:05 +0200 (CEST)
Received: from localhost ([::1]:37400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbqu-0005CW-KO
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 20:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1mgbpV-0003sq-4Y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 20:02:37 -0400
Received: from rn-mailsvcp-ppex-lapp34.rno.apple.com ([17.179.253.43]:46978
 helo=rn-mailsvcp-ppex-lapp34.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1mgbpT-000500-BB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 20:02:36 -0400
Received: from pps.filterd (rn-mailsvcp-ppex-lapp34.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp34.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 19TNwR6a024863; Fri, 29 Oct 2021 17:02:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=20180706; bh=OY2FlHA3jijzs6NpeEDd8/ms0bUeg6GfneMONnwzUU4=;
 b=ecDznB1L4/h+ELN3n4wynivO4pucrOMG9VIQZwExOtUjBlyYsrReq0x+JdVQZayI9/FO
 aQfZ8uiPDLNKGCYVydpslPZn5FLYNc/eMJBXJyrS4FZmJYyHhQyOEe93zBBBHf5KePx4
 8Y7rfFNp2FD/xcY+A/Xyj8SPl4nx7A5hQnu++vupUo4ynlc8Mv7q9x3Gi4O3ldrNZ4mE
 p7+pdtNzFPRCxohx3hA220DL/mMbjLDd6E5E4V9u01NQegr78mHFFI6baUAizYUKb85J
 cshaJUmwxKnX+vna0x00jHmAls2xv3io3X7vR7uow6VWzBXPH388f8BHoAQzppMKcKp7 0Q== 
Received: from rn-mailsvcp-mta-lapp01.rno.apple.com
 (rn-mailsvcp-mta-lapp01.rno.apple.com [10.225.203.149])
 by rn-mailsvcp-ppex-lapp34.rno.apple.com with ESMTP id 3bx4ekg83v-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 29 Oct 2021 17:02:34 -0700
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R1R00SDLK495KA0@rn-mailsvcp-mta-lapp01.rno.apple.com>; 
 Fri, 29 Oct 2021 17:02:33 -0700 (PDT)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R1R00J00K0U5Q00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Fri,
 29 Oct 2021 17:02:33 -0700 (PDT)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: 94f84754fa52f9672cb2e32e9eeb55c4
X-Va-R-CD: cce84c1fe2f5ad098de41ebd7e8f4226
X-Va-CD: 0
X-Va-ID: d68610bd-d574-4956-b776-64d466e8afac
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: 94f84754fa52f9672cb2e32e9eeb55c4
X-V-R-CD: cce84c1fe2f5ad098de41ebd7e8f4226
X-V-CD: 0
X-V-ID: 4e98b55c-4213-446e-8a3c-a089bbc1bd93
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-29_06:2021-10-29,
 2021-10-29 signatures=0
Received: from Camerons-MBP.attlocal.net (unknown [17.11.135.171])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R1R00IMBK48X900@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Fri,
 29 Oct 2021 17:02:33 -0700 (PDT)
From: Cameron Esfahani <dirty@apple.com>
To: qemu-devel@nongnu.org
Cc: r.bolshakov@yadro.com
Subject: [PATCH] hvf: Fix OOB write in RDTSCP instruction decode
Date: Fri, 29 Oct 2021 17:02:32 -0700
Message-id: <20211030000232.2019-1-dirty@apple.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-10-29_06:2021-10-29,
 2021-10-29 signatures=0
Received-SPF: pass client-ip=17.179.253.43; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp34.apple.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

A guest could craft a specific stream of instructions that will have QEMU
write 0xF9 to inappropriate locations in memory.  Add additional asserts
to check for this.  Generate a #UD if there are more than 14 prefix bytes.

Found by Julian Stecklina <julian.stecklina@cyberus-technology.de>

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 target/i386/hvf/x86_decode.c | 11 +++++++++--
 target/i386/hvf/x86hvf.c     |  8 ++++++++
 target/i386/hvf/x86hvf.h     |  1 +
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index 062713b1a4..fbaf1813e8 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -24,6 +24,7 @@
 #include "vmx.h"
 #include "x86_mmu.h"
 #include "x86_descr.h"
+#include "x86hvf.h"
 
 #define OPCODE_ESCAPE   0xf
 
@@ -541,7 +542,8 @@ static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
     };
     decode->cmd = group[decode->modrm.reg];
     if (0xf9 == decode->modrm.modrm) {
-        decode->opcode[decode->len++] = decode->modrm.modrm;
+        VM_PANIC_ON(decode->opcode_len >= sizeof(decode->opcode));
+        decode->opcode[decode->opcode_len++] = decode->modrm.modrm;
         decode->cmd = X86_DECODE_CMD_RDTSCP;
     }
 }
@@ -1847,7 +1849,8 @@ void calc_modrm_operand(CPUX86State *env, struct x86_decode *decode,
 
 static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
 {
-    while (1) {
+    /* At most 14 prefix bytes. */
+    for (int i = 0; i < 14; i++) {
         /*
          * REX prefix must come after legacy prefixes.
          * REX before legacy is ignored.
@@ -1892,6 +1895,8 @@ static void decode_prefix(CPUX86State *env, struct x86_decode *decode)
             return;
         }
     }
+    /* Too many prefixes!  Generate #UD. */
+    hvf_inject_ud(env);
 }
 
 void set_addressing_size(CPUX86State *env, struct x86_decode *decode)
@@ -2090,11 +2095,13 @@ static void decode_opcodes(CPUX86State *env, struct x86_decode *decode)
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
2.30.1 (Apple Git-130)


