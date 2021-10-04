Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D714206EB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:00:38 +0200 (CEST)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXItp-0007mv-CS
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeO-0004Cl-0D
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:40 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeK-0004pp-Jl
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:39 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MbTCr-1n4RbU3kj3-00bvDd; Mon, 04
 Oct 2021 09:44:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/26] linux-user/arm: Drop "_v2" from symbols in signal.c
Date: Mon,  4 Oct 2021 09:43:59 +0200
Message-Id: <20211004074421.3141222-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ftPMbVF9cQjNs4HTRnOplBPNQXMkSWgTHlt6TYrmpzw7t6keMzi
 LQKs1q0xJ9QZlNxgPtL6ZvnuUN0ctcrfAhh13uXuT4TlgKMEZJ34WuabeCab3EqnJyMwMSp
 N7C8LlD1lcybcS5sAGHEodZlwmwIWzzSHyK5ATwjCwXX0X2ytccaI8c9XXqR1Qx4M090I7m
 /oJuyRLQlKQnQNxamscWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fzrn2R16ljs=:hc+mD4NWEvctGvX7sQ231w
 Kpi1PnKU27u4yV5jIwDwhnRmqvaCRiwS/DfS5J6hVC6KDTjM2KfP8tSE729Se4SqqJceU5MEG
 g5wblxtd4rN7YCGJzTPQgH6rrzdPUVP77s1NR08rgfBJAq+ZhsGIBqpUBHlLSklYztTvluhR0
 VlQVPgDq0IbZHHSxQRpmIHtij8vyCltJVbCBKH1Vbf6dttVZSscjVfFhh/swXz4rcTBjXQWDi
 3U0uM3iwA596X/2Vn68kCIndR/zq5CcF+QeDjoH/A5bFuf03ocHkd7aSp8sooDIotyhB2eIR5
 LM/5e/m/Of1XsKeNeTMnUzUjF61BCth1abPjUM+IanAhzkdFghSWS3xZbLRlGB/1KrSwcsn+u
 xr4T3jd00I2BJgTlJSTuEyVUoJDvVooPTAmuFr7kizg1WR1LYLeZAgRdBnyuIRPKRu4wSBcEM
 69YgbEUkSgOPzxOZVmknRzQGvMFTZ5gj/GUEm5tw3fJN3hyND8F9/ksV30NKhJu74g8KMbrNZ
 S1DKgR+cirg4XyUryJY06eeDI5Bvonl6rhwhUSJzdO4OSbH8z7P/d9nxp7f03hMRZNgKNm6R+
 ja4oXPbtb4DrELncGIoyt2WA/Qz4xld70VZa/1fqtQcYbIw1cNsnoZ54JB2QjnPzpxfmMMs2Y
 GTYMUE7bWMVkdWI6hJU0F6EoUHtZuc69i5KwGAXIvDU2DS/oyLLVyqZ6XOn3KWjNMa67eJpuc
 Wif7hn98cLMyGHalFnGFGYr+uGhH8o22FeUMvA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Since we no longer support "v1", there's no need to distinguish "v2".

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/signal.c | 115 ++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 70 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index d0940bab479c..ed7d1d80bb9c 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -46,7 +46,7 @@ struct target_sigcontext {
     abi_ulong fault_address;
 };
 
