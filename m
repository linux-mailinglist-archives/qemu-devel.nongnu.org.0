Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A2679B6F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 15:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKK5c-00072t-4J; Tue, 24 Jan 2023 09:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pKK5X-00072f-2S; Tue, 24 Jan 2023 09:15:51 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pKK5U-0000Jz-OR; Tue, 24 Jan 2023 09:15:50 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4139F746324;
 Tue, 24 Jan 2023 15:13:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F403D7462DB; Tue, 24 Jan 2023 15:13:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F10F8745720;
 Tue, 24 Jan 2023 15:13:18 +0100 (CET)
Date: Tue, 24 Jan 2023 15:13:18 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASEJ_MKr5gP=C7_AXg2UbYmJyDMHtm77AXoyQnsa+f2HHA@mail.gmail.com>
Message-ID: <123b1c96-febb-ebc8-2d05-3c7379fbec27@eik.bme.hu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> On Tue, Jan 24, 2023 at 2:49 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Tue, 24 Jan 2023, Howard Spoelstra wrote:
>>> From a Mac OS guest perspective, via=cuda is needed for Mac OS 9.0.4 due
>> to
>>> the 2 usb devices (mouse/kbd) issue. And for 10.0/10.1 (my guess would be
>>> that these suffer the same usb issue)
>>> The real powermac3,1 AGP has no adb.
>>
>> And do these OSes run on real PowerMac3,1? If so then we likely have a bug
>> in USB emulation so maybe that could be fixed? In any case my patch does
>> not change mac99 and this should continue to work.
>>
>>> via=cuda supports Mac OS 9.0.4 up to OS X 10.4. via=pmu is strictly only
>>> needed for Mac OS X 10.5 guest (for which the speed reported was hacked
>> to
>>> 900Mhz to fool the installer), but should support all Mac OS/OS X that
>> are
>>> now supported.
>>
>> Since via=pmu is what should be a real machine does it run OS X >=10.2
>> already?
>>
>
> A real powermac3,1 (G4 400Mhz/AGP) runs 8.6 up to10.4.11
>
> qemu-system-ppc status:
> 8.6 will not boot from CD or HD.
> 9.0.4* with via=pmu only supports mouse, not kbd. Needs via=cuda due to 2
> usb device problem
> 9.1 and 9.2 with via=pmu
> 10.0 and 10.1 with via=pmu: no mouse and kdb. Needs via=cuda. (so also with
> an usb problem)
> 10.2 with via=pmu (but has serious graphics speed problem, also with
> via=cuda)
> 10.3 and 10.4 with via=pmu
> 10.5 only with via=pmu (but needs the 900Mhz speed hack).
>
> *9.0.4 will only run with Mac OS Rom version 5.2.1 and above.

I thought MacOS 8 needed old world ROM but looks like it can also load it 
from disk on new world machines. Then what version of the ROM it has? 
It seems there was some change at ROM 5.2.1 then which solves the problem 
with usb and older versions may have done something differently and 
expect it to work unlike it's emulated now.

So it seems versions before 10.2 have a problem (except 9,1 and 9.2 which 
may have a newer usb driver maybe? also 9.0.4 with ROM 5.2.1 and I assume 
later 9.x versions have at least this or newer Toolbox ROM) I think it's 
esasier to debug with OS X because it's easier to get logs and the drivers 
may also be open source so easier to check what's happening so let's just 
forget about MacOS9 for now and try to find out what changed between 10.1 
and 10.2 in usb handling.

> It seems via=pmu provides usb mouse first, usb kbd second.
> With Mac OS 9.0.4 the second device will not work.
> With 10.0 / 10.1 both usb mouse and kbd do not work.

These are added here:

https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ppc/mac_newworld.c#L435

you could change the order but it does not matter if both needs to work. 
If it makes the first one work then maybe the older USB drivers only 
handle one port per bus? But then the problem in OS X may be different.

> Real hardware provides two USB buses: USB 0 and USB 1. In Qemu by default I
> only see one bus: USB 0 into which both mouse and kdb are plugged.
> On the real G4 the mouse and kbd are each plugged into another bus, so I
> see the kbd on e.g. USB 0 and the mouse on e.g. USB 1.
>
> With -M mac99,via=cuda one USB bus is always created. It has id "usb-bus"
> We can add a second USB bus with e.g. -device pci-ohci,id=usb1  (this is
> the Apple USB controller).
>
> Then add mouse and kbd to different buses with:
> -device usb-mouse,bus=usb-bus.0    (attaches to first and default bus)
> -device usb-kbd,bus=usb1.0 (attaches to second bus).
>
> This then mimics what I see on real hardware. Should qemu-system-ppc by
> default provide the same?

Does this solve the problem you have? (You talk about via=cude above but I 
think it should be via=pmu. Is that a typo?) If this helps mac_newworld.c 
could add another usb bus or do somerthing different to match real 
hardware but you have to convince Mark about that first... Also Mac 
keyboards have a hub where the mouse is usially connected. Does modeling 
that setup with QEMU help?

Other idea you could try is to boot 10.1 and 10.2 and compare the ioteg 
outputs for the USB devices to see if there are some differences or get 
the USB driver versions and try to find out what changed in them.

>> or even better updating the main docs in
>>
>> https://www.qemu.org/docs/master/system/ppc/powermac.html
>>
> That would have to be taken up by someone else.

That page is generated from this file in QEMU source:

https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/ppc/powermac.rst

you can submit a patch to that like I did:

https://lists.nongnu.org/archive/html/qemu-ppc/2023-01/msg00006.html

Regards,
BALATON Zoltan

