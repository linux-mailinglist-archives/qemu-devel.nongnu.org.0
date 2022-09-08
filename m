Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470B5B19F3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:29:06 +0200 (CEST)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWEmP-0005gu-6D
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEji-0000DA-Oy; Thu, 08 Sep 2022 06:26:20 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:39771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWEjO-0002Xl-F9; Thu, 08 Sep 2022 06:26:16 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11e9a7135easo43104041fac.6; 
 Thu, 08 Sep 2022 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=PgnvftVl+E99sSDJpHslQG2HkYphFWS+hlF+AIlqFM0=;
 b=dxImz7QXzGehFrMqOIlaudtl1CMPldBispIGWh+QKPfc96UV9nFmaC/71JyEEhYSIq
 WZ7DdSFNX3ngtouyTSldEYP8TGy477iPTvsrVBRQnlYu/wQtZog+ct6aRTdrhCYHDxoM
 kBWHyv2cgleuOejzee/8oTrX+nnRMhWoMFNhWY0ZEXgk83AGKJmhWQBTq4TLMAyhN1+m
 YhsVzlfZ2buZGycAo66LIMQDo8c59EmreTZ4uThAvV9AW/KaDMcnv5qeohAKM74KU+z2
 9MS4s9x6AfaTJlhU7a4NgBZCkqCYL8Sg9mJMCPLZjVEWx9EAU7rM2eT+ZKAxa/BS98eE
 7sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PgnvftVl+E99sSDJpHslQG2HkYphFWS+hlF+AIlqFM0=;
 b=NiQc5bUmlGv6/sGfbL8bSqqdrplFtlIZN1OFaE17y1niYcyCkMYsJDO3PTVWI/IJy/
 f89Tida0cHrLbHABZyI+rFcreGiyhPKnFsK5lbb6wUQj/XfVUz0WMIWcp5gJ1Lya4KTL
 D2PTqdIW1KwpF7JY8/OJ6OTiPaQ80ik6Uy7thhOa8/9+Eph5fqSbx6O4xjccfciDW9lB
 0LO6gRYQ56CE4gY+tkcwgzXpowJvKcwJK5ezVZR2KrkSur521DKRy4kLgLVcBpnXeeWd
 iVF/CZZhaSVycBWneyn/+DraShYf8DBCxiATPEheSCvREp5cvP1BZUAMIk+pGhGR+Cn7
 DCKQ==
X-Gm-Message-State: ACgBeo1CbtV4A+XwPgOp2Nugodm1O5dQykb/vy4Z06c6FF0GC37UWBs8
 s3unVayoHtosEVsmqWAiCrg=
X-Google-Smtp-Source: AA6agR48PAKDm6WTcXnPwU8vYmm2y3CiO+jZh1DND7tiACpNRvB/4b4AIyeVg29wlofMQQW3ll7GGg==
X-Received: by 2002:a05:6870:538a:b0:11e:58c6:714d with SMTP id
 h10-20020a056870538a00b0011e58c6714dmr1401372oan.142.1662632753460; 
 Thu, 08 Sep 2022 03:25:53 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 t128-20020a4a5486000000b0044b0465bd07sm5917643ooa.20.2022.09.08.03.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 03:25:52 -0700 (PDT)
