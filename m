Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EEB602D96
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:53 +0200 (CEST)
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6O-0004Rl-4t
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmh7-0002mu-2h
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmh4-00053j-PM
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XV/FUkjTe/ouWvpIL64KvSzYdBJ0cqh3t/FB4ungLqk=;
 b=C+Y9GIGi+yvqp1sSbAFUI6X9m6XXxo3V6TT7cT9oPUw9zuGRYqMx+yoV8DN6Z1XynSlMyR
 d1LbxVV/Fy4uwYBK6htGbIAA6tQO8xvSOfYhpaITYFHJgD0rDvOQiiiaA6P8386OJVNCuh
 tYbZuV7Dl7U4amCgDjhr/yNjdnP3Ye4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-GN35QT0-O3ad6B5-FkdAsw-1; Tue, 18 Oct 2022 09:31:38 -0400
X-MC-Unique: GN35QT0-O3ad6B5-FkdAsw-1
Received: by mail-ed1-f70.google.com with SMTP id
 l18-20020a056402255200b0045d2674d1a0so9078099edb.0
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XV/FUkjTe/ouWvpIL64KvSzYdBJ0cqh3t/FB4ungLqk=;
 b=U0PvZt4XjwxWZTC5d0tHYpUkM88O2dj6e19LWEEkQrDbnJZjHsS2dEfVf9wKCFlMRT
 uNHQLyqZiyHDu7p+GUajFXWS/0GSpH7wRLzvGHKvDljY6y8/Q4AIvl8a+pxfZyZbb3O8
 isMRA56eibCQDWI8WAs3ZzrQdi/nShPvUSoUe6r6hbSu7nZslT+eU3s0/1W1dWyTEjyE
 OJapDYC0hKXEygpe/Rh+X8oin17/iOAQKUwm6mcKGaH6EHY25nZVK0GXH/1oA4/LM2QZ
 CiYR+s3PrROnlmtK35aTW1UP82Z7OW/KfAocEUN205H5kXWSMKtVYsDqjU8M+ppOv49Z
 +9BA==
X-Gm-Message-State: ACrzQf0touQrqPccwJ53mmXNWDf0FM9kszvmIEC90t3ZGOQtDWcRLLwV
 WEGk9cJ5eVYXCVX8UPeYpBvA2H0Gh3dQvhImL/m1fSzYGONIv1E5q6szLZBE3eoSoSR4MRjvwdi
 5Pb2k8GFbauLATNjqcccvSjgL0ATyJe9WsaAN8BYIihj7+EAQIAjXImim0AVe+VjHrYk=
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr2518828eja.122.1666099896736; 
 Tue, 18 Oct 2022 06:31:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BwKhhVEXymEwsR3WwounUlo3MGkogPYL3pG6mNzupcNG4f+6MIYRmU+Nk2sVVow8zRHg6PQ==
X-Received: by 2002:a17:906:401:b0:73d:af73:b78 with SMTP id
 d1-20020a170906040100b0073daf730b78mr2518800eja.122.1666099896392; 
 Tue, 18 Oct 2022 06:31:36 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906219100b0073d81b0882asm5779088eju.7.2022.10.18.06.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/53] target/i386: Combine 5 sets of variables in mmu_translate
Date: Tue, 18 Oct 2022 15:30:04 +0200
Message-Id: <20221018133042.856368-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

We don't need one variable set per translation level,
which requires copying into pte/pte_addr for huge pages.
Standardize on pte/pte_addr for all levels.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221002172956.265735-8-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 178 ++++++++++++++-------------
 1 file changed, 91 insertions(+), 87 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 86b3014196..d6b7de6eea 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -82,7 +82,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
     const bool is_user = (in->mmu_idx == MMU_USER_IDX);
     const MMUAccessType access_type = in->access_type;
     uint64_t ptep, pte;
-    hwaddr pde_addr, pte_addr;
+    hwaddr pte_addr;
     uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint32_t pkr;
     int page_size;
