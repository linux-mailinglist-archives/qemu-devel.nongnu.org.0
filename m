Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B2C33CF9A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:21:11 +0100 (CET)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4ww-00066L-5W
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4tA-0000bE-IG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:17:16 -0400
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:46162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lM4t8-0001lC-Cg
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:17:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 7EF04273880;
 Tue, 16 Mar 2021 09:17:12 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 16 Mar
 2021 09:17:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057a2b3262-2089-425f-85ca-c50f8100f625,
 F4745E3E32A08DF6AE8813652EB4480BB0CFD8A0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4 08/17] target/ppc: Reduce env->hflags to uint32_t
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ae24d98f-c722-6a7a-1c8e-d07ba86e4a07@kaod.org>
Date: Tue, 16 Mar 2021 09:17:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210315184615.1985590-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ca819412-3e65-4f91-983f-c6b0488331ce
X-Ovh-Tracer-Id: 7604327970820754400
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 7:46 PM, Richard Henderson wrote:
> It will be stored in tb->flags, which is also uint32_t,
> so let's use the correct size.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  target/ppc/cpu.h         | 4 ++--
>  target/ppc/misc_helper.c | 2 +-
>  target/ppc/translate.c   | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 39f35b570c..2abaf56869 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1128,8 +1128,8 @@ struct CPUPPCState {
>      bool resume_as_sreset;
>  #endif
>  
> -    /* These resources are used only in QEMU core */
> -    target_ulong hflags;
> +    /* These resources are used only in TCG */
> +    uint32_t hflags;
>      target_ulong hflags_compat_nmsr; /* for migration compatibility */
>      int immu_idx;     /* precomputed MMU index to speed up insn accesses */
>      int dmmu_idx;     /* precomputed MMU index to speed up data accesses */
> diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
> index 63e3147eb4..b04b4d7c6e 100644
> --- a/target/ppc/misc_helper.c
> +++ b/target/ppc/misc_helper.c
> @@ -199,7 +199,7 @@ void helper_store_hid0_601(CPUPPCState *env, target_ulong val)
>      if ((val ^ hid0) & 0x00000008) {
>          /* Change current endianness */
>          hreg_compute_hflags(env);
> -        qemu_log("%s: set endianness to %c => " TARGET_FMT_lx "\n", __func__,
> +        qemu_log("%s: set endianness to %c => %08x\n", __func__,
>                   val & 0x8 ? 'l' : 'b', env->hflags);
>      }
>  }
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a9325a12e5..a85b890bb0 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7657,7 +7657,7 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>                   env->nip, env->lr, env->ctr, cpu_read_xer(env),
>                   cs->cpu_index);
>      qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
> -                 TARGET_FMT_lx " iidx %d didx %d\n",
> +                 "%08x iidx %d didx %d\n",
>                   env->msr, env->spr[SPR_HID0],
>                   env->hflags, env->immu_idx, env->dmmu_idx);
>  #if !defined(NO_TIMER_DUMP)
> 


