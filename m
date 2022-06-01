Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240F2539E3D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 09:33:52 +0200 (CEST)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwIrX-0002gh-8Z
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 03:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwInf-0000Wu-Oz; Wed, 01 Jun 2022 03:29:51 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:41657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwInc-0005u2-RO; Wed, 01 Jun 2022 03:29:51 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f33f0f5b1dso1599220fac.8; 
 Wed, 01 Jun 2022 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g8wv/vdo4yYVDUH41xnR9CJcy6DVHjLcFq37920n9bs=;
 b=jyCvNtT+ljgkNtKaWqCrw/JyrFFxTer5AQCyXTXvdxUUlGqa+BFvj8nEV3Hy9IeFI9
 Br5urmdq50BZVH3CW+n9tQn3KRWXjIrYdTTw7H8QbgB3KFIYQov4pA9D1yAMC74Lb1yt
 j4tZfQAW1OKIU+p7zVPfIgqUtSjn8eGiweeSyf0mJ2Khiu9LPi64D0rZNq4Qf380WPvD
 VY8hL/QoRwnWQVhdAVbC9E+A6x7BbLUDtkqM90sycB9XW4WIHcigLWGcCJvvWwsFWtSv
 YYGj6A/jaYbUpGaLxHTmhWLWXNL8l8XWvC6IzgT7i4wiIMnFjrmYC3L3fsBIxoGsXnVt
 9SLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g8wv/vdo4yYVDUH41xnR9CJcy6DVHjLcFq37920n9bs=;
 b=da1M3ja/cAuOCLnCM+1ITdtDAHHaEZUU/5H7O63h8jciWHCxa3LzuJnbPZFM2xGWYv
 DJ68Op1C+gHR9DU65CtZ5pIjlmC0SaY3CMwqT3QrJsfEAJ37r1w46AaAULUoGflbBt0r
 huy41AR+FNKDRJKk4R7iehSGZdpGZ5poUeg6romizGhNQtX5wYV//dAg8rZGfcK4Noij
 651lmhS0aNwPzvrTABc9JVrGux6LQ23gjhaOhgzdYc6a0wBHqyzTGYiK/zYZO3SvmFm7
 fPujs/CFcPFQnHJQ1/AbDZzNIoYXVBkHyxuZfh+6B6O1Nadd3W2H/U2Y0X4jV+qu+vSu
 tf3Q==
X-Gm-Message-State: AOAM530g6hROqOC0ma32zcV/SknC/aFYqjg1JntrcSyrufajasi+DYvB
 afomcTdhJ8Whnx0eZlBVz37XAjybg1QeQw==
X-Google-Smtp-Source: ABdhPJz6svEe4oinWdkxzAvdIRDdAw8ppWZQu0z3FUxWJXsqBBf/2ijR6EWoLOklxnbJ8EYXIWLJAQ==
X-Received: by 2002:a05:6870:4345:b0:de:f347:e2cd with SMTP id
 x5-20020a056870434500b000def347e2cdmr15649231oah.113.1654068586401; 
 Wed, 01 Jun 2022 00:29:46 -0700 (PDT)
