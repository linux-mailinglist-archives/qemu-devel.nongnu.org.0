Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4201844EA6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 23:42:23 +0200 (CEST)
Received: from localhost ([::1]:45854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbXUD-0006c9-PN
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 17:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50481)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hbXJP-00068x-Pw
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hbXJN-0001bB-7B
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:31:11 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:48471)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hbXJM-0001UE-8d
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:31:08 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPoPd-1hxDBr0VJz-00MpBq; Thu, 13 Jun 2019 23:31:04 +0200
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190519201953.20161-1-richard.henderson@linaro.org>
 <20190519201953.20161-8-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <40056d18-21b2-99f0-e273-747537a1bf44@vivier.eu>
Date: Thu, 13 Jun 2019 23:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190519201953.20161-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3YtjdkPLOAuL2VNsQp5smfMAALNUpgPKpAUgENXZC94niJ+joRN
 zaNNvbmTaiGaooTIejRW50Wahy2kyXjYTA7+bJnbBTFyo9Wc8iT2BlF/ocpuLpJK3C8L+eN
 l2mDcD77uEiCjbthdK5VDzHUcRX7eHh/LyMsq9x8p0S97muqZlA0SK2j/ExD2GxjNoW+8fe
 MqOdkiVQftBGBKkSV2zJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eZL0ibZVedQ=:1ug4gzxwM0TpOlL6N3bhe0
 glAzDieWWpvj3ei7FSaJoP8HIU87HArZFkeqVqA+HiJ286Apu323ogjWdFXZZQIFszcPEXMHm
 bh04y7omiKXMTWUo33jq84zN6aWye/WbheyOYJRCHMJMfjv+YXJ9Zfb0JNEUltYQwt1oMw0zl
 ZUHaSLE6kGqW1QNYGBKNkCOLwpaow2mX6nx3Q+2HQxulc+2387dO9B4xMjbnyPjVdAQZtPGkq
 3D8Y3+yvbI9kxOYT1Ue2VXE/8v73sSF7ThG9dX3syt9Rw7m/R+FfNpQuHZDaml9DWlR0iOWme
 Gz0DoaB6DHtSnnCoQCTu85g1VImAEZwO27IclxvTXS7Y86+w1Y48pe9L1urgSa2VFtZDxbV+s
 f/PPPGDwA9pYdHA9ApDO6tIzGP9kIeyyt3thj/hRB5sgjCVQcjuop9XRqSX4vq1Ew0qa1WOF4
 nH95NmWR+VPVTzoqhKxix80RxpHyZDclZKjuQMC7+Xb9OKswD1Hl9waYoE3AnbPZOKKLSLiKT
 pW8qG/8b5ZZ7tfmdsnbRWIzhoSPk/iovOVSBQSppnoWz0srU15zmT7AUbingXB3rdJ4fBzrht
 8S+/NEF+zN/pKTK+ZVh4oczfB+AIMge47FWjHnVN7TvRV41Yvg/qZ8c2jfdBuQ6OqaiXR2m7s
 knLArDUC+t97bv+t1TMgqa79z+3SgrOaJvYBRqxpptAge7O4kSSCIDCia53oZ9SGzCmodob9r
 Cia/ZfJCCkuAoOr+rNLSDXoENIHQDV3OH8+i8Mr7emVnHlNMm5PYXmSL4Do=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-devel] [PATCH 07/13] linux-user/sparc: Use WREG constants
 in sparc/signal.c
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/05/2019 à 22:19, Richard Henderson a écrit :
> Remove the incorrectly defined UREG constants.
> 
> Maddeningly, in some cases we used the correct constant getting
> the env register wrong, and in other cases we used the incorrect
> constant getting the env register right.
> 
> In the case of getcontext/setcontext, we are aided by the fact
> that the "other" constant, e.g. SPARC_MC_O0, is correct.  So we
> can easily guess that the WREG_* constant on the other side
> should also be O0.

For readability, I'd like you split this patch in two:
- one with no behavior change, only with s/UREG_/WREG_/
- one using the correct constants

