Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0E04314DC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:13:23 +0200 (CEST)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPdy-0000E6-Qh
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPau-0005MR-BL
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:10:12 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPaq-0008Dr-VD
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:10:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id t2so40365423wrb.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MY+j8qusi80KdoStIsYRnSr9+lFm//bb1pOBOI0hqnA=;
 b=lM07QUtNODyk+K5L8xmMFkYasGkzPOL8Ng0fyWnJU+wiOOX3l2XWweUW7KaJSWApI0
 90dyyLMys/nwr5mrlYcS1MUhf/GvnGLniIzezMiru7vxxSYDjE0m8bXDX76dZq90WDgT
 wJx0frx03XLkqgy8shxCVo68XswvUEkvTB2gBGgVZMPx+BTvmudpjkRq/ya6oki+O6nd
 lK5ficWubV5ktJzYdabUFpfU/ILeAhrhpEQK7SLsOqtFYQeQ3orF85cyWoakgAhmsnhr
 C6/f6Ioh0jfnWyFQlb04gUsHtfYHWeQCyQGHLJnXOEHl60rPMiF9vk3Jg0LC8nqAqJ8l
 tfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MY+j8qusi80KdoStIsYRnSr9+lFm//bb1pOBOI0hqnA=;
 b=lO6nL26jgdSj/plpkpEs7gPofC7p5jK4MkCEGOWz4hKerOFTUozekFRpkuLXXmCM99
 5NXnfCAAlhXmZFBBcqZIxVOJJIlEpYE255U1LKFuVQ++SQhHgnhsKjf4dHXlZbCGZ3G6
 fwVefuWtYKQ2OsQknVId2hN90E2DnWotEWQW4cVQ5Rtg/wddnl9yZBMZOwG4GKus9Lpq
 O/Yv7QLrhAPLq+DIGRREFZ115HuKDQAR4QksTuq5Lw25Xa2b0DHg65R00tRfON3vBz3N
 ctZnfbyA1cPJUodoBq49B47sP3qoRNPh7qIO+QeLrStts6ehW/EAO43hGFu8rBD3IHOS
 /e9A==
X-Gm-Message-State: AOAM532t99n5HfUb+EjJ5VIKYexEM4A5UC3Niv8/9wsZelXrabSFYyJ/
 yhVy9z/TbVonVeCZkMZz5jY=
X-Google-Smtp-Source: ABdhPJyoxq5z6YX+YJGk6p04IL6RoL1tsUumsEbd8OtQVmLcTIALVQawAWqEvJsTxbw5yCifgrV+/A==
X-Received: by 2002:adf:f192:: with SMTP id h18mr34950165wro.33.1634551807688; 
 Mon, 18 Oct 2021 03:10:07 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id v191sm12138271wme.36.2021.10.18.03.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 03:10:07 -0700 (PDT)
Message-ID: <31027ddc-b618-9628-d725-1516f7bfd098@amsat.org>
Date: Mon, 18 Oct 2021 12:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] via-ide: Avoid expensive operations in irq handler
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20211018014059.13E65746353@zero.eik.bme.hu>
 <549ece11-990f-a19b-5dfe-508e315a6163@amsat.org>
 <a36736da-32a0-84fe-f33-32b2f31126bf@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a36736da-32a0-84fe-f33-32b2f31126bf@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 11:51, BALATON Zoltan wrote:
> On Mon, 18 Oct 2021, Philippe Mathieu-Daudé wrote:
>> On 10/18/21 03:36, BALATON Zoltan wrote:
>>> Cache the pointer to PCI function 0 (ISA bridge, that this IDE device
>>> has to use for IRQs) in the PCIIDEState and pass that as the opaque
>>> data for the interrupt handler to eliminate both the need to look up
>>> function 0 at every interrupt and also a QOM type cast of the opaque
>>> pointer as that's also expensive (mainly due to qom-debug being
>>> enabled by default).
>>>
>>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/ide/via.c         | 11 ++++++-----
>>>  include/hw/ide/pci.h |  1 +
>>>  2 files changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>> index 82def819c4..30566bc409 100644
>>> --- a/hw/ide/via.c
>>> +++ b/hw/ide/via.c
>>> @@ -104,15 +104,15 @@ static void bmdma_setup_bar(PCIIDEState *d)
>>>
>>>  static void via_ide_set_irq(void *opaque, int n, int level)
>>>  {
>>> -    PCIDevice *d = PCI_DEVICE(opaque);
>>> +    PCIIDEState *d = opaque;
>>>
>>>      if (level) {
>>> -        d->config[0x70 + n * 8] |= 0x80;
>>> +        d->parent_obj.config[0x70 + n * 8] |= 0x80;
>>>      } else {
>>> -        d->config[0x70 + n * 8] &= ~0x80;
>>> +        d->parent_obj.config[0x70 + n * 8] &= ~0x80;
>>>      }
>>
>> Better not to access parent_obj, so I'd rather keep the previous
>> code as it. The rest is OK, thanks. If you don't want to respin
>> I can fix and take via mips-next.
> 
> Why not? If it's OK to access other fields why not parent_obj? That
> avoids the QOM cast PCI_DEVICE(opaque) or PCI_DEVICE(d) after this
> patch. We know it's a PCIIDEState and has PCIDevice parent_obj field
> because we set the opaque pointer when adding this callback so I think
> this works and is the less expensive way. But feel free to change it any
> way you like and use it that way. I'd keep it as it is.

My understanding of QOM is we shouldn't access internal states that
way, because 1/ this makes object refactors harder and 2/ this is
not the style/example we want in the codebase, but it doesn't seem
documented, so Cc'ing Markus/Eduardo for confirmation.

> 
> Reagards,
> BALATON Zoltan
> 
>>> -    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
>>> +    via_isa_set_irq(d->func0, 14 + n, level);
>>>  }
>>>
>>>  static void via_ide_reset(DeviceState *dev)
>>> @@ -188,7 +188,8 @@ static void via_ide_realize(PCIDevice *dev, Error
>>> **errp)
>>>      bmdma_setup_bar(d);
>>>      pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>>
>>> -    qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>>> +    d->func0 = pci_get_function_0(dev);
>>> +    qdev_init_gpio_in_named_with_opaque(ds, via_ide_set_irq, d,
>>> NULL, 2);
>>>      for (i = 0; i < 2; i++) {
>>>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>>>          ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>>> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
>>> index d8384e1c42..89d14abf95 100644
>>> --- a/include/hw/ide/pci.h
>>> +++ b/include/hw/ide/pci.h
>>> @@ -50,6 +50,7 @@ struct PCIIDEState {
>>>      IDEBus bus[2];
>>>      BMDMAState bmdma[2];
>>>      uint32_t secondary; /* used only for cmd646 */
>>> +    PCIDevice *func0; /* used only by IDE functions of superio chips */
>>>      MemoryRegion bmdma_bar;
>>>      MemoryRegion cmd_bar[2];
>>>      MemoryRegion data_bar[2];
>>>
>>
>>

