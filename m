Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7044A49DF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:09:11 +0100 (CET)
Received: from localhost ([::1]:35678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYIo-00021c-7Y
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEXrq-0003Dv-8J
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:41:18 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:35185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEXrm-00064w-Tn
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:41:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D6FE1205BF;
 Mon, 31 Jan 2022 14:41:10 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 15:41:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00535f62a22-11e5-4262-be8a-aa55e22a56e3,
 4E4406098780EA2DD5F77ED28C3E8FA94DEDF1FC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ecce8be7-5294-e1d5-27a9-a790fe447889@kaod.org>
Date: Mon, 31 Jan 2022 15:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Remove 440x4 CPU
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220128221611.1221715-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220128221611.1221715-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 312363fd-08ec-44b5-bf7a-d23c42b51f1b
X-Ovh-Tracer-Id: 17655799390067198944
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 23:16, Fabiano Rosas wrote:
> This CPU was partially removed due to lack of support in 2017 by commit
> aef7796057 ("ppc: remove non implemented cpu models").
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/cpu_init.c | 83 -------------------------------------------
>   1 file changed, 83 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index e30e86fe9d..f4a4f39419 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -2777,89 +2777,6 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
>                    POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
>   }
>   
> -static void init_proc_440x4(CPUPPCState *env)
> -{
> -    /* Time base */
> -    register_tbl(env);
> -    register_BookE_sprs(env, 0x000000000000FFFFULL);
> -    register_440_sprs(env);
> -    register_usprgh_sprs(env);
> -    /* Processor identification */
> -    spr_register(env, SPR_BOOKE_PIR, "PIR",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_pir,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_BOOKE_IAC3, "IAC3",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_BOOKE_IAC4, "IAC4",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_BOOKE_DVC1, "DVC1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_BOOKE_DVC2, "DVC2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* Memory management */
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb = 64;
> -    env->nb_ways = 1;
> -    env->id_tlbs = 0;
> -    env->tlb_type = TLB_EMB;
> -#endif
> -    init_excp_BookE(env);
> -    env->dcache_line_size = 32;
> -    env->icache_line_size = 32;
> -    /* XXX: TODO: allocate internal IRQ controller */
> -
> -    SET_FIT_PERIOD(12, 16, 20, 24);
> -    SET_WDT_PERIOD(20, 24, 28, 32);
> -}
> -
> -POWERPC_FAMILY(440x4)(ObjectClass *oc, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(oc);
> -    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
> -
> -    dc->desc = "PowerPC 440x4";
> -    pcc->init_proc = init_proc_440x4;
> -    pcc->check_pow = check_pow_nocheck;
> -    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
> -                       PPC_DCR | PPC_WRTEE |
> -                       PPC_CACHE | PPC_CACHE_ICBI |
> -                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
> -                       PPC_MEM_TLBSYNC | PPC_MFTB |
> -                       PPC_BOOKE | PPC_4xx_COMMON | PPC_405_MAC |
> -                       PPC_440_SPEC;
> -    pcc->msr_mask = (1ull << MSR_POW) |
> -                    (1ull << MSR_CE) |
> -                    (1ull << MSR_EE) |
> -                    (1ull << MSR_PR) |
> -                    (1ull << MSR_FP) |
> -                    (1ull << MSR_ME) |
> -                    (1ull << MSR_FE0) |
> -                    (1ull << MSR_DWE) |
> -                    (1ull << MSR_DE) |
> -                    (1ull << MSR_FE1) |
> -                    (1ull << MSR_IR) |
> -                    (1ull << MSR_DR);
> -    pcc->mmu_model = POWERPC_MMU_BOOKE;
> -    pcc->excp_model = POWERPC_EXCP_BOOKE;
> -    pcc->bus_model = PPC_FLAGS_INPUT_BookE;
> -    pcc->bfd_mach = bfd_mach_ppc_403;
> -    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
> -                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
> -}
> -
>   static void init_proc_440x5(CPUPPCState *env)
>   {
>       /* Time base */
> 


