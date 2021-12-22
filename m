Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527147CDA0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:41:12 +0100 (CET)
Received: from localhost ([::1]:32968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzwFK-0001JH-T4
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvQh-0002sd-U8; Wed, 22 Dec 2021 01:48:52 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:54979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvQf-0006WT-Az; Wed, 22 Dec 2021 01:48:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8FA4D214C9;
 Wed, 22 Dec 2021 06:48:46 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:48:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0042530695c-1621-4f08-8168-82cbea46d576,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e36c581b-57b3-a9e1-7540-6be737075510@kaod.org>
Date: Wed, 22 Dec 2021 07:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 04/12] target/ppc: powerpc_excp: Stop passing excp_model
 around
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-5-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211220181903.3456898-5-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ae45b1ca-ade6-4ff1-aed6-55d6633f257c
X-Ovh-Tracer-Id: 14577589046719908771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/20/21 19:18, Fabiano Rosas wrote:
> We can just access it directly in powerpc_excp.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/excp_helper.c | 43 ++++++++++++++++++++--------------------
>   1 file changed, 21 insertions(+), 22 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7bdc1e8410..45641f6d1d 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -293,10 +293,11 @@ static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
>    * Note that this function should be greatly optimized when called
>    * with a constant excp, from ppc_hw_interrupt
>    */
> -static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
> +static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
> +    int excp_model = env->excp_model;
>       target_ulong msr, new_msr, vector;
>       int srr0, srr1, lev = -1;
>   
> @@ -878,9 +879,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>   void ppc_cpu_do_interrupt(CPUState *cs)
>   {
>       PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
>   
> -    powerpc_excp(cpu, env->excp_model, cs->exception_index);
> +    powerpc_excp(cpu, cs->exception_index);
>   }
>   
>   static void ppc_hw_interrupt(CPUPPCState *env)
> @@ -891,20 +891,20 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>       /* External reset */
>       if (env->pending_interrupts & (1 << PPC_INTERRUPT_RESET)) {
>           env->pending_interrupts &= ~(1 << PPC_INTERRUPT_RESET);
> -        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
> +        powerpc_excp(cpu, POWERPC_EXCP_RESET);
>           return;
>       }
>       /* Machine check exception */
>       if (env->pending_interrupts & (1 << PPC_INTERRUPT_MCK)) {
>           env->pending_interrupts &= ~(1 << PPC_INTERRUPT_MCK);
> -        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_MCHECK);
> +        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
>           return;
>       }
>   #if 0 /* TODO */
>       /* External debug exception */
>       if (env->pending_interrupts & (1 << PPC_INTERRUPT_DEBUG)) {
>           env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DEBUG);
> -        powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DEBUG);
> +        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
>           return;
>       }
>   #endif
> @@ -924,7 +924,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>           if ((async_deliver || msr_hv == 0) && hdice) {
>               /* HDEC clears on delivery */
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HDECR);
> +            powerpc_excp(cpu, POWERPC_EXCP_HDECR);
>               return;
>           }
>       }
> @@ -934,7 +934,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>           /* LPCR will be clear when not supported so this will work */
>           bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
>           if ((async_deliver || msr_hv == 0) && hvice) {
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_HVIRT);
> +            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
>               return;
>           }
>       }
> @@ -946,14 +946,14 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>           /* HEIC blocks delivery to the hypervisor */
>           if ((async_deliver && !(heic && msr_hv && !msr_pr)) ||
>               (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_EXTERNAL);
> +            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
>               return;
>           }
>       }
>       if (msr_ce != 0) {
>           /* External critical interrupt */
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_CEXT)) {
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_CRITICAL);
> +            powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
>               return;
>           }
>       }
> @@ -961,24 +961,24 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>           /* Watchdog timer on embedded PowerPC */
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_WDT)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_WDT);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_WDT);
> +            powerpc_excp(cpu, POWERPC_EXCP_WDT);
>               return;
>           }
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_CDOORBELL)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_CDOORBELL);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORCI);
> +            powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
>               return;
>           }
>           /* Fixed interval timer on embedded PowerPC */
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_FIT)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_FIT);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_FIT);
> +            powerpc_excp(cpu, POWERPC_EXCP_FIT);
>               return;
>           }
>           /* Programmable interval timer on embedded PowerPC */
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_PIT)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PIT);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PIT);
> +            powerpc_excp(cpu, POWERPC_EXCP_PIT);
>               return;
>           }
>           /* Decrementer exception */
> @@ -986,32 +986,32 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>               if (ppc_decr_clear_on_delivery(env)) {
>                   env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DECR);
>               }
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DECR);
> +            powerpc_excp(cpu, POWERPC_EXCP_DECR);
>               return;
>           }
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_DOORBELL)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_DOORBELL);
>               if (is_book3s_arch2x(env)) {
> -                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR);
> +                powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
>               } else {
> -                powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_DOORI);
> +                powerpc_excp(cpu, POWERPC_EXCP_DOORI);
>               }
>               return;
>           }
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDOORBELL)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDOORBELL);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_SDOOR_HV);
> +            powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
>               return;
>           }
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_PERFM)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_PERFM);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_PERFM);
> +            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
>               return;
>           }
>           /* Thermal interrupt */
>           if (env->pending_interrupts & (1 << PPC_INTERRUPT_THERM)) {
>               env->pending_interrupts &= ~(1 << PPC_INTERRUPT_THERM);
> -            powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_THERM);
> +            powerpc_excp(cpu, POWERPC_EXCP_THERM);
>               return;
>           }
>       }
> @@ -1036,9 +1036,8 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>   void ppc_cpu_do_system_reset(CPUState *cs)
>   {
>       PowerPCCPU *cpu = POWERPC_CPU(cs);
> -    CPUPPCState *env = &cpu->env;
>   
> -    powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
> +    powerpc_excp(cpu, POWERPC_EXCP_RESET);
>   }
>   
>   void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
> 


