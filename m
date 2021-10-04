Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AA4206D5
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:52:25 +0200 (CEST)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIls-0003Uz-VI
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeM-00049R-Pq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:38 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeJ-0004oh-7E
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:38 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M3mHT-1mX1nW0uwN-000vlz; Mon, 04
 Oct 2021 09:44:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] linux-user/arm: Drop v1 signal frames
Date: Mon,  4 Oct 2021 09:43:58 +0200
Message-Id: <20211004074421.3141222-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Jjy1kR7GKaMakXoNP65v09xvEXc663oIV0YmRCVH06ZBoFthymT
 g9NgX0m+rG3pk86iPJM7cXhVRRW5ysTNFFn0kRfELDWVgXlQefzLAc/+9U2RwZCCbmn2Ucy
 kGRE0Kqxj3H4NgxCP6x1sT6rHz7NMPixPyEN2OM/5ivLAS5zsNsxzFUJVWKNpeFQvUyJvjy
 rcP1ZP/5Gi94XJ1B2qiTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A7XtHWZLtwA=:hSA/2m0+116f+MdzgSqbZZ
 YCh3y/zpEfvVb6qpjCyz8ucsDkMe8um4jzWCmKTY+bh39QWm1cjVDaesZV4ZiyMtr4zHJyQDw
 /LGPeZ6wwGTxWY1MqluTR2yBbtV668fUOcrkwOAPr2xf/4BN0jItakiVJBiHfheI6/fi2rD1A
 Kldf+k9br3rm3tig+1H0JLyuT6Ty2N/EHlOd3WLs2MhZ2nFwH+3pUUafaL2pfiLhvRQuwYXTB
 GG5qYKHxPn646AvFor0XBVkuggeZE+x8SUzimc/ZolByfqfeG73BspKCOSwMDw6kwpecTWHD6
 95grP/fNH7v7rzPoU+WpBALEsUz1TVmurwE3zK70oMVz34T3JrPkJCqDdp3rvvJ9Oxdg8kANy
 6iua14WNwJZC6kfL8fSQhLlXaT62EdpuABN1HEm1g7cswswXxEVUsGVg3SXiCeUOInqvO0YfQ
 tDyhVikUDUN5sqcRkbBKWx6cNF1aPUkeqyp/ztwj40BjcGDbwIhEVJjne4tIX2pJlJUTNAAmT
 EhBSd82Zjq7DfbTXS5s0jsludHm0+2nANYvoVDfN71KpiKoSZDHMP5a4lNbG7Mdgmf5z87MFR
 43VyAFIwLTy9svKoY9XSxcjDmc7VY9o3meQtQWJLOHIoIn0wBwcdtliLk4+8K3vMrSe3ikb7D
 Td+ttpeVgngjDMYcSuag4r1yAXuG/SqcMV4HV6hpAfaVA90xYhK8tM5FhQDO2BoRA3qen5yP+
 2uzoEt/YuG7H1Y2xqfsj5SWJA1bMETm4YhRn+Q==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Version 2 signal frames are used from 2.6.12 and since cbc14e6f286,
we have set UNAME_MINIMUM_RELEASE to 2.6.32.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/signal.c | 220 +---------------------------------------
 1 file changed, 4 insertions(+), 216 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index ed144f9455d2..d0940bab479c 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -46,14 +46,6 @@ struct target_sigcontext {
     abi_ulong fault_address;
 };
 
