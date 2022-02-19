Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6FF4BC6B2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 08:30:50 +0100 (CET)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLKCf-0000Hn-8q
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 02:30:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLK7h-000772-7F; Sat, 19 Feb 2022 02:25:41 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:54064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1nLK7B-0008Sq-6q; Sat, 19 Feb 2022 02:25:39 -0500
Received: by mail-wm1-f41.google.com with SMTP id n8so6500259wms.3;
 Fri, 18 Feb 2022 23:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xJJgBXO+0oit/7NAkv+XCji45IV94bHORchwiMyEmvU=;
 b=fKVJ/HzOkIgWzVkcXgcC4tflpedOlFpum2W2XQQzoWMyPBwFxIy54rBmVHGvT7KCRb
 +B7ZWduGGSfJXKSwasDud05zpQc2FaXQKwKp3acXNGselrLWuLyA5dyuhC03Zfzi0/Vt
 QMwL7D31a20DSIU7n75k8w1/T+hOWd+MxU8yKoV48jvNOOi7mkVAf6TNgAo9iB4aoSEy
 nyZLSl0GNveJ1Gm5AfzMOsco5+3vr4cnJdTJt2uG+ZRru9svvA1kVD2s2bu/cK3THbEM
 BOa6CVjXZ59SA55vsZqt6MQkxckwXGIeGxT+BtekePH3J1d5FcxuM1VmqP9BTNBNYeXe
 hzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xJJgBXO+0oit/7NAkv+XCji45IV94bHORchwiMyEmvU=;
 b=W46d8xPhA6x0NbmhI1nnJAQapQ11i242YwaAUdMqOQkkPPB0PheGMofiTtBgWDIH7c
 EXbI7PaWqXfR7m9dnusqtwRNWRCRumo3/dZskv0KygyuecxyhGaEuysPY+msgJwh2i7J
 nVKnE0qyBcNAW1Axx8tTY2YsYRDFObjhFS+XLAZLYU2B5zXP2DVLin/S4NtfexodWZuX
 W4CW5lbqUtZpEstQxnsfa4aHCRzlCDyVq1ueZz8TofAUZWKznkSXy+ddSnH0hMNdOcxu
 /R9X/1Qy1ImVkL2IpGM/KzF/+P6qalHvcEcFrcq4XbhSMZhv46T485Uf1dcXFndS/zL4
 nKqg==
X-Gm-Message-State: AOAM532cn96vYmVPqn1eZUvCYJiDbpA285FjdnaXnsTnWVXc8l9nXkxP
 66+JGCgz8JG9GEf9P5H5idU=
X-Google-Smtp-Source: ABdhPJw/Wk78V7rt1+WRK+0CNz/DJ2dIdKxxGtQfUryjgQ+o8mchayNnu3QuUUwLhzb1O/aSZKNpeg==
X-Received: by 2002:a05:600c:4602:b0:37c:d11a:e892 with SMTP id
 m2-20020a05600c460200b0037cd11ae892mr9594466wmo.69.1645255498921; 
 Fri, 18 Feb 2022 23:24:58 -0800 (PST)
Received: from ?IPV6:2a10:800a:bb8:1:6510:42ac:bb55:9590?
 ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id b15sm42557322wri.96.2022.02.18.23.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 23:24:58 -0800 (PST)
Message-ID: <e905a1d1-c7e8-bf10-22e8-cd5382b93c11@gmail.com>
Date: Sat, 19 Feb 2022 09:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] hw/ide: add ich6 ide controller device emulation
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20220218204155.236611-1-liavalb@gmail.com>
 <20220218204155.236611-3-liavalb@gmail.com>
 <68413ab-d14c-f5c6-4baf-12e3a18a6a5@eik.bme.hu>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <68413ab-d14c-f5c6-4baf-12e3a18a6a5@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.41; envelope-from=liavalb@gmail.com;
 helo=mail-wm1-f41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/19/22 02:50, BALATON Zoltan wrote:
