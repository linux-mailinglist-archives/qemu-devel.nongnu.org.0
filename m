Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB356720D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:06:59 +0200 (CEST)
Received: from localhost ([::1]:40730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8k8h-00045j-0r
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0i-0001Th-0k; Tue, 05 Jul 2022 10:58:45 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:42629
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0g-00012t-Er; Tue, 05 Jul 2022 10:58:43 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lcm5X0bFvz4xj3;
 Wed,  6 Jul 2022 00:58:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lcm5T20nxz4xj5;
 Wed,  6 Jul 2022 00:58:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 5/5] ppc: Remove unused irq_inputs
Date: Tue,  5 Jul 2022 16:58:14 +0200
Message-Id: <20220705145814.461723-6-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220705145814.461723-1-clg@kaod.org>
References: <20220705145814.461723-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=52tn=XK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/cpu.h      | 1 -
 target/ppc/cpu_init.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 6d78078f379d..2166d2c4b692 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1172,7 +1172,6 @@ struct CPUArchState {
      * by recent Book3s compatible CPUs (POWER7 and newer).
      */
     uint32_t irq_input_state;
-    void **irq_inputs;
 
     target_ulong excp_vectors[POWERPC_EXCP_NB]; /* Exception vectors */
     target_ulong excp_prefix;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index c16cb8dbe7a5..9f9a8e998e7c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6672,7 +6672,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
 #if !defined(CONFIG_USER_ONLY)
     int i;
 
-    env->irq_inputs = NULL;
     /* Set all exception vectors to an invalid address */
     for (i = 0; i < POWERPC_EXCP_NB; i++) {
         env->excp_vectors[i] = (target_ulong)(-1ULL);
@@ -6802,10 +6801,6 @@ static void init_ppc_proc(PowerPCCPU *cpu)
         /* Pre-compute some useful values */
         env->tlb_per_way = env->nb_tlb / env->nb_ways;
     }
-    if (env->irq_inputs == NULL) {
-        warn_report("no internal IRQ controller registered."
-                    " Attempt QEMU to crash very soon !");
-    }
 #endif
     if (env->check_pow == NULL) {
         warn_report("no power management check handler registered."
-- 
2.35.3


