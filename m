Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F05435F8C2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:23:14 +0200 (CEST)
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWiIL-0004s2-CW
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lWhqU-0001f4-R7
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:54:26 -0400
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:53698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lWhqS-000152-B1
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:54:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3449A27F223;
 Wed, 14 Apr 2021 17:54:20 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 14 Apr
 2021 17:54:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004e4b04bcf-9e2e-4f9f-8ac4-03c54b4cf604,
 38A808AD2D0D3C4A59D9F430F89D181E503BD305) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [EXTERNAL] [RFC PATCH 2/2] target/ppc: Add POWER10 exception model
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20210414032343.1720010-1-npiggin@gmail.com>
 <20210414032343.1720010-3-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <07285365-1c95-27b3-6922-260709d22624@kaod.org>
Date: Wed, 14 Apr 2021 17:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414032343.1720010-3-npiggin@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 30cdc8ed-51e0-42b3-aa1c-df16c5253662
X-Ovh-Tracer-Id: 1165024929991396134
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeluddgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo51.mail-out.ovh.net
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 5:23 AM, Nicholas Piggin wrote:
> POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
> and it removes support for the LPCR[AIL]=0b10 mode.

This looks good but it's missing the MSR_LE setting. A part from that : 

Reviewed-by: Cédric Le Goater <clg@kaod.org>

and 

Tested-by: Cédric Le Goater <clg@kaod.org>

distros using scv on P10 now need your patch to boot :

"powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors"

I guess it will get merged in time. 

Thanks,

C.


> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/spapr_hcall.c            |  7 +++++-
>  target/ppc/cpu-qom.h            |  2 ++
>  target/ppc/cpu.h                |  5 ++--
>  target/ppc/excp_helper.c        | 43 +++++++++++++++++++++++++++++++++
>  target/ppc/translate.c          |  3 ++-
>  target/ppc/translate_init.c.inc |  2 +-
>  6 files changed, 57 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 2fbe04a689..6802cd4dc8 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1396,7 +1396,12 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
>      }
> 
>      if (mflags == 1) {
> -        /* AIL=1 is reserved */
> +        /* AIL=1 is reserved in POWER8/POWER9 */
> +        return H_UNSUPPORTED_FLAG;
> +    }
> +
> +    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
> +        /* AIL=2 is also reserved in POWER10 (ISA v3.1) */
>          return H_UNSUPPORTED_FLAG;
>      }
> 
> diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
> index 118baf8d41..06b6571bc9 100644
> --- a/target/ppc/cpu-qom.h
> +++ b/target/ppc/cpu-qom.h
> @@ -116,6 +116,8 @@ enum powerpc_excp_t {
>      POWERPC_EXCP_POWER8,
>      /* POWER9 exception model           */
>      POWERPC_EXCP_POWER9,
> +    /* POWER10 exception model           */
> +    POWERPC_EXCP_POWER10,
>  };
> 
>  /*****************************************************************************/
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 5200a16d23..9d35cdfa92 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -354,10 +354,11 @@ typedef struct ppc_v3_pate_t {
>  #define LPCR_PECE_U_SHIFT (63 - 19)
>  #define LPCR_PECE_U_MASK  (0x7ull << LPCR_PECE_U_SHIFT)
>  #define LPCR_HVEE         PPC_BIT(17) /* Hypervisor Virt Exit Enable */
> -#define LPCR_RMLS_SHIFT   (63 - 37)
> +#define LPCR_RMLS_SHIFT   (63 - 37)   /* RMLS (removed in ISA v3.0) */
>  #define LPCR_RMLS         (0xfull << LPCR_RMLS_SHIFT)
> +#define LPCR_HAIL         PPC_BIT(37) /* ISA v3.1 HV AIL=3 equivalent */
>  #define LPCR_ILE          PPC_BIT(38)
> -#define LPCR_AIL_SHIFT    (63 - 40)      /* Alternate interrupt location */
> +#define LPCR_AIL_SHIFT    (63 - 40)   /* Alternate interrupt location */
>  #define LPCR_AIL          (3ull << LPCR_AIL_SHIFT)
>  #define LPCR_UPRT         PPC_BIT(41) /* Use Process Table */
>  #define LPCR_EVIRT        PPC_BIT(42) /* Enhanced Virtualisation */
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 9ff316767c..19931361a0 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -172,6 +172,26 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
>   *
>   * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be
>   * sent to the hypervisor in AIL mode if the guest is radix (LPCR[HR]=1).
> + * This is good for performance but allows the guest to influence the
> + * AIL of hypervisor interrupts using its MSR, and also the hypervisor
> + * must disallow guest interrupts (MSR[HV] 0->0) from using AIL if the
> + * hypervisor does not want to use AIL for its MSR[HV] 0->1 interrupts.
> + *
> + * POWER10 addresses those issues with a new LPCR[HAIL] bit that is
> + * applied to interrupt that begin execution with MSR[HV]=1 (so both
> + * MSR[HV] 0->1 and 1->1).
> + *
> + * HAIL=1 is equivalent to AIL=3, for interrupts delivered with MSR[HV]=1.
> + *
> + * POWER10 behaviour is
> + * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
> + * +-----------+------------+-------------+---------+-------------+-----+
> + * | a         | h          | 00/01/10    | 0       | 0           | 0   |
> + * | a         | h          | 11          | 0       | 0           | a   |
> + * | a         | h          | x           | 0       | 1           | h   |
> + * | a         | h          | 00/01/10    | 1       | 1           | 0   |
> + * | a         | h          | 11          | 1       | 1           | h   |
> + * +--------------------------------------------------------------------+
>   */
>  static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
>                                        target_ulong msr,
> @@ -211,6 +231,29 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
>              /* AIL=1 is reserved */
>              return;
>          }
> +
> +    } else if (excp_model == POWERPC_EXCP_POWER10) {
> +        if (!mmu_all_on && !hv_escalation) {
> +            /*
> +             * AIL works for HV interrupts even with guest MSR[IR/DR] disabled.
> +             * Guest->guest and HV->HV interrupts do require MMU on.
> +             */
> +            return;
> +        }
> +
> +        if (*new_msr & MSR_HVB) {
> +            if (!(env->spr[SPR_LPCR] & LPCR_HAIL)) {
> +                /* HV interrupts depend on LPCR[HAIL] */
> +                return;
> +            }
> +            ail = 3; /* HAIL=1 gives AIL=3 behaviour for HV interrupts */
> +        } else {
> +            ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
> +        }
> +        if (ail != 3) {
> +            /* AIL=1 and AIL=2 are reserved */
> +            return;
> +        }
>      } else {
>          /* Other processors do not support AIL */
>          return;
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 0984ce637b..e9ed001229 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7731,7 +7731,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  #if defined(TARGET_PPC64)
>      if (env->excp_model == POWERPC_EXCP_POWER7 ||
>          env->excp_model == POWERPC_EXCP_POWER8 ||
> -        env->excp_model == POWERPC_EXCP_POWER9)  {
> +        env->excp_model == POWERPC_EXCP_POWER9 ||
> +        env->excp_model == POWERPC_EXCP_POWER10)  {
>          qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "\n",
>                       env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
>      }
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index a82d9ed647..76d82cc2f6 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -9317,7 +9317,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>      pcc->radix_page_info = &POWER10_radix_page_info;
>      pcc->lrg_decr_bits = 56;
>  #endif
> -    pcc->excp_model = POWERPC_EXCP_POWER9;
> +    pcc->excp_model = POWERPC_EXCP_POWER10;
>      pcc->bus_model = PPC_FLAGS_INPUT_POWER9;
>      pcc->bfd_mach = bfd_mach_ppc64;
>      pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
> 


