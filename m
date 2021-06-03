Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360CF399CA6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:35:17 +0200 (CEST)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiou-00024u-8X
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid6-0006e8-8y; Thu, 03 Jun 2021 04:23:04 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47615 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid4-00007b-32; Thu, 03 Jun 2021 04:23:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m54rDz9sxS; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=ySCPvq1ufsopI2v0SGDmuGJ5hbUYRmpkBaKTSEhwp7Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fhxZAPDL8xbvOr2kcn81RR8vPNAkdfsZvzFdpdUBSYPNGYXZ8/1zTrtp6mOmN/Fvv
 nUW/XcF3g7SkyCJUlI263NjL1Uz2Oh6o8+XwgmpRE5o0S6uAniB0zpxMg1Gnf1vbXn
 ykDTCiIed4ENQKjd3tad8T1/gG3PmouLqHywmGvE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 20/42] hw/core/cpu: removed cpu_dump_statistics function
Date: Thu,  3 Jun 2021 18:22:09 +1000
Message-Id: <20210603082231.601214-21-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

No more architectures set the pointer to dump_statistics, so there's no
point in keeping it, or the related cpu_dump_statistics function.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210526202104.127910-6-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210531145629.21300-2-bruno.larsen@eldorado.org.br>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/core/cpu-common.c  |  9 ---------
 include/hw/core/cpu.h | 12 ------------
 2 files changed, 21 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 9530e266ec..e2f5a64604 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -109,15 +109,6 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
     }
 }
 
-void cpu_dump_statistics(CPUState *cpu, int flags)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->dump_statistics) {
-        cc->dump_statistics(cpu, flags);
-    }
-}
-
 void cpu_reset(CPUState *cpu)
 {
     device_cold_reset(DEVICE(cpu));
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 044f668a6e..6b3bd3a1d4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -92,7 +92,6 @@ struct SysemuCPUOps;
  * @has_work: Callback for checking if there is work to do.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
- * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
@@ -134,7 +133,6 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
-    void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
@@ -534,16 +532,6 @@ enum CPUDumpFlags {
  */
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
-/**
- * cpu_dump_statistics:
- * @cpu: The CPU whose state is to be dumped.
- * @flags: Flags what to dump.
- *
- * Dump CPU statistics to the current monitor if we have one, else to
- * stdout.
- */
-void cpu_dump_statistics(CPUState *cpu, int flags);
-
 #ifndef CONFIG_USER_ONLY
 /**
  * cpu_get_phys_page_attrs_debug:
-- 
2.31.1


