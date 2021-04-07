Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EB356307
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:27:40 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU0j5-0007f6-47
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lU0iE-0007FZ-Do
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 01:26:46 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lU0iC-0001r4-3P
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 01:26:46 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso4265080ooq.6
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 22:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=blCPNWQAfzvlFSA1pA1NTAyEVbKx2E5t3Q0FnJYuOCw=;
 b=QegU6FnAVELOMWWAx9vA6azm8+a1Fjn9+HynSAjQtbRGb7CPqmGQ8N6g3aE4wve6te
 OWLQmuiEybx0bNuhaasEPp2hJB77R41HXGhMSoJH49A6mMDy9B06TBAlwzEVhzvoXBRX
 l9RKGdqITwxz07K/cBBw6VVgaML31d0VGbcD9PngwVYG4XVvkMmbtx8vo3TfwEjLiYY4
 DAfo2vulEm9qvMozXHlE/5wnefd83OrNg1kgKcBv9T25NzHCuVgeJk3oUHsA9qcR1yYk
 ajGdeUKYjaao9ft+tOCRXL8mhWlSIm7jWd3WMFEslyyc3ZWxaw6k1Qww/L1H3lwVkjqE
 lkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=blCPNWQAfzvlFSA1pA1NTAyEVbKx2E5t3Q0FnJYuOCw=;
 b=fPPeN9CrYcLWa1tdVw8H9UTdXvHG774uuHQ03wsc6s7zgnVL3Dv0ZV9tFm9D1BL3d5
 j987E4Py9rz0mdGrrbmEolDHF5/2FlyxWU2RyBVkFbO8hIa2bIoUf+0lwhGpGdNU6epp
 vEsio5C6N9JMr6ZeTfHlF+icWd30pqFr0z7sU3f03IdheWIXOSeWJHJiC0n04zZ5jmQp
 F3RvSErbZzxWH1QoefSRYUXnmIYaKUpYYJ71KbT9Iwl4uhUKswjayMGZK9YV/edZQ7aq
 RVeOLhS2lBPamT2g6MboBQS3qtu9jbQ7dFhob+t5RCY0SStw6S20AhcsN2Gz7v2Ojqet
 avhA==
X-Gm-Message-State: AOAM531elUuc8YlIiK7gIbQ/EnQO5+8j+4GOYb3QWDOyG11SjgBLh3YL
 1Xqj3JNYOOA0G0MF6ob2uhIATzgK7iEC9Myih/w=
X-Google-Smtp-Source: ABdhPJwOk5LRZdoW8KOKcVq7ffmP+XCfrmZo3UcuwwccRcH0VXLl8QiqXFO7lb2FrUkct/+7QRJThV1RQNTfuyg5+4w=
X-Received: by 2002:a4a:d24c:: with SMTP id e12mr1564123oos.73.1617773202391; 
 Tue, 06 Apr 2021 22:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
In-Reply-To: <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 7 Apr 2021 07:26:31 +0200
Message-ID: <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
Subject: Re: Mac OS real USB device support issue
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Apr 7, 2021 at 3:53 AM Programmingkid <programmingkidx@gmail.com> w=
rote:
>
>
>
> > On Apr 6, 2021, at 7:18 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >
> > On Tue, 6 Apr 2021, Programmingkid wrote:
> >>> On Apr 6, 2021, at 12:53 PM, BALATON Zoltan <balaton@eik.bme.hu> wrot=
e:
> >>> On Tue, 6 Apr 2021, Programmingkid wrote:
> >>>>> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra <hsp.cat7@gmail.com> =
wrote:
> >>>>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid <programmingkidx@gmai=
l.com> wrote:
> >>>>>>
> >>>>>> Hi Gerd,
> >>>>>>
> >>>>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 mach=
ine to test USB support. I am on Mac OS 11.1 and cannot make USB devices wo=
rk with any of my guests. So far these are the guests I have tested with:
> >>>>>>
> >>>>>> - Windows 7
> >>>>>> - Mac OS 9.2
> >>>>>> - Windows 2000
> >>>>>>
> >>>>>> I have tried using USB flash drives, USB sound cards, and an USB h=
eadset. They all show up under 'info usb', but cannot be used in the guest.=
 My setup does use a USB-C hub so I'm not sure if this is a bug with QEMU o=
r an issue with the hub. Would you have any information on this issue?
> >>>>>
> >>>>> Hi John,
> >>>>>
> >>>>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it do=
es
> >>>>> not support USB 2.0. I was successful only in passing through a USB
> >>>>> flash drive that was forced into USB 1.1 mode by connecting it to a
> >>>>> real USB 1.1 hub and unloading the kext it used.
> >>>>>
> >>>>> Best,
> >>>>> Howard
> >>>>
> >>>> Hi Howard, I was actually thinking about CC'ing you for this email. =
Glad you found it. Unloading kext files does not sound pleasant. Maybe ther=
e is some better way of doing it.
> >>>
> >>> In any case, until you make sure nothing tries to drive the device on=
 the host, passing it to a guest likely will fail because then two drivers =
from two OSes would try to access it simultaneously which likely creates a =
mess as the device and drivers don't expect this. So you can't just pass a =
device through that the host has recognised and is driving without somehow =
getting the host to leave it alone first before you can pass it through. Un=
loading the driver is one way to do that (although it probably breaks all o=
ther similar devices too). Maybe there's another way to unbind a device fro=
m the host such as ejecting it first but then I'm not sure if the low level=
 USB needed for accessing the device still works after that or it's complet=
ely forgotten. There's probably a doc somewhere that describes how it works=
 and how can you plug a device without also getting higher level drivers to=
 load or if there's no official ways for that then you'll need to do some c=
