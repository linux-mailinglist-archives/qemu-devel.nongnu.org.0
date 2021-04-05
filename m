Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A623542F0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:43:16 +0200 (CEST)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQRf-0000mc-Fu
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHH-0001OF-JQ
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHD-0001m5-1Y
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id x15so1888421wrq.3
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zGs+/a6m867yL6rfLe8mTVOQ7PBnfCMn1lHV2BxHIX0=;
 b=BQoIhA1w3OiQqfYUtLSC+KUxR8IBBarpfMBGUoJ+Mwe1KG0kn65DevV+zAKmL1T/GX
 Owv7psiUKFCGuZD/ezu1C1zg4evKAODvIbRO1Xs9uuU8didTcuw+Yg1o5hW4ocZCCK+O
 zUGX6zU5Kmjh367S6AAYytS5Q1UnIG+AHqWSKxsMH4pVtKN21B1cHCJwgJlhiYiLZbGX
 iF5f0n+JwxoEPn6TX5GWnN4kVe5vRsFhmoHS4uZHUG5UaamGpmm/WimEcYqF73E/43Bp
 kXrMGxZE7LS/X5fc+eX+E2gL9Ui9l6nANObzO7penC6/zIn7c2XpRezgsYQCQzslyzPX
 gjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGs+/a6m867yL6rfLe8mTVOQ7PBnfCMn1lHV2BxHIX0=;
 b=WJlMDCNlZkYCx85AS2dlXRJ61iziKHXBGda7SD28nbKb1uKOYivCxyu1lOajIE+Nb/
 Ogb6ydROTpExIC35ZMVyF6cKtXGZEN2sarka7GQieSMnWQFgEcddlHv6PocnDa1d56ad
 wEKJiXVTGH060QsKdn2l3IuHHPrnYjszoakQqe1tZm1fN6aLalYU8Typ9qKd58HnSLq3
 FsVjz9WHQR81RLxlW1/TvGm4fVcYWI+PhF9mMeu1HoZixo/ARy2fz2/wWAyNOYFpKk8t
 3XoXpK4nTS/zj6GAInmKOQc15YLQdTzCu2vBkCCIks/VdUjdgY0mc2nHhAEcdo4IwawW
 qTvQ==
X-Gm-Message-State: AOAM530w1W21UQA0OX2hWouX5c7TPoMxV1N724woC5KytyDhzcDrxjKM
 ntuuKJs+iALh97NuEfXXhdf0lJRECq0lyA==
X-Google-Smtp-Source: ABdhPJyiKrhVXWGQwQ9zM6+ML6HTOuOkgDVIluy3kdyzKLHrJuaKcVLSt9MInF76LT2VX8sfocoTdQ==
X-Received: by 2002:adf:c10a:: with SMTP id r10mr30717896wre.40.1617633145640; 
 Mon, 05 Apr 2021 07:32:25 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:25 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 17/27] arcv3: Core cpu file changes
Date: Mon,  5 Apr 2021 15:31:28 +0100
Message-Id: <20210405143138.17016-18-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 target/arc/arc-common.h | 19 +++++++++++++++----
 target/arc/cpu-param.h  | 10 ++++++++++
 target/arc/cpu.c        | 35 +++++++++++++++++++++++++++++++++++
 target/arc/cpu.h        | 12 ++++++++++++
 target/arc/meson.build  | 19 ++++++++++++++++---
 5 files changed, 88 insertions(+), 7 deletions(-)

diff --git a/target/arc/arc-common.h b/target/arc/arc-common.h
index ff9f97d457..a01e3c661d 100644
--- a/target/arc/arc-common.h
+++ b/target/arc/arc-common.h
@@ -14,37 +14,48 @@
 
 /* CPU combi. */
 #define ARC_OPCODE_ARCALL  (ARC_OPCODE_ARC600 | ARC_OPCODE_ARC700       \
-                            | ARC_OPCODE_ARCv2EM | ARC_OPCODE_ARCv2HS)
+                            | ARC_OPCODE_ARCv2EM | ARC_OPCODE_ARCv2HS   \
+                            | ARC_OPCODE_V3_ARC32 | ARC_OPCODE_V3_ARC64)
 #define ARC_OPCODE_ARCFPX  (ARC_OPCODE_ARC700 | ARC_OPCODE_ARCv2EM)
 #define ARC_OPCODE_ARCV1   (ARC_OPCODE_ARC700 | ARC_OPCODE_ARC600)
 #define ARC_OPCODE_ARCV2   (ARC_OPCODE_ARCv2EM | ARC_OPCODE_ARCv2HS)
 #define ARC_OPCODE_ARCMPY6E  (ARC_OPCODE_ARC700 | ARC_OPCODE_ARCV2)
 
