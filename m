Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD75FA029
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:24:25 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohthf-000277-Bs
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtf6-0005xn-5n
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ohtf3-0004d7-3i
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665411700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzDZUS1W46+P/ZZJtbDKE4QpahPMYUtRHpGx3f4oY2s=;
 b=FSEodPuuWYh5ZVf2Faq1XYUabaOHAEk+ZIjF9o47WqFdjVzO9ssUrd1euDS5h7bllwp+le
 omgE+8TQZv2RMjy17TshaaLAFYuSJyeI6n1BkZye/Ky5VRTR/GqMFk6h6Ygw9MU2yutnm/
 O3WNuouv9lQ4kctXLnRoyO069SiQxeQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-tlNv0WAAPIKL45Z-NSFFgg-1; Mon, 10 Oct 2022 10:21:36 -0400
X-MC-Unique: tlNv0WAAPIKL45Z-NSFFgg-1
Received: by mail-ed1-f72.google.com with SMTP id
 q17-20020a056402519100b00459a2e5adbcso9100389edd.16
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzDZUS1W46+P/ZZJtbDKE4QpahPMYUtRHpGx3f4oY2s=;
 b=J1kAq3BfMxUEGMhSrF0kbl/FPPuYEQDjC4sOPFmBckNCNkHtA4M9zpenPg68rm+wbX
 ZepffAkifiUwDCxr+wM11XdZsbPgQsRzX5ylGEOj0l/c4TZO6VR4XnScIgYKJwblup6k
 OvlikRa+ti4/Zj/z5boKuji5ITRO9318bqQaQkgJLcnAZ7rIDGCfTMj+am4nM26XzXAa
 7hPYxsaYRRsjcA7QzitPjMy4OIkV4q2Sj0r6Iye6DLg0djk7qG+5wjVqtl0WUYxv41SW
 jUx55Hxn2Izz4vj08/MUiko7hbuwq0XRdQum8UnudAdxlqdTnjaOkQGBZ6XjTop0o5Pv
 m4rQ==
X-Gm-Message-State: ACrzQf1TwMWSPvsazR5FaI5/kqoVhOez7QQ7PfBueYPMNcLFlxjtL6+Z
 2exq4p+AWNPm123+UuGM1lA5YES17t2ZpNfJh/GkOu8wGkLf1Br9vG3UYjWwYcMJ+8a1s78ClNZ
 3Y5KDU715p8tP5rmDaYcjRhNl9CjbFPfxFZLL5qCdwqOiAsW9ShFejhzHob6tZl04X5w=
X-Received: by 2002:a17:906:5d0d:b0:783:10cb:2829 with SMTP id
 g13-20020a1709065d0d00b0078310cb2829mr14839811ejt.209.1665411695401; 
 Mon, 10 Oct 2022 07:21:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KCZX6aQ4m69mVI9yPWjBjkIInBdpDWnJjypurjRM92SKhJjsa81ovQPGpygd2W7TRyfFMcA==
X-Received: by 2002:a17:906:5d0d:b0:783:10cb:2829 with SMTP id
 g13-20020a1709065d0d00b0078310cb2829mr14839788ejt.209.1665411694899; 
 Mon, 10 Oct 2022 07:21:34 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a17090630d400b0077f20a722dfsm5435230ejb.165.2022.10.10.07.21.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:21:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user: i386/signal: support FXSAVE fpstate on 32-bit
 emulation
Date: Mon, 10 Oct 2022 16:21:26 +0200
Message-Id: <20221010142127.295676-3-pbonzini@redhat.com>
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

Linux can use FXSAVE to save/restore XMM registers even on 32-bit
systems.  This requires some care in order to keep the FXSAVE area
aligned to 16 bytes; for this reason, get_sigframe is changed to
pass the offset into the FXSAVE area rather than the full frame
size.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 linux-user/i386/signal.c | 129 +++++++++++++++++++++++----------------
 1 file changed, 77 insertions(+), 52 deletions(-)

diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 76317a3d16..53c1c05581 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -39,29 +39,7 @@ struct target_xmmreg {
     uint32_t element[4];
 };
 
