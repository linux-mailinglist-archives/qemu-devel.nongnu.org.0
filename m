Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA31472EA1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 15:15:05 +0100 (CET)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwm6a-0006ll-7Z
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 09:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlw6-0003To-3j
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:04:14 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mwlw2-0007u1-I4
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:04:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C97E0D19E8A0;
 Mon, 13 Dec 2021 15:04:07 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 13 Dec
 2021 15:04:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002c5237bf0-3b34-4ae2-89a9-6ebaa6258570,
 B1BC92F71A951DCA4C6DA1690085DBFA0C2EFA12) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f79d58b2-ad6d-2f85-b0d5-3d9db65f07dd@kaod.org>
Date: Mon, 13 Dec 2021 15:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211213133542.2608540-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 381d2c6d-a85e-4440-9b69-94d0fb3980d4
X-Ovh-Tracer-Id: 5969239832182098726
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefieevfeffhfehgffggfdvjeevieeggfetvdehteegveeutdejjeejtefghfekhfenucffohhmrghinhepghhnuhdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmrghrihhosehlohgtrghtihdrihht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.093,
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
Cc: mario@locati.it, danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 14:35, Fabiano Rosas wrote:
> When Altivec support was added to the e6500 kernel in 2012[1], the
> QEMU code was not changed, so we don't register the VPU/VPUA
> exceptions for the e6500:
> 
>    qemu: fatal: Raised an exception without defined vector 73
> 
> Note that the error message says 73, instead of 32, which is the IVOR
> for VPU. This is because QEMU knows only knows about the VPU interrupt
> for the 7400s. In theory, we should not be raising _that_ VPU
> interrupt, but instead another one specific for the e6500.
> 
> We unfortunately cannot register e6500-specific VPU/VPUA interrupts
> because the SPEU/EFPDI interrupts also use IVOR32/33. These are
> present only in the e500v1/2 versions. From the user manual:
> 
> e500v1, e500v2: only SPEU/EFPDI/EFPRI
> e500mc, e5500:  no SPEU/EFPDI/EFPRI/VPU/VPUA
> e6500:          only VPU/VPUA
> 
> So I'm leaving IVOR32/33 as SPEU/EFPDI, but altering the dispatch code
> to convert the VPU #73 to a #32 when we're in the e6500. Since the
> handling for SPEU and VPU is the same this is the only change that's
> needed. The EFPDI is not implemented and will cause an abort. I don't
> think it worth it changing the error message to take VPUA into
> consideration, so I'm not changing anything there.
> 
> This bug was discussed in the thread:
> https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg00222.html
> 
> 1- https://git.kernel.org/torvalds/c/cd66cc2ee52
> 
> Reported-by: <mario@locati.it>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

One comment,

> ---
>   target/ppc/cpu_init.c    |  6 ++++++
>   target/ppc/excp_helper.c | 12 +++++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6695985e9b..d8efcb24ed 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2273,8 +2273,14 @@ static void init_excp_e200(CPUPPCState *env, target_ulong ivpr_mask)
>       env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00000000;
>       env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00000000;
>       env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00000000;
> +    /*
> +     * These two are the same IVOR as POWERPC_EXCP_VPU and
> +     * POWERPC_EXCP_VPUA. We deal with that when dispatching at
> +     * powerpc_excp().
> +     */
>       env->excp_vectors[POWERPC_EXCP_SPEU]     = 0x00000000;
>       env->excp_vectors[POWERPC_EXCP_EFPDI]    = 0x00000000;
> +
>       env->excp_vectors[POWERPC_EXCP_EFPRI]    = 0x00000000;
>       env->ivor_mask = 0x0000FFF7UL;
>       env->ivpr_mask = ivpr_mask;
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 17607adbe4..7bb170f440 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -344,6 +344,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>           excp = POWERPC_EXCP_PROGRAM;
>       }
>   
> +#ifdef TARGET_PPC64
> +    /*
> +     * SPEU and VPU share the same IVOR but they exist in different
> +     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
> +     */
> +    if (excp_model == POWERPC_EXCP_BOOKE && excp == POWERPC_EXCP_VPU) {
> +        excp = POWERPC_EXCP_SPEU;
> +    }
> +#endif

I am not in favor of changing powerpc_excp() but I know you have
plans for a major clean up :)

Thanks,

C.


>       switch (excp) {
>       case POWERPC_EXCP_NONE:
>           /* Should never happen */
> @@ -569,7 +579,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>               cpu_abort(cs, "Debug exception triggered on unsupported model\n");
>           }
>           break;
> -    case POWERPC_EXCP_SPEU:      /* SPE/embedded floating-point unavailable  */
> +    case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
>           env->spr[SPR_BOOKE_ESR] = ESR_SPV;
>           break;
>       case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
> 