+#define ARC_OPCODE_V3_ALL   (ARC_OPCODE_V3_ARC64 | ARC_OPCODE_V3_ARC32)
+
+#define ARC_OPCODE_V2_V3    (ARC_OPCODE_V3_ALL | ARC_OPCODE_ARCV2)
+#define ARC_OPCODE_ARCv2HS_AND_V3    (ARC_OPCODE_V3_ALL | ARC_OPCODE_ARCv2HS)
 
 enum arc_cpu_family {
     ARC_OPCODE_NONE    = 0,
+
     ARC_OPCODE_DEFAULT = 1 << 0,
     ARC_OPCODE_ARC600  = 1 << 1,
     ARC_OPCODE_ARC700  = 1 << 2,
     ARC_OPCODE_ARCv2EM = 1 << 3,
-    ARC_OPCODE_ARCv2HS = 1 << 4
+    ARC_OPCODE_ARCv2HS = 1 << 4,
+    ARC_OPCODE_V3_ARC32  = 1 << 5,
+    ARC_OPCODE_V3_ARC64  = 1 << 6
 };
 
 typedef struct {
-    uint32_t value;
+    uint64_t value;
     uint32_t type;
 } operand_t;
 
 typedef struct {
     uint32_t class;
-    uint32_t limm;
+    uint64_t limm;
     uint8_t len;
     bool limm_p;
+#define unsigned_limm_p limm_p
+    bool signed_limm_p;
     operand_t operands[3];
     uint8_t n_ops;
     uint8_t cc;
     uint8_t aa;
     uint8_t zz;
+#define zz_as_data_size zz
     bool d;
     bool f;
     bool di;
diff --git a/target/arc/cpu-param.h b/target/arc/cpu-param.h
index 512f4c8b75..9ad28fa693 100644
--- a/target/arc/cpu-param.h
+++ b/target/arc/cpu-param.h
@@ -20,11 +20,21 @@
 #ifndef ARC_CPU_PARAM_H
 #define ARC_CPU_PARAM_H 1
 
+#ifdef TARGET_ARCV2
 #define TARGET_LONG_BITS            32
 #define TARGET_PAGE_BITS            13
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 #define NB_MMU_MODES                2
+#endif
+
+#ifdef TARGET_ARCV3
+#define TARGET_LONG_BITS            64
+#define TARGET_PAGE_BITS            12
+#define TARGET_PHYS_ADDR_SPACE_BITS 48
+#define TARGET_VIRT_ADDR_SPACE_BITS 64
+#define NB_MMU_MODES                3
+#endif
 
 #endif
 
diff --git a/target/arc/cpu.c b/target/arc/cpu.c
index f1a5b2a7c1..da394f015a 100644
--- a/target/arc/cpu.c
+++ b/target/arc/cpu.c
@@ -193,6 +193,9 @@ static void arc_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
     case ARC_OPCODE_ARCv2HS:
         info->mach = bfd_mach_arc_arcv2hs;
         break;
+    case ARC_OPCODE_V3_ARC64:
+        info->mach = bfd_mach_arcv3_64;
+        break;
     default:
         info->mach = bfd_mach_arc_arcv2;
         break;
@@ -226,6 +229,7 @@ static void arc_cpu_realizefn(DeviceState *dev, Error **errp)
      */
     cpu->freq_hz = cpu->cfg.freq_hz;
 
+#ifdef TARGET_ARCV2
     cpu->isa_config = 0x02;
     switch (cpu->cfg.pc_size) {
     case 16:
@@ -291,6 +295,18 @@ static void arc_cpu_realizefn(DeviceState *dev, Error **errp)
       | (cpu->cfg.dmp_unaligned ? BIT(22) : 0) | BIT(23)
       | (cpu->cfg.code_density ? (2 << 24) : 0) | BIT(28);
 
+#elif TARGET_ARCV3
+    cpu->isa_config = 0x03        /* ver */
+                      | (1 << 8)  /* va_size: 48-bit */
+                      | (1 << 16) /* pa_size: 48-bit */
+                      | ((cpu->cfg.byte_order ? 1 : 0) << 20) /* endian */
+                      | (1 << 21) /* atomic=1: LLOCK, LLOCKL, WLFC */
+                      | ((cpu->cfg.dmp_unaligned ? 1 : 0) << 23) /* unaliged access */
+                      | (0 << 24) /* 128-bit load/store TBD */
+                      | (3 << 26) /* Code density instructions */
+                      | (0 << 28); /* 64-bit DIV/REM TBD */
+#endif
+
     arc_initializeTIMER(cpu);
     arc_initializeIRQ(cpu);
 
@@ -379,7 +395,11 @@ static void arc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arc_cpu_gdb_write_register;
 
     /* Core GDB support */
+#ifdef TARGET_ARCV2
     cc->gdb_core_xml_file = "arc-v2-core.xml";
+#else
+    cc->gdb_core_xml_file = "arc-core-v3.xml";
+#endif
     cc->gdb_num_core_regs = GDB_REG_LAST;
     cc->gdb_arch_name = arc_gdb_arch_name;
 
@@ -395,6 +415,7 @@ static void arc_any_initfn(Object *obj)
     cpu->family = ARC_OPCODE_ARC700;
 }
 
+#ifdef TARGET_ARCV2
 static void arc600_initfn(Object *obj)
 {
     ARCCPU *cpu = ARC_CPU(obj);
@@ -418,6 +439,15 @@ static void archs_initfn(Object *obj)
     ARCCPU *cpu = ARC_CPU(obj);
     cpu->family = ARC_OPCODE_ARCv2HS;
 }
+#endif
+
+#ifdef TARGET_ARCV3
+static void arc64_initfn(Object *obj)
+{
+    ARCCPU *cpu = ARC_CPU(obj);
+    cpu->family = ARC_OPCODE_V3_ARC64;
+}
+#endif
 
 typedef struct ARCCPUInfo {
     const char     *name;
@@ -425,10 +455,15 @@ typedef struct ARCCPUInfo {
 } ARCCPUInfo;
 
 static const ARCCPUInfo arc_cpus[] = {
+#ifdef TARGET_ARCV2
     { .name = "arc600", .initfn = arc600_initfn },
     { .name = "arc700", .initfn = arc700_initfn },
     { .name = "arcem", .initfn = arcem_initfn },
     { .name = "archs", .initfn = archs_initfn },
+#endif
+#ifdef TARGET_ARCV3
+    { .name = "arc64", .initfn = arc64_initfn },
+#endif
     { .name = "any", .initfn = arc_any_initfn },
 };
 
diff --git a/target/arc/cpu.h b/target/arc/cpu.h
index 37d2a3582f..d529732fb5 100644
--- a/target/arc/cpu.h
+++ b/target/arc/cpu.h
@@ -25,6 +25,7 @@
 
 #include "target/arc/arc-common.h"
 #include "target/arc/mmu.h"
+#include "target/arc/mmu-v6.h"
 #include "target/arc/mpu.h"
 #include "target/arc/cache.h"
 
@@ -66,8 +67,15 @@ enum exception_code_list {
     EXCP_MEMORY_ERROR,
     EXCP_INST_ERROR,
     EXCP_MACHINE_CHECK,
+#ifdef TARGET_ARCV2
     EXCP_TLB_MISS_I,
     EXCP_TLB_MISS_D,
+#elif TARGET_ARCV3
+    EXCP_IMMU_FAULT,
+    EXCP_DMMU_FAULT,
+#else
+    #error "TARGET macro not defined!"
+#endif
     EXCP_PROTV,
     EXCP_PRIVILEGEV,
     EXCP_SWI,
@@ -244,7 +252,11 @@ typedef struct CPUARCState {
     uint32_t causecode;
     uint32_t param;
 
+#ifdef TARGET_ARCV2
     struct arc_mmu mmu;       /* mmu.h */
+#elif TARGET_ARCV3
+    struct arc_mmuv6 mmu;       /* mmu.h */
+#endif
     ARCMPU mpu;               /* mpu.h */
     struct arc_cache cache;   /* cache.h */
 
diff --git a/target/arc/meson.build b/target/arc/meson.build
index 9bbfb01f98..9d633553a8 100644
--- a/target/arc/meson.build
+++ b/target/arc/meson.build
@@ -1,16 +1,29 @@
+dir = meson.current_source_dir()
+
+gen32 = [
+    dir + '/decoder.c',
+    dir + '/semfunc.c',
+    dir + '/mmu.c',
+]
+gen64 = [
+    dir + '/decoder-v3.c',
+    dir + '/semfunc-v3.c',
+    dir + '/mmu-v6.c',
+]
+
 arc_softmmu_ss = ss.source_set()
+arc_softmmu_ss.add(when: 'TARGET_ARCV2', if_true: gen32)
+arc_softmmu_ss.add(when: 'TARGET_ARCV3', if_true: gen64)
+
 arc_softmmu_ss.add(files(
   'translate.c',
   'helper.c',
   'cpu.c',
   'op_helper.c',
   'gdbstub.c',
-  'decoder.c',
   'regs.c',
   'regs-impl.c',
-  'semfunc.c',
   'semfunc-helper.c',
-  'mmu.c',
   'mpu.c',
   'timer.c',
   'irq.c',
-- 
2.20.1


