Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B794B653D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:09:25 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsto-0004v1-Ma
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:09:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoc-00025a-0Y
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:04 -0500
Received: from [2607:f8b0:4864:20::1031] (port=36594
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoS-0002AE-TM
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:00 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso1974409pjd.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zqaK9s5/raZ8zuTcIzPJOQG8kwceFqw1+s0bbIn7Ok=;
 b=ZOO8guZCdvEhh9PgJeWtVbHJzKtzZ8W9VhHWh4TDAEAiwb1/xwLBEKUqdUjj8w6Sen
 Fm/vrgRzuZzlSmA85XG5x/EEnJ3YTW86ob1ATUJXjozKySGLYlqKB3zYGjFcIn4tHRRh
 Sr+39aQe4GrhORsxdH3r/W1RZv5U8iyPbqpWO1QO2z98QLAKFU7bHfSeTZ/VyT3g2Fjm
 8XcRd+pXnrApyZCkgpaRwTPWjw3Ksb/6UA5y87ciHph1QJEPkyocphMCnYAdecPmlEgA
 BdOAj3E0Njs9TdZ5NAbKqYSD6sr3oDNXpjilimjoQUy+KX47tXS+SbpJP1wh49In9DFH
 IxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3zqaK9s5/raZ8zuTcIzPJOQG8kwceFqw1+s0bbIn7Ok=;
 b=4kgVgF4T0Y/H+T/vC7eOpm9VlI628c8dJPR61zF6GmnmIXCeyMRL/lVvserr2YKa1o
 zg73dCIcHZmLme1NeygwF3Dw5E4R/wWDB+29D5KLci5NMpFRGKUsg75YZ+3enE3fr7eI
 dmil1CNIwTnur0sgUwkR2D3AI8ehzxhX/eaLeRxYxHu6WprOFuEuWey1qP2CEhfjOgzZ
 NF560N0t4Q+B2lX5z03vWGG2VGsjBbH4BJOPwwqzegFHuxVyNeaJ54zUG/gbeExrLPwa
 xqx57rNu3X1YmX0aLycvaa3KCoNMlFtY87RJf1va4GT0Rlo2kt6N3pb+en6eOIgDHN47
 ZUwg==
X-Gm-Message-State: AOAM53307n0Ac3ePshkPa0WDP+JG4nRa/79L2wdbPCYoQ2nTiNcn1R2o
 ai7aHKReoOz6jepD0fhDDAbbfcTshJ4=
X-Google-Smtp-Source: ABdhPJz2aTrYgjP/oLk6iYPbGmwGp2d2QmOQx7BejTFbgXaUeUbIBt006NCgU9BOFEtYJb6mT6xHOg==
X-Received: by 2002:a17:902:dad0:: with SMTP id
 q16mr3082468plx.41.1644912227346; 
 Tue, 15 Feb 2022 00:03:47 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id p1sm5241994pfo.212.2022.02.15.00.03.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:03:47 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 04/15] hvf: Use standard CR0 and CR4 register definitions
Date: Tue, 15 Feb 2022 09:02:56 +0100
Message-Id: <20220215080307.69550-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Cameron Esfahani <dirty@apple.com>

No need to have our own definitions of these registers.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/vmx.h      | 17 +++++++++--------
 target/i386/hvf/x86.c      |  6 +++---
 target/i386/hvf/x86.h      | 34 ----------------------------------
 target/i386/hvf/x86_mmu.c  |  2 +-
 target/i386/hvf/x86_task.c |  3 ++-
 5 files changed, 15 insertions(+), 47 deletions(-)

diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 6df87116f6..29b7deed3c 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -124,10 +124,11 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     uint64_t efer = rvmcs(vcpu, VMCS_GUEST_IA32_EFER);
     uint64_t old_cr0 = rvmcs(vcpu, VMCS_GUEST_CR0);
     uint64_t changed_cr0 = old_cr0 ^ cr0;
-    uint64_t mask = CR0_PG | CR0_CD | CR0_NW | CR0_NE | CR0_ET;
+    uint64_t mask = CR0_PG_MASK | CR0_CD_MASK | CR0_NW_MASK |
+                    CR0_NE_MASK | CR0_ET_MASK;
     uint64_t entry_ctls;
 
