Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D84BC874
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 13:57:56 +0100 (CET)
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLPJD-00066x-Be
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 07:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLPFR-00047y-5C; Sat, 19 Feb 2022 07:54:04 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:10204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nLPEt-0006LC-RW; Sat, 19 Feb 2022 07:54:00 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B64D27457EF;
 Sat, 19 Feb 2022 13:53:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4DCD4745712; Sat, 19 Feb 2022 13:53:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4B955745706;
 Sat, 19 Feb 2022 13:53:23 +0100 (CET)
Date: Sat, 19 Feb 2022 13:53:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ide: add ich6 ide controller device
 emulation
In-Reply-To: <e905a1d1-c7e8-bf10-22e8-cd5382b93c11@gmail.com>
Message-ID: <d9733c34-b770-4717-cc8f-10cdf17640a8@eik.bme.hu>
References: <20220218204155.236611-1-liavalb@gmail.com>
 <20220218204155.236611-3-liavalb@gmail.com>
 <68413ab-d14c-f5c6-4baf-12e3a18a6a5@eik.bme.hu>
 <e905a1d1-c7e8-bf10-22e8-cd5382b93c11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1110361184-1645271210=:23786"
Content-ID: <65792d2c-37e6-50de-913-4dcbbc645df@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1110361184-1645271210=:23786
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <a11026e-9a56-1a9a-d8c9-9e94cc8e1531@eik.bme.hu>

