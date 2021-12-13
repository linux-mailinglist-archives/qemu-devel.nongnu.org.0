Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A9473436
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:40:29 +0100 (CET)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqFQ-0001Zn-3r
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:40:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwqCS-0000iz-5O; Mon, 13 Dec 2021 13:37:24 -0500
Received: from [2607:f8b0:4864:20::f32] (port=43693
 helo=mail-qv1-xf32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwqCQ-0006mF-JB; Mon, 13 Dec 2021 13:37:23 -0500
Received: by mail-qv1-xf32.google.com with SMTP id j9so15184305qvm.10;
 Mon, 13 Dec 2021 10:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FeA0CI7ArLApCQLXk27KTuukQPjR2BA7HjnYkbWvFxo=;
 b=o0YMEBM8tWZnvy4BTteSv6dYQLPoQFjxiIOf+vN2fjYOXvTyLJZAMHYXZx9Qt1bz9v
 th6Vq+rHNbLA9yhqgIMjcN/NX69zmNM9AfqV4Rwg4DSmkUjS3Pbs3mgfhkQZAJvDQTz6
 1Rg8rpGI9NjaeUUr+JmvOTHZA0ukBq7tXpPlhbTVKuDRaXBzROsWSRYAb+pjypMmx1d8
 dtkQDpqLbmJohLC32e+mcAEtnywjCRT5jFBvpf87bNSSMGdQgKHKhyCPaA8qbaHFFuLp
 /RLY5xDJxW5Ds+uet+SaiAmTPLbPHvklvCIhyKa4ACADsSHIdHlaIM0WR1TsTTYYiLU7
 yltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FeA0CI7ArLApCQLXk27KTuukQPjR2BA7HjnYkbWvFxo=;
 b=K+w1YUkJWudaJiRySnQ9gc/nk2DVy2lasERTKWeyQnj7Nr/3n/twqUY9Ci/MA9Krc+
 6XVIqYFeJCs4214Rm0I3IKTyQzB1P9/Seiws+6L7e8n1CFQFZhSTQNQvq14uqgHEVfQq
 5EYESnYrNwwkxU4r/q5xB+tqib6gJj5mXdYmStLsnZHxsciYGyxDYyXj/gORCvuHJhYv
 tvF+rO28ZqDuKqbzuQAwz4CujWTI4wka52/FXr6Im2ASOjbQ70bWFN8NFc65XNcZmHCP
 6dZ1O7aWQQ7FIeDUQTJSEsEgmmLvB1AbtTGMJSgO7YZrauc9zDCTOsMfeHjE3doECJ+1
 GOhg==
X-Gm-Message-State: AOAM533Xx3PoHBxwwiDLBSpTxO4rtPA0d7LZru/54lXEEYafXWFURvyp
 3lQJhUlOoKUSEk+JIW5Hvl0=
X-Google-Smtp-Source: ABdhPJwupXj9WXbRZqx0yhR/Th+U/sfSwgwSB208Y9vey19ACMZ4Q4l4twfb4Uty9gql6BE8FS6cbQ==
X-Received: by 2002:a0c:e5d1:: with SMTP id u17mr439557qvm.120.1639420637362; 
 Mon, 13 Dec 2021 10:37:17 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id c1sm9552509qte.79.2021.12.13.10.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 10:37:17 -0800 (PST)
Message-ID: <c457abb0-d5b7-ae08-3e2b-f56669401f5a@gmail.com>
Date: Mon, 13 Dec 2021 15:37:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 06/19] ppc/pnv: Use QOM hierarchy to scan PHB3 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211213132830.108372-1-clg@kaod.org>
 <20211213132830.108372-7-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211213132830.108372-7-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/13/21 10:28, Cédric Le Goater wrote:
> When -nodefaults is supported for PHB3 devices, the phbs array under
> the chip will be empty. This will break the XICSFabric handlers, and
> all interrupt delivery, and the 'info pic' HMP command.
> 
> Do a QOM loop on the chip children and look for PHB3 devices instead.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/pnv.c | 72 +++++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 54 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 65196a2a5d00..cbc3f8ed62f7 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -638,16 +638,25 @@ static ISABus *pnv_isa_create(PnvChip *chip, Error **errp)
>       return PNV_CHIP_GET_CLASS(chip)->isa_create(chip, errp);
>   }
>   
> +static int pnv_chip_power8_pic_print_info_child(Object *child, void *opaque)
> +{
> +    Monitor *mon = opaque;
> +    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> +
> +    if (phb3) {
> +        pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
> +        ics_pic_print_info(&phb3->lsis, mon);
> +    }
> +    return 0;
> +}
> +
>   static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>   {
>       Pnv8Chip *chip8 = PNV8_CHIP(chip);
> -    int i;
>   
>       ics_pic_print_info(&chip8->psi.ics, mon);
> -    for (i = 0; i < chip->num_phbs; i++) {
> -        pnv_phb3_msi_pic_print_info(&chip8->phbs[i].msis, mon);
> -        ics_pic_print_info(&chip8->phbs[i].lsis, mon);
> -    }
> +    object_child_foreach(OBJECT(chip),
> +                         pnv_chip_power8_pic_print_info_child, mon);
>   }
>   
>   static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
> @@ -1789,10 +1798,32 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
>       return NULL;
>   }
>   
> +typedef struct ForeachPhb3Args {
> +    int irq;
> +    ICSState *ics;
> +} ForeachPhb3Args;
> +
> +static int pnv_ics_get_child(Object *child, void *opaque)
> +{
> +    ForeachPhb3Args *args = opaque;
> +    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> +
> +    if (phb3) {
> +        if (ics_valid_irq(&phb3->lsis, args->irq)) {
> +            args->ics = &phb3->lsis;
> +        }
> +        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
> +            args->ics = ICS(&phb3->msis);
> +        }
> +    }
> +    return args->ics ? 1 : 0;
> +}
> +
>   static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> -    int i, j;
> +    ForeachPhb3Args args = { irq, NULL };
> +    int i;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
>           PnvChip *chip = pnv->chips[i];
> @@ -1801,32 +1832,37 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>           if (ics_valid_irq(&chip8->psi.ics, irq)) {
>               return &chip8->psi.ics;
>           }
> -        for (j = 0; j < chip->num_phbs; j++) {
> -            if (ics_valid_irq(&chip8->phbs[j].lsis, irq)) {
> -                return &chip8->phbs[j].lsis;
> -            }
> -            if (ics_valid_irq(ICS(&chip8->phbs[j].msis), irq)) {
> -                return ICS(&chip8->phbs[j].msis);
> -            }
> +
> +        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
> +        if (args.ics) {
> +            return args.ics;
>           }
>       }
>       return NULL;
>   }
>   
> +static int pnv_ics_resend_child(Object *child, void *opaque)
> +{
> +    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> +
> +    if (phb3) {
> +        ics_resend(&phb3->lsis);
> +        ics_resend(ICS(&phb3->msis));
> +    }
> +    return 0;
> +}
> +
>   static void pnv_ics_resend(XICSFabric *xi)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> -    int i, j;
> +    int i;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
>           PnvChip *chip = pnv->chips[i];
>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>   
>           ics_resend(&chip8->psi.ics);
> -        for (j = 0; j < chip->num_phbs; j++) {
> -            ics_resend(&chip8->phbs[j].lsis);
> -            ics_resend(ICS(&chip8->phbs[j].msis));
> -        }
> +        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
>       }
>   }
>   
> 

