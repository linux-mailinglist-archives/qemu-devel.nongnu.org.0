Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B740355F5F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 01:20:11 +0200 (CEST)
Received: from localhost ([::1]:50186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTuzR-0002rs-Up
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 19:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lTuyJ-0002Ph-09
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 19:18:59 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:65252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lTuyF-00053k-Ac
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 19:18:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 32E8E7456E3;
 Wed,  7 Apr 2021 01:18:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E6AAC7456B7; Wed,  7 Apr 2021 01:18:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E3C327456B4;
 Wed,  7 Apr 2021 01:18:51 +0200 (CEST)
Date: Wed, 7 Apr 2021 01:18:51 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Mac OS real USB device support issue
In-Reply-To: <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
Message-ID: <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-267373550-1617751131=:1603"
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-267373550-1617751131=:1603
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 6 Apr 2021, Programmingkid wrote:
>> On Apr 6, 2021, at 12:53 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Tue, 6 Apr 2021, Programmingkid wrote:
>>>> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>>>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid <programmingkidx@gmail.com> wrote:
>>>>>
>>>>> Hi Gerd,
>>>>>
>>>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 machine to test USB support. I am on Mac OS 11.1 and cannot make USB devices work with any of my guests. So far these are the guests I have tested with:
>>>>>
>>>>> - Windows 7
>>>>> - Mac OS 9.2
>>>>> - Windows 2000
>>>>>
>>>>> I have tried using USB flash drives, USB sound cards, and an USB headset. They all show up under 'info usb', but cannot be used in the guest. My setup does use a USB-C hub so I'm not sure if this is a bug with QEMU or an issue with the hub. Would you have any information on this issue?
>>>>
>>>> Hi John,
>>>>
>>>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it does
>>>> not support USB 2.0. I was successful only in passing through a USB
>>>> flash drive that was forced into USB 1.1 mode by connecting it to a
>>>> real USB 1.1 hub and unloading the kext it used.
>>>>
>>>> Best,
>>>> Howard
>>>
>>> Hi Howard, I was actually thinking about CC'ing you for this email. Glad you found it. Unloading kext files does not sound pleasant. Maybe there is some better way of doing it.
>>
>> In any case, until you make sure nothing tries to drive the device on the host, passing it to a guest likely will fail because then two drivers from two OSes would try to access it simultaneously which likely creates a mess as the device and drivers don't expect this. So you can't just pass a device through that the host has recognised and is driving without somehow getting the host to leave it alone first before you can pass it through. Unloading the driver is one way to do that (although it probably breaks all other similar devices too). Maybe there's another way to unbind a device from the host such as ejecting it first but then I'm not sure if the low level USB needed for accessing the device still works after that or it's completely forgotten. There's probably a doc somewhere that describes how it works and how can you plug a device without also getting higher level drivers to load or if there's no official ways for that then you'll need to do some configuration on the host t
 o avoid it grabbing devices that you want to pass through. On Linux you can add an udev rule to ignore the device (maybe also adding TAG+="uaccess" to allow console users to use it without needing root access) but not sure how USB works on macOS.
>>
>> Regards,
>> BALATON Zoltan
>
> Being able to dissociate a real USB device from its Mac OS driver would 
> be very useful in this situation. IOKit might be one place to look for 
> such a feature. The Mach kernel documentation is another place that 
> might have what we want.

Those might be a good place to start. IOKit provides the drivers and also 
the io registry which is probably where you can get if a driver is bound 
to a device and which one is it. How to dissociate the driver from the 
device though I don't know.

> I have one theory. What if we introduce a middleman. A pseudo-USB device 
> that the guest operating system could apply its configuration data to 
> and will also talk directly with to the real USB device.
> So this:
>
> USB device <-> Host <-> QEMU USB middleman <-> Guest

Isn't this middleman the QEMU usb-host device that we already have?

> This could make USB 2.0 and 3.0 flash drives compatible with an older 
> operating system like Mac OS 9. The USB middleman could fully accept Mac 
> OS 9's configuration and make it think it is talking to a USB 1.1 
> device. Parameters like data packet payload size would no longer be a 
> problem. Host driver unloading would no longer be needed (in theory).

However I think you're mixing up a few things here. The idea of passing 
through USB devices is to let the guest handle it with its own drivers 
like it was connected directly to the virtual machine and not to emulate a 
USB device using host resources. If you want the latter then use 
usb-storage, usb-audio or similar. All that usb-host does is just 
forwarding the packets from guest to the physical device and let it talk 
to it and drive it without help from the host. (I may be wrong about the 
details, I haven't checked actual code but at least conceptually this 
should be the case.) If you have this scenario then you can easily see 
that both the host and guest driving the same USB device will not work. 
You should not try to mount a USB drive in guest that's already mounted by 
the host or you can't send audio from both the guest and the host at the 
same time without totally confusing the device and both drivers that don't 
expect this to ever happen. So for passing through the device you have to 
make sure the host does not try to access it while it's used by the guest.

If your guest does not have drivers for the device that you want to pass 
through that's a different problem. With pass through the guest is 
exclusively given the task of driving the device so it should have a 
driver for it. If the device does not work with the guest if you plug it 
in a physical machine then it won't work with pass through either. But the 
problem here is probably not that but the disagreement between USB speed 
between host and guest. If the guest does not have USB 2.0 then you can't 
pass through USB 2.0 devices unless downgrading them on the host as well 
in some way. So you either connect them to an USB 1 hub to match the 
emulated USB hardware in the guest or you need to emulate an USB 2 card in 
the guest and connect passed through devices to that. Did USB 2 cards 
exist for older G3/G4 Macs? Some PowerBooks had USB 2 ports, what hardware 
did those use? Could those be emulated in QEMU? These are separate 
problems though from getting the device freed from host drivers to avoid 
the problems with both guest and host accessing the device.

Regards,
BALATON Zoltan
--3866299591-267373550-1617751131=:1603--

