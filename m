Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37462E7145
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 15:10:55 +0100 (CET)
Received: from localhost ([::1]:33636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuFiB-0000em-0h
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 09:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuFgg-0007eX-3T
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 09:09:22 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuFgd-0008Ri-3q
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 09:09:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id 190so2681123wmz.0
 for <qemu-devel@nongnu.org>; Tue, 29 Dec 2020 06:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uaLvE02Zr8mnX9yQp1vzu1fwPNsXstS8aDF620fjd04=;
 b=Kc6shZxZxvh8q+ECW/7MZx31B5XOKSb+3PVWp/Iyzv2tSzbtrg3URL23DgHl3Sb/Du
 IimL3xUTt2Zo0QKCyRTCzxFn6bicZTfJDQjzQ2neWOsMTbO3Am4WwMdysjtaxks+PsNW
 PURAVQmvlCkLGBy9oZOrRaQ/P6RhtO+Xgd3yAamIBgzwHDFbLNewGC+oifiUKro5IDOL
 a52pV9M9LWGCVmDtlqu7+hSqvZVgu8BvviDEMPjOvD8o9DVSlaP4GsgXEJWARE+q23nk
 HCxnuSgwA7F41rVhaLQXb6i2zGW2b6g2NOFc8b+R/D7NCYVo2E9j+sshTq8Dm0KH5go4
 TPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uaLvE02Zr8mnX9yQp1vzu1fwPNsXstS8aDF620fjd04=;
 b=glWvb1bHq130ncaNwC5/+yFMqVsGxzmt24AsKx8ZzM21JBUq09ncmljHuitVwRdPAs
 wx/mRA7euW3U3JlBnKiJyJXDepm9JnJuC/x1SBdbyZItVlwNCvFNHp9lc2d1O2WvH4EK
 iPVFiaF+zOW0TDSFrBL3L1hVrZrYMAouUkEbLQrvmfHoC8UjJiT/ITzYmsGkEdSEvhvk
 MDymzIVajSz3OFi4wAxGLSFcCpQGbec2guAwmvE2YIFN2u8kLaLKDKGhcqYvmfxwPo3k
 yaa/Q6ZtbGDhqP/XoS1EkeyDrOBRs5jY0UlL5bf0/qwua2+7eNsbJuLrd2BvEOFYpqih
 tOFg==
X-Gm-Message-State: AOAM533WWtRLR1+5+iNQ4c3ydq14ps7NXJZGuz2QcLduYUCgdXZBStu8
 bzdVrCeJZn58D4Rq1RQKoTU=
X-Google-Smtp-Source: ABdhPJycH+hXmNHP99k7acbgxkVqICsf/oxiJGOwPqCGJzTz/5Cmalcm7OHkVAH/Cg2DO/qSrEDkTQ==
X-Received: by 2002:a1c:b657:: with SMTP id g84mr3674620wmf.181.1609250956949; 
 Tue, 29 Dec 2020 06:09:16 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id w17sm3634631wmk.12.2020.12.29.06.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 06:09:16 -0800 (PST)
Subject: Re: Bug in Bonito? (mips/fuloong2e)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <771a6cd4-90a7-662e-5a5b-e8a9395a875@eik.bme.hu>
 <c655a692-991e-b633-456a-6fb149520a37@flygoat.com>
 <511225e2-f074-4318-4fb0-f695ca6befe0@amsat.org>
 <e6060d69-4e39-3a95-0f0a-504e1eacec78@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e6879b51-ed24-31c0-8535-351a673ae5f5@amsat.org>
Date: Tue, 29 Dec 2020 15:09:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e6060d69-4e39-3a95-0f0a-504e1eacec78@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.07,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wu Zhangjin <wuzhangjin@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/20 2:02 PM, Jiaxun Yang wrote:
> 在 2020/12/29 18:47, Philippe Mathieu-Daudé 写道:
>> On 12/29/20 6:26 AM, Jiaxun Yang wrote:
>>> 在 2020/12/29 上午11:26, BALATON Zoltan 写道:
>>>> Hello,
>>>>
>>>> While continuing with part two of my vt82c686b clean ups I've tried to
>>>> implement SMBus IO base configuration in the vt82c686b-pm part that
>>>> I've already done for vt8231 for pegasos2 and it should be the same
>>>> for 686B. (In short, writing address to pm config 0x90 sets base
>>>> address of smbus regs and bit 0 of 0xd2 enables/disables it.) This is
>>>> what the firmware does first and it would allow removing hard coded
>>>> 0xeee1 value and the property to set it and then I could reuse the
>>>> same PM part in VT8231.
>>>>
>>> [...]
>>>> Any idea what this is trying to do and how to fix it?
>>> It's trying to translate Bonito style PCI config space r/w to
>>> standard PCI
>>> config space R/W.
>>>
>>> A quick galance told me change BONITO_PCICONF_REG_MASK to 0xff
>>> may help.
>> Per the datasheet section "5.7.5. Accessing PCI configuration space"
>> 0xfc is the correct value, but the register number starts at the 2nd
>> bit. So this is not a write access to register 0xd2 but 0x34?
> 
> It seems like Loongson changed defination of the register?

Maybe, I only have the bonito64 specs, not the Loongson2 ones.
I am a bit confused, I thought the Fuloong 2E was based on
bonito64 (which QEMU models).

Do you know if the Loongson2 specs are public?

> There is no shifting in kernel[1] as well.
> 
> ```
> /* Type 1 configuration for offboard PCI bus */
> addr = (busnum << 16) | (device << 11) | (function << 8) | reg;
> ```

OK, this makes sense after looking at Linux kernel commit e2fee5723bbd
("MIPS: Bonito64: Make Loongson independent from Bonito64 code.") [2]

I'm a bit reluctant to modify hw/pci-host/bonito.c to make Loongson2
works without having the specs handy, justifying simply because
"Linux uses it that way".

OTOH it is pointless to maintain a model that has no users (thinking
about not breaking the bonito64 model).

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2fee5723bbd

> 
> Thanks.
> 
> [1]:
> https://elixir.bootlin.com/linux/latest/source/arch/mips/pci/ops-loongson2.c
> 
> 
> - Jiaxun
>>
>> If you can test, this is the snippet I plan to send later:
>>
>> -- >8 --
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index a99eced0657..65953766dd0 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -189,3 +189,3 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>>   #define BONITO_PCICONF_REG_MASK        0xFC
>> -#define BONITO_PCICONF_REG_OFFSET      0
>> +#define BONITO_PCICONF_REG_OFFSET      2
>> ---
>>
>>> Thanks.
>>>
>>> - Jiaxun
>>>
>>>> Regards,
>>>> BALATON Zoltan
>>>
> 
> 

