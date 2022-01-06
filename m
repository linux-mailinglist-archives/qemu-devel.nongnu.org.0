Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E16486648
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:46:41 +0100 (CET)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5U2K-0004r8-QI
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:46:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tb1-0006rT-MT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:18:27 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Tay-0002Vj-Ak
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:18:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 404CFD5FB1DF;
 Thu,  6 Jan 2022 15:18:21 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 15:18:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a50991db-a1f9-437e-b2c1-cee460ffa917,
 49C0EA974A1AE1209641D977CC9A370E508CB387) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f68548d7-8a95-f1cd-eaf5-38431a05dfd7@kaod.org>
Date: Thu, 6 Jan 2022 15:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 11/18] pnv_phb4.c: introduce
 pnv_phb4_set_stack_phb_props()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <20220105212338.49899-12-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220105212338.49899-12-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1ef09423-d911-40c5-b086-cd55b4ef9d1d
X-Ovh-Tracer-Id: 18027064885849263072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/5/22 22:23, Daniel Henrique Barboza wrote:
> We want to be able to support user creatable pnv-phb4 objects to allow
> users to instantiate a powernv9 machine similar to what it is done with
> powernv8.
> 
> The main difference is that pnv-phb3 devs are attached directly to the
> system bus and can be created in the command line. PCI devices such as
> root-ports can be explictly connected to them. This allows users to
> create the phbs, assign a bus name if desired, then connect devices onto
> them.
> 
> pnv-phb4 devices on the other hand are created by adding PCI Express
> Controllers (PEC) that will create a certain amount of pnv-phb4 buses
> depending on the PEC index used. Index 0 will create 1 phb, index 1
> creates 2 phbs, index 2 creates 3 phbs. Creating all PECs from the same
> chip will create 6 PHBs. This doesn't users to rename the buses, like it
> is done with pnv-phb3, because there's no user control over how the
> pnv-phb4 are being created - aside from the amount of phbs and in which
> chips they'll reside.
> 
> This implicit relationship between PEC devices and available buses can
> be tolerable for users that knows how the hardware works, but it's
> annoying for Libvirt to deal with. Since there's no explicit
> relationship, in the command line, between the created buses and the PCI
> devices that will connect to them, the domain XML needs to make a lot of
> extra assumptions regarding the relationship between regular PCI devices
> and the existing PECs.
> 
> The first step to allow for user creatable pnv-phb4 devices is to
> decouple the pvn-phb logic from the pnv-phb4-pec code. This patch adds a
> helper called pnv_phb4_set_stack_phb_props() to remove the code from
> pnv_phb4_pec.c that initiates the object properties of pnv-phb4 devices.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/pci-host/pnv_phb4.c         | 25 +++++++++++++++++++++++++
>   hw/pci-host/pnv_phb4_pec.c     | 12 +-----------
>   include/hw/pci-host/pnv_phb4.h |  1 +
>   3 files changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 83dedc878a..6c1a33bc66 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1158,6 +1158,31 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
>       return &ds->dma_as;
>   }
>   
> +/*
> + * Set the object properties of a phb in relation with its stack.
> + *
> + * Note: stack->pec must not be NULL.
> + */
> +void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack,
> +                                  PnvPHB4 *phb)
> +{
> +    PnvPhb4PecState *pec = stack->pec;
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    char name[64];
> +
> +    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
> +             pec->chip_id, pec->index, stack->stack_no);
> +    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(phb),
> +                          &pnv_phb4_xscom_ops, phb, name, 0x40);
> +
> +    object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
> +                            &error_fatal);
> +    object_property_set_int(OBJECT(phb), "version", pecc->version,
> +                            &error_fatal);
> +    object_property_set_link(OBJECT(phb), "stack", OBJECT(stack),
> +                             &error_abort);
> +}
> +
>   static void pnv_phb4_instance_init(Object *obj)
>   {
>       PnvPHB4 *phb = PNV_PHB4(obj);
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index f3e4fa0c82..057d4b07fb 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -577,17 +577,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>                             PHB4_PEC_PCI_STK_REGS_COUNT);
>   
>       /* PHB pass-through */
> -    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
> -             pec->chip_id, pec->index, stack->stack_no);
> -    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
> -                          &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
> -
> -    object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
> -                            &error_fatal);
> -    object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
> -                             &error_abort);
> +    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
>           return;
>       }
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index ea63df9676..7f5b9cc0ac 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -131,6 +131,7 @@ struct PnvPHB4 {
>   
>   void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
>   void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
> +void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
>   extern const MemoryRegionOps pnv_phb4_xscom_ops;
>   
>   /*
> 


