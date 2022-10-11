Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB785FB223
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:12:19 +0200 (CEST)
Received: from localhost ([::1]:44394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiE7O-0002Ve-L9
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCVO-0003CO-KW
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCVG-0004mc-PO
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zch28MyvyfFbvtCLtqZkoEXshw0n579O3a7dkpE/m4=;
 b=LZix3WBUkN2xbwWf0cNkIJE1RKoj7rlaMrY2Oi4xBf1Cf0pyPRkfHeoJMZuOlAJSWp+i6D
 zLXI+aRhZ7NMjoiv73OUMQ2bd18ioKQF70h/L0HWmA8SWDMrhCgN839TuEzqq6PwApvYWS
 1cthunP2ZKF0yiYO3Nazoyn/J6zYo68=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-URFH1OwfNweBjHRpKSv1PQ-1; Tue, 11 Oct 2022 06:28:48 -0400
X-MC-Unique: URFH1OwfNweBjHRpKSv1PQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso5666377ejb.14
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zch28MyvyfFbvtCLtqZkoEXshw0n579O3a7dkpE/m4=;
 b=lfEDLANcnscd9j5XKM+7LTrWKer8DnVNccxIcZGhyre0NuLE58LqGfs4/LyVgsLZkq
 lwsGgP0xED1UudJoMeqgCMTSYDHGY53XhD+Rgl8mGSIS14KKFEMIRRIgu//Tv2y+lKCu
 i5+fIi51tOULqhnVURL3UTfy18wa7xdccZSUn/vkZdOaqFGUao63Pbz3Jr+A6PCL95Dk
 i7WcNFQxAixio69D/DDCCCo6vK4kBn9Oeq3zlJwEQYXRI8Lvp3nbMr/uNXEcZGzmQIVZ
 xQrhuPdocU+d0dr6YXAU3QrEH0sRd5cD2ylPWyqF8TvvRlFi+kG+wjXEUqAiQbgYNwj0
 KzrQ==
X-Gm-Message-State: ACrzQf2izp4LmxFrWPJE01mIEKDANHMsa7z2i8RpoCeF+f467y+gVMVS
 YrWUdPNKArZx7iGGbSEk9BdIF3FEpL1JNDMQ5pp2Vj5IEpPT3lFkSmdoY0Ha7jrbc1D9za1IOxp
 JYM/aWJp6Ns3g5NRX/+mVvHjBiJnFVFzPVNmjmI8rXHQ8pOsqv4uvKyxLzkWWD5VBU+g=
X-Received: by 2002:aa7:d454:0:b0:459:9ae7:725b with SMTP id
 q20-20020aa7d454000000b004599ae7725bmr21562453edr.165.1665484127136; 
 Tue, 11 Oct 2022 03:28:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6GoPlf6qv6gikzKZ2RJr/axHrB478JsvXNquKAfEzf4jdGarHakIF92JlOxn8DwT71uHtaVg==
X-Received: by 2002:aa7:d454:0:b0:459:9ae7:725b with SMTP id
 q20-20020aa7d454000000b004599ae7725bmr21562432edr.165.1665484126826; 
 Tue, 11 Oct 2022 03:28:46 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 b38-20020a509f29000000b00458b41d9460sm8773557edf.92.2022.10.11.03.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 37/37] linux-user: i386/signal: support XSAVE/XRSTOR for signal
 frame fpstate
Date: Tue, 11 Oct 2022 12:27:00 +0200
Message-Id: <20221011102700.319178-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add support for saving/restoring extended save states when signals
are delivered.  This allows using AVX, MPX or PKRU registers in
signal handlers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 linux-user/i386/signal.c     | 119 +++++++++++++++++++++++++++++------
 target/i386/cpu.c            |   2 +-
 target/i386/cpu.h            |   3 +
 target/i386/tcg/fpu_helper.c |  64 +++++++++++--------
 4 files changed, 142 insertions(+), 46 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 58b11be116..60fa07d6f9 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -24,6 +24,10 @@
 
 /* from the Linux kernel - /arch/x86/include/uapi/asm/sigcontext.h */
 
