Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5BD1DC2FD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 01:36:04 +0200 (CEST)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbYFm-0001CQ-HO
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 19:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jbYEb-0000GH-Fn
 for qemu-devel@nongnu.org; Wed, 20 May 2020 19:34:49 -0400
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jbYEa-0005WT-Cv
 for qemu-devel@nongnu.org; Wed, 20 May 2020 19:34:49 -0400
Received: from player799.ha.ovh.net (unknown [10.108.57.178])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 9416816719C
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 01:34:45 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 6EAFE1295AE82;
 Wed, 20 May 2020 23:34:38 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005c10cd6dc-c206-4a5e-a6eb-8b673158eb3f,0C88E457D5774F601C3A42E7BE1517355FE6C707)
 smtp.auth=groug@kaod.org
Date: Thu, 21 May 2020 01:34:37 +0200
From: Greg Kurz <groug@kaod.org>
To: Reza Arbab <arbab@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] spapr: Add associativity reference point count
 to machine info
Message-ID: <20200521013437.5da898fb@bahia.lan>
In-Reply-To: <20200518214418.18248-1-arbab@linux.ibm.com>
References: <20200518214418.18248-1-arbab@linux.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13732882640812480827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddutddgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheekhfdtheegheehjeeludefkefhvdelfedvieehhfekhfdufffhueeuvdfftdfhnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.111.220; envelope-from=groug@kaod.org;
 helo=1.mo179.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 19:34:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 Leonardo Augusto Guimaraes Garcia <lagarcia@linux.ibm.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 May 2020 16:44:17 -0500
Reza Arbab <arbab@linux.ibm.com> wrote:

> Make the number of NUMA associativity reference points a
> machine-specific value, using the currently assumed default (two
> reference points). This preps the next patch to conditionally change it.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>  hw/ppc/spapr.c         | 6 +++++-
>  include/hw/ppc/spapr.h | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c18eab0a2305..88b4a1f17716 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -889,10 +889,12 @@ static int spapr_dt_rng(void *fdt)
>  static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
>  {
>      MachineState *ms = MACHINE(spapr);
> +    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(ms);
>      int rtas;
>      GString *hypertas = g_string_sized_new(256);
>      GString *qemu_hypertas = g_string_sized_new(256);
>      uint32_t refpoints[] = { cpu_to_be32(0x4), cpu_to_be32(0x4) };
> +    uint32_t nr_refpoints;
>      uint64_t max_device_addr = MACHINE(spapr)->device_memory->base +
>          memory_region_size(&MACHINE(spapr)->device_memory->mr);
>      uint32_t lrdr_capacity[] = {
> @@ -944,8 +946,9 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
>                       qemu_hypertas->str, qemu_hypertas->len));
>      g_string_free(qemu_hypertas, TRUE);
>  
> +    nr_refpoints = MIN(smc->nr_assoc_refpoints, ARRAY_SIZE(refpoints));

Having the machine requesting more reference points than available
would clearly be a bug. I'd rather add an assert() than silently
clipping to the size of refpoints[].

>      _FDT(fdt_setprop(fdt, rtas, "ibm,associativity-reference-points",
> -                     refpoints, sizeof(refpoints)));
> +                     refpoints, nr_refpoints * sizeof(uint32_t)));
>  

Size can be expressed without yet another explicit reference to the
uint32_t type:

nr_refpoints * sizeof(refpoints[0])

>      _FDT(fdt_setprop(fdt, rtas, "ibm,max-associativity-domains",
>                       maxdomains, sizeof(maxdomains)));
> @@ -4541,6 +4544,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>      smc->linux_pci_probe = true;
>      smc->smp_threads_vsmt = true;
>      smc->nr_xirqs = SPAPR_NR_XIRQS;
> +    smc->nr_assoc_refpoints = 2;

When adding a new setting for the default machine type, we usually
take care of older machine types at the same time, ie. folding this
patch into the next one. Both patches are simple enough that it should
be okay and this would avoid this line to be touched again.

>      xfc->match_nvt = spapr_match_nvt;
>  }
>  
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index e579eaf28c05..abaf9a92adc0 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -129,6 +129,7 @@ struct SpaprMachineClass {
>      bool linux_pci_probe;
>      bool smp_threads_vsmt; /* set VSMT to smp_threads by default */
>      hwaddr rma_limit;          /* clamp the RMA to this size */
> +    uint32_t nr_assoc_refpoints;
>  
>      void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio, 


