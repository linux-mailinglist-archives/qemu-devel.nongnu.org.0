Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A922F4677C9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:01:24 +0100 (CET)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8Bn-0008Hn-Nl
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:01:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt87T-0001lD-A7
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:56:55 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:50093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt87Q-0002xU-Tt
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:56:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 293E3223C1;
 Fri,  3 Dec 2021 12:56:47 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 13:56:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001d92cfa68-a800-459a-a977-2c4c9dfac316,
 327B7BE4A87BAA89609EF58271276ABDC6C19EF5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4485dc40-65b9-380f-49b4-517bd87c4bc4@kaod.org>
Date: Fri, 3 Dec 2021 13:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 2/4] target/ppc: Disable unused facilities in the
 e600 CPU
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
 <20211130230123.781844-3-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211130230123.781844-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8b5297e4-6cd0-4acf-9170-8fc532451ff3
X-Ovh-Tracer-Id: 1445374008393829167
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, openbios@openbios.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 00:01, Fabiano Rosas wrote:
> The e600 CPU is a successor of the 7448 and like all the 7450s CPUs,
> it has an optional software TLB feature.
> 
> We have determined that there is no OS software support for the 7450
> software TLB available these days. See the previous commit for more
> information.
> 
> This patch disables the SPRs and instructions related to software TLB
> from the e600 CPU.
> 
> No functional change intended. These facilities should be used by the
> OS in interrupt handlers for interrupts that QEMU never generates.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/cpu_init.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 509df35d09..962acf295f 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2537,9 +2537,6 @@ static void init_excp_7450(CPUPPCState *env)
>       env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
>       env->excp_vectors[POWERPC_EXCP_PERFM]    = 0x00000F00;
>       env->excp_vectors[POWERPC_EXCP_VPU]      = 0x00000F20;
> -    env->excp_vectors[POWERPC_EXCP_IFTLB]    = 0x00001000;
> -    env->excp_vectors[POWERPC_EXCP_DLTLB]    = 0x00001100;
> -    env->excp_vectors[POWERPC_EXCP_DSTLB]    = 0x00001200;
>       env->excp_vectors[POWERPC_EXCP_IABR]     = 0x00001300;
>       env->excp_vectors[POWERPC_EXCP_SMI]      = 0x00001400;
>       env->excp_vectors[POWERPC_EXCP_VPUA]     = 0x00001600;
> @@ -6643,7 +6640,6 @@ static void init_proc_e600(CPUPPCState *env)
>       /* Memory management */
>       register_low_BATs(env);
>       register_high_BATs(env);
> -    register_74xx_soft_tlb(env, 128, 2);
>       init_excp_7450(env);
>       env->dcache_line_size = 32;
>       env->icache_line_size = 32;
> @@ -6667,7 +6663,7 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
>                          PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                          PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
> -                       PPC_MEM_TLBIA | PPC_74xx_TLB |
> +                       PPC_MEM_TLBIA |
>                          PPC_SEGMENT | PPC_EXTERN |
>                          PPC_ALTIVEC;
>       pcc->insns_flags2 = PPC_NONE;
> 


