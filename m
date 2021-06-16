Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D63A90F2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 07:01:42 +0200 (CEST)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltNgL-0004H7-NT
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 01:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ltNdh-0001cQ-KS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 00:58:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ltNde-0004T1-1q
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 00:58:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t17so974781pga.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 21:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gOUHlZ3v1UQZWhzlrZqNgPlubTLIjGUSP+dYGJrlyYc=;
 b=f+zGxl3nE+ZXm8K7ENtDF12eqEKBW82g3NsBN7MU1DOu+WvS4SFDkFJSn6Vih4dicU
 cvHYIl8z/m176K9MfLXBsr9qaWVuKglHzlPWw8sOB5+WceqxHs867NOVNvsUZqDGmPSg
 B3LkVdSQ4hya4hr1tD13CDOPx6dMBbmO8YBnBSxhWjmXGdA2tmuzPXqRXXagHCiM01jh
 8ycj9fOEDyr5vCuzGlIi1ALgWzbLixS7v2dLhDkvDj60UYZhU1K7Cxh3cWDkCZRW9ipr
 SQNqhDIQhcCZVQ9WrAgKXktgdmpiNRSfj8GpWA/gY/KKA2ftVwYsAIfEf98y4eKsQdJZ
 lRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gOUHlZ3v1UQZWhzlrZqNgPlubTLIjGUSP+dYGJrlyYc=;
 b=ZIomB5yuEt+E9Yu66HXmOLEkyGu7ynK39pYJ+YHe/xjnlJ367A5CFRqxf95nQdRNbz
 Ot+fcsWFJMRBgijV34rueyl+vvgdYSBVmaVnL9sJC/CmPy1gaBuw5xKhzOlju9joikNy
 Jz364BhNaWvqmEk7ezbq2S9v+LDpor5rtph5ImB0vDcF9K7aRy3Tg7A6nZB/fUJBynRL
 QzRpqDg4+MhybqjfDBnsddMYEQJChuh8SYrYOMCh1XFkbYN3iPaoODLCID5W1VkiQbBN
 HqHsFl0+3wNMi0O3NoQtjGobjuFWsBq4Uzqu6+SzjtLJHIJRySCy40NtqvcL7ZU/dqG6
 gF6g==
X-Gm-Message-State: AOAM53376lH0CpAYDYhk+g3cZrAABFziaWvBFy2GBmrTrA9Ocqle/raL
 luBKGRbHI581fvLckC3hKOaaczHKp7SQ+Q==
X-Google-Smtp-Source: ABdhPJwQxbM46XrbeKb0L6uNq5fpoNvxqH0Ti6c9WlHY6eN8aGQjfJ03GjhKC4tk7obmgQHfFLSurQ==
X-Received: by 2002:a05:6a00:1a41:b029:2ef:9721:879e with SMTP id
 h1-20020a056a001a41b02902ef9721879emr7789070pfv.74.1623819531280; 
 Tue, 15 Jun 2021 21:58:51 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id o1sm726270pjf.56.2021.06.15.21.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 21:58:50 -0700 (PDT)
Message-ID: <e8ecfff0-424f-7548-113f-56cd0377731e@ozlabs.ru>
Date: Wed, 16 Jun 2021 14:58:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [RFC PATCH 4/5] ppc/pegasos2: Use Virtual Open Firmware as
 firmware replacement
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <53e3f069ab536bc2d0c6b3e39418bc85357631ad.1622994395.git.balaton@eik.bme.hu>
 <55582a05-160a-ac1d-75ac-7e636fa2fd7d@ozlabs.ru>
 <2bd3b42-6556-e47c-c590-bb52e22b2577@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <2bd3b42-6556-e47c-c590-bb52e22b2577@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/15/21 19:44, BALATON Zoltan wrote:
