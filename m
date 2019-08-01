Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707E7E096
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 18:53:36 +0200 (CEST)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htEKd-0002Ok-Gc
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 12:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htEFa-0004vW-8y
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htEFY-0006Bb-4w
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:22 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35910 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htEFX-00067h-1B
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:20 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 238591A2233;
 Thu,  1 Aug 2019 18:48:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 092551A2264;
 Thu,  1 Aug 2019 18:48:15 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 18:45:18 +0200
Message-Id: <1564677923-23173-8-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564677923-23173-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564677923-23173-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 07/12] target/mips: Style
 improvements in cpu.c
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fixes mostly errors and warings reported by 'checkpatch.pl -f'.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 39eafaf..3ffa342 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -57,9 +57,11 @@ static bool mips_cpu_has_work(CPUState *cs)
     CPUMIPSState *env = &cpu->env;
     bool has_work = false;
 
-    /* Prior to MIPS Release 6 it is implementation dependent if non-enabled
-       interrupts wake-up the CPU, however most of the implementations only
-       check for interrupts that can be taken. */
+    /*
+     * Prior to MIPS Release 6 it is implementation dependent if non-enabled
+     * interrupts wake-up the CPU, however most of the implementations only
+     * check for interrupts that can be taken.
+     */
     if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
         cpu_mips_hw_interrupts_pending(env)) {
         if (cpu_mips_hw_interrupts_enabled(env) ||
@@ -70,8 +72,10 @@ static bool mips_cpu_has_work(CPUState *cs)
 
     /* MIPS-MT has the ability to halt the CPU.  */
     if (env->CP0_Config3 & (1 << CP0C3_MT)) {
-        /* The QEMU model will issue an _WAKE request whenever the CPUs
-           should be woken up.  */
+        /*
+         * The QEMU model will issue an _WAKE request whenever the CPUs
+         * should be woken up.
+         */
         if (cs->interrupt_request & CPU_INTERRUPT_WAKE) {
             has_work = true;
         }
@@ -112,7 +116,8 @@ static void mips_cpu_reset(CPUState *s)
 #endif
 }
 
-static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info) {
+static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
+{
     MIPSCPU *cpu = MIPS_CPU(s);
     CPUMIPSState *env = &cpu->env;
 
-- 
2.7.4