onfiguration on the host t
> > o avoid it grabbing devices that you want to pass through. On Linux you=
 can add an udev rule to ignore the device (maybe also adding TAG+=3D"uacce=
ss" to allow console users to use it without needing root access) but not s=
ure how USB works on macOS.
> >>>
> >>> Regards,
> >>> BALATON Zoltan
> >>
> >> Being able to dissociate a real USB device from its Mac OS driver woul=
d be very useful in this situation. IOKit might be one place to look for su=
ch a feature. The Mach kernel documentation is another place that might hav=
e what we want.
> >
> > Those might be a good place to start. IOKit provides the drivers and al=
so the io registry which is probably where you can get if a driver is bound=
 to a device and which one is it. How to dissociate the driver from the dev=
ice though I don't know.
>
> https://developer.apple.com/library/archive/documentation/DeviceDrivers/C=
onceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
> According to this article a driver has a stop() and detach() method that =
is called by the IOKit to remove a device. I'm thinking QEMU can be the one=
 that calls these methods for a certain device.
>
> >
> >> I have one theory. What if we introduce a middleman. A pseudo-USB devi=
ce that the guest operating system could apply its configuration data to an=
d will also talk directly with to the real USB device.
> >> So this:
> >>
> >> USB device <-> Host <-> QEMU USB middleman <-> Guest
> >
> > Isn't this middleman the QEMU usb-host device that we already have?
>
> It could be. I need to research this issue some more.
>
> >
> >> This could make USB 2.0 and 3.0 flash drives compatible with an older =
operating system like Mac OS 9. The USB middleman could fully accept Mac OS=
 9's configuration and make it think it is talking to a USB 1.1 device. Par=
ameters like data packet payload size would no longer be a problem. Host dr=
iver unloading would no longer be needed (in theory).
> >
> > However I think you're mixing up a few things here. The idea of passing=
 through USB devices is to let the guest handle it with its own drivers lik=
e it was connected directly to the virtual machine and not to emulate a USB=
 device using host resources. If you want the latter then use usb-storage, =
usb-audio or similar. All that usb-host does is just forwarding the packets=
 from guest to the physical device and let it talk to it and drive it witho=
ut help from the host. (I may be wrong about the details, I haven't checked=
 actual code but at least conceptually this should be the case.) If you hav=
e this scenario then you can easily see that both the host and guest drivin=
g the same USB device will not work. You should not try to mount a USB driv=
e in guest that's already mounted by the host or you can't send audio from =
both the guest and the host at the same time without totally confusing the =
device and both drivers that don't expect this to ever happen. So for passi=
ng through the device you have to make sure the host does not try to access=
 it while it's used by the guest.
>
> This clarifies things on my part.
>
> >
> > If your guest does not have drivers for the device that you want to pas=
s through that's a different problem. With pass through the guest is exclus=
ively given the task of driving the device so it should have a driver for i=
t. If the device does not work with the guest if you plug it in a physical =
machine then it won't work with pass through either. But the problem here i=
s probably not that but the disagreement between USB speed between host and=
 guest. If the guest does not have USB 2.0 then you can't pass through USB =
2.0 devices unless downgrading them on the host as well in some way. So you=
 either connect them to an USB 1 hub to match the emulated USB hardware in =
the guest or you need to emulate an USB 2 card in the guest and connect pas=
sed through devices to that. Did USB 2 cards exist for older G3/G4 Macs?
>
> Yes. I upgraded a friend's PowerMac G4 with such a card.
>
> > Some PowerBooks had USB 2 ports, what hardware did those use?
>
> I'm assuming it was the G4 PowerBooks.
>
> > Could those be emulated in QEMU?
>
> The PowerMac already is.
>
> > These are separate problems though from getting the device freed from h=
ost drivers to avoid the problems with both guest and host accessing the de=
vice.
>
> Thank you again for the help.
>
> I think a simple algorithm would be
> 1) find out if a host driver is already using a real USB device.
> 2) If it is call that driver's stop() and detach() methods for only that =
USB device (other devices should not be effected).
> 3) Let the guest start using the USB device.
>
>

This is what Gerd wrote about the USB 1.1 -> USB 2.0 issue:

"Problem is when the device is plugged into a usb2 port you can't query
the usb1 descriptors.  So qemu presents the wrong descriptors to the
guest in case host and guest use different usb speeds.  That may or may
not work ...

The other way around is less problematic, when plugging a usb2 device
into a usb3-capable (xhci) port I can tell the guest "this is a usb2
device".  But reporting "this is a usb2 device" via ohci isn't going to
fly for obvious reasons ..."

So then I forced my device it into USB 1.1 mode by attaching it to a
real 1.1 hub. The qemu hub will not do this for you. Mac OS and Mac OS
X guests up to 10.2.8 do not have USB 2.0 support, but from 10.2.8
upwards you can use the ehci hub. This works for a simple usb storage
device that uses the usbstorage kext in macOS. Indeed, as Zoltan
wrote, unloading a kext for a device that has its class driver loaded,
one looses access to other devices that match too. Reboot time ;-)

There used to be a solution by creating an empty kext that loaded with
higher priority compared to the standard kexts. I don't know whether
that solution could still work with Apple putting new requirements on
kext loading. I believe unloading a kext requires disabling SIP. Sudo
won't do anymore from Catalina upwards.

I gather Qemu is currenty relying on libusb to do the heavy lifting.
For Linux that seems OK together with perhaps first unbinding a
driver, but for macOS and Windows hosts the unbinding does not work.

Here is some discussion on how to create an empty kext:
https://github.com/libusb/libusb/issues/158#issuecomment-190582178

Best,
Howard