-struct target_ucontext_v2 {
+struct target_ucontext {
     abi_ulong tuc_flags;
     abi_ulong tuc_link;
     target_stack_t tuc_stack;
@@ -90,16 +90,16 @@ struct target_iwmmxt_sigframe {
 #define TARGET_VFP_MAGIC 0x56465001
 #define TARGET_IWMMXT_MAGIC 0x12ef842a
 
-struct sigframe_v2
+struct sigframe
 {
-    struct target_ucontext_v2 uc;
+    struct target_ucontext uc;
     abi_ulong retcode[4];
 };
 
-struct rt_sigframe_v2
+struct rt_sigframe
 {
     struct target_siginfo info;
-    struct target_ucontext_v2 uc;
+    struct target_ucontext uc;
     abi_ulong retcode[4];
 };
 
@@ -270,7 +270,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
     return 0;
 }
 
-static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
+static abi_ulong *setup_sigframe_vfp(abi_ulong *regspace, CPUARMState *env)
 {
     int i;
     struct target_vfp_sigframe *vfpframe;
@@ -287,8 +287,7 @@ static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
     return (abi_ulong*)(vfpframe+1);
 }
 
-static abi_ulong *setup_sigframe_v2_iwmmxt(abi_ulong *regspace,
-                                           CPUARMState *env)
+static abi_ulong *setup_sigframe_iwmmxt(abi_ulong *regspace, CPUARMState *env)
 {
     int i;
     struct target_iwmmxt_sigframe *iwmmxtframe;
@@ -307,15 +306,15 @@ static abi_ulong *setup_sigframe_v2_iwmmxt(abi_ulong *regspace,
     return (abi_ulong*)(iwmmxtframe+1);
 }
 
-static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
-                              target_sigset_t *set, CPUARMState *env)
+static void setup_sigframe(struct target_ucontext *uc,
+                           target_sigset_t *set, CPUARMState *env)
 {
     struct target_sigaltstack stack;
     int i;
     abi_ulong *regspace;
 
     /* Clear all the bits of the ucontext we don't use.  */
-    memset(uc, 0, offsetof(struct target_ucontext_v2, tuc_mcontext));
+    memset(uc, 0, offsetof(struct target_ucontext, tuc_mcontext));
 
     memset(&stack, 0, sizeof(stack));
     target_save_altstack(&stack, env);
@@ -325,10 +324,10 @@ static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
     /* Save coprocessor signal frame.  */
     regspace = uc->tuc_regspace;
     if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
-        regspace = setup_sigframe_v2_vfp(regspace, env);
+        regspace = setup_sigframe_vfp(regspace, env);
     }
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        regspace = setup_sigframe_v2_iwmmxt(regspace, env);
+        regspace = setup_sigframe_iwmmxt(regspace, env);
     }
 
     /* Write terminating magic word */
@@ -339,10 +338,10 @@ static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
     }
 }
 
-static void setup_frame_v2(int usig, struct target_sigaction *ka,
-                           target_sigset_t *set, CPUARMState *regs)
+void setup_frame(int usig, struct target_sigaction *ka,
+                 target_sigset_t *set, CPUARMState *regs)
 {
-    struct sigframe_v2 *frame;
+    struct sigframe *frame;
     abi_ulong frame_addr = get_sigframe(ka, regs, sizeof(*frame));
 
     trace_user_setup_frame(regs, frame_addr);
@@ -350,10 +349,10 @@ static void setup_frame_v2(int usig, struct target_sigaction *ka,
         goto sigsegv;
     }
 
-    setup_sigframe_v2(&frame->uc, set, regs);
+    setup_sigframe(&frame->uc, set, regs);
 
     if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v2, retcode))) {
+                     frame_addr + offsetof(struct sigframe, retcode))) {
         goto sigsegv;
     }
 
@@ -364,17 +363,11 @@ sigsegv:
     force_sigsegv(usig);
 }
 
-void setup_frame(int usig, struct target_sigaction *ka,
-                 target_sigset_t *set, CPUARMState *regs)
-{
-    setup_frame_v2(usig, ka, set, regs);
-}
-
-static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
-                              target_siginfo_t *info,
-                              target_sigset_t *set, CPUARMState *env)
+void setup_rt_frame(int usig, struct target_sigaction *ka,
+                    target_siginfo_t *info,
+                    target_sigset_t *set, CPUARMState *env)
 {
-    struct rt_sigframe_v2 *frame;
+    struct rt_sigframe *frame;
     abi_ulong frame_addr = get_sigframe(ka, env, sizeof(*frame));
     abi_ulong info_addr, uc_addr;
 
@@ -383,14 +376,14 @@ static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
         goto sigsegv;
     }
 
-    info_addr = frame_addr + offsetof(struct rt_sigframe_v2, info);
-    uc_addr = frame_addr + offsetof(struct rt_sigframe_v2, uc);
+    info_addr = frame_addr + offsetof(struct rt_sigframe, info);
+    uc_addr = frame_addr + offsetof(struct rt_sigframe, uc);
     tswap_siginfo(&frame->info, info);
 
-    setup_sigframe_v2(&frame->uc, set, env);
+    setup_sigframe(&frame->uc, set, env);
 
     if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v2, retcode))) {
+                     frame_addr + offsetof(struct rt_sigframe, retcode))) {
         goto sigsegv;
     }
 
@@ -404,13 +397,6 @@ sigsegv:
     force_sigsegv(usig);
 }
 
