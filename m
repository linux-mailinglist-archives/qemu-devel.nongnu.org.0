Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA66467414
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:30:21 +0100 (CET)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4tY-0004fV-Rw
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:30:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mt4rF-000214-6X; Fri, 03 Dec 2021 04:27:57 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:41827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mt4rC-0000AM-7c; Fri, 03 Dec 2021 04:27:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E5C0FCF97003;
 Fri,  3 Dec 2021 10:27:50 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 10:27:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0022212b1e8-0a35-48a6-bea2-786afec3538d,
 530A9595C01F0F4EFEED26D362E2F82770F5CBE3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5e0c4c6a-55cc-87d2-6900-e609b258e557@kaod.org>
Date: Fri, 3 Dec 2021 10:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 09/10] target/ppc: PMU Event-Based exception support
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211201151734.654994-1-danielhb413@gmail.com>
 <20211201151734.654994-10-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211201151734.654994-10-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 197c24d3-a915-440c-853d-45c395a0711f
X-Ovh-Tracer-Id: 16363266300379761516
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, Gustavo Romero <gromero@linux.ibm.com>,
 richard.henderson@linaro.org, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 12/1/21 16:17, Daniel Henrique Barboza wrote:
> From: Gustavo Romero <gromero@linux.ibm.com>
> 
> Following up the rfebb implementation, this patch adds the EBB exception
> support that are triggered by Performance Monitor alerts. This exception
> occurs when an enabled PMU condition or event happens and both MMCR0_EBE
> and BESCR_PME are set.
> 
> The supported PM alerts will consist of counter negative conditions of
> the PMU counters. This will be achieved by a timer mechanism that will
> predict when a counter becomes negative. The PMU timer callback will set
> the appropriate bits in MMCR0 and fire a PMC interrupt. The EBB
> exception code will then set the appropriate BESCR bits, set the next
> instruction pointer to the address pointed by the return register
> (SPR_EBBRR), and redirect execution to the handler (pointed by
> SPR_EBBHR).
> 
> CC: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/cpu.h         |  5 ++++-
>   target/ppc/excp_helper.c | 29 +++++++++++++++++++++++++++++
>   target/ppc/power8-pmu.c  | 40 ++++++++++++++++++++++++++++++++++++++--
>   3 files changed, 71 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 741b8baf4c..8e0e6319ee 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -129,8 +129,10 @@ enum {
>       /* ISA 3.00 additions */
>       POWERPC_EXCP_HVIRT    = 101,
>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
> +    POWERPC_EXCP_EBB = 103, /* Event-based branch exception                  */
> +
>       /* EOL                                                                   */
> -    POWERPC_EXCP_NB       = 103,
> +    POWERPC_EXCP_NB       = 104,
>       /* QEMU exceptions: special cases we want to stop translation            */
>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>   };
> @@ -2452,6 +2454,7 @@ enum {
>       PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
>       PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
>       PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
> +    PPC_INTERRUPT_PMC,            /* PMU interrupt  */

This is referred as a Performance Monitor event-based exception in ISA.
PPC_INTERRUPT_PM_EBB would be a better name I think.

We also have :

   Load Monitored event-based exceptions
   External event-based exceptions



>   };
>   
>   /* Processor Compatibility mask (PCR) */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7ead32279c..a26d266fe6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -799,6 +799,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>           cpu_abort(cs, "Non maskable external exception "
>                     "is not implemented yet !\n");
>           break;
> +    case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
> +        if ((env->spr[SPR_FSCR] & (1ull << FSCR_EBB)) &&
> +            (env->spr[SPR_BESCR] & BESCR_GE) &&
> +            (env->spr[SPR_BESCR] & BESCR_PME)) {


Shouldn't we check these conditions to gate the EBB before sending it ?
What about the HFSCR_EBB case ?


> +            target_ulong nip;
> +
> +            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
> +            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
> +            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
> +            nip = env->spr[SPR_EBBHR];          /* EBB handler */
> +            powerpc_set_excp_state(cpu, nip, env->msr);
> +        }


I am in favor of not adding anything more under the powerpc_excp() routine.
Can we add a helper to isolate the EBB case ? I have the feeling it could
become big.


> +        /*
> +         * This interrupt is handled by userspace. No need
> +         * to proceed.
> +         */
> +        return;
>       default:
>       excp_invalid:
>           cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
> @@ -1046,6 +1063,18 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>               powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
>               return;
>           }
> +        /* PMC -> Event-based branch exception */
> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_PMC)) {
> +            /*
> +             * Performance Monitor event-based exception can only
> +             * occur in problem state.
> +             */

Yes. is the PM EBB exception gated by EE also ?

Thanks,

C.


> +            if (msr_pr == 1) {
> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PMC);
> +                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EBB);
> +                return;
> +            }
> +        }
>       }
>   
>       if (env->resume_as_sreset) {
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index 08d1902cd5..279b824c3f 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -297,6 +297,20 @@ void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
>       pmc_update_overflow_timer(env, sprn);
>   }
>   
> +static void pmu_delete_timers(CPUPPCState *env)
> +{
> +    QEMUTimer *pmc_overflow_timer;
> +    int sprn;
> +
> +    for (sprn = SPR_POWER_PMC1; sprn <= SPR_POWER_PMC6; sprn++) {
> +        pmc_overflow_timer = get_cyc_overflow_timer(env, sprn);
> +
> +        if (pmc_overflow_timer) {
> +            timer_del(pmc_overflow_timer);
> +        }
> +    }
> +}
> +
>   static void fire_PMC_interrupt(PowerPCCPU *cpu)
>   {
>       CPUPPCState *env = &cpu->env;
> @@ -305,8 +319,30 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>           return;
>       }
>   
> -    /* PMC interrupt not implemented yet */
> -    return;
> +    pmu_update_cycles(env);
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_FCECE) {
> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_FCECE;
> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_FC;
> +
> +        /* Changing MMCR0_FC demands a new hflags compute */
> +        hreg_compute_hflags(env);
> +
> +        /*
> +         * Delete all pending timers if we need to freeze
> +         * the PMC. We'll restart them when the PMC starts
> +         * running again.
> +         */
> +        pmu_delete_timers(env);
> +    }
> +
> +    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAE) {
> +        env->spr[SPR_POWER_MMCR0] &= ~MMCR0_PMAE;
> +        env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
> +    }
> +
> +    /* Fire the PMC hardware exception */
> +    ppc_set_irq(cpu, PPC_INTERRUPT_PMC, 1);
>   }
>   
>   /* This helper assumes that the PMC is running. */
> 


