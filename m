Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9868B5D9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 07:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOvM7-0003EK-9Y; Mon, 06 Feb 2023 01:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOvLt-0003Dt-Ap
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:51:45 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOvLr-0006lu-Ge
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 01:51:45 -0500
Received: by mail-wm1-x329.google.com with SMTP id n13so7899754wmr.4
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 22:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PyTip9Ypen96wY7r1JB4B1Dyeem/0UiSss3KyfzUsno=;
 b=t/Lz7VzeQQd1CXoi27yEdwWA46ShZuXMN9im2pC+k2B8nzPQ90lNTPFHwhIsftQ7ZB
 MhjXMQ4a/mXy+YotvoRrW47rYO0e08EuXWbRHVLOdeBVnRDalefmbrxOcyMqSbNOFJz1
 PxheEnsEzKrvBG7VgHoTkavxd9OcjmnwxSCl18Uq9Q8i7Ww1lrzxEeto6mAwhuC5FNBG
 X1ShYXAo0GfEf+Ut1a195qIKLkds5cSRTrs0UQOjyKq6EUqQDHLT02lqoX3QR2+yhue9
 vf0enhRl+MmzHSbw86MxQvrX2bO4TeH2R/omerbyaXGuQ/+cBtH2BOfcogaLPV+uIc7G
 QqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PyTip9Ypen96wY7r1JB4B1Dyeem/0UiSss3KyfzUsno=;
 b=fgx9ZzUWUbJAcRSnu7+UmWsqK9xrplThPnO+8tVvY3mjOrn+KBpV1pmzqr7UFIbrxJ
 SJBSHDQxtwZ/SYtnM8jBcpDeaJui8guQesUklTLDNaMwoZuRzvh8bKI8vINgwkAR6hub
 aEtrQO5OoUnJuTCHSlW3cxguvPt/yQcsZ/zPCjT3CbLvSpeSYUB+hDQ1kW4gfAUax1HN
 yxuLe445DyhDH1SiOmjdWbhgvXhND69joW0+jQsiNkcZwQHooaMYi6ruBOetvtpglIJx
 QerlAdzmbg0d7hD82mnhkZaZqLzjiB/pR/ZiC6+7avPibOC6ScsevpDnQWV9MV6CC5y9
 adTw==
X-Gm-Message-State: AO0yUKUT1YP3cJqjfHOa7PLIWk5zlaz8FXIK2H99L3POFKpr8gua50NZ
 jI0xbHu4s7XqD2JWuL8OYp8kYw==
X-Google-Smtp-Source: AK7set/I7GphNKlwTZcMoTlNCQqoxlc8Bhu+sN8IkOtnfILr1BX6MJxhXS1MD8ypvM707ffKGBMRoA==
X-Received: by 2002:a1c:7214:0:b0:3da:2500:e702 with SMTP id
 n20-20020a1c7214000000b003da2500e702mr18161642wmc.32.1675666301369; 
 Sun, 05 Feb 2023 22:51:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003daffc2ecdesm14940931wmc.13.2023.02.05.22.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 22:51:40 -0800 (PST)
Message-ID: <54381726-dcab-8fb2-636d-4937bf0f4866@linaro.org>
Date: Mon, 6 Feb 2023 07:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/10] hw/ide/piix: Require an ISABus only for
 user-created instances
To: Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-8-shentey@gmail.com>
 <fb287888-c88c-60b1-20a4-1e50ddbf1daf@ilande.co.uk>
 <alpine.LMD.2.03.2302052308460.32269@eik.bme.hu>
 <935ae2a8-4327-53c6-1649-36698a00901d@ilande.co.uk>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <935ae2a8-4327-53c6-1649-36698a00901d@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 5/2/23 23:32, Mark Cave-Ayland wrote:
> On 05/02/2023 22:21, BALATON Zoltan wrote:
> 
>> On Sun, 5 Feb 2023, Mark Cave-Ayland wrote:
>>> On 26/01/2023 21:17, Bernhard Beschow wrote:
>>>> Internal instances now defer interrupt wiring to the caller which
>>>> decouples them from the ISABus. User-created devices still fish out the
>>>> ISABus from the QOM tree and the interrupt wiring remains in PIIX IDE.
>>>> The latter mechanism is considered a workaround and intended to be
>>>> removed once a deprecation period for user-created PIIX IDE devices is
>>>> over.
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>> ---
>>>>   include/hw/ide/pci.h |  1 +
>>>>   hw/ide/piix.c        | 64 
>>>> ++++++++++++++++++++++++++++++++++----------
>>>>   hw/isa/piix.c        |  5 ++++
>>>>   3 files changed, 56 insertions(+), 14 deletions(-)

>>> I haven't checked the datasheet, but I suspect this will be similar 
>>> to the cmd646/via PCI-IDE interfaces in that there will be a PCI 
>>> configuration register that will switch between ISA compatibility 
>>> mode (and ISA irqs) and PCI mode (with PCI IRQs). So it would be the 
>>> device configuration that would specify PCI or ISA mode, rather than 
>>> the presence of an ISABus.
>>
>> I forgot about this topic already and haven't follwed this series 
>> either so what I say may not fully make sense but I think CMD646 and 
>> via-ide are different. CMD646 is a PCI device and should use PCI 
>> interrupts while via-ide is part of a southbridge/superio complex and 
>> connected to the ISA PICs within that southbride, so I think via-ide 
>> always uses ISA IRQs and the ISA btidge within the same chip may 
>> convert that to PCI IRQs or not (that part is where I'm lost also 
>> because we may not actually model it that way). After a long debate we 
>> managed to find a solution back then that works for every guest we use 
>> it for now so I think we don't want to touch it now until some real 
>> need arises. It does not worth the trouble and added complexity to 
>> model something that is not used just for the sake of correctness. By 
>> the time we find a use for that, the ISA emulation may evolve so it's 
>> easier to implement the missing switching between isa and native mode 
>> or we may want to do it differently (such as we do things differently 
>> now compared to what we did years ago). So I think it does not worth 
>> keeping the ISA model from being simplified for some theoretical uses 
>> in the future which we may not actually do any time soon. But I don't 
>> want to get into this again so just shared my thoughts and feel free 
>> to ignore it. I don't care where these patches go as long as the VIA 
>> model keeps working for me.
> 
> I have a vague memory that ISA compatibility mode was part of the 
> original PCI-BMDMA specification, but it has been a while since I last 
> looked.
> 
> Bernhard, is there any mention of this in the PIIX datasheet(s)? For 
> reference the cmd646 datasheet specifies that ISA mode or PCI mode is 
> determined by register PROG_IF (0x9) in PCI configuration space.

Orthogonal to this discussion, one problem I see here is a device
exposing 2 interfaces: ISA and PCI. QOM does support interfaces,
but ISA and PCI aren't QOM interfaces. The QOM cast macros are
written as a QOM object can only inherit one parent. Should we
stick to QDev and convert ISA/PCI as QOM interfaces? That could
solve some QDev IDE limitations...

