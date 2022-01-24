Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA22497C52
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 10:45:04 +0100 (CET)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBvuJ-0004Ng-DL
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 04:45:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nBvsr-0003W8-Ac
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:43:33 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:58983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nBvso-0001Dk-EP
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 04:43:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AF3D4D9996F7;
 Mon, 24 Jan 2022 10:43:26 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 24 Jan
 2022 10:43:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0055dbe8279-edc9-478f-aa19-2d0c9d30b38f,
 8B4FF7E59EB7D736B5D3E090BD3F43F29F49559A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <83bb314b-fcfb-a19a-25e2-5679b4320056@kaod.org>
Date: Mon, 24 Jan 2022 10:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Fix test on mmu_model in
 hreg_compute_hflags_value()
Content-Language: en-US
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220124081609.3672341-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220124081609.3672341-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b2143641-5837-4ac0-a6b2-84869836bdc7
X-Ovh-Tracer-Id: 8412161156073360166
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdeigddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuveelvdejteegteefieevfeetffefvddvieekteevleefgeelgfeutedvfedvfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 09:16, Cédric Le Goater wrote:
> POWERPC_MMU_BOOKE is not a mask and should not be tested with a
> bitwise AND operator.
> 
> It went unnoticed because it only impacts the 601 CPU implementation
> for which we don't have a known firmware image.

I forgot to change that. There is one here :

   https://github.com/artyom-tarasenko/openfirmware

image :

   https://github.com/artyom-tarasenko/openfirmware/releases/download/40p-20190413/q40pofw-serial.rom

Thanks,

C.

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   target/ppc/helper_regs.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 7dca585dddeb..5b12cb03c961 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -156,7 +156,8 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>        */
>       unsigned immu_idx, dmmu_idx;
>       dmmu_idx = msr & (1 << MSR_PR) ? 0 : 1;
> -    if (env->mmu_model & POWERPC_MMU_BOOKE) {
> +    if (env->mmu_model == POWERPC_MMU_BOOKE ||
> +        env->mmu_model == POWERPC_MMU_BOOKE206) {
>           dmmu_idx |= msr & (1 << MSR_GS) ? 4 : 0;
>           immu_idx = dmmu_idx;
>           immu_idx |= msr & (1 << MSR_IS) ? 2 : 0;
> @@ -237,7 +238,8 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
>           ((value >> MSR_DR) & 1) != msr_dr) {
>           cpu_interrupt_exittb(cs);
>       }
> -    if ((env->mmu_model & POWERPC_MMU_BOOKE) &&
> +    if ((env->mmu_model == POWERPC_MMU_BOOKE ||
> +         env->mmu_model == POWERPC_MMU_BOOKE206) &&
>           ((value >> MSR_GS) & 1) != msr_gs) {
>           cpu_interrupt_exittb(cs);
>       }
> 


