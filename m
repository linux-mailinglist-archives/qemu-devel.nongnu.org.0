Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B6D3378B4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:04:00 +0100 (CET)
Received: from localhost ([::1]:49544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNn4-0001yy-Ud
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lKNSe-0001vI-J0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:42:52 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lKNSc-0000JX-GD
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:42:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 9DA0024CEA6;
 Thu, 11 Mar 2021 16:42:38 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 11 Mar
 2021 16:42:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006b0010e0a-aec9-4558-8efe-4e370fa271d7,
 C9E73BA7B5C6DF476AA7F77516C5BA4485C89162) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH 1/1] spapr.c: remove 'ibm,chip-id' from DT
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20210311151557.705863-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6ecff43d-f9cb-2cfc-705e-8d0159604227@kaod.org>
Date: Thu, 11 Mar 2021 16:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210311151557.705863-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2d5370f8-bdca-47ec-9602-250e27f122c0
X-Ovh-Tracer-Id: 4210302705519266598
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvtddgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo52.mail-out.ovh.net
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 4:15 PM, Daniel Henrique Barboza wrote:
> The attribute 'ibm,chip-id' does not exist in PAPR. This alone would be
> enough reason to remove it from the spapr DT, but before doing that,
> let's give a brief context on how and why it was introduced.
> 
> 'ibm,chip-id' was added in the spapr DT by commit 10582ff83279. This
> commit references kernel commit 256f2d4b463d ("powerpc: Use ibm, chip-id
> property to compute cpu_core_mask if available"). In this kernel commit,
> the 'ibm,chip-id' DT attribute is being used to calculate the
> cpu_core_mask in traverse_siblings_chip_id(). This function still need
> to consider 'ibm,chip-id' not being available as well to avoid breaking
> older guests.
> 
> Later on, kernel commit df52f6714071 ("powerpc/smp: Rework CPU topology
> construction") removed traverse_siblings_chip_id() and its callers,
> making the CPU topology calculation independent of the 'ibm,chip-id'
> attribute. Today, the kernel uses 'ibm,chip-id' for PowerNV related code
> only - the pseries kernel does not rely on it.

PowerNV uses the "ibm,associativity" property of the CPU to find the 
node id. "ibm,chip-id" is only used in low level PowerNV drivers : 
LPC, XSCOM, RNG, VAS, NX.

> All that said, since it's not in PAPR and the pseries kernel does not
> rely on it, let's remove ibm,chip-id from the DT.

yes. The H_HOME_NODE_ASSOCIATIVITY hcall is used to determined the 
node id. 

> CC: Alexey Kardashevskiy <aik@ozlabs.ru>
> Suggested-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/ppc/spapr.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 85fe65f894..d2e448fd9c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -657,7 +657,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
>      uint32_t page_sizes_prop[64];
>      size_t page_sizes_prop_size;
>      unsigned int smp_threads = ms->smp.threads;
> -    uint32_t vcpus_per_socket = smp_threads * ms->smp.cores;
>      uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
>      int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
>      SpaprDrc *drc;
> @@ -744,9 +743,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
>  
>      spapr_dt_pa_features(spapr, cpu, fdt, offset);
>  
> -    _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
> -                           cs->cpu_index / vcpus_per_socket)));
> -
>      _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
>                        pft_size_prop, sizeof(pft_size_prop))));
>  
> 


