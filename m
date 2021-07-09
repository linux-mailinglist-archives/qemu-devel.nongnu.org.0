Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1DD3C1ED1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:19:59 +0200 (CEST)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ive-0003wF-0i
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itY-0000rO-4b; Fri, 09 Jul 2021 01:17:48 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54881 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itV-0001pG-HF; Fri, 09 Jul 2021 01:17:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHc6kZcz9sWS; Fri,  9 Jul 2021 15:17:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807852;
 bh=gXUuEtCR4TYTn8HM+OXKsTlWBnv4uXGKfvHWjycKEmM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bj2Fx91Tws2Ih2gf819nhQp6jCkv+FOaJNnGiTh6CYvvsWbSGFCxpa1TNBYG1m5bC
 iEs8lmgR0PcYTPrqFzhv9bYjsR1dyG4512byo02tYs8Y+7J0SD38mekM8vNc4yIrbv
 deYqbHOIrOn4m6A+eflnWDiHvrRxUW4PtqksjmoM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/33] target/ppc: Drop PowerPCCPUClass::interrupts_big_endian()
Date: Fri,  9 Jul 2021 15:16:57 +1000
Message-Id: <20210709051728.170203-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

This isn't used anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210622140926.677618-3-groug@kaod.org>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu-qom.h  |  1 -
 target/ppc/cpu_init.c | 17 -----------------
 2 files changed, 18 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 06b6571bc9..7b424e3cb0 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -199,7 +199,6 @@ struct PowerPCCPUClass {
     void (*init_proc)(CPUPPCState *env);
     int  (*check_pow)(CPUPPCState *env);
     int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu_idx);
-    bool (*interrupts_big_endian)(PowerPCCPU *cpu);
 };
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d0411e7302..1a22aef874 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2666,18 +2666,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
     return 0;
 }
 
-static bool ppc_cpu_interrupts_big_endian_always(PowerPCCPU *cpu)
-{
-    return true;
-}
-
-#ifdef TARGET_PPC64
-static bool ppc_cpu_interrupts_big_endian_lpcr(PowerPCCPU *cpu)
-{
-    return !(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
-}
-#endif
-
 /*****************************************************************************/
 /* PowerPC implementations definitions                                       */
 
@@ -7740,7 +7728,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX;
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
-    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
 }
 
 static void init_proc_POWER8(CPUPPCState *env)
@@ -7918,7 +7905,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX | POWERPC_FLAG_TM;
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
-    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
 }
 
 #ifdef CONFIG_SOFTMMU
@@ -8136,7 +8122,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
-    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
 }
 
 #ifdef CONFIG_SOFTMMU
@@ -8347,7 +8332,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
     pcc->l1_dcache_size = 0x8000;
     pcc->l1_icache_size = 0x8000;
-    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_lpcr;
 }
 
 #if !defined(CONFIG_USER_ONLY)
@@ -9094,7 +9078,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
                                       &pcc->parent_unrealize);
     pcc->pvr_match = ppc_pvr_match_default;
-    pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_always;
     device_class_set_props(dc, ppc_cpu_properties);
 
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
-- 
2.31.1


