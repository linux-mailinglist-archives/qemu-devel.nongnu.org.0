Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392947CD9C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:38:23 +0100 (CET)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzwCb-00054c-SN
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvOx-0002Jd-6D
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:47:12 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:59647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzvOs-0006Ar-1l
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 01:47:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5270821726;
 Wed, 22 Dec 2021 06:46:55 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 07:46:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0050799a972-c471-4d2d-a83a-0abbce715744,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <48306043-7a2f-58a0-b645-46765936c27d@kaod.org>
Date: Wed, 22 Dec 2021 07:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 01/12] target/ppc: powerpc_excp: Set alternate SRRs
 directly
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
 <20211220181903.3456898-2-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211220181903.3456898-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 22d2182a-f325-4476-9a6c-d68e13ebae15
X-Ovh-Tracer-Id: 14546345323338566563
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddthedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> There are currently only two interrupts that use alternate SRRs, so
> let them write to them directly during the setup code.
> 
> No functional change intented.

intended.

> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
     

> ---
>   target/ppc/excp_helper.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index f90e616aac..8b9c6bc5a8 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -298,7 +298,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>       CPUState *cs = CPU(cpu);
>       CPUPPCState *env = &cpu->env;
>       target_ulong msr, new_msr, vector;
> -    int srr0, srr1, asrr0, asrr1, lev = -1;
> +    int srr0, srr1, lev = -1;
>   
>       qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
>                     " => %08x (%02x)\n", env->nip, excp, env->error_code);
> @@ -319,8 +319,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>       /* target registers */
>       srr0 = SPR_SRR0;
>       srr1 = SPR_SRR1;
> -    asrr0 = -1;
> -    asrr1 = -1;
>   
>       /*
>        * check for special resume at 0x100 from doze/nap/sleep/winkle on
> @@ -410,8 +408,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>               /* FIXME: choose one or the other based on CPU type */
>               srr0 = SPR_BOOKE_MCSRR0;
>               srr1 = SPR_BOOKE_MCSRR1;
> -            asrr0 = SPR_BOOKE_CSRR0;
> -            asrr1 = SPR_BOOKE_CSRR1;
> +
> +            env->spr[SPR_BOOKE_CSRR0] = env->nip;
> +            env->spr[SPR_BOOKE_CSRR1] = msr;
>               break;
>           default:
>               break;
> @@ -570,8 +569,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>               /* FIXME: choose one or the other based on CPU type */
>               srr0 = SPR_BOOKE_DSRR0;
>               srr1 = SPR_BOOKE_DSRR1;
> -            asrr0 = SPR_BOOKE_CSRR0;
> -            asrr1 = SPR_BOOKE_CSRR1;
> +
> +            env->spr[SPR_BOOKE_CSRR0] = env->nip;
> +            env->spr[SPR_BOOKE_CSRR1] = msr;
> +
>               /* DBSR already modified by caller */
>           } else {
>               cpu_abort(cs, "Debug exception triggered on unsupported model\n");
> @@ -838,14 +839,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>   
>       vector |= env->excp_prefix;
>   
> -    /* If any alternate SRR register are defined, duplicate saved values */
> -    if (asrr0 != -1) {
> -        env->spr[asrr0] = env->nip;
> -    }
> -    if (asrr1 != -1) {
> -        env->spr[asrr1] = msr;
> -    }
> -
>   #if defined(TARGET_PPC64)
>       if (excp_model == POWERPC_EXCP_BOOKE) {
>           if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
> 


