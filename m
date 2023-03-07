Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56C6ADCD1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:08:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZV9f-0002op-7x; Tue, 07 Mar 2023 06:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZV9X-0002kA-5y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:06:44 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZV9U-00026q-AE
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:06:42 -0500
Received: by mail-wr1-x434.google.com with SMTP id j2so11685534wrh.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678187198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8Xm1VwzWgTPcWbgPlKD6HLYH02iSnLyXyYGt1phCGsg=;
 b=QJyLWr0RhhL83tglfF5m32CNeRNXKmfAh2BtxaSD6qiAccfug8/fh32OZGBCrEGHKY
 nuTJRZvnMGK/L+a6YTsSIlv6A5ZydlHzIrSvzEN8ltGZoX2EgemKYrlpe9w3dCFDC+Oe
 ikoGqnQOcQPzK8wMYAfTxnqUo+yt4l8bcnteHt+KTqfoYsFnG5HOZ41CyY/NwyThLxq9
 pZTNisvhaeE1G/+zAPloip6kjTwaiQWYvuU/jyyPWGRZIdUEh/xdRpmG8n9UYEG1v18e
 R/ICz8Dtchi+DxjRFQ4iHPJesPUikaWyAzcpQ+SIrfr1Mg7u1IfrzF+b4WcU81TTU8qo
 qpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678187198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Xm1VwzWgTPcWbgPlKD6HLYH02iSnLyXyYGt1phCGsg=;
 b=UC2gI0yxj5JO8GdV8g1fIuu9npCD105QI788D7svdjeflo5bK0GHY0LDgzr6FnaAkm
 1ss64/BevZNFzhKq7qillxNdxs2wKbUfx4Eh/DcyyD/30y7ideM+4D9vaq9NThq4wjFW
 bMwLsrOiqGnGsctS811nCvLgeU4J2wnNGs62VIzkc1pPlGhr2xPLKgj4mmFOcFzcSOoC
 xMEtNmXgibiMp/AHrFyjXPbrVHqGu4PFJ9UVETtvpaWpy0j+HlFN8/Gd5j0hhvxOpVDV
 ccF9QAdWSHcX7fNeVS7YGhADx+Vv74HGfM0IdBAd84DnPO/0zOdFZT5WNm+zogiCrfBV
 TSTw==
X-Gm-Message-State: AO0yUKVDMRVHm46eFBksrPNCkHSQYKJqQp7skNmwG0qLPbZcGaSfQRsB
 oyeN2ID3p4bl7PHETXOAH+pwZw==
X-Google-Smtp-Source: AK7set+qUjQvBjlSi6mWgknWVSPnI8P4lzcnUXVPB0QsjCsgCt6bGpAHCpfRnXKuBPb4XQp7UL+DQA==
X-Received: by 2002:a5d:4563:0:b0:2cd:8a2e:14e with SMTP id
 a3-20020a5d4563000000b002cd8a2e014emr10657539wrc.34.1678187198313; 
 Tue, 07 Mar 2023 03:06:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d660a000000b002c70ce264bfsm12385957wru.76.2023.03.07.03.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 03:06:37 -0800 (PST)
Message-ID: <3d45bde8-9dbb-856b-b7f2-d1b1ff16bf6e@linaro.org>
Date: Tue, 7 Mar 2023 12:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230304114043.121024-1-shentey@gmail.com>
 <3497a0d0-49d5-f884-51ee-6e2ab22c77b1@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3497a0d0-49d5-f884-51ee-6e2ab22c77b1@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Hi Bernhard, Mark,

On 7/3/23 00:59, Mark Cave-Ayland wrote:
> On 04/03/2023 11:40, Bernhard Beschow wrote:
> 
>> A recent series [1] attempted to remove some PIC -> CPU interrupt 
>> indirections.
>> This inadvertantly caused NULL qemu_irqs to be passed to the i8259 
>> because the
>> qemu_irqs aren't initialized at that time yet. This series provides a 
>> fix by
>> initializing the qemu_irq of the respective south bridges before they
>> are passed to i2859_init().
>>
>> Furthermore -- as an optional extension -- this series also fixes some 
>> usability
>> issues in the API for creating multifunction PCI devices.
>>
>> The series is structured as follows: The first three commits fix the
>> regressions, the last two fix the public API for creating 
>> multifunction PCI
>> devices.
>>
>> [1] 
>> https://lore.kernel.org/qemu-devel/20230302224058.43315-1-philmd@linaro.org/
>>
>> Bernhard Beschow (5):
>>    hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt
>>    hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt
>>    hw/ppc/prep: Fix wiring of PIC -> CPU interrupt
>>    hw/pci/pci: Remove multifunction parameter from
>>      pci_create_simple_multifunction()
>>    hw/pci/pci: Remove multifunction parameter from
>>      pci_new_multifunction()
>>
>>   include/hw/pci/pci.h |  4 +---
>>   hw/alpha/dp264.c     |  8 +++++---
>>   hw/i386/pc_piix.c    |  2 +-
>>   hw/i386/pc_q35.c     | 10 +++++-----
>>   hw/isa/vt82c686.c    |  3 ++-
>>   hw/mips/boston.c     |  3 +--
>>   hw/mips/fuloong2e.c  |  9 +++++----
>>   hw/mips/malta.c      |  2 +-
>>   hw/pci-host/sabre.c  |  6 ++----
>>   hw/pci/pci.c         | 18 ++++++++++++------
>>   hw/ppc/pegasos2.c    |  9 +++++----
>>   hw/ppc/prep.c        |  4 +++-
>>   hw/sparc64/sun4u.c   |  5 ++---
>>   13 files changed, 45 insertions(+), 38 deletions(-)
> 
> Thanks for doing this! The patches basically look good, the only minor 
> niggle is that normally wiring of gpios is done *after* realize() for 
> consistency because some qdev_init_gpio_*() functions may use a property 
> to define the gpio array size.

Sorry this took me so long. The series LGTM too, but I wanted to well
understand the overall problem and run more tests.
Bernhard noticed that the bug is that we access the qdev gpios _before_
the device is realized.

The (undocumented) sysbus_connect_irq() API -- which calls
qdev_connect_gpio_out() -- is expected to be called _after_
DeviceRealize.

Bernhard's fix is to call qdev_connect_gpio_out() _before_
DeviceRealize.

> Having said that it is a nice tidy-up, so I'd be okay with patches 1-3 
> if you added a small comment above the qdev_connect_gpio_out() lines 
> pointing out that this is a temporary solution (hack?) until the 8259 
> device is converted to use gpios.

I agree, while this works, it is a "temporary solution" until we decide
and clarify the QDev/SysBus APIs w.r.t. IRQs.

> However given that Phil wrote the patches I'd wait for him to decide 
> whether he'd prefer a plain revert over the changes in this series 
> before going ahead with a v2.

As discussed with Peter / Mark / David on IRC, a revert is wiser for
this release.

