Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622A399D75
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:09:49 +0200 (CEST)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojMK-00078z-5g
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGU-0004gs-HZ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:48 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojGS-0000Lm-AD
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:03:45 -0400
Received: by mail-ej1-x62b.google.com with SMTP id g8so8170755ejx.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O9+spEcANDKYx8HcPdHHRJ407zGYpuqHR7eNVlkhEK0=;
 b=P+GQzUDBJKchMe+VJFjm2byIVSgkNkT+dQHKhqtqG1WVw9NJCJ3jPz+OYPWU0QnrqJ
 7lxK1rHTStON3JWralPF/3pDicxZRnORwl+Eg5Of8danL5m+QqQU50yVTjGxxXrK0WF+
 MED/44icC6RiRI11Sl5mRoJYTuR4MOaEb4V+Uws5NZARR1yHcxlh194MlL4QDbR8Vz8L
 zKglPiY2c+zZ68u1DtYOqeOt67ff2uJA8DDaGiYn9mnsZDvE2Ece+H50MBsBgn3MEa+Q
 zLdTUcGOcfZK6HVC0WPfdbFXC+h91dzIUqBWehy1Sh465R1dJrgpmWIrA4I8/d6DbXfA
 o4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O9+spEcANDKYx8HcPdHHRJ407zGYpuqHR7eNVlkhEK0=;
 b=FIFw0nKZ2DFsSCtx2OHFy+jyjuHOEidSgufMZZsIxqsOJal4ZQuxT9umvOxg4PyGR6
 Go3PDE3+Rq2AnHpBjBhWl9aCBXvH7kV1CBw+E9Ri2L14RvruykINk8udS7dQsxjtvAP/
 IfHhhNyLbfpP5iKfQkoGYUMwY7eDS5FXhxOQq/R9EajYm1jJ8yyLIFxDsFT6wvq1/nlS
 9kYVi3Ss8u+3jazVymVTLBDPIidMdoNoID+1Vnp55DmSPpJZBmXLtPvRgVnSgv8PMxa7
 xHC+3i9mUugzAe/Xtx+pmL3J8lC3ib/eTfBasuZVzAXD5RJDPkspbC9ObOQueI7pqp7r
 uRgA==
X-Gm-Message-State: AOAM530DCrJwLY9NoY/nZ3SBfGus9ZGQQk3zCz0GkTTqGfXozvjIzHth
 tfkg6MFqDU4diFOV2R0Zci+3vCDpaYq4Pg==
X-Google-Smtp-Source: ABdhPJwEhVO/WNqBx4Wb2gI5thEygerLdYOLoPG9K7p1SprDxZcbEbt+HkrK3HYqgMpZn1dQ1QNJqg==
X-Received: by 2002:a17:906:22c6:: with SMTP id
 q6mr38534524eja.275.1622711022264; 
 Thu, 03 Jun 2021 02:03:42 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id r12sm1371078edv.82.2021.06.03.02.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:03:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/microblaze: Set OPB bits in tlb_fill,
 not in transaction_failed
Date: Thu,  3 Jun 2021 11:03:10 +0200
Message-Id: <20210603090310.2749892-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210603090310.2749892-1-f4bug@amsat.org>
References: <20210603090310.2749892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the 'MicroBlaze Processor Reference Guide' UG081 (v9.0),
"Hardware Exceptions" chapter:

  Exception Causes:

  * Instruction Bus Exception

  The instruction On-chip Peripheral Bus exception is caused by an
  active error signal from the slave (IOPB_errAck) or timeout signal
  from the arbiter (IOPB_timeout).

  * Data Bus Exception

  The data On-chip Peripheral Bus exception is caused by an active
  error signal from the slave (DOPB_errAck) or timeout signal from
  the arbiter (DOPB_timeout).

the table 1-24 (Processor Version Register 2):

  * IOPBEXC:  Generate exception for IOPB error

  * DOPBEXC: Generate exception for DOPB error

and the table 2-12 (MPD Parameters):

  * C_IOPB_BUS_EXCEPTION

  Enable exception handling for IOPB bus error

  * C_DOPB_BUS_EXCEPTION

  Enable exception handling for DOPB bus error

So if PVR2.[ID]OPBEXC feature is disabled, no exception will be
generated. Thus we can not get to the transaction_failed() handler.
The ESR bits have to be set in tlb_fill().

However we never implemented the MMU check whether the address belong
to the On-chip Peripheral Bus interface, so simply add a stub for it,
warning the feature is not implemented.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/helper.c    | 19 +++++++++++++++++++
 target/microblaze/op_helper.c | 13 -------------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index d537f300ca6..60e62bc0710 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -56,6 +56,18 @@ static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
     }
 }
 
+/* On-chip Peripheral Bus (OPB) interface */
+static bool mb_cpu_address_is_opb(MicroBlazeCPU *cpu,
+                                  vaddr address, unsigned size)
+{
+    if (cpu->cfg.iopb_bus_exception || cpu->cfg.dopb_bus_exception) {
+        /* TODO */
+        warn_report_once("On-chip Peripheral Bus (OPB) interface "
+                         "feature not implemented.");
+    }
+    return false;
+}
+
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr)
@@ -119,6 +131,13 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     default:
         abort();
     }
+    if (mb_cpu_address_is_opb(cpu, address, size)) {
+        if (access_type == MMU_INST_FETCH) {
+            env->esr = ESR_EC_INSN_BUS;
+        } else {
+           env->esr = ESR_EC_DATA_BUS;
+        }
+    }
 
     if (cs->exception_index == EXCP_MMU) {
         cpu_abort(cs, "recursive faults\n");
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index 1048e656e27..171c4cf99a0 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -123,19 +123,6 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                   (access_type == MMU_DATA_LOAD ? "DATA_LOAD" : "DATA_STORE"));
 
     assert(env->msr & MSR_EE);
-
-    if (access_type == MMU_INST_FETCH) {
-        if (!cpu->cfg.iopb_bus_exception) {
-            return;
-        }
-        env->esr = ESR_EC_INSN_BUS;
-    } else {
-        if (!cpu->cfg.dopb_bus_exception) {
-            return;
-        }
-        env->esr = ESR_EC_DATA_BUS;
-    }
-
     env->ear = addr;
     cs->exception_index = EXCP_HW_EXCP;
     cpu_loop_exit_restore(cs, retaddr);
-- 
2.26.3


