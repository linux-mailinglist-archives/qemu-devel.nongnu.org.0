Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D57692430
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:12:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWvc-0005wR-BP; Fri, 10 Feb 2023 12:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWvY-0005wC-Pm
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:11:13 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWvW-0007C4-Ma
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:11:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso6744491wmp.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 09:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xpd/wQa/7zbsoam3G+qnzylT9lEu37BbNyJhoajYMv4=;
 b=Za6YjPpfmq/b7Ze3mbqQCf4AQkFUqPt/5l11UAy/62rzbeT5pgSc5qj4evQP6TSAl7
 EY7NKN2EpINdDNGAreG9gXtYO/JAnxJ397HzpQAGsicUaQL3Z1J+DTu6rf+1oLiyeJ/4
 IyrFDDQ4XVlg/tjV1S+QOqcRSa8IJJAM7WVWldDAnZEuZFm1UufC1ZBbkJLwagN5J7mX
 Pqpd2wCGMNe/TKksTVjpaiEL6wlsUG0HEep1Nsm17WzQ30ldmVNfR5cDRlLZrtRlSKmW
 0CW7DOVNDA6IcFfQn6ptkqUJ066AtxACOlTrt9AnDMCL9mjzfYUmc1RyJMJGfw4hGCrf
 PP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpd/wQa/7zbsoam3G+qnzylT9lEu37BbNyJhoajYMv4=;
 b=R1aCr+mWhMUcaAM8gz8TBIubhvHFp20TaUPEsWtFrcaTqgOZYm2FAbaMyWK8mp61wV
 MOPzlq+/egChEjFhQoB3mpJc06mLgpvD/VZ6QsBu4miB9WPNgMnt/UoYQbRKK5NPN2N7
 hegVkAEHiE+SWS8ChsYYTnyODaO2otqMjSPOGfFk1WZHaathrR3TgQFdK1OLocg6ReZB
 Xx+mV839sC5R9yklggJcAYQNE+2vyH0hjKidhCLVH7p3yvMWdNYLEj+9CeEJO86b0TTG
 3o2yBgOy4yaf2Emkq0Q2xRfKcITwU5Ldy+TqDGgQr0hy2EiCNXzRjkmfrVEn1cSsk9GV
 giZw==
X-Gm-Message-State: AO0yUKVP8OzlI9GbB0lPmOAJcHHDx4E5l8tPf4LwXojZv5C23Dn9tXwx
 1lr1bowHuse4WhiF5PrJi9seSw==
X-Google-Smtp-Source: AK7set/jdJl0JMkgmMdxGm3vxAI/J7Tn6cqRF5q5AFdmX0Tjt+n4+XN+O42LlNlY0WlaoKErKYq0bw==
X-Received: by 2002:a05:600c:1656:b0:3e0:fda8:7e26 with SMTP id
 o22-20020a05600c165600b003e0fda87e26mr9771632wmn.33.1676049068934; 
 Fri, 10 Feb 2023 09:11:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003df30c94850sm8577400wmc.25.2023.02.10.09.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 09:11:08 -0800 (PST)
Message-ID: <6f97d406-ff70-07b2-2477-c69420bff2a7@linaro.org>
Date: Fri, 10 Feb 2023 18:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
 <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
 <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
 <9578e7ca-5f3d-2d00-7288-16ae486fb8c0@linaro.org>
 <36BB4E64-8163-44BA-B622-8943E1C1DCE8@gmail.com>
 <50FA07E9-C8DA-4D6E-9A87-F40BB9C2D324@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <50FA07E9-C8DA-4D6E-9A87-F40BB9C2D324@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 10/2/23 17:27, Bernhard Beschow wrote:
> 
> 
> Am 23. Januar 2023 15:51:49 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>
>>
>> Am 23. Januar 2023 09:25:51 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> On 20/1/23 13:22, Bernhard Beschow wrote:
>>>> Am 13. Januar 2023 17:39:45 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>>>> Am 13. Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>>>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>>>>>> This series consolidates the implementations of the PIIX3 and PIIX4 south
>>>>>>> bridges and is an extended version of [1]. The motivation is to share as much
>>>>>>> code as possible and to bring both device models to feature parity such that
>>>>>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
>>>>>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
>>>>>>> list before.
>>>>>>
>>>>>>> Bernhard Beschow (30):
>>>>>>>      hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>>>>>>>      hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>>>>>>>      hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
>>>>>>>      hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>>>>>      hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>>>>>      hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>>>>>      hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>>>>>>      hw/i386/pc: Create RTC controllers in south bridges
>>>>>>>      hw/i386/pc: No need for rtc_state to be an out-parameter
>>>>>>>      hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>>>>>>        south bridge
>>>>>>>      hw/isa/piix3: Create USB controller in host device
>>>>>>>      hw/isa/piix3: Create power management controller in host device
>>>>>>>      hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>>>>>>      hw/isa/piix3: Create IDE controller in host device
>>>>>>>      hw/isa/piix3: Wire up ACPI interrupt internally
>>>>>>>      hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>>>>>      hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>>>>>      hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>>>>>      hw/isa/piix3: Drop the "3" from PIIX base class
>>>>>>>      hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>>>>>      hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>>>>>      hw/isa/piix4: Use TYPE_ISA_PIC device
>>>>>>>      hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>>>>>      hw/isa/piix4: Rename reset control operations to match PIIX3
>>>>>>>      hw/isa/piix3: Merge hw/isa/piix4.c
>>>>>>>      hw/isa/piix: Harmonize names of reset control memory regions
>>>>>>>      hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>>>>>      hw/isa/piix: Rename functions to be shared for interrupt triggering
>>>>>>>      hw/isa/piix: Consolidate IRQ triggering
>>>>>>>      hw/isa/piix: Share PIIX3's base class with PIIX4
>>>>>>>
>>>>>>> Philippe Mathieu-Daudé (3):
>>>>>>>      hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>>>>>>      hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>>>>>>      hw/isa/piix4: Correct IRQRC[A:D] reset values
>>>>>>
>>>>>> I'm queuing the first 10 patches for now to alleviate the size of this
>>>>>> series, and I'll respin a v7 with the rest to avoid making you suffer
>>>>>> any longer :/ Thanks for insisting in this effort and I apologize it
>>>>>> is taking me so long...
>>>>>
>>>>> Okay... What's the further plan? Is there anything missing?
>>>>
>>>> Ping
>>>
>>> The plan is "I'll respin a v7 with the rest".
>>
>> I understood that part. I wonder what the blocking issue is/was.
> 
> The first part of this series contains piix3 changes such as the ISA proxy pic and movement of rtc. This seems the riskier part of the series to me which I'd like to get feedback on from the field rather sooner than later. The reason is that I can't currently forsee how fast I could react if these changes were merged during (soft) freeze.

What bugs me is the i8259 proxy. I applied your patches locally, and am
trying to rework to avoid using it. I amend a 'Co-developed-by' tag
to patches modified:
https://docs.kernel.org/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by