-struct target_ucontext_v1 {
-    abi_ulong tuc_flags;
-    abi_ulong tuc_link;
-    target_stack_t tuc_stack;
-    struct target_sigcontext tuc_mcontext;
-    target_sigset_t  tuc_sigmask;       /* mask last for extensibility */
-};
-
 struct target_ucontext_v2 {
     abi_ulong tuc_flags;
     abi_ulong tuc_link;
@@ -98,28 +90,12 @@ struct target_iwmmxt_sigframe {
 #define TARGET_VFP_MAGIC 0x56465001
 #define TARGET_IWMMXT_MAGIC 0x12ef842a
 
-struct sigframe_v1
-{
-    struct target_sigcontext sc;
-    abi_ulong extramask[TARGET_NSIG_WORDS-1];
-    abi_ulong retcode[4];
-};
-
 struct sigframe_v2
 {
     struct target_ucontext_v2 uc;
     abi_ulong retcode[4];
 };
 
-struct rt_sigframe_v1
-{
-    abi_ulong pinfo;
-    abi_ulong puc;
-    struct target_siginfo info;
-    struct target_ucontext_v1 uc;
-    abi_ulong retcode[4];
-};
-
 struct rt_sigframe_v2
 {
     struct target_siginfo info;
@@ -363,37 +339,6 @@ static void setup_sigframe_v2(struct target_ucontext_v2 *uc,
     }
 }
 
-/* compare linux/arch/arm/kernel/signal.c:setup_frame() */
-static void setup_frame_v1(int usig, struct target_sigaction *ka,
-                           target_sigset_t *set, CPUARMState *regs)
-{
-    struct sigframe_v1 *frame;
-    abi_ulong frame_addr = get_sigframe(ka, regs, sizeof(*frame));
-    int i;
-
-    trace_user_setup_frame(regs, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto sigsegv;
-    }
-
-    setup_sigcontext(&frame->sc, regs, set->sig[0]);
-
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
-        __put_user(set->sig[i], &frame->extramask[i - 1]);
-    }
-
-    if (setup_return(regs, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct sigframe_v1, retcode))) {
-        goto sigsegv;
-    }
-
-    unlock_user_struct(frame, frame_addr, 1);
-    return;
-sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
-    force_sigsegv(usig);
-}
-
 static void setup_frame_v2(int usig, struct target_sigaction *ka,
                            target_sigset_t *set, CPUARMState *regs)
 {
@@ -422,60 +367,7 @@ sigsegv:
 void setup_frame(int usig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUARMState *regs)
 {
-    if (get_osversion() >= 0x020612) {
-        setup_frame_v2(usig, ka, set, regs);
-    } else {
-        setup_frame_v1(usig, ka, set, regs);
-    }
-}
-
-/* compare linux/arch/arm/kernel/signal.c:setup_rt_frame() */
-static void setup_rt_frame_v1(int usig, struct target_sigaction *ka,
-                              target_siginfo_t *info,
-                              target_sigset_t *set, CPUARMState *env)
-{
-    struct rt_sigframe_v1 *frame;
-    abi_ulong frame_addr = get_sigframe(ka, env, sizeof(*frame));
-    struct target_sigaltstack stack;
-    int i;
-    abi_ulong info_addr, uc_addr;
-
-    trace_user_setup_rt_frame(env, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-        goto sigsegv;
-    }
-
-    info_addr = frame_addr + offsetof(struct rt_sigframe_v1, info);
-    __put_user(info_addr, &frame->pinfo);
-    uc_addr = frame_addr + offsetof(struct rt_sigframe_v1, uc);
-    __put_user(uc_addr, &frame->puc);
-    tswap_siginfo(&frame->info, info);
-
-    /* Clear all the bits of the ucontext we don't use.  */
-    memset(&frame->uc, 0, offsetof(struct target_ucontext_v1, tuc_mcontext));
-
-    memset(&stack, 0, sizeof(stack));
-    target_save_altstack(&stack, env);
-    memcpy(&frame->uc.tuc_stack, &stack, sizeof(stack));
-
-    setup_sigcontext(&frame->uc.tuc_mcontext, env, set->sig[0]);
-    for(i = 0; i < TARGET_NSIG_WORDS; i++) {
-        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
-    }
-
-    if (setup_return(env, ka, frame->retcode, frame_addr, usig,
-                     frame_addr + offsetof(struct rt_sigframe_v1, retcode))) {
-        goto sigsegv;
-    }
-
-    env->regs[1] = info_addr;
-    env->regs[2] = uc_addr;
-
-    unlock_user_struct(frame, frame_addr, 1);
-    return;
-sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
-    force_sigsegv(usig);
+    setup_frame_v2(usig, ka, set, regs);
 }
 
 static void setup_rt_frame_v2(int usig, struct target_sigaction *ka,
@@ -516,11 +408,7 @@ void setup_rt_frame(int usig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        setup_rt_frame_v2(usig, ka, info, set, env);
-    } else {
-        setup_rt_frame_v1(usig, ka, info, set, env);
-    }
+    setup_rt_frame_v2(usig, ka, info, set, env);
 }
 
 static int
@@ -553,54 +441,6 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     return err;
 }
 