On Sat, 19 Feb 2022, Liav Albani wrote:
> On 2/19/22 02:50, BALATON Zoltan wrote:
>>> +/*
>>> + * QEMU IDE Emulation: PCI ICH6/ICH7 IDE support.
>> 
>> This is a small thing, but if these two are the same maybe keeping this 
>> comment but using the ich7 name everywhere else would make it less likely 
>> to get it confused with ich9. I mean ich6 and ich9 is easily confused, 
>> while ich7 is clearly distinct. But maybe it's just me, calling it ich6 is 
>> also correct and can be preferred by someone else.
> ICH6 and ICH7 IDE controllers are quite the same as far as I know. I could 
> change it, but then one could argue that the name ich6-ide seems like 
> "ich9-ide", so not sure if we can really go on this path.

I think we don't actually have ich9-ide, we only have piix3, piix4 and 
ahci, the latter is used by ich9. I just said that calling this new device 
ich7-ide instead of ich6-ide would make it more clear it has nothing to do 
with ich9. It's already clear with calling it ich6 unless somebody 
misreads that which is easier with 6 than 7. Also according to 
https://en.wikipedia.org/wiki/I/O_Controller_Hub the native mode PATA 
controller first appeared in ICH3 but that says limited so maybe it was 
changed later. I don't know anthing about these so can't tell which are 
similar. Also if your reference system you're emulating is actually an 
ICH7 then calling it that would make sense to me.

>>> +static void ich6_pci_config_write(PCIDevice *d, uint32_t addr, uint32_t 
>>> val,
>>> +                                    int l)
>>> +{
>>> +    uint32_t i;
>>> +
>>> +    pci_default_write_config(d, addr, val, l);
>>> +
>>> +    for (i = addr; i < addr + l; i++) {
>>> +        switch (i) {
>>> +        case 0x40:
>>> +            pci_default_write_config(d, i, 0x8000, 2);
>>> +            continue;
>>> +        case 0x42:
>>> +            pci_default_write_config(d, i, 0x8000, 2);
>>> +            continue;
>>> +        }
>>> +    }
>> 
>> I'm not sure what this tries to do but this for cycle looks suspicious 
>> here. It's also only calls pci_default_write_config() so why didn't the 
>> default worked and why was this override needed?
>> 
> It's just a loop to ensure that if the guest OS tries to disable an IDE 
> channel from the PCI config space, it seems "stuck" on enabled. I should 
> probably put a comment on this to explain this, but I definitely don't want 
> the guest OS to be able to disable any IDE channel for now (on real hardware, 
> it does that, but I think we can either skip this feature or implement in a 
> future patch, as Linux deals with the controller just fine).

I still don't get what this tries to achieve but I think it's very likely 
wrong so if it's not needed it's better to just drop it for now. It can 
also be addressed in a follow up patch later.

>>> +}
>>> +
>>> +static void ich6_ide_reset(DeviceState *dev)
>>> +{
>>> +    PCIIDEState *d = PCI_IDE(dev);
>>> +    PCIDevice *pd = PCI_DEVICE(d);
>>> +    uint8_t *pci_conf = pd->config;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < 2; i++) {
>>> +        ide_bus_reset(&d->bus[i]);
>>> +    }
>>> +
>>> +    /* TODO: this is the default. do not override. */
>>> +    pci_conf[PCI_COMMAND] = 0x00;
>>> +    /* TODO: this is the default. do not override. */
>>> +    pci_conf[PCI_COMMAND + 1] = 0x00;
>>> +    /* TODO: use pci_set_word */
>>> +    pci_conf[PCI_STATUS] = PCI_STATUS_FAST_BACK;
>>> +    pci_conf[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_MEDIUM >> 8;
>>> +    pci_conf[0x20] = 0x01; /* BMIBA: 20-23h */
>>> +}
>>> +
>>> +static int pci_ich6_init_ports(PCIIDEState *d)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < 2; i++) {
>>> +        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>> +        ide_init2(&d->bus[i], d->native_irq);
>>> +
>>> +        bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>> +        d->bmdma[i].bus = &d->bus[i];
>>> +        ide_register_restart_cb(&d->bus[i]);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void pci_ich6_ide_realize(PCIDevice *dev, Error **errp)
>>> +{
>>> +    PCIIDEState *d = PCI_IDE(dev);
>>> +    uint8_t *pci_conf = dev->config;
>>> +    int rc;
>> 
>> All in all this device looks very similar to piix ide devices with only 
>> some differentces so I wonder if ir could be implemented as another device 
>> in piix.c. We already have 3 variants there: piix3-ide, piix3-ide-xen, and 
>> piix4-ide so maybe putting this device in piix.c could avoid some code 
>> duplication. In that case moving out bmdma_{read,write} were not needed 
>> either although maybe that's a good idea anyway to share it with other 
>> devices.
>> 
> As for putting the ich6-ide code in piix.c  - I'm not against it. Although,

The real question if this controller is similiar enough to piix or it's 
different just for this initial version it's reusing most code but this 
will change in the future. If the latter then putting it in a separate 
file is better, if it will stay like it then putting it in piix to share 
code already there is better.

> in the long run, if I send more patches to QEMU, I rather split the files a 
> bit more in the /hw/ide directory as there's a lot of code duplication to 
> solve.
> So, what we could do instead, is to share more code between the devices and 
> still keep them in separate files.

I just wanted to avoid more code duplication by adding new files that will 
look like the devices that's already there. But if this is just a first 
step and you'll send more patches to implement more features that will 
make it more different, then having it in a separate file is better. But I 
could only judge from the patch so far which is almost identical to piix, 
only differentce is irq and port handling so this could be a variant of 
piix then as well if that's all you want for this device.

> As for moving out the bmdma_{write,read} functions - I'm still in the 
> previous mind that we need to move them out as via.c shares the same code but 
> currently has code duplications for it, and that I want to solve as part of 
> making the IDE code more clean and to add more features.
>
> However, if it seems necessary to do this cleanup before implementing this 
> ich6-ide controller, I'm more than happy to wait on this, send a patch to 
> solve and clean up some issues in the IDE code, and then re-send this as v3.
> I might even consider doing that now if nobody rejects this idea :)

It can be in the same series but still good to have as separate patch so 
it can be reviewed independently and maybe also merged independently. The 
maintainer can always squash patches together later but separating them is 
usually only the original contributor can easily and best do.

>>> +
>>> +    pci_conf[PCI_INTERRUPT_PIN] = 1; /* interrupt pin A */
>>> +
>>> +    /* PCI native mode-only controller, supports bus mastering */
>>> +    pci_conf[PCI_CLASS_PROG] = 0x85;
>>> +
>>> +    bmdma_setup_bar(d);
>>> +    pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>>> +
>>> +    d->native_irq = pci_allocate_irq(&d->parent_obj);
>> 
>> Is this irq and the new field in PCIIDEState really needed? If this device 
>> is using PCI interrupts could it do the same as CMD646 ide does instead?
>> 
> I looked into how cmd646.c does that, but it creates that with the 
> qdev_init_gpio_in function. The AHCI controller seems to use pci_allocate_irq 
> function (in ich.c), as well as other hardware devices in QEMU, but the 
> rtl8139 device doesn't have such field and still works, so not sure what to 
> do and how to make it to work in the best, simple way here.

The cmd646 is similar as it's a PCI device and shares the same PCIIDEState 
so I think doing the same is best for cnosistency and to avoid needing to 
change the shared PCIIDEState that should be a generic PCI IDE controller 
model but still has one cmd646 specific field. Using qdev_init_gpio_in 
attaches the irq to the device so it will be kept track of without needing 
to store it anywhere so I think it's not a bad way to do it for this case. 
AHCI has its own device state and stores the irq there, I don't know what 
rtl8139 does. There may be multiple correct ways to do it but following 
similar examples is probably a good idea.

>> That's all for now, I haven't checked the docs of these ide controllers so 
>> I'm not sure if these have switchable native and legacy modes like via has 
>> and we again getting the problem that we can't model that easily or these 
>> are really different with one having only legacy and the ich6/7 only native 
>> modes.
>
> If I recall correctly, on my ICH7 test machine you can switch between native 
> and legacy mode, but it doesn't mean that there couldn't be a device on some 
> motherboard in 2009 that doesn't allow you to switch between legacy and

OK so we probably again have a case we had with via-ide which also has 
legacy mode where it behaves like an ISA controller using legacy ports and 
irq 14-15 or a native mode where ports can be set by PCI BARs and irqs may 
or may not use PCI interrupt. Due to how ISA code is organised, which is 
an old part of QEMU we can't easily implement this (the main problem is 
once ISA ports are created we can't delete them so we're stuck in legacy 
mode) so what we have is only emulating one mode for these controller 
models. I think the cmd646 is completely PCI device (not sure it had a 
legacy mode), the via-ide is native mode but with ISA interrupts and piix 
is probably only legacy mode but not sure if it had a native mode. Maybe 
this ich-ide is the native mode of piix? In that case could it be modelled 
that way adding an option to piix so it can be set up in native mode or 
legacy mode? We would still not be able to switch between them from the 
guest as on real hardware but machines or users could decide when creating 
the device what mode they want. Or is the ich ide completely different 
from piix?

> native mode. However, I rather not put the option because I want software to 
> deal with a PCI device that is free from legacy IO ports completely. Also, I 
> am pretty sure that if I change the settings in the BIOS menu then it could 
> be stuck to native mode (if for example, I enable both the PATA connector and 
> the 4 SATA ports), but still not sure about this. This is a feature I'll look 
> into it in the future, as I definitely want to improve on this and maybe 
> allow the user to configure the ich6-ide device to have a different MAP 
> register to simulate 4 SATA ports and 2 PATA connections.

OK then it will probably be different from piix so maybe this justifies it 
putting it in a different file and code that is similar now will become 
more different in the future.

> I'll wait a few more days to let other people send comments on this before 
> sending v3. Thanks again for the valuable comments :)

That's probably a good idea, I hope others will have some time to comment 
as well. I'm trying to help but I can only give ideas, not definitive 
answers for your questions.

Regards.
BALATON Zoltan
--3866299591-1110361184-1645271210=:23786--

