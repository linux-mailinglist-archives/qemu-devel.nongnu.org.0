Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB283483F3E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:35:05 +0100 (CET)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gDg-0000nw-FI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:35:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4gCK-0007qu-Mk; Tue, 04 Jan 2022 04:33:40 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:46855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4gCI-0003Ll-MI; Tue, 04 Jan 2022 04:33:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AAF25D569F88;
 Tue,  4 Jan 2022 10:33:35 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 10:33:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001543c2275-ae05-43e0-a4b3-88bfc376c4c0,
 8E52E0D80BCA28EB10B868BCDB857CC95652C900) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <78d37b76-3118-8d54-4d0a-9946a14a91e5@kaod.org>
Date: Tue, 4 Jan 2022 10:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/9] target/ppc: powerpc_excp: Keep 60x soft MMU logs
 active
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
 <20220103220746.3916246-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220103220746.3916246-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8ebe01f1-563c-46ae-af15-fc693c340ccd
X-Ovh-Tracer-Id: 1472395605727742758
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 23:07, Fabiano Rosas wrote:
> Remove the compile time definition and make the logging be controlled
> by the `-d mmu` option in the cmdline.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/excp_helper.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 002a42261b..4769abfb0c 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -30,8 +30,6 @@
>   #include "exec/cpu_ldst.h"
>   #endif
>   
> -/* #define DEBUG_SOFTWARE_TLB */
> -
>   /*****************************************************************************/
>   /* Exception processing */
>   #if !defined(CONFIG_USER_ONLY)
> @@ -65,7 +63,6 @@ static inline void dump_hcall(CPUPPCState *env)
>   
>   static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
>   {
> -#if defined(DEBUG_SOFTWARE_TLB)
>       const char *es;
>       target_ulong *miss, *cmp;
>       int en;
> @@ -89,12 +86,12 @@ static void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp)
>           miss = &env->spr[SPR_DMISS];
>           cmp = &env->spr[SPR_DCMP];
>       }
> -    qemu_log("6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -             TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> -             TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> -             env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> -             env->error_code);
> -#endif
> +
> +    qemu_log_mask(CPU_LOG_MMU, "6xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> +                  TARGET_FMT_lx " H1 " TARGET_FMT_lx " H2 "
> +                  TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> +                  env->spr[SPR_HASH1], env->spr[SPR_HASH2],
> +                  env->error_code);
>   }
>   
>   
> 


