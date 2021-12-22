Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A347D661
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:18:21 +0100 (CET)
Received: from localhost ([::1]:60210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06Bw-0005Hp-O6
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n065e-0001x9-DR; Wed, 22 Dec 2021 13:11:50 -0500
Received: from [2607:f8b0:4864:20::834] (port=41586
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n065c-0004Xw-VL; Wed, 22 Dec 2021 13:11:50 -0500
Received: by mail-qt1-x834.google.com with SMTP id v22so2686806qtx.8;
 Wed, 22 Dec 2021 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=3PyySgRKuPefl2ROdXg3Mgen3okdIMVw8rNNiF8boi0=;
 b=TkUKFbMUw6aoXKMdUwmfohzLC+GVCZj8QaI61rXL1j4h8Y1O1vJ6F1ij5wniF+ZNmv
 v4hBsTd0JxOwRGhcM/jTUIurcT3A1c6jgerZR07/BxbTXASbqBYSmLOtRWAbTcvODx3r
 bO4VeG8fVq+URwJhSi9Y/absEpdMyphOTjoL06AVXDNUgKHd5/WUPTbQ5AIqtoP6Q9fZ
 9vXVrOTIC223BAr6ZjGgbLPhDbLAbBT62RJ8y6GGlnCO9twBj9ZadKaDQw95duX26W1D
 8CR07gDpT5JLgriIQN7VMa1DriIP67p4UXcJ+ZyTAYQZzpCAdiL+ZYVF9EcpUaSt7LSo
 izVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3PyySgRKuPefl2ROdXg3Mgen3okdIMVw8rNNiF8boi0=;
 b=LKoptnmQ2b2UePD3qan2cTUBXFhaw133J+TTDEaDAaetw76z6XNFCEMoHp8YDAYbAR
 fUtXdRdTDgK6ci7cJV9mLjpx/YpFv0nAc3FSa8QfYlM3Hy4dRsIkH+SlNCmD3c3I7vVL
 SQxOo1yqM1be1GGFD/sOcHvifAgDXmLczctpfOOLSJgwZije3gl9qVfRf0qQW1RNYh1I
 E1gJ/C0R5PG2O+J7S55ePMQhzkujDpzQsXVvid3fCyA0QMzX2JyZY0ezMdWz9KHk2fEL
 fN3n0snKCFLu82xG06mkcfCO/uLG9mwwZj6i2/REIXy0iH1GACvDMZhKe8OGcuCiLQDZ
 VAKg==
X-Gm-Message-State: AOAM531pO8Hbyomm95zFtHAyPKoYnY4Vf2/JinOo7kXblr1AMT/XwCER
 vJeHZyErfjv1gU8DuMjZWaM=
X-Google-Smtp-Source: ABdhPJyztV/R0d48fryZXogiXhfJzY5ZY4s3FSBXtjTE2cp0RK1mgEaHnV1rnUneQ4Ot273q5mD6mg==
X-Received: by 2002:a05:622a:1393:: with SMTP id
 o19mr3130542qtk.350.1640196707894; 
 Wed, 22 Dec 2021 10:11:47 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id l9sm2119272qkj.37.2021.12.22.10.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:11:47 -0800 (PST)
Message-ID: <fe6d1afb-4cf2-a066-6526-cc1e9d5013a7@gmail.com>
Date: Wed, 22 Dec 2021 15:11:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/5] ppc/pnv: Change the maximum of PHB3 devices for
 Power8NVL
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222063817.1541058-1-clg@kaod.org>
 <20211222063817.1541058-2-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211222063817.1541058-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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
> The POWER8 processors with a NVLink logic unit have 4 PHB3 devices per
> chip.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/pnv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 29ee0d0f08b4..9de8b8353014 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1314,7 +1314,7 @@ static void pnv_chip_power8nvl_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x120d304980000000ull;  /* P8 Naples DD1.0 */
>       k->cores_mask = POWER8_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = 4;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> 

