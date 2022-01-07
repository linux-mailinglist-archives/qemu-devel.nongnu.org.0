Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32894873BF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 08:49:37 +0100 (CET)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5k0F-0002iF-LA
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 02:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5jwF-0000bn-Sr
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:45:28 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5jwD-00017N-HG
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 02:45:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.174])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3C5EA22B5D;
 Fri,  7 Jan 2022 07:45:22 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 7 Jan
 2022 08:45:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0021b7c78c2-6a3c-48a3-9f93-587fdf864d44,
 E4C71DB801AC3DC5DDDF9E65DF3DCE2B5FFF0C93) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ae56a714-4626-f218-60b1-f163f0920c1e@kaod.org>
Date: Fri, 7 Jan 2022 08:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, <qemu-ppc@nongnu.org>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220107072423.2278113-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cff65d20-3bbd-4491-9ee1-357383fc174f
X-Ovh-Tracer-Id: 17262860322700626793
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudegtddguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 08:24, Alexey Kardashevskiy wrote:
> "PowerPC Processor binding to IEEE 1275" says in
> "8.2.1. Initial Register Values" that the initial state is defined as
> 32bit so do it for both SLOF and VOF.
> 
> This should not cause behavioral change as SLOF switches to 64bit very
> early anyway. As nothing enforces LE anywhere, this drops it for VOF.
> 
> The goal is to make VOF work with TCG as otherwise it barfs with
> qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   hw/ppc/spapr_cpu_core.c | 5 +++++
>   hw/ppc/spapr_vof.c      | 2 --
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index a57ba70a8781..a781e97f8d1d 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -37,6 +37,11 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
>   
>       cpu_reset(cs);
>   
> +    /*
> +     * "PowerPC Processor binding to IEEE 1275" defines the initial MSR state
> +     * as 32bit (MSR_SF=0) in "8.2.1. Initial Register Values".
> +     */

Indeed but this seems to contradict 8b9f2118ca40 ("ppc64: set MSR_SF bit").

Laurent, would you remember the reason for forcing 64bit ? It's been a while
since.

Thanks,

C.


> +    env->msr &= ~(1ULL << MSR_SF);
>       env->spr[SPR_HIOR] = 0;
>   
>       lpcr = env->spr[SPR_LPCR];
> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> index 40ce8fe0037c..a33f940c32bb 100644
> --- a/hw/ppc/spapr_vof.c
> +++ b/hw/ppc/spapr_vof.c
> @@ -88,8 +88,6 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp)
>       spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>                                 stack_ptr, spapr->initrd_base,
>                                 spapr->initrd_size);
> -    /* VOF is 32bit BE so enforce MSR here */
> -    first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
>   
>       /*
>        * At this point the expected allocation map is:
> 


