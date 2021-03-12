Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1B338B4F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:13:04 +0100 (CET)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKfj5-0004j1-9X
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKffs-0002Qd-SI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:09:44 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:39167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKffq-0002kt-SX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:09:44 -0500
Received: from [192.168.100.43] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MAwTn-1lR1K92G41-00BLHZ; Fri, 12 Mar 2021 12:09:40 +0100
Subject: Re: [PULL 26/40] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
 <20210216161658.29881-27-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f484737b-8dc1-fc16-06a5-753500104bf0@vivier.eu>
Date: Fri, 12 Mar 2021 12:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210216161658.29881-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Uh3U5+dJpn6xPDOMMHZroAPCMwJ+cyEHT8IuwROHhWcBervFyvl
 +ZFdQGGvv7Gi4ljej59yhzZwuQAuEdYEH60UeUPje8eJDZ62kzQMjTBqLkAmv854op/n+Zv
 rQFIjNeWoMRHPMqrCIHb0S+6k5eAyUkCHDdyBD7V1T8XPEdA2ybToIYIJxeykVqLLmFjEnF
 wHoqisbx7MViJgCcWE33w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E2k6275VnTE=:YYMgz4QH+5ZdycvE4m01ra
 ostgu4II9yAqmUNQVo7Rkg8zB3AJ/oHEhCkUjX3RDsvwI97qXMtBJZ5DjljA98ddnLnkwvCZp
 cZ3YXg10sIZpvi+8O28s45T0ICnSi5DQghKdmn+pI7v9PVD0nbH+4TnULx/RkFbL7sAcuOc3L
 yDAeitFH+GLj6HGo7vr7Ycwhuryuv2oGYpSh2hUcmPRwmRTnWRJfpNgUF7b2t03zihoTLjuht
 CKjKbThx/CYX2B75KbI5QIGdP1mZYDB5UcNEcr3JeHNYV4QxlfrakMs9056J5ljQVfWVPoDGN
 Qgk9oW/XI51xJ64d0o63HREr+HuIEc9bD+QW7Rw69YojqRcr1eknetbKeFyKCR451v19qKxLc
 sM7c7uMeVW+gdDvLSx0WfpPTIM6IBh81n/xLlw0lcL7qb39YWbyyqcOycaK7O
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 16/02/2021 17:16, Peter Maydell wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> A proper syndrome is required to fill in the proper si_code.
> Use page_get_flags to determine permission vs translation for user-only.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20210212184902.1251044-27-richard.henderson@linaro.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 24 +++++++++++++++++++++---
>  target/arm/tlb_helper.c       | 15 +++++++++------
>  2 files changed, 30 insertions(+), 9 deletions(-)

While I was testing my next linux-user pull request I found this patch breaks something.

Following LTP tests are broken:

mmap05
mprotect02
mprotect03
mprotect04
shmat01

with arm64/sid, arm64/trusty, arm64/bionic

Bisecting only using mmap05 test I find this patch.

Symptoms are:

$ sudo unshare --time --ipc --uts --pid --fork --kill-child --mount --mount-proc --root
chroot/arm64/sid /opt/ltp/testcases/bin/mmap05
**
ERROR:../../../Projects/qemu/linux-user/aarch64/cpu_loop.c:141:cpu_loop: code should not
be reached
Bail out! ERROR:../../../Projects/qemu/linux-user/aarch64/cpu_loop.c:141:cpu_loop: code
should not be reached
qemu:handle_cpu_signal received signal outside vCPU context @ pc=0x7f45c1cd9706

Expected result is:

mmap05      1  TPASS  :  Got SIGSEGV as expected

Thanks,
Laurent

> 
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 42b9c15f536..4e43906e66a 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -23,6 +23,7 @@
>  #include "cpu_loop-common.h"
>  #include "qemu/guest-random.h"
>  #include "hw/semihosting/common-semi.h"
> +#include "target/arm/syndrome.h"
>  
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r = get_user_u32((x), (gaddr));       \
> @@ -76,7 +77,7 @@
>  void cpu_loop(CPUARMState *env)
>  {
>      CPUState *cs = env_cpu(env);
> -    int trapnr;
> +    int trapnr, ec, fsc;
>      abi_long ret;
>      target_siginfo_t info;
>  
> @@ -117,9 +118,26 @@ void cpu_loop(CPUARMState *env)
>          case EXCP_DATA_ABORT:
>              info.si_signo = TARGET_SIGSEGV;
>              info.si_errno = 0;
> -            /* XXX: check env->error_code */
> -            info.si_code = TARGET_SEGV_MAPERR;
>              info._sifields._sigfault._addr = env->exception.vaddress;
> +
> +            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
> +            ec = syn_get_ec(env->exception.syndrome);
> +            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
> +
> +            /* Both EC have the same format for FSC, or close enough. */
> +            fsc = extract32(env->exception.syndrome, 0, 6);
> +            switch (fsc) {
> +            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
> +                info.si_code = TARGET_SEGV_MAPERR;
> +                break;
> +            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
> +            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
> +                info.si_code = TARGET_SEGV_ACCERR;
> +                break;
> +            default:
> +                g_assert_not_reached();
> +            }
> +
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
>          case EXCP_DEBUG:
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index df85079d9f0..9609333cbdf 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -154,21 +154,24 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        bool probe, uintptr_t retaddr)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> +    ARMMMUFaultInfo fi = {};
>  
>  #ifdef CONFIG_USER_ONLY
> -    cpu->env.exception.vaddress = address;
> -    if (access_type == MMU_INST_FETCH) {
> -        cs->exception_index = EXCP_PREFETCH_ABORT;
> +    int flags = page_get_flags(useronly_clean_ptr(address));
> +    if (flags & PAGE_VALID) {
> +        fi.type = ARMFault_Permission;
>      } else {
> -        cs->exception_index = EXCP_DATA_ABORT;
> +        fi.type = ARMFault_Translation;
>      }
> -    cpu_loop_exit_restore(cs, retaddr);
> +
> +    /* now we have a real cpu fault */
> +    cpu_restore_state(cs, retaddr, true);
> +    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
>  #else
>      hwaddr phys_addr;
>      target_ulong page_size;
>      int prot, ret;
>      MemTxAttrs attrs = {};
> -    ARMMMUFaultInfo fi = {};
>      ARMCacheAttrs cacheattrs = {};
>  
>      /*
> 


