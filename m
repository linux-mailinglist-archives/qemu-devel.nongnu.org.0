Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5562E1FB8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 18:09:14 +0100 (CET)
Received: from localhost ([::1]:55908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks7dR-0003HT-AK
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 12:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ks7WO-0005GP-5y
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 12:01:59 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:33127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1ks7WK-0001lJ-6a
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 12:01:55 -0500
Received: by mail-oi1-x22a.google.com with SMTP id d203so18906265oia.0
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 09:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J35RBCe9px0zx7koROoNl35PCwcpXGf6go6f35nlBDA=;
 b=f0p5hFNCEgVSl6gWpY2UGWX5XbujLWX7qUBZIRkPdKVevKBX7MVIqldP+Fim9veYTI
 Y27mLn2x5VtBCppfingE9PnUF6tNERemh199w7UM65UD1YdxzG0dUtMZlO41Oy+LQ/1T
 KBdFaRa9mNtTxrYKz06EKHUVY+ZGUiSAGnsrU8zHyVAlO1A8GvGApfp1iqbuJaidwqIf
 /MGlcx7qzblFr+vfqtlTDnJLobCeclHXs+j37f7JcSYjH2egZrv6GhdwsoLAnGAWCjez
 EqYmRffzOzdt63CgrAn6JuKRAzXmm8WBu2d1IFnHVtxh9AGhchGxx4dMjHNwzfPxR0S9
 qf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=J35RBCe9px0zx7koROoNl35PCwcpXGf6go6f35nlBDA=;
 b=qk6X/qo+7Cyd1Jd2+zUuALGrNSZm2oKY4+/hKeutJQreewqt80TwYw7V0trmeov3bA
 9f4++DiGLaxoX8bENafcdpo/OVe/WHh0Tg1dvAkyP+iZekvPpKEd/UIGsSO9s3W1wRhC
 zFe2mLYhTkjGBfGmjQzPDfA0sd814FOYJoCr6Mt3xxPbKTa9ypkl0+17E+UMEAzKq2EQ
 hCk+7RBhoYfX8pQ6aCQid09zN66dgjbIzZdH6d+K0VGhqVp817v6R+skLoCt0Tlskdqw
 6kvQOmh4UahAsEATCo2hayKWFRQXsieSyJ3Mwg8FiB6MEQG97/N5GTVIJR8/qj8Hyk6l
 T/gA==
X-Gm-Message-State: AOAM5318bSvvoYbIaX8p79O4iqwAftfvSbTGBBdJRyLeBYJPj6u49360
 ESNBBt8bSff/yxwgDMMwVfg=
X-Google-Smtp-Source: ABdhPJxRUCfA+SNn+2JuUKHA0Dk4qNpXaIeDirxQgQD7BJ0Dy96/0PfjDO3BYrh8tg1/sO1eYVUR2A==
X-Received: by 2002:aca:f382:: with SMTP id r124mr457077oih.175.1608742910468; 
 Wed, 23 Dec 2020 09:01:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j10sm5851808otn.63.2020.12.23.09.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 09:01:49 -0800 (PST)
Subject: Re: Problems with irq mapping in qemu v5.2
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan
 <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
Date: Wed, 23 Dec 2020 09:01:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22a.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/20 8:09 AM, Mark Cave-Ayland wrote:
> On 23/12/2020 15:21, Philippe Mathieu-Daudé wrote:
> 
>> On 12/22/20 5:16 PM, Guenter Roeck wrote:
>>> Hi,
>>>
>>> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
>>> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
>>> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
>>> is indexed and sized by the number of interrupts.
>>>
>>> However, as it turns out, the interrupt number passed to this function
>>> is the _mapped_ interrupt number. The result in assertion failures for various
>>> emulations.
>>>
>>> Examples (I don't know if there are others):
>>>
>>> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>>>    that isn't a good thing to do for slot 0, and indeed results in an
>>>    assertion as soon as slot 0 is initialized (presumably that is the root
>>>    bridge). Changing the mapping to "slot" doesn't help because valid slots
>>>    are 0..4, and only four interrupts are allocated.
>>> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>>>    it does, it returns numbers starting with 32 for slots 5..12. With
>>>    a total number of 32 interrupts, this again results in an assertion
>>>    failure.
>>>
>>> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
>>> correct mapping should be. slot  & 3, maybe ?
>>>
>>> I don't really have a good solution for pci_bonito_map_irq(). It may not
>>> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
>>> and afaics that is the only platform using it. Maybe it is just completely
>>> broken ?
>>
>> FWIW bisecting Fuloong2E starts failing here:
>>
>> 4ea98d317eb442c738f898f16cfdd47a18b7ca49 is the first bad commit
>> commit 4ea98d317eb442c738f898f16cfdd47a18b7ca49
>> Author: BALATON Zoltan <balaton@eik.bme.hu>
>> Date:   Fri Jan 25 14:52:12 2019 -0500
>>
>>      ide/via: Implement and use native PCI IDE mode
>>
>>      This device only implemented ISA compatibility mode and native PCI IDE
>>      mode was missing but no clients actually need ISA mode but to the
>>      contrary, they usually want to switch to and use device in native
>>      PCI IDE mode. Therefore implement native PCI mode and switch default
>>      to that.
>>
>>      Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>      Message-id:
>> c323f08c59b9931310c5d92503d370f77ce3a557.1548160772.git.balaton@eik.bme.hu
>>      Signed-off-by: John Snow <jsnow@redhat.com>
>>
>>   hw/ide/via.c | 52 ++++++++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 38 insertions(+), 14 deletions(-)
> 
> I think the original version of the patch broke fuloong2e, however that should have been fixed by my patchset here: https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg03936.html. It might be that there are multiple regressions located during a full bisect :/
> 

Not really. The following patch on top of qemu 5.2 results in the ide drive
being detected and working.

diff --git a/hw/ide/via.c b/hw/ide/via.c
index be09912b33..1bfdc422ee 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -186,11 +186,14 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);

     bmdma_setup_bar(d);
+#if 0
     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
+#endif

     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
+        ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0, i ? 0x376 : 0x3f6);
         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));

         bmdma_init(&d->bus[i], &d->bmdma[i], d);

With the added ide_init_ioport(), the drive is detected. With the #if 0,
it actually starts working. So there are two problems: 1) The qemu ide
subsystem isn't informed about the io addresses, and 2) bmdma isn't working.

Guenter

