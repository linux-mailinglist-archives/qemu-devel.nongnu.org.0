Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D665368D056
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:15:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIAk-0006AI-IV; Tue, 07 Feb 2023 02:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIAh-00066K-3m
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:13:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIAf-00017J-9n
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:13:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so2009928wmb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5qDd63j+Z60WdwRzJL1tU/BVjMZ0HIClw7obz4DE6Qw=;
 b=Cst1J3D68wlWl8ezALluwKcQImuHATA9/SGQDw0On4HhBKsP22C13OES4+FVv2deDA
 utQ6fcFkvIUjD1yBG2ltqyARvzT1zbT41RNkme7nVgDvBQAkpLT0kDck4Vo+WmEd4XvY
 k82ndRJObEz9UBa+BYFubSuEeiy201/SQAQHiPr2qUNFT/WBmF8BGm++D1+NNtj6+tPw
 AIZSxQsgaG0KwjZKfsGLiRKkUJKRsTzOn/kn/dubQqeDfAw7dtxPL1GZBe0rg8LV6Y6p
 u6IOpnMzMW84/G146YZiXHFmR0KzvDsP0KbQ77g8l2azQaIteOIaqYLpuqa3FhHlFXW8
 lb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5qDd63j+Z60WdwRzJL1tU/BVjMZ0HIClw7obz4DE6Qw=;
 b=AR1kGn/Qo3NQO8k72oeL1HbV1jqhKnVL2ey6gCtqLbIDC4pYjnJOFYxQ47HcDXJS6t
 wM3snQYAeHFUH/tBYmjiseNCkZdfqHoREi8iLm23Mzd+epK0QsJQtDDUGIYVk8lG7/nr
 8dIcMHOhidJvtrRj7xBVLs3uWvRYAz8GmIZ01k9BarZTC8mdfzRW3pxX8b6LjoBnML8v
 Z6E8nwRpr39rQ9xmZqhsO36W1lV+MTuGbV+zSepCkTc+yHAGIWRqySUwYHvBOyWnplle
 BEKkUyPV7puqq1ZuybWEfe4zRjskp0h8zBEHhCeM4xBSEdB6SmahrkNSCqos6qIHg8t5
 gc/Q==
X-Gm-Message-State: AO0yUKVJN0HtfH4AomMpS2mRMANe7brQSkU6b6G6Xk50l1XYPTupok65
 MA4Ge/MplkeIUcLbqfhGzN/K4g==
X-Google-Smtp-Source: AK7set8XxCQ54Zfg+1SdOxJcvyHr8LMu9MrVglnU0Eibm50ijWbNW0ttaM8jz/70DyMYxyZES8ePgg==
X-Received: by 2002:a05:600c:a287:b0:3df:fff4:5f6f with SMTP id
 hu7-20020a05600ca28700b003dffff45f6fmr2139486wmb.36.1675754018821; 
 Mon, 06 Feb 2023 23:13:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b003dc47d458cdsm13570487wmo.15.2023.02.06.23.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 23:13:37 -0800 (PST)
Message-ID: <de4b4eb1-0f77-fb20-5e8e-be751f4a32a5@linaro.org>
Date: Tue, 7 Feb 2023 08:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] hw/ssi: Add Nuvoton PSPI Module
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com, Chris Rauer <crauer@google.com>
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-3-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206233428.2772669-3-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 7/2/23 00:34, Hao Wu wrote:
> Nuvoton's PSPI is a general purpose SPI module which enables
> connections to SPI-based peripheral devices.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> ---
>   MAINTAINERS                |   6 +-
>   hw/ssi/meson.build         |   2 +-
>   hw/ssi/npcm_pspi.c         | 216 +++++++++++++++++++++++++++++++++++++
>   hw/ssi/trace-events        |   5 +
>   include/hw/ssi/npcm_pspi.h |  53 +++++++++
>   5 files changed, 278 insertions(+), 4 deletions(-)
>   create mode 100644 hw/ssi/npcm_pspi.c
>   create mode 100644 include/hw/ssi/npcm_pspi.h


> +static const MemoryRegionOps npcm_pspi_ctrl_ops = {
> +    .read = npcm_pspi_ctrl_read,
> +    .write = npcm_pspi_ctrl_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 2,

I'm not sure about ".max_access_size = 2". The datasheet does
not seem public. Does that mean the CPU bus can not do a 32-bit
access to read two consecutive 16-bit registers? (these fields
restrict the guest accesses to the device).

> +        .unaligned = false,
> +    },

You might want instead (which is how you implemented the r/w
handlers):

     .impl.min_access_size = 2,
     .impl.max_access_size = 2,

> +};


> +static void npcm_pspi_realize(DeviceState *dev, Error **errp)
> +{
> +    NPCMPSPIState *s = NPCM_PSPI(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    Object *obj = OBJECT(dev);
> +
> +    s->spi = ssi_create_bus(dev, "pspi");

FYI there is an ongoing discussion about how to model QOM tree. If
this bus isn't shared with another controller, the "embed QOM child
in parent" style could be preferred. If so, the bus would be created
as:

       object_initialize_child(obj, "pspi", &s->spi, TYPE_SSI_BUS);

> +    memory_region_init_io(&s->mmio, obj, &npcm_pspi_ctrl_ops, s,
> +                          "mmio", 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +    sysbus_init_irq(sbd, &s->irq);
> +}


> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> index c707d4aaba..16ea9954c4 100644
> --- a/hw/ssi/trace-events
> +++ b/hw/ssi/trace-events

> +# npcm_pspi.c
> +npcm_pspi_enter_reset(const char *id, int reset_type) "%s reset type: %d"
> +npcm_pspi_ctrl_read(const char *id, uint64_t addr, uint16_t data) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx16
> +npcm_pspi_ctrl_write(const char *id, uint64_t addr, uint16_t data) "%s offset: 0x%04" PRIx64 " value: 0x%08" PRIx16

Since the region is 4KiB and the implementation is 16-bit, the formats
could be simplified as offset 0x%03 and value 0x%04. The traces will
then be more digestible to human eyes.

Modulo the impl.access_size change:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


