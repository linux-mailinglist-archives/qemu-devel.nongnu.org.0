Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2E2603BA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 19:53:58 +0200 (CEST)
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFLL3-0001H2-E4
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 13:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLIP-0004mZ-Lv
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:13 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kFLIN-0000l4-U6
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 13:51:13 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g29so8326633pgl.2
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zy2FzO7iuFKd4JYIhnxO7lsGxmERptfll6SXeVwIiBI=;
 b=jLYgVtbsR0lOo4715OOOsM+3sxgZmkkslIANSxtrYeCHJwT7wNmz/yIx6Y7nTp6Vtd
 sb3w+MtEszBSLU6BVc8bCwug8lf/fK7EF0e16sBbHZb/CHkgdHK5rzP6V6qJPyFCakwP
 V9UlCSH1EeFKBiGv9MNGmwoqf9DeEiATAuaOFUmhOSr+FFozTr3gE/NTpmkBy3sG5ICo
 EIKrDGLUxaD8RtjqPpbdysJSJ5n8gIPFAzIPBhAit56p787q3Qaxu6vzkS+92P+FiSyY
 gNWiDHRFSvS9LdnpWxaDaioXptqu9Cs5a+KwrYoPCNFBG9m8kFZpbX05F9FSYzmJ1ytu
 2PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zy2FzO7iuFKd4JYIhnxO7lsGxmERptfll6SXeVwIiBI=;
 b=JGpmychXDisKz806lf5KVHjRhIE/vJOr6c9AKShDOgJDI7FPnWLsEoPo2yRodktmhK
 o9h+hmrwW69VE71cZ3x7ECIILCCJnQy9PMEazepAwQrreRmqdGPQRsq5pjPCZetbp4lK
 u1fH4dM/usS7n61i6l6q5am4Bxol8qQs+sJZCrkvrDDQx1Ld963YIXq0t5CWW3yjC84Y
 gElyQ4cr1vzIZRxBP62rs6XdpniHuokKg3pS1nvy6500fxzeTzFk7Vtb6iW7sm+6RrSv
 HKQTogPo8jppE5++WprqsSMMXmxwA+pv3dyPG26u1uWLpozAWwQFVVPHUOLc/jhY8WES
 q64g==
X-Gm-Message-State: AOAM530yyhS4OzIHA2IDutboZ34GF/Ohh9HC4WJ1cCyBpWZ4BQb57ODM
 7yhZvEk47Tu0+7bQxtRGcadUb34i2hNldw==
X-Google-Smtp-Source: ABdhPJyii9CBaTZ0cGTqpGeSiv2JnHVxPrO+GDCV7Y4fqPEapfIUTIrEVqGgwZdYgct/vmC+DJMujA==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:6525 with SMTP id
 x124-20020a627c820000b029013c16116525mr20149365pfc.5.1599501070139; 
 Mon, 07 Sep 2020 10:51:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id ga3sm1651496pjb.18.2020.09.07.10.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 10:51:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/19] target/microblaze: Rename mmu structs
