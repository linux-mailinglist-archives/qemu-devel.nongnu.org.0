Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8C602E0F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:13:45 +0200 (CEST)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oknLj-00087b-0m
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmh0-0002Re-M2
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgw-00052C-Pk
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5dp7+qCUGzBtcpQe2Asqx5dhgaedWRqcldb8Y4LGrY=;
 b=W07nqTcAJ75RfIansXUVP5Zq8ceiqNzTz8og1C0SGs3j2YaiLzzPAPv1z3MX47Zb9+e9aM
 FWiqbYNdujF6HzN+X/T9tOD/sVLU4BBMe9+T12+03ao1BGREfUQYk/t/KVqnRgESwMZhgr
 EJShVKsxWZu0bXxYR0Ac/dXuN95+e+o=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-Gh_sDQOzPZ6G9Q5VDz3Ebg-1; Tue, 18 Oct 2022 09:31:31 -0400
X-MC-Unique: Gh_sDQOzPZ6G9Q5VDz3Ebg-1
Received: by mail-ej1-f70.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so6383939ejb.19
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5dp7+qCUGzBtcpQe2Asqx5dhgaedWRqcldb8Y4LGrY=;
 b=oTCUPqSOySAR5VIfm3o1zBwnRgpyrxKvwTG9ieF/SzWYPzD6mr1OBBqyojAWd5LnNM
 f06Y/askZ/2706GUsjfnzZK//MUIUou/Hug2IhpTbGp4k09pRaVWX8eHZVBB12UzVbSl
 rbp4NMDxerkb70rwxgp4iN2/d++AdfGH3idiYe+eyz2uwI/F8pjDkK4CBmOW6y9hBJJA
 sN1vK/VBzNumaFEe4FVO/Xp/g5ssAGk+RZ1cuCkk7OZ27u33nqFfCwC0O5B21zpsAO5m
 HPdoWkp0H4/NL6WUCBOJuDrRut3KlbWLlo4vQ1i4HYGzVG2n4S4RX92swpk6IsDU20Wi
 yh+w==
X-Gm-Message-State: ACrzQf1l3QsLS9jkfaHg9hL/kLNiHh/kDLGZ24ui2QKMqk5b8RrDKTe9
 CS1vtm8IiCqiD/h4LKIEKYQdem9rBXk99bcZcfoy5f1C+MGhIAR45ET6rX27Ge8ltQfIt4SazKB
 jhg6jK6+Ck/BStQwLqGmu/ni1bhymTyhrzj2g3nZoUNWU05vfcrsabI6J2e/vn0izCiY=
X-Received: by 2002:a05:6402:10c2:b0:45c:3c87:721f with SMTP id
 p2-20020a05640210c200b0045c3c87721fmr2731214edu.251.1666099889904; 
 Tue, 18 Oct 2022 06:31:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5TjWJcm3uWtbRBWditEv5b52BCXnQrkjhlL+ulbAr//CC3tSlC6ButZhVTduT2aL7i8SVtFA==
X-Received: by 2002:a05:6402:10c2:b0:45c:3c87:721f with SMTP id
 p2-20020a05640210c200b0045c3c87721fmr2731183edu.251.1666099889557; 
 Tue, 18 Oct 2022 06:31:29 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 md9-20020a170906ae8900b0078defb88b0dsm7454622ejb.73.2022.10.18.06.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/53] target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX
Date: Tue, 18 Oct 2022 15:30:02 +0200
Message-Id: <20221018133042.856368-14-pbonzini@redhat.com>
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

These new mmu indexes will be helpful for improving
paging and code throughout the target.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221002172956.265735-6-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu-param.h              |  2 +-
 target/i386/cpu.h                    |  3 +
 target/i386/tcg/sysemu/excp_helper.c | 82 ++++++++++++++++++----------
 target/i386/tcg/sysemu/svm_helper.c  |  3 +
 4 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 1e79389761..f579b16bd2 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -23,7 +23,7 @@
 # define TARGET_VIRT_ADDR_SPACE_BITS  32
 #endif
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 3
+#define NB_MMU_MODES 5
 
 #ifndef CONFIG_USER_ONLY
 # define TARGET_TB_PCREL 1
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 4d21c5759d..3573107356 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2149,6 +2149,9 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #define MMU_KSMAP_IDX   0
 #define MMU_USER_IDX    1
 #define MMU_KNOSMAP_IDX 2
