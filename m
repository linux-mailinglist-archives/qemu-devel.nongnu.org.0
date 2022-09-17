Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849E5BBACC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:14:24 +0200 (CEST)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZg4s-000796-N5
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg3U-0005li-LM; Sat, 17 Sep 2022 18:12:56 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZg3S-0004Fc-9p; Sat, 17 Sep 2022 18:12:56 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n12so1097066wrx.9;
 Sat, 17 Sep 2022 15:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=WkBlpal0QIqfEPfrzmDvqxvpiHf9ESgL1ta/xDRH1sw=;
 b=bhrYDxMq6uKi+SN4MmiUEnWdaSA/A50roZCLtjxFHibcdLzrmdfUoLeqdGTWi5JQgV
 Vt0dKruymF7/x6yjyHNpq7I5VpbczUwVuZG0SRoSiHtCy6zSkhKbjzUuWP3a+ntq3dxB
 miBv1UzCjkXpvyBSv+8k+beyLVUc3wc3VJQbV1YXxtM9DcZemZDYdF8KgCW8ft/zjJnm
 xHrWvYxvzojaORUAIeGFw7ggMb1I9IeLNvaiQA+SVVoMGuV7sJwO7JovthiRwcJ4FNDP
 0+XpanHHsRq4d4k1E8Dm75NVdmnoF/ufJvjDDGBmq49rFRCWlrVcjLTHLBbynjPd21oP
 0eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=WkBlpal0QIqfEPfrzmDvqxvpiHf9ESgL1ta/xDRH1sw=;
 b=W8GwpjLkSnpAQsW9Y5m5ul2/FCu2FYwbVFYxMcSuKN0QGvaPZ7dFalpEGBNUYudzk1
 RRZha3J08mfVTTIXvnbfZAqVumXUqatq+ckpbfhMwmaBtXpGfNIuWA8rcMoyPFERht9l
 thT0SMj5Hn+KEghKj+lXwVBJOwfbLwoZBfzKe9MXE1eEaum+Um4e+POqyqfpgvYFo05g
 BEAKxhIA2sVUzBkuWSYIPw77JgOPAkIWLw3pQ5AytcOiWRT5MA9ciRfuxW9uBgKPucf0
 pC+VyCmX8TSJz3Zg8YBqhv0b6Vt6J3yiEY4/nYxq4pXrimSBWMrDp1+CRee9r//bSui6
 R//A==
X-Gm-Message-State: ACrzQf13t66Qkyuubx759u8Jazx95NY9fPKhbr4HFpy7lhsLiFLwZ9Hs
 trCo43ZELsw3RAEYntONQnQ=
X-Google-Smtp-Source: AMsMyM7qknahKC94P3UtOP4zQ7MFrPRqNRsyUcUTpIatgEFOdkVLHbLg28yQwYcs0NYa0Mw7TkQwCw==
X-Received: by 2002:a5d:64e8:0:b0:22a:bb78:1e44 with SMTP id
 g8-20020a5d64e8000000b0022abb781e44mr7116676wri.378.1663452772291; 
 Sat, 17 Sep 2022 15:12:52 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c2ccf00b003b3180551c8sm3488956wmc.40.2022.09.17.15.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:12:51 -0700 (PDT)
Message-ID: <b2fc1f9e-8f38-c0d8-6256-d4ae38534e7f@amsat.org>
Date: Sun, 18 Sep 2022 00:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 08/21] ppc4xx_sdram: Drop extra zeros for readability
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <cover.1663154398.git.balaton@eik.bme.hu>
 <1a87a1809e99eea94689c3100ba289c733868c22.1663154398.git.balaton@eik.bme.hu>
In-Reply-To: <1a87a1809e99eea94689c3100ba289c733868c22.1663154398.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/9/22 13:34, BALATON Zoltan wrote:
> Constants that are written zero padded for no good reason are hard to
> read, it's easier to see what is meant if it's just 0 or 1 instead.

It would be nice to be able to use the single quote separator for
integer literals, but they are only part of C++14, so C2x which doesn't
seem stabilized yet :/

Ref: https://en.cppreference.com/w/cpp/language/integer_literal

Meanwhile:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc4xx_devs.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 375834a52b..bfe7b2d3a6 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -49,31 +49,31 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
>   
>       switch (ram_size) {
>       case 4 * MiB:
> -        bcr = 0x00000000;
> +        bcr = 0;
>           break;
>       case 8 * MiB:
> -        bcr = 0x00020000;
> +        bcr = 0x20000;
>           break;
>       case 16 * MiB:
> -        bcr = 0x00040000;
> +        bcr = 0x40000;
>           break;
>       case 32 * MiB:
> -        bcr = 0x00060000;
> +        bcr = 0x60000;
>           break;
>       case 64 * MiB:
> -        bcr = 0x00080000;
> +        bcr = 0x80000;
>           break;
>       case 128 * MiB:
> -        bcr = 0x000A0000;
> +        bcr = 0xA0000;
>           break;
>       case 256 * MiB:
> -        bcr = 0x000C0000;
> +        bcr = 0xC0000;
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __func__,
>                         ram_size);
> -        return 0x00000000;
> +        return 0;
>       }
>       bcr |= ram_base & 0xFF800000;
>       bcr |= 1;
> @@ -104,7 +104,7 @@ static target_ulong sdram_size(uint32_t bcr)
>   static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
>                             uint32_t bcr, int enabled)
>   {
> -    if (sdram->bank[i].bcr & 0x00000001) {
> +    if (sdram->bank[i].bcr & 1) {
>           /* Unmap RAM */
>           trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
>                                    sdram_size(sdram->bank[i].bcr));
> @@ -115,7 +115,7 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
>           object_unparent(OBJECT(&sdram->bank[i].container));
>       }
>       sdram->bank[i].bcr = bcr & 0xFFDEE001;
> -    if (enabled && (bcr & 0x00000001)) {
> +    if (enabled && (bcr & 1)) {
>           trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
>           memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
>                              sdram_size(bcr));
> @@ -136,7 +136,7 @@ static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
>               sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
>                                                     sdram->bank[i].size), 1);
>           } else {
> -            sdram_set_bcr(sdram, i, 0x00000000, 0);
> +            sdram_set_bcr(sdram, i, 0, 0);
>           }
>       }
>   }
> @@ -213,7 +213,7 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
>           break;
>       default:
>           /* Avoid gcc warning */
> -        ret = 0x00000000;
> +        ret = 0;
>           break;
>       }
>   
> @@ -306,18 +306,18 @@ static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
>   {
>       Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
>   
> -    sdram->addr = 0x00000000;
> -    sdram->bear = 0x00000000;
> -    sdram->besr0 = 0x00000000; /* No error */
> -    sdram->besr1 = 0x00000000; /* No error */
> -    sdram->cfg = 0x00000000;
> -    sdram->ecccfg = 0x00000000; /* No ECC */
> -    sdram->eccesr = 0x00000000; /* No error */
> +    sdram->addr = 0;
> +    sdram->bear = 0;
> +    sdram->besr0 = 0; /* No error */
> +    sdram->besr1 = 0; /* No error */
> +    sdram->cfg = 0;
> +    sdram->ecccfg = 0; /* No ECC */
> +    sdram->eccesr = 0; /* No error */
>       sdram->pmit = 0x07C00000;
>       sdram->rtr = 0x05F00000;
>       sdram->tr = 0x00854009;
>       /* We pre-initialize RAM banks */
> -    sdram->status = 0x00000000;
> +    sdram->status = 0;
>       sdram->cfg = 0x00800000;
>   }
>   


