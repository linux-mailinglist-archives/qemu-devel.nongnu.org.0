Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDD2E6FC9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 11:57:47 +0100 (CET)
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuChG-0004T7-Hn
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 05:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuCgV-000444-Cb
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:56:59 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuCgT-0000Jx-IR
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:56:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id d26so14253367wrb.12
 for <qemu-devel@nongnu.org>; Tue, 29 Dec 2020 02:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rk0jLeA7ORkDmJiMzEfLIK8J60NjVfnAmjkVUQUhtfk=;
 b=Jkwln3i5Ads/qci3Nj4f/RHRlVhq9yAUWYwqPc5WSpaNSdPHrUzz5kpOisZjZ5Amv6
 t4nOT/O3vENGuydtQNUkWXzRcAfUR3C5rDKk9EZV+OzGIXs7uyfkFHW/azxEpOxI+U1X
 1qmDzqK2+JE67I+iHvvMQnkpBGHxonAcMEg43qY7x/oWM5/kUzZZdv9n8buMLTSc56WD
 0mHvcdqZPdqBHLXbrgigDtTl+N9gjWRqyK8iPmXaCYCnlSIhXV1DspAJh41fgg/TTmoY
 31xISanq40rJgbUUMIoChjcH3wsab9zapMabf/QfNfU+C7dTN7C7AKlqO/xjn/7PzhoR
 5Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rk0jLeA7ORkDmJiMzEfLIK8J60NjVfnAmjkVUQUhtfk=;
 b=UJf0Sg9JdIh99HtiORyfK684lgt0y54QCOMXJpe9j2I0Vowm+bsndd/t5SmJAx56w9
 LrsiUBwFWyOAlumEx4px/LyITn9If7a2so2eKPvZ+4NvD9bEhldD6bIfpOEyVXLj0C9u
 wgZaMwaKYh/7bIIo4p4EPJN8JOcuvakPTW1cDFIZi15VSEylRQRrdNbUqyCC+fT6UqWa
 WRC4Rr19M2dP6AuG7bW7Ia08kaUO5eU3sjRJpjy4nxlMf0aiuprft46kVc4mSCHhJ/E9
 Tb+gzXQl3nmjuKiosZ9DdHSlYo8LfIfh7VtPGFvKO6M7X0CLDxo7ApBsM15Qriey1aYn
 hSLw==
X-Gm-Message-State: AOAM531m4yYVhxzH/TezmBYi5Aew0s1R7LHCYvXVjcSn0orhxLlqNmtU
 GmBjyutvnW7uW8eLrL4h3GA=
X-Google-Smtp-Source: ABdhPJyJmgPjTz403DAYcMr58SIeiJxjKm7uKI4R+VdkxufDhSQy1zgBeP8FFgmdgESunRQP4sZJ9g==
X-Received: by 2002:adf:ee90:: with SMTP id b16mr55516527wro.221.1609239416080; 
 Tue, 29 Dec 2020 02:56:56 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id a17sm62259312wrs.20.2020.12.29.02.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 02:56:55 -0800 (PST)
Subject: Re: [PATCH v2 2/2] via-ide: Fix fuloong2e support
To: BALATON Zoltan <balaton@eik.bme.hu>, Willian Rampazzo <wrampazz@redhat.com>
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <8e58807dd2ba46866e7f152244e4541e6425177d.1609107222.git.balaton@eik.bme.hu>
 <a7b14637-4a3e-1635-a0c2-da9ee48022a8@ilande.co.uk>
 <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7bd3e7e0-73be-5602-90d7-6fc67968b163@amsat.org>
Date: Tue, 29 Dec 2020 11:56:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ab55636b-9ba7-6e38-8d62-31ef1a11c455@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.698,
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
Cc: John Snow <jsnow@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/20 9:50 PM, BALATON Zoltan via wrote:
> On Mon, 28 Dec 2020, Mark Cave-Ayland wrote:
>> On 27/12/2020 22:13, BALATON Zoltan via wrote:
>>
>>> From: Guenter Roeck <linux@roeck-us.net>
>>>
>>> The IDE legacy mode emulation has been removed in commit 4ea98d317eb
>>> ("ide/via: Implement and use native PCI IDE mode") but some Linux
>>> kernels (probably including def_config) require legacy mode on the
>>> Fuloong2e so only emulating native mode did not turn out feasible.
>>> Add property to via-ide model to make the mode configurable, and set
>>> legacy mode for Fuloong2e.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> [balaton: Use bit in flags for property, add comment for missing BAR4]
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> v2: Reworded commit message
>>>
>>>   hw/ide/via.c        | 19 +++++++++++++++++--
>>>   hw/mips/fuloong2e.c |  4 +++-
>>>   2 files changed, 20 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>> index be09912b33..7d54d7e829 100644
>>> --- a/hw/ide/via.c
>>> +++ b/hw/ide/via.c
>>> @@ -26,6 +26,7 @@
>>>     #include "qemu/osdep.h"
>>>   #include "hw/pci/pci.h"
>>> +#include "hw/qdev-properties.h"
>>>   #include "migration/vmstate.h"
>>>   #include "qemu/module.h"
>>>   #include "sysemu/dma.h"
>>> @@ -185,12 +186,19 @@ static void via_ide_realize(PCIDevice *dev,
>>> Error **errp)
>>>                             &d->bus[1], "via-ide1-cmd", 4);
>>>       pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO,
>>> &d->cmd_bar[1]);
>>>   -    bmdma_setup_bar(d);
>>> -    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>> +    if (!(d->flags & BIT(PCI_IDE_LEGACY_MODE))) {
>>> +        /* Missing BAR4 will make Linux driver fall back to legacy
>>> PIO mode */
>>> +        bmdma_setup_bar(d);
>>> +        pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO,
>>> &d->bmdma_bar);
>>> +    }
>>
>> Since the default value of the legacy mode parameter is false, then
>> this means the device assumes native mode by default. Therefore
>> PCI_CLASS_PROG should be set to 0x8f unless legacy mode is being used,
>> in which case it should be 0x8a.
> 
> I think this casued problems before because if it's not set to 0x8a
> (legacy) at start then guests may assume it's already switched to native
> mode by firmware and won't program the BARs and it will not work. This
> way, even if it looks odd all guests I've tested work so I don't want to
> touch this, because I don't want to test all guests again.

If you can describe on the list how you do your testing (mostly
command line used, where image/demo can be downloaded), we might help
writing an integration test to automate the testing. Don't worry if
it involves using close-source binaries, we'll try to figure out a
way.

Regards,

Phil.