Date: Mon,  7 Sep 2020 10:50:47 -0700
Message-Id: <20200907175102.28027-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907175102.28027-1-richard.henderson@linaro.org>
References: <20200907175102.28027-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce typedefs and follow CODING_STYLE for naming.
Rename struct microblaze_mmu to MicroBlazeMMU.
Rename struct microblaze_mmu_lookup to MicroBlazeMMULookup.

Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h    |  2 +-
 target/microblaze/mmu.h    | 15 ++++++---------
 target/microblaze/helper.c |  4 ++--
 target/microblaze/mmu.c    | 11 +++++------
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 32811f773d..20c2979396 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -278,7 +278,7 @@ struct CPUMBState {
 
 #if !defined(CONFIG_USER_ONLY)
     /* Unified MMU.  */
-    struct microblaze_mmu mmu;
+    MicroBlazeMMU mmu;
 #endif
 
     /* Fields up to this point are cleared by a CPU reset */
diff --git a/target/microblaze/mmu.h b/target/microblaze/mmu.h
index 75e5301c79..c1feb811b9 100644
--- a/target/microblaze/mmu.h
+++ b/target/microblaze/mmu.h
@@ -63,8 +63,7 @@
 
 #define TLB_ENTRIES    64
 
-struct microblaze_mmu
-{
+typedef struct {
     /* Data and tag brams.  */
     uint64_t rams[2][TLB_ENTRIES];
     /* We keep a separate ram for the tids to avoid the 48 bit tag width.  */
@@ -76,10 +75,9 @@ struct microblaze_mmu
     int c_mmu_tlb_access;
     int c_mmu_zones;
     uint64_t c_addr_mask; /* Mask to apply to physical addresses.  */
-};
+} MicroBlazeMMU;
 
-struct microblaze_mmu_lookup
-{
+typedef struct {
     uint32_t paddr;
     uint32_t vaddr;
     unsigned int size;
@@ -88,13 +86,12 @@ struct microblaze_mmu_lookup
     enum {
         ERR_PROT, ERR_MISS, ERR_HIT
     } err;
-};
+} MicroBlazeMMULookup;
 
-unsigned int mmu_translate(struct microblaze_mmu *mmu,
-                           struct microblaze_mmu_lookup *lu,
+unsigned int mmu_translate(MicroBlazeMMU *mmu, MicroBlazeMMULookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx);
 uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
 void mmu_write(CPUMBState *env, bool ea, uint32_t rn, uint32_t v);
-void mmu_init(struct microblaze_mmu *mmu);
+void mmu_init(MicroBlazeMMU *mmu);
 
 #endif
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 27a24bb99a..3c2fd388fb 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -52,7 +52,7 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
-    struct microblaze_mmu_lookup lu;
+    MicroBlazeMMULookup lu;
     unsigned int hit;
     int prot;
 
@@ -235,7 +235,7 @@ hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
     target_ulong vaddr, paddr = 0;
-    struct microblaze_mmu_lookup lu;
+    MicroBlazeMMULookup lu;
     int mmu_idx = cpu_mmu_index(env, false);
     unsigned int hit;
 
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 6e583d78d9..0546cfd0bc 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -35,7 +35,7 @@ static unsigned int tlb_decode_size(unsigned int f)
 static void mmu_flush_idx(CPUMBState *env, unsigned int idx)
 {
     CPUState *cs = env_cpu(env);
-    struct microblaze_mmu *mmu = &env->mmu;
+    MicroBlazeMMU *mmu = &env->mmu;
     unsigned int tlb_size;
     uint32_t tlb_tag, end, t;
 
@@ -55,7 +55,7 @@ static void mmu_flush_idx(CPUMBState *env, unsigned int idx)
 
 static void mmu_change_pid(CPUMBState *env, unsigned int newpid) 
 {
-    struct microblaze_mmu *mmu = &env->mmu;
+    MicroBlazeMMU *mmu = &env->mmu;
     unsigned int i;
     uint32_t t;
 
@@ -73,8 +73,7 @@ static void mmu_change_pid(CPUMBState *env, unsigned int newpid)
 }
 
 /* rw - 0 = read, 1 = write, 2 = fetch.  */
-unsigned int mmu_translate(struct microblaze_mmu *mmu,
-                           struct microblaze_mmu_lookup *lu,
+unsigned int mmu_translate(MicroBlazeMMU *mmu, MicroBlazeMMULookup *lu,
                            target_ulong vaddr, int rw, int mmu_idx)
 {
     unsigned int i, hit = 0;
@@ -290,7 +289,7 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
             break;
         case MMU_R_TLBSX:
         {
-            struct microblaze_mmu_lookup lu;
+            MicroBlazeMMULookup lu;
             int hit;
 
             if (env->mmu.c_mmu_tlb_access <= 1) {
@@ -314,7 +313,7 @@ void mmu_write(CPUMBState *env, bool ext, uint32_t rn, uint32_t v)
    }
 }
 
-void mmu_init(struct microblaze_mmu *mmu)
+void mmu_init(MicroBlazeMMU *mmu)
 {
     int i;
     for (i = 0; i < ARRAY_SIZE(mmu->regs); i++) {
-- 
2.25.1