Thanks,
Laurent

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sparc/signal.c | 96 +++++++++++++--------------------------
>  1 file changed, 32 insertions(+), 64 deletions(-)
> 
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index ead169fbaa..243f237528 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -104,20 +104,6 @@ struct target_rt_signal_frame {
>      qemu_siginfo_fpu_t  fpu_state;
>  };
>  
> -#define UREG_O0        16
> -#define UREG_O6        22
> -#define UREG_I0        0
> -#define UREG_I1        1
> -#define UREG_I2        2
> -#define UREG_I3        3
> -#define UREG_I4        4
> -#define UREG_I5        5
> -#define UREG_I6        6
> -#define UREG_I7        7
> -#define UREG_L0        8
> -#define UREG_FP        UREG_I6
> -#define UREG_SP        UREG_O6
> -
>  static inline abi_ulong get_sigframe(struct target_sigaction *sa, 
>                                       CPUSPARCState *env,
>                                       unsigned long framesize)
> @@ -159,30 +145,12 @@ setup___siginfo(__siginfo_t *si, CPUSPARCState *env, abi_ulong mask)
>          __put_user(env->gregs[i], &si->si_regs.u_regs[i]);
>      }
>      for (i=0; i < 8; i++) {
> -        __put_user(env->regwptr[UREG_I0 + i], &si->si_regs.u_regs[i+8]);
> +        __put_user(env->regwptr[WREG_O0 + i], &si->si_regs.u_regs[i+8]);
>      }
>      __put_user(mask, &si->si_mask);
>      return err;
>  }
>  
> -#if 0
> -static int
> -setup_sigcontext(struct target_sigcontext *sc, /*struct _fpstate *fpstate,*/
> -                 CPUSPARCState *env, unsigned long mask)
> -{
> -    int err = 0;
> -
> -    __put_user(mask, &sc->sigc_mask);
> -    __put_user(env->regwptr[UREG_SP], &sc->sigc_sp);
> -    __put_user(env->pc, &sc->sigc_pc);
> -    __put_user(env->npc, &sc->sigc_npc);
> -    __put_user(env->psr, &sc->sigc_psr);
> -    __put_user(env->gregs[1], &sc->sigc_g1);
> -    __put_user(env->regwptr[UREG_O0], &sc->sigc_o0);
> -
> -    return err;
> -}
> -#endif
>  #define NF_ALIGNEDSZ  (((sizeof(struct target_signal_frame) + 7) & (~7)))
>  
>  void setup_frame(int sig, struct target_sigaction *ka,
> @@ -221,20 +189,20 @@ void setup_frame(int sig, struct target_sigaction *ka,
>      }
>  
>      for (i = 0; i < 8; i++) {
> -        __put_user(env->regwptr[i + UREG_L0], &sf->ss.locals[i]);
> +        __put_user(env->regwptr[i + WREG_L0], &sf->ss.locals[i]);
>      }
>      for (i = 0; i < 8; i++) {
> -        __put_user(env->regwptr[i + UREG_I0], &sf->ss.ins[i]);
> +        __put_user(env->regwptr[i + WREG_I0], &sf->ss.ins[i]);
>      }
>      if (err)
>          goto sigsegv;
>  
>      /* 3. signal handler back-trampoline and parameters */
> -    env->regwptr[UREG_FP] = sf_addr;
> -    env->regwptr[UREG_I0] = sig;
> -    env->regwptr[UREG_I1] = sf_addr +
> +    env->regwptr[WREG_FP] = sf_addr;
> +    env->regwptr[WREG_I0] = sig;
> +    env->regwptr[WREG_I1] = sf_addr +
>              offsetof(struct target_signal_frame, info);
> -    env->regwptr[UREG_I2] = sf_addr +
> +    env->regwptr[WREG_I2] = sf_addr +
>              offsetof(struct target_signal_frame, info);
>  
>      /* 4. signal handler */
> @@ -242,11 +210,11 @@ void setup_frame(int sig, struct target_sigaction *ka,
>      env->npc = (env->pc + 4);
>      /* 5. return to kernel instructions */
>      if (ka->ka_restorer) {
> -        env->regwptr[UREG_I7] = ka->ka_restorer;
> +        env->regwptr[WREG_I7] = ka->ka_restorer;
>      } else {
>          uint32_t val32;
>  
> -        env->regwptr[UREG_I7] = sf_addr +
> +        env->regwptr[WREG_I7] = sf_addr +
>                  offsetof(struct target_signal_frame, insns) - 2 * 4;
>  
>          /* mov __NR_sigreturn, %g1 */
> @@ -284,7 +252,7 @@ long do_sigreturn(CPUSPARCState *env)
>      sigset_t host_set;
>      int i;
>  
> -    sf_addr = env->regwptr[UREG_FP];
> +    sf_addr = env->regwptr[WREG_SP];
>      trace_user_do_sigreturn(env, sf_addr);
>      if (!lock_user_struct(VERIFY_READ, sf, sf_addr, 1)) {
>          goto segv_and_exit;
> @@ -316,7 +284,7 @@ long do_sigreturn(CPUSPARCState *env)
>          __get_user(env->gregs[i], &sf->info.si_regs.u_regs[i]);
>      }
>      for (i=0; i < 8; i++) {
> -        __get_user(env->regwptr[i + UREG_I0], &sf->info.si_regs.u_regs[i+8]);
> +        __get_user(env->regwptr[i + WREG_O0], &sf->info.si_regs.u_regs[i+8]);
>      }
>  
>      /* FIXME: implement FPU save/restore:
> @@ -433,7 +401,7 @@ void sparc64_set_context(CPUSPARCState *env)
>      abi_ulong fp, i7, w_addr;
>      unsigned int i;
>  
> -    ucp_addr = env->regwptr[UREG_I0];
> +    ucp_addr = env->regwptr[WREG_O0];
>      if (!lock_user_struct(VERIFY_READ, ucp, ucp_addr, 1)) {
>          goto do_sigsegv;
>      }
> @@ -443,7 +411,7 @@ void sparc64_set_context(CPUSPARCState *env)
>      if ((pc | npc) & 3) {
>          goto do_sigsegv;
>      }
> -    if (env->regwptr[UREG_I1]) {
> +    if (env->regwptr[WREG_O1]) {
>          target_sigset_t target_set;
>          sigset_t set;
>  
> @@ -474,19 +442,19 @@ void sparc64_set_context(CPUSPARCState *env)
>      __get_user(env->gregs[5], (&(*grp)[SPARC_MC_G5]));
>      __get_user(env->gregs[6], (&(*grp)[SPARC_MC_G6]));
>      __get_user(env->gregs[7], (&(*grp)[SPARC_MC_G7]));
> -    __get_user(env->regwptr[UREG_I0], (&(*grp)[SPARC_MC_O0]));
> -    __get_user(env->regwptr[UREG_I1], (&(*grp)[SPARC_MC_O1]));
> -    __get_user(env->regwptr[UREG_I2], (&(*grp)[SPARC_MC_O2]));
> -    __get_user(env->regwptr[UREG_I3], (&(*grp)[SPARC_MC_O3]));
> -    __get_user(env->regwptr[UREG_I4], (&(*grp)[SPARC_MC_O4]));
> -    __get_user(env->regwptr[UREG_I5], (&(*grp)[SPARC_MC_O5]));
> -    __get_user(env->regwptr[UREG_I6], (&(*grp)[SPARC_MC_O6]));
> -    __get_user(env->regwptr[UREG_I7], (&(*grp)[SPARC_MC_O7]));
> +    __get_user(env->regwptr[WREG_O0], (&(*grp)[SPARC_MC_O0]));
> +    __get_user(env->regwptr[WREG_O1], (&(*grp)[SPARC_MC_O1]));
> +    __get_user(env->regwptr[WREG_O2], (&(*grp)[SPARC_MC_O2]));
> +    __get_user(env->regwptr[WREG_O3], (&(*grp)[SPARC_MC_O3]));
> +    __get_user(env->regwptr[WREG_O4], (&(*grp)[SPARC_MC_O4]));
> +    __get_user(env->regwptr[WREG_O5], (&(*grp)[SPARC_MC_O5]));
> +    __get_user(env->regwptr[WREG_O6], (&(*grp)[SPARC_MC_O6]));
> +    __get_user(env->regwptr[WREG_O7], (&(*grp)[SPARC_MC_O7]));
>  
>      __get_user(fp, &(ucp->tuc_mcontext.mc_fp));
>      __get_user(i7, &(ucp->tuc_mcontext.mc_i7));
>  
> -    w_addr = TARGET_STACK_BIAS+env->regwptr[UREG_I6];
> +    w_addr = TARGET_STACK_BIAS + env->regwptr[WREG_FP];
>      if (put_user(fp, w_addr + offsetof(struct target_reg_window, ins[6]),
>                   abi_ulong) != 0) {
>          goto do_sigsegv;
> @@ -534,7 +502,7 @@ void sparc64_get_context(CPUSPARCState *env)
>      target_sigset_t target_set;
>      sigset_t set;
>  
> -    ucp_addr = env->regwptr[UREG_I0];
> +    ucp_addr = env->regwptr[WREG_O0];
>      if (!lock_user_struct(VERIFY_WRITE, ucp, ucp_addr, 0)) {
>          goto do_sigsegv;
>      }
> @@ -580,16 +548,16 @@ void sparc64_get_context(CPUSPARCState *env)
>      __put_user(env->gregs[5], &((*grp)[SPARC_MC_G5]));
>      __put_user(env->gregs[6], &((*grp)[SPARC_MC_G6]));
>      __put_user(env->gregs[7], &((*grp)[SPARC_MC_G7]));
> -    __put_user(env->regwptr[UREG_I0], &((*grp)[SPARC_MC_O0]));
> -    __put_user(env->regwptr[UREG_I1], &((*grp)[SPARC_MC_O1]));
> -    __put_user(env->regwptr[UREG_I2], &((*grp)[SPARC_MC_O2]));
> -    __put_user(env->regwptr[UREG_I3], &((*grp)[SPARC_MC_O3]));
> -    __put_user(env->regwptr[UREG_I4], &((*grp)[SPARC_MC_O4]));
> -    __put_user(env->regwptr[UREG_I5], &((*grp)[SPARC_MC_O5]));
> -    __put_user(env->regwptr[UREG_I6], &((*grp)[SPARC_MC_O6]));
> -    __put_user(env->regwptr[UREG_I7], &((*grp)[SPARC_MC_O7]));
> +    __put_user(env->regwptr[WREG_O0], &((*grp)[SPARC_MC_O0]));
> +    __put_user(env->regwptr[WREG_O1], &((*grp)[SPARC_MC_O1]));
> +    __put_user(env->regwptr[WREG_O2], &((*grp)[SPARC_MC_O2]));
> +    __put_user(env->regwptr[WREG_O3], &((*grp)[SPARC_MC_O3]));
> +    __put_user(env->regwptr[WREG_O4], &((*grp)[SPARC_MC_O4]));
> +    __put_user(env->regwptr[WREG_O5], &((*grp)[SPARC_MC_O5]));
> +    __put_user(env->regwptr[WREG_O6], &((*grp)[SPARC_MC_O6]));
> +    __put_user(env->regwptr[WREG_O7], &((*grp)[SPARC_MC_O7]));
>  
> -    w_addr = TARGET_STACK_BIAS+env->regwptr[UREG_I6];
> +    w_addr = TARGET_STACK_BIAS + env->regwptr[WREG_FP];
>      fp = i7 = 0;
>      if (get_user(fp, w_addr + offsetof(struct target_reg_window, ins[6]),
>                   abi_ulong) != 0) {
> 


