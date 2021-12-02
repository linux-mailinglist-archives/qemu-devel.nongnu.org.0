Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C154466916
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:28:41 +0100 (CET)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspst-0006zi-IK
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msprf-0005bC-Il; Thu, 02 Dec 2021 12:27:23 -0500
Received: from [2607:f8b0:4864:20::733] (port=36429
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msprd-0002tn-QN; Thu, 02 Dec 2021 12:27:23 -0500
Received: by mail-qk1-x733.google.com with SMTP id i9so678289qki.3;
 Thu, 02 Dec 2021 09:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/it/5RAQgg0ZrhaL/efTHEl4VScetYUtoRcLDR2Ehl4=;
 b=cqsxpWl/Edq3SmYfGweNrWcJkDKzVz40cOedVbjwCpe8ITxfDjq5E9E3Oz2YrMwBHL
 kLJigEqGXdPjPh3C7NqRwYjKPDf0HcInZw8qgfG+sox6/RXiyKexT0fpszJVgVptmpFb
 lmJNmGt32ihoC49c/Nit4Q/Jpt4N2dQMcsFMgoNS4MSfGIhzTNMJXvxtKukst0iAjEIp
 cAUVZdfpbAer/kZPmYUTMKeBFPD9pzt+k0wel7Q9avybjg0rsrP7X4+qXITp2X1Qpsmm
 V51lgR7prfa3z1vvt+H+3/wcFbkL8YgWULB/iqOI/sly/HlYybMdWwXXRXqETlLDaix8
 Cpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/it/5RAQgg0ZrhaL/efTHEl4VScetYUtoRcLDR2Ehl4=;
 b=ljVLalrfzFV+Li/C6z5z8A3oSzW2zPFgsB8XFSpomKtH6ik7aEoC458dABTmxYdDqQ
 +ibGgN6EJpZxznm9dLHUvvpM3k8IJNuBFiEH8iYnDCAj7TnvZ/bYE1vVl+7vQ0Kf3c+B
 LnUGM0fZxPZJKkUejlIIcL9iUzVwMtzK5FuEZEz2q/nGgXozlFwKjFGaHOkQPlgXTwuC
 NJis9uCkwegHjQUpMG/d1mZiS6x2AGkmpXf6MLVO9sexZaBbj0GpwmLI9cfvjcqu9n6+
 2MjEiC0WShOl84hBvREu7+RgdJgCTIxsRhcAcYsym+adu8+zLZfUUFW7KsB7nrmXzmrK
 vcEQ==
X-Gm-Message-State: AOAM533vW5cqUWglDIfT2fWVNiPoEMGqu7YcGZJcw9OVsifTJ3MTNvvY
 NIQ2rpCfn+47mG38NVwvNCCMTxtO2mg=
X-Google-Smtp-Source: ABdhPJx7bWZmnE2i625IgU5ANR5tY9QB/M/vmY+LMFdPrNyK+kqusDTxioCfkCiYG4WbeRLPvY75vw==
X-Received: by 2002:a05:620a:2892:: with SMTP id
 j18mr13235678qkp.441.1638466040087; 
 Thu, 02 Dec 2021 09:27:20 -0800 (PST)
Received: from [192.168.10.222] ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id f34sm283114qtb.7.2021.12.02.09.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:27:19 -0800 (PST)
Message-ID: <2c037046-f3fb-96da-c32b-b35fffb2429e@gmail.com>
Date: Thu, 2 Dec 2021 14:27:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/14] ppc/pnv: Reduce the maximum of PHB3 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-2-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211202144235.1276352-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
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
> All POWER8 machines have a maximum of 3 PHB3 devices. Adapt the
> PNV8_CHIP_PHB3_MAX definition for consistency.

I suggest "3 PHB3 devices per chip" for clarity.

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/pnv.h | 2 +-
>   hw/ppc/pnv.c         | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index aa08d79d24de..6f498c8f1b5f 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -79,7 +79,7 @@ struct Pnv8Chip {
>       PnvOCC       occ;
>       PnvHomer     homer;
>   
> -#define PNV8_CHIP_PHB3_MAX 4
> +#define PNV8_CHIP_PHB3_MAX 3
>       PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>   
>       XICSFabric    *xics;
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 71e45515f136..bd768dcc28ad 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1256,7 +1256,7 @@ static void pnv_chip_power8e_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x221ef04980000000ull;  /* P8 Murano DD2.1 */
>       k->cores_mask = POWER8E_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> @@ -1280,7 +1280,7 @@ static void pnv_chip_power8_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x220ea04980000000ull; /* P8 Venice DD2.0 */
>       k->cores_mask = POWER8_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> @@ -1304,7 +1304,7 @@ static void pnv_chip_power8nvl_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x120d304980000000ull;  /* P8 Naples DD1.0 */
>       k->cores_mask = POWER8_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> 

