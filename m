Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23E6B7079
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 08:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbd09-00043x-Uh; Mon, 13 Mar 2023 03:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbd06-00043Y-E1
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:53:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbczv-0003t3-Et
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 03:53:37 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r18so10362183wrx.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678694013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+e3Kv8o4k0K35KRb8HXZ4JLatmuTQTuEcqm+145Nv+I=;
 b=IGFuPC/l9Z9T9SFEA4XyEJ3qZTB7qxJ+huHN04clw9AheQmZATiL+qHLVAW/SIPwCv
 XoualA+aSD7GwGre4cUMHp+lokaS3PJ1ivTPHeF+KrzsGx+/TfuVSBQ8uRteYm+FGSJz
 pvaaFtN0C8+zMOXy0X8RigR80W8alh/wsrzxBZVLmDN0k6Tu8u1k4aJyrh3+AzURzCEi
 GlTZVV2ygaKdZbXGqFfrpJmFkI5KYnJ5+18j5O/uoD/l34gvzqI3Z56jzWIWBAyjkctE
 oxdGuTI/ww59ybqrRBk9b55m2mBpaEzV/XTcgtDzMyTObJva7AYca4gTGZERA05wyT37
 a2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678694013;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+e3Kv8o4k0K35KRb8HXZ4JLatmuTQTuEcqm+145Nv+I=;
 b=G6wB46xczH50Gokca88RTrNNE8SVEhrzXixlxOUm+W8ScnIv+qpbc0v1Iix8tlwd0o
 21wMzUmR/UAHWQV0YssvowPJcEYUNqUeuO/W6RgUdcHdZUkSUzrAudePo18xkVuumLGi
 zH8IYNNMR7X2NkAe0OGzTCVajBmG+0i3SfMUv4uXCiwcfbBuOaBm9k90ildUv9e57Xh7
 381iTYUu8paQyrReUuMcz4Sot1diAy5gEhwZobJCmfw5kL4Vajx2/xOR6m9E+Q+llqWP
 FhD7ZH+OFdA+2t+nX27bAej3CL83TfFQBvp0FqWLBkxiUDPmXNWEeHWjJlfAMjRmgfh0
 Jung==
X-Gm-Message-State: AO0yUKWM3CYRV536fp7vT7W3gtdO+tAE6vJt5ZvN8ckcBIe7vXHglw4C
 lHZXz8VPF0pM9rceQCvZG0pTag==
X-Google-Smtp-Source: AK7set+sbaxmcBH+Z4lKPaMaEKdSWs/ljgRCX+920Xop4uQdah8VHzFpP2T9ak1heRlWjE036JAIeg==
X-Received: by 2002:a5d:42d0:0:b0:2c7:6a6c:c72a with SMTP id
 t16-20020a5d42d0000000b002c76a6cc72amr21478420wrr.48.1678694013502; 
 Mon, 13 Mar 2023 00:53:33 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g15-20020a5d488f000000b002c559843748sm7098574wrq.10.2023.03.13.00.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 00:53:32 -0700 (PDT)
Message-ID: <a63469d1-e163-43b2-c39c-c3b7c0a6eacc@linaro.org>
Date: Mon, 13 Mar 2023 08:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
 <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi,

On 11/3/23 15:41, Strahinja Jankovic wrote:
> This patch adds WDT to Allwinner-H3 and Orangepi-PC.
> WDT is added as an overlay to the Timer module memory area.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   docs/system/arm/orangepi.rst  | 1 +
>   hw/arm/Kconfig                | 1 +
>   hw/arm/allwinner-h3.c         | 8 ++++++++
>   include/hw/arm/allwinner-h3.h | 5 ++++-
>   4 files changed, 14 insertions(+), 1 deletion(-)


> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 69d0ad6f50..f05afddf7e 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -49,6 +49,7 @@ const hwaddr allwinner_h3_memmap[] = {
>       [AW_H3_DEV_OHCI3]      = 0x01c1d400,
>       [AW_H3_DEV_CCU]        = 0x01c20000,
>       [AW_H3_DEV_PIT]        = 0x01c20c00,
> +    [AW_H3_DEV_WDT]        = 0x01c20ca0,
>       [AW_H3_DEV_UART0]      = 0x01c28000,
>       [AW_H3_DEV_UART1]      = 0x01c28400,
>       [AW_H3_DEV_UART2]      = 0x01c28800,
> @@ -234,6 +235,8 @@ static void allwinner_h3_init(Object *obj)
>       object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
>       object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
>       object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
> +
> +    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN6I);
>   }
>   
>   static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -453,6 +456,11 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
>                          qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_R_TWI));
>   
> +    /* WDT */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
> +    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0,
> +                            s->memmap[AW_H3_DEV_WDT], 1);

Why do you need to overlap?