-struct target_fpstate_32 {
-    /* Regular FPU environment */
-    uint32_t cw;
-    uint32_t sw;
-    uint32_t tag;
-    uint32_t ipoff;
-    uint32_t cssel;
-    uint32_t dataoff;
-    uint32_t datasel;
-    struct target_fpreg st[8];
-    uint16_t  status;
-    uint16_t  magic;          /* 0xffff = regular FPU data only */
-
-    /* FXSR FPU environment */
-    uint32_t _fxsr_env[6];   /* FXSR FPU env is ignored */
-    uint32_t mxcsr;
-    uint32_t reserved;
-    struct target_fpxreg fxsr_st[8]; /* FXSR FPU reg data is ignored */
-    struct target_xmmreg xmm[8];
-    uint32_t padding[56];
-};
-
-struct target_fpstate_64 {
+struct target_fpstate_fxsave {
     /* FXSAVE format */
     uint16_t cw;
     uint16_t sw;
@@ -75,11 +53,36 @@ struct target_fpstate_64 {
     uint32_t xmm_space[64];
     uint32_t reserved[24];
 };
+#define TARGET_FXSAVE_SIZE   sizeof(struct target_fpstate_fxsave)
+QEMU_BUILD_BUG_ON(TARGET_FXSAVE_SIZE != 512);
+
+struct target_fpstate_32 {
+    /* Regular FPU environment */
+    uint32_t cw;
+    uint32_t sw;
+    uint32_t tag;
+    uint32_t ipoff;
+    uint32_t cssel;
+    uint32_t dataoff;
+    uint32_t datasel;
+    struct target_fpreg st[8];
+    uint16_t  status;
+    uint16_t  magic;          /* 0xffff = regular FPU data only */
+    struct target_fpstate_fxsave fxsave;
+};
+
+/*
+ * For simplicity, setup_frame aligns struct target_fpstate_32 to
+ * 16 bytes, so ensure that the FXSAVE area is also aligned.
+ */
+QEMU_BUILD_BUG_ON(offsetof(struct target_fpstate_32, fxsave) & 15);
 
 #ifndef TARGET_X86_64
 # define target_fpstate target_fpstate_32
+# define TARGET_FPSTATE_FXSAVE_OFFSET offsetof(struct target_fpstate_32, fxsave)
 #else
-# define target_fpstate target_fpstate_64
+# define target_fpstate target_fpstate_fxsave
+# define TARGET_FPSTATE_FXSAVE_OFFSET 0
 #endif
 
 struct target_sigcontext_32 {
@@ -172,8 +175,16 @@ struct sigframe {
     struct target_fpstate fpstate_unused;
     abi_ulong extramask[TARGET_NSIG_WORDS-1];
     char retcode[8];
-    struct target_fpstate fpstate;
+
+    /*
+     * This field must be 16-byte aligned in memory.  Applying QEMU_ALIGNED
+     * to it ensures that the base of the frame has an appropriate alignment
+     * too.
+     */
+    struct target_fpstate fpstate QEMU_ALIGNED(8);
 };
+#define TARGET_SIGFRAME_FXSAVE_OFFSET (                                    \
+    offsetof(struct sigframe, fpstate) + TARGET_FPSTATE_FXSAVE_OFFSET)
 
 struct rt_sigframe {
     abi_ulong pretcode;
@@ -183,25 +194,35 @@ struct rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
     char retcode[8];
-    struct target_fpstate fpstate;
+    struct target_fpstate fpstate QEMU_ALIGNED(8);
 };
-
+#define TARGET_RT_SIGFRAME_FXSAVE_OFFSET (                                 \
+    offsetof(struct rt_sigframe, fpstate) + TARGET_FPSTATE_FXSAVE_OFFSET)
 #else
 
 struct rt_sigframe {
     abi_ulong pretcode;
     struct target_ucontext uc;
     struct target_siginfo info;
-    struct target_fpstate fpstate;
+    struct target_fpstate fpstate QEMU_ALIGNED(16);
 };
-
+#define TARGET_RT_SIGFRAME_FXSAVE_OFFSET (                                 \
+    offsetof(struct rt_sigframe, fpstate) + TARGET_FPSTATE_FXSAVE_OFFSET)
 #endif
 
 /*
  * Set up a signal frame.
  */
 
-/* XXX: save x87 state */
+static void fxsave_sigcontext(CPUX86State *env, struct target_fpstate_fxsave *fxsave,
+                              abi_ulong fxsave_addr)
+{
+    /* fxsave_addr must be 16 byte aligned for fxsave */
+    assert(!(fxsave_addr & 0xf));
+
+    cpu_x86_fxsave(env, fxsave_addr);
+}
+
 static void setup_sigcontext(struct target_sigcontext *sc,
         struct target_fpstate *fpstate, CPUX86State *env, abi_ulong mask,
         abi_ulong fpstate_addr)