Received: from [192.168.10.102] ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 bq5-20020a0568201a0500b0035eb4e5a6c8sm537977oob.30.2022.06.01.00.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:29:46 -0700 (PDT)
Message-ID: <6856521e-e18f-0e85-57d6-fc132e8aa2a8@gmail.com>
Date: Wed, 1 Jun 2022 04:29:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 12/16] ppc/pnv: remove pnv-phb3-root-port
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-13-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220531214917.31668-13-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/31/22 18:49, Daniel Henrique Barboza wrote:
> The unified pnv-phb-root-port can be used in its place. There is no ABI
> breakage in doing so because no official QEMU release introduced user
> creatable pnv-phb3-root-port devices.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb.c          | 10 ++++--
>   hw/pci-host/pnv_phb3.c         | 57 ----------------------------------
>   hw/ppc/pnv.c                   |  1 +
>   include/hw/pci-host/pnv_phb3.h |  6 ----
>   4 files changed, 8 insertions(+), 66 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index 5047e90d3a..d1e8d28e97 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -35,7 +35,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>       switch (phb->version) {
>       case 3:
>           phb_typename = g_strdup(TYPE_PNV_PHB3);
> -        phb_rootport_typename = g_strdup(TYPE_PNV_PHB3_ROOT_PORT);
> +        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
>           break;
>       case 4:
>           phb_typename = g_strdup(TYPE_PNV_PHB4);
> @@ -170,6 +170,11 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
>       pci_config_set_interrupt_pin(pci->config, 0);
>   }
>   
> +static Property pnv_phb_root_port_properties[] = {
> +    DEFINE_PROP_UINT32("version", PnvPHB, version, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>   static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -180,11 +185,10 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
>   
>       device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
>                                       &rpc->parent_realize);
> -
>       device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
>                                     &rpc->parent_reset);
>       dc->reset = &pnv_phb_root_port_reset;
> -
> +    device_class_set_props(dc, pnv_phb_root_port_properties);
>       dc->user_creatable = true;
>   
>       k->vendor_id = PCI_VENDOR_ID_IBM;
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 839c2dad00..dc1068443a 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1152,66 +1152,9 @@ static const TypeInfo pnv_phb3_root_bus_info = {
>       },
>   };
>   
> -static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
> -{
> -    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
> -    PCIDevice *pci = PCI_DEVICE(dev);
> -    PCIBus *bus = pci_get_bus(pci);
> -    PnvPHB *phb = NULL;
> -    Error *local_err = NULL;
> -
> -    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
> -                                         TYPE_PNV_PHB);
> -
> -    if (!phb) {
> -        error_setg(errp,
> -"pnv_phb3_root_port devices must be connected to pnv-phb3 buses");
> -        return;
> -    }
> -
> -    /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
> -
> -    rpc->parent_realize(dev, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -    pci_config_set_interrupt_pin(pci->config, 0);
> -}
> -
> -static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
> -{
> -    DeviceClass *dc = DEVICE_CLASS(klass);
> -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> -    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
> -
> -    dc->desc     = "IBM PHB3 PCIE Root Port";
> -
> -    device_class_set_parent_realize(dc, pnv_phb3_root_port_realize,
> -                                    &rpc->parent_realize);
> -    dc->user_creatable = true;
> -
> -    k->vendor_id = PCI_VENDOR_ID_IBM;
> -    k->device_id = 0x03dc;
> -    k->revision  = 0;
> -
> -    rpc->exp_offset = 0x48;
> -    rpc->aer_offset = 0x100;
> -}
> -
> -static const TypeInfo pnv_phb3_root_port_info = {
> -    .name          = TYPE_PNV_PHB3_ROOT_PORT,
> -    .parent        = TYPE_PCIE_ROOT_PORT,
> -    .instance_size = sizeof(PnvPHB3RootPort),
> -    .class_init    = pnv_phb3_root_port_class_init,
> -};
> -
>   static void pnv_phb3_register_types(void)
>   {
>       type_register_static(&pnv_phb3_root_bus_info);
> -    type_register_static(&pnv_phb3_root_port_info);
>       type_register_static(&pnv_phb3_type_info);
>       type_register_static(&pnv_phb3_iommu_memory_region_info);
>   }
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 4d2ea405db..5da5067b67 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -2148,6 +2148,7 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
>   
>       static GlobalProperty phb_compat[] = {
>           { TYPE_PNV_PHB, "version", "3" },
> +        { TYPE_PNV_PHB_ROOT_PORT, "version", "3" },

Not sure how this ended up here. Consider it removed.



Daniel

>       };
>   
>       mc->desc = "IBM PowerNV (Non-Virtualized) POWER8";
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index 3b9ff1096a..bff69201d9 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -108,12 +108,6 @@ struct PnvPBCQState {
>    */
>   #define TYPE_PNV_PHB3_ROOT_BUS "pnv-phb3-root"
>   
> -#define TYPE_PNV_PHB3_ROOT_PORT "pnv-phb3-root-port"
> -
> -typedef struct PnvPHB3RootPort {
> -    PCIESlot parent_obj;
> -} PnvPHB3RootPort;
> -
>   /*
>    * PHB3 PCIe Host Bridge for PowerNV machines (POWER8)
>    */

