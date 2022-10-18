Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B5602DA5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:16 +0200 (CEST)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6i-0006T9-T6
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgs-0002Lu-M7
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgm-00051Q-Vx
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUai5IOd+nk/9EXVKOs8Nw1OnO26tcrFnLS0BvRxlDw=;
 b=XymxH6wVwjvqVhnhnJYrIC14H8IjxjwY2+Erm8cVz3b2kHV/czLuvRTRFW4aQ9OgVmj8vv
 1qMuUrpRn9zbmKofPiiME9rKeVkvGPR8ceSWwfcdMKpMSUbwMcLAS6gJAvnImkGpySzCSe
 3db7DkOYoFVIYmecPg3Sy70BOPllJBc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-Sayw47-HNx2OXqAB7rBH5A-1; Tue, 18 Oct 2022 09:31:19 -0400
X-MC-Unique: Sayw47-HNx2OXqAB7rBH5A-1
Received: by mail-ej1-f70.google.com with SMTP id
 sb13-20020a1709076d8d00b0078d8e1f6f7aso6393185ejc.8
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mUai5IOd+nk/9EXVKOs8Nw1OnO26tcrFnLS0BvRxlDw=;
 b=Hu7Ak/fdiXul6JNWodBzxFqaiMxOiqV8vJqPp/nSZBf2bqUaSmaViUXr3EoJNuXZhu
 BBmHlwUh5cA6y+Fm+a6EjB7wIrm7AwT7XZYa0iur7KxrJujknEPk+//rEGaAT+Uv+EV2
 iceuj9YRkqU7Vd7/iv33q9kIchiss9GmpkXQ4AomsxTn3LOr7ACB4Q3ODxeoOZzC5AAj
 o/bTpWZEI6gkGAOjepzC8V/rR8sYx4Z0CZaHD02Z4MGqJI8obXO9UQyZTQYFmdKniYtj
 2oammwNYRJ+857wKwlyEhdnHgVrzgB0eyNb2S1t84Oqm5hF79jHV8xBhD9zvT7UXZyq8
 nRmQ==
X-Gm-Message-State: ACrzQf3lv8UPrlAEH40VmBWaq6BGHxKqMdkmwDprTqvEWAit7URiTboA
 56ucofgspJVeYfgyeeHYmNTFsJkUC6EeXsIycev2Q3wtNXzcmFepuyDjKKPU8Eb7jAOikBSE92W
 irQb4kOo26TPkOq2wnpOcFrF5yruYOVRoCVAh7C7ujIhWAQUG6GJov32KUBH2ZpQvy1s=
X-Received: by 2002:aa7:d7c5:0:b0:459:fad8:fd2 with SMTP id
 e5-20020aa7d7c5000000b00459fad80fd2mr2670396eds.336.1666099877872; 
 Tue, 18 Oct 2022 06:31:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67O7pGcZPkfNEWhZEjsQkGAosDsBgv16mUC4VxHL6z4BWi65ps231EKejKFAvtcbiht8Ld3Q==
X-Received: by 2002:aa7:d7c5:0:b0:459:fad8:fd2 with SMTP id
 e5-20020aa7d7c5000000b00459fad80fd2mr2670376eds.336.1666099877527; 
 Tue, 18 Oct 2022 06:31:17 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 l3-20020aa7cac3000000b0045723aa48ccsm8755833edt.93.2022.10.18.06.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/53] target/i386: Use MMUAccessType across excp_helper.c
Date: Tue, 18 Oct 2022 15:29:58 +0200
Message-Id: <20221018133042.856368-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Replace int is_write1 and magic numbers with the proper
MMUAccessType access_type and enumerators.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221002172956.265735-2-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 796dc2a1f3..eee59aa977 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -30,8 +30,10 @@ typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType acc
 #define GET_HPHYS(cs, gpa, access_type, prot)  \
 	(get_hphys_func ? get_hphys_func(cs, gpa, access_type, prot) : gpa)
 
-static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_func,
-                         uint64_t cr3, int is_write1, int mmu_idx, int pg_mode,
+static int mmu_translate(CPUState *cs, hwaddr addr,
+                         MMUTranslateFunc get_hphys_func,
+                         uint64_t cr3, MMUAccessType access_type,
+                         int mmu_idx, int pg_mode,
                          hwaddr *xlat, int *page_size, int *prot)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -40,13 +42,13 @@ static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_f
     int32_t a20_mask;
     target_ulong pde_addr, pte_addr;
     int error_code = 0;
-    int is_dirty, is_write, is_user;
+    bool is_dirty, is_write, is_user;
     uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint32_t page_offset;
     uint32_t pkr;
 
     is_user = (mmu_idx == MMU_USER_IDX);
-    is_write = is_write1 & 1;
+    is_write = (access_type == MMU_DATA_STORE);
     a20_mask = x86_get_a20_mask(env);
 
     if (!(pg_mode & PG_MODE_NXE)) {
@@ -264,14 +266,14 @@ do_check_protect_pse36:
         }
 
         *prot &= pkr_prot;
-        if ((pkr_prot & (1 << is_write1)) == 0) {
-            assert(is_write1 != 2);
+        if ((pkr_prot & (1 << access_type)) == 0) {
+            assert(access_type != MMU_INST_FETCH);
             error_code |= PG_ERROR_PK_MASK;
             goto do_fault_protect;
         }
     }
 
-    if ((*prot & (1 << is_write1)) == 0) {
+    if ((*prot & (1 << access_type)) == 0) {
         goto do_fault_protect;
     }
 
@@ -297,7 +299,7 @@ do_check_protect_pse36:
     /* align to page_size */
     pte &= PG_ADDRESS_MASK & ~(*page_size - 1);
     page_offset = addr & (*page_size - 1);
-    *xlat = GET_HPHYS(cs, pte + page_offset, is_write1, prot);
+    *xlat = GET_HPHYS(cs, pte + page_offset, access_type, prot);
     return PG_ERROR_OK;
 
  do_fault_rsvd:
@@ -308,7 +310,7 @@ do_check_protect_pse36:
     error_code |= (is_write << PG_ERROR_W_BIT);
     if (is_user)
         error_code |= PG_ERROR_U_MASK;
-    if (is_write1 == 2 &&
+    if (access_type == MMU_INST_FETCH &&
         ((pg_mode & PG_MODE_NXE) || (pg_mode & PG_MODE_SMEP)))
         error_code |= PG_ERROR_I_D_MASK;
     return error_code;
@@ -353,7 +355,7 @@ hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
  * 1  = generate PF fault
  */
 static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
-                            int is_write1, int mmu_idx)
+                            MMUAccessType access_type, int mmu_idx)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -365,7 +367,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
 
 #if defined(DEBUG_MMU)
     printf("MMU fault: addr=%" VADDR_PRIx " w=%d mmu=%d eip=" TARGET_FMT_lx "\n",
-           addr, is_write1, mmu_idx, env->eip);
+           addr, access_type, mmu_idx, env->eip);
 #endif
 
     if (!(env->cr[0] & CR0_PG_MASK)) {
@@ -393,7 +395,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
             }
         }
 
-        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], is_write1,
+        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], access_type,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
     }
@@ -404,7 +406,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         vaddr = addr & TARGET_PAGE_MASK;
         paddr &= TARGET_PAGE_MASK;
 
-        assert(prot & (1 << is_write1));
+        assert(prot & (1 << access_type));
         tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
                                 prot, mmu_idx, page_size);
         return 0;
-- 
2.37.3


