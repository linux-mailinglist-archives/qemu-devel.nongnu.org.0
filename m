Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69524B6935
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:26:36 +0100 (CET)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJv2Z-0002Xk-J7
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:26:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJuh8-0002J5-VJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:04:27 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nJuh5-0004od-4X
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 05:04:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E9E84DFF091A;
 Tue, 15 Feb 2022 11:04:09 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 11:04:09 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004cb9c9fe6-9f0a-45c2-b482-e88c159553ae,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5c3d6110-77bf-d3ce-9990-c5ebea01b077@kaod.org>
Date: Tue, 15 Feb 2022 11:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 7/9] target/ppc: Add powerpc_reset_excp_state helper
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-8-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-8-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 28ab0d14-337a-4112-8be3-f3f5d17a952d
X-Ovh-Tracer-Id: 8834092147997445088
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehfrghrohhsrghssehlihhnuhigrdhisghmrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 04:16, Nicholas Piggin wrote:
> This moves the logic to reset the QEMU exception state into its own
> function.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/excp_helper.c | 41 ++++++++++++++++++++--------------------
>   1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 6b6ec71bc2..778eb4f3b0 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -360,12 +360,20 @@ static void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp, target_ulong msr,
>   }
>   #endif
>   
> -static void powerpc_set_excp_state(PowerPCCPU *cpu,
> -                                          target_ulong vector, target_ulong msr)
> +static void powerpc_reset_excp_state(PowerPCCPU *cpu)
>   {
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
>   
> +    /* Reset exception state */
> +    cs->exception_index = POWERPC_EXCP_NONE;
> +    env->error_code = 0;
> +}
> +
> +static void powerpc_set_excp_state(PowerPCCPU *cpu, target_ulong vector, target_ulong msr)
> +{
> +    CPUPPCState *env = &cpu->env;
> +
>       assert((msr & env->msr_mask) == msr);
>   
>       /*
> @@ -376,21 +384,20 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
>        * will prevent setting of the HV bit which some exceptions might need
>        * to do.
>        */
> +    env->nip = vector;
>       env->msr = msr;
>       hreg_compute_hflags(env);
> -    env->nip = vector;
> -    /* Reset exception state */
> -    cs->exception_index = POWERPC_EXCP_NONE;
> -    env->error_code = 0;
>   
> -    /* Reset the reservation */
> -    env->reserve_addr = -1;
> +    powerpc_reset_excp_state(cpu);
>   
>       /*
>        * Any interrupt is context synchronizing, check if TCG TLB needs
>        * a delayed flush on ppc64
>        */
>       check_tlb_flush(env, false);
> +
> +    /* Reset the reservation */
> +    env->reserve_addr = -1;
>   }
>   
>   static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
> @@ -471,8 +478,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>           case POWERPC_EXCP_FP:
>               if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
>                   trace_ppc_excp_fp_ignore();
> -                cs->exception_index = POWERPC_EXCP_NONE;
> -                env->error_code = 0;
> +                powerpc_reset_excp_state(cpu);
>                   return;
>               }
>               env->spr[SPR_40x_ESR] = ESR_FP;
> @@ -609,8 +615,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>           case POWERPC_EXCP_FP:
>               if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
>                   trace_ppc_excp_fp_ignore();
> -                cs->exception_index = POWERPC_EXCP_NONE;
> -                env->error_code = 0;
> +                powerpc_reset_excp_state(cpu);
>                   return;
>               }
>   
> @@ -783,8 +788,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
>           case POWERPC_EXCP_FP:
>               if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
>                   trace_ppc_excp_fp_ignore();
> -                cs->exception_index = POWERPC_EXCP_NONE;
> -                env->error_code = 0;
> +                powerpc_reset_excp_state(cpu);
>                   return;
>               }
>   
> @@ -969,8 +973,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
>           case POWERPC_EXCP_FP:
>               if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
>                   trace_ppc_excp_fp_ignore();
> -                cs->exception_index = POWERPC_EXCP_NONE;
> -                env->error_code = 0;
> +                powerpc_reset_excp_state(cpu);
>                   return;
>               }
>   
> @@ -1168,8 +1171,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>           case POWERPC_EXCP_FP:
>               if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
>                   trace_ppc_excp_fp_ignore();
> -                cs->exception_index = POWERPC_EXCP_NONE;
> -                env->error_code = 0;
> +                powerpc_reset_excp_state(cpu);
>                   return;
>               }
>   
> @@ -1406,8 +1408,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>           case POWERPC_EXCP_FP:
>               if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
>                   trace_ppc_excp_fp_ignore();
> -                cs->exception_index = POWERPC_EXCP_NONE;
> -                env->error_code = 0;
> +                powerpc_reset_excp_state(cpu);
>                   return;
>               }
>   
> 


