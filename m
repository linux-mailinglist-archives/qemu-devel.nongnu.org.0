Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169452E0FD2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 22:24:48 +0100 (CET)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krp9C-0000gj-Ne
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 16:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krp8O-0000GR-RU
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 16:23:56 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:43490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1krp8K-0001hz-UN
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 16:23:56 -0500
Received: by mail-oi1-x236.google.com with SMTP id q25so16191589oij.10
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 13:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fl6+i/QJgw1mCufgm79Y08RTfZhOE6UF3RtgoixsXQA=;
 b=AqY8Dt14Q0JkoFQ9ZDBw+kvmRvG7jKmBpV1POEFBplu01XvFsmZ4uEPrYhJsRI4U++
 OcRg3XoXhUHcyJsL7LdI0NiIbSi/ho2XBs5/mes1dRQURpgHydI6RKvQbM10/zbcsaRq
 YI2o9T1OF0Pct8CpoueGlQM1nPzgCMGm3sybUc22o/YGCzZdH9BCewhAhBzRUI4V3ODR
 qwf2c0Tb+yEP8h6kDOno4phtXknByCqWeP5QxEtvyw/XwQ/j8v7NQMDE0rYOqkKHm02d
 YlXIxwctk6qajOWDSX6jfTSbisXf8GJ6rkCV9euqV+4MDcTcq7OykRfbPiPpP4P7FpAI
 01jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Fl6+i/QJgw1mCufgm79Y08RTfZhOE6UF3RtgoixsXQA=;
 b=g/Yavo02CQ23wO4Ix4g3G9yCbRIyQnCjBFRrknw6SWdXi6/nCrBgJuYSFwsk11raDh
 o5lOrnbLg0hEAabMy8pVkwco705+/DzbWNsSvJhzKdtJfCYhgGNW+mZYikCEsbRfyc9q
 deynjxczOvHvUz4RsHzfn/pVd+eAawPZAMQpAK6k6KayENBxEybERYf66VsdRsRuet/3
 fpCo1cznZre7ztBN5E8aBmZgigW+tUU0WWmMGrQxZHAdTRLXN8lu3PV2wgmnxW+sK+bq
 pLTTaiNxAOe7fzQ2+q53tIxkZcSHyAy/TOqArMg0i+Voa0yRuv1Q8gXnpsXaQw7LW/j5
 5KJA==
X-Gm-Message-State: AOAM533pgcmtpNDCWfFJNpkdozICGmkulqa+J0eJ05+Nra0oaNO9F7eJ
 XuFpLwgQYK8f4B6oiF+M8hQ=
X-Google-Smtp-Source: ABdhPJziZKtnGgM/L2xkXl4wdr2Z5zrXCbOBW7Rnz0DonyJ/ZRb4QZ8zHxIK6NPijsZ+NnN/YYSldQ==
X-Received: by 2002:aca:4d08:: with SMTP id a8mr15868260oib.128.1608672231593; 
 Tue, 22 Dec 2020 13:23:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 k3sm4584078oor.19.2020.12.22.13.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 13:23:50 -0800 (PST)
Subject: Re: Problems with irq mapping in qemu v5.2
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5849da05-a063-cd56-7709-c4760c8aa71f@roeck-us.net>
Date: Tue, 22 Dec 2020 13:23:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5ef852ee-8a53-df9d-82f4-33a68c05f53a@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 10:23 AM, Mark Cave-Ayland wrote:
> On 22/12/2020 16:16, Guenter Roeck wrote:
> 
>> Hi,
>>
>> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
>> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
>> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
>> is indexed and sized by the number of interrupts.
>>
>> However, as it turns out, the interrupt number passed to this function
>> is the _mapped_ interrupt number. The result in assertion failures for various
>> emulations.
> 
> That doesn't sound quite right. My understanding from the other boards I have been working on is that they use the map_irq() functions recursively so that the final set_irq() is on the physical pin, so it might just be that the assert() is simply exposing an existing bug.
> 
>> Examples (I don't know if there are others):
>>
>> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>>    that isn't a good thing to do for slot 0, and indeed results in an
>>    assertion as soon as slot 0 is initialized (presumably that is the root
>>    bridge). Changing the mapping to "slot" doesn't help because valid slots
>>    are 0..4, and only four interrupts are allocated.
>> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>>    it does, it returns numbers starting with 32 for slots 5..12. With
>>    a total number of 32 interrupts, this again results in an assertion
>>    failure.
>>
>> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
>> correct mapping should be. slot  & 3, maybe ?
> 
> Yeah that doesn't look right. Certainly both the Mac PPC machines use ((pci_dev->devfn >> 3)) & 3) plus the interrupt pin so I think you're right that this is missing an & 3 here. Does adding this allow your image to boot?
> 

Actually, it does not help. This does:

@@ -247,7 +247,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)

     trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);

-    return slot - 1;
+    return slot ? slot - 1 : slot;
 }

but I have no idea why.

>> I don't really have a good solution for pci_bonito_map_irq(). It may not
>> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
>> and afaics that is the only platform using it. Maybe it is just completely
>> broken ?
> 
> It looks like you want this patchset posted last week: https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/ (specifically: https://patchew.org/QEMU/20201216022513.89451-1-jiaxun.yang@flygoat.com/20201216022513.89451-4-jiaxun.yang@flygoat.com/). Zoltan was working on the VIA southbridge wiring at the start of the year and provided me a test case that would boot Linux on the fulong2e machine, so at that point in time it wasn't completely broken.
> 
Those patches don't help for my tests. Problem is that I try to boot from ide drive.

qemu-system-mips64el -M fulong2e \
    -kernel vmlinux -no-reboot -m 256 -snapshot \
    -drive file=rootfs.mipsel.ext3,format=raw,if=ide \
    -vga none -nographic \
    --append "root=/dev/sda console=ttyS0"
    -serial stdio -monitor none

This works just fine with qemu v3.1. With qemu v5.2 (after applying the
fuloong patch series), I get:

VFS: Cannot open root device "sda" or unknown-block(0,0): error -6

This used to work up to qemu v3.1. Since qemu v4.0, there has been a variety
of failures. Common denominator is that the ide drive is no longer recognized,
presumably due to related changes in the via and/or pci code between v3.1
and v4.0.

Difference in log messages:

v3.1:

pci 0000:00:05.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
pci 0000:00:05.1: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
pci 0000:00:05.1: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
pci 0000:00:05.1: reg 0x1c: [mem 0x100000370-0x10000037f 64bit]
...
pata_via 0000:00:05.1: BMDMA: BAR4 is zero, falling back to PIO
ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
...

----

v5.2:

pci 0000:00:05.1: reg 0x10: [io  0x0000-0x0007]
pci 0000:00:05.1: reg 0x14: [io  0x0000-0x0003]
pci 0000:00:05.1: reg 0x18: [io  0x0000-0x0007]
pci 0000:00:05.1: reg 0x1c: [io  0x0000-0x0003]
pci 0000:00:05.1: reg 0x20: [io  0x0000-0x000f]
pci 0000:00:05.1: BAR 4: assigned [io  0x4440-0x444f]
...
ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4440 irq 14
ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x4448 irq 15
[and nothing else]

Guenter