>> +/*
>> + * QEMU IDE Emulation: PCI ICH6/ICH7 IDE support.
>
> This is a small thing, but if these two are the same maybe keeping 
> this comment but using the ich7 name everywhere else would make it 
> less likely to get it confused with ich9. I mean ich6 and ich9 is 
> easily confused, while ich7 is clearly distinct. But maybe it's just 
> me, calling it ich6 is also correct and can be preferred by someone else.
ICH6 and ICH7 IDE controllers are quite the same as far as I know. I 
could change it, but then one could argue that the name ich6-ide seems 
like "ich9-ide", so not sure if we can really go on this path.
>
>> +static void ich6_pci_config_write(PCIDevice *d, uint32_t addr, 
>> uint32_t val,
>> +                                    int l)
>> +{
>> +    uint32_t i;
>> +
>> +    pci_default_write_config(d, addr, val, l);
>> +
>> +    for (i = addr; i < addr + l; i++) {
>> +        switch (i) {
>> +        case 0x40:
>> +            pci_default_write_config(d, i, 0x8000, 2);
>> +            continue;
>> +        case 0x42:
>> +            pci_default_write_config(d, i, 0x8000, 2);
>> +            continue;
>> +        }
>> +    }
>
> I'm not sure what this tries to do but this for cycle looks suspicious 
> here. It's also only calls pci_default_write_config() so why didn't 
> the default worked and why was this override needed?
>
It's just a loop to ensure that if the guest OS tries to disable an IDE 
channel from the PCI config space, it seems "stuck" on enabled. I should 
probably put a comment on this to explain this, but I definitely don't 
want the guest OS to be able to disable any IDE channel for now (on real 
hardware, it does that, but I think we can either skip this feature or 
implement in a future patch, as Linux deals with the controller just fine).
>> +}
>> +
>> +static void ich6_ide_reset(DeviceState *dev)
>> +{
>> +    PCIIDEState *d = PCI_IDE(dev);
>> +    PCIDevice *pd = PCI_DEVICE(d);
>> +    uint8_t *pci_conf = pd->config;
>> +    int i;
>> +
>> +    for (i = 0; i < 2; i++) {
>> +        ide_bus_reset(&d->bus[i]);
>> +    }
>> +
>> +    /* TODO: this is the default. do not override. */
>> +    pci_conf[PCI_COMMAND] = 0x00;
>> +    /* TODO: this is the default. do not override. */
>> +    pci_conf[PCI_COMMAND + 1] = 0x00;
>> +    /* TODO: use pci_set_word */
>> +    pci_conf[PCI_STATUS] = PCI_STATUS_FAST_BACK;
>> +    pci_conf[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_MEDIUM >> 8;
>> +    pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
>> +}
>> +
>> +static int pci_ich6_init_ports(PCIIDEState *d)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < 2; i++) {
>> +        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>> +        ide_init2(&d->bus[i], d->native_irq);
>> +
>> +        bmdma_init(&d->bus[i], &d->bmdma[i], d);
>> +        d->bmdma[i].bus = &d->bus[i];
>> +        ide_register_restart_cb(&d->bus[i]);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void pci_ich6_ide_realize(PCIDevice *dev, Error **errp)
>> +{
>> +    PCIIDEState *d = PCI_IDE(dev);
>> +    uint8_t *pci_conf = dev->config;
>> +    int rc;
>
> All in all this device looks very similar to piix ide devices with 
> only some differentces so I wonder if ir could be implemented as 
> another device in piix.c. We already have 3 variants there: piix3-ide, 
> piix3-ide-xen, and piix4-ide so maybe putting this device in piix.c 
> could avoid some code duplication. In that case moving out 
> bmdma_{read,write} were not needed either although maybe that's a good 
> idea anyway to share it with other devices.
>
As for putting the ich6-ide code in piix.c  - I'm not against it. 
Although, in the long run, if I send more patches to QEMU, I rather 
split the files a bit more in the /hw/ide directory as there's a lot of 
code duplication to solve.
So, what we could do instead, is to share more code between the devices 
and still keep them in separate files.

As for moving out the bmdma_{write,read} functions - I'm still in the 
previous mind that we need to move them out as via.c shares the same 
code but currently has code duplications for it, and that I want to 
solve as part of making the IDE code more clean and to add more features.

However, if it seems necessary to do this cleanup before implementing 
this ich6-ide controller, I'm more than happy to wait on this, send a 
patch to solve and clean up some issues in the IDE code, and then 
re-send this as v3.
I might even consider doing that now if nobody rejects this idea :)

>> +
>> +    pci_conf[PCI_INTERRUPT_PIN] = 1; /* interrupt pin A */
>> +
>> +    /* PCI native mode-only controller, supports bus mastering */
>> +    pci_conf[PCI_CLASS_PROG] = 0x85;
>> +
>> +    bmdma_setup_bar(d);
>> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>> +
>> +    d->native_irq = pci_allocate_irq(&d->parent_obj);
>
> Is this irq and the new field in PCIIDEState really needed? If this 
> device is using PCI interrupts could it do the same as CMD646 ide does 
> instead?
>
I looked into how cmd646.c does that, but it creates that with the 
qdev_init_gpio_in function. The AHCI controller seems to use 
pci_allocate_irq function (in ich.c), as well as other hardware devices 
in QEMU, but the rtl8139 device doesn't have such field and still works, 
so not sure what to do and how to make it to work in the best, simple 
way here.
> That's all for now, I haven't checked the docs of these ide 
> controllers so I'm not sure if these have switchable native and legacy 
> modes like via has and we again getting the problem that we can't 
> model that easily or these are really different with one having only 
> legacy and the ich6/7 only native modes.

If I recall correctly, on my ICH7 test machine you can switch between 
native and legacy mode, but it doesn't mean that there couldn't be a 
device on some motherboard in 2009 that doesn't allow you to switch 
between legacy and native mode. However, I rather not put the option 
because I want software to deal with a PCI device that is free from 
legacy IO ports completely. Also, I am pretty sure that if I change the 
settings in the BIOS menu then it could be stuck to native mode (if for 
example, I enable both the PATA connector and the 4 SATA ports), but 
still not sure about this. This is a feature I'll look into it in the 
future, as I definitely want to improve on this and maybe allow the user 
to configure the ich6-ide device to have a different MAP register to 
simulate 4 SATA ports and 2 PATA connections.

I'll wait a few more days to let other people send comments on this 
before sending v3. Thanks again for the valuable comments :)

Best regards,
Liav

>
> Regards.
> BALATON Zoltan

