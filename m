Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C4658C1C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:17:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqta-0002MV-Nw; Thu, 29 Dec 2022 06:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAqtO-0002Jj-B5
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 06:16:15 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAqtI-0003Gh-4H
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 06:16:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m3so4017825wmq.0
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 03:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9kEgNudtnW+wdaGdldFM+IU7qfzb+rNatJRIjQUMqNM=;
 b=amiDPR4l6K+mIiejhY2kJ9vpFBMSgIU9VFX2ZS8A8aAspaE7XT53eFQx223n6tFKZb
 o+D4wgUllus8TwR9jUIyulJV7TctVFCLoAK3giXtPgA9X7yBcaFakT9IcnvQ4Yehm1Zh
 5iczifz5/jwoZl9unKZE8sIeEDld6r/dD1eRYzjkVcopArJEJyEqVsP7S6Q5TJf0wPEp
 2S9OdDMBs/i7k9HY0QaGSJKUTnPk3MooefWsQBPBxJpvWG2IzTkSieRgIgNHrT+Kd8xb
 Q84fb5id53cDGFMW10IeHfI4cxAv2IWo+RDVRw1RIdglxkYOetk5sE0ePDkNwGhPoCpm
 ivew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9kEgNudtnW+wdaGdldFM+IU7qfzb+rNatJRIjQUMqNM=;
 b=GMoVINyZHfaBBECsBVgezFzDNrvVz5B3OFIeYM/2mhHkhXBaBGnbgdSkR8TgjwK6kj
 N1r3anI2Mh7HyP67fxih3hLMWCj+c7++V5t5+IcufBd6A9pHBeWlXkOfRL5wJiv3m++R
 Knf2kQMrgHVk4H+zGn28a2ioOb4FHGOR2IiU5uHBsu4uB2H39W9ytLGT33vRCcPKdgvR
 LjKYK3ZM3Wz3zBtpVbOnPnHOTEZtIXzJc10CqaresTz1JgU/ANF8I1BN/pzetfRg1Was
 GzIlVRunnA0nGO8c/LF9+uKBVMyzUzLOk0pAW7wswX9dZT6A/LK3blcB9Es1aclN3JG3
 o3QQ==
X-Gm-Message-State: AFqh2kr8IZohaVNTwq0YRxOyprgm7Omy9G30HiSwTg5CTAtT69RwY3pr
 HngBxQ5/FQzJfL9XGD/Mhbw4PQ==
X-Google-Smtp-Source: AMrXdXsGX5uV2NuTrYb24uOo6slNoIKwkyvzHHyeoqMJDLW/8cenG0hT+DF+IhHhm7aDVYsRxQVFaQ==
X-Received: by 2002:a05:600c:4191:b0:3d1:fcca:ce24 with SMTP id
 p17-20020a05600c419100b003d1fccace24mr19463315wmh.32.1672312562248; 
 Thu, 29 Dec 2022 03:16:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h15-20020adfaa8f000000b002421888a011sm17993724wrc.69.2022.12.29.03.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 03:16:01 -0800 (PST)
Message-ID: <0c4810ae-edee-41df-7609-a3c6577a9ed3@linaro.org>
Date: Thu, 29 Dec 2022 12:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 7/9] aspeed/soc : Add AST1030 support
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: steven_lee@aspeedtech.com, troy_lee@aspeedtech.com
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <20220401083850.15266-8-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220401083850.15266-8-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 1/4/22 10:38, Jamin Lin wrote:
> From: Steven Lee <steven_lee@aspeedtech.com>
> 
> The embedded core of AST1030 SoC is ARM Coretex M4.
> It is hard to be integrated in the common Aspeed Soc framework.
> We introduce a new ast1030 class with instance_init and realize
> handlers.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed_ast10xx.c     | 299 ++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build          |   6 +-
>   include/hw/arm/aspeed_soc.h |   3 +
>   3 files changed, 307 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/aspeed_ast10xx.c


> +static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> +{
> +    AspeedSoCState *s = ASPEED_SOC(dev_soc);
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +    MemoryRegion *system_memory = get_system_memory();
> +    DeviceState *armv7m;
> +    Error *err = NULL;
> +    int i;
> +
> +    if (!clock_has_source(s->sysclk)) {
> +        error_setg(errp, "sysclk clock must be wired up by the board code");
> +        return;
> +    }
> +
> +    /* General I/O memory space to catch all unimplemented device */
> +    create_unimplemented_device("aspeed.sbc",
> +                                sc->memmap[ASPEED_DEV_SBC],
> +                                0x40000);
> +    create_unimplemented_device("aspeed.io",
> +                                sc->memmap[ASPEED_DEV_IOMEM],
> +                                ASPEED_SOC_IOMEM_SIZE);
> +
> +    /* AST1030 CPU Core */
> +    armv7m = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(armv7m, "num-irq", 256);

Can you confirm this SoC has 256 and not 240 IRQs?

> +    qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
> +    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
> +    object_property_set_link(OBJECT(&s->armv7m), "memory",
> +                             OBJECT(system_memory), &error_abort);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);