-void setup_rt_frame(int usig, struct target_sigaction *ka,
-                    target_siginfo_t *info,
-                    target_sigset_t *set, CPUARMState *env)
-{
-    setup_rt_frame_v2(usig, ka, info, set, env);
-}
-
 static int
 restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
 {
@@ -441,7 +427,7 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     return err;
 }
 
-static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
+static abi_ulong *restore_sigframe_vfp(CPUARMState *env, abi_ulong *regspace)
 {
     int i;
     abi_ulong magic, sz;
@@ -471,8 +457,8 @@ static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
     return (abi_ulong*)(vfpframe + 1);
 }
 
-static abi_ulong *restore_sigframe_v2_iwmmxt(CPUARMState *env,
-                                             abi_ulong *regspace)
+static abi_ulong *restore_sigframe_iwmmxt(CPUARMState *env,
+                                          abi_ulong *regspace)
 {
     int i;
     abi_ulong magic, sz;
@@ -496,9 +482,9 @@ static abi_ulong *restore_sigframe_v2_iwmmxt(CPUARMState *env,
     return (abi_ulong*)(iwmmxtframe + 1);
 }
 
-static int do_sigframe_return_v2(CPUARMState *env,
-                                 target_ulong context_addr,
-                                 struct target_ucontext_v2 *uc)
+static int do_sigframe_return(CPUARMState *env,
+                              target_ulong context_addr,
+                              struct target_ucontext *uc)
 {
     sigset_t host_set;
     abi_ulong *regspace;
@@ -506,19 +492,20 @@ static int do_sigframe_return_v2(CPUARMState *env,
     target_to_host_sigset(&host_set, &uc->tuc_sigmask);
     set_sigmask(&host_set);
 
-    if (restore_sigcontext(env, &uc->tuc_mcontext))
+    if (restore_sigcontext(env, &uc->tuc_mcontext)) {
         return 1;
+    }
 
     /* Restore coprocessor signal frame */
     regspace = uc->tuc_regspace;
     if (cpu_isar_feature(aa32_vfp_simd, env_archcpu(env))) {
-        regspace = restore_sigframe_v2_vfp(env, regspace);
+        regspace = restore_sigframe_vfp(env, regspace);
         if (!regspace) {
             return 1;
         }
     }
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
-        regspace = restore_sigframe_v2_iwmmxt(env, regspace);
+        regspace = restore_sigframe_iwmmxt(env, regspace);
         if (!regspace) {
             return 1;
         }
@@ -535,10 +522,10 @@ static int do_sigframe_return_v2(CPUARMState *env,
     return 0;
 }
 
-static long do_sigreturn_v2(CPUARMState *env)
+long do_sigreturn(CPUARMState *env)
 {
     abi_ulong frame_addr;
-    struct sigframe_v2 *frame = NULL;
+    struct sigframe *frame = NULL;
 
     /*
      * Since we stacked the signal on a 64-bit boundary,
@@ -555,10 +542,9 @@ static long do_sigreturn_v2(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigframe_return_v2(env,
-                              frame_addr
-                              + offsetof(struct sigframe_v2, uc),
-                              &frame->uc)) {
+    if (do_sigframe_return(env,
+                           frame_addr + offsetof(struct sigframe, uc),
+                           &frame->uc)) {
         goto badframe;
     }
 
@@ -571,15 +557,10 @@ badframe:
     return -TARGET_QEMU_ESIGRETURN;
 }
 
-long do_sigreturn(CPUARMState *env)
-{
-    return do_sigreturn_v2(env);
-}
-
-static long do_rt_sigreturn_v2(CPUARMState *env)
+long do_rt_sigreturn(CPUARMState *env)
 {
     abi_ulong frame_addr;
-    struct rt_sigframe_v2 *frame = NULL;
+    struct rt_sigframe *frame = NULL;
 
     /*
      * Since we stacked the signal on a 64-bit boundary,
@@ -596,10 +577,9 @@ static long do_rt_sigreturn_v2(CPUARMState *env)
         goto badframe;
     }
 
-    if (do_sigframe_return_v2(env,
-                              frame_addr
-                              + offsetof(struct rt_sigframe_v2, uc),
-                              &frame->uc)) {
+    if (do_sigframe_return(env,
+                           frame_addr + offsetof(struct rt_sigframe, uc),
+                           &frame->uc)) {
         goto badframe;
     }
 
@@ -611,8 +591,3 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
-
-long do_rt_sigreturn(CPUARMState *env)
-{
-    return do_rt_sigreturn_v2(env);
-}
-- 
2.31.1


