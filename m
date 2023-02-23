Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF916A0680
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:45:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV95N-0002in-5O; Thu, 23 Feb 2023 05:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV959-0002i4-EF
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:44:11 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV957-0007z7-Ln
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:44:11 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h14so1647766wru.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KH5ae43t3jJw3x6HhgXb+WcFFYVJzpx3FgCotj8tCnk=;
 b=KvpEs1FjRB59fnKdnyLfXYiyF7ogGU06v/EEm5BvMYbpcLLRhB3VT3V8JQdH4r+OXc
 E66B1meD/qwVsYPTMb/nuDtIl0kVLyt7hWbNnQQEIB9hHbAkgW8tBkTg48IxVwbH4Gka
 po8KA8rIESo8Wgmuj0UFJPg98D/aijfid4ehv5goT1DMDADWlC37PY2O3Rmr0dFZg8es
 PztjNUOf+9ZW2cFRf6tYKbE8szkITw7it5Yu75LRzpJlVF6dnjIqZyK1FRQmq5fTTEJ1
 R1MufPwzETR1vy0w6qFJiLZgeNFtZRf45RysNQBc3t3o/2V/IH3FlrFLjL23dkSD72uX
 15Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KH5ae43t3jJw3x6HhgXb+WcFFYVJzpx3FgCotj8tCnk=;
 b=NEGXYpHA/ezYqJCVtf3ARSQRJQXLIQkXf3KtXdNHTOeFO3pgZpuR0SM5Z129Z2pkjJ
 VBiE73rebS3GH30UIBIBZN/IGCSZxY1Fq+IxogbjLHtmW2l5rpgzfs9HOcvDjUaZjtU+
 hSFkDlA9ilnY57F5ZmDZngMNELLQxsiSUijg0hi7Rdo3dBIE/QIyShyuATE0i7t6PklH
 SZit3HMCZbnqahaYXOP04R6o32XtmSdUWS3I0YX9cWIt1AaHYQEk0esevTEcDVNZrXOI
 oJJmcoGl92v7/H42acOlZ2CWyOT0ONl+cKpEjH/sL5EdGk51OVGOzbcA2fzu2T7A8kVQ
 qnzA==
X-Gm-Message-State: AO0yUKV+CUHgdrPfoCJjq6Z3vS8+KXcgtcb55alQwliQr8Sv2ViQaDa0
 +sbypBP9W/bDbfgWz1bbfgHTeA==
X-Google-Smtp-Source: AK7set+JKYRHewLXrmZMryKiT6s3lH9qt4et63vCTKyAsYbL5REVSc3HMh2X2NAdVfi14vzVpLXDIw==
X-Received: by 2002:adf:e543:0:b0:236:695b:82d4 with SMTP id
 z3-20020adfe543000000b00236695b82d4mr10771954wrm.30.1677149047817; 
 Thu, 23 Feb 2023 02:44:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm10901155wml.43.2023.02.23.02.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:44:07 -0800 (PST)
Message-ID: <656c0b73-5cc2-874f-28c3-3dabf86039e7@linaro.org>
Date: Thu, 23 Feb 2023 11:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 7/9] aspeed/soc : Add AST1030 support
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
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
 <0c4810ae-edee-41df-7609-a3c6577a9ed3@linaro.org>
In-Reply-To: <0c4810ae-edee-41df-7609-a3c6577a9ed3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

ping

On 29/12/22 12:16, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 1/4/22 10:38, Jamin Lin wrote:
>> From: Steven Lee <steven_lee@aspeedtech.com>
>>
>> The embedded core of AST1030 SoC is ARM Coretex M4.
>> It is hard to be integrated in the common Aspeed Soc framework.
>> We introduce a new ast1030 class with instance_init and realize
>> handlers.
>>
>> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/arm/aspeed_ast10xx.c     | 299 ++++++++++++++++++++++++++++++++++++
>>   hw/arm/meson.build          |   6 +-
>>   include/hw/arm/aspeed_soc.h |   3 +
>>   3 files changed, 307 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/arm/aspeed_ast10xx.c
> 
> 
>> +static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error 
>> **errp)
>> +{
>> +    AspeedSoCState *s = ASPEED_SOC(dev_soc);
>> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>> +    MemoryRegion *system_memory = get_system_memory();
>> +    DeviceState *armv7m;
>> +    Error *err = NULL;
>> +    int i;
>> +
>> +    if (!clock_has_source(s->sysclk)) {
>> +        error_setg(errp, "sysclk clock must be wired up by the board 
>> code");
>> +        return;
>> +    }
>> +
>> +    /* General I/O memory space to catch all unimplemented device */
>> +    create_unimplemented_device("aspeed.sbc",
>> +                                sc->memmap[ASPEED_DEV_SBC],
>> +                                0x40000);
>> +    create_unimplemented_device("aspeed.io",
>> +                                sc->memmap[ASPEED_DEV_IOMEM],
>> +                                ASPEED_SOC_IOMEM_SIZE);
>> +
>> +    /* AST1030 CPU Core */
>> +    armv7m = DEVICE(&s->armv7m);
>> +    qdev_prop_set_uint32(armv7m, "num-irq", 256);
> 
> Can you confirm this SoC has 256 and not 240 IRQs?
> 
>> +    qdev_prop_set_string(armv7m, "cpu-type", sc->cpu_type);
>> +    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
>> +    object_property_set_link(OBJECT(&s->armv7m), "memory",
>> +                             OBJECT(system_memory), &error_abort);
>> +    sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
> 


