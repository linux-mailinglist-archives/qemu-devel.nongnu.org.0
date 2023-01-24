Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAFB679D98
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 16:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKLIw-0008Iz-DV; Tue, 24 Jan 2023 10:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pKLIt-0008IT-8G; Tue, 24 Jan 2023 10:33:43 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pKLIq-0005xq-MC; Tue, 24 Jan 2023 10:33:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F1EB4746361;
 Tue, 24 Jan 2023 16:31:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A1F70746324; Tue, 24 Jan 2023 16:31:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A00D174635C;
 Tue, 24 Jan 2023 16:31:13 +0100 (CET)
Date: Tue, 24 Jan 2023 16:31:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASHotQcPDRQxhMdL729wGHNkT0gfYt2GH8U5e190eOTCQQ@mail.gmail.com>
Message-ID: <a9dbc41c-29e5-7672-d9ec-4ec43ae3a6c8@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
 <bd0e4431-c5ec-2ef5-d847-8c59aa8cc55c@eik.bme.hu>
 <ab9e33e5-70fc-0a76-c548-16ec787ea1af@ilande.co.uk>
 <ed8ee369-c9a8-7853-3b65-7361fefc3c63@eik.bme.hu>
 <ca5240e6-e00d-6213-22d6-f7b43d8bed18@ilande.co.uk>
 <CABLmASGc6fybw7mL5JHUCukwoB6KjGaaWHct5mi20A2vXZhtaA@mail.gmail.com>
 <8e6f46fb-5e1b-8016-c595-85e8e83ace47@eik.bme.hu>
 <CABLmASEJ_MKr5gP=C7_AXg2UbYmJyDMHtm77AXoyQnsa+f2HHA@mail.gmail.com>
 <123b1c96-febb-ebc8-2d05-3c7379fbec27@eik.bme.hu>
 <CABLmASHotQcPDRQxhMdL729wGHNkT0gfYt2GH8U5e190eOTCQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023, Howard Spoelstra wrote:
> On Tue, Jan 24, 2023 at 3:15 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> I thought MacOS 8 needed old world ROM but looks like it can also load it
>> from disk on new world machines. Then what version of the ROM it has?
>> It seems there was some change at ROM 5.2.1 then which solves the problem
>> with usb and older versions may have done something differently and
>> expect it to work unlike it's emulated now.
>>
>> The rom on the 8.6 Cd is version ....
> The disk utility on the CD cannot initialise a hard disk (something we had
> with some 9.0.4 versions too)

This sentence seems to be unfinished, also the disk utility problem is 
maybe unrelated so just ignore that for now and focus on usb first.

>> So it seems versions before 10.2 have a problem (except 9,1 and 9.2 which
>> may have a newer usb driver maybe? also 9.0.4 with ROM 5.2.1 and I assume
>> later 9.x versions have at least this or newer Toolbox ROM) I think it's
>> esasier to debug with OS X because it's easier to get logs and the drivers
>> may also be open source so easier to check what's happening so let's just
>> forget about MacOS9 for now and try to find out what changed between 10.1
>> and 10.2 in usb handling.
>>
>>> It seems via=pmu provides usb mouse first, usb kbd second.
>>> With Mac OS 9.0.4 the second device will not work.
>>> With 10.0 / 10.1 both usb mouse and kbd do not work.
>>
>> These are added here:
>>
>>
>> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ppc/mac_newworld.c#L435
>>
>> you could change the order but it does not matter if both needs to work.
>> If it makes the first one work then maybe the older USB drivers only
>> handle one port per bus? But then the problem in OS X may be different.
>>
>>> Real hardware provides two USB buses: USB 0 and USB 1. In Qemu by
>> default I
>>> only see one bus: USB 0 into which both mouse and kdb are plugged.
>>> On the real G4 the mouse and kbd are each plugged into another bus, so I
>>> see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.
>>>
>>> With -M mac99,via=cuda one USB bus is always created. It has id "usb-bus"
>>> We can add a second USB bus with e.g. -device pci-ohci,id=usb1  (this is
>>> the Apple USB controller).
>>>
>>> Then add mouse and kbd to different buses with:
>>> -device usb-mouse,bus=usb-bus.0    (attaches to first and default bus)
>>> -device usb-kbd,bus=usb1.0 (attaches to second bus).
>>>
>>> This then mimics what I see on real hardware. Should qemu-system-ppc by
>>> default provide the same?
>>
>> Does this solve the problem you have?
>
>
> No.

OK so then we should not do that by default either unless we find it's 
needed for some reason.

>> (You talk about via=cude above but I
>> think it should be via=pmu. Is that a typo?)
>
>
> No, even with via-cuda the first usb bus is created:
> dev: pci-ohci, id ""
>        masterbus = ""
>        num-ports = 3 (0x3)
>        firstport = 0 (0x0)
>        addr = 0d.0
>        romfile = ""
>        romsize = 4294967295 (0xffffffff)
>        rombar = 1 (0x1)
>        multifunction = false
>        x-pcie-lnksta-dllla = true
>        x-pcie-extcap-init = true
>        failover_pair_id = ""
>        acpi-index = 0 (0x0)
>        class USB controller, addr 00:0d.0, pci id 106b:003f (sub 1af4:1100)
>        bar 0: mem at 0x80080000 [0x800800ff]
>        bus: usb-bus.0
>          type usb-bus
>
> I now think in some cases the mouse falls back to adb when usb does not
> work. Hence the wiggling/clicking that is needed to get 9.0.4 to get to the
> desktop.
> Can we disable usb-bus creation for via=cuda?

Yes, try:

qemu-system-ppc -M mac99,usb=no

(I had to look at the code to find that out).

> If this helps mac_newworld.c
>> could add another usb bus or do somerthing different to match real
>> hardware but you have to convince Mark about that first... Also Mac
>> keyboards have a hub where the mouse is usially connected. Does modeling
>> that setup with QEMU help?
>>
>> No, same issues with that.

Then it's probably not about how these ports are arranged but something 
about modeiling the hardware maybe (i.e. QEMU does something differently 
than real hardware and this confuses the driver).

>> Other idea you could try is to boot 10.1 and 10.2 and compare the ioreg
>> outputs for the USB devices to see if there are some differences or get
>> the USB driver versions and try to find out what changed in them.
>>
>>
> I attempted to take a look, but without mouse/kbd it is difficult to get to
> ioreg ;-)

You can set up tap or vmnet network, boot it with cuda, enable ssh then 
you can access it from there after booting usb config. (It may even work 
with user network somehow, I think there's an option to forward a port 
from the guest to host then you could access ssh that way without having 
to set up bridged networking but you'll need to find that option as I 
don't remember what it was but I think I've seen it somewhere. Maybe in 
qemu-system-ppc -help or some docs on QEMU networking somewhere.)

Regards,
BALATON Zoltan

