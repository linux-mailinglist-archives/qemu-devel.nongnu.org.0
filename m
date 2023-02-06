Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DF68B70B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwW6-0003r2-8y; Mon, 06 Feb 2023 03:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pOwVw-0003pq-No
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:06:16 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pOwVt-00035T-4D
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:06:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C761928065;
 Mon,  6 Feb 2023 08:06:05 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 6 Feb
 2023 09:06:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002a8fc6efd-5d4b-4c64-b758-0e73ed562cb0,
 CF69EBA19D99189A5BFA69977647E68A070273F7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <73ecb8de-8f11-c83c-d464-9325da36f079@kaod.org>
Date: Mon, 6 Feb 2023 09:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] hw/ppc/pnv: Set QDev properties using QDev API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: BALATON Zoltan <balaton@eik.bme.hu>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Markus Armbruster <armbru@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230203211623.50930-1-philmd@linaro.org>
 <20230203211623.50930-6-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230203211623.50930-6-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 102c2c92-e8a3-4616-b796-152c5d09bb11
X-Ovh-Tracer-Id: 13037076499997559730
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeghedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpsggrlhgrthhonhesvghikhdrsghmvgdrhhhupdhmrghrkhdrtggrvhgvqdgrhihlrghnugesihhlrghnuggvrdgtohdruhhkpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhhphhouhhsshhinhesrhgvrggtthhoshdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdprghrmhgsrhhusehrvgguhhgrthdrtghomhdpuggrvhhiugesghhisghsoh
 hnrdgurhhophgsvggrrhdrihgurdgruhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/3/23 22:16, Philippe Mathieu-Daudé wrote:
> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
> 
> One call in pnv_psi_power8_realize() propagate the
> Error* argument:
> 
>    if (!object_property_set_int(OBJECT(ics), "nr-irqs",
>                                 PSI_NUM_INTERRUPTS, errp)) {
>        return;
>    }
> 
> TYPE_ICS "nr-irqs" is declared in ics_properties[],
> itself always registered in ics_class_init(); so converting
> this errp to &error_abort is safe.

yes. That's ok. I think this model was one of the first I converted to QOM.

