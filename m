Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB34677CD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:03:22 +0100 (CET)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8Dh-0002zM-Ip
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt880-0002Nt-AN
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:57:28 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:58091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mt87t-0003kT-Gv
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 07:57:24 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 889E521270;
 Fri,  3 Dec 2021 12:57:19 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 3 Dec
 2021 13:57:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004b3e58f0e-a973-46fc-bafd-00a4e7d99475,
 530A9595C01F0F4EFEED26D362E2F82770F5CBE3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <90ddbe62-6c02-09df-9a79-a5c539dca210@kaod.org>
Date: Fri, 3 Dec 2021 13:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 3/4] target/ppc: Remove the software TLB model of
 7450 CPUs
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
 <20211130230123.781844-4-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211130230123.781844-4-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9c4592b8-8619-4c94-9e9e-775428d8346a
X-Ovh-Tracer-Id: 1454381205811137327
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelheegjeeuhefhtefggeejjeeiudelieffledtkefgfefgfffhfeekhfefgfekieenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthdpghhithhlrggsrdgtohhmpdhnohhnghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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
> (Applies to 7441, 7445, 7450, 7451, 7455, 7457, 7447, 7447a and 7448)
> 
> The QEMU-side software TLB implementation for the 7450 family of CPUs
> is being removed due to lack of known users in the real world. The
> last users in the code were removed by the two previous commits.
> 
> A brief history:
> 
> The feature was added in QEMU by commit 7dbe11acd8 ("Handle all MMU
> models in switches...") with the mention that Linux was not able to
> handle the TLB miss interrupts and the MMU model would be kept
> disabled.
> 
> At some point later, commit 8ca3f6c382 ("Allow selection of all
> defined PowerPC 74xx (aka G4) CPUs.") enabled the model for the 7450
> family without further justification.
> 
> We have since the year 2011 [1] been unable to run OpenBIOS in the
> 7450s and have not heard of any other software that is used with those
> CPUs in QEMU. Attempts were made to find a guest OS that implemented
> the TLB miss handlers and none were found among Linux 5.15, FreeBSD 13,
> MacOS9, MacOSX and MorphOS 3.15.
> 
> All CPUs that registered this feature were moved to an MMU model that
> replaces the software TLB with a QEMU hardware TLB
> implementation. They can now run the same software as the 7400 CPUs,
> including the OSes mentioned above.
> 
> References:
> 
> - https://bugs.launchpad.net/qemu/+bug/812398
>    https://gitlab.com/qemu-project/qemu/-/issues/86
> 
> - https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00289.html
>    message id: 20211119134431.406753-1-farosas@linux.ibm.com
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   target/ppc/cpu-qom.h     |  6 +++++-
>   target/ppc/cpu.h         |  4 +---
>   target/ppc/cpu_init.c    | 26 --------------------------
>   target/ppc/excp_helper.c | 29 -----------------------------
>   target/ppc/helper.h      |  2 --
>   target/ppc/mmu_common.c  | 19 -------------------
>   target/ppc/mmu_helper.c  | 31 -------------------------------
>   target/ppc/translate.c   | 26 --------------------------
>   8 files changed, 6 insertions(+), 137 deletions(-)
> 
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 5800fa324e..ef9e324474 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -45,7 +45,11 @@ enum powerpc_mmu_t {
>       POWERPC_MMU_32B        = 0x00000001,
>       /* PowerPC 6xx MMU with software TLB                       */
>       POWERPC_MMU_SOFT_6xx   = 0x00000002,
> -    /* PowerPC 74xx MMU with software TLB                      */
> +    /*
> +     * PowerPC 74xx MMU with software TLB (this has been
> +     * disabled, see git history for more information.
> +     * keywords: tlbld tlbli TLBMISS PTEHI PTELO)
> +     */
>       POWERPC_MMU_SOFT_74xx  = 0x00000003,
>       /* PowerPC 4xx MMU with software TLB                       */
>       POWERPC_MMU_SOFT_4xx   = 0x00000004,
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index e946da5f3a..432d609094 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2138,8 +2138,6 @@ enum {
>       PPC_SEGMENT        = 0x0000020000000000ULL,
>       /*   PowerPC 6xx TLB management instructions                             */
>       PPC_6xx_TLB        = 0x0000040000000000ULL,
> -    /* PowerPC 74xx TLB management instructions                              */
> -    PPC_74xx_TLB       = 0x0000080000000000ULL,
>       /*   PowerPC 40x TLB management instructions                             */
>       PPC_40x_TLB        = 0x0000100000000000ULL,
>       /*   segment register access instructions for PowerPC 64 "bridge"        */
> @@ -2196,7 +2194,7 @@ enum {
>                           | PPC_CACHE_DCBZ \
>                           | PPC_CACHE_DCBA | PPC_CACHE_LOCK \
>                           | PPC_EXTERN | PPC_SEGMENT | PPC_6xx_TLB \
> -                        | PPC_74xx_TLB | PPC_40x_TLB | PPC_SEGMENT_64B \
> +                        | PPC_40x_TLB | PPC_SEGMENT_64B \
>                           | PPC_SLBI | PPC_WRTEE | PPC_40x_EXCP \
>                           | PPC_405_MAC | PPC_440_SPEC | PPC_BOOKE \
>                           | PPC_MFAPIDI | PPC_TLBIVA | PPC_TLBIVAX \
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 962acf295f..ed0e2136d9 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -945,31 +945,6 @@ static void register_l3_ctrl(CPUPPCState *env)
>                    0x00000000);
>   }
>   
> -static void register_74xx_soft_tlb(CPUPPCState *env, int nb_tlbs, int nb_ways)
> -{
> -#if !defined(CONFIG_USER_ONLY)
> -    env->nb_tlb = nb_tlbs;
> -    env->nb_ways = nb_ways;
> -    env->id_tlbs = 1;
> -    env->tlb_type = TLB_6XX;
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_PTEHI, "PTEHI",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_PTELO, "PTELO",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -    /* XXX : not implemented */
> -    spr_register(env, SPR_TLBMISS, "TLBMISS",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -#endif
> -}
> -
>   static void register_usprg3_sprs(CPUPPCState *env)
>   {
>       spr_register(env, SPR_USPRG3, "USPRG3",
> @@ -9238,7 +9213,6 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>       case POWERPC_MMU_32B:
>       case POWERPC_MMU_601:
>       case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
>   #if defined(TARGET_PPC64)
>       case POWERPC_MMU_64B:
>       case POWERPC_MMU_2_03:
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 17607adbe4..f1da0e119d 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -714,35 +714,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>               /* Set way using a LRU mechanism */
>               msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
>               break;
> -        case POWERPC_EXCP_74xx:
> -#if defined(DEBUG_SOFTWARE_TLB)
> -            if (qemu_log_enabled()) {
> -                const char *es;
> -                target_ulong *miss, *cmp;
> -                int en;
> -
> -                if (excp == POWERPC_EXCP_IFTLB) {
> -                    es = "I";
> -                    en = 'I';
> -                    miss = &env->spr[SPR_TLBMISS];
> -                    cmp = &env->spr[SPR_PTEHI];
> -                } else {
> -                    if (excp == POWERPC_EXCP_DLTLB) {
> -                        es = "DL";
> -                    } else {
> -                        es = "DS";
> -                    }
> -                    en = 'D';
> -                    miss = &env->spr[SPR_TLBMISS];
> -                    cmp = &env->spr[SPR_PTEHI];
> -                }
> -                qemu_log("74xx %sTLB miss: %cM " TARGET_FMT_lx " %cC "
> -                         TARGET_FMT_lx " %08x\n", es, en, *miss, en, *cmp,
> -                         env->error_code);
> -            }
> -#endif
> -            msr |= env->error_code; /* key bit */
> -            break;
>           default:
>               cpu_abort(cs, "Invalid TLB miss exception\n");
>               break;
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 627811cefc..b955b07fc3 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -614,8 +614,6 @@ DEF_HELPER_2(booke_set_eplc, void, env, tl)
>   DEF_HELPER_2(booke_set_epsc, void, env, tl)
>   DEF_HELPER_2(6xx_tlbd, void, env, tl)
>   DEF_HELPER_2(6xx_tlbi, void, env, tl)
> -DEF_HELPER_2(74xx_tlbd, void, env, tl)
> -DEF_HELPER_2(74xx_tlbi, void, env, tl)
>   DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, env)
>   DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
>   DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 754509e556..86795b2814 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -1147,7 +1147,6 @@ void dump_mmu(CPUPPCState *env)
>           mmubooke206_dump_mmu(env);
>           break;
>       case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
>           mmu6xx_dump_mmu(env);
>           break;
>   #if defined(TARGET_PPC64)
> @@ -1181,7 +1180,6 @@ static int check_physical(CPUPPCState *env, mmu_ctx_t *ctx, target_ulong eaddr,
>       ret = 0;
>       switch (env->mmu_model) {
>       case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
>       case POWERPC_MMU_SOFT_4xx:
>       case POWERPC_MMU_REAL:
>       case POWERPC_MMU_BOOKE:
> @@ -1234,7 +1232,6 @@ int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
>   
>       switch (env->mmu_model) {
>       case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
>           if (real_mode) {
>               ret = check_physical(env, ctx, eaddr, access_type);
>           } else {
> @@ -1383,9 +1380,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                       env->spr[SPR_IMISS] = eaddr;
>                       env->spr[SPR_ICMP] = 0x80000000 | ctx.ptem;
>                       goto tlb_miss;
> -                case POWERPC_MMU_SOFT_74xx:
> -                    cs->exception_index = POWERPC_EXCP_IFTLB;
> -                    goto tlb_miss_74xx;
>                   case POWERPC_MMU_SOFT_4xx:
>                   case POWERPC_MMU_SOFT_4xx_Z:
>                       cs->exception_index = POWERPC_EXCP_ITLB;
> @@ -1454,19 +1448,6 @@ static bool ppc_jumbo_xlate(PowerPCCPU *cpu, vaddr eaddr,
>                       env->spr[SPR_HASH2] = ppc_hash32_hpt_base(cpu) +
>                           get_pteg_offset32(cpu, ctx.hash[1]);
>                       break;
> -                case POWERPC_MMU_SOFT_74xx:
> -                    if (access_type == MMU_DATA_STORE) {
> -                        cs->exception_index = POWERPC_EXCP_DSTLB;
> -                    } else {
> -                        cs->exception_index = POWERPC_EXCP_DLTLB;
> -                    }
> -                tlb_miss_74xx:
> -                    /* Implement LRU algorithm */
> -                    env->error_code = ctx.key << 19;
> -                    env->spr[SPR_TLBMISS] = (eaddr & ~((target_ulong)0x3)) |
> -                        ((env->last_way + 1) & (env->nb_ways - 1));
> -                    env->spr[SPR_PTEHI] = 0x80000000 | ctx.ptem;
> -                    break;
>                   case POWERPC_MMU_SOFT_4xx:
>                   case POWERPC_MMU_SOFT_4xx_Z:
>                       cs->exception_index = POWERPC_EXCP_DTLB;
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index e0c4950dda..f992131c1a 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -385,7 +385,6 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>   #endif /* defined(TARGET_PPC64) */
>       switch (env->mmu_model) {
>       case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
>           ppc6xx_tlb_invalidate_all(env);
>           break;
>       case POWERPC_MMU_SOFT_4xx:
> @@ -434,7 +433,6 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
>   #endif /* defined(TARGET_PPC64) */
>       switch (env->mmu_model) {
>       case POWERPC_MMU_SOFT_6xx:
> -    case POWERPC_MMU_SOFT_74xx:
>           ppc6xx_tlb_invalidate_virt(env, addr, 0);
>           if (env->id_tlbs == 1) {
>               ppc6xx_tlb_invalidate_virt(env, addr, 1);
> @@ -571,35 +569,6 @@ void helper_6xx_tlbi(CPUPPCState *env, target_ulong EPN)
>       do_6xx_tlb(env, EPN, 1);
>   }
>   
> -/* PowerPC 74xx software TLB load instructions helpers */
> -static void do_74xx_tlb(CPUPPCState *env, target_ulong new_EPN, int is_code)
> -{
> -    target_ulong RPN, CMP, EPN;
> -    int way;
> -
> -    RPN = env->spr[SPR_PTELO];
> -    CMP = env->spr[SPR_PTEHI];
> -    EPN = env->spr[SPR_TLBMISS] & ~0x3;
> -    way = env->spr[SPR_TLBMISS] & 0x3;
> -    (void)EPN; /* avoid a compiler warning */
> -    LOG_SWTLB("%s: EPN " TARGET_FMT_lx " " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
> -              " PTE1 " TARGET_FMT_lx " way %d\n", __func__, new_EPN, EPN, CMP,
> -              RPN, way);
> -    /* Store this TLB */
> -    ppc6xx_tlb_store(env, (uint32_t)(new_EPN & TARGET_PAGE_MASK),
> -                     way, is_code, CMP, RPN);
> -}
> -
> -void helper_74xx_tlbd(CPUPPCState *env, target_ulong EPN)
> -{
> -    do_74xx_tlb(env, EPN, 0);
> -}
> -
> -void helper_74xx_tlbi(CPUPPCState *env, target_ulong EPN)
> -{
> -    do_74xx_tlb(env, EPN, 1);
> -}
> -
>   /*****************************************************************************/
>   /* PowerPC 601 specific instructions (POWER bridge) */
>   
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 9960df6e18..b3f3b408db 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6252,30 +6252,6 @@ static void gen_tlbli_6xx(DisasContext *ctx)
>   #endif /* defined(CONFIG_USER_ONLY) */
>   }
>   
> -/* 74xx TLB management */
> -
> -/* tlbld */
> -static void gen_tlbld_74xx(DisasContext *ctx)
> -{
> -#if defined(CONFIG_USER_ONLY)
> -    GEN_PRIV;
> -#else
> -    CHK_SV;
> -    gen_helper_74xx_tlbd(cpu_env, cpu_gpr[rB(ctx->opcode)]);
> -#endif /* defined(CONFIG_USER_ONLY) */
> -}
> -
> -/* tlbli */
> -static void gen_tlbli_74xx(DisasContext *ctx)
> -{
> -#if defined(CONFIG_USER_ONLY)
> -    GEN_PRIV;
> -#else
> -    CHK_SV;
> -    gen_helper_74xx_tlbi(cpu_env, cpu_gpr[rB(ctx->opcode)]);
> -#endif /* defined(CONFIG_USER_ONLY) */
> -}
> -
>   /* POWER instructions not in PowerPC 601 */
>   
>   /* clf */
> @@ -7735,8 +7711,6 @@ GEN_HANDLER(esa, 0x1F, 0x14, 0x12, 0x03FFF801, PPC_602_SPEC),
>   GEN_HANDLER(mfrom, 0x1F, 0x09, 0x08, 0x03E0F801, PPC_602_SPEC),
>   GEN_HANDLER2(tlbld_6xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_6xx_TLB),
>   GEN_HANDLER2(tlbli_6xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_6xx_TLB),
> -GEN_HANDLER2(tlbld_74xx, "tlbld", 0x1F, 0x12, 0x1E, 0x03FF0001, PPC_74xx_TLB),
> -GEN_HANDLER2(tlbli_74xx, "tlbli", 0x1F, 0x12, 0x1F, 0x03FF0001, PPC_74xx_TLB),
>   GEN_HANDLER(clf, 0x1F, 0x16, 0x03, 0x03E00000, PPC_POWER),
>   GEN_HANDLER(cli, 0x1F, 0x16, 0x0F, 0x03E00000, PPC_POWER),
>   GEN_HANDLER(dclst, 0x1F, 0x16, 0x13, 0x03E00000, PPC_POWER),
> 


