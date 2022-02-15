Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D494B7284
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:42:19 +0100 (CET)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0u8-0002zl-Lz
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK0pe-0008VW-FG
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:37:38 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK0pZ-0003No-Sn
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:37:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CCFE622232;
 Tue, 15 Feb 2022 16:37:22 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 17:37:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005ee07b9db-a923-4acf-a75f-2779fa3aa80a,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e2b494ec-59aa-d280-8621-0a1df20052a9@kaod.org>
Date: Tue, 15 Feb 2022 17:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220211183354.563602-1-danielhb413@gmail.com>
 <20220211183354.563602-5-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220211183354.563602-5-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2cd53a92-892d-499e-a708-bffc3b73a7c5
X-Ovh-Tracer-Id: 15474931272191806432
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
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
> This patch adds the EBB exception support that are triggered by
> Performance Monitor alerts. This happens when a Performance Monitor
> alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.
> 
> fire_PMC_interrupt() will execute a new ebb_perfm_excp() helper that
> will check for MMCR0_EBE, BESCR_PME and BESCR_GE bits. If all bits are
> set, do_ebb() will attempt to trigger a PERFM EBB event.
> 
> If the EBB facility is enabled in both FSCR and HFSCR we consider that
> the EBB is valid and set BESCR_PMEO. After that, if we're running in
> problem state, fire a POWERPC_EXCP_PERM_EBB immediately. Otherwise we'll
> queue a PPC_INTERRUPT_EBB.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Looks good. One comment below.


> ---
>   target/ppc/excp_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
>   target/ppc/helper.h      |  1 +
>   target/ppc/power8-pmu.c  |  3 +--
>   3 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index ad40a0f8e6..0c031e67b1 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1948,6 +1948,54 @@ void helper_rfebb(CPUPPCState *env, target_ulong s)
>           env->spr[SPR_BESCR] &= ~BESCR_GE;
>       }
>   }
> +
> +/*
> + * Triggers or queues an 'ebb_excp' EBB exception. All checks
> + * but FSCR, HFSCR and msr_pr must be done beforehand.
> + *
> + * PowerISA v3.1 isn't clear about whether an EBB should be
> + * postponed or cancelled if the EBB facility is unavailable.
> + * Our assumption here is that the EBB is cancelled if both
> + * FSCR and HFSCR EBB facilities aren't available.
> + */
> +static void do_ebb(CPUPPCState *env, int ebb_excp)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +    CPUState *cs = CPU(cpu);
> +
> +    /*
> +     * FSCR_EBB and FSCR_IC_EBB are the same bits used with
> +     * HFSCR.
> +     */
> +    helper_fscr_facility_check(env, FSCR_EBB, 0, FSCR_IC_EBB);
> +    helper_hfscr_facility_check(env, FSCR_EBB, "EBB", FSCR_IC_EBB);
> +
> +    if (ebb_excp == POWERPC_EXCP_PERFM_EBB) {
> +        env->spr[SPR_BESCR] |= BESCR_PMEO;
> +    } else if (ebb_excp == POWERPC_EXCP_EXTERNAL_EBB) {
> +        env->spr[SPR_BESCR] |= BESCR_EEO;
> +    }
> +
> +    if (msr_pr == 1) {
> +        powerpc_excp(cpu, ebb_excp);
> +    } else {
> +        env->pending_interrupts |= 1 << PPC_INTERRUPT_EBB;
> +        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
> +    }

Don't you need to lock the iothread ?

Thanks,

C.

> +}
> +
> +void helper_ebb_perfm_excp(CPUPPCState *env)
> +{
> +    bool perfm_ebb_enabled = env->spr[SPR_POWER_MMCR0] & MMCR0_EBE &&
> +                             env->spr[SPR_BESCR] & BESCR_PME &&
> +                             env->spr[SPR_BESCR] & BESCR_GE;
> +
> +    if (!perfm_ebb_enabled) {
> +        return;
> +    }
> +
> +    do_ebb(env, POWERPC_EXCP_PERFM_EBB);
> +}
>   #endif
>   
>   /*****************************************************************************/
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index f2e5060910..adc31235a8 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -19,6 +19,7 @@ DEF_HELPER_1(rfid, void, env)
>   DEF_HELPER_1(rfscv, void, env)
>   DEF_HELPER_1(hrfid, void, env)
>   DEF_HELPER_2(rfebb, void, env, tl)
> +DEF_HELPER_1(ebb_perfm_excp, void, env)
>   DEF_HELPER_2(store_lpcr, void, env, tl)
>   DEF_HELPER_2(store_pcr, void, env, tl)
>   DEF_HELPER_2(store_mmcr0, void, env, tl)
> diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
> index d245663158..38e1ecb782 100644
> --- a/target/ppc/power8-pmu.c
> +++ b/target/ppc/power8-pmu.c
> @@ -307,8 +307,7 @@ static void fire_PMC_interrupt(PowerPCCPU *cpu)
>           env->spr[SPR_POWER_MMCR0] |= MMCR0_PMAO;
>       }
>   
> -    /* PMC interrupt not implemented yet */
> -    return;
> +    helper_ebb_perfm_excp(env);
>   }
>   
>   /* This helper assumes that the PMC is running. */


