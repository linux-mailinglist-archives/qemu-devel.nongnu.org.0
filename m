Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21735A73A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 21:39:39 +0200 (CEST)
Received: from localhost ([::1]:57942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUwyf-0005AF-JT
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 15:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lUwws-0004CL-3z
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:37:46 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:45933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lUwwp-0003ws-Ft
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 15:37:45 -0400
Received: by mail-qk1-x733.google.com with SMTP id q3so6970211qkq.12
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 12:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yEohfdgOGE2s845Y9Zx9Bs0dGwJbMdQskaj9i+7J7xw=;
 b=jQ9zsG6S138Tnn9QR6U8fKOlDeXmjsHOQnAfuOaSNOjQLJ7yPoHIPjBqZSaeQF/KNl
 ljIdOA3gIHdqaNCVIpKR6oMvmivy3c9TSoTX9mOQ2X8rLVsoHwSjl4gdXUOboSOZlq9/
 +NCMNxhFsedaqFHu55ahYCYpjO+AwOCbqjrYdwtLKGSlhF1WwZl0s2xpgoHRLfEzOZFT
 fJZzz6eit4N6+fCufaR9Iv/CuUGI/IzozfuJrcG4jFGlMQV2nDPwN8K2GFr33VWNMNuo
 RaU39nPjgkJQicXJOSYIQcyzjb0DJtWtPZru0QxgKtLScGb/dEXYbOm5v1P+/73obK5I
 1d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yEohfdgOGE2s845Y9Zx9Bs0dGwJbMdQskaj9i+7J7xw=;
 b=Hb5k1G4+EFW1JwCsO95oLeZOGF4KiHXIP2qmvpqWENBnpoboXWSb/uqvq4YMoSwIDR
 31XdG6RCx9CZ/cWj2tIFCQMEkGIGE7FT+27cGsdiCuqIW2QH2Q7V4cgadFUaK1+CNC8x
 BNJ4yb4/HDG6Zo+ifVt8ZifXWD3rmnT0KNjUROoYXtPchiSltBmU4BmO01tsJ77SJuhT
 qTvG6lfY8gkH66mSDafsV9LtNlTkfq2YYk2zD7ZCzKtbRk3hoJsznORTSC9seZloaDjM
 EC3Yksff5O50bnlMmxTkCX3NBuLU65Vzro4dI/ovJwsAFsGzZF6EUBwfTcXXBsspG7Vn
 q6IQ==
X-Gm-Message-State: AOAM53168f8tVq09rTcrFZK7KmX7VmhfBcR/ri2pi7RCynmeWY0axdbp
 +BUPSqEC4BNQJRsO2QUOUiOekUYUrs4=
X-Google-Smtp-Source: ABdhPJx2zzHi1+7qV92dIKoMpYP804H2gwnbtuabfF3UyYT7i+FzPC2Dxm/4no1ItIuFcH6oe1/gmA==
X-Received: by 2002:a05:620a:13b4:: with SMTP id
 m20mr15373370qki.24.1617997062033; 
 Fri, 09 Apr 2021 12:37:42 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id u21sm2515209qtq.11.2021.04.09.12.37.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Apr 2021 12:37:41 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
Date: Fri, 9 Apr 2021 15:37:40 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6C716CC-E058-4C70-A06F-FC0655516A1D@gmail.com>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
 <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 7, 2021, at 1:28 AM, Howard Spoelstra <hsp.cat7@gmail.com> =
wrote:
>=20
> On Wed, Apr 7, 2021 at 7:26 AM Howard Spoelstra <hsp.cat7@gmail.com> =
wrote:
>>=20
>> On Wed, Apr 7, 2021 at 3:53 AM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>>=20
>>>=20
>>>=20
>>>> On Apr 6, 2021, at 7:18 PM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>>>>=20
>>>> On Tue, 6 Apr 2021, Programmingkid wrote:
>>>>>> On Apr 6, 2021, at 12:53 PM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>>>>>> On Tue, 6 Apr 2021, Programmingkid wrote:
>>>>>>>> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra =
<hsp.cat7@gmail.com> wrote:
>>>>>>>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>>>>>>>>=20
>>>>>>>>> Hi Gerd,
>>>>>>>>>=20
>>>>>>>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 =
machine to test USB support. I am on Mac OS 11.1 and cannot make USB =
devices work with any of my guests. So far these are the guests I have =
tested with:
>>>>>>>>>=20
>>>>>>>>> - Windows 7
>>>>>>>>> - Mac OS 9.2
>>>>>>>>> - Windows 2000
>>>>>>>>>=20
>>>>>>>>> I have tried using USB flash drives, USB sound cards, and an =
USB headset. They all show up under 'info usb', but cannot be used in =
the guest. My setup does use a USB-C hub so I'm not sure if this is a =
bug with QEMU or an issue with the hub. Would you have any information =
on this issue?
>>>>>>>>=20
>>>>>>>> Hi John,
>>>>>>>>=20
>>>>>>>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, =
it does
>>>>>>>> not support USB 2.0. I was successful only in passing through a =
USB
>>>>>>>> flash drive that was forced into USB 1.1 mode by connecting it =
to a
>>>>>>>> real USB 1.1 hub and unloading the kext it used.
>>>>>>>>=20
>>>>>>>> Best,
>>>>>>>> Howard
>>>>>>>=20
>>>>>>> Hi Howard, I was actually thinking about CC'ing you for this =
email. Glad you found it. Unloading kext files does not sound pleasant. =
Maybe there is some better way of doing it.
>>>>>>=20
>>>>>> In any case, until you make sure nothing tries to drive the =
device on the host, passing it to a guest likely will fail because then =
two drivers from two OSes would try to access it simultaneously which =
likely creates a mess as the device and drivers don't expect this. So =
you can't just pass a device through that the host has recognised and is =
driving without somehow getting the host to leave it alone first before =
you can pass it through. Unloading the driver is one way to do that =
(although it probably breaks all other similar devices too). Maybe =
there's another way to unbind a device from the host such as ejecting it =
first but then I'm not sure if the low level USB needed for accessing =
the device still works after that or it's completely forgotten. There's =
probably a doc somewhere that describes how it works and how can you =
plug a device without also getting higher level drivers to load or if =
there's no official ways for that then you'll need to do some =
configuration on the host t
>>>> o avoid it grabbing devices that you want to pass through. On Linux =
you can add an udev rule to ignore the device (maybe also adding =
TAG+=3D"uaccess" to allow console users to use it without needing root =
access) but not sure how USB works on macOS.
>>>>>>=20
>>>>>> Regards,
>>>>>> BALATON Zoltan
>>>>>=20
>>>>> Being able to dissociate a real USB device from its Mac OS driver =
would be very useful in this situation. IOKit might be one place to look =
for such a feature. The Mach kernel documentation is another place that =
might have what we want.
>>>>=20
>>>> Those might be a good place to start. IOKit provides the drivers =
and also the io registry which is probably where you can get if a driver =
is bound to a device and which one is it. How to dissociate the driver =
from the device though I don't know.
>>>=20
>>> =
https://developer.apple.com/library/archive/documentation/DeviceDrivers/Co=
nceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
>>> According to this article a driver has a stop() and detach() method =
that is called by the IOKit to remove a device. I'm thinking QEMU can be =
the one that calls these methods for a certain device.
>>>=20
>>>>=20
>>>>> I have one theory. What if we introduce a middleman. A pseudo-USB =
device that the guest operating system could apply its configuration =
data to and will also talk directly with to the real USB device.
>>>>> So this:
>>>>>=20
>>>>> USB device <-> Host <-> QEMU USB middleman <-> Guest
>>>>=20
>>>> Isn't this middleman the QEMU usb-host device that we already have?
>>>=20
>>> It could be. I need to research this issue some more.
>>>=20
>>>>=20
>>>>> This could make USB 2.0 and 3.0 flash drives compatible with an =
older operating system like Mac OS 9. The USB middleman could fully =
accept Mac OS 9's configuration and make it think it is talking to a USB =
1.1 device. Parameters like data packet payload size would no longer be =
a problem. Host driver unloading would no longer be needed (in theory).
>>>>=20
>>>> However I think you're mixing up a few things here. The idea of =
passing through USB devices is to let the guest handle it with its own =
drivers like it was connected directly to the virtual machine and not to =
emulate a USB device using host resources. If you want the latter then =
use usb-storage, usb-audio or similar. All that usb-host does is just =
forwarding the packets from guest to the physical device and let it talk =
to it and drive it without help from the host. (I may be wrong about the =
details, I haven't checked actual code but at least conceptually this =
should be the case.) If you have this scenario then you can easily see =
that both the host and guest driving the same USB device will not work. =
You should not try to mount a USB drive in guest that's already mounted =
by the host or you can't send audio from both the guest and the host at =
the same time without totally confusing the device and both drivers that =
don't expect this to ever happen. So for passing through the device you =
have to make sure the host does not try to access it while it's used by =
the guest.
>>>=20
>>> This clarifies things on my part.
>>>=20
>>>>=20
>>>> If your guest does not have drivers for the device that you want to =
pass through that's a different problem. With pass through the guest is =
exclusively given the task of driving the device so it should have a =
driver for it. If the device does not work with the guest if you plug it =
in a physical machine then it won't work with pass through either. But =
the problem here is probably not that but the disagreement between USB =
speed between host and guest. If the guest does not have USB 2.0 then =
you can't pass through USB 2.0 devices unless downgrading them on the =
host as well in some way. So you either connect them to an USB 1 hub to =
match the emulated USB hardware in the guest or you need to emulate an =
USB 2 card in the guest and connect passed through devices to that. Did =
USB 2 cards exist for older G3/G4 Macs?
>>>=20
>>> Yes. I upgraded a friend's PowerMac G4 with such a card.
>>>=20
>>>> Some PowerBooks had USB 2 ports, what hardware did those use?
>>>=20
>>> I'm assuming it was the G4 PowerBooks.
>>>=20
>>>> Could those be emulated in QEMU?
>>>=20
>>> The PowerMac already is.
>>>=20
>>>> These are separate problems though from getting the device freed =
from host drivers to avoid the problems with both guest and host =
accessing the device.
>>>=20
>>> Thank you again for the help.
>>>=20
>>> I think a simple algorithm would be
>>> 1) find out if a host driver is already using a real USB device.
>>> 2) If it is call that driver's stop() and detach() methods for only =
that USB device (other devices should not be effected).
>>> 3) Let the guest start using the USB device.
>>>=20
>>>=20
>>=20
>> This is what Gerd wrote about the USB 1.1 -> USB 2.0 issue:
>>=20
>> "Problem is when the device is plugged into a usb2 port you can't =
query
>> the usb1 descriptors.  So qemu presents the wrong descriptors to the
>> guest in case host and guest use different usb speeds.  That may or =
may
>> not work ...
>>=20
>> The other way around is less problematic, when plugging a usb2 device
>> into a usb3-capable (xhci) port I can tell the guest "this is a usb2
>> device".  But reporting "this is a usb2 device" via ohci isn't going =
to
>> fly for obvious reasons ..."
>>=20
>> So then I forced my device it into USB 1.1 mode by attaching it to a
>> real 1.1 hub. The qemu hub will not do this for you. Mac OS and Mac =
OS
>> X guests up to 10.2.8 do not have USB 2.0 support, but from 10.2.8
>> upwards you can use the ehci hub. This works for a simple usb storage
>> device that uses the usbstorage kext in macOS. Indeed, as Zoltan
>> wrote, unloading a kext for a device that has its class driver =
loaded,
>> one looses access to other devices that match too. Reboot time ;-)
>>=20
>> There used to be a solution by creating an empty kext that loaded =
with
>> higher priority compared to the standard kexts. I don't know whether
>> that solution could still work with Apple putting new requirements on
>> kext loading. I believe unloading a kext requires disabling SIP. Sudo
>> won't do anymore from Catalina upwards.
>>=20
>> I gather Qemu is currenty relying on libusb to do the heavy lifting.
>> For Linux that seems OK together with perhaps first unbinding a
>> driver, but for macOS and Windows hosts the unbinding does not work.
>>=20
>> Here is some discussion on how to create an empty kext:
>> https://github.com/libusb/libusb/issues/158#issuecomment-190582178
>>=20
>> Best,
>> Howard
>=20
> And this:
> https://github.com/libusb/libusb/issues/906

Have you tried the proposed changes yet for libusb?=20