@@ -92,116 +92,122 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
     }
 
     if (pg_mode & PG_MODE_PAE) {
-        uint64_t pde, pdpe;
-        target_ulong pdpe_addr;
-
 #ifdef TARGET_X86_64
         if (pg_mode & PG_MODE_LMA) {
-            bool la57 = pg_mode & PG_MODE_LA57;
-            uint64_t pml5e_addr, pml5e;
-            uint64_t pml4e_addr, pml4e;
-
-            if (la57) {
-                pml5e_addr = ((in->cr3 & ~0xfff) +
-                        (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
-                PTE_HPHYS(pml5e_addr);
-                pml5e = x86_ldq_phys(cs, pml5e_addr);
-                if (!(pml5e & PG_PRESENT_MASK)) {
+            if (pg_mode & PG_MODE_LA57) {
+                /*
+                 * Page table level 5
+                 */
+                pte_addr = ((in->cr3 & ~0xfff) +
+                            (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
+                PTE_HPHYS(pte_addr);
+                pte = x86_ldq_phys(cs, pte_addr);
+                if (!(pte & PG_PRESENT_MASK)) {
                     goto do_fault;
                 }
-                if (pml5e & (rsvd_mask | PG_PSE_MASK)) {
+                if (pte & (rsvd_mask | PG_PSE_MASK)) {
                     goto do_fault_rsvd;
                 }
-                if (!(pml5e & PG_ACCESSED_MASK)) {
-                    pml5e |= PG_ACCESSED_MASK;
-                    x86_stl_phys_notdirty(cs, pml5e_addr, pml5e);
+                if (!(pte & PG_ACCESSED_MASK)) {
+                    pte |= PG_ACCESSED_MASK;
+                    x86_stl_phys_notdirty(cs, pte_addr, pte);
                 }
-                ptep = pml5e ^ PG_NX_MASK;
+                ptep = pte ^ PG_NX_MASK;
             } else {
-                pml5e = in->cr3;
+                pte = in->cr3;
                 ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
             }
 
-            pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
-                    (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
-            PTE_HPHYS(pml4e_addr);
-            pml4e = x86_ldq_phys(cs, pml4e_addr);
-            if (!(pml4e & PG_PRESENT_MASK)) {
+            /*
+             * Page table level 4
+             */
+            pte_addr = ((pte & PG_ADDRESS_MASK) +
+                        (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
+            PTE_HPHYS(pte_addr);
+            pte = x86_ldq_phys(cs, pte_addr);
+            if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
-            if (pml4e & (rsvd_mask | PG_PSE_MASK)) {
+            if (pte & (rsvd_mask | PG_PSE_MASK)) {
                 goto do_fault_rsvd;
             }
-            if (!(pml4e & PG_ACCESSED_MASK)) {
-                pml4e |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pml4e_addr, pml4e);
+            if (!(pte & PG_ACCESSED_MASK)) {
+                pte |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pte_addr, pte);
             }
-            ptep &= pml4e ^ PG_NX_MASK;
-            pdpe_addr = ((pml4e & PG_ADDRESS_MASK) + (((addr >> 30) & 0x1ff) << 3)) &
-                a20_mask;
-            PTE_HPHYS(pdpe_addr);
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK)) {
+            ptep &= pte ^ PG_NX_MASK;
+
+            /*
+             * Page table level 3
+             */
+            pte_addr = ((pte & PG_ADDRESS_MASK) +
+                        (((addr >> 30) & 0x1ff) << 3)) & a20_mask;
+            PTE_HPHYS(pte_addr);
+            pte = x86_ldq_phys(cs, pte_addr);
+            if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
-            if (pdpe & rsvd_mask) {
+            if (pte & rsvd_mask) {
                 goto do_fault_rsvd;
             }
-            ptep &= pdpe ^ PG_NX_MASK;
-            if (!(pdpe & PG_ACCESSED_MASK)) {
-                pdpe |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pdpe_addr, pdpe);
+            ptep &= pte ^ PG_NX_MASK;
+            if (!(pte & PG_ACCESSED_MASK)) {
+                pte |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pte_addr, pte);
             }
-            if (pdpe & PG_PSE_MASK) {
+            if (pte & PG_PSE_MASK) {
                 /* 1 GB page */
                 page_size = 1024 * 1024 * 1024;
-                pte_addr = pdpe_addr;
-                pte = pdpe;
                 goto do_check_protect;
             }
         } else
 #endif
         {
-            /* XXX: load them when cr3 is loaded ? */
-            pdpe_addr = ((in->cr3 & ~0x1f) + ((addr >> 27) & 0x18)) &
-                a20_mask;
-            PTE_HPHYS(pdpe_addr);
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK)) {
+            /*
+             * Page table level 3
+             */
+            pte_addr = ((in->cr3 & ~0x1f) + ((addr >> 27) & 0x18)) & a20_mask;
+            PTE_HPHYS(pte_addr);
+            pte = x86_ldq_phys(cs, pte_addr);
+            if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
             rsvd_mask |= PG_HI_USER_MASK;
-            if (pdpe & (rsvd_mask | PG_NX_MASK)) {
+            if (pte & (rsvd_mask | PG_NX_MASK)) {
                 goto do_fault_rsvd;
             }
             ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
         }
 
-        pde_addr = ((pdpe & PG_ADDRESS_MASK) + (((addr >> 21) & 0x1ff) << 3)) &
-            a20_mask;
-        PTE_HPHYS(pde_addr);
-        pde = x86_ldq_phys(cs, pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
+        /*
+         * Page table level 2
+         */
+        pte_addr = ((pte & PG_ADDRESS_MASK) +
+                    (((addr >> 21) & 0x1ff) << 3)) & a20_mask;
+        PTE_HPHYS(pte_addr);
+        pte = x86_ldq_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
-        if (pde & rsvd_mask) {
+        if (pte & rsvd_mask) {
             goto do_fault_rsvd;
         }
-        ptep &= pde ^ PG_NX_MASK;
-        if (pde & PG_PSE_MASK) {
+        ptep &= pte ^ PG_NX_MASK;
+        if (pte & PG_PSE_MASK) {
             /* 2 MB page */
             page_size = 2048 * 1024;
-            pte_addr = pde_addr;
-            pte = pde;
             goto do_check_protect;
         }
-        /* 4 KB page */
-        if (!(pde & PG_ACCESSED_MASK)) {
-            pde |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        if (!(pte & PG_ACCESSED_MASK)) {
+            pte |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pte_addr, pte);
         }
-        pte_addr = ((pde & PG_ADDRESS_MASK) + (((addr >> 12) & 0x1ff) << 3)) &
-            a20_mask;
+
+        /*
+         * Page table level 1
+         */
+        pte_addr = ((pte & PG_ADDRESS_MASK) +
+                    (((addr >> 12) & 0x1ff) << 3)) & a20_mask;
         PTE_HPHYS(pte_addr);
         pte = x86_ldq_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
@@ -214,39 +220,37 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
         ptep &= pte ^ PG_NX_MASK;
         page_size = 4096;
     } else {
-        uint32_t pde;
-
-        /* page directory entry */
-        pde_addr = ((in->cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) &
-            a20_mask;
-        PTE_HPHYS(pde_addr);
-        pde = x86_ldl_phys(cs, pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
+        /*
+         * Page table level 2
+         */
+        pte_addr = ((in->cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) & a20_mask;
+        PTE_HPHYS(pte_addr);
+        pte = x86_ldl_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
-        ptep = pde | PG_NX_MASK;
+        ptep = pte | PG_NX_MASK;
 
         /* if PSE bit is set, then we use a 4MB page */
-        if ((pde & PG_PSE_MASK) && (pg_mode & PG_MODE_PSE)) {
+        if ((pte & PG_PSE_MASK) && (pg_mode & PG_MODE_PSE)) {
             page_size = 4096 * 1024;
-            pte_addr = pde_addr;
-
-            /* Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
+            /*
+             * Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
              * Leave bits 20-13 in place for setting accessed/dirty bits below.
              */
-            pte = pde | ((pde & 0x1fe000LL) << (32 - 13));
+            pte = (uint32_t)pte | ((pte & 0x1fe000LL) << (32 - 13));
             rsvd_mask = 0x200000;
             goto do_check_protect_pse36;
         }
-
-        if (!(pde & PG_ACCESSED_MASK)) {
-            pde |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        if (!(pte & PG_ACCESSED_MASK)) {
+            pte |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pte_addr, pte);
         }
 
-        /* page directory entry */
-        pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) &
-            a20_mask;
+        /*
+         * Page table level 1
+         */
+        pte_addr = ((pte & ~0xfffu) + ((addr >> 10) & 0xffc)) & a20_mask;
         PTE_HPHYS(pte_addr);
         pte = x86_ldl_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
-- 
2.37.3