> 
> All other calls use either errp=&error_abort or &error_fatal,
> so converting to the QDev API is almost a no-op (QDev API
> always uses &error_abort).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/intc/pnv_xive.c         | 11 ++++------
>   hw/intc/pnv_xive2.c        | 15 +++++---------
>   hw/pci-host/pnv_phb3.c     |  9 +++------
>   hw/pci-host/pnv_phb4.c     |  4 ++--
>   hw/pci-host/pnv_phb4_pec.c | 10 +++-------
>   hw/ppc/pnv.c               | 41 ++++++++++++++++----------------------
>   hw/ppc/pnv_psi.c           | 10 +++-------
>   7 files changed, 37 insertions(+), 63 deletions(-)
> 
> diff --git a/hw/intc/pnv_xive.c b/hw/intc/pnv_xive.c
> index 622f9d28b7..ccc1ea5380 100644
> --- a/hw/intc/pnv_xive.c
> +++ b/hw/intc/pnv_xive.c
> @@ -1857,17 +1857,14 @@ static void pnv_xive_realize(DeviceState *dev, Error **errp)
>        * resized dynamically when the controller is configured by the FW
>        * to limit accesses to resources not provisioned.
>        */
> -    object_property_set_int(OBJECT(xsrc), "nr-irqs", PNV_XIVE_NR_IRQS,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive), &error_abort);
> +    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", PNV_XIVE_NR_IRQS);
> +    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(xive));
>       if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
>           return;
>       }
>   
> -    object_property_set_int(OBJECT(end_xsrc), "nr-ends", PNV_XIVE_NR_ENDS,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
> -                             &error_abort);
> +    qdev_prop_set_uint32(DEVICE(end_xsrc), "nr-ends", PNV_XIVE_NR_ENDS);
> +    qdev_prop_set_link(DEVICE(end_xsrc), "xive", OBJECT(xive));
>       if (!qdev_realize(DEVICE(end_xsrc), NULL, errp)) {
>           return;
>       }
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index 7176d70234..d7695f65e7 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -1821,22 +1821,17 @@ static void pnv_xive2_realize(DeviceState *dev, Error **errp)
>        * resized dynamically when the controller is configured by the FW
>        * to limit accesses to resources not provisioned.
>        */
> -    object_property_set_int(OBJECT(xsrc), "flags", XIVE_SRC_STORE_EOI,
> -                            &error_fatal);
> -    object_property_set_int(OBJECT(xsrc), "nr-irqs", PNV_XIVE2_NR_IRQS,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(xive),
> -                             &error_fatal);
> +    qdev_prop_set_uint64(DEVICE(xsrc), "flags", XIVE_SRC_STORE_EOI);
> +    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", PNV_XIVE2_NR_IRQS);
> +    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(xive));
>       qdev_realize(DEVICE(xsrc), NULL, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
>           return;
>       }
>   
> -    object_property_set_int(OBJECT(end_xsrc), "nr-ends", PNV_XIVE2_NR_ENDS,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(end_xsrc), "xive", OBJECT(xive),
> -                             &error_abort);
> +    qdev_prop_set_uint32(DEVICE(end_xsrc), "nr-ends", PNV_XIVE2_NR_ENDS);
> +    qdev_prop_set_link(DEVICE(end_xsrc), "xive", OBJECT(xive));
>       qdev_realize(DEVICE(end_xsrc), NULL, &local_err);
>       if (local_err) {
>           error_propagate(errp, local_err);
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 7a21497cf8..6da9053ffa 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1029,8 +1029,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>       /* LSI sources */
>       object_property_set_link(OBJECT(&phb->lsis), "xics", OBJECT(pnv),
>                                &error_abort);
> -    object_property_set_int(OBJECT(&phb->lsis), "nr-irqs", PNV_PHB3_NUM_LSI,
> -                            &error_abort);
> +    qdev_prop_set_uint32(DEVICE(&phb->lsis), "nr-irqs", PNV_PHB3_NUM_LSI);
>       if (!qdev_realize(DEVICE(&phb->lsis), NULL, errp)) {
>           return;
>       }
> @@ -1046,15 +1045,13 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>                                &error_abort);
>       object_property_set_link(OBJECT(&phb->msis), "xics", OBJECT(pnv),
>                                &error_abort);
> -    object_property_set_int(OBJECT(&phb->msis), "nr-irqs", PHB3_MAX_MSI,
> -                            &error_abort);
> +    qdev_prop_set_uint32(DEVICE(&phb->msis), "nr-irqs", PHB3_MAX_MSI);
>       if (!qdev_realize(DEVICE(&phb->msis), NULL, errp)) {
>           return;
>       }
>   
>       /* Power Bus Common Queue */
> -    object_property_set_link(OBJECT(&phb->pbcq), "phb", OBJECT(phb),
> -                             &error_abort);
> +    qdev_prop_set_link(DEVICE(&phb->pbcq), "phb", OBJECT(phb));
>       if (!qdev_realize(DEVICE(&phb->pbcq), NULL, errp)) {
>           return;
>       }
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index ccbde841fc..c4e7cb0efe 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1583,8 +1583,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       } else {
>           nr_irqs = PNV_PHB4_MAX_INTs >> 1;
>       }
> -    object_property_set_int(OBJECT(xsrc), "nr-irqs", nr_irqs, &error_fatal);
> -    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(phb), &error_fatal);
> +    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", nr_irqs);
> +    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(phb));
>       if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
>           return;
>       }
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 43267a428f..9c21382330 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -120,13 +120,9 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
>       int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
>   
>       object_property_add_child(OBJECT(pec), "phb[*]", OBJECT(phb));
> -    object_property_set_link(OBJECT(phb), "pec", OBJECT(pec),
> -                             &error_abort);
> -    object_property_set_int(OBJECT(phb), "chip-id", pec->chip_id,
> -                            &error_fatal);
> -    object_property_set_int(OBJECT(phb), "index", phb_id,
> -                            &error_fatal);
> -
> +    qdev_prop_set_link(DEVICE(phb), "pec", OBJECT(pec));
> +    qdev_prop_set_uint32(DEVICE(phb), "chip-id", pec->chip_id);
> +    qdev_prop_set_uint32(DEVICE(phb), "index", phb_id);
>       if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>           return;
>       }
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 44b1fbbc93..7c6d5e4320 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -954,35 +954,31 @@ static void pnv_init(MachineState *machine)
>       pnv->chips = g_new0(PnvChip *, pnv->num_chips);
>       for (i = 0; i < pnv->num_chips; i++) {
>           char chip_name[32];
> -        Object *chip = OBJECT(qdev_new(chip_typename));
> +        DeviceState *chip = qdev_new(chip_typename);
>           uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, i);
>   
>           pnv->chips[i] = PNV_CHIP(chip);
>   
> +        snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
> +        object_property_add_child(OBJECT(pnv), chip_name, OBJECT(chip));
> +
>           /* Distribute RAM among the chips  */
> -        object_property_set_int(chip, "ram-start", chip_ram_start,
> -                                &error_fatal);
> -        object_property_set_int(chip, "ram-size", chip_ram_size,
> -                                &error_fatal);
> +        qdev_prop_set_uint64(chip, "ram-start", chip_ram_start);
> +        qdev_prop_set_uint64(chip, "ram-size", chip_ram_size);
>           chip_ram_start += chip_ram_size;
>   
> -        snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
> -        object_property_add_child(OBJECT(pnv), chip_name, chip);
> -        object_property_set_int(chip, "chip-id", i, &error_fatal);
> -        object_property_set_int(chip, "nr-cores", machine->smp.cores,
> -                                &error_fatal);
> -        object_property_set_int(chip, "nr-threads", machine->smp.threads,
> -                                &error_fatal);
> +        qdev_prop_set_uint32(chip, "chip-id", i);
> +        qdev_prop_set_uint32(chip, "nr-cores", machine->smp.cores);
> +        qdev_prop_set_uint32(chip, "nr-threads", machine->smp.threads);
>           /*
>            * The POWER8 machine use the XICS interrupt interface.
>            * Propagate the XICS fabric to the chip and its controllers.
>            */
>           if (object_dynamic_cast(OBJECT(pnv), TYPE_XICS_FABRIC)) {
> -            object_property_set_link(chip, "xics", OBJECT(pnv), &error_abort);
> +            qdev_prop_set_link(chip, "xics", OBJECT(pnv));
>           }
>           if (object_dynamic_cast(OBJECT(pnv), TYPE_XIVE_FABRIC)) {
> -            object_property_set_link(chip, "xive-fabric", OBJECT(pnv),
> -                                     &error_abort);
> +            qdev_prop_set_link(chip, "xive-fabric", OBJECT(pnv));
>           }
>           sysbus_realize_and_unref(SYS_BUS_DEVICE(chip), &error_fatal);
>       }
> @@ -1492,7 +1488,7 @@ static void pnv_chip_quad_realize_one(PnvChip *chip, PnvQuad *eq,
>                                          sizeof(*eq), TYPE_PNV_QUAD,
>                                          &error_fatal, NULL);
>   
> -    object_property_set_int(OBJECT(eq), "quad-id", core_id, &error_fatal);
> +    qdev_prop_set_uint32(DEVICE(eq), "quad-id", core_id);
>       qdev_realize(DEVICE(eq), NULL, &error_fatal);
>   }
>   
> @@ -1969,16 +1965,13 @@ static void pnv_chip_core_realize(PnvChip *chip, Error **errp)
>           snprintf(core_name, sizeof(core_name), "core[%d]", core_hwid);
>           object_property_add_child(OBJECT(chip), core_name, OBJECT(pnv_core));
>           chip->cores[i] = pnv_core;
> -        object_property_set_int(OBJECT(pnv_core), "nr-threads",
> -                                chip->nr_threads, &error_fatal);
> +        qdev_prop_set_uint32(DEVICE(pnv_core), "nr-threads", chip->nr_threads);
>           object_property_set_int(OBJECT(pnv_core), CPU_CORE_PROP_CORE_ID,
>                                   core_hwid, &error_fatal);
> -        object_property_set_int(OBJECT(pnv_core), "pir",
> -                                pcc->core_pir(chip, core_hwid), &error_fatal);
> -        object_property_set_int(OBJECT(pnv_core), "hrmor", pnv->fw_load_addr,
> -                                &error_fatal);
> -        object_property_set_link(OBJECT(pnv_core), "chip", OBJECT(chip),
> -                                 &error_abort);
> +        qdev_prop_set_uint32(DEVICE(pnv_core), "pir",
> +                             pcc->core_pir(chip, core_hwid));
> +        qdev_prop_set_uint64(DEVICE(pnv_core), "hrmor", pnv->fw_load_addr);
> +        qdev_prop_set_link(DEVICE(pnv_core), "chip", OBJECT(chip));
>           qdev_realize(DEVICE(pnv_core), NULL, &error_fatal);
>   
>           /* Each core has an XSCOM MMIO region */
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index 8aa09ab26b..fb90d47138 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -492,10 +492,7 @@ static void pnv_psi_power8_realize(DeviceState *dev, Error **errp)
>       unsigned int i;
>   
>       /* Create PSI interrupt control source */
> -    if (!object_property_set_int(OBJECT(ics), "nr-irqs", PSI_NUM_INTERRUPTS,
> -                                 errp)) {
> -        return;
> -    }
> +    qdev_prop_set_uint32(DEVICE(ics), "nr-irqs", PSI_NUM_INTERRUPTS);
>       if (!qdev_realize(DEVICE(ics), NULL, errp)) {
>           return;
>       }
> @@ -849,9 +846,8 @@ static void pnv_psi_power9_realize(DeviceState *dev, Error **errp)
>       XiveSource *xsrc = &PNV9_PSI(psi)->source;
>       int i;
>   
> -    object_property_set_int(OBJECT(xsrc), "nr-irqs", PSIHB9_NUM_IRQS,
> -                            &error_fatal);
> -    object_property_set_link(OBJECT(xsrc), "xive", OBJECT(psi), &error_abort);
> +    qdev_prop_set_uint32(DEVICE(xsrc), "nr-irqs", PSIHB9_NUM_IRQS);
> +    qdev_prop_set_link(DEVICE(xsrc), "xive", OBJECT(psi));
>       if (!qdev_realize(DEVICE(xsrc), NULL, errp)) {
>           return;
>       }


