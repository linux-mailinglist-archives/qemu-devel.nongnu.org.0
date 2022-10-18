Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CDD602D9E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:58:06 +0200 (CEST)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6b-0005Gy-QQ
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhC-00033L-FE
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmh9-00054z-9p
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2F97ColJI+7lzgMeZU3g4eV1pMug9BLejVEp/uW8X/A=;
 b=PoRUyqCxQt7A3ONBgIUN2NsSYymFDNzIYyGumFCxJ1fFNqwPpvD7oebI/UR+2NJa51KzwN
 JoMGnPnWH3PYdskdHPJmCXuH8QeHlxSjL57/rcxk+H7+d3z/YgXeEqZqE4ZV0ZS6Li0ybf
 GITVFQ48b7WwGNTgPSyik7LZRU33Y+M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-adipXhunMZ-jduEMNCAnqw-1; Tue, 18 Oct 2022 09:31:45 -0400
X-MC-Unique: adipXhunMZ-jduEMNCAnqw-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp41-20020a1709073e2900b0078e07dbf280so6356613ejc.7
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2F97ColJI+7lzgMeZU3g4eV1pMug9BLejVEp/uW8X/A=;
 b=V3CgwODvRdBFvawuuZRTJVInc3l/UQtA/DzVgpV67wph23Z/tXUpbn4LX9mwmn1sTJ
 2QS2UZJ+HtARlfYAfs15tS+kW6qZglSXkparOhJVDS9VFXSKjlFl53uhnSOS9ahNUaxN
 MOrjwuJ+FU/1NG7GQghIUdHYsdn+kVsZ6vfXlSftD21+pLm2Mc7lE17T4C/joRcuae41
 23V6y2AVUuMlYcQm9v3PbLZR5ZPY/mdDH9P9AmfTIdzWC9gkoFtLHXiWsIEwb6gfbvlx
 rxZTj58+eyHLc60wM946Sm7Q5JVVwQ8XuUxPCcFJTvf3Ne/atNlZiXlf5IlEdI9EKIOy
 9R6Q==
X-Gm-Message-State: ACrzQf0z7J/bHftx1SfdIrKkKJFrbcRzvIP9YWgmbFPP5tlnh5esKhN5
 BMwC3umrkR2uEZVEQ1GMqTxeJiLubhtQYg/TnCpCfhE2X7wj0LWWFVF9nUsk5ZIh9RmsbEZrLn3
 4Nb15llGeQh9MoSqeukTcDLSuiVvmrcGSk8pK5IqgmfapUMWaUUv1NKSwDP50feGJdrU=
X-Received: by 2002:a05:6402:ca:b0:45c:dbdd:8143 with SMTP id
 i10-20020a05640200ca00b0045cdbdd8143mr2619830edu.213.1666099903534; 
 Tue, 18 Oct 2022 06:31:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nNrJh/e0JBxg1MRWs4S0vIY5bEaWFwglS9zvwmmq0djcdBFCtEcrdMBrQW9fr0ZQAgjLegQ==
X-Received: by 2002:a05:6402:ca:b0:45c:dbdd:8143 with SMTP id
 i10-20020a05640200ca00b0045cdbdd8143mr2619799edu.213.1666099903242; 
 Tue, 18 Oct 2022 06:31:43 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170906384e00b0078246b1360fsm7477339ejc.131.2022.10.18.06.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/53] target/i386: Use probe_access_full for final stage2
 translation
Date: Tue, 18 Oct 2022 15:30:06 +0200
Message-Id: <20221018133042.856368-18-pbonzini@redhat.com>
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

Rather than recurse directly on mmu_translate, go through the
same softmmu lookup that we did for the page table walk.
This centralizes all knowledge of MMU_NESTED_IDX, with respect
to setup of TranslationParams, to get_physical_address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221002172956.265735-10-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 40 +++++++++++++++++++---------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e8457e9b21..d51b5d7431 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -143,7 +143,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
         .err = err,
         .ptw_idx = in->ptw_idx,
     };
-    hwaddr pte_addr;
+    hwaddr pte_addr, paddr;
     uint32_t pkr;
     int page_size;
 
@@ -420,33 +420,47 @@ do_check_protect_pse36:
     }
 
     /* align to page_size */
-    out->paddr = (pte & a20_mask & PG_ADDRESS_MASK & ~(page_size - 1))
-               | (addr & (page_size - 1));
+    paddr = (pte & a20_mask & PG_ADDRESS_MASK & ~(page_size - 1))
+          | (addr & (page_size - 1));
 
     if (in->ptw_idx == MMU_NESTED_IDX) {
-        TranslateParams nested_in = {
-            .addr = out->paddr,
-            .access_type = access_type,
-            .cr3 = env->nested_cr3,
-            .pg_mode = env->nested_pg_mode,
-            .mmu_idx = MMU_USER_IDX,
-            .ptw_idx = MMU_PHYS_IDX,
-        };
+        CPUTLBEntryFull *full;
+        int flags, nested_page_size;
 
-        if (!mmu_translate(env, &nested_in, out, err)) {
+        flags = probe_access_full(env, paddr, access_type,
+                                  MMU_NESTED_IDX, true,
+                                  &pte_trans.haddr, &full, 0);
+        if (unlikely(flags & TLB_INVALID_MASK)) {
+            err->exception_index = 0; /* unused */
+            err->error_code = env->error_code;
+            err->cr2 = paddr;
             err->stage2 = S2_GPA;
             return false;
         }
 
         /* Merge stage1 & stage2 protection bits. */
-        prot &= out->prot;
+        prot &= full->prot;
 
         /* Re-verify resulting protection. */
         if ((prot & (1 << access_type)) == 0) {
             goto do_fault_protect;
         }
+
+        /* Merge stage1 & stage2 addresses to final physical address. */
+        nested_page_size = 1 << full->lg_page_size;
+        paddr = (full->phys_addr & ~(nested_page_size - 1))
+              | (paddr & (nested_page_size - 1));
+
+        /*
+         * Use the larger of stage1 & stage2 page sizes, so that
+         * invalidation works.
+         */
+        if (nested_page_size > page_size) {
+            page_size = nested_page_size;
+        }
     }
 
+    out->paddr = paddr;
     out->prot = prot;
     out->page_size = page_size;
     return true;
-- 
2.37.3