Message-ID: <b496df5a-75e3-9304-19a8-fd54ed3f24c9@gmail.com>
Date: Thu, 8 Sep 2022 07:25:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <6B91888F-40E0-4E92-B49D-BA0A7E784183@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <6B91888F-40E0-4E92-B49D-BA0A7E784183@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/8/22 05:34, Bernhard Beschow wrote:
> Am 1. September 2022 11:41:14 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> v5:
>>
>> * Add patch "Inline vt82c686b_southbridge_init() and remove it" (Zoltan)
>>
>> * Use machine parameter when creating rtc-time alias (Zoltan)
>>
>>
>>
>> Testing done: Same as in v3.
>>
>>
>>
>> v4:
>>
>> * Fix in comment: AC97 Modem -> MC97 Modem (Zoltan)
>>
>> * Introduce TYPE_VT82C686B_USB_UHCI define (Zoltan)
>>
>> * Introduce TYPE_VIA_IDE define (for consistency)
>>
>>
>>
>> v3:
>>
>> * Replace pre increment by post increment in for loop (Zoltan)
>>
>> * Move class defines close to where the class is defined (Zoltan)
>>
>>
>>
>> Testing done:
>>
>> * `make check-avocado`
>>
>>   Passes for boot_linux_console.py for mips64el_fuloong2e
>>
>> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel morphos-3.17/boot.img`
>>
>>   Boots successfully and it is possible to open games and tools.
>>
>>
>>
>> v2:
>>
>> * Keep the call to pci_ide_create_devs() in board code for consistency (Zoltan)
>>
>> * Create rtc-time alias in board rather than in south bridge code
>>
>> * Remove stale comments about PCI functions (Zoltan)
>>
>>
>>
>> v1:
>>
>> This series instantiates all PCI functions of the VT82xx south bridges in the south bridges themselves.
>>
>> For the IDE function this is especially important since its interrupt routing is configured in the
>>
>> ISA function, hence doesn't make sense to instantiate it as a "Frankenstein" device. The interrupt
>>
>> routing is currently hardcoded and changing that is currently not in the scope of this series.
>>
>>
>>
>> Testing done:
>>
>> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel morphos-3.17/boot.img`
>>
>>   Boots successfully and it is possible to open games and tools.
>>
>>
>>
>> * I was unable to test the fuloong2e board even before this series since it seems to be unfinished [1].
>>
>>   A buildroot-baked kernel [2] booted but doesn't find its root partition, though the issues could be in the buildroot receipt I created.
>>
>>
>>
>> [1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>
>> [2] https://github.com/shentok/buildroot/commits/fuloong2e
>>
> 
> Ping
> 
> Zoltan, would you mind giving your Reviewed-by for 'hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it' explicitly? Perhaps I was too eager to omit it since I didn't want to put words in your mouth.
> 
> What else is missing? Who would do the pull request?


The bulk of the changes were done in hw/isa/vt82c686.c and hw/mips/fuloong2e.c.
The Fuloong 2E maintainers are already CCed, so I believe they're already
aware of this series.

I did my test round with the PowerPC test suit with this series and it didn't
break anything, so I acked all patches that changed hw/ppc/pegasos2.c. Feel
free to push those changes in the Fuloong 2E pull request.


Thanks,


Daniel


> 
> Thanks,
> Bernhard
>>
>>
>> Bernhard Beschow (13):
>>
>>   hw/isa/vt82c686: Resolve chip-specific realize methods
>>
>>   hw/isa/vt82c686: Resolve unneeded attribute
>>
>>   hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()
>>
>>   hw/isa/vt82c686: Reuse errp
>>
>>   hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
>>
>>   hw/isa/vt82c686: Instantiate IDE function in host device
>>
>>   hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define
>>
>>   hw/isa/vt82c686: Instantiate USB functions in host device
>>
>>   hw/isa/vt82c686: Instantiate PM function in host device
>>
>>   hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device
>>
>>   hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it
>>
>>   hw/isa/vt82c686: Embed RTCState in host device
>>
>>   hw/isa/vt82c686: Create rtc-time alias in boards instead
>>
>>
>>
>> configs/devices/mips64el-softmmu/default.mak |   1 -
>>
>> hw/ide/via.c                                 |   2 +-
>>
>> hw/isa/Kconfig                               |   1 +
>>
>> hw/isa/vt82c686.c                            | 120 +++++++++++++++----
>>
>> hw/mips/fuloong2e.c                          |  39 +++---
>>
>> hw/ppc/Kconfig                               |   1 -
>>
>> hw/ppc/pegasos2.c                            |  25 ++--
>>
>> hw/usb/vt82c686-uhci-pci.c                   |   4 +-
>>
>> include/hw/isa/vt82c686.h                    |   4 +-
>>
>> 9 files changed, 126 insertions(+), 71 deletions(-)
>>
>>
>>
>> -- >
>> 2.37.3
>>
>>
>>
> 
> 

