Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9696992D2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 12:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSc9a-0000OW-7F; Thu, 16 Feb 2023 06:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSc9V-00006Y-Eo
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:10:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSc9T-0002Hp-C0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 06:10:13 -0500
Received: by mail-wr1-x435.google.com with SMTP id y1so1489778wru.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XaCnP/Bw5+cT1thBZVdVlU3T544od9SduuK47VrrVkg=;
 b=RXK/jNvLZ8krSdSZC+imNBqKGY/r+g2/q9neNlDZy74nAoV+SLG78Ra2Z07jA78Qsw
 fJ05XDPKf4StGRiNbTGsr5tJISomrX6+kvLJoNm8PbaRX9OdGba6BegVnR1w+YrVjZMV
 FplvDIO+xwgPu8NZ0H7R1LE2AprmSAxOo3jbWlml7U8myVXkwx7saEGiThvfJfkdtY/c
 NY4MHhv8MqDBPoh1RJ9vOKOVGXK1jLCRvJIIJ16897f3rdvnM7mqVZUn57WDYoUXILL/
 X1HWZEaopP1BSOMdT7e6hoGXdXxvwMWBDbN8McepqmlibbkQu4YebL9VVT8syRnFHKuW
 fgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XaCnP/Bw5+cT1thBZVdVlU3T544od9SduuK47VrrVkg=;
 b=iSD/L21G+HDGa6zsm21sJr6DeBD0bG0+UAEiLOxX6uobPy3saGbhScwOUXISLe47sT
 DfjyjkyKoOAgUL9MhjdsHMvA8viLjN2ExNCjFjBOIqJ2knZoeynC4G+XPYKdGNf35VZD
 R0oHFnMMVs9285hYKy4O0lFlGmArm/AizWeZXPARDi6fXIRACRW1y0GwViOcrBvxDoKK
 9JL4CrfPUgO872XH701o14fzaACsrWINrgkqIaBdh+EnTDIML7iha/mPBy/trcbXh/Fp
 rHTvZILQeNQekHrVgYbXD8jBoA18DYWDLaVHPw/s/9ydOy7mKJSL8SLpTb5YsIhL3pB8
 N6FQ==
X-Gm-Message-State: AO0yUKXs0OReRpCSHl2TGwDWytcJjnuPpM7AU3T6vducl/Hr/IaKkhuP
 TiS5oEvlDCqr9dGyWPv3iY5Uag==
X-Google-Smtp-Source: AK7set8W21C9uEuhIlrFHFJd9UYIfq81at9PHqvGgTL/bHlCHm12jIJ+oC0FFpzJFatNBAA/lwVoyA==
X-Received: by 2002:a5d:574a:0:b0:2c5:582b:bad1 with SMTP id
 q10-20020a5d574a000000b002c5582bbad1mr4661126wrw.30.1676545809135; 
 Thu, 16 Feb 2023 03:10:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g18-20020adff3d2000000b002c569acab1esm1181735wrp.73.2023.02.16.03.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 03:10:08 -0800 (PST)
Message-ID: <8c18d24f-2454-11f2-0322-529ece683629@linaro.org>
Date: Thu, 16 Feb 2023 12:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] Adding new machine Yosemitev2 in QEMU
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230216104820.192624-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216104820.192624-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

Hi Pasupathi,

On 16/2/23 11:48, Karthikeyan Pasupathi wrote:
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>   hw/arm/aspeed.c        | 38 ++++++++++++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.h |  3 +++
>   3 files changed, 64 insertions(+)


> +static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
> +{
> +    AspeedSoCState *soc = &bmc->soc;
> +
> +    I2CBus *i2c[16];
> +
> +    for (int i = 0; i < 16; i++) {
> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
> +    }
> +
> +    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
> +
> +    at24c_eeprom_init_rom(i2c[8], 0x51, 128 * KiB, fbyv2_bmc_fruid,
> +                          fbyv2_bmc_fruid_len);

This can be simplified as:

at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x51, 128 * KiB);
at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 128 * KiB,
                       fbyv2_bmc_fruid, fbyv2_bmc_fruid_len);

> +}


