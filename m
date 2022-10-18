Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F54602D8A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:37 +0200 (CEST)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn66-0003J7-Fw
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmh5-0002fu-FI
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmh1-00053S-Ku
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rj/4jO8sSUdfjVKvFFNktbJ8p40rBE0xrv8gZ3XIDKc=;
 b=PpiVHujBlYLhEo6++gaMQllmarrdaKj/focB3Xsul5YI9KMh284z+aGJqROPDBmpTc+r2j
 +0CXUfPKUjSGt7x/zoYyNR/9cRg36r/QEf4AH1eCfzU6z2hnBc9LCm8HujoQmWisLhmcND
 zp1DEF00iJnkVeOuo1KDqKqw1hYaNVk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-Y3h6so_FN5udvY2tQMjIOQ-1; Tue, 18 Oct 2022 09:31:35 -0400
X-MC-Unique: Y3h6so_FN5udvY2tQMjIOQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 hc43-20020a17090716ab00b0078e28567ffbso4748101ejc.15
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rj/4jO8sSUdfjVKvFFNktbJ8p40rBE0xrv8gZ3XIDKc=;
 b=yxJLRKe6T9p3vsSF2clezvWFedCZh+DtfAEeVfeusLKtesKYQrhR7ORQ5cJ3xEbtsY
 GwuSaY6K42JR3ylHO5DMoH1G6m73li3/8TqEEpGrRSmXAruuUQJEICuYyZhz2M0U1Qzt
 2OjQhh0AKnCTYPyCvuoy3XN6o3lm+BmwNjQBTENVvoHAW9KAeAD3f978XH8QFKyRdejT
 3DTO8AxSd4SgFGuXLnm6Vs+5yE95g7V7oorbX1GnbZYPuZEAb61N3v4/eJ5eL1KUJOYg
 POnz/3ZfrMSseL2dRrq3ZEaopfZDRHHBk89Q5nmUsg/WWBvhseFyIoB/2orPXMQ/Ml6t
 k2PQ==
X-Gm-Message-State: ACrzQf2/ma6Y+19iqlGRNKH6OvskP+TKwfzwNygM/rSnPNFYmHm1Hbgg
 41b2xjbifxjqK0kbz29vNGbAkte1lf8YbgiWFzCeISianUWGLbnvG+EZy75tTLkyvWOWwvWETJJ
 Jr+lMAepQ9mtY7vuHMC/NY93yNxTBNFbNfeL5c4JxiH9REKPYmZ0qmyUugeyKejvEGD4=
X-Received: by 2002:a17:906:fe45:b0:791:9624:9ea4 with SMTP id
 wz5-20020a170906fe4500b0079196249ea4mr2389493ejb.147.1666099893673; 
 Tue, 18 Oct 2022 06:31:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4QLUuD3s5NYnN/KLkmfO6gQnmz6s2k38Zllkjsm6MRFArw3EtYyaN1s/KYu1ixPJRiqZ/+Sw==
X-Received: by 2002:a17:906:fe45:b0:791:9624:9ea4 with SMTP id
 wz5-20020a170906fe4500b0079196249ea4mr2389457ejb.147.1666099893142; 
 Tue, 18 Oct 2022 06:31:33 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a056402115000b004575085bf18sm8830219edw.74.2022.10.18.06.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:31:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/53] target/i386: Use MMU_NESTED_IDX for vmload/vmsave
Date: Tue, 18 Oct 2022 15:30:03 +0200
Message-Id: <20221018133042.856368-15-pbonzini@redhat.com>
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

Use MMU_NESTED_IDX for each memory access, rather than
just a single translation to physical.  Adjust svm_save_seg
and svm_load_seg to pass in mmu_idx.

This removes the last use of get_hphys so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221002172956.265735-7-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                    |   2 -
 target/i386/tcg/sysemu/excp_helper.c |  31 ----
 target/i386/tcg/sysemu/svm_helper.c  | 231 +++++++++++++++------------
 3 files changed, 126 insertions(+), 138 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 3573107356..6bb6653e76 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2387,8 +2387,6 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-                        int *prot);
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 494dc6d00c..86b3014196 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -413,37 +413,6 @@ static G_NORETURN void raise_stage2(CPUX86State *env, TranslateFault *err,
     cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, retaddr);
 }
 
-hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-                 int *prot)
-{
-    CPUX86State *env = cs->env_ptr;
-
-    if (likely(!(env->hflags2 & HF2_NPT_MASK))) {
-        return gphys;
-    } else {
-        TranslateParams in = {
-            .addr = gphys,
-            .cr3 = env->nested_cr3,
-            .pg_mode = env->nested_pg_mode,
-            .mmu_idx = MMU_USER_IDX,
-            .access_type = access_type,
-            .use_stage2 = false,
-        };
-        TranslateResult out;
-        TranslateFault err;
-
-        if (!mmu_translate(env, &in, &out, &err)) {
-            err.stage2 = prot ? SVM_NPTEXIT_GPA : SVM_NPTEXIT_GPT;
-            raise_stage2(env, &err, env->retaddr);
-        }
-
-        if (prot) {
-            *prot &= out.prot;
-        }
-        return out.paddr;
-    }
-}
-
 static bool get_physical_address(CPUX86State *env, vaddr addr,
                                  MMUAccessType access_type, int mmu_idx,
                                  TranslateResult *out, TranslateFault *err)
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 85b7741d94..8e88567399 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -27,19 +27,19 @@
 
 /* Secure Virtual Machine helpers */
 
-static inline void svm_save_seg(CPUX86State *env, hwaddr addr,
-                                const SegmentCache *sc)
+static void svm_save_seg(CPUX86State *env, int mmu_idx, hwaddr addr,
+                         const SegmentCache *sc)
 {
-    CPUState *cs = env_cpu(env);
-
-    x86_stw_phys(cs, addr + offsetof(struct vmcb_seg, selector),
-             sc->selector);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb_seg, base),
-             sc->base);
-    x86_stl_phys(cs, addr + offsetof(struct vmcb_seg, limit),
-             sc->limit);
-    x86_stw_phys(cs, addr + offsetof(struct vmcb_seg, attrib),
-             ((sc->flags >> 8) & 0xff) | ((sc->flags >> 12) & 0x0f00));
+    cpu_stw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, selector),
+                      sc->selector, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, base),
+                      sc->base, mmu_idx, 0);
+    cpu_stl_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, limit),
+                      sc->limit, mmu_idx, 0);
+    cpu_stw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, attrib),
+                      ((sc->flags >> 8) & 0xff)
+                      | ((sc->flags >> 12) & 0x0f00),
+                      mmu_idx, 0);
 }
 
 /*
@@ -52,29 +52,36 @@ static inline void svm_canonicalization(CPUX86State *env, target_ulong *seg_base
     *seg_base = ((((long) *seg_base) << shift_amt) >> shift_amt);
 }
 
-static inline void svm_load_seg(CPUX86State *env, hwaddr addr,
-                                SegmentCache *sc)
+static void svm_load_seg(CPUX86State *env, int mmu_idx, hwaddr addr,
+                         SegmentCache *sc)
 {
-    CPUState *cs = env_cpu(env);
     unsigned int flags;
 
-    sc->selector = x86_lduw_phys(cs,
-                             addr + offsetof(struct vmcb_seg, selector));
-    sc->base = x86_ldq_phys(cs, addr + offsetof(struct vmcb_seg, base));
-    sc->limit = x86_ldl_phys(cs, addr + offsetof(struct vmcb_seg, limit));
-    flags = x86_lduw_phys(cs, addr + offsetof(struct vmcb_seg, attrib));
+    sc->selector =
+        cpu_lduw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, selector),
+                           mmu_idx, 0);
+    sc->base =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, base),
+                          mmu_idx, 0);
+    sc->limit =
+        cpu_ldl_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, limit),
+                          mmu_idx, 0);
+    flags =
+        cpu_lduw_mmuidx_ra(env, addr + offsetof(struct vmcb_seg, attrib),
+                           mmu_idx, 0);
     sc->flags = ((flags & 0xff) << 8) | ((flags & 0x0f00) << 12);
+
     svm_canonicalization(env, &sc->base);
 }
 
-static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
-                                      int seg_reg)
+static void svm_load_seg_cache(CPUX86State *env, int mmu_idx,
+                               hwaddr addr, int seg_reg)
 {
-    SegmentCache sc1, *sc = &sc1;
+    SegmentCache sc;
 
-    svm_load_seg(env, addr, sc);
-    cpu_x86_load_seg_cache(env, seg_reg, sc->selector,
-                           sc->base, sc->limit, sc->flags);
+    svm_load_seg(env, mmu_idx, addr, &sc);
+    cpu_x86_load_seg_cache(env, seg_reg, sc.selector,
+                           sc.base, sc.limit, sc.flags);
 }
 
 static inline bool is_efer_invalid_state (CPUX86State *env)
@@ -199,13 +206,17 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
              env->vm_hsave + offsetof(struct vmcb, save.rflags),
              cpu_compute_eflags(env));
 
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.es),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.es),
                  &env->segs[R_ES]);
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.cs),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.cs),
                  &env->segs[R_CS]);
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.ss),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.ss),
                  &env->segs[R_SS]);
-    svm_save_seg(env, env->vm_hsave + offsetof(struct vmcb, save.ds),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_hsave + offsetof(struct vmcb, save.ds),
                  &env->segs[R_DS]);
 
     x86_stq_phys(cs, env->vm_hsave + offsetof(struct vmcb, save.rip),
@@ -325,18 +336,18 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
                                                           save.rflags)),
                     ~(CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C | DF_MASK));
 
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.es),
-                       R_ES);
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.cs),
-                       R_CS);
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.ss),
-                       R_SS);
-    svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.ds),
-                       R_DS);
-    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.idtr),
-                       &env->idt);
-    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.gdtr),
-                       &env->gdt);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.es), R_ES);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.cs), R_CS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.ss), R_SS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_vmcb + offsetof(struct vmcb, save.ds), R_DS);
+    svm_load_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.idtr), &env->idt);
+    svm_load_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.gdtr), &env->gdt);
 
     env->eip = x86_ldq_phys(cs,
                         env->vm_vmcb + offsetof(struct vmcb, save.rip));
@@ -451,9 +462,8 @@ void helper_vmmcall(CPUX86State *env)
 
 void helper_vmload(CPUX86State *env, int aflag)
 {
-    CPUState *cs = env_cpu(env);
+    int mmu_idx = MMU_PHYS_IDX;
     target_ulong addr;
-    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMLOAD, 0, GETPC());
 
@@ -464,43 +474,52 @@ void helper_vmload(CPUX86State *env, int aflag)
     }
 
     if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMLOAD, GETPC())) {
-        addr = get_hphys(cs, addr, MMU_DATA_LOAD, &prot);
+        mmu_idx = MMU_NESTED_IDX;
     }
 
-    qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmload! " TARGET_FMT_lx
-                  "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
-                  addr, x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                          save.fs.base)),
-                  env->segs[R_FS].base);
-
-    svm_load_seg_cache(env, addr + offsetof(struct vmcb, save.fs), R_FS);
-    svm_load_seg_cache(env, addr + offsetof(struct vmcb, save.gs), R_GS);
-    svm_load_seg(env, addr + offsetof(struct vmcb, save.tr), &env->tr);
-    svm_load_seg(env, addr + offsetof(struct vmcb, save.ldtr), &env->ldt);
+    svm_load_seg_cache(env, mmu_idx,
+                       addr + offsetof(struct vmcb, save.fs), R_FS);
+    svm_load_seg_cache(env, mmu_idx,
+                       addr + offsetof(struct vmcb, save.gs), R_GS);
+    svm_load_seg(env, mmu_idx,
+                 addr + offsetof(struct vmcb, save.tr), &env->tr);
+    svm_load_seg(env, mmu_idx,
+                 addr + offsetof(struct vmcb, save.ldtr), &env->ldt);
 
 #ifdef TARGET_X86_64
-    env->kernelgsbase = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                 save.kernel_gs_base));
-    env->lstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.lstar));
-    env->cstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.cstar));
-    env->fmask = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.sfmask));
+    env->kernelgsbase =
+        cpu_ldq_mmuidx_ra(env,
+                          addr + offsetof(struct vmcb, save.kernel_gs_base),
+                          mmu_idx, 0);
+    env->lstar =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.lstar),
+                          mmu_idx, 0);
+    env->cstar =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.cstar),
+                          mmu_idx, 0);
+    env->fmask =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sfmask),
+                          mmu_idx, 0);
     svm_canonicalization(env, &env->kernelgsbase);
 #endif
-    env->star = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.star));
-    env->sysenter_cs = x86_ldq_phys(cs,
-                                addr + offsetof(struct vmcb, save.sysenter_cs));
-    env->sysenter_esp = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                 save.sysenter_esp));
-    env->sysenter_eip = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
-                                                 save.sysenter_eip));
-
+    env->star =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.star),
+                          mmu_idx, 0);
+    env->sysenter_cs =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_cs),
+                          mmu_idx, 0);
+    env->sysenter_esp =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_esp),
+                          mmu_idx, 0);
+    env->sysenter_eip =
+        cpu_ldq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_eip),
+                          mmu_idx, 0);
 }
 
 void helper_vmsave(CPUX86State *env, int aflag)
 {
-    CPUState *cs = env_cpu(env);
+    int mmu_idx = MMU_PHYS_IDX;
     target_ulong addr;
-    int prot;
 
     cpu_svm_check_intercept_param(env, SVM_EXIT_VMSAVE, 0, GETPC());
 
@@ -511,38 +530,36 @@ void helper_vmsave(CPUX86State *env, int aflag)
     }
 
     if (virtual_vm_load_save_enabled(env, SVM_EXIT_VMSAVE, GETPC())) {
-        addr = get_hphys(cs, addr, MMU_DATA_STORE, &prot);
+        mmu_idx = MMU_NESTED_IDX;
     }
 
-    qemu_log_mask(CPU_LOG_TB_IN_ASM, "vmsave! " TARGET_FMT_lx
-                  "\nFS: %016" PRIx64 " | " TARGET_FMT_lx "\n",
-                  addr, x86_ldq_phys(cs,
-                                 addr + offsetof(struct vmcb, save.fs.base)),
-                  env->segs[R_FS].base);
-
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.fs),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.fs),
                  &env->segs[R_FS]);
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.gs),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.gs),
                  &env->segs[R_GS]);
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.tr),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.tr),
                  &env->tr);
-    svm_save_seg(env, addr + offsetof(struct vmcb, save.ldtr),
+    svm_save_seg(env, mmu_idx, addr + offsetof(struct vmcb, save.ldtr),
                  &env->ldt);
 
 #ifdef TARGET_X86_64
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.kernel_gs_base),
-             env->kernelgsbase);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.lstar), env->lstar);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.cstar), env->cstar);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.sfmask), env->fmask);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.kernel_gs_base),
+                      env->kernelgsbase, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.lstar),
+                      env->lstar, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.cstar),
+                      env->cstar, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sfmask),
+                      env->fmask, mmu_idx, 0);
 #endif
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.star), env->star);
-    x86_stq_phys(cs,
-             addr + offsetof(struct vmcb, save.sysenter_cs), env->sysenter_cs);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.sysenter_esp),
-             env->sysenter_esp);
-    x86_stq_phys(cs, addr + offsetof(struct vmcb, save.sysenter_eip),
-             env->sysenter_eip);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.star),
+                      env->star, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_cs),
+                      env->sysenter_cs, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_esp),
+                      env->sysenter_esp, mmu_idx, 0);
+    cpu_stq_mmuidx_ra(env, addr + offsetof(struct vmcb, save.sysenter_eip),
+                      env->sysenter_eip, mmu_idx, 0);
 }
 
 void helper_stgi(CPUX86State *env)
@@ -725,13 +742,17 @@ void do_vmexit(CPUX86State *env)
     tlb_flush_by_mmuidx(cs, 1 << MMU_NESTED_IDX);
 
     /* Save the VM state in the vmcb */
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.es),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.es),
                  &env->segs[R_ES]);
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.cs),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.cs),
                  &env->segs[R_CS]);
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.ss),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.ss),
                  &env->segs[R_SS]);
-    svm_save_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.ds),
+    svm_save_seg(env, MMU_PHYS_IDX,
+                 env->vm_vmcb + offsetof(struct vmcb, save.ds),
                  &env->segs[R_DS]);
 
     x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.gdtr.base),
@@ -812,14 +833,14 @@ void do_vmexit(CPUX86State *env)
                     ~(CC_O | CC_S | CC_Z | CC_A | CC_P | CC_C | DF_MASK |
                       VM_MASK));
 
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.es),
-                       R_ES);
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.cs),
-                       R_CS);
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.ss),
-                       R_SS);
-    svm_load_seg_cache(env, env->vm_hsave + offsetof(struct vmcb, save.ds),
-                       R_DS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.es), R_ES);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.cs), R_CS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.ss), R_SS);
+    svm_load_seg_cache(env, MMU_PHYS_IDX,
+                       env->vm_hsave + offsetof(struct vmcb, save.ds), R_DS);
 
     env->eip = x86_ldq_phys(cs,
                         env->vm_hsave + offsetof(struct vmcb, save.rip));
-- 
2.37.3


