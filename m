Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6875653031C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 14:32:14 +0200 (CEST)
Received: from localhost ([::1]:38858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nskkn-0002FQ-0a
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 08:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nskj6-0001Qb-Ud; Sun, 22 May 2022 08:30:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nskj5-0003io-3L; Sun, 22 May 2022 08:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQxUQ8oHktyJVNH6H7XQu8y4qHkocL7TNLAWsBcwCl0=; b=QG8TMPnIgk4ttu4o1f7bqhbadw
 NC5wdqpmKUr4n4m3eUWIgunVzjwXCIMxknnrL5fjFVEV6dW5nxee6JNfXg3UlCu9V8VK3Y+X7nmFB
 z6f0F4e5ORCT1F9AlfZBbQaEqWuGy567MuFaogQ2uwWE9KbfJ28wme5S3yMHWdX6CX3JU24oxK14j
 Mz8fWO1FgrS+9Ir/s+3kMFx1nUNsPtns0GHkJz7yMmEllC0tJTRpNIHukFOqNY7JGAZc1jfZV4rZg
 JfblGGzXT/ArfKz7M4DU8iiLMrMW6Gzh4fxB+PSvA+Dvu0ns3bAtrleYcwsSldNvzol4aio+EsU6K
 X/DNgiLQWqZIHly205CGpSAb005yemJUGi/JOEysxdhhfn3R3IRGaLszRqK7hSuGAeX0N1ZWbB28W
 JG/DrbknEhNUSpXg88HLpR9wxTtkxfN9ugov73vmR6hZub6+E1BfXVLDBTVJVKWwqhgIIOPN0Y1AP
 aUqFjcnILWiRBf66KfMCXj3daPPUdLOAHCKGS//rl9OeH2vh8v+UJ0m7iRcQRDMruzuAfOB1ZhsM0
 N78TSTEZSsQ+hx0xg3RvFuKT69I6joEpSwKl8nhH77iPOccnJMg5qlnsdhCgf5JDECxN3oUNhcMEf
 ettVfSZEtFIqjlV/4+DflibP8mJQ+iPNV1Lb+1Dww=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nski0-0006Ew-8N; Sun, 22 May 2022 13:29:24 +0100
Message-ID: <515928bc-d8f6-c5e6-9a64-efcd2306dae7@ilande.co.uk>
Date: Sun, 22 May 2022 13:30:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20220513175445.89616-1-shentey@gmail.com>
 <20220513175445.89616-6-shentey@gmail.com>
 <ca32eb63-7a23-706c-cf17-6f74da7f2161@ilande.co.uk>
 <CAG4p6K5smE4G3xTf-miJ5OCgV4y7_BUkORccOpMTjcvPC-GROQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAG4p6K5smE4G3xTf-miJ5OCgV4y7_BUkORccOpMTjcvPC-GROQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 5/6] hw/isa/piix4: Factor out SM bus initialization from
 create() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/05/2022 10:21, Bernhard Beschow wrote:

> On Sat, May 21, 2022 at 10:39 AM Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk 
> <mailto:mark.cave-ayland@ilande.co.uk>> wrote:
> 
>     On 13/05/2022 18:54, Bernhard Beschow wrote:
> 
>      > Initialize the SM bus just like is done for piix3 which modernizes the
>      > code.
>      >
>      > Signed-off-by: Bernhard Beschow <shentey@gmail.com <mailto:shentey@gmail.com>>
>      > ---
>      >   hw/isa/piix4.c                | 15 +++------------
>      >   hw/mips/malta.c               |  7 ++++++-
>      >   include/hw/southbridge/piix.h |  2 +-
>      >   3 files changed, 10 insertions(+), 14 deletions(-)
>      >
>      > diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>      > index 4968c69da9..852e5c4db1 100644
>      > --- a/hw/isa/piix4.c
>      > +++ b/hw/isa/piix4.c
>      > @@ -301,21 +301,12 @@ static void piix4_register_types(void)
>      >
>      >   type_init(piix4_register_types)
>      >
>      > -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus)
>      > +PCIDevice *piix4_create(PCIBus *pci_bus)
>      >   {
>      >       PCIDevice *pci;
>      > -    DeviceState *dev;
>      > -    int devfn = PCI_DEVFN(10, 0);
>      >
>      > -    pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
>      > +    pci = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
>      >                                             TYPE_PIIX4_PCI_DEVICE);
>      > -    dev = DEVICE(pci);
>      >
>      > -    if (smbus) {
>      > -        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
>      > -                               qdev_get_gpio_in_named(dev, "isa", 9),
>      > -                               NULL, 0, NULL);
>      > -    }
>      > -
>      > -    return dev;
>      > +    return pci;
>      >   }
> 
>     I don't think it makes sense to return PCIDevice here: when returning a QOM object
>     from a function, the general expectation is that for a device you would return a
>     DeviceState since then it can natively be used by the qdev API. So please keep the
>     original return type above.
> 
> 
> Okay, will do.
> 
> I've been toying with moving piix4_pm_init() into piix4_realize(), such that it is 
> created as part of TYPE_PIIX4_PCI_DEVICE - just as the real hardware. I think I like 
> this solution much better.
> 
> 
>      > diff --git a/hw/mips/malta.c b/hw/mips/malta.c
>      > index e446b25ad0..d4bd3549d0 100644
>      > --- a/hw/mips/malta.c
>      > +++ b/hw/mips/malta.c
>      > @@ -1238,6 +1238,7 @@ void mips_malta_init(MachineState *machine)
>      >       int be;
>      >       MaltaState *s;
>      >       DeviceState *dev;
>      > +    PCIDevice *piix4;
>      >
>      >       s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
>      >       sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
>      > @@ -1399,8 +1400,12 @@ void mips_malta_init(MachineState *machine)
>      >       empty_slot_init("GT64120", 0, 0x20000000);
>      >
>      >       /* Southbridge */
>      > -    dev = piix4_create(pci_bus, &smbus);
>      > +    piix4 = piix4_create(pci_bus);
>      > +    dev = DEVICE(piix4);
>      >       isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
>      > +    smbus = piix4_pm_init(pci_bus, piix4->devfn + 3, 0x1100,
>      > +                          qdev_get_gpio_in_named(dev, "isa", 9),
>      > +                          NULL, 0, NULL);
> 
>     ... then here you can do either "piix4 = PCI_DEVICE(dev)" or perhaps even inline it
>     directly as PCI_DEVICE(dev)->devfn if it isn't used elsewhere.
> 
> 
> When instantiating the pm in TYPE_PIIX4_PCI_DEVICE this problem just disappears 
> magically. So I'd roll with this in v2.

(goes and looks)

Yes, that makes complete sense to me since it mirrors exactly how this is already 
done with the integrated IDE and USB devices. At some point I can see that 
piix4_pm_init() should also disappear but let's go one step at a time :)

>      >       /* Interrupt controller */
>      >       qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
>      > diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
>      > index b768109f30..bea3b44551 100644
>      > --- a/include/hw/southbridge/piix.h
>      > +++ b/include/hw/southbridge/piix.h
>      > @@ -74,6 +74,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>      >
>      >   PIIX3State *piix3_create(PCIBus *pci_bus);
>      >
>      > -DeviceState *piix4_create(PCIBus *pci_bus, I2CBus **smbus);
>      > +PCIDevice *piix4_create(PCIBus *pci_bus);
>      >
>      >   #endif

ATB,

Mark.

