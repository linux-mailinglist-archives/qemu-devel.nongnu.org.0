Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D55BBAD4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:17:44 +0200 (CEST)
Received: from localhost ([::1]:58178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZg86-0001ZI-JZ
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg5I-0007PM-21; Sat, 17 Sep 2022 18:14:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg5C-0004Ln-2V; Sat, 17 Sep 2022 18:14:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso1948827wmq.2; 
 Sat, 17 Sep 2022 15:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=k6F2pswnRFt6Kdtiyu7R89AOxk3lAbdKl+kBtOVhUVc=;
 b=XGkreQiqw7DixIgGBp6ma/9tr8fEECZGLFGLO7h3FLdRL1RXEtTBI41vIPodIliNAQ
 LTyTIJA4pE1sMjnCXayDHMznYR7YcKzu2eC/n5u5hiia7pxn6voXh1TTHYGu++v/NMKo
 wB63yvLiBIF3EHXxyIaAVAd/iEsYrQIzr9KzIX39JiaDKPJ5HwapE++mj3xAbqT+xKGP
 HTaW92CZ2DI8cJF44kLHMYoMLMwyBF+DwyKfn21kDf3L+rf2qCe1K4oVjMLggK/asZZM
 ZS1bqsrIIKHK9KZNbTt6pqNBzCdQ5560pcZTsv4TMOoB8PfXWToi6H6tg5Lcvr9QvWEa
 72IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=k6F2pswnRFt6Kdtiyu7R89AOxk3lAbdKl+kBtOVhUVc=;
 b=CfLqJ4BCcMrhf39KzDDHdB6Y4OJZeI6YOi7LUD4nq41zAePzQgRrXZQ3huJqYM6xZF
 B5DX9LYwh3BsvoM96cBr+MtyBmoqu/3eWNOQexwMcaGAhgcGKCQlLMvPuX5JpiNtY74Q
 iMAme3SplmFhGRmR5YSkDIyP+7kDNVgrBOHA6Jz+Gylfq0QSprDk7bGq/H0MmdUJvyFH
 zEE9pczKVnfKSwKeYPKJWLsYuttNnC7ND/vgfFgiRHM3HUzpfJamDi5zLxP3+d0qiXz2
 P8BbKDIBxUalHuX4RsSduVKi0ulQzt82sGO2J53MPM/sEUygB8dmi9bIoWunwMN54m0B
 UteA==
X-Gm-Message-State: ACrzQf1sGQBmusfL/ilGlp9io4rZZ99cx6b/zZDOlnpP6sZ7tVUwxIM8
 fWfBj5mtYxBBOVutg34SGu4=
X-Google-Smtp-Source: AMsMyM7fDzCGz9CwJIibZdOFKmyMSUl8zGzpt1WGomgSW49pwRycVqnS7Nay85kXPvmyxrCZtGyyHg==
X-Received: by 2002:a05:600c:1910:b0:3b4:bb80:c95e with SMTP id
 j16-20020a05600c191000b003b4bb80c95emr6305537wmq.54.1663452880158; 
 Sat, 17 Sep 2022 15:14:40 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003b4a699ce8esm8378061wms.6.2022.09.17.15.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:14:39 -0700 (PDT)
Message-ID: <f76fe8d5-a83d-c043-eff4-cbdd22bed275@amsat.org>
Date: Sun, 18 Sep 2022 00:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 09/21] ppc440_sdram: Split off map/unmap of sdram banks
 for later reuse
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1663154398.git.balaton@eik.bme.hu>
 <d74ad47ade4b8de3cd66f6fae6baec354af9210e.1663154398.git.balaton@eik.bme.hu>
In-Reply-To: <d74ad47ade4b8de3cd66f6fae6baec354af9210e.1663154398.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/9/22 13:34, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 5db59d1190..01184e717b 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -561,26 +561,33 @@ static uint64_t sdram_size(uint32_t bcr)
>       return size;
>   }
>   
> +static void sdram_bank_map(Ppc4xxSdramBank *bank)
> +{
> +    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);
> +    memory_region_add_subregion(&bank->container, 0, &bank->ram);
> +    memory_region_add_subregion(get_system_memory(), bank->base,
> +                                &bank->container);
> +}
> +
> +static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
> +{
> +    memory_region_del_subregion(get_system_memory(), &bank->container);
> +    memory_region_del_subregion(&bank->container, &bank->ram);
> +    object_unparent(OBJECT(&bank->container));
> +}
> +
>   static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
>                             uint32_t bcr, int enabled)
>   {
>       if (sdram->bank[i].bcr & 1) {
>           /* First unmap RAM if enabled */
> -        memory_region_del_subregion(get_system_memory(),
> -                                    &sdram->bank[i].container);
> -        memory_region_del_subregion(&sdram->bank[i].container,
> -                                    &sdram->bank[i].ram);
> -        object_unparent(OBJECT(&sdram->bank[i].container));
> +        sdram_bank_unmap(&sdram->bank[i]);
>       }
>       sdram->bank[i].bcr = bcr & 0xffe0ffc1;
> +    sdram->bank[i].base = sdram_base(bcr);
> +    sdram->bank[i].size = sdram_size(bcr);

This part doesn't seem to belong the the same patch.

>       if (enabled && (bcr & 1)) {
> -        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
> -                           sdram_size(bcr));
> -        memory_region_add_subregion(&sdram->bank[i].container, 0,
> -                                    &sdram->bank[i].ram);
> -        memory_region_add_subregion(get_system_memory(),
> -                                    sdram_base(bcr),
> -                                    &sdram->bank[i].container);
> +        sdram_bank_map(&sdram->bank[i]);
>       }
>   }
>   


