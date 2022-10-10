Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C65FA030
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:27:00 +0200 (CEST)
Received: from localhost ([::1]:57386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtkA-0004ou-T7
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtf5-0005zk-NX
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtf3-0004dB-IT
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665411701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0O1Xfq9fIDRiDp+PL8kxL194HZlKP1v9WSPjd2eXsqM=;
 b=ixrZCYriI9rRA+9OI7IceIcXMXhntY4uoby+h6eIxjfKBVLJ8R4HPqsDCjjqh2nHj+Ta6v
 ADrhc4HRrptNySD1rCkeMxSYHxmylAlKffhvAX+UgZcoulHCbpir28ZeRg3+oWsuCSlmsV
 yfwA23muCMz52krQ7ODONhEZ08+1Lm0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-JfoDhTWLNaCtH6Wd2u1bKA-1; Mon, 10 Oct 2022 10:21:39 -0400
X-MC-Unique: JfoDhTWLNaCtH6Wd2u1bKA-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr29-20020a1709073f9d00b0078333782c48so4534516ejc.10
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0O1Xfq9fIDRiDp+PL8kxL194HZlKP1v9WSPjd2eXsqM=;
 b=HuQhH9t/8QGsXPiCD1HB7ttVog+rHH7s8Q0OIr62vGDjixWmcrTSU5Mxs6JQldSPmx
 YX4lkS+rMcIa/SnhyFqDalT7RAjx1lluOQxSPTWt9BBtvvZr4Kr14pAQCbCHjztfFAwf
 g2Mx+Ja3hP2KaxEmDqLz+k4baai2QfR5h66XT337fvJIvU3HzT2VfqjRx82ZasFiPtwx
 enDJSCbEiS0mSZv/O5tEYZc0T//8uSoHineqYUXS8WxTn9mV4yKmPb1A5WsaG0zfgZGa
 QWxRAiimTgs4r6GUBfqfBTfUwPMj8itysl059k4AFWNtvL6sMGWOqDKGUvm0zBhZefj7
 il+A==
X-Gm-Message-State: ACrzQf29qUeHLRCidRF5MqKfocAoRbBlliEEdWzJH2WRVd3D3lUBLmTh
 lYky1BjdcxXAm/J434lvnZydJlWqLKb4CjvDQ+9zw29TSCXWxHQxy9obR0FBpmMOjSXI5LuwkkK
 7cLYY7nRdbij2ZjhJ2ozrIvHqISbL+F8NyxyR41UjnniGomu9kf+STSwU+tFK03md38I=
X-Received: by 2002:a05:6402:1587:b0:458:fbea:436c with SMTP id
 c7-20020a056402158700b00458fbea436cmr18033454edv.407.1665411698100; 
 Mon, 10 Oct 2022 07:21:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pvynWJzJ99VYMuE1dvWhhuvZnPgpQ5MX97diClbOViKMVqQaLSyelfFtuqdzUbONqZcCKbQ==
X-Received: by 2002:a05:6402:1587:b0:458:fbea:436c with SMTP id
 c7-20020a056402158700b00458fbea436cmr18033408edv.407.1665411697547; 
 Mon, 10 Oct 2022 07:21:37 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 z11-20020aa7d40b000000b00458d50b4a24sm7082995edq.96.2022.10.10.07.21.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:21:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-user: i386/signal: support XSAVE/XRSTOR for signal
 frame fpstate
Date: Mon, 10 Oct 2022 16:21:27 +0200
Message-Id: <20221010142127.295676-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010142127.295676-1-pbonzini@redhat.com>
References: <20221010142127.295676-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
signal handlers.  The patch follows the Linux ABI.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 linux-user/i386/signal.c     | 115 +++++++++++++++++++++++++++++------
 target/i386/cpu.c            |   2 +-
 target/i386/cpu.h            |   3 +
 target/i386/tcg/fpu_helper.c |  64 +++++++++++--------
 4 files changed, 138 insertions(+), 46 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 53c1c05581..7dd52eb5dc 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -39,6 +39,15 @@ struct target_xmmreg {
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
@@ -51,10 +60,13 @@ struct target_fpstate_fxsave {
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
@@ -214,13 +226,39 @@ struct rt_sigframe {
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
+            + xstate_size + FP_XSTATE_MAGIC2_SIZE;
+
+        /* fxsave_addr must be 64 byte aligned for xsave */
+        assert(!(fxsave_addr & 0x3f));
+
+        /* Zero the header, XSAVE *adds* features to an existing save state.  */
+        memset(fxsave->xfeatures, 0, 64);
+        cpu_x86_xsave(env, fxsave_addr);
+        __put_user(FP_XSTATE_MAGIC1, &fxsave->sw_reserved.magic1);
+        __put_user(extended_size, &fxsave->sw_reserved.extended_size);
+        __put_user(env->xcr0, &fxsave->sw_reserved.xfeatures);
+        __put_user(xstate_size, &fxsave->sw_reserved.xstate_size);
+        __put_user(FP_XSTATE_MAGIC2, (uint32_t *) &fxsave->xfeatures[xfeatures_size]);
+    }
 }
 
 static void setup_sigcontext(struct target_sigcontext *sc,
@@ -257,8 +295,8 @@ static void setup_sigcontext(struct target_sigcontext *sc,
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
@@ -291,7 +329,7 @@ static void setup_sigcontext(struct target_sigcontext *sc,
     __put_user((uint16_t)0, &sc->fs);
     __put_user(env->segs[R_SS].selector, &sc->ss);
 
-    fxsave_sigcontext(env, fpstate, fpstate_addr);
+    xsave_sigcontext(env, fpstate, fpstate_addr);
 #endif
 
     __put_user(fpstate_addr, &sc->fpstate);
@@ -332,8 +370,12 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t fxsave_offset
 
     if (!(env->features[FEAT_1_EDX] & CPUID_FXSR)) {
         return (esp - (fxsave_offset + TARGET_FXSAVE_SIZE)) & -8ul;
-    } else {
+    } else if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
         return ((esp - TARGET_FXSAVE_SIZE) & -16ul) - fxsave_offset;
+    } else {
+        size_t xstate_size =
+               xsave_area_size(env->xcr0, false) + FP_XSTATE_MAGIC2_SIZE;
+        return ((esp - xstate_size) & -64ul) - fxsave_offset;
     }
 }
 
@@ -437,7 +479,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
@@ -491,10 +537,37 @@ give_sigsegv:
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
+        if (tswapl(fxsave->sw_reserved.magic1) == FP_XSTATE_MAGIC1 &&
+            extended_size >= TARGET_FPSTATE_FXSAVE_OFFSET + xstate_size + FP_XSTATE_MAGIC2_SIZE) {
+            if (!access_ok(env_cpu(env), VERIFY_READ, fxsave_addr,
+                           extended_size - TARGET_FPSTATE_FXSAVE_OFFSET)) {
+                return 1;
+            }
+            if (tswapl(*(uint32_t *) &fxsave->xfeatures[xfeatures_size]) == FP_XSTATE_MAGIC2) {
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
 
@@ -545,24 +618,28 @@ restore_sigcontext(CPUX86State *env, struct target_sigcontext *sc)
 
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


