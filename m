Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3F47D634
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:03:35 +0100 (CET)
Received: from localhost ([::1]:51666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05xe-0004qt-JL
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:03:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n05uq-0002KB-Jk
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 13:00:48 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:37291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n05ul-0002hM-K5
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 13:00:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CA0CF20D33;
 Wed, 22 Dec 2021 18:00:17 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 19:00:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00662292580-663e-497c-b0cf-1b294c8aad2e,
 22B606D71DB07679CF58DDA73D3573C2F131FB73) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <1d29d20b-0c8c-68a8-cd5b-6d3780ea1b1f@kaod.org>
Date: Wed, 22 Dec 2021 19:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/8] target/ppc: introduce power8-pmu-insn-cnt.c.inc
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211222134520.587877-1-danielhb413@gmail.com>
 <20211222134520.587877-2-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211222134520.587877-2-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d6d29729-7524-4bc0-93b6-d2fe6b09ea44
X-Ovh-Tracer-Id: 7471753257958017955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtiedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 14:45, Daniel Henrique Barboza wrote:
> We're going to add a significant amount of TCG ops code for
> instruction counting, eventually getting rid of the 'helper_insn_inc'
> helper entirely.
> 
> Create a new file to avoid putting even more stuff on the already
> crowded target/ppc/translate.c.

We already have a power8-pmu-regs.c.inc file. Couldn't we use it or is it
a bad idea ?

Thanks,

C.


> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   target/ppc/power8-pmu-insn-cnt.c.inc | 54 ++++++++++++++++++++++++++++
>   target/ppc/translate.c               | 44 ++---------------------
>   2 files changed, 56 insertions(+), 42 deletions(-)
>   create mode 100644 target/ppc/power8-pmu-insn-cnt.c.inc
> 
> diff --git a/target/ppc/power8-pmu-insn-cnt.c.inc b/target/ppc/power8-pmu-insn-cnt.c.inc
> new file mode 100644
> index 0000000000..2febbcc27e
> --- /dev/null
> +++ b/target/ppc/power8-pmu-insn-cnt.c.inc
> @@ -0,0 +1,54 @@
> +/*
> + * PMU instruction counting for TCG IBM POWER chips
> + *
> + * Copyright IBM Corp. 2021
> + *
> + * Authors:
> + *  Daniel Henrique Barboza      <danielhb413@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#if defined(TARGET_PPC64)
> +static void pmu_count_insns(DisasContext *ctx)
> +{
> +    /*
> +     * Do not bother calling the helper if the PMU isn't counting
> +     * instructions.
> +     */
> +    if (!ctx->pmu_insn_cnt) {
> +        return;
> +    }
> +
> + #if !defined(CONFIG_USER_ONLY)
> +    /*
> +     * The PMU insns_inc() helper stops the internal PMU timer if a
> +     * counter overflows happens. In that case, if the guest is
> +     * running with icount and we do not handle it beforehand,
> +     * the helper can trigger a 'bad icount read'.
> +     */
> +    gen_icount_io_start(ctx);
> +
> +    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
> +#else
> +    /*
> +     * User mode can read (but not write) PMC5 and start/stop
> +     * the PMU via MMCR0_FC. In this case just increment
> +     * PMC5 with base.num_insns.
> +     */
> +    TCGv t0 = tcg_temp_new();
> +
> +    gen_load_spr(t0, SPR_POWER_PMC5);
> +    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
> +    gen_store_spr(SPR_POWER_PMC5, t0);
> +
> +    tcg_temp_free(t0);
> +#endif /* #if !defined(CONFIG_USER_ONLY) */
> +}
> +#else
> +static void pmu_count_insns(DisasContext *ctx)
> +{
> +    return;
> +}
> +#endif /* #if defined(TARGET_PPC64) */
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 114456148c..44773bc6cd 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -4183,48 +4183,8 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
>   #endif
>   }
>   
> -#if defined(TARGET_PPC64)
> -static void pmu_count_insns(DisasContext *ctx)
> -{
> -    /*
> -     * Do not bother calling the helper if the PMU isn't counting
> -     * instructions.
> -     */
> -    if (!ctx->pmu_insn_cnt) {
> -        return;
> -    }
> -
> - #if !defined(CONFIG_USER_ONLY)
> -    /*
> -     * The PMU insns_inc() helper stops the internal PMU timer if a
> -     * counter overflows happens. In that case, if the guest is
> -     * running with icount and we do not handle it beforehand,
> -     * the helper can trigger a 'bad icount read'.
> -     */
> -    gen_icount_io_start(ctx);
> -
> -    gen_helper_insns_inc(cpu_env, tcg_constant_i32(ctx->base.num_insns));
> -#else
> -    /*
> -     * User mode can read (but not write) PMC5 and start/stop
> -     * the PMU via MMCR0_FC. In this case just increment
> -     * PMC5 with base.num_insns.
> -     */
> -    TCGv t0 = tcg_temp_new();
> -
> -    gen_load_spr(t0, SPR_POWER_PMC5);
> -    tcg_gen_addi_tl(t0, t0, ctx->base.num_insns);
> -    gen_store_spr(SPR_POWER_PMC5, t0);
> -
> -    tcg_temp_free(t0);
> -#endif /* #if !defined(CONFIG_USER_ONLY) */
> -}
> -#else
> -static void pmu_count_insns(DisasContext *ctx)
> -{
> -    return;
> -}
> -#endif /* #if defined(TARGET_PPC64) */
> +/* For pmu_count_insns */
> +#include "target/ppc/power8-pmu-insn-cnt.c.inc"
>   
>   static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
>   {
> 


