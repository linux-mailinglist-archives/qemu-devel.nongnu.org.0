Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0812E6A75
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 20:29:07 +0100 (CET)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktyCY-0007Fu-Fl
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 14:29:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ktyAG-0006gc-JT
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 14:26:44 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48986
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ktyAE-0004t2-13
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 14:26:44 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ktyA5-0001Qp-Fl; Mon, 28 Dec 2020 19:26:40 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>, Guenter Roeck <linux@roeck-us.net>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
 <165973a-135e-3072-ee2c-afda64844770@eik.bme.hu>
 <20201224053216.GA60462@roeck-us.net>
 <88314cc3-6219-3dc-2981-279ef6442514@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a22dd574-adc6-5adf-1031-05a0ae359bbb@ilande.co.uk>
Date: Mon, 28 Dec 2020 19:26:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <88314cc3-6219-3dc-2981-279ef6442514@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Problems with irq mapping in qemu v5.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.698,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, chenhuacai@kernel.org,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/12/2020 08:11, BALATON Zoltan via wrote:

> On Wed, 23 Dec 2020, Guenter Roeck wrote:
>> On Thu, Dec 24, 2020 at 02:34:07AM +0100, BALATON Zoltan wrote:
>> [ ... ]
>>>
>>> If we need legacy mode then we may be able to emulate that by setting BARs
>>> to legacy ports ignoring what values are written to them if legacy mode
>>> config is set (which may be what the real chip does) and we already have
>>> IRQs hard wired to legacy values so that would give us legacy and
>>> half-native mode which is enough for both fuloong2e and pegasos2 but I'm not
>>> sure how can we fix BARs in QEMU because that's also handled by generic PCI
>>> code which I also don't want to break.
>>
>> The code below works for booting Linux while at the same time not affecting
>> any other emulation. I don't claim it to be a perfect fix, and overloading
>> the existing property is a bit hackish, but it does work.
> 
> Yes, maybe combining it with my original patch 1 to change secondary to flags to make 
> it a bit cleaner would work for me. Then we would either only emulate legacy or 
> half-native mode which is sufficient for these two machines we have. If Mark or 
> others do not object it this time, I can update my patch and resubmit with this one 
> to fix this issue, otherwise let's wait what idea do they have because I hate to 
> spend time with something only to be discarded again. I think we don't need more 
> complete emulation of this chip than this for now but if somebody wants to attempt 
> that I don't mind as long as it does not break pegasos2.

I had a play with your patches this afternoon, and spent some time performing some 
experiments and also reading various PCI bus master specifications and datasheets: 
this helped me understand a lot more about the theory of IRQ routing and compatible 
vs. legacy mode.

 From reading all the documentation (including the VIA and other datasheets) I cannot 
find any reference to a half-native mode which makes me think something else is wrong 
here. At the simplest level it could simply be that the VIA doesn't tri-state its 
legacy IRQ lines whilst the device is in native mode (the SI controller has an option 
for this), or it could indicate there is a PCI IRQ routing problem somewhere else 
that hasn't been picked up yet.

All of the datasheets suggest that legacy vs. native mode is selected by setting the 
correct bits in PCI_CLASS_PROG, and Linux reads this byte and configures itself to 
use legacy or native mode accordingly. Since the current default for the VIA is 0x8a 
then it should default to legacy mode, but we're immediately hitting some issues 
here: I've summarised my notes below for those interested.


1) PCI bus reset loses the default BAR addresses

The first problem we find is that the initialisation of the PCI bus erases the 
default BAR addresses: that's to say lines 133-137 in hw/ide/via.c will in effect do 
nothing:

  133     pci_set_long(pci_conf + PCI_BASE_ADDRESS_0, 0x000001f0);
  134     pci_set_long(pci_conf + PCI_BASE_ADDRESS_1, 0x000003f4);
  135     pci_set_long(pci_conf + PCI_BASE_ADDRESS_2, 0x00000170);
  136     pci_set_long(pci_conf + PCI_BASE_ADDRESS_3, 0x00000374);
  137     pci_set_long(pci_conf + PCI_BASE_ADDRESS_4, 0x0000cc01); /* BMIBA: 20-23h */

The lifecycle of the VIA IDE device goes like this: init() -> realize() -> reset() 
but then the PCI bus reset in pci_do_device_reset() immediately wipes the BAR 
addresses. This is why the legacy IDE ports currently don't appear at startup. Note I 
do see that other devices do try this e.g. gt64120_pci_realize() so it's an easy 
mistake to make.


2) -kernel doesn't initialise the VIA device

If you take a look at the PMON source it is possible to see that the firmware 
explicitly sets the PCI_CLASS_PROG to compatibility mode and disables the native PCI 
interrupt 
(https://github.com/loongson-community/pmon-2ef/blob/master/sys/dev/pci/vt82c686.c#L82).

Since Linux reads this byte on startup then this is why the kernel switches to 
compatibility mode by default. However the point here is that booting a kernel 
directly without firmware means the VIA IDE device isn't initialised as it would be 
in real life, and that's why there are attempts to pre-configure the device 
accordingly in via_ide_realize()/via_ide_reset().


3) QEMU doesn't (easily) enable a BAR to be disabled

The ideal situation would be for QEMU's VIA IDE device to check PCI_CLASS_PROG and 
configure itself dynamically: with PCI_CLASS_PROG set for legacy mode by default, the 
device can disable its BARs until they are explicitly enabled.

According to the PCI bus master specification the recommended behaviour for a device 
in compatible mode is to ignore all writes to the BARs, and for all BAR reads to 
return 0. This fits nicely with Guenter's finding that the BMDMA BAR should not 
return a value in order for Linux to boot correctly in legacy mode.

Unfortunately there is no existing functionality for this in QEMU which means you 
would have to do this manually by overriding the PCI config read/write functions. 
This is trickier than it sounds because the reads/writes don't necessarily have to be 
aligned to the BAR addresses in configuration space.


In summary whilst I'm not keen on the series in its current form, it seems the best 
solution for now. I've got a few comments on the latest version of the series which I 
will send along shortly.


ATB,

Mark.

