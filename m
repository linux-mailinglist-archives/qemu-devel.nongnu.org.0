Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420B466967
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:51:06 +0100 (CET)
Received: from localhost ([::1]:45202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqEa-0006uW-S1
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:51:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqB9-0004rA-66; Thu, 02 Dec 2021 12:47:31 -0500
Received: from [2607:f8b0:4864:20::834] (port=33552
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msqB6-0003TN-Ge; Thu, 02 Dec 2021 12:47:30 -0500
Received: by mail-qt1-x834.google.com with SMTP id n15so602096qta.0;
 Thu, 02 Dec 2021 09:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GEJwUBt7XJI/Z+3ub/FH0tiBVIHPMeLQJMJu7W0jGvE=;
 b=d8/XPRKGlMzY9UIJrih+9Wqg8RZDl1WvwAPiPc6t5+JezWioQXde8qdyanqFCHsQqB
 3Mr1mKqsC8tomB0AFxR2XNBBTAtdJVIMeT7uW1zghgZ1nfkETuKqcyDwYAiihRQjQbwU
 +Tb8SxPYJueAYv1BLAvx1NgnkrZNtk/Qba17i6r8AJfXm2w8h7NWsRZ008CTeWjqldFn
 7fOOuYXS4lEBBIuHVohuGwks7yHmAfSeN+hhR3eiggbSq7P2ZNkXyA2+cDYRgB2Csvp9
 Lmgmulj/fwDQognr5d7dwT0WlOT2UjNxS+7SKEQgx5XicT5olkwBrYh3eEPx2T21tin0
 27CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GEJwUBt7XJI/Z+3ub/FH0tiBVIHPMeLQJMJu7W0jGvE=;
 b=ba+Tguu5ZUhjPr78SKksLthPJ8W3zuztz15QdGL06XbMRmx84ACpmRWkOBiXMOsh7g
 jYRQJLWBnE9zIoGDII8au6Up84v3bR71P4ZpIf/QuQd3VhAUfASEJWCWv6Vq2xKHT5Au
 4g38+OPABV/XCkn//xUxYM9f5T0hp2U9vskM7MrUSa8K01MjgPTHZvnglvxz9TNhcImi
 NNPPI+WLr188Q9mUjHVexzzLBdeF/ucWprocDn3bFfg3ig+785bHfHkvSGP9WQAjIEvD
 jxtf73ERyCvU0efx8ArNqPEwcZTYMAVKwfuKU8GQYPv4jll8I9SRy1YU2+hqiSC+JpBh
 1iuQ==
X-Gm-Message-State: AOAM5326j9UPEHYDlW3zySP8BIM7LuVPvjc9lOOjzBK1gEwXoNYsa+oX
 6KXoN1RATNn10IC0DvX0GWmxUrwT0cQ=
X-Google-Smtp-Source: ABdhPJzUeO3me3B5+HkE8q6mr4stquKtfmUPuED1+jDR/9luCR/0NpYMwejpeJUkk2YWvtLnLa9xNA==
X-Received: by 2002:a05:622a:11ce:: with SMTP id
 n14mr15496025qtk.446.1638467247412; 
 Thu, 02 Dec 2021 09:47:27 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id c13sm311851qtx.51.2021.12.02.09.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:47:27 -0800 (PST)
Message-ID: <5a30ac6c-1b46-8d13-f546-006480ffb747@gmail.com>
Date: Thu, 2 Dec 2021 14:47:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/14] ppc/pnv: Compute the PHB index from the PHB4 PEC
 model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-12-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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
> Use the num_stacks class attribute to compute the PHB index depending
> on the PEC index :
> 
>    * PEC0 provides 1 PHB  (PHB0)
>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/pci-host/pnv_phb4_pec.c | 16 ++++++++++++++++
>   hw/ppc/pnv.c               |  4 +---
>   2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 293909b5cb90..a7dd4173d598 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -374,6 +374,19 @@ static void pnv_pec_instance_init(Object *obj)
>       }
>   }
>   
> +static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
> +{
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    int index = pec->index;
> +    int offset = 0;
> +
> +    while (index--) {
> +        offset += pecc->num_stacks[index];
> +    }
> +
> +    return offset;
> +}
> +
>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
> @@ -394,8 +407,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
>           Object *stk_obj = OBJECT(stack);
> +        int phb_id = pnv_pec_phb_offset(pec) + i;
>   
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
> +        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
> @@ -538,6 +553,7 @@ static void pnv_pec_stk_instance_init(Object *obj)
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
>   
>       object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
> +    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
>   }
>   
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 957f0bdfaa6b..f8b0b2a28383 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1371,7 +1371,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>   {
>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
>       int i, j;
> -    int phb_id = 0;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
> @@ -1396,11 +1395,10 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
>   
> -        for (j = 0; j < pec->num_stacks; j++, phb_id++) {
> +        for (j = 0; j < pec->num_stacks; j++) {
>               PnvPhb4PecStack *stack = &pec->stacks[j];
>               Object *obj = OBJECT(&stack->phb);
>   
> -            object_property_set_int(obj, "index", phb_id, &error_fatal);
>               object_property_set_int(obj, "chip-id", chip->chip_id,
>                                       &error_fatal);
>               object_property_set_int(obj, "version", pecc->version,
> 

