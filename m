Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872836117D6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:44:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRL-00047o-4k; Fri, 28 Oct 2022 12:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQf-0005p9-1i; Fri, 28 Oct 2022 12:41:58 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQd-0000Bj-FG; Fri, 28 Oct 2022 12:41:56 -0400
Received: by mail-oi1-x236.google.com with SMTP id i7so6714478oif.4;
 Fri, 28 Oct 2022 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T83PUgkd+r1phGLmG7MuQKxohI3qcCXar6Lkey9wzO4=;
 b=i9n4HXP/JIzzEn0AyMwlsxVieDHL6Bfp9gMvv4ZyphhxdFzflam6VGXouZBf3NDmtc
 r+uckyTM3pHZuuopt56gjVw4e1fTtE1+KETgguLyzPuIgzReUPY8/HrfZhmYrM4M/+aT
 /yGbRlBiJ8THC5kY9DG8w/teMIf+EA8OfS5+a535ICVRqEYoIdzas/3laFd5v79jvL7k
 +FIgMzwj8VpiGxAJw5gl80sYTpzN66/n5eK8dfnwpCxQvVTVmyn386hCRm46kfRo9U16
 AdY7UIZ0CNfrU+/O1ospnmapSIrmSCfyZvR3bCwZzaq7UbO+F/wXbIT3fNz4M2cbcxMt
 JkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T83PUgkd+r1phGLmG7MuQKxohI3qcCXar6Lkey9wzO4=;
 b=79S5QmfK3NYrslB5vrm7AmUBa3Hiix/3UItKryXdyczSt9xlC2Em6OF3bGWMnY6cs0
 fnDyyk6CVNkAkIe2hwtKDLbqJbkAsdiPFtjicGzBToXo2HXkQ2ORhmanVd9FGW749Fgv
 YBUc1oshkLZePBDTVF+LtT1zT/SrhGo1Schf0tp1CtdehmwPQ2xg8xEnC0VH8Gitu9DQ
 i7+6l8qHF/zoebr93bbwv3EKW4gkUMgPymdVf30Neft0pffw046h+XkyyhXmtVPtMgVZ
 FSYYC/Ufaf6eXBUsT8o4aEzPYkTvSWTNlNghn8tQ/168moqrLoxO+buE0qe/tQ2DzxLB
 cJZQ==
X-Gm-Message-State: ACrzQf331LDO5MA6xcTHBpUxrx1WQvWl7WN9srlMdM34kzanOOMGeaef
 jz4+prdoMhlYX0sbcc9WsjXam9Xr8FfYhQ==
X-Google-Smtp-Source: AMsMyM5+dJv7hX0EHjOZDAkqdFiLVG3vTLmI7VYUeKKsdzzdLCV/nsEEIEqCmGAjPHsagCC3ZDaKzA==
X-Received: by 2002:a05:6808:140a:b0:355:230f:b7f1 with SMTP id
 w10-20020a056808140a00b00355230fb7f1mr8640964oiv.8.1666975313817; 
 Fri, 28 Oct 2022 09:41:53 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 26/62] target/ppc: remove unused interrupts from
 p9_deliver_interrupt
Date: Fri, 28 Oct 2022 13:39:15 -0300
Message-Id: <20221028163951.810456-27-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Remove the following unused interrupts from the POWER9 interrupt
processing method:
- PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970 and POWER5p;
- Debug Interrupt: removed in Power ISA v2.07;
- Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
  for embedded CPUs;
- Critical Doorbell Interrupt: removed in Power ISA v3.0;
- Programmable Interval Timer: 40x-only.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-9-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 104b48dc43..288bb20deb 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1902,10 +1902,6 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
     CPUState *cs = env_cpu(env);
 
     switch (interrupt) {
-    case PPC_INTERRUPT_RESET: /* External reset */
-        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
-        powerpc_excp(cpu, POWERPC_EXCP_RESET);
-        break;
     case PPC_INTERRUPT_MCK: /* Machine check exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
         powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
@@ -1927,26 +1923,7 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
             powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
         }
         break;
-    case PPC_INTERRUPT_CEXT: /* External critical interrupt */
-        powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
-        break;
 
-    case PPC_INTERRUPT_WDT: /* Watchdog timer on embedded PowerPC */
-        env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
-        powerpc_excp(cpu, POWERPC_EXCP_WDT);
-        break;
-    case PPC_INTERRUPT_CDOORBELL:
-        env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
-        powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
-        break;
-    case PPC_INTERRUPT_FIT: /* Fixed interval timer on embedded PowerPC */
-        env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
-        powerpc_excp(cpu, POWERPC_EXCP_FIT);
-        break;
-    case PPC_INTERRUPT_PIT: /* Programmable interval timer on embedded ppc */
-        env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
-        powerpc_excp(cpu, POWERPC_EXCP_PIT);
-        break;
     case PPC_INTERRUPT_DECR: /* Decrementer exception */
         if (ppc_decr_clear_on_delivery(env)) {
             env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
@@ -1969,10 +1946,6 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
         env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
         powerpc_excp(cpu, POWERPC_EXCP_PERFM);
         break;
-    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
-        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
-        powerpc_excp(cpu, POWERPC_EXCP_THERM);
-        break;
     case PPC_INTERRUPT_EBB: /* EBB exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
         if (env->spr[SPR_BESCR] & BESCR_PMEO) {
-- 
2.37.3


