Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B831030550C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:53:08 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4fdT-0001UN-QX
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZS-0006OI-8S
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:58 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:45407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l4fZQ-0008Gu-KT
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:48:57 -0500
Received: by mail-lj1-x234.google.com with SMTP id e18so946960lja.12
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 23:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yIgMDih2Mx0+rtvGNh5fCAvI77wGf0Y6e4dfvNoICtY=;
 b=nVV8zwhAfn6hh1mLA/7zx7FiDwyRRFZzsTQYa3vF5hJoRIdF9FRktYyyzSvDWwYCys
 ZbjvurQA8LROp5n6E4B5KkaRM6pQg31bSqZ/b8F8ABP86d3Hd4fD2bxCTu4DpytsP5xj
 XpM8T+aspfJchKRjT9Xc55R+5t8DOseQGpkyt0qYzHtq4yHYDw8M3K2GSgR2QCUgy1Cz
 Su7UZkYwLlkwVIgQ7jkI2oE7dK9gB4Tjkx/ErBlTfEGoCJvVkw1DHj8XX9Te/a+qgmyd
 i6UBECbSdXBAqqi29dyBhsYIAGt4da6PEGc9QCdWcNSQqp7SShJ8dD9XCGiirJMN30tB
 /O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIgMDih2Mx0+rtvGNh5fCAvI77wGf0Y6e4dfvNoICtY=;
 b=IWiZieV7TcVrXFsoLUCfK/BQxJsYTAnsFlQicGslRcBM+mKtC2qW7UY7Uqnmuo4ElR
 nZUD36IFl/Bdqe+FYmod4FB0c1fbxHys62re9wdzz/9ANkq+DsBkuvyNbaljelztdroN
 b3cmdCpMMZlyTEGOs+xaarAj75o0ZdyvdrnT8SXB4G+fgOCep3m8UI1sdtLSuJpsJoji
 tRHUvgp7tT13HKYuB0aKVj76X6aOSHGvAY+PaBYVNf/R2fv90v1HdOveKTAt3Fxu4yAz
 qLwKkCz98uOpjWOLSyCfX6LSFbbeYLIfmjA9+FwO7TCkihKNbQy3khziwRCK2mLwVYZT
 5VeQ==
X-Gm-Message-State: AOAM5338UXEqKIary9v3pLvigQbyl5CdUViMga0gSqE0XTlOmgbis49Z
 BU5iro/uSlRyzC84UiREhLgQ3Hsy9js=
X-Google-Smtp-Source: ABdhPJzNWxkeHOHIUlpj46ZoZ+TTctOqWDdUG91bOTyvpBq4i9AiWm0grY2spXt68pchmh3dT4t0Fg==
X-Received: by 2002:a2e:a404:: with SMTP id p4mr2785873ljn.178.1611733734996; 
 Tue, 26 Jan 2021 23:48:54 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id e7sm304252lfs.159.2021.01.26.23.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 23:48:54 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 3/3] target/microblaze: Add security attributes on memory
 transactions
Date: Wed, 27 Jan 2021 08:48:50 +0100
Message-Id: <20210127074850.1886235-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
References: <20210127074850.1886235-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x234.google.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, joe.komlodi@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joe Komlodi <joe.komlodi@xilinx.com>

Using the cfg.use_non_secure bitfield and the MMU access type, we can determine
if the access should be secure or not.

Signed-off-by: Joe Komlodi <komlodi@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-Id: <1611274735-303873-4-git-send-email-komlodi@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/cpu.h    |  3 ++-
 target/microblaze/cpu.c    |  2 +-
 target/microblaze/helper.c | 26 +++++++++++++++++++++++---
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 199cfb02d6..e4bba8a755 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -361,7 +361,8 @@ void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
 void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr mb_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
 int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index accfb23a4f..d5e8bfe11f 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -375,7 +375,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->tlb_fill = mb_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->do_transaction_failed = mb_cpu_transaction_failed;
-    cc->get_phys_page_debug = mb_cpu_get_phys_page_debug;
+    cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
 #endif
     device_class_set_props(dc, mb_properties);
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index cda14a14be..20dbd67313 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -46,6 +46,16 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #else /* !CONFIG_USER_ONLY */
 
+static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
+                                    MMUAccessType access_type)
+{
+    if (access_type == MMU_INST_FETCH) {
+        return !cpu->ns_axi_ip;
+    } else {
+        return !cpu->ns_axi_dp;
+    }
+}
+
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr)
@@ -55,12 +65,16 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     MicroBlazeMMULookup lu;
     unsigned int hit;
     int prot;
+    MemTxAttrs attrs = {};
+
+    attrs.secure = mb_cpu_access_is_secure(cpu, access_type);
 
     if (mmu_idx == MMU_NOMMU_IDX) {
         /* MMU disabled or not available.  */
         address &= TARGET_PAGE_MASK;
         prot = PAGE_BITS;
-        tlb_set_page(cs, address, address, prot, mmu_idx, TARGET_PAGE_SIZE);
+        tlb_set_page_with_attrs(cs, address, address, attrs, prot, mmu_idx,
+                                TARGET_PAGE_SIZE);
         return true;
     }
 
@@ -71,7 +85,8 @@ bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
         qemu_log_mask(CPU_LOG_MMU, "MMU map mmu=%d v=%x p=%x prot=%x\n",
                       mmu_idx, vaddr, paddr, lu.prot);
-        tlb_set_page(cs, vaddr, paddr, lu.prot, mmu_idx, TARGET_PAGE_SIZE);
+        tlb_set_page_with_attrs(cs, vaddr, paddr, attrs, lu.prot, mmu_idx,
+                                TARGET_PAGE_SIZE);
         return true;
     }
 
@@ -230,7 +245,8 @@ void mb_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                        MemTxAttrs *attrs)
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
     CPUMBState *env = &cpu->env;
@@ -239,6 +255,10 @@ hwaddr mb_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(env, false);
     unsigned int hit;
 
+    /* Caller doesn't initialize */
+    *attrs = (MemTxAttrs) {};
+    attrs->secure = mb_cpu_access_is_secure(cpu, MMU_DATA_LOAD);
+
     if (mmu_idx != MMU_NOMMU_IDX) {
         hit = mmu_translate(cpu, &lu, addr, 0, 0);
         if (hit) {
-- 
2.25.1


