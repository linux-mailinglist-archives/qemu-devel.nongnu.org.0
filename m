Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0A33AFED
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:26:27 +0100 (CET)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkQc-0002Be-Bx
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lLkNd-0000pC-6e
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:23:23 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:59241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lLkNa-0006R6-BO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:23:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6C50024FB1A;
 Mon, 15 Mar 2021 11:23:13 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 11:23:09 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00323a54b08-b92a-41dd-af00-6de17542e17b,
 6ECECE93D947A1E75FB970C6684F7B2999F5CB5C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 14/16] hw/ppc: Use hreg_store_msr for msr updates
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
 <20210314175906.1733746-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ea6b23c2-21db-a512-87b5-be5351ff0a74@kaod.org>
Date: Mon, 15 Mar 2021 11:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210314175906.1733746-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 12a97ea3-a3a3-44f0-bc52-c46932b306c3
X-Ovh-Tracer-Id: 3859866359514368806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 6:59 PM, Richard Henderson wrote:
> Only one of the three places in hw/ppc that modify msr updated
> hflags.  Even in that case, use the official interface instead
> of a direct call to hreg_compute_hflags.

ppc_store_msr() is the interface to use.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Greg Kurz <groug@kaod.org>
> ---
>  hw/ppc/pnv_core.c    | 3 ++-
>  hw/ppc/spapr_hcall.c | 3 +--
>  hw/ppc/spapr_rtas.c  | 3 ++-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
> index bd2bf2e044..31f041b9c7 100644
> --- a/hw/ppc/pnv_core.c
> +++ b/hw/ppc/pnv_core.c
> @@ -29,6 +29,7 @@
>  #include "hw/ppc/pnv_xscom.h"
>  #include "hw/ppc/xics.h"
>  #include "hw/qdev-properties.h"
> +#include "helper_regs.h"
>  
>  static const char *pnv_core_cpu_typename(PnvCore *pc)
>  {
> @@ -54,7 +55,7 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
>       */
>      env->gpr[3] = PNV_FDT_ADDR;
>      env->nip = 0x10;
> -    env->msr |= MSR_HVB; /* Hypervisor mode */
> +    hreg_store_msr(env, env->msr | MSR_HVB, true); /* Hypervisor mode */


This is going to have the opposite effect of not setting the HV bit in the 
PowerNV machine. See the comment in powerpc_set_excp_state().

May be commit 1c953ba57ada ("ppc: Fix hreg_store_msr() so that non-HV 
mode cannot alter MSR:HV") needs a fix first.

C.

>  
>      env->spr[SPR_HRMOR] = pc->hrmor;
>  
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c..a4f7a09ba8 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1055,8 +1055,7 @@ static target_ulong h_cede(PowerPCCPU *cpu, SpaprMachineState *spapr,
>      CPUState *cs = CPU(cpu);
>      SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
>  
> -    env->msr |= (1ULL << MSR_EE);
> -    hreg_compute_hflags(env);
> +    hreg_store_msr(env, env->msr | (1ULL << MSR_EE), false);
>  
>      if (spapr_cpu->prod) {
>          spapr_cpu->prod = false;
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8a79f9c628..b9a6b7ef30 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -51,6 +51,7 @@
>  #include "target/ppc/mmu-hash64.h"
>  #include "target/ppc/mmu-book3s-v3.h"
>  #include "migration/blocker.h"
> +#include "helper_regs.h"
>  
>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                                     uint32_t token, uint32_t nargs,
> @@ -162,7 +163,7 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
>  
>      cpu_synchronize_state(CPU(newcpu));
>  
> -    env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
> +    hreg_store_msr(env, (1ULL << MSR_SF) | (1ULL << MSR_ME), true);
>  
>      /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
>      lpcr = env->spr[SPR_LPCR];
> 


