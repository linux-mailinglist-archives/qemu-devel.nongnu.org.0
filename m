Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE36986BA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:01:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOsD-0001ye-2i; Wed, 15 Feb 2023 15:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOsA-0001yD-KR
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:59:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOs8-0000Pf-9w
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:59:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id s13so2788741wrw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nCx/UHoonnPWE8zuooj8TqV7PeBhGDQrWUwtf3rkb30=;
 b=WdnrcMRxw5WeCxxWnmmwZl7rPaLvPQY8v6h96AZ1zx3N7VOdDjy1kEzHDtGL6QMKBw
 QcpJso3caX75U1/Dfkhx7+OEfIh5VCVkaIM7jViCdyvPet3zSRkTgDVsBIWG8yd2qNUx
 XlSCvveV8/iLDNKiQ3KeRP1BQV6SqMJkX5BCcbxJLakWPSErDedO8KBLV60ZKI5Cygoh
 Al1ILmAqwj1C4GuXAKpOpeaisuQXCR8kfSXnbjR6PqfNUpBHEDz4a4jKdKRNcJtuVBz7
 gZV54oSVAIY/xkCQ7kORxItKzPlEFkDxYyyJH/3qsnGz9Osfj0C8xfdU/9wmZy3pSIHg
 YqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nCx/UHoonnPWE8zuooj8TqV7PeBhGDQrWUwtf3rkb30=;
 b=2jNZZWNXyNJ79xOpTxv9Ar91corYRNV7yn17C+hHzfxVuoYSs/fKnkXb4ygIVAESle
 oxHT7Tgu2UH9bb2DEvvIV7zgDkvoPkXMnpurs/vDhmYQ534cGTXmIXmFZWGKwPbh2BWW
 oTAJwf/IYSA5M3/S6LnweOVcMwC4C50SglZ3IGGE3t9zQNJCfL+NC1Bq1EaFf11TlDPk
 tyZTMr5vFGvDhfL7CGdEljW7V2iNgtQeLSVjcCPEM6msut4j9TlgMj9RX4LA4TB5DwOR
 SiFyxKjFg46ycDgVrtXiCxNu2FdOtkzJKLPMP+jhFEh9DFwc7jmCPQ5xqVz7+ypQ//Vq
 4oVw==
X-Gm-Message-State: AO0yUKUlDaFXe01hqHr5WgphLm5dXMX+nwTIeSlk+g/eolzb4bKLPU5k
 p/p4C0BDc39D4JJEz8d4ceLaWQ==
X-Google-Smtp-Source: AK7set+clj1VRA58Gl9ugpDIVj1sCWXRB2JXypazxKg6vvKL58scGcAa0aHd8TpmctaSKXRFjO33vg==
X-Received: by 2002:a5d:4987:0:b0:2c5:55a1:c7fe with SMTP id
 r7-20020a5d4987000000b002c555a1c7femr2500890wrq.8.1676494762210; 
 Wed, 15 Feb 2023 12:59:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z15-20020adfe54f000000b002c5694aef92sm4319436wrm.21.2023.02.15.12.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:59:21 -0800 (PST)
Message-ID: <642a6b76-4263-542b-80a6-23ddf5e2b3b6@linaro.org>
Date: Wed, 15 Feb 2023 21:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 5/7] hw/ide/piix: Use generic ide_init_ioport()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>
References: <20230208000743.79415-1-philmd@linaro.org>
 <20230208000743.79415-6-philmd@linaro.org>
 <CAG4p6K4qnDXjM+7=B1iRjUNX1astmg0Pofco+aOOPWkJG2ajFQ@mail.gmail.com>
 <965A25A6-D963-4F0A-82AD-7EBD9B487F96@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <965A25A6-D963-4F0A-82AD-7EBD9B487F96@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 10/2/23 17:34, Bernhard Beschow wrote:
> Am 9. Februar 2023 09:04:49 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> On Wed, Feb 8, 2023 at 1:08 AM Philippe Mathieu-Daudé <philmd@linaro.org>
>> wrote:
>>
>>> TYPE_PIIX3_IDE is a PCI function inheriting from QOM
>>> TYPE_PCI_DEVICE. To be able to call the ISA specific
>>> ide_init_ioport_isa(), we call this function passing
>>> a NULL ISADevice argument. Remove this hack by calling
>>> the recently added generic ide_init_ioport(), which
>>> doesn't expect any ISADevice.
>>>
>>> Inspired-by: Bernhard Beschow <shentey@gmail.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/ide/piix.c | 10 ++++------
>>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>> index a587541bb2..1cd4389611 100644
>>> --- a/hw/ide/piix.c
>>> +++ b/hw/ide/piix.c
>>> @@ -136,15 +136,13 @@ static int pci_piix_init_ports(PCIIDEState *d)
>>>           {0x1f0, 0x3f6, 14},
>>>           {0x170, 0x376, 15},
>>>       };
>>> -    int i, ret;
>>> +    int i;
>>>
>>>       for (i = 0; i < 2; i++) {
>>>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>> -        ret = ide_init_ioport_isa(&d->bus[i], NULL,
>>> -                                  port_info[i].iobase,
>>> port_info[i].iobase2);
>>> -        if (ret) {
>>> -            return ret;
>>> -        }
>>> +        ide_init_ioport(&d->bus[i], OBJECT(d),
>>> +                        pci_address_space_io(PCI_DEVICE(d)),
>>> +                        port_info[i].iobase, port_info[i].iobase2);
>>>           ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
> 
> Let me elaborete a bit on what I mean by the patch essentially circumventing the crash fix:
> 
> The reason for the crash with the x-remote machine is now caused by isa_get_irq() which also uses the isabus global behind the scenes. So piix-ide needs to be changed in two places to avoid the global usage and hence the crash.
> 
> In his crash fix [1], Thomas was lucky: First, ide_init_ioport() didn't return a value before, so adding one didn't cause changes in other device models. Second, ide_init_ioport() is the first call here to access the global, so it could be used to protect the call to isa_get_irq(). Note that isa_get_irq() couldn't be changed in a similar way without affecting all its call sites.
> 
> Fixing ide_init_ioport() to not access the global is certainly a step in the right direction, but this means that ide_init_ioport() is now unable to protect the isa_get_irq() call. Since isa_get_irq() can't conveniently protect itself, we either need to avoid it or need another way to achieve that. That's why in my series GPIOs are used for internal devices and  isa_get_irq() plus fishing out the ISA bus for user-created ones.

The points you raised should be resolved by v2:
https://lore.kernel.org/qemu-devel/20230215161641.32663-1-philmd@linaro.org/
I involved more patches, but hopefully the problem got fixed once for
good without any circumvention.

> Fishing out the ISA bus is still a hack IMO, for two reasons: First, IIUC, QOM'ified devices shall only care about its children while looking up one's parent bus violates this rule. Second, using the global machine pointer to scan for the ISA bus just trades one global for another. That's why I'm only doing this for user-created instances. If we deprecated user-created piix IDE devices we could eventually get rid of this hack.
> 
> Best regards,
> Bernhard
> 
> [1] https://lore.kernel.org/qemu-devel/20210416125256.2039734-1-thuth@redhat.com/ "hw/ide: Fix crash when plugging a piix3-ide device into the x-remote machine"