-static long do_sigreturn_v1(CPUARMState *env)
-{
-    abi_ulong frame_addr;
-    struct sigframe_v1 *frame = NULL;
-    target_sigset_t set;
-    sigset_t host_set;
-    int i;
-
-    /*
-     * Since we stacked the signal on a 64-bit boundary,
-     * then 'sp' should be word aligned here.  If it's
-     * not, then the user is trying to mess with us.
-     */
-    frame_addr = env->regs[13];
-    trace_user_do_sigreturn(env, frame_addr);
-    if (frame_addr & 7) {
-        goto badframe;
-    }
-
-    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
-    }
-
-    __get_user(set.sig[0], &frame->sc.oldmask);
-    for(i = 1; i < TARGET_NSIG_WORDS; i++) {
-        __get_user(set.sig[i], &frame->extramask[i - 1]);
-    }
-
-    target_to_host_sigset_internal(&host_set, &set);
-    set_sigmask(&host_set);
-
-    if (restore_sigcontext(env, &frame->sc)) {
-        goto badframe;
-    }
-
-#if 0
-    /* Send SIGTRAP if we're single-stepping */
-    if (ptrace_cancel_bpt(current))
-        send_sig(SIGTRAP, current, 1);
-#endif
-    unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
-}
-
 static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
 {
     int i;
@@ -733,55 +573,7 @@ badframe:
 
 long do_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        return do_sigreturn_v2(env);
-    } else {
-        return do_sigreturn_v1(env);
-    }
-}
-
-static long do_rt_sigreturn_v1(CPUARMState *env)
-{
-    abi_ulong frame_addr;
-    struct rt_sigframe_v1 *frame = NULL;
-    sigset_t host_set;
-
-    /*
-     * Since we stacked the signal on a 64-bit boundary,
-     * then 'sp' should be word aligned here.  If it's
-     * not, then the user is trying to mess with us.
-     */
-    frame_addr = env->regs[13];
-    trace_user_do_rt_sigreturn(env, frame_addr);
-    if (frame_addr & 7) {
-        goto badframe;
-    }
-
-    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
-        goto badframe;
-    }
-
-    target_to_host_sigset(&host_set, &frame->uc.tuc_sigmask);
-    set_sigmask(&host_set);
-
-    if (restore_sigcontext(env, &frame->uc.tuc_mcontext)) {
-        goto badframe;
-    }
-
-    target_restore_altstack(&frame->uc.tuc_stack, env);
-
-#if 0
-    /* Send SIGTRAP if we're single-stepping */
-    if (ptrace_cancel_bpt(current))
-        send_sig(SIGTRAP, current, 1);
-#endif
-    unlock_user_struct(frame, frame_addr, 0);
-    return -TARGET_QEMU_ESIGRETURN;
-
-badframe:
-    unlock_user_struct(frame, frame_addr, 0);
-    force_sig(TARGET_SIGSEGV);
-    return -TARGET_QEMU_ESIGRETURN;
+    return do_sigreturn_v2(env);
 }
 
 static long do_rt_sigreturn_v2(CPUARMState *env)
@@ -822,9 +614,5 @@ badframe:
 
 long do_rt_sigreturn(CPUARMState *env)
 {
-    if (get_osversion() >= 0x020612) {
-        return do_rt_sigreturn_v2(env);
-    } else {
-        return do_rt_sigreturn_v1(env);
-    }
+    return do_rt_sigreturn_v2(env);
 }
-- 
2.31.1