+#define TARGET_FP_XSTATE_MAGIC1         0x46505853U /* FPXS */
+#define TARGET_FP_XSTATE_MAGIC2         0x46505845U /* FPXE */
+#define TARGET_FP_XSTATE_MAGIC2_SIZE    4
+
 struct target_fpreg {
     uint16_t significand[4];
     uint16_t exponent;
@@ -39,6 +43,15 @@ struct target_xmmreg {
     uint32_t element[4];
 };
 
+struct target_fpx_sw_bytes {
+    uint32_t magic1;
+    uint32_t extended_size;
+    uint64_t xfeatures;
+    uint32_t xstate_size;
+    uint32_t reserved[7];
+};
+QEMU_BUILD_BUG_ON(sizeof(struct target_fpx_sw_bytes) != 12*4);
+
 struct target_fpstate_fxsave {
     /* FXSAVE format */
     uint16_t cw;
@@ -51,10 +64,13 @@ struct target_fpstate_fxsave {
     uint32_t mxcsr_mask;
     uint32_t st_space[32];
     uint32_t xmm_space[64];
-    uint32_t reserved[24];
+    uint32_t hw_reserved[12];
+    struct target_fpx_sw_bytes sw_reserved;
+    uint8_t xfeatures[];
 };
 #define TARGET_FXSAVE_SIZE   sizeof(struct target_fpstate_fxsave)
 QEMU_BUILD_BUG_ON(TARGET_FXSAVE_SIZE != 512);
+QEMU_BUILD_BUG_ON(offsetof(struct target_fpstate_fxsave, sw_reserved) != 464);
 
 struct target_fpstate_32 {
     /* Regular FPU environment */
@@ -214,13 +230,39 @@ struct rt_sigframe {
  * Set up a signal frame.
  */
 
-static void fxsave_sigcontext(CPUX86State *env, struct target_fpstate_fxsave *fxsave,
-                              abi_ulong fxsave_addr)
+static void xsave_sigcontext(CPUX86State *env, struct target_fpstate_fxsave *fxsave,
+                             abi_ulong fxsave_addr)
 {
-    /* fxsave_addr must be 16 byte aligned for fxsave */
-    assert(!(fxsave_addr & 0xf));
+    if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
+        /* fxsave_addr must be 16 byte aligned for fxsave */
+        assert(!(fxsave_addr & 0xf));
 
-    cpu_x86_fxsave(env, fxsave_addr);
+        cpu_x86_fxsave(env, fxsave_addr);
+        __put_user(0, &fxsave->sw_reserved.magic1);
+    } else {
+        uint32_t xstate_size = xsave_area_size(env->xcr0, false);
+        uint32_t xfeatures_size = xstate_size - TARGET_FXSAVE_SIZE;
+
+        /*
+         * extended_size is the offset from fpstate_addr to right after the end
+         * of the extended save states.  On 32-bit that includes the legacy
+         * FSAVE area.
+         */
+        uint32_t extended_size = TARGET_FPSTATE_FXSAVE_OFFSET
+            + xstate_size + TARGET_FP_XSTATE_MAGIC2_SIZE;
+
+        /* fxsave_addr must be 64 byte aligned for xsave */
+        assert(!(fxsave_addr & 0x3f));
+
+        /* Zero the header, XSAVE *adds* features to an existing save state.  */
+        memset(fxsave->xfeatures, 0, 64);
+        cpu_x86_xsave(env, fxsave_addr);
+        __put_user(TARGET_FP_XSTATE_MAGIC1, &fxsave->sw_reserved.magic1);
+        __put_user(extended_size, &fxsave->sw_reserved.extended_size);
+        __put_user(env->xcr0, &fxsave->sw_reserved.xfeatures);
+        __put_user(xstate_size, &fxsave->sw_reserved.xstate_size);
+        __put_user(TARGET_FP_XSTATE_MAGIC2, (uint32_t *) &fxsave->xfeatures[xfeatures_size]);
+    }
 }
 
 static void setup_sigcontext(struct target_sigcontext *sc,
@@ -257,8 +299,8 @@ static void setup_sigcontext(struct target_sigcontext *sc,
     if (!(env->features[FEAT_1_EDX] & CPUID_FXSR)) {
         magic = 0xffff;
     } else {
-        fxsave_sigcontext(env, &fpstate->fxsave,
-                          fpstate_addr + TARGET_FPSTATE_FXSAVE_OFFSET);
+        xsave_sigcontext(env, &fpstate->fxsave,
+                         fpstate_addr + TARGET_FPSTATE_FXSAVE_OFFSET);
         magic = 0;
     }
     __put_user(magic, &fpstate->magic);
@@ -291,7 +333,7 @@ static void setup_sigcontext(struct target_sigcontext *sc,
     __put_user((uint16_t)0, &sc->fs);
     __put_user(env->segs[R_SS].selector, &sc->ss);
 
-    fxsave_sigcontext(env, fpstate, fpstate_addr);
+    xsave_sigcontext(env, fpstate, fpstate_addr);
 #endif
 
     __put_user(fpstate_addr, &sc->fpstate);
@@ -332,8 +374,12 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t fxsave_offset
 
     if (!(env->features[FEAT_1_EDX] & CPUID_FXSR)) {
         return (esp - (fxsave_offset + TARGET_FXSAVE_SIZE)) & -8ul;
-    } else {
+    } else if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
         return ((esp - TARGET_FXSAVE_SIZE) & -16ul) - fxsave_offset;
+    } else {
+        size_t xstate_size =
+               xsave_area_size(env->xcr0, false) + TARGET_FP_XSTATE_MAGIC2_SIZE;
+        return ((esp - xstate_size) & -64ul) - fxsave_offset;
     }
 }
 
@@ -437,7 +483,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     }
 
     /* Create the ucontext.  */
-    __put_user(0, &frame->uc.tuc_flags);
+    if (env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE) {
+        __put_user(1, &frame->uc.tuc_flags);
+    } else {
+        __put_user(0, &frame->uc.tuc_flags);
+    }
     __put_user(0, &frame->uc.tuc_link);
     target_save_altstack(&frame->uc.tuc_stack, env);
     setup_sigcontext(&frame->uc.tuc_mcontext, &frame->fpstate, env,
@@ -491,10 +541,37 @@ give_sigsegv:
     force_sigsegv(sig);
 }
 
+static int xrstor_sigcontext(CPUX86State *env, struct target_fpstate_fxsave *fxsave,
+                             abi_ulong fxsave_addr)
+{
+    if (env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE) {
+        uint32_t extended_size = tswapl(fxsave->sw_reserved.extended_size);
+        uint32_t xstate_size = tswapl(fxsave->sw_reserved.xstate_size);
+        uint32_t xfeatures_size = xstate_size - TARGET_FXSAVE_SIZE;
+
+        /* Linux checks MAGIC2 using xstate_size, not extended_size.  */
+        if (tswapl(fxsave->sw_reserved.magic1) == TARGET_FP_XSTATE_MAGIC1 &&
+            extended_size >= TARGET_FPSTATE_FXSAVE_OFFSET + xstate_size + TARGET_FP_XSTATE_MAGIC2_SIZE) {
+            if (!access_ok(env_cpu(env), VERIFY_READ, fxsave_addr,
+                           extended_size - TARGET_FPSTATE_FXSAVE_OFFSET)) {
+                return 1;
+            }
+            if (tswapl(*(uint32_t *) &fxsave->xfeatures[xfeatures_size]) == TARGET_FP_XSTATE_MAGIC2) {
+                cpu_x86_xrstor(env, fxsave_addr);
+                return 0;
+            }
+        }
+        /* fall through to fxrstor */
+    }
+
+    cpu_x86_fxrstor(env, fxsave_addr);
+    return 0;
+}
+
 static int
 restore_sigcontext(CPUX86State *env, struct target_sigcontext *sc)
 {
-    unsigned int err = 0;
+    int err = 1;
     abi_ulong fpstate_addr;
     unsigned int tmpflags;
 
@@ -545,24 +622,28 @@ restore_sigcontext(CPUX86State *env, struct target_sigcontext *sc)
 
     fpstate_addr = tswapl(sc->fpstate);
     if (fpstate_addr != 0) {
-        if (!access_ok(env_cpu(env), VERIFY_READ, fpstate_addr,
-                       sizeof(struct target_fpstate))) {
-            goto badframe;
+        struct target_fpstate *fpstate;
+        if (!lock_user_struct(VERIFY_READ, fpstate, fpstate_addr,
+                              sizeof(struct target_fpstate))) {
+            return err;
         }
 #ifndef TARGET_X86_64
         if (!(env->features[FEAT_1_EDX] & CPUID_FXSR)) {
             cpu_x86_frstor(env, fpstate_addr, 1);
+            err = 0;
         } else {
-            cpu_x86_fxrstor(env, fpstate_addr + TARGET_FPSTATE_FXSAVE_OFFSET);
+            err = xrstor_sigcontext(env, &fpstate->fxsave,
+                                    fpstate_addr + TARGET_FPSTATE_FXSAVE_OFFSET);
         }
 #else
-        cpu_x86_fxrstor(env, fpstate_addr);
+        err = xrstor_sigcontext(env, fpstate, fpstate_addr);
 #endif
+        unlock_user_struct(fpstate, fpstate_addr, 0);
+    } else {
+        err = 0;
     }
 
     return err;
-badframe:
-    return 1;
 }
 
 /* Note: there is no sigreturn on x86_64, there is only rt_sigreturn */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 06884177fa..8a11470507 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1467,7 +1467,7 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     },
 };
 
-static uint32_t xsave_area_size(uint64_t mask, bool compacted)
+uint32_t xsave_area_size(uint64_t mask, bool compacted)
 {
     uint64_t ret = x86_ext_save_areas[0].size;
     const ExtSaveArea *esa;
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4124973ce..9327353fff 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2071,6 +2071,8 @@ void cpu_x86_fsave(CPUX86State *s, target_ulong ptr, int data32);
 void cpu_x86_frstor(CPUX86State *s, target_ulong ptr, int data32);
 void cpu_x86_fxsave(CPUX86State *s, target_ulong ptr);
 void cpu_x86_fxrstor(CPUX86State *s, target_ulong ptr);
+void cpu_x86_xsave(CPUX86State *s, target_ulong ptr);
+void cpu_x86_xrstor(CPUX86State *s, target_ulong ptr);
 
 /* cpu.c */
 void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
@@ -2327,6 +2329,7 @@ bool cpu_is_bsp(X86CPU *cpu);
 
 void x86_cpu_xrstor_all_areas(X86CPU *cpu, const void *buf, uint32_t buflen);
 void x86_cpu_xsave_all_areas(X86CPU *cpu, void *buf, uint32_t buflen);
+uint32_t xsave_area_size(uint64_t mask, bool compacted);
 void x86_update_hflags(CPUX86State* env);
 
 static inline bool hyperv_feat_enabled(X86CPU *cpu, int feat)
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 30bc44fcf8..ad58931751 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2502,18 +2502,6 @@ void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
     do_frstor(env, ptr, data32, GETPC());
 }
 
-#if defined(CONFIG_USER_ONLY)
-void cpu_x86_fsave(CPUX86State *env, target_ulong ptr, int data32)
-{
-    do_fsave(env, ptr, data32, 0);
-}
-
-void cpu_x86_frstor(CPUX86State *env, target_ulong ptr, int data32)
-{
-    do_frstor(env, ptr, data32, 0);
-}
-#endif
-
 #define XO(X)  offsetof(X86XSaveArea, X)
 
 static void do_xsave_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
@@ -2787,21 +2775,8 @@ void helper_fxrstor(CPUX86State *env, target_ulong ptr)
     do_fxrstor(env, ptr, GETPC());
 }
 
-#if defined(CONFIG_USER_ONLY)
-void cpu_x86_fxsave(CPUX86State *env, target_ulong ptr)
+static void do_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm, uintptr_t ra)
 {
-    do_fxsave(env, ptr, 0);
-}
-
-void cpu_x86_fxrstor(CPUX86State *env, target_ulong ptr)
-{
-    do_fxrstor(env, ptr, 0);
-}
-#endif
-
-void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
-{
-    uintptr_t ra = GETPC();
     uint64_t xstate_bv, xcomp_bv, reserve0;
 
     rfbm &= env->xcr0;
@@ -2894,6 +2869,43 @@ void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
 
 #undef XO
 
+void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
+{
+    do_xrstor(env, ptr, rfbm, GETPC());
+}
+
+#if defined(CONFIG_USER_ONLY)
+void cpu_x86_fsave(CPUX86State *env, target_ulong ptr, int data32)
+{
+    do_fsave(env, ptr, data32, 0);
+}
+
+void cpu_x86_frstor(CPUX86State *env, target_ulong ptr, int data32)
+{
+    do_frstor(env, ptr, data32, 0);
+}
+
+void cpu_x86_fxsave(CPUX86State *env, target_ulong ptr)
+{
+    do_fxsave(env, ptr, 0);
+}
+
+void cpu_x86_fxrstor(CPUX86State *env, target_ulong ptr)
+{
+    do_fxrstor(env, ptr, 0);
+}
+
+void cpu_x86_xsave(CPUX86State *env, target_ulong ptr)
+{
+    do_xsave(env, ptr, -1, get_xinuse(env), -1, 0);
+}
+
+void cpu_x86_xrstor(CPUX86State *env, target_ulong ptr)
+{
+    do_xrstor(env, ptr, -1, 0);
+}
+#endif
+
 uint64_t helper_xgetbv(CPUX86State *env, uint32_t ecx)
 {
     /* The OS must have enabled XSAVE.  */
-- 
2.37.3


