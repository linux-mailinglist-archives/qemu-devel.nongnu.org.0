Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3E697A62
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:03:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFYz-0001BZ-6i; Wed, 15 Feb 2023 06:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFYv-0001Aq-Ql
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:02:57 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFYu-0005Yi-30
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:02:57 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k3so11076031wrv.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H0KWF+EilOIV/fTgZRY43DEmQDgaPtP5m+T5JvywjtU=;
 b=mZIoifT8JsIrpfNSc/cDTeVwRPVTymGlGgaEB85HP0A38cmVYAj/z1tft6luCoYnYp
 2gQkfhIiF0rCGJmRuzgi4LLxArng7IGvtn1qu9RZSnXlLTAgWHqeFOGoOheku9o6yAim
 G3q+hTH/LmZM7YvyWBRvjiNX14AS41mD8r0b9zrLdXz6F89vnqffS+qfeCpQxhkxHYfw
 Yg+hAGkCG+tBtue9qhE+Xyiz4uiQ9G5Aj1T+NKrLvd8lrTEGS7WUoG59OrpvIlSIN1Y1
 7GVeWL33m9F7yUQ8QXa7q8sjLvX4VS6H4vN2Mgsum1fFatfPhvr+3qOOsPyCuJI1Z27M
 Pv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H0KWF+EilOIV/fTgZRY43DEmQDgaPtP5m+T5JvywjtU=;
 b=rCihsGfSgqFQXJFPul8bsrntxxpiOuGsVmyStJcfuZgJ9mbf1/CEt/UiAB58nZ1RJA
 OnSkhxSv3RGSgy9+sH8LJJgh1pWp+i9lmbuaROdYqcph8R3lb16OCvnWjanEtcIOFEzw
 TKc3g4D2s8QTeU5CM+SxklyU3j9J5lrk2cnM/ekuyQAgwpO9rEaW79Qhm0INDjOCmAOY
 oIIj/ht3AetC3ygsEP13JJXn7dXdD8VcrnhD5FDZ6uAhOiLu8CECvsJfmOgPG16D4KpW
 n44g1hpl+Bd0OUSjCrcOfxj+U9I8tPyQASE8J0gQNPPNNHY8Kn0KdFf3dFUf5mqtPkS6
 jScg==
X-Gm-Message-State: AO0yUKVFKOIfVqChofXV3L0z9hWvziu/a1WNhb/E7jEyvTSDJIVCe4G5
 an1y/x1b6i50gYahBUnJzNpoyA==
X-Google-Smtp-Source: AK7set9X+4z/mVPrLP3HVTLadR34KdwqmqYd9J3hJRAVfzN/Q340gIMMefe0H+qDKWC45/WD86T4qw==
X-Received: by 2002:a5d:6191:0:b0:2c5:4bd2:dc14 with SMTP id
 j17-20020a5d6191000000b002c54bd2dc14mr1377256wru.38.1676458974325; 
 Wed, 15 Feb 2023 03:02:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d6984000000b002c552c6c8c2sm9828366wru.87.2023.02.15.03.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 03:02:53 -0800 (PST)
Message-ID: <49213633-802b-afdd-d54d-e40a866e3fc2@linaro.org>
Date: Wed, 15 Feb 2023 12:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 7/8] aspeed: Introduce a spi_boot region under the SoC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-8-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214171830.681594-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/2/23 18:18, Cédric Le Goater wrote:
> The default boot of the Aspeed SoCs is address 0x0. For this reason,
> the FMC flash device contents are remapped by HW on the first 256MB of
> the address space. In QEMU, this is currently done in the machine init
> with the setup of a region alias.
> 
> Move this code to the SoC and introduce an extra container to prepare
> ground for the boot ROM region which will overlap the FMC flash
> remapping.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h |  3 +++
>   hw/arm/aspeed.c             | 13 +------------
>   hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
>   hw/arm/aspeed_soc.c         | 14 ++++++++++++++
>   hw/arm/fby35.c              |  8 +-------
>   5 files changed, 32 insertions(+), 19 deletions(-)

>   enum {
> +    ASPEED_DEV_SPI_BOOT,
>       ASPEED_DEV_IOMEM,
>       ASPEED_DEV_UART1,
>       ASPEED_DEV_UART2,


>   #define ASPEED_SOC_DPMCU_SIZE       0x00040000
>   
>   static const hwaddr aspeed_soc_ast2600_memmap[] = {
> +    [ASPEED_DEV_SPI_BOOT]  = 0x0,

Isn't this a constant address for this Soc family?
If so, we can define ASPEED_SOC_RESET_ADDR once ...

>       [ASPEED_DEV_SRAM]      = 0x10000000,
>       [ASPEED_DEV_DPMCU]     = 0x18000000,
>       /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
> @@ -282,6 +283,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       qemu_irq irq;
>       g_autofree char *sram_name = NULL;
>   
> +    /* Default boot region (SPI memory or ROMs) */
> +    memory_region_init(&s->spi_boot_container, OBJECT(s),
> +                       "aspeed.spi_boot_container", 0x10000000);
> +    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SPI_BOOT],

... and use it here.

> +                                &s->spi_boot_container);


