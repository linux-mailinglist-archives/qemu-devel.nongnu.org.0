Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F269B489D2A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 17:09:14 +0100 (CET)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6xEQ-0004uT-41
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 11:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6x59-0007SP-Jl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:59:39 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:42193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n6x57-0004of-JX
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:59:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A8753D6C9A61;
 Mon, 10 Jan 2022 16:59:34 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 16:59:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004ac1a57f0-e06a-4316-80f0-82987db22190,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b32d605b-b97e-b3c0-6281-e6143a4003c8@kaod.org>
Date: Mon, 10 Jan 2022 16:59:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 08/10] pnv_phb4.c: check stack->phb not NULL in
 phb4_update_regions()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220110143346.455901-1-danielhb413@gmail.com>
 <20220110143346.455901-9-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110143346.455901-9-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fd7b1e1e-e747-401c-afb8-bf8ea416ede1
X-Ovh-Tracer-Id: 6333749927673039840
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 15:33, Daniel Henrique Barboza wrote:
> The last step before enabling user creatable pnv-phb4 devices still has
> to do with specific XSCOM initialization code in pnv_phb4_stk_realize().
> 
> 'stack->nest_regs_mr' is being init regardless of the existence of
> 'stack->phb', which is verified only when trying to realize the phb.
> Its MemoryRegionOps,'pnv_pec_stk_nest_xscom_ops', uses
> pnv_pec_stk_nest_xscom_write() as a write callback. When trying to write
> the PEC_NEST_STK_BAR_EN reg, pnv_pec_stk_update_map() is called. Inside
> this function, pnv_phb4_update_regions() is called twice. This function
> uses stack->phb to manipulate memory regions of the phb.
> 
> When enabling user creatable phb4s, a stack that doesn't have an
> associated phb (i.e. will have stack->phb = NULL) will cause a SIGINT
> during boot in pnv_phb4_update_regions(). To deal with this we have
> some options, including:
> 
> - check for stack->phb being not NULL in pnv_phb4_update_regions();
> 
> - change the order of the XSCOM initialization to avoid initializing
> 'stack->nest_regs_mr' if 'stack->phb' is NULL. This can have unintended
> side-effects: there are several other regs that are being read/written
> in these memory regions, and we would forbid all read/write operations
> in these regs because of writes in PEC_NEST_STK_BAR_EN being problematic;
> 
> - move the XSCOM init code to phb4_realize() like the previous patch
> did with 'stack->phb_regs_mr'. Besides having the same potential side
> effects than the previous alternative, a lot of code would need to be
> moved from pnv_phb4_pec.c to pnv_phb4.c because all the memory region
> code is static.
> 
> Being the option that is less intrusive and innocus of the alternatives,
> this patch keeps the XSCOM initialization as is in
> pnv_phb4_stk_realize() and check for 'stack->phb' being NULL in
> pnv_phb4_update_regions().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 152911a285..fc23a96b7f 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1472,6 +1472,17 @@ void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
>   {
>       PnvPHB4 *phb = stack->phb;
>   
> +    /*
> +     * This will happen when there's no phb associated with the stack.
> +     * pnv_pec_stk_realize() will init the nested xscom address space
> +     * (stack->nest_regs_mr) that uses pnv_phb4_update_regions(), via
> +     * pnv_pec_stk_update_map(), which in turn is the write callback of
> +     * the PEC_NEST_STK_BAR_EN reg in pnv_pec_stk_nest_xscom_write().
> +     */
> +    if (!stack->phb) {
> +        return;
> +    }
> +


I would assert()

Thanks,

C.


>       /* Unmap first always */
>       if (memory_region_is_mapped(&phb->mr_regs)) {
>           memory_region_del_subregion(&stack->phbbar, &phb->mr_regs);
> 


