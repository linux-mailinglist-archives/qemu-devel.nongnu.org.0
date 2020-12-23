Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175482E22DC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 00:58:16 +0100 (CET)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksE1G-0008VF-Nb
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 18:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksDzV-00083R-B7
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 18:56:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:24443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksDzQ-0003eC-MX
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 18:56:24 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6ECA4746553;
 Thu, 24 Dec 2020 00:56:16 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 08922746552; Thu, 24 Dec 2020 00:56:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 070DB746383;
 Thu, 24 Dec 2020 00:56:16 +0100 (CET)
Date: Thu, 24 Dec 2020 00:56:15 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
Message-ID: <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1121320062-1608761635=:25877"
Content-ID: <725d8d1e-f17-592f-48e7-15453d80405e@eik.bme.hu>
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, chenhuacai@kernel.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1121320062-1608761635=:25877
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <e4973969-a62c-b3b8-e932-a856f44e8f66@eik.bme.hu>

On Wed, 23 Dec 2020, Guenter Roeck wrote:
> On 12/23/20 12:20 PM, BALATON Zoltan wrote:
>> On Wed, 23 Dec 2020, Guenter Roeck wrote:
>>> On 12/23/20 8:09 AM, Mark Cave-Ayland wrote:
>>>> On 23/12/2020 15:21, Philippe Mathieu-Daudé wrote:
>>>>> FWIW bisecting Fuloong2E starts failing here:
>>>>>
>>>>> 4ea98d317eb442c738f898f16cfdd47a18b7ca49 is the first bad commit
>>>>> commit 4ea98d317eb442c738f898f16cfdd47a18b7ca49
>>>>> Author: BALATON Zoltan <balaton@eik.bme.hu>
>>>>> Date:   Fri Jan 25 14:52:12 2019 -0500
>>>>>
>>>>>      ide/via: Implement and use native PCI IDE mode
>>>>>
>>>>>      This device only implemented ISA compatibility mode and native PCI IDE
>>>>>      mode was missing but no clients actually need ISA mode but to the
>>>>>      contrary, they usually want to switch to and use device in native
>>>>>      PCI IDE mode. Therefore implement native PCI mode and switch default
>>>>>      to that.
>>>>>
>>>>>      Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>      Message-id:
>>>>> c323f08c59b9931310c5d92503d370f77ce3a557.1548160772.git.balaton@eik.bme.hu
>>>>>      Signed-off-by: John Snow <jsnow@redhat.com>
>>>>>
>>>>>   hw/ide/via.c | 52 ++++++++++++++++++++++++++++++++++++++--------------
>>>>>   1 file changed, 38 insertions(+), 14 deletions(-)
>>>>
>>>> I think the original version of the patch broke fuloong2e, however that should have been fixed by my patchset here: https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg03936.html. It might be that there are multiple regressions located during a full bisect :/
>>>>
>>>
>>> Not really. The following patch on top of qemu 5.2 results in the ide drive
>>> being detected and working.
>>>
>>> diff --git a/hw/ide/via.c b/hw/ide/via.c
>>> index be09912b33..1bfdc422ee 100644
>>> --- a/hw/ide/via.c
>>> +++ b/hw/ide/via.c
>>> @@ -186,11 +186,14 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>>>     pci_register_bar(dev, 3, PCI_BASE_ADDRESS_SPACE_IO, &d->cmd_bar[1]);
>>>
>>>     bmdma_setup_bar(d);
>>> +#if 0
>>>     pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>> +#endif
>>>
>>>     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
>>>     for (i = 0; i < 2; i++) {
>>>         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>>> +        ide_init_ioport(&d->bus[i], NULL, i ? 0x170 : 0x1f0, i ? 0x376 : 0x3f6);
>>>         ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
>>>
>>>         bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>>
>>> With the added ide_init_ioport(), the drive is detected. With the #if 0,
>>
>> This breaks MorphOS on pegasos2 so it's not acceptable for me as a fix. (Actually this just reverts my commit in a cryptic way.)
>>
>>> it actually starts working. So there are two problems: 1) The qemu ide
>>> subsystem isn't informed about the io addresses, and 2) bmdma isn't working.
>>
>> The problem rather seems to be that whatever you're trying to run can only handle legacy mode and does not correctly detect or work with native mode of this IDE controller. The real chip can switch between these modes and starts in legacy mode but most OSes with a better driver will switch to native mode during boot (in some cases the firmware will switch already). But we can't emulate that in QEMU easily because of how the IDE emulation is implemented: we either set up legacy ioports or use PCI BMDMA, I don't see a way to deregister legacy ports and irqs once the config reg is flipped to native mode. Therefore I've chosen to only emulate native mode which is what most guests want to use and some only work with that and I've tested this with the previously mentioned Linux version that it still detected and worked with the IDE ports. During testing I've found that Linux will use either native or legacy modes if the appropriate config bits are set but for some boards there may
>> be work arounds for specific quirks such as the case for pegasos2 with IRQs hardwired to legacy interrupts even in native mode where we need to follow what hardware does otherwise one or the other guest breaks. Maybe there's a similar quirk for the fuloong2e?
>>
>> What guest OS are you running and did you confirm that it runs on the real machine? If you run recent Linux kernels and don't know if those still work with real hardware could this be a bug in the guest driver and not in QEMU? We know that we don't fully emulate this controller but there should be a way to set things up in a way that satisfies all guests and I've tried to do that when touching this part but possibly I did not have the right Linux version for the real machine as it was hard to find one distro that worked with it. Maybe Jiaxun has a known working Linux distro or kernel that we can use to check emulation with or knows more about how the VIA IDE port IRQs are wired on this board. (I've added Jiaxun again but the list seems to strip his addess.)
>>
>
> I don't have a real machine, and therefore did not test it on one.
>
> I tried with Linux mainline (v5.10-12913-g614cb5894306), v3.16.85, v4.4.248,
> and v4.14.212. I can't test older version because my cross compiler is too
> new. Each of those kernel versions shows exactly the same behavior.

