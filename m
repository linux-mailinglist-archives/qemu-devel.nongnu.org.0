Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24F47D677
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:22:44 +0100 (CET)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06GB-00036i-M2
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n067A-000514-4V; Wed, 22 Dec 2021 13:13:24 -0500
Received: from [2607:f8b0:4864:20::f2e] (port=39680
 helo=mail-qv1-xf2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0678-00058n-Bw; Wed, 22 Dec 2021 13:13:23 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id g15so3048636qvi.6;
 Wed, 22 Dec 2021 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Elt6BYEPH23ze1hNDLviq5O+1djJRiKsWaMJ9sO9GAs=;
 b=FinrGHjIfR1VusDEbo2j3IID5282jmVlmLNFzN87D3DW9ukZDIlz5aZjXAvwNfjUmL
 XqPOYNTZ/gvJJmjkx8X7raVouwjFrOtnwtJQqXLsDUoR8cIA9yBWc4jIdMfTIWEWdmCe
 3mGjQQL8G/QnQPH9j6owSOpruoqo9TIf9yW/zwKGN8vG6sep5NDlquCJwCooSt90GMZk
 vPc6bNmg6wAByheP2IE6sf9C39+y2FHi9ybzcB/dDqdKJB3T62FVVA5s1k5MWBBhmTrK
 vR81nGnq7rxL0d1RULya48kh70ZBNUEC4m+yLP/nsD/IzixAeogT2kd2dUp6tPEMU6fq
 4neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Elt6BYEPH23ze1hNDLviq5O+1djJRiKsWaMJ9sO9GAs=;
 b=CA2rdHzBB2TldLWiOsMzUANXgQR6V98EMJypmA1YRhqcDC/4NwF3Gf0igm5ThFDvpu
 Kq/0ahDUBZMwq6J01rzFTcjdZ5/+Ie3GBuSFCkPVt+8MkbAJTsgC8nOC9O9wtFZ7RDTj
 DXTAUOfx7oMRIlLo7WIOQVJUwJl1m1QDxjP4ACJsBxPGBTCnok7TtH4+LOERngizmjMp
 tiKvYy7GrC8FaZCPE9bMdpB2UpvxTYXtfNvKRbGONyWPfhRLLwvLGizmpSZ0KOIZWBbK
 47HHY0YlMPwpoMQx6gVJ/mCJWP8IAwB0+lpEf0YnnPSKmuaNU98eXupWath6a7pFljdc
 NuZA==
X-Gm-Message-State: AOAM531bZD2QzipEJu0k0cHNojQaO8kr9Hw53nHnK0gAOI9HVb7KeV1+
 gZftf+nH1Zk+aqaWl5dr2DERHRcLYUw=
X-Google-Smtp-Source: ABdhPJz6Lu1MrGUnJSW69i/BrlVta/xlHTS6BbBv/vdIOkHWeU8skjIZ5gTgXq4iv6UkF8PqsQzsxA==
X-Received: by 2002:a05:6214:226e:: with SMTP id
 gs14mr3487021qvb.52.1640196798249; 
 Wed, 22 Dec 2021 10:13:18 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id y18sm2462077qtx.19.2021.12.22.10.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:13:18 -0800 (PST)
Message-ID: <08d94fa5-f88d-4cd7-e7c7-67322126927d@gmail.com>
Date: Wed, 22 Dec 2021 15:13:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] ppc/pnv: Attach PHB4 root port device when defaults
 are enabled
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222063817.1541058-1-clg@kaod.org>
 <20211222063817.1541058-6-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211222063817.1541058-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 12/22/21 03:38, Cédric Le Goater wrote:
> This cleanups the PHB4 model a bit more since the root port is an
> independent device and it will ease our task when adding user created
> PHB4s.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb4.h |  2 --
>   hw/pci-host/pnv_phb4.c         | 11 -----------
>   hw/ppc/pnv.c                   |  9 ++++++++-
>   3 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index 4a19338db35e..ea63df967678 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -78,8 +78,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
>   struct PnvPHB4 {
>       PCIExpressHost parent_obj;
>   
> -    PnvPHB4RootPort root;
> -
>       uint32_t chip_id;
>       uint32_t phb_id;
>   
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 3b50a22b97cd..3b4758c42e26 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1158,12 +1158,6 @@ static void pnv_phb4_instance_init(Object *obj)
>   
>       /* XIVE interrupt source object */
>       object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
> -
> -    /* Root Port */
> -    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB4_ROOT_PORT);
> -
> -    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
> -    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
>   }
>   
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
> @@ -1207,11 +1201,6 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>       pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   
> -    /* Add a single Root port */
> -    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
> -    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
> -
>       /* Setup XIVE Source */
>       if (phb->big_phb) {
>           nr_irqs = PNV_PHB4_MAX_INTs;
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 6edfd6876fd0..7a397698e984 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1403,7 +1403,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
>   static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
>   {
>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
> -    int i;
> +    int i, j;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
> @@ -1425,6 +1425,13 @@ static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
>   
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
> +
> +        for (j = 0; j < pec->num_stacks; j++) {
> +            PnvPHB4 *phb = &pec->stacks[j].phb;
> +
> +            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
> +                                     TYPE_PNV_PHB4_ROOT_PORT);
> +        }
>       }
>   }
>   
> 

