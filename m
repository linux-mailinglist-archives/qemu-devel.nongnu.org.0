Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A768435630C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:30:29 +0200 (CEST)
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU0lo-0000F2-KT
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lU0kD-0008Dr-Tx
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 01:28:50 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lU0kB-0002yL-7A
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 01:28:49 -0400
Received: by mail-oi1-x22e.google.com with SMTP id n8so17568019oie.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 22:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kTZenhE3KzAYt6k3z1FX/8JzKG9im/uSg61EG0wI9Hw=;
 b=AGTDp5EICDsJ3FSOMn1O2Bnkgl18IOjG6KolM36me862RdtIo7ChSbXsdkfaFBLKe0
 SeHGrd39ooDK04kOeCtOSyGbMbTVNB/HeWwoeLD2t4j6VarUTWHF1ePjVpygnhtf03T1
 jEuW1FF/iNzYFfsqmZqGwAO7JURPczzcxXLuMXcVc1leZRVJ176349sYl2SvaxM8UiCI
 zO58dqAOUTl89ZhiVIKs+6YhU0Zp2NBkBQW01pE9gnZShKkOKm4Itv2ba6qj4729zOEr
 aTKgyyyqxTWz+Dfv7y/mocXET4PLLEx9i+q2I+PoMMaSZNzPxBQa3RYOTFX4uqgkMdYT
 p86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kTZenhE3KzAYt6k3z1FX/8JzKG9im/uSg61EG0wI9Hw=;
 b=NMkYIGYfYzBZfZbRecEhq28QnTE4dRNnmNF/dVRtgpI+BlAzpC3DbLePC0gqF4awdS
 +T64KJ0EHYlueHHLoZF1wuB6+ctDK7RkF5XQVUz0N63+qgaE7LzEUcDcK8koEpM+bQ2H
 HmJCpE2vE3IcuQ2A+nv72/635XrEldSLZh2tB5tfo+NxUpWoYJbSJcvjSHV05TMwp1yS
 pif2anzeYUQrxrVNqfDbDvpRn+V9YiNQhhS0FXibsquScmunlhQ+pUt3zs2cCDITCmhy
 CN3bA1kX5rYE/zXyqO2fnQ8l7GzT4mz4PG1KgV8gNXb2NKtKkonZCFZv2QqU1eNq9toA
 xwZQ==
X-Gm-Message-State: AOAM5321If4KlWZ/DWukn1Hc+Ou3swiB1p3wxdbMvJgG9DpJ+wkZoneY
 kdZgTfZmWq8EpAxOlffoH7EeTexEf1nR0FjTsjM=
X-Google-Smtp-Source: ABdhPJwXPqtfKyMAoNf43A8E/MHOo+Vu4MaX4E33soINHBzqIM6qJK1cpKKhH2C/CD5wkK/4Rqmi8Ni9C/lmEkcmn2Q=
X-Received: by 2002:a05:6808:f12:: with SMTP id
 m18mr1023731oiw.62.1617773323531; 
 Tue, 06 Apr 2021 22:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
In-Reply-To: <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 7 Apr 2021 07:28:32 +0200
Message-ID: <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
Subject: Re: Mac OS real USB device support issue
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x22e.google.com
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

On Wed, Apr 7, 2021 at 7:26 AM Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>
> On Wed, Apr 7, 2021 at 3:53 AM Programmingkid <programmingkidx@gmail.com>=
 wrote:
> >
> >
> >
> > > On Apr 6, 2021, at 7:18 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote=
:
> > >
> > > On Tue, 6 Apr 2021, Programmingkid wrote:
> > >>> On Apr 6, 2021, at 12:53 PM, BALATON Zoltan <balaton@eik.bme.hu> wr=
ote:
> > >>> On Tue, 6 Apr 2021, Programmingkid wrote:
> > >>>>> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra <hsp.cat7@gmail.com=
> wrote:
> > >>>>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid <programmingkidx@gm=
ail.com> wrote:
> > >>>>>>
> > >>>>>> Hi Gerd,
> > >>>>>>
> > >>>>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 ma=
chine to test USB support. I am on Mac OS 11.1 and cannot make USB devices =
work with any of my guests. So far these are the guests I have tested with:
> > >>>>>>
> > >>>>>> - Windows 7
> > >>>>>> - Mac OS 9.2
> > >>>>>> - Windows 2000
> > >>>>>>
> > >>>>>> I have tried using USB flash drives, USB sound cards, and an USB=
 headset. They all show up under 'info usb', but cannot be used in the gues=
