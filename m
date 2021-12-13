Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85DC47340F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:32:15 +0100 (CET)
Received: from localhost ([::1]:38732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwq7R-0003wv-KI
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:32:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwq5z-00032Y-Tr; Mon, 13 Dec 2021 13:30:43 -0500
Received: from [2607:f8b0:4864:20::72f] (port=36818
 helo=mail-qk1-x72f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mwq5x-0005lg-Mj; Mon, 13 Dec 2021 13:30:43 -0500
Received: by mail-qk1-x72f.google.com with SMTP id d21so7408892qkl.3;
 Mon, 13 Dec 2021 10:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HCrR6ZSyFczv4BLTHNsPBzMiFk4cTjg/IR6hJQzb8BE=;
 b=iNh9Yq5jP8N8QhO6g4R4lI6F3vdPAFqMFgCXQQ11+DgObykmsmtdiAsEbHsGA/jcGm
 v3VuSB6oLsI9LqrvbIe51o0DjBDQhga+uPaHSvko7aTmT5f9iHS3MkEzfUidWdgnjZ+u
 3QxBMztq7N8Kv2/qOyVenOCjX9rWiSbB26fnu6QcBMIdIn6nk204dNBSPruvykWwRMPB
 sJPbYCUaCCBYAgAG9Ynvl9duxn3mawPn7k/fJWWnuS8MwYnIthJjaaZi/ddp0nGz3a9X
 B5KcqHl3qTLmcMuBSR32vawzupm1C0xd7ANkb3cuDSGkil0DjKpp2WXIVrHtFIzgmrNE
 BFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HCrR6ZSyFczv4BLTHNsPBzMiFk4cTjg/IR6hJQzb8BE=;
 b=WulWGPtBCz5fxvt7+ugN2weoNnnFo6MCHNf9SUJjzjB3PJ5jC+xK4YUku7ggCxqkzf
 gZBLtjQBO38756ozkQZyj61mz1+zD9DePqEspAEvobWnP06+jR4GwHsD/RciW0HzQj/9
 PTGaKq1hTK4ZPAjm0rXu+3bmN7iY2fKhKAGb9yqHSPDtpkuVz3hPln29VfhgkSdZa+6n
 VtinjlsiIld/Uw79ui1bw+MUGxvYzzWEfUE6GTnzbLv83ktRT2FPDhCVK86H0TW1RfP8
 M2Yk8ZSSBZu4oYnsmj0409wV53h++IXxQqOEaEolLkKVmVFuqewuAT0hrSs5XpBtj0Tz
 eV7Q==
X-Gm-Message-State: AOAM530CHXnklebP8PDSYrxdh+Ycgrnfyd3NIQdCne6DfU+61d7zfuci
 FumvM8g9dHEIjMtEu7xTNv4=
X-Google-Smtp-Source: ABdhPJykTgR/+FCrQ51MakANBqg4PPBh6hUh6sP+ER4BiPMSoSbKv51z9EffQqg3JFla/ULZZq4szg==
X-Received: by 2002:a05:620a:4712:: with SMTP id
 bs18mr58697qkb.246.1639420240053; 
 Mon, 13 Dec 2021 10:30:40 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id o126sm6254921qke.11.2021.12.13.10.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 10:30:39 -0800 (PST)
Message-ID: <88875696-b13c-92ba-6af0-fcd7aac73b55@gmail.com>
Date: Mon, 13 Dec 2021 15:30:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 01/19] ppc/pnv: Change the maximum of PHB3 devices for
 Power8NVL
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211213132830.108372-1-clg@kaod.org>
 <20211213132830.108372-2-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211213132830.108372-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72f.google.com
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
> index 44ae41a9cb6b..6359bce549ca 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1309,7 +1309,7 @@ static void pnv_chip_power8nvl_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x120d304980000000ull;  /* P8 Naples DD1.0 */
>       k->cores_mask = POWER8_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = 4;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> 

