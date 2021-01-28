Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E502C307A0E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:52:05 +0100 (CET)
Received: from localhost ([::1]:54992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59aX-00017y-0g
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l59Z4-0000CB-Cs; Thu, 28 Jan 2021 10:50:39 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:38819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l59Yx-0007EZ-P1; Thu, 28 Jan 2021 10:50:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DE8158018740;
 Thu, 28 Jan 2021 16:50:22 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 16:50:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a2f76607-3962-4bac-891e-437264bd160f,
 12ABEFCAB104A9A3990DEAE01579FEA45C2F0BE3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 28 Jan 2021 16:50:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/3] spapr_numa.c: create
 spapr_numa_initial_nvgpu_NUMA_id() helper
Message-ID: <20210128165015.328afe19@bahia.lan>
In-Reply-To: <20210128151731.1333664-3-danielhb413@gmail.com>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
 <20210128151731.1333664-3-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: e3e4da3b-cfdf-4de7-9938-73d242b47499
X-Ovh-Tracer-Id: 15942179733284690339
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 12:17:30 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> We'll need to check the initial value given to spapr->gpu_numa_id when
> building the rtas DT, so put it in a helper for easier access and to
> avoid repetition.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c              | 12 ++----------
>  hw/ppc/spapr_numa.c         | 14 ++++++++++++++
>  include/hw/ppc/spapr_numa.h |  1 +
>  3 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2d60c6f594..c2b74cbfdf 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2765,16 +2765,8 @@ static void spapr_machine_init(MachineState *machine)
>  
>      }
>  
> -    /*
> -     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA node.
> -     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() which is
> -     * called from vPHB reset handler so we initialize the counter here.
> -     * If no NUMA is configured from the QEMU side, we start from 1 as GPU RAM
> -     * must be equally distant from any other node.
> -     * The final value of spapr->gpu_numa_id is going to be written to
> -     * max-associativity-domains in spapr_build_fdt().
> -     */
> -    spapr->gpu_numa_id = MAX(1, machine->numa_state->num_nodes);
> +    /* Init gpu_numa_id */

Code is trivial enough you don't really need to paraphrase with a
comment.

> +    spapr->gpu_numa_id = spapr_numa_initial_nvgpu_NUMA_id(machine);
>  

This _NUMA_ looks a bit aggressive and not especially informative
to me. Maybe just make it spapr_numa_initial_nvgpu_id() ?

With these fixed,

Reviewed-by: Greg Kurz <groug@kaod.org>

>      /* Init numa_assoc_array */
>      spapr_numa_associativity_init(spapr, machine);
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 261810525b..f71105c783 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -46,6 +46,20 @@ static bool spapr_numa_is_symmetrical(MachineState *ms)
>      return true;
>  }
>  
> +/*
> + * NVLink2-connected GPU RAM needs to be placed on a separate NUMA node.
> + * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() which is
> + * called from vPHB reset handler so we initialize the counter here.
> + * If no NUMA is configured from the QEMU side, we start from 1 as GPU RAM
> + * must be equally distant from any other node.
> + * The final value of spapr->gpu_numa_id is going to be written to
> + * max-associativity-domains in spapr_build_fdt().
> + */
> +unsigned int spapr_numa_initial_nvgpu_NUMA_id(MachineState *machine)
> +{
> +    return MAX(1, machine->numa_state->num_nodes);
> +}
> +
>  /*
>   * This function will translate the user distances into
>   * what the kernel understand as possible values: 10
> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> index b3fd950634..6655bcf281 100644
> --- a/include/hw/ppc/spapr_numa.h
> +++ b/include/hw/ppc/spapr_numa.h
> @@ -31,5 +31,6 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spapr, void *fdt,
>                              int offset, PowerPCCPU *cpu);
>  int spapr_numa_write_assoc_lookup_arrays(SpaprMachineState *spapr, void *fdt,
>                                           int offset);
> +unsigned int spapr_numa_initial_nvgpu_NUMA_id(MachineState *machine);
>  
>  #endif /* HW_SPAPR_NUMA_H */


