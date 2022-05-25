Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F2534615
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 23:54:02 +0200 (CEST)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntyx7-00010x-DG
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 17:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyvv-0008Kb-G9
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:52:48 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntyvt-0008Vs-Gu
 for qemu-devel@nongnu.org; Wed, 25 May 2022 17:52:47 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M2OEq-1nq8e514ne-003wkc; Wed, 25 May 2022 23:52:43 +0200
Message-ID: <e8d5ee5e-176f-8641-e68d-e9847435d7ae@vivier.eu>
Date: Wed, 25 May 2022 23:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 14/17] tests/tcg/m68k: Add trap.c
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-15-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RLvlu4co3vVHKS0tjeq7MRnxuIywNrMUmF/RohQgMEwyBx9cTO5
 tHlb6SDvTekDgaC7n+ktGzpg4SkPN0ocElczMNajSE+XAS/ePfEkYXtzeFuhuDHrvmOWXAM
 feg7FN3Yh56maoqibsVT/3IkH27jNc9UioLEUAPuEmJLun09RQOTRC8sknSrtw2q0BN0AW7
 04O2zaWaW79j+GvWB51pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BM6O+oSYDAk=:0lMoIxceIU2ifbXpXcwC5T
 zJYNrqwIOymtqxxPbJynmmZ2d4+Q/xP2maWcIMFt9/I8p0zbbNi5REPwpO+v2w69+blCd4XwT
 guHhpakenYzG6psGNZByhAorcvFCTk90E5j4tG2+xuI00il2WzhiNNFiL/nKt76g60wop4uMN
 XJieKqP8NgK2i05nKDEZOS/LmhL8pksENLyJQntw6dNWhzscBQqLNRER099e6s/GUgo2aQ7HX
 5+fFS8ZeXMvst7dFunzUWyRI3ftpSI7JSHqBaZrPohjcz6T/KNe+qEmukqnWyGlUyyQtWRhpv
 fqxp2kthOykCIUrsPHor6gfmfibRoiXGU1cAyPSMN/wa5pyi63WvIdhWRhO/zXBWJ80T6Gbwd
 rmJWY/xgw6mdT7k2HDsBDRx7s/kziF287+RjlFztBWvypW4CWE2QisKMlQ5EoPLYj9RYwzyTg
 UbaaZpv3Ay5IW1A4mARRUrAc6+QXeiYN60cul9RacFFWX/TGsVcQ1/NUqejRj1KO1fRKwj3T/
 O2ua8UFlPjE2yat2lTYeSijqNP7R0ntpJgXOvjmP0ds/0xTiEFr/U73YpFn90l9VyeGYezqME
 UgVass5wO6aCc4T5FxqrJqihdl0HWMYqj5U4+7KFnPd6wUqJc7AlzVHRqOjAgzUvAgOWQI+gk
 l7gEq2jjko80Vxqx2+JOF0r0Sf+oWG+FhlK3uq9idtyewr4JegYSgqyA45cnAPXr++n0DUBLy
 mRGAoK4jn3f6mReFAHy+O0du4/SniOXnrt9SlA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> Test various trap instructions: chk, div, trap, trapv, trapcc, ftrapcc,
