Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9F91947DB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 20:49:33 +0100 (CET)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHYVQ-0001Qv-HO
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 15:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKq-0007Ky-67
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1jHYKn-0001tY-7d
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:35 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:39025)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1jHYKn-0001sy-0v
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:38:33 -0400
Received: by mail-qk1-x744.google.com with SMTP id b62so8195786qkf.6
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4hrOWLlZCdJWXysypnArxYHpdNRngJdlfVjmEHFHi0=;
 b=HVYmB6wPvjDbchC+vTqGW66dLrmRcml/Xi7ln9v9js3rGBVa61x7jeBfkCrBPE/2HT
 Q0h6IUVM9jvsx4lGr+NE/8qtNBr6fQhwHNzui/EVxwM4p8mCSsvhgOBEth6/Foid6e9D
 TXOMDWZxxJEsQHG9OgjJLPN5y+sSHyz8MrtClsTWKqAuJ/jE1n9Acz/wALrMToj6UYCw
 jFIJEfMOxEppZb5jAClfK86/PFGSPNvmbySqLAYkScw+231VJceqVSyqBurEf6F5/50Z
 goI9ydu/DqzhTptHZ0EBr9DSCQsWvV3lR6jHNSyl6pcCxfLhDWb9QkMvROywLjng2AJ4
 943g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4hrOWLlZCdJWXysypnArxYHpdNRngJdlfVjmEHFHi0=;
 b=ceMIuNXKjxwtZGS8/CkoNG5fX7gAFq46GV4LxurSN+uDi+2vocvvo6xna4GXVaQt5q
 ZzbkSOUGfc+2UmiHRSlZlP5vHZxgiSuaFwi48mJzgHlA+/YVFGuz00rFigKe2lyFLzSg
 u8LfYWrFaHMKg77L8qzttnEfbi2NKZgrdunOf/Ie9lAdo1SVqGZQk0NIbietQFJiHodk
 i977+chkyUg0zT+bwILByN8RIeJUjif5jX1zm7itbSehegOr0WXDhzL44PSkJWrNSUkC
 0sI/pPRv77CkIBBnIM5Fd2/+EuCs8ovdHNdwtY2WuDs3cUKd/ZYyXTxqzje5XV2/dgs6
 OplA==
X-Gm-Message-State: ANhLgQ2ztgM2f3AfOKAAYvet3jB/H9izyEg3MCeaYfqKoQNs6M1zvcQO
 0K01hfDUPb6qqB70DsF14SacNXPjVdF2IA==
X-Google-Smtp-Source: ADFU+vuOhRFawvfDJiX7HtbEu+lKG+hhMuU+4yp0fDelVVfUhZXWi9F9f+NMbWeQzNR1Ug/yjHtfKw==
X-Received: by 2002:a05:620a:100b:: with SMTP id
 z11mr9783398qkj.382.1585251511958; 
 Thu, 26 Mar 2020 12:38:31 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:fd55:4e67:1038:8302])
 by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 12:38:31 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 42/74] i386/hax-all: convert to cpu_interrupt_request
Date: Thu, 26 Mar 2020 15:31:24 -0400
Message-Id: <20200326193156.4322-43-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: richard.henderson@linaro.org, "Emilio G. Cota" <cota@braap.org>,
 alex.bennee@linaro.org, robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
[RF: Converted new code to cpu_interrupt_request]
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/i386/hax-all.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 1edd6c77df..66de14b27b 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -285,7 +285,7 @@ int hax_vm_destroy(struct hax_vm *vm)
 
 static void hax_handle_interrupt(CPUState *cpu, int mask)
 {
-    cpu->interrupt_request |= mask;
+    cpu_interrupt_request_or(cpu, mask);
 
     if (!qemu_cpu_is_self(cpu)) {
         qemu_cpu_kick(cpu);
@@ -419,7 +419,7 @@ static int hax_vcpu_interrupt(CPUArchState *env)
      * Unlike KVM, HAX kernel check for the eflags, instead of qemu
      */
     if (ht->ready_for_interrupt_injection &&
-        (cpu->interrupt_request & CPU_INTERRUPT_HARD)) {
+        (cpu_interrupt_request(cpu) & CPU_INTERRUPT_HARD)) {
         int irq;
 
         irq = cpu_get_pic_interrupt(env);
@@ -433,7 +433,7 @@ static int hax_vcpu_interrupt(CPUArchState *env)
      * interrupt, request an interrupt window exit.  This will
      * cause a return to userspace as soon as the guest is ready to
      * receive interrupts. */
-    if ((cpu->interrupt_request & CPU_INTERRUPT_HARD)) {
+    if ((cpu_interrupt_request(cpu) & CPU_INTERRUPT_HARD)) {
         ht->request_interrupt_window = 1;
     } else {
         ht->request_interrupt_window = 0;
@@ -472,7 +472,7 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
         return 0;
     }
 
-    if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
+    if (cpu_interrupt_request(cpu) & CPU_INTERRUPT_POLL) {
         cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
         apic_poll_irq(x86_cpu->apic_state);
     }
@@ -495,20 +495,20 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
      *  c) INIT signal;
      *  d) SIPI signal.
      */
-    if (((cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
+    if (((cpu_interrupt_request(cpu) & CPU_INTERRUPT_HARD) &&
          (env->eflags & IF_MASK)) ||
-        (cpu->interrupt_request & CPU_INTERRUPT_NMI)) {
+        (cpu_interrupt_request(cpu) & CPU_INTERRUPT_NMI)) {
         cpu_halted_set(cpu, 0);
     }
 
-    if (cpu->interrupt_request & CPU_INTERRUPT_INIT) {
+    if (cpu_interrupt_request(cpu) & CPU_INTERRUPT_INIT) {
         DPRINTF("\nhax_vcpu_hax_exec: handling INIT for %d\n",
                 cpu->cpu_index);
         do_cpu_init(x86_cpu);
         hax_vcpu_sync_state(env, 1);
     }
 
-    if (cpu->interrupt_request & CPU_INTERRUPT_SIPI) {
+    if (cpu_interrupt_request(cpu) & CPU_INTERRUPT_SIPI) {
         DPRINTF("hax_vcpu_hax_exec: handling SIPI for %d\n",
                 cpu->cpu_index);
         hax_vcpu_sync_state(env, 0);
@@ -577,13 +577,17 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
             ret = -1;
             break;
         case HAX_EXIT_HLT:
-            if (!(cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
-                !(cpu->interrupt_request & CPU_INTERRUPT_NMI)) {
-                /* hlt instruction with interrupt disabled is shutdown */
-                env->eflags |= IF_MASK;
-                cpu_halted_set(cpu, 1);
-                cpu->exception_index = EXCP_HLT;
-                ret = 1;
+            {
+                uint32_t interrupt_request = cpu_interrupt_request(cpu);
+
+                if (!(interrupt_request & CPU_INTERRUPT_HARD) &&
+                    !(interrupt_request & CPU_INTERRUPT_NMI)) {
+                    /* hlt instruction with interrupt disabled is shutdown */
+                    env->eflags |= IF_MASK;
+                    cpu_halted_set(cpu, 1);
+                    cpu->exception_index = EXCP_HLT;
+                    ret = 1;
+                }
             }
             break;
         /* these situations will continue to hax module */
-- 
2.17.1


