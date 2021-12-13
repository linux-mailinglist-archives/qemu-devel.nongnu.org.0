Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABE473445
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:45:24 +0100 (CET)
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqKB-0004Y4-7q
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:45:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwqEl-0002Km-Cy; Mon, 13 Dec 2021 13:39:47 -0500
Received: from [2607:f8b0:4864:20::735] (port=44589
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwqEj-000720-Tt; Mon, 13 Dec 2021 13:39:47 -0500
Received: by mail-qk1-x735.google.com with SMTP id 132so14738149qkj.11;
 Mon, 13 Dec 2021 10:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LW/USj9dVLu9O4Ot2BdvHx+yUBJmxrHy/ktpI9SIN4Q=;
 b=eKHyjburflsCPrKpZ/6iJ21W3UCrK1BOLuBEU/CuLs8GRl4lD5Ty6HS/v0luuE8KKG
 vY3NUroDm3BxIAmzEjbNInQ9BKlNANiRg6TKp9YK6kZAMlE+L4EFmTXL1NdiiJkZxXXU
 rMCzQJhKnH3X44/XI3yo1RsqPJwbiQu1sbYJ+oz29QhuHkaSIKiwnsVg9nZU1QiMvLkP
 YA27MFcuL0GF4qEropG5sagWplCc7mueFzGLJHJtRP24b7ObPBdLEtM/9aGcKC+UfVTS
 5OB64n/mRoS62Ku3+dh9c9Tv7rVhoWPOikYDDlbPfQk2y9u759byDZxPgydo9DWvpreq
 BTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LW/USj9dVLu9O4Ot2BdvHx+yUBJmxrHy/ktpI9SIN4Q=;
 b=fDrOdHKzE7tgrgX0J1Q31hOd/fTQyZNNRU3w7Ze2m1268nJ61PdCfcRfJXUVyIPAf+
 vm1y8Te6buu0GPMdzS9BaHK9qXqQwsfPtMSlSZEr0klwuh+9XSKtDMr67AhD9DfTCw1J
 qP5KbA8CAXVQVPyLZPDB7g3FcUNheXhVwkamw1lxPAb7ArM6kT+wzKwKjfA1LOZtkcOP
 hXZejrYVClqgu1rkRxX9jvyrtzKxMCzjD+PzDH1pUM/KnbG/CUgqbq9dk5ZTSLZg/7LM
 7bx2cGM+BRxys0tCP8TcOBzHiJ9TcCQsjxlayopO+Y4CPcHL/UuwoQCQOgAFa7EgS/Gw
 KAqQ==
X-Gm-Message-State: AOAM533fBVOSqicbMImyrfAN3s7f7sQEyOy/dnExqzjxPxHznvNQmZNA
 7mhc+dptzXRfa24xwq1trFw=
X-Google-Smtp-Source: ABdhPJwSdzr0frA0IOya9644TDubUgGsFVO+qerkkS1vzlhfwlwIktDw41M5IK94tEAWDDHwhnr0gg==
X-Received: by 2002:a05:620a:4141:: with SMTP id
 k1mr83097qko.628.1639420784629; 
 Mon, 13 Dec 2021 10:39:44 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id c7sm10457400qtc.32.2021.12.13.10.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 10:39:44 -0800 (PST)
Message-ID: <ac934d3a-8d42-5665-b6eb-35d6e1974260@gmail.com>
Date: Mon, 13 Dec 2021 15:39:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 14/19] ppc/pnv: Use QOM hierarchy to scan PEC PHB4
 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211213132830.108372-1-clg@kaod.org>
 <20211213132830.108372-15-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211213132830.108372-15-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
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
> When -nodefaults is supported for PHB4 devices, the pecs array under
> the chip will be empty. This will break the 'info pic' HMP command.
> 
> Do a QOM loop on the chip children and look for PEC PHB4 devices
> instead.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/pnv.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 08b037f4e753..9de8b8353014 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -659,20 +659,26 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>                            pnv_chip_power8_pic_print_info_child, mon);
>   }
>   
> +static int pnv_chip_power9_pic_print_info_child(Object *child, void *opaque)
> +{
> +    Monitor *mon = opaque;
> +    PnvPHB4 *phb4 = (PnvPHB4 *) object_dynamic_cast(child, TYPE_PNV_PHB4);
> +
> +    if (phb4) {
> +        pnv_phb4_pic_print_info(phb4, mon);
> +    }
> +    return 0;
> +}
> +
>   static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
>   {
>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
> -    int i, j;
>   
>       pnv_xive_pic_print_info(&chip9->xive, mon);
>       pnv_psi_pic_print_info(&chip9->psi, mon);
>   
> -    for (i = 0; i < chip->num_pecs; i++) {
> -        PnvPhb4PecState *pec = &chip9->pecs[i];
> -        for (j = 0; j < pec->num_stacks; j++) {
> -            pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
> -        }
> -    }
> +    object_child_foreach_recursive(OBJECT(chip),
> +                         pnv_chip_power9_pic_print_info_child, mon);
>   }
>   
>   static uint64_t pnv_chip_power8_xscom_core_base(PnvChip *chip,
> 