> and the signals and addresses that we expect from them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/tcg/m68k/trap.c          | 129 +++++++++++++++++++++++++++++++++
>   tests/tcg/m68k/Makefile.target |   3 +
>   2 files changed, 132 insertions(+)
>   create mode 100644 tests/tcg/m68k/trap.c
> 
> diff --git a/tests/tcg/m68k/trap.c b/tests/tcg/m68k/trap.c
> new file mode 100644
> index 0000000000..08ab56b2ca
> --- /dev/null
> +++ b/tests/tcg/m68k/trap.c
> @@ -0,0 +1,129 @@
> +/*
> + * Test m68k trap addresses.
> + */
> +
> +#define _GNU_SOURCE 1
> +#include <signal.h>
> +#include <assert.h>
> +#include <limits.h>
> +
> +static int expect_sig;
> +static int expect_si_code;
> +static void *expect_si_addr;
> +static greg_t expect_mc_pc;
> +static volatile int got_signal;
> +
> +static void sig_handler(int sig, siginfo_t *si, void *puc)
> +{
> +    ucontext_t *uc = puc;
> +    mcontext_t *mc = &uc->uc_mcontext;
> +
> +    assert(sig == expect_sig);
> +    assert(si->si_code == expect_si_code);
> +    assert(si->si_addr == expect_si_addr);
> +    assert(mc->gregs[R_PC] == expect_mc_pc);
> +
> +    got_signal = 1;
> +}
> +
> +#define FMT_INS     [ad] "a"(&expect_si_addr), [pc] "a"(&expect_mc_pc)
> +#define FMT0_STR(S) \
> +    "move.l #1f, (%[ad])\n\tmove.l #1f, (%[pc])\n" S "\n1:\n"
> +#define FMT2_STR(S) \
> +    "move.l #0f, (%[ad])\n\tmove.l #1f, (%[pc])\n" S "\n1:\n"
> +
> +#define CHECK_SIG   do { assert(got_signal); got_signal = 0; } while (0)
> +
> +int main(int argc, char **argv)
> +{
> +    struct sigaction act = {
> +        .sa_sigaction = sig_handler,
> +        .sa_flags = SA_SIGINFO
> +    };
> +    int t0, t1;
> +
> +    sigaction(SIGILL, &act, NULL);
> +    sigaction(SIGTRAP, &act, NULL);
> +    sigaction(SIGFPE, &act, NULL);
> +
> +    expect_sig = SIGFPE;
> +    expect_si_code = FPE_INTOVF;
> +    asm volatile(FMT2_STR("0:\tchk %0, %1") : : "d"(0), "d"(-1), FMT_INS);
> +    CHECK_SIG;
> +
> +#if 0
> +    /* FIXME: chk2 not correctly translated. */
> +    int bounds[2] = { 0, 1 };
> +    asm volatile(FMT2_STR("0:\tchk2.l %0, %1")
> +                 : : "m"(bounds), "d"(2), FMT_INS);
> +    CHECK_SIG;
> +#endif
> +
> +    asm volatile(FMT2_STR("cmp.l %0, %1\n0:\ttrapv")
> +                 : : "d"(INT_MIN), "d"(1), FMT_INS);
> +    CHECK_SIG;
> +
> +    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq")
> +                 : : "d"(0), FMT_INS);
> +    CHECK_SIG;
> +
> +    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq.w #0x1234")
> +                 : : "d"(0), FMT_INS);
> +    CHECK_SIG;
> +
> +    asm volatile(FMT2_STR("cmp.l %0, %0\n0:\ttrapeq.l #0x12345678")
> +                 : : "d"(0), FMT_INS);
> +    CHECK_SIG;
> +
> +    asm volatile(FMT2_STR("fcmp.x %0, %0\n0:\tftrapeq")
> +                 : : "f"(0.0L), FMT_INS);
> +    CHECK_SIG;
> +
> +    expect_si_code = FPE_INTDIV;
> +
> +    asm volatile(FMT2_STR("0:\tdivs.w %1, %0")
> +                 : "=d"(t0) : "d"(0), "0"(1), FMT_INS);
> +    CHECK_SIG;
> +
> +    asm volatile(FMT2_STR("0:\tdivsl.l %2, %1:%0")
> +                 : "=d"(t0), "=d"(t1) : "d"(0), "0"(1), FMT_INS);
> +    CHECK_SIG;
> +
> +    expect_sig = SIGILL;
> +    expect_si_code = ILL_ILLOPN;
> +    asm volatile(FMT0_STR("trap #1") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #2") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #3") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #4") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #5") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #6") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #7") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #8") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #9") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #10") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #11") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #12") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #13") : : FMT_INS);
> +    CHECK_SIG;
> +    asm volatile(FMT0_STR("trap #14") : : FMT_INS);
> +    CHECK_SIG;
> +
> +    expect_sig = SIGTRAP;
> +    expect_si_code = TRAP_BRKPT;
> +    asm volatile(FMT0_STR("trap #15") : : FMT_INS);
> +    CHECK_SIG;
> +
> +    return 0;
> +}
> diff --git a/tests/tcg/m68k/Makefile.target b/tests/tcg/m68k/Makefile.target
> index 62f109eef4..1163c7ef03 100644
> --- a/tests/tcg/m68k/Makefile.target
> +++ b/tests/tcg/m68k/Makefile.target
> @@ -3,5 +3,8 @@
>   # m68k specific tweaks - specifically masking out broken tests
>   #
>   
> +VPATH += $(SRC_PATH)/tests/tcg/m68k
> +TESTS += trap
> +
>   # On m68k Linux supports 4k and 8k pages (but 8k is currently broken)
>   EXTRA_RUNS+=run-test-mmap-4096 # run-test-mmap-8192

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