t. My setup does use a USB-C hub so I'm not sure if this is a bug with QEMU=
 or an issue with the hub. Would you have any information on this issue?
> > >>>>>
> > >>>>> Hi John,
> > >>>>>
> > >>>>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it =
does
> > >>>>> not support USB 2.0. I was successful only in passing through a U=
SB
> > >>>>> flash drive that was forced into USB 1.1 mode by connecting it to=
 a
> > >>>>> real USB 1.1 hub and unloading the kext it used.
> > >>>>>
> > >>>>> Best,
> > >>>>> Howard
> > >>>>
> > >>>> Hi Howard, I was actually thinking about CC'ing you for this email=
. Glad you found it. Unloading kext files does not sound pleasant. Maybe th=
ere is some better way of doing it.
> > >>>
> > >>> In any case, until you make sure nothing tries to drive the device =
on the host, passing it to a guest likely will fail because then two driver=
s from two OSes would try to access it simultaneously which likely creates =
a mess as the device and drivers don't expect this. So you can't just pass =
a device through that the host has recognised and is driving without someho=
w getting the host to leave it alone first before you can pass it through. =
Unloading the driver is one way to do that (although it probably breaks all=
 other similar devices too). Maybe there's another way to unbind a device f=
rom the host such as ejecting it first but then I'm not sure if the low lev=
el USB needed for accessing the device still works after that or it's compl=
etely forgotten. There's probably a doc somewhere that describes how it wor=
ks and how can you plug a device without also getting higher level drivers =
to load or if there's no official ways for that then you'll need to do some=
 configuration on the host t
