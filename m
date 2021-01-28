Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D7307A48
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:06:39 +0100 (CET)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59oc-0001Z7-GN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l59lw-0008Ok-QX; Thu, 28 Jan 2021 11:03:55 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l59lt-0004om-Ef; Thu, 28 Jan 2021 11:03:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C84DB8019AE3;
 Thu, 28 Jan 2021 17:03:46 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 17:03:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001033efc4b-e172-4507-ad99-959c0058cfde,
 12ABEFCAB104A9A3990DEAE01579FEA45C2F0BE3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 28 Jan 2021 17:03:39 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/3] spapr: move spapr_machine_using_legacy_numa() to
 spapr_numa.c
Message-ID: <20210128170339.65e94e9b@bahia.lan>
In-Reply-To: <20210128151731.1333664-2-danielhb413@gmail.com>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
 <20210128151731.1333664-2-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d55cab4e-8f0b-4844-981e-2b701ddf184e
X-Ovh-Tracer-Id: 16168485615002687907
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

On Thu, 28 Jan 2021 12:17:29 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> This function is used only in spapr_numa.c.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c         | 9 ---------
>  hw/ppc/spapr_numa.c    | 9 +++++++++
>  include/hw/ppc/spapr.h | 1 -
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 6c47466fc2..2d60c6f594 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -295,15 +295,6 @@ static hwaddr spapr_node0_size(MachineState *machine)
>      return machine->ram_size;
>  }
>  
> -bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
> -{
> -    MachineState *machine = MACHINE(spapr);
> -    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
> -
> -    return smc->pre_5_2_numa_associativity ||
> -           machine->numa_state->num_nodes <= 1;
> -}
> -
>  static void add_str(GString *s, const gchar *s1)
>  {
>      g_string_append_len(s, s1, strlen(s1) + 1);
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index b50796bbe3..261810525b 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -19,6 +19,15 @@
>  /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>  #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
>  
> +static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
> +{
> +    MachineState *machine = MACHINE(spapr);
> +    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
> +
> +    return smc->pre_5_2_numa_associativity ||
> +           machine->numa_state->num_nodes <= 1;
> +}
> +
>  static bool spapr_numa_is_symmetrical(MachineState *ms)
>  {
>      int src, dst;
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index c27c7ce515..ccbeeca1de 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -851,7 +851,6 @@ int spapr_max_server_number(SpaprMachineState *spapr);
>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>                        uint64_t pte0, uint64_t pte1);
>  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
> -bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr);
>  
>  /* DRC callbacks. */
>  void spapr_core_release(DeviceState *dev);


