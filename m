Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFF1466969
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:51:45 +0100 (CET)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqFE-0008LR-7l
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:51:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqCk-00061o-P9; Thu, 02 Dec 2021 12:49:10 -0500
Received: from [2607:f8b0:4864:20::82e] (port=33559
 helo=mail-qt1-x82e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqCi-0004US-Vr; Thu, 02 Dec 2021 12:49:10 -0500
Received: by mail-qt1-x82e.google.com with SMTP id n15so607878qta.0;
 Thu, 02 Dec 2021 09:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8+AbiQb29vT2WPogX5x1fmTUAJ9NRm/8Darb0l1oEF0=;
 b=SICvprMSA5FcI142BAI3nDc/q6he9nFPXiHiapoT797AUU7IP+9KSAu30Bp9On3vDE
 XB1QfSWyCVb0nV0zCnBoASDthWdoxF1osKOENX/XudscOWyeNkpCJMdFGyLQhULpmCnu
 hz+1QZJUMO/VSFlbNDBgjewNLouKQ4FN6n/va6zBAcBWqkj5Vf1SbgF2Voybon4h/Rmp
 r+gVphyGFtg0oxsrwMjwo0lj6D87AvIy/Oo+Zv3nOztKhcvwCWokNMTXBpz4xot9noDl
 g6iGUev8CGujQ8UMAu7zA+S+x4w0YZerSNooAKQymEolmVek2hYB0+YXkewxj2TqhVgC
 Cb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8+AbiQb29vT2WPogX5x1fmTUAJ9NRm/8Darb0l1oEF0=;
 b=AQj7Ufi9rRbgZnqf83cLJda+OM9QM1Oz67nV1eqQlmuflbwcYV2/bPujNx5mqggS5t
 s8Rg2fDjNsT254HEMHqs4d+f+D57gbsmemnpqDYCMbEmhtWyuVCyzr/dF2AVUhecb2iw
 Lq/w3n9yeOyYdAnJ4IL08oaU5H7SolrzqblwwYhiUxqc84GLZfbIjz8WxLA0stQBGgWF
 HzRnF8/T7t9BdXSFhnWcPvyAN6eSszWU6O/hsR+ZOWg6n+d+ZDs3Fq7aJu07iq8a9jfO
 y+NwZpWv5vNFOBYRT+sZwQ4zTzpXdxPDuO8TMpctTLVo7dU03IufTJs0gWa/bGKpo9k3
 rVZw==
X-Gm-Message-State: AOAM533MBeaHhA+CQ4hrFoyVdE79x7R8KWw4e7lrvjSEZQXloeyFqMbd
 RqAXj4LVq08+8YQPqSnfDYc=
X-Google-Smtp-Source: ABdhPJw4IU5YegGoYhb2RfEpd5ayrLZ5dA31igCbooeiCwATUEcB+bHhEptP0gI6Oc+lkTCz64u7Dw==
X-Received: by 2002:a05:622a:178c:: with SMTP id
 s12mr15302806qtk.43.1638467347777; 
 Thu, 02 Dec 2021 09:49:07 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id c13sm315513qtx.51.2021.12.02.09.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:49:07 -0800 (PST)
Message-ID: <4c939dfa-1898-5cae-241c-b22469cba2c3@gmail.com>
Date: Thu, 2 Dec 2021 14:49:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 13/14] ppc/pnv: Move realize of PEC stacks under the PEC
 model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-14-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-14-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/2/21 11:42, Cédric Le Goater wrote:
> This change will help us providing support for user created PHB4
> devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4_pec.c | 36 ++++++++++++++++++++++++++++++++----
>   hw/ppc/pnv.c               | 31 +------------------------------
>   2 files changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index dfed2af0f7df..9b081d543057 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -556,6 +556,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
>       PnvPhb4PecState *pec = stack->pec;
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    PnvChip *chip = pec->chip;
> +    uint32_t pec_nest_base;
> +    uint32_t pec_pci_base;
>       char name[64];
>   
>       assert(pec);
> @@ -579,10 +583,34 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
>                             &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
>   
> -    /*
> -     * Let the machine/chip realize the PHB object to customize more
> -     * easily some fields
> -     */
> +    {
> +        Object *obj = OBJECT(&stack->phb);
> +
> +        object_property_set_int(obj, "chip-id", pec->chip_id, &error_fatal);
> +        object_property_set_int(obj, "version", pecc->version, &error_fatal);
> +        object_property_set_int(obj, "device-id", pecc->device_id,
> +                                &error_fatal);
> +        object_property_set_link(obj, "stack", OBJECT(stack),
> +                                 &error_abort);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
> +            return;
> +        }
> +    }
> +
> +    pec_nest_base = pecc->xscom_nest_base(pec);
> +    pec_pci_base = pecc->xscom_pci_base(pec);
> +
> +    /* Populate the XSCOM address space. */
> +    pnv_xscom_add_subregion(chip,
> +                            pec_nest_base + 0x40 * (stack->stack_no + 1),
> +                            &stack->nest_regs_mr);
> +    pnv_xscom_add_subregion(chip,
> +                            pec_pci_base + 0x40 * (stack->stack_no + 1),
> +                            &stack->pci_regs_mr);
> +    pnv_xscom_add_subregion(chip,
> +                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> +                            0x40 * stack->stack_no,
> +                            &stack->phb_regs_mr);
>   }
>   
>   static Property pnv_pec_stk_properties[] = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 3a550eed0f36..7e13b15241fd 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1370,7 +1370,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
>   static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>   {
>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
> -    int i, j;
> +    int i;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
> @@ -1392,35 +1392,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>   
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
> -
> -        for (j = 0; j < pec->num_stacks; j++) {
> -            PnvPhb4PecStack *stack = &pec->stacks[j];
> -            Object *obj = OBJECT(&stack->phb);
> -
> -            object_property_set_int(obj, "chip-id", chip->chip_id,
> -                                    &error_fatal);
> -            object_property_set_int(obj, "version", pecc->version,
> -                                    &error_fatal);
> -            object_property_set_int(obj, "device-id", pecc->device_id,
> -                                    &error_fatal);
> -            object_property_set_link(obj, "stack", OBJECT(stack),
> -                                     &error_abort);
> -            if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
> -                return;
> -            }
> -
> -            /* Populate the XSCOM address space. */
> -            pnv_xscom_add_subregion(chip,
> -                                   pec_nest_base + 0x40 * (stack->stack_no + 1),
> -                                   &stack->nest_regs_mr);
> -            pnv_xscom_add_subregion(chip,
> -                                    pec_pci_base + 0x40 * (stack->stack_no + 1),
> -                                    &stack->pci_regs_mr);
> -            pnv_xscom_add_subregion(chip,
> -                                    pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> -                                    0x40 * stack->stack_no,
> -                                    &stack->phb_regs_mr);
> -        }
>       }
>   }
>   
> 