> > > o avoid it grabbing devices that you want to pass through. On Linux y=
ou can add an udev rule to ignore the device (maybe also adding TAG+=3D"uac=
cess" to allow console users to use it without needing root access) but not=
 sure how USB works on macOS.
> > >>>
> > >>> Regards,
> > >>> BALATON Zoltan
> > >>
> > >> Being able to dissociate a real USB device from its Mac OS driver wo=
uld be very useful in this situation. IOKit might be one place to look for =
such a feature. The Mach kernel documentation is another place that might h=
ave what we want.
> > >
> > > Those might be a good place to start. IOKit provides the drivers and =
also the io registry which is probably where you can get if a driver is bou=
nd to a device and which one is it. How to dissociate the driver from the d=
evice though I don't know.
> >
> > https://developer.apple.com/library/archive/documentation/DeviceDrivers=
/Conceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
> > According to this article a driver has a stop() and detach() method tha=
t is called by the IOKit to remove a device. I'm thinking QEMU can be the o=
ne that calls these methods for a certain device.
> >
> > >
> > >> I have one theory. What if we introduce a middleman. A pseudo-USB de=
vice that the guest operating system could apply its configuration data to =
and will also talk directly with to the real USB device.
> > >> So this:
> > >>
> > >> USB device <-> Host <-> QEMU USB middleman <-> Guest
> > >
> > > Isn't this middleman the QEMU usb-host device that we already have?
> >
> > It could be. I need to research this issue some more.
> >
> > >
> > >> This could make USB 2.0 and 3.0 flash drives compatible with an olde=
r operating system like Mac OS 9. The USB middleman could fully accept Mac =
OS 9's configuration and make it think it is talking to a USB 1.1 device. P=
arameters like data packet payload size would no longer be a problem. Host =
driver unloading would no longer be needed (in theory).
> > >
> > > However I think you're mixing up a few things here. The idea of passi=
ng through USB devices is to let the guest handle it with its own drivers l=
ike it was connected directly to the virtual machine and not to emulate a U=
SB device using host resources. If you want the latter then use usb-storage=
, usb-audio or similar. All that usb-host does is just forwarding the packe=
ts from guest to the physical device and let it talk to it and drive it wit=
hout help from the host. (I may be wrong about the details, I haven't check=
ed actual code but at least conceptually this should be the case.) If you h=
ave this scenario then you can easily see that both the host and guest driv=
ing the same USB device will not work. You should not try to mount a USB dr=
ive in guest that's already mounted by the host or you can't send audio fro=
m both the guest and the host at the same time without totally confusing th=
e device and both drivers that don't expect this to ever happen. So for pas=
sing through the device you have to make sure the host does not try to acce=
ss it while it's used by the guest.
> >
> > This clarifies things on my part.
> >
> > >
> > > If your guest does not have drivers for the device that you want to p=
ass through that's a different problem. With pass through the guest is excl=
usively given the task of driving the device so it should have a driver for=
 it. If the device does not work with the guest if you plug it in a physica=
l machine then it won't work with pass through either. But the problem here=
 is probably not that but the disagreement between USB speed between host a=
nd guest. If the guest does not have USB 2.0 then you can't pass through US=
B 2.0 devices unless downgrading them on the host as well in some way. So y=
ou either connect them to an USB 1 hub to match the emulated USB hardware i=
n the guest or you need to emulate an USB 2 card in the guest and connect p=
assed through devices to that. Did USB 2 cards exist for older G3/G4 Macs?
> >
> > Yes. I upgraded a friend's PowerMac G4 with such a card.
> >
> > > Some PowerBooks had USB 2 ports, what hardware did those use?
> >
> > I'm assuming it was the G4 PowerBooks.
> >
> > > Could those be emulated in QEMU?
> >
> > The PowerMac already is.
> >
> > > These are separate problems though from getting the device freed from=
 host drivers to avoid the problems with both guest and host accessing the =
device.
> >
> > Thank you again for the help.
> >
> > I think a simple algorithm would be
> > 1) find out if a host driver is already using a real USB device.
> > 2) If it is call that driver's stop() and detach() methods for only tha=
t USB device (other devices should not be effected).
> > 3) Let the guest start using the USB device.
> >
> >
>
> This is what Gerd wrote about the USB 1.1 -> USB 2.0 issue:
>
> "Problem is when the device is plugged into a usb2 port you can't query
> the usb1 descriptors.  So qemu presents the wrong descriptors to the
> guest in case host and guest use different usb speeds.  That may or may
> not work ...
>
> The other way around is less problematic, when plugging a usb2 device
> into a usb3-capable (xhci) port I can tell the guest "this is a usb2
> device".  But reporting "this is a usb2 device" via ohci isn't going to
> fly for obvious reasons ..."
>
> So then I forced my device it into USB 1.1 mode by attaching it to a
> real 1.1 hub. The qemu hub will not do this for you. Mac OS and Mac OS
> X guests up to 10.2.8 do not have USB 2.0 support, but from 10.2.8
> upwards you can use the ehci hub. This works for a simple usb storage
> device that uses the usbstorage kext in macOS. Indeed, as Zoltan
> wrote, unloading a kext for a device that has its class driver loaded,
> one looses access to other devices that match too. Reboot time ;-)
>
> There used to be a solution by creating an empty kext that loaded with
> higher priority compared to the standard kexts. I don't know whether
> that solution could still work with Apple putting new requirements on
> kext loading. I believe unloading a kext requires disabling SIP. Sudo
> won't do anymore from Catalina upwards.
>
> I gather Qemu is currenty relying on libusb to do the heavy lifting.
> For Linux that seems OK together with perhaps first unbinding a
> driver, but for macOS and Windows hosts the unbinding does not work.
>
> Here is some discussion on how to create an empty kext:
> https://github.com/libusb/libusb/issues/158#issuecomment-190582178
>
> Best,
> Howard

And this:
https://github.com/libusb/libusb/issues/906