@@ -233,13 +254,14 @@ static void setup_sigcontext(struct target_sigcontext *sc,
 
     cpu_x86_fsave(env, fpstate_addr, 1);
     fpstate->status = fpstate->sw;
-    magic = 0xffff;
+    if (!(env->features[FEAT_1_EDX] & CPUID_FXSR)) {
+        magic = 0xffff;
+    } else {
+        fxsave_sigcontext(env, &fpstate->fxsave,
+                          fpstate_addr + TARGET_FPSTATE_FXSAVE_OFFSET);
+        magic = 0;
+    }
     __put_user(magic, &fpstate->magic);
-    __put_user(fpstate_addr, &sc->fpstate);
-
-    /* non-iBCS2 extensions.. */
-    __put_user(mask, &sc->oldmask);
-    __put_user(env->cr[2], &sc->cr2);
 #else
     __put_user(env->regs[R_EDI], &sc->rdi);
     __put_user(env->regs[R_ESI], &sc->rsi);
@@ -269,15 +291,14 @@ static void setup_sigcontext(struct target_sigcontext *sc,
     __put_user((uint16_t)0, &sc->fs);
     __put_user(env->segs[R_SS].selector, &sc->ss);
 
+    fxsave_sigcontext(env, fpstate, fpstate_addr);
+#endif
+
+    __put_user(fpstate_addr, &sc->fpstate);
+
+    /* non-iBCS2 extensions.. */
     __put_user(mask, &sc->oldmask);
     __put_user(env->cr[2], &sc->cr2);
-
-    /* fpstate_addr must be 16 byte aligned for fxsave */
-    assert(!(fpstate_addr & 0xf));
-
-    cpu_x86_fxsave(env, fpstate_addr);
-    __put_user(fpstate_addr, &sc->fpstate);
-#endif
 }
 
 /*
@@ -285,7 +306,7 @@ static void setup_sigcontext(struct target_sigcontext *sc,
  */
 
 static inline abi_ulong
-get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t frame_size)
+get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t fxsave_offset)
 {
     unsigned long esp;
 
@@ -309,11 +330,11 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t frame_size)
 #endif
     }
 
-#ifndef TARGET_X86_64
-    return (esp - frame_size) & -8ul;
-#else
-    return ((esp - frame_size) & (~15ul)) - 8;
-#endif
+    if (!(env->features[FEAT_1_EDX] & CPUID_FXSR)) {
+        return (esp - (fxsave_offset + TARGET_FXSAVE_SIZE)) & -8ul;
+    } else {
+        return ((esp - TARGET_FXSAVE_SIZE) & -16ul) - fxsave_offset;
+    }
 }
 
 #ifndef TARGET_X86_64
@@ -341,7 +362,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     struct sigframe *frame;
     int i;
 
-    frame_addr = get_sigframe(ka, env, sizeof(*frame));
+    frame_addr = get_sigframe(ka, env, TARGET_SIGFRAME_FXSAVE_OFFSET);
     trace_user_setup_frame(env, frame_addr);
 
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0))
@@ -397,7 +418,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     struct rt_sigframe *frame;
     int i;
 
-    frame_addr = get_sigframe(ka, env, sizeof(*frame));
+    frame_addr = get_sigframe(ka, env, TARGET_RT_SIGFRAME_FXSAVE_OFFSET);
     trace_user_setup_rt_frame(env, frame_addr);
 
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0))
@@ -529,7 +550,11 @@ restore_sigcontext(CPUX86State *env, struct target_sigcontext *sc)
             goto badframe;
         }
 #ifndef TARGET_X86_64
-        cpu_x86_frstor(env, fpstate_addr, 1);
+        if (!(env->features[FEAT_1_EDX] & CPUID_FXSR)) {
+            cpu_x86_frstor(env, fpstate_addr, 1);
+        } else {
+            cpu_x86_fxrstor(env, fpstate_addr + TARGET_FPSTATE_FXSAVE_OFFSET);
+        }
 #else
         cpu_x86_fxrstor(env, fpstate_addr);
 #endif
-- 
2.37.3