I think the original author of this device was Huacai so adding him to the 
thread too in case he remembers anything relevant, but code there now is 
not what he wrote because that only emulated legacy mode and after my 
changes (reworked by Mark) we only emulate native mode with optional quirk 
using legacy IRQs for pegasos2. But maybe he has some images that were 
known to work on the real machine that we could test now to see where's 
the problem.

On Tue, 22 Dec 2020, Guenter Roeck wrote:
> qemu-system-mips64el -M fulong2e \
>     -kernel vmlinux -no-reboot -m 256 -snapshot \
>     -drive file=rootfs.mipsel.ext3,format=raw,if=ide \
>     -vga none -nographic \
>     --append "root=/dev/sda console=ttyS0"
>     -serial stdio -monitor none
> 
> This works just fine with qemu v3.1. With qemu v5.2 (after applying the
> fuloong patch series), I get:
> 
> VFS: Cannot open root device "sda" or unknown-block(0,0): error -6
> 
> This used to work up to qemu v3.1. Since qemu v4.0, there has been a variety
> of failures. Common denominator is that the ide drive is no longer recognized,
> presumably due to related changes in the via and/or pci code between v3.1
> and v4.0.
> 
> Difference in log messages:
> 
> v3.1:
> 
> pci 0000:00:05.1: [Firmware Bug]: reg 0x10: invalid BAR (can't size)
> pci 0000:00:05.1: [Firmware Bug]: reg 0x14: invalid BAR (can't size)
> pci 0000:00:05.1: [Firmware Bug]: reg 0x18: invalid BAR (can't size)
> pci 0000:00:05.1: reg 0x1c: [mem 0x100000370-0x10000037f 64bit]
> ...
> pata_via 0000:00:05.1: BMDMA: BAR4 is zero, falling back to PIO
> ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
> ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
> ata1.00: ATA-7: QEMU HARDDISK, 2.5+, max UDMA/100
> ...

This is the previous state only emulating legacy mode and since none of 
the native mode BARs are there Linux fails to enable native mode and falls 
back to legacy so it ends up working but probably not how this should work 
on real machine.

> ----
> 
> v5.2:
> 
> pci 0000:00:05.1: reg 0x10: [io  0x0000-0x0007]
> pci 0000:00:05.1: reg 0x14: [io  0x0000-0x0003]
> pci 0000:00:05.1: reg 0x18: [io  0x0000-0x0007]
> pci 0000:00:05.1: reg 0x1c: [io  0x0000-0x0003]
> pci 0000:00:05.1: reg 0x20: [io  0x0000-0x000f]
> pci 0000:00:05.1: BAR 4: assigned [io  0x4440-0x444f]
> ...
> ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x4440 irq 14
> ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x4448 irq 15
> [and nothing else]

Now we emulate native mode and Linux seems to program the BARs (although 
I'm not sure all these should be starting at 0) but then still tries to 
access the device in legacy mode as shown by ports and IRQs.

If someone has logs from original machine it would be interesting to see 
how IDE ports are detected there. I'll try with the kernel from debian and 
see what that does but maybe it tries to use legacy mode too then it 
won't work.

With the original image I used for testing described here:
https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg04086.html
I now get:

$ qemu-system-mips64el -M fuloong2e -serial stdio -net none -vga none -kernel gentoo-loongson-2.6.22.6-20070902 -cdrom debian-8.11.0-mipsel-netinst.iso

Linux version 2.6.22.6-mipsgit-20070902-lm2e-liveusb (stuartl@zhenghe) 
(gcc version 4.1.2 (Gentoo 4.1.2 p1.0.1)) #5 Fri Jan 25 11:19:12 EST 2008

[...]

via686b fix: ISA bridge
via686b fix: ISA bridge done
via686b fix: IDE
via686b fix: IDE done
PCI quirk: region eee0-eeef claimed by vt82c686 SMB
ac97 interrupt = 9
ac97 rev=80
Setting sub-vendor ID & device ID
sub vendor-device id=11001af4
pci_update_mappings: adding bar 4 to io @ 0x4040

[note the IDE fixup which some board specific quirk coming from
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/mips/pci/fixup-fuloong2e.c]

serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
io_map_base of root PCI bus 0000:00 unset.  Trying to continue but you better
fix this issue or report it to linux-mips@linux-mips.org or your vendor.
scsi0 : pata_via
scsi1 : pata_via
ata1: PATA max UDMA/100 cmd 0xffffffffbfd001f0 ctl 0xffffffffbfd003f6 bmdma 0xffffffffbfd04040 irq 14
ata2: PATA max UDMA/100 cmd 0xffffffffbfd00170 ctl 0xffffffffbfd00376 bmdma 0xffffffffbfd04048 irq 15
[...]
NET: Registered protocol family 17
Freeing unused kernel memory: 8832k freed


Loading drivers...
usbcore: registered new interface driver usbfs
[...]
USB Universal Host Controller Interface driver v3.0
PCI: Enabling device 0000:00:05.2 (0000 -> 0001)
pci_update_mappings: adding bar 4 to io @ 0x4000
uhci_hcd 0000:00:05.2: UHCI Host Controller
uhci_hcd 0000:00:05.2: new USB bus registered, assigned bus number 1
uhci_hcd 0000:00:05.2: irq 10, io base 0x00004000
qemu-system-mips64el: ../hw/pci/pci.c:255: pci_bus_change_irq_level: 
Assertion `irq_num < bus->nirq' failed.
Aborted (core dumped)

I think this is the problem you've reported originally exposed by 
459ca8bfa41, reverting that commit gives me:

USB Universal Host Controller Interface driver v3.0
PCI: Enabling device 0000:00:05.2 (0000 -> 0001)
uhci_hcd 0000:00:05.2: UHCI Host Controller
uhci_hcd 0000:00:05.2: new USB bus registered, assigned bus number 1
uhci_hcd 0000:00:05.2: irq 10, io base 0x00004000
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
PCI: Enabling device 0000:00:05.3 (0000 -> 0001)
uhci_hcd 0000:00:05.3: UHCI Host Controller
uhci_hcd 0000:00:05.3: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:05.3: irq 11, io base 0x00004020
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
loop: module loaded
Registering unionfs 2.2.2 (for 2.6.22.15)
squashfs: version 3.2-r2 (2007/01/15) Phillip Lougher
Waiting 10 seconds for devices to settle.

Gentoo/MIPS 2007.1 Netboot Image
--------------------------------

Kernel 2.6.22.6-mipsgit-20070902-lm2e-liveusb compiled #5 Fri Jan 25 
11:19:12 EST 2008
Running on platform lemote-fulong

but so does removing USB such as:

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 45c596f4fe..26c3438729 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -255,10 +255,10 @@ static void vt82c686b_southbridge_init(PCIBus 
*pci_bus, int slot, qemu_irq intc,

      dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
      pci_ide_create_devs(dev);
-
+#if 0
      pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
      pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
-
+#endif
      *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1, NULL);

      /* Audio support */

which also avoids the the problem without reverting 459ca8bfa41 so I think 
there are two problems:

1. IRQ mapping is somehow wrong on fuloong2, this is evidenced by the USB 
part above and also by kernel panics if I remove -net none or -vga none 
from the command line. I think this is not related to IDE emulation, maybe 
only exposed by it first.

2. The Linux driver you use wants to use legacy mode of the IDE that we 
don't emulate. The linux/arch/mips/pci/fixup-fuloong2e.c does mention 
legacy mode but I think I've found previously that if we hard code native 
mode, Linux would detect it and use it anyway. I think this worked with my 
original series but may have been broken during the rework. I'd have to 
dig up those patches and see what's the difference. Probably hardcoding 
legacy IRQ's instead of allowing true native mode and maybe handling of 
the native mode bit are different in my original patches but I don't 
really want to go over this again after we had a long discussion 
previously and I did describe everything I've found in detail back then 
but forgotten by now and would have to discover it again.

Neither of the above problems should be fixed by reverting my via-ide 
changes that are needed for pegasos2 emulation. If Linux can't be changed 
to work with native mode of the controller then maybe emulating both 
legacy and native mode could help but that does not seem to be simple 
without changing low level IDE emulation that has a chance to break 
something else so I did not try to do that. That's why I chose to emulate 
native mode only which I did test to work with both fuloong2e and 
pegasos2. I did spend quite some time with this back then. I think the 
problem with the current version is that it only emulates half-native mode 
now which is OK for pegasos2 but confuses Linux on fuloong2e. On fuloong 
full native mode would probably work where IRQ is settable by register as 
described in datasheet if we fix native mode bit so it can't be set to 
legacy mode which we don't emulate. I think I did this in original series 
and it worked but needed a bit to select between this mode and half-native 
mode for pegasos2 which Mark disliked so he twisted the patches as long as 
he could get rid of that bit but still allow the test cases to pass.

I know my original proposal may not match real hardware completely but we 
have to decide what we want: faithful emulation of all the quirks of this 
chip or getting an OS running so the user space could be tested. A lot of 
machines in QEMU do the latter (e.g. mac99 or e500 and maybe really all 
machines as they don't aim to be a simulator just emulate enough of the 
machine to get OSes running) so I think it would be OK for this case as 
well if fully emulating the chip is much more trouble than it's worth.

Regards,
BALATON Zoltan
--3866299591-1121320062-1608761635=:25877--