-    if ((cr0 & CR0_PG) && (rvmcs(vcpu, VMCS_GUEST_CR4) & CR4_PAE) &&
+    if ((cr0 & CR0_PG_MASK) && (rvmcs(vcpu, VMCS_GUEST_CR4) & CR4_PAE_MASK) &&
         !(efer & MSR_EFER_LME)) {
         address_space_read(&address_space_memory,
                            rvmcs(vcpu, VMCS_GUEST_CR3) & ~0x1f,
@@ -142,8 +143,8 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     wvmcs(vcpu, VMCS_CR0_SHADOW, cr0);
 
     if (efer & MSR_EFER_LME) {
-        if (changed_cr0 & CR0_PG) {
-            if (cr0 & CR0_PG) {
+        if (changed_cr0 & CR0_PG_MASK) {
+            if (cr0 & CR0_PG_MASK) {
                 enter_long_mode(vcpu, cr0, efer);
             } else {
                 exit_long_mode(vcpu, cr0, efer);
@@ -155,8 +156,8 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     }
 
     /* Filter new CR0 after we are finished examining it above. */
-    cr0 = (cr0 & ~(mask & ~CR0_PG));
-    wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE | CR0_ET);
+    cr0 = (cr0 & ~(mask & ~CR0_PG_MASK));
+    wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE_MASK | CR0_ET_MASK);
 
     hv_vcpu_invalidate_tlb(vcpu);
     hv_vcpu_flush(vcpu);
@@ -164,11 +165,11 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
 
 static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
 {
-    uint64_t guest_cr4 = cr4 | CR4_VMXE;
+    uint64_t guest_cr4 = cr4 | CR4_VMXE_MASK;
 
     wvmcs(vcpu, VMCS_GUEST_CR4, guest_cr4);
     wvmcs(vcpu, VMCS_CR4_SHADOW, cr4);
-    wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE);
+    wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE_MASK);
 
     hv_vcpu_invalidate_tlb(vcpu);
     hv_vcpu_flush(vcpu);
diff --git a/target/i386/hvf/x86.c b/target/i386/hvf/x86.c
index 2898bb70a8..91a3fe002c 100644
--- a/target/i386/hvf/x86.c
+++ b/target/i386/hvf/x86.c
@@ -119,7 +119,7 @@ bool x86_read_call_gate(struct CPUState *cpu, struct x86_call_gate *idt_desc,
 bool x86_is_protected(struct CPUState *cpu)
 {
     uint64_t cr0 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0);
-    return cr0 & CR0_PE;
+    return cr0 & CR0_PE_MASK;
 }
 
 bool x86_is_real(struct CPUState *cpu)
@@ -150,13 +150,13 @@ bool x86_is_long64_mode(struct CPUState *cpu)
 bool x86_is_paging_mode(struct CPUState *cpu)
 {
     uint64_t cr0 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0);
-    return cr0 & CR0_PG;
+    return cr0 & CR0_PG_MASK;
 }
 
 bool x86_is_pae_enabled(struct CPUState *cpu)
 {
     uint64_t cr4 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR4);
-    return cr4 & CR4_PAE;
+    return cr4 & CR4_PAE_MASK;
 }
 
 target_ulong linear_addr(struct CPUState *cpu, target_ulong addr, X86Seg seg)
diff --git a/target/i386/hvf/x86.h b/target/i386/hvf/x86.h
index 782664c2ea..947b98da41 100644
--- a/target/i386/hvf/x86.h
+++ b/target/i386/hvf/x86.h
@@ -42,40 +42,6 @@ typedef struct x86_register {
     };
 } __attribute__ ((__packed__)) x86_register;
 
-typedef enum x86_reg_cr0 {
-    CR0_PE =            (1L << 0),
-    CR0_MP =            (1L << 1),
-    CR0_EM =            (1L << 2),
-    CR0_TS =            (1L << 3),
-    CR0_ET =            (1L << 4),
-    CR0_NE =            (1L << 5),
-    CR0_WP =            (1L << 16),
-    CR0_AM =            (1L << 18),
-    CR0_NW =            (1L << 29),
-    CR0_CD =            (1L << 30),
-    CR0_PG =            (1L << 31),
-} x86_reg_cr0;
-
-typedef enum x86_reg_cr4 {
-    CR4_VME =            (1L << 0),
-    CR4_PVI =            (1L << 1),
-    CR4_TSD =            (1L << 2),
-    CR4_DE  =            (1L << 3),
-    CR4_PSE =            (1L << 4),
-    CR4_PAE =            (1L << 5),
-    CR4_MSE =            (1L << 6),
-    CR4_PGE =            (1L << 7),
-    CR4_PCE =            (1L << 8),
-    CR4_OSFXSR =         (1L << 9),
-    CR4_OSXMMEXCPT =     (1L << 10),
-    CR4_VMXE =           (1L << 13),
-    CR4_SMXE =           (1L << 14),
-    CR4_FSGSBASE =       (1L << 16),
-    CR4_PCIDE =          (1L << 17),
-    CR4_OSXSAVE =        (1L << 18),
-    CR4_SMEP =           (1L << 20),
-} x86_reg_cr4;
-
 /* 16 bit Task State Segment */
 typedef struct x86_tss_segment16 {
     uint16_t link;
diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
index e9ed0f5aa1..df0b91cd42 100644
--- a/target/i386/hvf/x86_mmu.c
+++ b/target/i386/hvf/x86_mmu.c
@@ -129,7 +129,7 @@ static bool test_pt_entry(struct CPUState *cpu, struct gpt_translation *pt,
 
     uint32_t cr0 = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0);
     /* check protection */
-    if (cr0 & CR0_WP) {
+    if (cr0 & CR0_WP_MASK) {
         if (pt->write_access && !pte_write_access(pte)) {
             return false;
         }
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index 422156128b..e1301599e9 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -174,7 +174,8 @@ void vmx_handle_task_switch(CPUState *cpu, x68_segment_selector tss_sel, int rea
         //ret = task_switch_16(cpu, tss_sel, old_tss_sel, old_tss_base, &next_tss_desc);
         VM_PANIC("task_switch_16");
 
-    macvm_set_cr0(cpu->hvf->fd, rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0) | CR0_TS);
+    macvm_set_cr0(cpu->hvf->fd, rvmcs(cpu->hvf->fd, VMCS_GUEST_CR0) |
+                                CR0_TS_MASK);
     x86_segment_descriptor_to_vmx(cpu, tss_sel, &next_tss_desc, &vmx_seg);
     vmx_write_segment_descriptor(cpu, &vmx_seg, R_TR);
 
-- 
2.34.1


