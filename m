Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106394C72B8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:28:10 +0100 (CET)
Received: from localhost ([::1]:52478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOjof-0004uZ-3S
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOjnL-0003cr-NW; Mon, 28 Feb 2022 12:26:48 -0500
Received: from [2607:f8b0:4864:20::22d] (port=36417
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nOjnI-0002qP-M3; Mon, 28 Feb 2022 12:26:46 -0500
Received: by mail-oi1-x22d.google.com with SMTP id p15so13859871oip.3;
 Mon, 28 Feb 2022 09:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nB4h5qQZHtV6KHw71Wi8CsqdOJxCgrpsiD+4FaGU5G0=;
 b=C9TRhIOJUWwG23eR0fNBSnuup2r2Zp+3XC7GCVuRwiwSlGifjycwGQCSIc4u9lG/R6
 PteS9cA/hGDz7iTAuZfcV3S0w9QgrPfZi0RcgdokqcF7/W1BkYfrFNBxtvJCFEsKqFfL
 XGLPgwz8xM3u3Tx2IdMy1HLxw7nafM017FeCaeComt3EKkFwvyz4WicFqCBEK8QW+6bQ
 GmTHP299tFl6lnmeT1S2KllGHilcuQ+fTixXz3GMn0CJfHbmXZCyt8L9j4kdbgOFDSYa
 jL+0cF2+NSk67gdB1FfJUF6/U3b0ShFBoICZQkP97eRX9SNJUU+1DDMrqtyMqdfdZQDv
 hOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nB4h5qQZHtV6KHw71Wi8CsqdOJxCgrpsiD+4FaGU5G0=;
 b=ObwKzNKZUUQe74N3zAaQoRucZDP9mBkANAaTYr8N8WVVGQhdYzVr2xTGgyOrLVnvec
 TN75W/lbYMLi78K5aiNkVIp2idmm9JeMBrooykg6l/V5Qg42wn805naYHeqDiKOGNB7F
 YIGQ9K9tFo9nww62+KqQm+zSEe0hswKvH5wtVC6yn3sntjEYdblRcasbkbniQrJ5eOBw
 ieUFt+JMYT0O1KeSGUcWCu7nk32MHx3vKLTZ+6HLlLjcy8ZMUpqs80wDFFxGdgZ/TBWS
 yq2L/3zX5rrC3GhL4TKdjGl8Laju9B0oGWcOpGB7Sl+x3MyqXIz+sZbdHYwfBngv5Qmk
 axXw==
X-Gm-Message-State: AOAM532502jaFH1Bupl5e8Cd3jijkFz8sgNies81Nlwt8i+AYCQWEve8
 kNr7SFPW842TFBqNIyNQVis=
X-Google-Smtp-Source: ABdhPJyxuCDmUViS1W6waN8ZzmPtzZdd7+osRv+eeqACjAbYoskXRGJyQExG4CIBSObULU19xTu4Fg==
X-Received: by 2002:a05:6808:1706:b0:2d3:8946:a4e with SMTP id
 bc6-20020a056808170600b002d389460a4emr11716276oib.153.1646069202502; 
 Mon, 28 Feb 2022 09:26:42 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a9d74ca000000b005af640e9377sm5229367otl.17.2022.02.28.09.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 09:26:42 -0800 (PST)
Message-ID: <c57763a9-a933-16d2-42e4-fabf968b6499@gmail.com>
Date: Mon, 28 Feb 2022 14:26:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 06/18] ppc/pnv: Add model for POWER10 PHB5 PCIe Host
 bridge
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220228155222.643974-1-clg@kaod.org>
 <20220228155222.643974-7-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220228155222.643974-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/28/22 12:52, Cédric Le Goater wrote:
> PHB4 and PHB5 are very similar. Use the PHB4 models with some minor
> adjustements in a subclass for P10.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h | 12 ++++++++
>   include/hw/ppc/pnv.h           |  3 ++
>   include/hw/ppc/pnv_xscom.h     |  6 ++++
>   hw/pci-host/pnv_phb4.c         | 20 +++++++++++++
>   hw/pci-host/pnv_phb4_pec.c     | 53 ++++++++++++++++++++++++++++++++++
>   hw/ppc/pnv.c                   | 51 ++++++++++++++++++++++++++++++++
>   6 files changed, 145 insertions(+)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 0c7635dec591..fbcf5bfb5585 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -49,6 +49,7 @@ typedef struct PnvPhb4DMASpace {
>    */
>   #define TYPE_PNV_PHB4_ROOT_BUS "pnv-phb4-root"
>   #define TYPE_PNV_PHB4_ROOT_PORT "pnv-phb4-root-port"
> +#define TYPE_PNV_PHB5_ROOT_PORT "pnv-phb5-root-port"
>   
>   typedef struct PnvPHB4RootPort {
>       PCIESlot parent_obj;
> @@ -206,4 +207,15 @@ struct PnvPhb4PecClass {
>       const char *rp_model;
>   };
>   
> +/*
> + * POWER10 definitions
> + */
> +
> +#define PNV_PHB5_VERSION           0x000000a500000001ull
> +#define PNV_PHB5_DEVICE_ID         0x0652
> +
> +#define TYPE_PNV_PHB5_PEC "pnv-phb5-pec"
> +#define PNV_PHB5_PEC(obj) \
> +    OBJECT_CHECK(PnvPhb4PecState, (obj), TYPE_PNV_PHB5_PEC)
> +
>   #endif /* PCI_HOST_PNV_PHB4_H */
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 6449fba39bfb..e5141851faed 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -132,6 +132,9 @@ struct Pnv10Chip {
>   
>       uint32_t     nr_quads;
>       PnvQuad      *quads;
> +
> +#define PNV10_CHIP_MAX_PEC 2
> +    PnvPhb4PecState pecs[PNV10_CHIP_MAX_PEC];
>   };
>   
>   #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 151df15378d1..75db33d46af6 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -137,6 +137,12 @@ struct PnvXScomInterfaceClass {
>   #define PNV10_XSCOM_XIVE2_BASE     0x2010800
>   #define PNV10_XSCOM_XIVE2_SIZE     0x400
>   
> +#define PNV10_XSCOM_PEC_NEST_BASE  0x3011800 /* index goes downwards ... */
> +#define PNV10_XSCOM_PEC_NEST_SIZE  0x100
> +
> +#define PNV10_XSCOM_PEC_PCI_BASE   0x8010800 /* index goes upwards ... */
> +#define PNV10_XSCOM_PEC_PCI_SIZE   0x200
> +
>   void pnv_xscom_realize(PnvChip *chip, uint64_t size, Error **errp);
>   int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
>                    uint64_t xscom_base, uint64_t xscom_size,
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 846e7d0c3e24..5344a6d4a693 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1812,9 +1812,29 @@ static const TypeInfo pnv_phb4_root_port_info = {
>       .class_init    = pnv_phb4_root_port_class_init,
>   };
>   
> +static void pnv_phb5_root_port_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> +
> +    dc->desc     = "IBM PHB5 PCIE Root Port";
> +    dc->user_creatable = true;
> +
> +    k->vendor_id = PCI_VENDOR_ID_IBM;
> +    k->device_id = PNV_PHB5_DEVICE_ID;
> +}
> +
> +static const TypeInfo pnv_phb5_root_port_info = {
> +    .name          = TYPE_PNV_PHB5_ROOT_PORT,
> +    .parent        = TYPE_PNV_PHB4_ROOT_PORT,
> +    .instance_size = sizeof(PnvPHB4RootPort),
> +    .class_init    = pnv_phb5_root_port_class_init,
> +};
> +
>   static void pnv_phb4_register_types(void)
>   {
>       type_register_static(&pnv_phb4_root_bus_info);
> +    type_register_static(&pnv_phb5_root_port_info);
>       type_register_static(&pnv_phb4_root_port_info);
>       type_register_static(&pnv_phb4_type_info);
>       type_register_static(&pnv_phb4_iommu_memory_region_info);
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 40d89fda56e5..0ab36e9c8f3c 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -281,9 +281,62 @@ static const TypeInfo pnv_pec_type_info = {
>       }
>   };
>   
> +/*
> + * POWER10 definitions
> + */
> +
> +static uint32_t pnv_phb5_pec_xscom_pci_base(PnvPhb4PecState *pec)
> +{
> +    return PNV10_XSCOM_PEC_PCI_BASE + 0x1000000 * pec->index;
> +}
> +
> +static uint32_t pnv_phb5_pec_xscom_nest_base(PnvPhb4PecState *pec)
> +{
> +    /* index goes down ... */
> +    return PNV10_XSCOM_PEC_NEST_BASE - 0x1000000 * pec->index;
> +}
> +
> +/*
> + * PEC0 -> 3 stacks
> + * PEC1 -> 3 stacks
> + */
> +static const uint32_t pnv_phb5_pec_num_stacks[] = { 3, 3 };
> +
> +static void pnv_phb5_pec_class_init(ObjectClass *klass, void *data)
> +{
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_CLASS(klass);
> +    static const char compat[] = "ibm,power10-pbcq";
> +    static const char stk_compat[] = "ibm,power10-phb-stack";
> +
> +    pecc->xscom_nest_base = pnv_phb5_pec_xscom_nest_base;
> +    pecc->xscom_pci_base  = pnv_phb5_pec_xscom_pci_base;
> +    pecc->xscom_nest_size = PNV10_XSCOM_PEC_NEST_SIZE;
> +    pecc->xscom_pci_size  = PNV10_XSCOM_PEC_PCI_SIZE;
> +    pecc->compat = compat;
> +    pecc->compat_size = sizeof(compat);
> +    pecc->stk_compat = stk_compat;
> +    pecc->stk_compat_size = sizeof(stk_compat);
> +    pecc->version = PNV_PHB5_VERSION;
> +    pecc->num_phbs = pnv_phb5_pec_num_stacks;
> +    pecc->rp_model = TYPE_PNV_PHB5_ROOT_PORT;
> +}
> +
> +static const TypeInfo pnv_phb5_pec_type_info = {
> +    .name          = TYPE_PNV_PHB5_PEC,
> +    .parent        = TYPE_PNV_PHB4_PEC,
> +    .instance_size = sizeof(PnvPhb4PecState),
> +    .class_init    = pnv_phb5_pec_class_init,
> +    .class_size    = sizeof(PnvPhb4PecClass),
> +    .interfaces    = (InterfaceInfo[]) {
> +        { TYPE_PNV_XSCOM_INTERFACE },
> +        { }
> +    }
> +};
> +
>   static void pnv_pec_register_types(void)
>   {
>       type_register_static(&pnv_pec_type_info);
> +    type_register_static(&pnv_phb5_pec_type_info);
>   }
>   
>   type_init(pnv_pec_register_types);
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 514019366c86..8ecdfb1884b4 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -727,6 +727,9 @@ static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
>   
>       pnv_xive2_pic_print_info(&chip10->xive, mon);
>       pnv_psi_pic_print_info(&chip10->psi, mon);
> +
> +    object_child_foreach_recursive(OBJECT(chip),
> +                         pnv_chip_power9_pic_print_info_child, mon);
>   }
>   
>   /* Always give the first 1GB to chip 0 else we won't boot */
> @@ -1581,7 +1584,10 @@ static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
>   
>   static void pnv_chip_power10_instance_init(Object *obj)
>   {
> +    PnvChip *chip = PNV_CHIP(obj);
>       Pnv10Chip *chip10 = PNV10_CHIP(obj);
> +    PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
> +    int i;
>   
>       object_initialize_child(obj, "xive", &chip10->xive, TYPE_PNV_XIVE2);
>       object_property_add_alias(obj, "xive-fabric", OBJECT(&chip10->xive),
> @@ -1589,6 +1595,15 @@ static void pnv_chip_power10_instance_init(Object *obj)
>       object_initialize_child(obj, "psi", &chip10->psi, TYPE_PNV10_PSI);
>       object_initialize_child(obj, "lpc", &chip10->lpc, TYPE_PNV10_LPC);
>       object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
> +
> +    if (defaults_enabled()) {
> +        chip->num_pecs = pcc->num_pecs;
> +    }
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
> +        object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
> +                                TYPE_PNV_PHB5_PEC);
> +    }
>   }
>   
>   static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
> @@ -1609,6 +1624,34 @@ static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **errp)
>       }
>   }
>   
> +static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
> +{
> +    Pnv10Chip *chip10 = PNV10_CHIP(chip);
> +    int i;
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
> +        PnvPhb4PecState *pec = &chip10->pecs[i];
> +        PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +        uint32_t pec_nest_base;
> +        uint32_t pec_pci_base;
> +
> +        object_property_set_int(OBJECT(pec), "index", i, &error_fatal);
> +        object_property_set_int(OBJECT(pec), "chip-id", chip->chip_id,
> +                                &error_fatal);
> +        object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
> +                                 &error_fatal);
> +        if (!qdev_realize(DEVICE(pec), NULL, errp)) {
> +            return;
> +        }
> +
> +        pec_nest_base = pecc->xscom_nest_base(pec);
> +        pec_pci_base = pecc->xscom_pci_base(pec);
> +
> +        pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
> +        pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
> +    }
> +}
> +
>   static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
>   {
>       PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
> @@ -1687,6 +1730,13 @@ static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
>       }
>       pnv_xscom_add_subregion(chip, PNV10_XSCOM_OCC_BASE,
>                               &chip10->occ.xscom_regs);
> +
> +    /* PHBs */
> +    pnv_chip_power10_phb_realize(chip, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>   }
>   
>   static uint32_t pnv_chip_power10_xscom_pcba(PnvChip *chip, uint64_t addr)
> @@ -1713,6 +1763,7 @@ static void pnv_chip_power10_class_init(ObjectClass *klass, void *data)
>       k->xscom_core_base = pnv_chip_power10_xscom_core_base;
>       k->xscom_pcba = pnv_chip_power10_xscom_pcba;
>       dc->desc = "PowerNV Chip POWER10";
> +    k->num_pecs = PNV10_CHIP_MAX_PEC;
>   
>       device_class_set_parent_realize(dc, pnv_chip_power10_realize,
>                                       &k->parent_realize);

