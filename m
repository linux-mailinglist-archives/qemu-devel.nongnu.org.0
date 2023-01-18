Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F43671835
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:52:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI56H-0005dK-GM; Wed, 18 Jan 2023 04:51:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI567-0005ah-Rq
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:51:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI564-0004wV-Tt
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:51:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1059054wms.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40HJCYgdlVSKSfxvZirAmgqFE8UPa8rIp8kw01PE6S0=;
 b=dfU93z4SYqTG5RXFCdtnm8bKD90zN73TI6kXaUgKPPEgMgELYMRGMqJM933wkJbdvG
 2rN/zsDziVVTH2M5RMF2W8c6pFhXBlY3IuzMQv++i6IEYIppHjk2vbwWq3s0TmC6dCad
 cgRryhCbXZiy4Wr0l3clFXgIW/AV1mk+FEZ6GOvkSGbTJ/BbgQvMm8OtOt2/jHnGgicB
 efYJSBvDq43gwIKvQYNZaXr5ScyFXuc64HHX7NZPRNFuQuxnIqOUv4E746wrRhR2coKu
 yeUpg7/yd22uCV0cVv/35zmN47sFG6u+tw2qksCKaSWx7LRpVtN7vjwFePp3FxIbYPCi
 9ufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40HJCYgdlVSKSfxvZirAmgqFE8UPa8rIp8kw01PE6S0=;
 b=2mkHm+gOvoC/mb327kkwDdkXtKYAHJBbjnPJEPm7qstXp/YOx59acwTT4SwfsfYZeN
 c+i21Zh3gGUJL35TVuMb5oNwBX6I99rNVzvFcWWHlxzkYklROmbfi6yRHoQFM4ybxxXT
 7lLpDrua5o+dBEUd3MzhLrJhDgk3l+Dls9Lcm/C+xVgVGQnZ7ZbBxCJyqdFb5rRXsw02
 WwbYwPj3zToeQrO/zdwn0Oxmn4AeNGKYu+tINCtIb7Zsk1W5h8yz86gLPjPURR9KT8OK
 ExvJPsLuWLHQhVDW0daxOqTtHN6SQ5lZBeUFVcoWZrhbMkxD/HHU6zRTJ91dUVuJ6vRu
 SjWg==
X-Gm-Message-State: AFqh2kox/QKjcDYA4OjxMf/AKQVBve221aXf5luavQgGq9jiMet8wYCS
 ohYM5bdUZqbxOMmCcxcpa1V26A==
X-Google-Smtp-Source: AMrXdXue3MJY2JblrCGnm9c/pnuSX5uIUIsBntKSKxcrRK+9IFNwqisJlGAQx2u4sFWnYeDs+vM8iw==
X-Received: by 2002:a05:600c:4395:b0:3da:2829:2935 with SMTP id
 e21-20020a05600c439500b003da28292935mr6096297wmn.11.1674035464459; 
 Wed, 18 Jan 2023 01:51:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003db0ad636d1sm1361137wmp.28.2023.01.18.01.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:51:04 -0800 (PST)
Message-ID: <79d72fb1-4c3b-a06e-495d-d99efc15b0f5@linaro.org>
Date: Wed, 18 Jan 2023 10:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] hw/ppc/pegasos2: Extract via_vt8231_create() helper
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20230117201640.88365-1-philmd@linaro.org>
 <20230117201640.88365-3-philmd@linaro.org>
 <187a86f4-64fc-3ba1-1a20-a19c33aa82f9@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <187a86f4-64fc-3ba1-1a20-a19c33aa82f9@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 17/1/23 22:17, BALATON Zoltan wrote:
> On Tue, 17 Jan 2023, Philippe Mathieu-Daudé wrote:
>> Simplify a bit pegasos2_init() by extracting the VIA southbridge
>> creation code into a new via_vt8231_create() helper.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/ppc/pegasos2.c | 33 +++++++++++++++++++++------------
>> 1 file changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>> index ac69aee099..445cb5ef31 100644
>> --- a/hw/ppc/pegasos2.c
>> +++ b/hw/ppc/pegasos2.c
>> @@ -96,6 +96,25 @@ static void pegasos2_cpu_reset(void *opaque)
>>     }
>> }
>>
>> +static PCIDevice *via_vt8231_create(MachineState *machine, PCIBus 
>> *pci_bus)
>> +{
>> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
>> +    PCIDevice *dev, *via;
>> +
>> +    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0),
>> +                                          true, TYPE_VT8231_ISA);
>> +    object_property_add_alias(OBJECT(machine), "rtc-time",
>> +                              
>> object_resolve_path_component(OBJECT(via), "rtc"),
>> +                              "date");
>> +    qdev_connect_gpio_out(DEVICE(via), 0,
>> +                          qdev_get_gpio_in_named(pm->mv, "gpp", 31));
>> +
>> +    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
>> +    pci_ide_create_devs(dev);
>> +
>> +    return via;
>> +}
>> +
>> static I2CBus *via_i2c_bus(PCIDevice *via)
>> {
>>     PCIDevice *dev;
>> @@ -110,7 +129,7 @@ static void pegasos2_init(MachineState *machine)
>>     CPUPPCState *env;
>>     MemoryRegion *rom = g_new(MemoryRegion, 1);
>>     PCIBus *pci_bus;
>> -    PCIDevice *dev, *via;
>> +    PCIDevice *via;
>>     const char *fwname = machine->firmware ?: PROM_FILENAME;
>>     char *filename;
>>     int sz;
>> @@ -166,17 +185,7 @@ static void pegasos2_init(MachineState *machine)
>>     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
>>
>>     /* VIA VT8231 South Bridge (multifunction PCI device) */
>> -    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), 
>> true,
>> -                                          TYPE_VT8231_ISA);
>> -    object_property_add_alias(OBJECT(machine), "rtc-time",
>> -                              object_resolve_path_component(OBJECT(via),
>> -                                                            "rtc"),
> 
> Is this series to help any later patches or is it proposed on its own? 
> In the latter case I don't see how this would improve it much. The only 
> useful change in the series is removing the unnecessary line break 
> before "rtc"); here, otherwise moving patts of this init routine to 
> separate functions does not make it simpler just makes you jump around 
> instead of being able to read it linearly. So if this makes it possible 
> for later patches to move some of it elsewhere then OK otherwise I'd say 
> I'm OK with how it is now, it's just the normal unreadable QOM stuff you 
> see everywhere after removing legacy init functions.

Difference of mindset I suppose, as you clearly type linearly :)

I consider logical blocks of hardware, and the southbridge is one of
them. So I thought moving components connected to the 'machine' via
the southbridge in a separate function would be clearer for the
overall community (this file is not exclusively used by you, and
can potentially used as example to build a machine). Anyhow I don't
mind much.

Regards,

Phil.

