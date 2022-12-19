Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE9865099D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Cpq-00014J-BU; Mon, 19 Dec 2022 04:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Cpl-00013f-Ay
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:53:22 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Cpj-0002O8-L1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:53:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso5935026wmp.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eCiHn2upUuu7++TpX87sQgO6F2dE2X13ckHZBaYnvPo=;
 b=wZ9wV58+qb9NMGdw5/7nzXOTzx8aAcfn010tKbswFaO9WA4y9o6Oi5D25ujYYaGWzZ
 Dsci3ZxuVgGkZGmZEVEIncHDCKbgjy6SEMHJW3Yusy/dHPCeDEemfvM38WIREqetxnSG
 noC/FT4oyUBSMJCRR2iftr7L4b8q3oCVKpMwJW9R3ZuvpJ/jNGTz/NWlItBpJrd3NDEs
 JPEOSiuFsj33mXOW7lHsfWUDQxbQL7Zdab+maEb6aZm9kfgX1JUKdZCiqqLrtgwlOJ6x
 z0+cHCiRMxh56h3GVhnGuoH7K/YUJBPKmkodBeyicHCXqO8p4Jbkv3M1KnqVn6g9Z1r1
 UHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eCiHn2upUuu7++TpX87sQgO6F2dE2X13ckHZBaYnvPo=;
 b=ZLqJVoeysTV6HAjpyt6RBv5WhKFwG6PzjB17PsC5y1MWkq+UIjvhywa85krp4lwLv5
 G5EqfAmVWWo/N+dL8y92bfD0ljFcTridhRKgojk1iEZbAqlPiRGi9LP6bqY6Q+DVeUdK
 +UigRmXvPAaWGp99LWhhb8uwaHKVuK4ZJC8qFfd7MXeKLpltYrc2zyqcVskZyWYoicT0
 Awo388ldSacRUWoK7MMsFKo2AUlQ8JByH0TfUZ1sqrBQx/6RX3aHJ15kpRzIMgfh8zP+
 xMj8fRPpxtrRKqGXzlrUBuRJqyj+L1UOkkz1qsAfOY6GJ4SMVFhi1+wJ3WhGYXJJift5
 6Oiw==
X-Gm-Message-State: ANoB5plqazbE1lQm1m3zQzyNz4sviIzzdANkznsehGbC5VlG10gSzewJ
 qR6jaPAt+PTHMafAufbRLMM8Hg==
X-Google-Smtp-Source: AA0mqf5p/4mB6KXU+KIhSFhruowf68h2D6g/uNkQq+jYo2ta9eehynaZHJJl7KuGK33BC94JsQqBdQ==
X-Received: by 2002:a05:600c:4f96:b0:3d1:c895:930c with SMTP id
 n22-20020a05600c4f9600b003d1c895930cmr31727598wmq.35.1671443597345; 
 Mon, 19 Dec 2022 01:53:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s13-20020a5d510d000000b00241e5b917d0sm11211294wrt.36.2022.12.19.01.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:53:16 -0800 (PST)
Message-ID: <00539fb5-9e00-8010-4fe5-2902cee9891b@linaro.org>
Date: Mon, 19 Dec 2022 10:53:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] hw/arm/stm32f405: correctly describe the memory layout
Content-Language: en-US
To: Felipe Balbi <balbi@kernel.org>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221218071229.484944-1-balbi@kernel.org>
 <20221218071229.484944-2-balbi@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218071229.484944-2-balbi@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Felipe,

On 18/12/22 08:12, Felipe Balbi wrote:
> STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
> Memory) at a different base address. Correctly describe the memory
> layout to give existing FW images have a chance to run unmodified.
> 
> Signed-off-by: Felipe Balbi <balbi@kernel.org>
> ---
>   hw/arm/stm32f405_soc.c         | 8 ++++++++
>   include/hw/arm/stm32f405_soc.h | 5 ++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
> index c07947d9f8b1..cef23d7ee41a 100644
> --- a/hw/arm/stm32f405_soc.c
> +++ b/hw/arm/stm32f405_soc.c
> @@ -139,6 +139,14 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
>       }
>       memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
>   
> +    memory_region_init_ram(&s->ccm, NULL, "STM32F405.ccm", CCM_SIZE,

Including the machine name in the memory description seems a bad
habit from old days. What do you think about renaming as
'core-coupled-memory'?

> +                           &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    memory_region_add_subregion(system_memory, CCM_BASE_ADDRESS, &s->ccm);
> +
>       armv7m = DEVICE(&s->armv7m);
>       qdev_prop_set_uint32(armv7m, "num-irq", 96);
>       qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
> diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
> index 5bb0c8d56979..249ab5434ec7 100644
> --- a/include/hw/arm/stm32f405_soc.h
> +++ b/include/hw/arm/stm32f405_soc.h
> @@ -46,7 +46,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
>   #define FLASH_BASE_ADDRESS 0x08000000
>   #define FLASH_SIZE (1024 * 1024)
>   #define SRAM_BASE_ADDRESS 0x20000000
> -#define SRAM_SIZE (192 * 1024)
> +#define SRAM_SIZE (128 * 1024)
> +#define CCM_BASE_ADDRESS 0x10000000
> +#define CCM_SIZE (64 * 1024)

Since the CCM_SIZE won't be used elsewhere, we can simply use '64 * KiB'
in the memory_region_init_ram() in the source file. Up to the maintainer
:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