> On Tue, 15 Jun 2021, Alexey Kardashevskiy wrote:
>> On 6/7/21 01:46, BALATON Zoltan wrote:
>>> The pegasos2 board comes with an Open Firmware compliant ROM based on
>>> SmartFirmware but it has some changes that are not open source
>>> therefore the ROM binary cannot be included in QEMU. Guests running on
>>> the board however depend on services provided by the firmware. The
>>> Virtual Open Firmware recently added to QEMU imlements a minimal set
>>> of these services to allow some guests to boot without the original
>>> firmware. This patch adds VOF as the default firmware for pegasos2
>>> which allows booting Linux and MorphOS via -kernel option while a ROM
>>> image can still be used with -bios for guests that don't run with VOF.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/ppc/Kconfig    |   1 +
>>>   hw/ppc/pegasos2.c | 622 +++++++++++++++++++++++++++++++++++++++++++++-
>>>   2 files changed, 621 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>> index b895720b28..0eb48128fe 100644
>>> --- a/hw/ppc/Kconfig
>>> +++ b/hw/ppc/Kconfig
>>> @@ -75,6 +75,7 @@ config PEGASOS2
>>>       select VT82C686
>>>       select IDE_VIA
>>>       select SMBUS_EEPROM
>>> +    select VOF
>>>   # This should come with VT82C686
>>>       select ACPI_X86
>>>   diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>> index 07971175c9..91e5fa8fbe 100644
>>> --- a/hw/ppc/pegasos2.c
>>> +++ b/hw/ppc/pegasos2.c
> [...]
>>> +static void add_pci_device(PCIBus *bus, PCIDevice *d, void *opaque)
>>> +{
>>> +    FDTInfo *fi = opaque;
>>> +    GString *node = g_string_new(NULL);
>>> +    uint32_t cells[(PCI_NUM_REGIONS + 1) * 5];
>>> +    int i, j;
>>> +    const char *name = NULL;
>>> +    g_autofree const gchar *pn = g_strdup_printf("pci%x,%x",
>>> + pci_get_word(&d->config[PCI_VENDOR_ID]),
>>> + pci_get_word(&d->config[PCI_DEVICE_ID]));
>>> +
>>> +    for (i = 0; device_map[i].id; i++) {
>>> +        if (!strcmp(pn, device_map[i].id)) {
>>> +            name = device_map[i].name;
>>> +            break;
>>> +        }
>>> +    }
>>> +    g_string_printf(node, "%s/%s@%x", fi->path, (name ?: pn),
>>> +                    PCI_SLOT(d->devfn));
>>> +    if (PCI_FUNC(d->devfn)) {
>>> +        g_string_append_printf(node, ",%x", PCI_FUNC(d->devfn));
>>> +    }
>>> +
>>> +    qemu_fdt_add_subnode(fi->fdt, node->str);
>>> +    if (device_map[i].dtf) {
>>> +        FDTInfo cfi = { fi->fdt, node->str };
>>> +        device_map[i].dtf(bus, d, &cfi);
>>> +    }
>>> +    cells[0] = cpu_to_be32(d->devfn << 8);
>>> +    cells[1] = 0;
>>> +    cells[2] = 0;
>>> +    cells[3] = 0;
>>> +    cells[4] = 0;
>>> +    j = 5;
>>> +    for (i = 0; i < PCI_NUM_REGIONS; i++) {
>>> +        if (!d->io_regions[i].size) {
>>> +            continue;
>>> +        }
>>> +        cells[j] = cpu_to_be32(d->devfn << 8 | (PCI_BASE_ADDRESS_0 + 
>>> i * 4));
>>> +        if (d->io_regions[i].type & PCI_BASE_ADDRESS_SPACE_IO) {
>>> +            cells[j] |= cpu_to_be32(1 << 24);
>>> +        } else {
>>> +            cells[j] |= cpu_to_be32(2 << 24);
>>> +            if (d->io_regions[i].type & 
>>> PCI_BASE_ADDRESS_MEM_PREFETCH) {
>>> +                cells[j] |= cpu_to_be32(4 << 28);
>>> +            }
>>> +        }
>>> +        cells[j + 1] = 0;
>>> +        cells[j + 2] = 0;
>>> +        cells[j + 3] = cpu_to_be32(d->io_regions[i].size >> 32);
>>> +        cells[j + 4] = cpu_to_be32(d->io_regions[i].size);
>>> +        j += 5;
>>> +    }
>>
>>
>> btw I was wondering if Linux on pegasos2 could assign resources when 
>> /chosen/linux,pci-probe-only is in the FDT, could not it? Or the 
>> serial device does not probe and Linux does not boot?
> 
> Linux probes PCI devices by itself but MorphOS relies on the device tree 
> entries so I need at least the reg properties for that then it will map 
> the BARs but I think it won't scan the bus otherwise. You still seem to 
> add PCI devices in spapr too, at least I think I've got the idea for 
> this function above from there.


Linux does not scan, this is why we are adding devices in the FDT for 
pseries (and likely so should you) but Linux does reassign resources if 
something is wrong.

Does MorphOS boot with this patchset? If it does not, and Linux 
reassigns resources, we are probably better off with a minimalist 
approach and skip resource assignment.


-- 
Alexey

