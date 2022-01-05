Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A93485140
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:41:39 +0100 (CET)
Received: from localhost ([::1]:49600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53jd-0002Vd-PT
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Sx-0000Q8-Ji
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:25 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Su-0007V8-O1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:22 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MG9wg-1nAW3M0EKi-00GY3d; Wed, 05 Jan 2022 11:24:12 +0100
Message-ID: <38b13608-ca80-1c5e-bb28-754186d77642@vivier.eu>
Date: Wed, 5 Jan 2022 11:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/7] linux-user/nios2: Map a real kuser page
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-5-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S8+CvzGDcBWsNQdUbaST/J81YEnGkDPnMACwADqGI0JrdNgabK+
 /2Gjw19g8ryNl8vhdka9tOv0O2ZQLmWWBkmYJ6riBrsOgpWa/9z7tKqszEP5CrMY5iur857
 aUUwSyy/zrXaKQVRFx/EFPr0Fw90zJek6I549E0lvqcBMXpYoahFrFBNhTIgO+g66OawHsa
 +2lrYKWqg97vDNg3qaD8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RYoGKiOGBfo=:8vnqZxkaS4UYztHD0P4KFO
 mQ26L0JcKB9VJ8+2yd1KsjIcGeuNRz9DEkDlVx1xS3HvnyyJjOQ2tPSE0tfZ2xmTllQIxrQvi
 NeDXXoG9TReB+NdqdOcHHsdlPE92K+w1xxM0GSIpCVtWmwuWwbxNZNKWkj4oUOls1Ll1VHW5/
 rNZcVr2Yn3h9visooaAkJ69QZvacjwzm2ZBwHkVXzhUyQIcirEo4rzUBghkmXPRXCt2/RFdhT
 TKIKbOwMez9TmLdY0qpOJpjScw0luI30Im9iCb7ApFrz26yREtnQpChxOVdJ733cODaLY9WK2
 pxxdczagQwQkVVZ3KCoTZH9hyzcoBIxIqfw0xiDuvoMovpBuTMZyqBPmV1Q0nh7FU3A1NL71T
 a30EDo/PSNALQhcbt7Q+VH73G0fejfsZcpJ7fWXJS4dCuZS+qi+9NxXGRxZggBncP3WI4woXD
 ly6oV2qX41Hi257Hh0l1jYuYTq38ORhGEwhMebJwJ3xkxb+JLjsAYUf1JwMkhJfi9yvBbfXb7
 V2yQjDEifLpSDUgH+wf+89c+kx+0xIMws8bqMEWPI/GNjeMZbBxeiqDOLw43OHbJjkL6rREIH
 EqoaisUJyedYKGiu9C1/W6JRMGGtct0x30627xlhZEMAq3P2o+Bq/+wcM0j9bnbyynLtLIgEU
 SgNif2P2iISsh8Hft6y4k/1GcHSzWWGhXZviKlq2bSGG3bcwQlixvXwQwGaVx3E1GYQ8=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> The first word of page1 is data, so the whole thing