+#define MMU_NESTED_IDX  3
+#define MMU_PHYS_IDX    4
+
 static inline int cpu_mmu_index(CPUX86State *env, bool ifetch)
 {
     return (env->hflags & HF_CPL_MASK) == 3 ? MMU_USER_IDX :
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 816b307547..494dc6d00c 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -448,41 +448,65 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
                                  MMUAccessType access_type, int mmu_idx,
                                  TranslateResult *out, TranslateFault *err)
 {
-    if (!(env->cr[0] & CR0_PG_MASK)) {
-        out->paddr = addr & x86_get_a20_mask(env);
+    TranslateParams in;
+    bool use_stage2 = env->hflags2 & HF2_NPT_MASK;
 
-#ifdef TARGET_X86_64
-        if (!(env->hflags & HF_LMA_MASK)) {
-            /* Without long mode we can only address 32bits in real mode */
-            out->paddr = (uint32_t)out->paddr;
-        }
-#endif
-        out->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        out->page_size = TARGET_PAGE_SIZE;
-        return true;
-    } else {
-        TranslateParams in = {
-            .addr = addr,
-            .cr3 = env->cr[3],
-            .pg_mode = get_pg_mode(env),
-            .mmu_idx = mmu_idx,
-            .access_type = access_type,
-            .use_stage2 = env->hflags2 & HF2_NPT_MASK,
-        };
+    in.addr = addr;
+    in.access_type = access_type;
 
-        if (in.pg_mode & PG_MODE_LMA) {
-            /* test virtual address sign extension */
-            int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
-            int64_t sext = (int64_t)addr >> shift;
-            if (sext != 0 && sext != -1) {
-                err->exception_index = EXCP0D_GPF;
-                err->error_code = 0;
-                err->cr2 = addr;
+    switch (mmu_idx) {
+    case MMU_PHYS_IDX:
+        break;
+
+    case MMU_NESTED_IDX:
+        if (likely(use_stage2)) {
+            in.cr3 = env->nested_cr3;
+            in.pg_mode = env->nested_pg_mode;
+            in.mmu_idx = MMU_USER_IDX;
+            in.use_stage2 = false;
+
+            if (!mmu_translate(env, &in, out, err)) {
+                err->stage2 = S2_GPA;
                 return false;
             }
+            return true;
         }
-        return mmu_translate(env, &in, out, err);
+        break;
+
+    default:
+        in.cr3 = env->cr[3];
+        in.mmu_idx = mmu_idx;
+        in.use_stage2 = use_stage2;
+        in.pg_mode = get_pg_mode(env);
+
+        if (likely(in.pg_mode)) {
+            if (in.pg_mode & PG_MODE_LMA) {
+                /* test virtual address sign extension */
+                int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
+                int64_t sext = (int64_t)addr >> shift;
+                if (sext != 0 && sext != -1) {
+                    err->exception_index = EXCP0D_GPF;
+                    err->error_code = 0;
+                    err->cr2 = addr;
+                    return false;
+                }
+            }
+            return mmu_translate(env, &in, out, err);
+        }
+        break;
     }
+
+    /* Translation disabled. */
+    out->paddr = addr & x86_get_a20_mask(env);
+#ifdef TARGET_X86_64
+    if (!(env->hflags & HF_LMA_MASK)) {
+        /* Without long mode we can only address 32bits in real mode */
+        out->paddr = (uint32_t)out->paddr;
+    }
+#endif
+    out->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+    out->page_size = TARGET_PAGE_SIZE;
+    return true;
 }
 
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 2b6f450af9..85b7741d94 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -271,6 +271,8 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
         env->hflags2 |= HF2_NPT_MASK;
 
         env->nested_pg_mode = get_pg_mode(env) & PG_MODE_SVM_MASK;
+
+        tlb_flush_by_mmuidx(cs, 1 << MMU_NESTED_IDX);
     }
 
     /* enable intercepts */
@@ -720,6 +722,7 @@ void do_vmexit(CPUX86State *env)
                  env->vm_vmcb + offsetof(struct vmcb, control.int_state), 0);
     }
     env->hflags2 &= ~HF2_NPT_MASK;
+    tlb_flush_by_mmuidx(cs, 1 << MMU_NESTED_IDX);
 
     /* Save the VM state in the vmcb */
     svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.es),
-- 
2.37.3


