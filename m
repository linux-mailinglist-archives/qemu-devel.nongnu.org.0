Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72D14677BC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:57:48 +0100 (CET)
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt88J-0001xj-BN
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:57:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt86m-00019Q-FM
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:56:12 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:46353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt86i-0002tX-V8
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:56:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 29CA821208;
 Fri,  3 Dec 2021 12:56:05 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 13:56:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002ed2689f4-b780-4edf-a3da-a1049aef36b9,
 327B7BE4A87BAA89609EF58271276ABDC6C19EF5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <87cce1e1-9869-f9c8-f0e3-a4063c8fdade@kaod.org>
Date: Fri, 3 Dec 2021 13:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 1/4] target/ppc: Disable software TLB for the 7450
 family
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
 <20211130230123.781844-2-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211130230123.781844-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aa5b365b-d6a1-4ac2-b7f9-9de2a93727b0
X-Ovh-Tracer-Id: 1433552060154415919
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelheegjeeuhefhtefggeejjeeiudelieffledtkefgfefgfffhfeekhfefgfekieenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthdpghhithhlrggsrdgtohhmpdhnohhnghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, openbios@openbios.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 00:01, Fabiano Rosas wrote:
> (Applies to 7441, 7445, 7450, 7451, 7455, 7457, 7447 and 7447a)*
> 
> We have since 2011 [1] been unable to run OpenBIOS in the 7450s and
> have not heard of any other software that is used with those CPUs in
> QEMU. A current discussion [2] shows that the 7450 software TLB is
> unsupported in Linux 5.15, FreeBSD 13, MacOS9, MacOSX and MorphOS
> 3.15. With no known support in firmware or OS, this means that no code
> for any of the 7450 CPUs is ever ran in QEMU.
> 
> Since the implementation in QEMU of the 7400 MMU is the same as the
> 7450, except for the software TLB vs. hardware TLB search, this patch
> changes all 7450 cpus to the 7400 MMU model. This has the practical
> effect of disabling the software TLB feature while keeping other
> aspects of address translation working as expected.
> 
> This allow us to run software on the 7450 family again.
> 
> *- note that the 7448 is currently aliased in QEMU for a 7400, so it
>     is unaffected by this change.

but it has a 7448 PVR. May be that's why we see an issue when
booting Linux.

  
> 1- https://bugs.launchpad.net/qemu/+bug/812398
>     https://gitlab.com/qemu-project/qemu/-/issues/86
> 
> 2- https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
>     message id: 20211119134431.406753-1-farosas@linux.ibm.com
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/cpu_init.c | 25 ++++++++++---------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6695985e9b..509df35d09 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5932,7 +5932,6 @@ static void init_proc_7440(CPUPPCState *env)
>                    0x00000000);
>       /* Memory management */
>       register_low_BATs(env);
> -    register_74xx_soft_tlb(env, 128, 2);
>       init_excp_7450(env);
>       env->dcache_line_size = 32;
>       env->icache_line_size = 32;
> @@ -5956,7 +5955,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
>                          PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                          PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
> -                       PPC_MEM_TLBIA | PPC_74xx_TLB |
> +                       PPC_MEM_TLBIA |
>                          PPC_SEGMENT | PPC_EXTERN |
>                          PPC_ALTIVEC;
>       pcc->msr_mask = (1ull << MSR_VR) |
> @@ -5976,7 +5975,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
>                       (1ull << MSR_PMM) |
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
> +    pcc->mmu_model = POWERPC_MMU_32B;
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> @@ -6067,7 +6066,6 @@ static void init_proc_7450(CPUPPCState *env)
>                    0x00000000);
>       /* Memory management */
>       register_low_BATs(env);
> -    register_74xx_soft_tlb(env, 128, 2);
>       init_excp_7450(env);
>       env->dcache_line_size = 32;
>       env->icache_line_size = 32;
> @@ -6091,7 +6089,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
>                          PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                          PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
> -                       PPC_MEM_TLBIA | PPC_74xx_TLB |
> +                       PPC_MEM_TLBIA |
>                          PPC_SEGMENT | PPC_EXTERN |
>                          PPC_ALTIVEC;
>       pcc->msr_mask = (1ull << MSR_VR) |
> @@ -6111,7 +6109,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
>                       (1ull << MSR_PMM) |
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
> +    pcc->mmu_model = POWERPC_MMU_32B;
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> @@ -6205,7 +6203,6 @@ static void init_proc_7445(CPUPPCState *env)
>       /* Memory management */
>       register_low_BATs(env);
>       register_high_BATs(env);
> -    register_74xx_soft_tlb(env, 128, 2);
>       init_excp_7450(env);
>       env->dcache_line_size = 32;
>       env->icache_line_size = 32;
> @@ -6229,7 +6226,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
>                          PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                          PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
> -                       PPC_MEM_TLBIA | PPC_74xx_TLB |
> +                       PPC_MEM_TLBIA |
>                          PPC_SEGMENT | PPC_EXTERN |
>                          PPC_ALTIVEC;
>       pcc->msr_mask = (1ull << MSR_VR) |
> @@ -6249,7 +6246,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
>                       (1ull << MSR_PMM) |
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
> +    pcc->mmu_model = POWERPC_MMU_32B;
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> @@ -6345,7 +6342,6 @@ static void init_proc_7455(CPUPPCState *env)
>       /* Memory management */
>       register_low_BATs(env);
>       register_high_BATs(env);
> -    register_74xx_soft_tlb(env, 128, 2);
>       init_excp_7450(env);
>       env->dcache_line_size = 32;
>       env->icache_line_size = 32;
> @@ -6369,7 +6365,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
>                          PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                          PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
> -                       PPC_MEM_TLBIA | PPC_74xx_TLB |
> +                       PPC_MEM_TLBIA |
>                          PPC_SEGMENT | PPC_EXTERN |
>                          PPC_ALTIVEC;
>       pcc->msr_mask = (1ull << MSR_VR) |
> @@ -6389,7 +6385,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
>                       (1ull << MSR_PMM) |
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
> +    pcc->mmu_model = POWERPC_MMU_32B;
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> @@ -6509,7 +6505,6 @@ static void init_proc_7457(CPUPPCState *env)
>       /* Memory management */
>       register_low_BATs(env);
>       register_high_BATs(env);
> -    register_74xx_soft_tlb(env, 128, 2);
>       init_excp_7450(env);
>       env->dcache_line_size = 32;
>       env->icache_line_size = 32;
> @@ -6533,7 +6528,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
>                          PPC_CACHE_DCBA | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                          PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
> -                       PPC_MEM_TLBIA | PPC_74xx_TLB |
> +                       PPC_MEM_TLBIA |
>                          PPC_SEGMENT | PPC_EXTERN |
>                          PPC_ALTIVEC;
>       pcc->msr_mask = (1ull << MSR_VR) |
> @@ -6553,7 +6548,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
>                       (1ull << MSR_PMM) |
>                       (1ull << MSR_RI) |
>                       (1ull << MSR_LE);
> -    pcc->mmu_model = POWERPC_MMU_SOFT_74xx;
> +    pcc->mmu_model = POWERPC_MMU_32B;
>       pcc->excp_model = POWERPC_EXCP_74xx;
>       pcc->bus_model = PPC_FLAGS_INPUT_6xx;
>       pcc->bfd_mach = bfd_mach_ppc_7400;
> 


