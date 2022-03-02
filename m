Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7226A4CA689
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:51:12 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPNn-0001Ob-Hy
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:51:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOep-0003c7-Ao
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:47 -0500
Received: from [2607:f8b0:4864:20::431] (port=36407
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOem-0004yr-PL
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:42 -0500
Received: by mail-pf1-x431.google.com with SMTP id z16so1918247pfh.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ynqt3y5s/uUAaEi3pDIc2AV9gtv8UZRUMS//euNtFRg=;
 b=EG+T/BsKj/CIQWhrlgfYicT0nDqRroWMlpXyMMaqCIbPhpw9ftAiehyPk1NEQIFU3R
 SNGgcaJoIliN4nG0aEYLMe8AU9jYTY0z7ojAVjP1IQMmrDjKoOs/66xzBWDTCBx+9YVL
 mVlzJOOzr1fQtbvoUAd+OQchVN7BdTFycA+sjIOcD9Mc3ejfuZ0fO92G2i9F8aptQqj6
 6vHSeaXIvJfFtDOWDp3qGDRe+MJ4/nOnVr0tNKZQmzBUDmrncW3gHDsSTpYbMJR7wKGO
 lbqgF+oNXS6UdamqueAdkUBbZVG/TQM8dx8RdmH7QtRs9caAO5K5BcwbITXqx28ywwXO
 xuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ynqt3y5s/uUAaEi3pDIc2AV9gtv8UZRUMS//euNtFRg=;
 b=40JYgka99t/6u+Eywrp/kDpRKA7QDpRl1estuLpjMBM0NOXj7ZmkHxwSnqYpVk5d1W
 cVJNLPLkRSxj4keLkXp1Es5AZaE1t3MoRe+apesvUXevmnO0l3NKOqnLh26P4TAmQCNO
 J40wzXofgdNLcaMZ6neE9u2lVF6pcGr1dMthixTFtC6upfQt32tIxgl8pUmxOEfQtRvX
 mWoOMJysM6H8qM3SlduGdKusOQ6jJLeX8wLQc3oPeY5XvCU0uR6Jxcy4IPHMUPkYgzAc
 5hw6l6NroHL63U/hJob6skOFBRm3JQktk/kOwN/+6SaORTP4HVjagHneciRrDA9t7Tyn
 RK/g==
X-Gm-Message-State: AOAM530lNFMY1wCgYXuTWnaNKnCoKnYFEVz45OXEGMbgvm7NCxgqYkzB
 IItWZnD7WIiX56rjLXPrG9KiItvSxhcW/Q==
X-Google-Smtp-Source: ABdhPJwiBCSLrfT8gH7lT46FPnmkQJKuyjR1uRjVaQ6HCJwJXcGLKGpshkr38T3NwEbMImK2qVBpCA==
X-Received: by 2002:a63:6908:0:b0:372:d919:82ed with SMTP id
 e8-20020a636908000000b00372d91982edmr26310503pgc.104.1646226278307; 
 Wed, 02 Mar 2022 05:04:38 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21947964pfu.62.2022.03.02.05.04.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 05:04:37 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/9] hvf: rename struct hvf_slot to HVFSlot
Date: Wed,  2 Mar 2022 21:04:12 +0800
Message-Id: <20220302130417.18551-5-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302130417.18551-1-ubzeme@gmail.com>
References: <20220302130417.18551-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=ubzeme@gmail.com; helo=mail-pf1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the QEMU coding style. Structured type names are in CamelCase.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c      | 14 +++++++-------
 include/sysemu/hvf_int.h |  8 ++++----
 target/i386/hvf/hvf.c    |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 6b82be3220..b8e9f30e4c 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -30,11 +30,11 @@
 
 #define HVF_NUM_SLOTS 32
 
-static hvf_slot memslots[HVF_NUM_SLOTS];
+static HVFSlot memslots[HVF_NUM_SLOTS];
 
-hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
+HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     int x;
     for (x = 0; x < HVF_NUM_SLOTS; ++x) {
         slot = &memslots[x];
@@ -46,9 +46,9 @@ hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
     return NULL;
 }
 
-static hvf_slot *hvf_find_free_slot(void)
+static HVFSlot *hvf_find_free_slot(void)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     int x;
     for (x = 0; x < HVF_NUM_SLOTS; x++) {
         slot = &memslots[x];
@@ -91,7 +91,7 @@ static hwaddr hvf_align_section(MemoryRegionSection *section,
 
 static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
     hwaddr start, size, offset, delta;
     uint8_t *host_addr;
     MemoryRegion *area = section->mr;
@@ -172,7 +172,7 @@ static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
 
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
-    hvf_slot *slot;
+    HVFSlot *slot;
 
     slot = hvf_find_overlap_slot(
             section->offset_within_address_space,
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 2c4a97debe..0aafbc9357 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -17,17 +17,17 @@
 #include <Hypervisor/hv.h>
 #endif
 
-/* hvf_slot flags */
+/* HVFSlot flags */
 #define HVF_SLOT_LOG (1 << 0)
 #define HVF_SLOT_READONLY (1 << 1)
 
-typedef struct hvf_slot {
+typedef struct HVFSlot {
     hwaddr start;
     hwaddr size;  /* 0 if the slot is free */
     hwaddr offset;  /* offset within memory region */
     uint32_t flags;
     MemoryRegion *region;
-} hvf_slot;
+} HVFSlot;
 
 typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_pinbased;
@@ -58,7 +58,7 @@ int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
-hvf_slot *hvf_find_overlap_slot(hwaddr, hwaddr);
+HVFSlot *hvf_find_overlap_slot(hwaddr, hwaddr);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 4ba6e82fab..2ddb4fc825 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -113,7 +113,7 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void *buffer,
     }
 }
 
-static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
+static bool ept_emulation_fault(HVFSlot *slot, uint64_t gpa, uint64_t ept_qual)
 {
     int read, write;
 
@@ -469,7 +469,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         /* Need to check if MMIO or unmapped fault */
         case EXIT_REASON_EPT_FAULT:
         {
-            hvf_slot *slot;
+            HVFSlot *slot;
             uint64_t gpa = rvmcs(cpu->hvf->fd, VMCS_GUEST_PHYSICAL_ADDRESS);
 
             if (((idtvec_info & VMCS_IDT_VEC_VALID) == 0) &&
-- 
2.32.0 (Apple Git-132)


