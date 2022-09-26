Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97B5EADD8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:15:19 +0200 (CEST)
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrhO-0003hk-8F
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrQ4-0003vz-0r; Mon, 26 Sep 2022 12:57:25 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:39628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrQ2-0003Hf-04; Mon, 26 Sep 2022 12:57:23 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11e9a7135easo10027743fac.6; 
 Mon, 26 Sep 2022 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=KxZ15RBHAzrUsgMWveO6AT1sAHZiffkzp6pUb830jvo=;
 b=jHKxSuCyvu6xebTLsWQIIWmGcEItC5Gdgeykm1WQTaLxCgTkJD6SRaQvWxyISJq68h
 BT12xyaN+v/8UGyAE3D71vowalrV4K0qbkEcG1u7z5tpU3WyZjXmbQCtt5Fubqw4XC//
 lWNN4p2qu+4dpg+/0o2llqNBOy4KDWcLR9xo09eRimirk8bqxbtAOvy/o1YTx9vthcF1
 GXBjXPWmgYdCv55XTqlKZihxYtYwvueJNFeAnynXsXbuytW+G8uwY+4NVX2wcwxdwcGN
 qZ1U8iWNzYRdxsYQVsZMJ4+1huxIJmGFUAZjqmTd8uxssEc8k0AKIcOlY9J0cI31RXqJ
 Ddwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KxZ15RBHAzrUsgMWveO6AT1sAHZiffkzp6pUb830jvo=;
 b=kDV2+e9zh2z+1VyNKXEAWXvl6LzzLGlm+2F+bz6yupq9esXo3gZVkolsILWjwmMAA7
 ycJyHI02M1Xy3qP77SVYg0kRl9JNo53JfitS1YG1vuwxuvNmeBD4BxsRrCVgeracFXs9
 oqA3fiJt81muOr0pFdTAG7XKGi1Df7u6G3zdzvp3bYj4AJjhNgxng1eFHUXbpXkOYTXL
 FITeSN+loz9+yJoalJRRo4v18MX+eWwnRFGlc7R2uyNVQHCVB69depDXhV1irIp8+ssA
 T7Jg+PH3QB0k63j9Ga0F6balfxrE/KaPIXYM6MlE7F8zfl4sS6KFmmnMm8c46GmxgiKG
 d2oQ==
X-Gm-Message-State: ACrzQf29SEshkPzD56gtCLgZ/DKXguLKfM7vQSfODc7FO+eVAfGUCzYj
 8yVWkJZL+IjYu2nuknTE3rk=
X-Google-Smtp-Source: AMsMyM7ou03qp9rxUHV97SQXc2HkmILxQQ879t77mWZncJnHXVQ1Vm3JYewrqxAkmeSH2XkaBCeA8Q==
X-Received: by 2002:a05:6870:3450:b0:11e:b695:c13f with SMTP id
 i16-20020a056870345000b0011eb695c13fmr13087753oah.130.1664211439646; 
 Mon, 26 Sep 2022 09:57:19 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 t11-20020a056808158b00b00350a8b0637asm7522933oiw.47.2022.09.26.09.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:57:19 -0700 (PDT)
Message-ID: <e550debd-4f7c-37c8-dd32-2b8bdee890ec@gmail.com>
Date: Mon, 26 Sep 2022 13:57:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 10/25] ppc440_sdram: Implement enable bit in the DDR2
 SDRAM controller
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <f8900aadb1a4426a6444741e6876c898b3b77f7b.1664021647.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <f8900aadb1a4426a6444741e6876c898b3b77f7b.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/24/22 09:27, BALATON Zoltan wrote:
> To allow removing the do_init hack we need to improve the DDR2 SDRAM
> controller model to handle the enable/disable bit that it ignored so
> far.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/ppc440_uc.c | 34 ++++++++++++++++++++++++++++++++--
>   1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 900b7ab998..3fbfe4ad13 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -485,6 +485,7 @@ void ppc4xx_sdr_init(CPUPPCState *env)
>   /* SDRAM controller */
>   typedef struct ppc440_sdram_t {
>       uint32_t addr;
> +    uint32_t mcopt2;
>       int nbanks;
>       Ppc4xxSdramBank bank[4];
>   } ppc440_sdram_t;
> @@ -600,7 +601,7 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
>       int i;
>   
>       for (i = 0; i < sdram->nbanks; i++) {
> -        if (sdram->bank[i].size != 0) {
> +        if (sdram->bank[i].size) {
>               sdram_set_bcr(sdram, i, sdram_bcr(sdram->bank[i].base,
>                                                 sdram->bank[i].size), 1);
>           } else {
> @@ -609,6 +610,17 @@ static void sdram_map_bcr(ppc440_sdram_t *sdram)
>       }
>   }
>   
> +static void sdram_unmap_bcr(ppc440_sdram_t *sdram)
> +{
> +    int i;
> +
> +    for (i = 0; i < sdram->nbanks; i++) {
> +        if (sdram->bank[i].size) {
> +            sdram_set_bcr(sdram, i, sdram->bank[i].bcr & ~1, 0);
> +        }
> +    }
> +}
> +
>   static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>   {
>       ppc440_sdram_t *sdram = opaque;
> @@ -640,7 +652,7 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>               ret = 0x80000000;
>               break;
>           case 0x21: /* SDRAM_MCOPT2 */
> -            ret = 0x08000000;
> +            ret = sdram->mcopt2;
>               break;
>           case 0x40: /* SDRAM_MB0CF */
>               ret = 0x00008001;
> @@ -662,6 +674,8 @@ static uint32_t dcr_read_sdram(void *opaque, int dcrn)
>       return ret;
>   }
>   
> +#define SDRAM_DDR2_MCOPT2_DCEN BIT(27)
> +
>   static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
>   {
>       ppc440_sdram_t *sdram = opaque;
> @@ -684,6 +698,21 @@ static void dcr_write_sdram(void *opaque, int dcrn, uint32_t val)
>           switch (sdram->addr) {
>           case 0x00: /* B0CR */
>               break;
> +        case 0x21: /* SDRAM_MCOPT2 */
> +            if (!(sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
> +                (val & SDRAM_DDR2_MCOPT2_DCEN)) {
> +                trace_ppc4xx_sdram_enable("enable");
> +                /* validate all RAM mappings */
> +                sdram_map_bcr(sdram);
> +                sdram->mcopt2 |= SDRAM_DDR2_MCOPT2_DCEN;
> +            } else if ((sdram->mcopt2 & SDRAM_DDR2_MCOPT2_DCEN) &&
> +                       !(val & SDRAM_DDR2_MCOPT2_DCEN)) {
> +                trace_ppc4xx_sdram_enable("disable");
> +                /* invalidate all RAM mappings */
> +                sdram_unmap_bcr(sdram);
> +                sdram->mcopt2 &= ~SDRAM_DDR2_MCOPT2_DCEN;
> +            }
> +            break;
>           default:
>               break;
>           }
> @@ -698,6 +727,7 @@ static void sdram_reset(void *opaque)
>       ppc440_sdram_t *sdram = opaque;
>   
>       sdram->addr = 0;
> +    sdram->mcopt2 = SDRAM_DDR2_MCOPT2_DCEN;
>   }
>   
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,

