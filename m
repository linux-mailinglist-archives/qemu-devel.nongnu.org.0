Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75385EE9C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 23:34:37 +0200 (CEST)
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1himth-000745-1l
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 17:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1himVU-0006Gi-Nk
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1himVT-0007AA-IY
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1himVT-00078o-90
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 17:09:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so4303268wru.10
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 14:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D26PSec2/xWEYy7NkXWaAuAXncdIOhjnPwacv4ApJtA=;
 b=Jlve8ZmGQCbnvVdeBuyrvnVdpyFF28fURs4h9CSogwh3zX/R+6q6ugmYCV7DQeraoQ
 Km5xkT1FCmdF/KMaX5Lw6lT8cCHvH08nIOktz99+g7Ui4W0tdJBpfZRV1TL+JAzqKatD
 F0JrO7GRFbH8LyM/t4iCQqdExPa8hzxvuNqR1RiY/2LmcTjUyE4W+tfh+uKQYlW/OwUh
 9y70k0di7WfUou9PHp+our4QU4cW5weRBfDIFS9QO8Iuox8hTos/wFldpuRALxKaIqkU
 km1LUuab/4AjFx5oN7cIHNdgI9AMIeazZsv2+/gBXAJKoPkKcq1kBXh4Sng4jQXk7lYB
 /U4A==
X-Gm-Message-State: APjAAAWU4SLx6Bi5yKM45x8o55Lkk2G7763x2/PYjOwETVJu7c+ExCmj
 pQjbyPKIITZ5jKJ5DufcShifzg==
X-Google-Smtp-Source: APXvYqz4CoNOE6rgf6MZk/Snb2Jxb1aajy8xDz6X16DQcB53/OKtJZ7RUjwg85eUjJYhj5S4L5P0aw==
X-Received: by 2002:a5d:4647:: with SMTP id j7mr32477019wrs.334.1562188173996; 
 Wed, 03 Jul 2019 14:09:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e5b7:d6bb:ed2d:4d20?
 ([2001:b07:6468:f312:e5b7:d6bb:ed2d:4d20])
 by smtp.gmail.com with ESMTPSA id z25sm3282317wmf.38.2019.07.03.14.09.33
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 14:09:33 -0700 (PDT)
To: "Montes, Julio" <julio.montes@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190703154958.29004-1-julio.montes@intel.com>
 <366f287a-7f83-235c-5141-331117f50bb4@redhat.com>
 <69cb55e2b337cd24f195305683a070cda8b0befd.camel@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <be6aa304-a8e4-d64a-432f-24d52e42c097@redhat.com>
Date: Wed, 3 Jul 2019 23:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <69cb55e2b337cd24f195305683a070cda8b0befd.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH] hw/i386: Fix linker error when ISAPC is
 disabled
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/19 18:40, Montes, Julio wrote:
> On Wed, 2019-07-03 at 18:21 +0200, Paolo Bonzini wrote:
>> On 03/07/19 17:49, Julio Montes wrote:
>>> In pc_init1(), ISA IDE is initialized without checking if ISAPC or
>>> IDE_ISA
>>> configs are enabled. This results in a link error when
>>> CONFIG_ISAPC is set to 'n' in the file default-configs/i386-
>>> softmmu.mak:
>>>
>>> hw/i386/pc_piix.o: In function `pc_init1':
>>> hw/i386/pc_piix.c:261: undefined reference to `isa_ide_init'
>>> hw/i386/pc_piix.c:261: undefined reference to `isa_ide_init'
>>>
>>> Place ide_isa code under #ifdef CONFIG_IDE_ISA to fix linker errors
>>
>> But there is nothing that defines CONFIG_IDE_ISA, right?
> 
> yes I think you're right, do I need to use #ifdef CONFIG_ISAPC instead?
> or how I can define CONFIG_IDE_ISA at build time?

No, Kconfig symbols do not end up in any header.  We could have one that
is only included in obj-y files though, since hw/i386/pc_piix.c is obj-y
rather than common-obj-y.

Paolo

>>
>> Paolo
>>
>>> Signed-off-by: Julio Montes <julio.montes@intel.com>
>>> ---
>>>  hw/i386/pc_piix.c | 11 ++++++++---
>>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>>> index c07c4a5b38..b93f9327be 100644
>>> --- a/hw/i386/pc_piix.c
>>> +++ b/hw/i386/pc_piix.c
>>> @@ -61,9 +61,11 @@
>>>  
>>>  #define MAX_IDE_BUS 2
>>>  
>>> +#ifdef CONFIG_IDE_ISA
>>>  static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
>>>  static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
>>>  static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
>>> +#endif
>>>  
>>>  /* PC hardware initialisation */
>>>  static void pc_init1(MachineState *machine,
>>> @@ -254,7 +256,10 @@ static void pc_init1(MachineState *machine,
>>>          }
>>>          idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
>>>          idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
>>> -    } else {
>>> +        pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
>>> +    }
>>> +#ifdef CONFIG_IDE_ISA
>>> +else {
>>>          for(i = 0; i < MAX_IDE_BUS; i++) {
>>>              ISADevice *dev;
>>>              char busname[] = "ide.0";
>>> @@ -268,9 +273,9 @@ static void pc_init1(MachineState *machine,
>>>              busname[4] = '0' + i;
>>>              idebus[i] = qdev_get_child_bus(DEVICE(dev), busname);
>>>          }
>>> +        pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
>>>      }
>>> -
>>> -    pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
>>> +#endif
>>>  
>>>      if (pcmc->pci_enabled && machine_usb(machine)) {
>>>          pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-
>>> uhci");
>>>


