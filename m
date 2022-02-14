Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF34B58AA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:36:55 +0100 (CET)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJfHS-0005tb-8z
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:36:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJfFf-0004WJ-KP
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:35:03 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:58309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJfFc-0001YO-EU
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:35:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A29B321D3B;
 Mon, 14 Feb 2022 17:34:57 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Feb
 2022 18:34:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001548e683a-8d49-498f-ab4f-565a02215322,
 C2C7607E88AF4BE64101885B1C15C3F55EEC8FC9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d1e2f0c2-ddfa-b0d3-2b45-bcb34687cd73@kaod.org>
Date: Mon, 14 Feb 2022 18:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v11 3/4] target/ppc: add PPC_INTERRUPT_EBB and EBB
 exceptions
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220211183354.563602-1-danielhb413@gmail.com>
 <20220211183354.563602-4-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220211183354.563602-4-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5ce84ec8-7b04-46e3-8ef9-ec51543243d5
X-Ovh-Tracer-Id: 10574733401383406560
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/22 19:33, Daniel Henrique Barboza wrote:
> PPC_INTERRUPT_EBB is a new interrupt that will be used to deliver EBB
> exceptions that had to be postponed because the thread wasn't in problem
> state at the time the event-based branch was supposed to occur.
> 
> ISA 3.1 also defines two EBB exceptions: Performance Monitor EBB
> exception and External EBB exception. They are being added as
> POWERPC_EXCP_PERFM_EBB and POWERPC_EXCP_EXTERNAL_EBB.
> 
> PPC_INTERRUPT_EBB will check BESCR bits to see the EBB type that
> occurred and trigger the appropriate exception. Both exceptions are
> doing the same thing in this first implementation: clear BESCR_GE and
> enter the branch with env->nip retrieved from SPR_EBBHR.
> 
> The checks being done by the interrupt code are msr_pr and BESCR_GE
> states. All other checks (EBB facility check, BESCR_PME bit, specific
> bits related to the event type) must be done beforehand.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

It looks correct.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Next step is to modify the POWER9 input pins and these routines :

   xive_tctx_realize()
   xive_tctx_output()
   power9_set_irq()

to add an EBB "wire" between the IC and the CPU.

Thanks,

C.


> ---
>   target/ppc/cpu.h         |  5 ++++-
>   target/ppc/cpu_init.c    |  4 ++++
>   target/ppc/excp_helper.c | 33 +++++++++++++++++++++++++++++++++
>   3 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index dcd83b503c..3962c8f6f4 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -129,8 +129,10 @@ enum {
>       /* ISA 3.00 additions */
>       POWERPC_EXCP_HVIRT    = 101,
>       POWERPC_EXCP_SYSCALL_VECTORED = 102, /* scv exception                     */
> +    POWERPC_EXCP_PERFM_EBB = 103,    /* Performance Monitor EBB Exception    */
> +    POWERPC_EXCP_EXTERNAL_EBB = 104, /* External EBB Exception               */
>       /* EOL                                                                   */
> -    POWERPC_EXCP_NB       = 103,
> +    POWERPC_EXCP_NB       = 105,
>       /* QEMU exceptions: special cases we want to stop translation            */
>       POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
>   };
> @@ -2453,6 +2455,7 @@ enum {
>       PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt    */
>       PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
>       PPC_INTERRUPT_HVIRT,          /* Hypervisor virtualization interrupt  */
> +    PPC_INTERRUPT_EBB,            /* Event-based Branch exception         */
>   };
>   
>   /* Processor Compatibility mask (PCR) */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index bf60529d37..136d8ca8b5 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2336,6 +2336,10 @@ static void init_excp_POWER8(CPUPPCState *env)
>       env->excp_vectors[POWERPC_EXCP_FU]       = 0x00000F60;
>       env->excp_vectors[POWERPC_EXCP_HV_FU]    = 0x00000F80;
>       env->excp_vectors[POWERPC_EXCP_SDOOR_HV] = 0x00000E80;
> +
> +    /* Userland exceptions without vector value in PowerISA v3.1 */
> +    env->excp_vectors[POWERPC_EXCP_PERFM_EBB] = 0x0;
> +    env->excp_vectors[POWERPC_EXCP_EXTERNAL_EBB] = 0x0;
>   #endif
>   }
>   
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 8a49a4ab90..ad40a0f8e6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -990,6 +990,21 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           new_msr |= (target_ulong)MSR_HVB;
>           new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>           break;
> +    case POWERPC_EXCP_PERFM_EBB:        /* Performance Monitor EBB Exception  */
> +    case POWERPC_EXCP_EXTERNAL_EBB:     /* External EBB Exception             */
> +        env->spr[SPR_BESCR] &= ~BESCR_GE;
> +
> +        /*
> +         * Save NIP for rfebb insn in SPR_EBBRR. Next nip is
> +         * stored in the EBB Handler SPR_EBBHR.
> +         */
> +        env->spr[SPR_EBBRR] = env->nip;
> +        powerpc_set_excp_state(cpu, env->spr[SPR_EBBHR], env->msr);
> +
> +        /*
> +         * This exception is handled in userspace. No need to proceed.
> +         */
> +        return;
>       case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
>       case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
>       case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
> @@ -1681,6 +1696,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>               powerpc_excp(cpu, POWERPC_EXCP_THERM);
>               return;
>           }
> +        /* EBB exception */
> +        if (env->pending_interrupts & (1 << PPC_INTERRUPT_EBB)) {
> +            /*
> +             * EBB exception must be taken in problem state and
> +             * with BESCR_GE set.
> +             */
> +            if (msr_pr == 1 && env->spr[SPR_BESCR] & BESCR_GE) {
> +                env->pending_interrupts &= ~(1 << PPC_INTERRUPT_EBB);
> +
> +                if (env->spr[SPR_BESCR] & BESCR_PMEO) {
> +                    powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
> +                } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
> +                    powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
> +                }
> +
> +                return;
> +            }
> +        }
>       }
>   
>       if (env->resume_as_sreset) {
> 


