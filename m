Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FF4D9BD2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:08:30 +0100 (CET)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6ub-00028X-AC
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:08:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6h0-000420-HA
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:30 -0400
Received: from [2607:f8b0:4864:20::634] (port=44821
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6gy-0007ft-QY
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id q11so16126982pln.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3zqaK9s5/raZ8zuTcIzPJOQG8kwceFqw1+s0bbIn7Ok=;
 b=TiXb2Wud5kFc2dhcv+gNEwEvbQu6rd2Q2c55AGY5qK2kKnSdLuzEWpXRyXY4ua1Qxk
 eIKSTdyKMrBvKj6Kof5OZNDlCBgIVHrJXVYuZLnFIbljkXFvbWxUcymuioQnhMJDDmU6
 uGoomG8aW9XNyigDie1FMs4Bgupql5mXP92xpjgSC4yGrwvyOErFdMTrtli5cuxxibIp
 7Pq3ots/pKR2SQW965lANuMI1iQCqm0JvefZFq11gPctWtx3EBHS+e1j2s2X0eJJkv8k
 HrJqQLzErbSNbByb3jfs6I92x7zQAAZUjIGw5wC+UJoRXfnnQws/M7UgPCJTu9WspG5d
 Uevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3zqaK9s5/raZ8zuTcIzPJOQG8kwceFqw1+s0bbIn7Ok=;
 b=7AT5yhJKKdXgaAvFc3CtnBtrF5Q81Y0l0azSd7pT4eSO5sq1laoP+fj7uIba8nDLmJ
 9SjmpM1P9EHI7nykdbYNS31xxdvEULt2MwClV3n7DyizTVfmchuoRDsnxjju1BKfqkAE
 Xrw5X8dc/zKt2qq/k1NxVpbMvMVgN3uPTcIS6glnazaam7zz+s0o9KKGw4nV+0DI2F71
 YBu71GAlh+lC1pGh5IOLGEWCYXsi9KYtruWOziOc77ffXZtfMxEkm0R6XUHYMXdBfsfz
 n4HbhGDEJWZYxm0WwpV734PdyGejl8wDYNyt/WMiiR3xzihHE2V566jHsW4ivsDQIeZX
 GR+w==
X-Gm-Message-State: AOAM530BEFprTYrl33zFqPGuTg0vxu0nbXxovX6dMAffMD/4n/QgDQLy
 lQx5zwMVIZF69eKF9nveJsb3lIA2ASk=
X-Google-Smtp-Source: ABdhPJxrnSMQsj3rGIqHMuhBMWH+VL3gL8kGozhw4PUjOogQDj+1O27L6rmSKGlfjMqvVAFYH9Ushg==
X-Received: by 2002:a17:902:ea12:b0:151:dbbd:aeb8 with SMTP id
 s18-20020a170902ea1200b00151dbbdaeb8mr27573384plg.157.1647348863354; 
 Tue, 15 Mar 2022 05:54:23 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a056a00130900b004f73df40914sm25320276pfu.82.2022.03.15.05.54.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:54:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] hvf: Use standard CR0 and CR4 register definitions
Date: Tue, 15 Mar 2022 13:53:32 +0100
Message-Id: <20220315125350.82452-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