> can't be implemented with emulation of addresses.
> Use init_guest_commpage for the allocation.
> 
> Hijack trap number 16 to implement cmpxchg.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c        | 50 ++++++++++++++++++++++++++++++++++++-
>   linux-user/nios2/cpu_loop.c | 50 ++++++++++++++++++++-----------------
>   target/nios2/translate.c    |  9 -------
>   3 files changed, 76 insertions(+), 33 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index d34cd4fe43..329b2375ef 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1099,6 +1099,47 @@ static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
>       regs->estatus = 0x3;
>   }
>   
> +#define LO_COMMPAGE  TARGET_PAGE_SIZE
> +
> +static bool init_guest_commpage(void)
> +{
> +    static const uint8_t kuser_page[4 + 2 * 64] = {
> +        /* __kuser_helper_version */
> +        [0x00] = 0x02, 0x00, 0x00, 0x00,
> +
> +        /* __kuser_cmpxchg */
> +        [0x04] = 0x3a, 0x6c, 0x3b, 0x00,  /* trap 16 */
> +                 0x3a, 0x28, 0x00, 0xf8,  /* ret */
> +
> +        /* __kuser_sigtramp */
> +        [0x44] = 0xc4, 0x22, 0x80, 0x00,  /* movi r2, __NR_rt_sigreturn */
> +                 0x3a, 0x68, 0x3b, 0x00,  /* trap 0 */
> +    };
> +
> +    void *want = g2h_untagged(LO_COMMPAGE & -qemu_host_page_size);
> +    void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
> +                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
> +
> +    if (addr == MAP_FAILED) {
> +        perror("Allocating guest commpage");
> +        exit(EXIT_FAILURE);
> +    }
> +    if (addr != want) {
> +        return false;
> +    }
> +
> +    memcpy(addr, kuser_page, sizeof(kuser_page));
> +
> +    if (mprotect(addr, qemu_host_page_size, PROT_READ)) {
> +        perror("Protecting guest commpage");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
> +                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
> +    return true;
> +}
> +
>   #define ELF_EXEC_PAGESIZE        4096
>   
>   #define USE_ELF_CORE_DUMP
> @@ -2160,8 +2201,13 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
>       return sp;
>   }
>   
> -#ifndef HI_COMMPAGE
> +#if defined(HI_COMMPAGE)
> +#define LO_COMMPAGE 0
> +#elif defined(LO_COMMPAGE)
>   #define HI_COMMPAGE 0
> +#else
> +#define HI_COMMPAGE 0
> +#define LO_COMMPAGE 0
>   #define init_guest_commpage() true
>   #endif
>   
> @@ -2374,6 +2420,8 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>           } else {
>               offset = -(HI_COMMPAGE & -align);
>           }
> +    } else if (LO_COMMPAGE) {
> +        loaddr = MIN(loaddr, LO_COMMPAGE & -align);
>       }
>   
>       addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index 5c3d01d22d..de0fc63e21 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -76,6 +76,32 @@ void cpu_loop(CPUNios2State *env)
>                   force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
>                                   env->regs[R_PC]);
>                   break;
> +
> +            case 16: /* QEMU specific, for __kuser_cmpxchg */
> +                {
> +                    abi_ptr g = env->regs[4];
> +                    uint32_t *h, n, o;
> +
> +                    if (g & 0x3) {
> +                        force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, g);
> +                        break;
> +                    }
> +                    ret = page_get_flags(g);
> +                    if (!(ret & PAGE_VALID)) {
> +                        force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, g);
> +                        break;
> +                    }
> +                    if (!(ret & PAGE_READ) || !(ret & PAGE_WRITE)) {
> +                        force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_ACCERR, g);
> +                        break;
> +                    }
> +                    h = g2h(cs, g);
> +                    o = env->regs[5];
> +                    n = env->regs[6];
> +                    env->regs[2] = qatomic_cmpxchg(h, o, n) - o;
> +                    env->regs[R_PC] += 4;
> +                }
> +                break;
>               }
>               break;
>   
> @@ -86,29 +112,7 @@ void cpu_loop(CPUNios2State *env)
>               queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>               break;
>           case 0xaa:
> -            switch (env->regs[R_PC]) {
> -            /*case 0x1000:*/  /* TODO:__kuser_helper_version */
> -            case 0x1004:      /* __kuser_cmpxchg */
> -                start_exclusive();
> -                if (env->regs[4] & 0x3) {
> -                    goto kuser_fail;
> -                }
> -                ret = get_user_u32(env->regs[2], env->regs[4]);
> -                if (ret) {
> -                    end_exclusive();
> -                    goto kuser_fail;
> -                }
> -                env->regs[2] -= env->regs[5];
> -                if (env->regs[2] == 0) {
> -                    put_user_u32(env->regs[6], env->regs[4]);
> -                }
> -                end_exclusive();
> -                env->regs[R_PC] = env->regs[R_RA];
> -                break;
> -            /*case 0x1040:*/  /* TODO:__kuser_sigtramp */
> -            default:
> -                ;
> -kuser_fail:
> +            {
>                   info.si_signo = TARGET_SIGSEGV;
>                   info.si_errno = 0;
>                   /* TODO: check env->error_code */
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index a759877519..f9abc2fdd2 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -795,15 +795,6 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>       dc->base.pc_next = pc + 4;
>   
>       /* Decode an instruction */
> -
> -#if defined(CONFIG_USER_ONLY)
> -    /* FIXME: Is this needed ? */
> -    if (pc >= 0x1000 && pc < 0x2000) {
> -        t_gen_helper_raise_exception(dc, 0xaa);
> -        return;
> -    }
> -#endif
> -
>       code = cpu_ldl_code(env, pc);
>       op = get_opcode(code);
>   

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


