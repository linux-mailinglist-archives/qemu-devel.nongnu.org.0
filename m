Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026CD2BB131
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:12:33 +0100 (CET)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9xX-00022Z-IZ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg9uY-0008BT-Kd; Fri, 20 Nov 2020 12:09:26 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg9uU-0006xE-TG; Fri, 20 Nov 2020 12:09:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p19so8762001wmg.0;
 Fri, 20 Nov 2020 09:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F+WopgHAyjc9Q6dNWZwiMfaY+rfe0R7BAZ1h6IMjCO0=;
 b=ky+cRpZBOfrNdaD2GbPQJqKfZ9QzYtcB3478Qo4AqTLpclvgq28+J9KhF6kv8OFpDn
 PNHrnvimdkOMto0Mywi1SS2xr8zKZaOjXi3AS3KlcsFByfGEnnSv384AsAhwZK08RGbQ
 QaHOnPMs781rrSka3ZkbzRlzf12do7PdmPcTlxgFVsePWRC8crVlywPGEF4aB9I6ZRZ0
 xEfpvZ9g0qu8MAy9OE6sXLJy1NuTXp8n4Md69VRWR0rWE+qNZLMatbjzuUY25xYJNLBj
 ybAYXd9B/HwDEr+gqSomBArNqMsU0XHqkgd8YPG4q66+HLeVX9sJ+LOCOWKpSC3faEkr
 pVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F+WopgHAyjc9Q6dNWZwiMfaY+rfe0R7BAZ1h6IMjCO0=;
 b=hp6vaWgOUk60zdMeUqmujRWqpA/ywcZoX1wzTex40+aMWAhTslZP/K3nZoiWC6oZQf
 B2Sf9JV3poO20cLVgWrXJ/6Dn2MqzaGYIXSsHeo8MLvbZpFX0msz9LXgbkDXsNIdapio
 22Ft1l+FQrFojouh3wKXfEO2G70FNNz/GbRzcNtQDFgvon2Coyc2PWJXdjIX0KuD9zSr
 pbDHhn1Gg44g9rBzmu+owBMjGk2q7y5WSVnsf9CRQjznkHxFmxING0mRA9BsBgkDAy0j
 M1+M8JAa6K3Gx/8QL4HeYIpYGxyRWXggI8WyWdBKQXxkkhW8o/ySatzbm8kbR7aH4I9Y
 xqAw==
X-Gm-Message-State: AOAM533F4P/DxFYQxg3UzjkK3PbzhkyfNCUSumbGZJnEgLDjGYYhA/Dp
 fvq09DwaGmzFM+T6Y9UoKe4=
X-Google-Smtp-Source: ABdhPJyBBZPWaLOw/GYhkaLSGmA+V1+S94AQ+6Qw/Id523K45byBh44tGSZVt/pgnSPm8m4V4KZBRA==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr10929198wme.171.1605892160976; 
 Fri, 20 Nov 2020 09:09:20 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id z189sm5099122wme.23.2020.11.20.09.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 09:09:20 -0800 (PST)
Subject: Re: [PATCH-for-5.2 2/4] docs/system/arm: Document the various raspi
 boards
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-3-f4bug@amsat.org>
 <CAFEAcA85nhCv6DH-Kf0CqfaN5rYrhzE=TY54MNEqn5ko3wkDNQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc21801d-b4cc-4fb7-8ea9-61f92680ba54@amsat.org>
Date: Fri, 20 Nov 2020 18:09:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA85nhCv6DH-Kf0CqfaN5rYrhzE=TY54MNEqn5ko3wkDNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 5:48 PM, Peter Maydell wrote:
> On Fri, 20 Nov 2020 at 15:21, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Document the following Raspberry Pi models:
>>
>>  - raspi0               Raspberry Pi Zero (revision 1.2)
>>  - raspi1ap             Raspberry Pi A+ (revision 1.1)
>>  - raspi2b              Raspberry Pi 2B (revision 1.1)
>>  - raspi3ap             Raspberry Pi 3A+ (revision 1.0)
>>  - raspi3b              Raspberry Pi 3B (revision 1.2)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  docs/system/arm/raspi.rst  | 44 ++++++++++++++++++++++++++++++++++++++
>>  docs/system/target-arm.rst |  1 +
>>  2 files changed, 45 insertions(+)
>>  create mode 100644 docs/system/arm/raspi.rst
>>
>> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
>> new file mode 100644
>> index 00000000000..b19284e4481
>> --- /dev/null
>> +++ b/docs/system/arm/raspi.rst
>> @@ -0,0 +1,44 @@
>> +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
>> +======================================================================================
>> +
>> +
>> +QEMU provides models the following Raspberry Pi boards:
> 
> "models of"
> 
>> +
>> +``raspi0`` and ``raspi1ap``
>> +  ARM1176JZF-S core, 512 MiB of RAM
>> +``raspi2b``
>> +  Cortex-A7 (4 cores), 1 GiB of RAM
>> +``raspi3ap``
>> +  Cortex-A53 (4 cores), 512 MiB of RAM
>> +``raspi3b``
>> +  Cortex-A53 (4 cores), 1 GiB of RAM
>> +
>> +
>> +Implemented devices
>> +-------------------
>> +
>> + * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
>> + * Interrupt controller
>> + * DMA controller
>> + * Clock and reset controller (CPRMAN)
>> + * System Timer
>> + * GPIO controller
>> + * Serial ports (BCM2835 AUX - 16550 based - and PL011)
>> + * Random Number Generator (RNG)
>> + * Frame Buffer
>> + * USB host (USBH)
>> + * GPIO controller
>> + * SD/MMC host controller
>> + * SoC thermal sensor
>> + * USB2 host controller (DWC2 and MPHI)
>> + * MailBox controller (MBOX)
>> + * VideoCore firmware (property)
>> +
>> +
>> +Missing devices
>> +---------------
>> +
>> + * Peripheral SPI controller (SPI)
>> + * Analog to Digital Converter (ADC)
>> + * Pulse Width Modulation (PWM)
>> + * Security features
> 
> "Security features" is a bit vague; could we be more precise?

I used Nuvoton as template. I'll remove :)

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

