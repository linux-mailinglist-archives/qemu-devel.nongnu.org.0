Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002735ABA6
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 09:29:40 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV83n-0000lr-2z
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 03:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lV82X-0008Jr-7B
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 03:28:21 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lV82U-0005HJ-K4
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 03:28:20 -0400
Received: by mail-oi1-x230.google.com with SMTP id l131so3127281oih.0
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 00:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iyoOXifb1Pp7ksqEtCJXc/qPsHz3d8rgnxXnn5CeOLs=;
 b=bGMY0OjmEwmSN26HTeSk8qW05Qn7XFhcAfs80IEhVp/4XOb8LtYpxzOrLctK2pFDRi
 c5DkJXVKss73GnlZiVpBVdQHjThxYKA2QBlGlE9TYavch7685NwpriHkocEqnkP5pwbC
 eCmLiDm7Tun+UBneUpgda4VSC7TIPiNdSD3X3NdRZAg/YVx6BcMBU5UecFzXC3EfXKHW
 5lR9hNfsYBrTOgspPxod7menXvchw/UGjzO1VM1OPOKaU71cKF/v4FxtrnYu7ysPT0x/
 AMFL3pl+6jsD7h3yr5cFtp2AL9/tvxCjxpQJDamL8zbwxLAj7F66JFvYqSLge04pp/VX
 6K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iyoOXifb1Pp7ksqEtCJXc/qPsHz3d8rgnxXnn5CeOLs=;
 b=NrZVc07AKxBpf0i514YM0he4lDSBWX9qfy2sxrEp+mtealREhWxTdAAVKIzRfirq+N
 8h704YlDwbif1ZKbhQwH0TKW5lViCW6KbqMnyxNey7BJasIS1Sum7gfkKgMLPp+y9OLE
 ca8iMYd5c753dolGxcP8XS014EunIEdywWRX8MYcjfhFjyKxFQrlldXyuPbnZBqicv41
 VinbyeD71NcN4lCdbjhgiLsNw1vxpf0EcKZ32jSUwHoLsR9sXhtPN0C3Bs9rqmSkcX+1
 umPrgNUnwv+cWFSSCu1hfdKhOifK+3i6akropmPEwUg87QcUhvKJSwBwum4aSKHHZQz9
 7tiQ==
X-Gm-Message-State: AOAM530/xOYlZqASqOdcLjJ0Y/ZW/H79ytJrxkK/K1IjhiwkJFmN9X2q
 /eTyrwMIDPdkIxJ2NMS7VRWsW2PLNG8nSZbLOLk=
X-Google-Smtp-Source: ABdhPJyIVulbVNCnO6sN4g/qiJXcWWZeE/ZKAAtItSugh2xcFGFrfe5+8CgKoBt4qUS2fkmT3Y18rzWNK+JxNajEjz4=
X-Received: by 2002:a05:6808:b3b:: with SMTP id
 t27mr12518474oij.131.1618039696700; 
 Sat, 10 Apr 2021 00:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
 <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
 <F6C716CC-E058-4C70-A06F-FC0655516A1D@gmail.com>
In-Reply-To: <F6C716CC-E058-4C70-A06F-FC0655516A1D@gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sat, 10 Apr 2021 09:28:04 +0200
Message-ID: <CABLmASEPFVDejmfJw-Ak1_veREySYv8F-+ZKW_S2cDsEbfu7Gg@mail.gmail.com>
Subject: Re: Mac OS real USB device support issue
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x230.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, Gerd Hoffmann <gerd@kraxel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 9, 2021 at 9:37 PM Programmingkid <programmingkidx@gmail.com> w=
rote:
>
>
>
> > On Apr 7, 2021, at 1:28 AM, Howard Spoelstra <hsp.cat7@gmail.com> wrote=
:
> >
> > On Wed, Apr 7, 2021 at 7:26 AM Howard Spoelstra <hsp.cat7@gmail.com> wr=
ote:
> >>
> >> On Wed, Apr 7, 2021 at 3:53 AM Programmingkid <programmingkidx@gmail.c=
om> wrote:
> >>>
> >>>
> >>>
> >>>> On Apr 6, 2021, at 7:18 PM, BALATON Zoltan <balaton@eik.bme.hu> wrot=
e:
> >>>>
> >>>> On Tue, 6 Apr 2021, Programmingkid wrote:
> >>>>>> On Apr 6, 2021, at 12:53 PM, BALATON Zoltan <balaton@eik.bme.hu> w=
rote:
> >>>>>> On Tue, 6 Apr 2021, Programmingkid wrote:
> >>>>>>>> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra <hsp.cat7@gmail.co=
m> wrote:
> >>>>>>>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid <programmingkidx@g=
mail.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Hi Gerd,
> >>>>>>>>>
> >>>>>>>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 m=
achine to test USB support. I am on Mac OS 11.1 and cannot make USB devices=
 work with any of my guests. So far these are the guests I have tested with=
:
> >>>>>>>>>
> >>>>>>>>> - Windows 7
> >>>>>>>>> - Mac OS 9.2
> >>>>>>>>> - Windows 2000
> >>>>>>>>>
> >>>>>>>>> I have tried using USB flash drives, USB sound cards, and an US=
B headset. They all show up under 'info usb', but cannot be used in the gue=
st. My setup does use a USB-C hub so I'm not sure if this is a bug with QEM=
U or an issue with the hub. Would you have any information on this issue?
> >>>>>>>>
> >>>>>>>> Hi John,
> >>>>>>>>
> >>>>>>>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it=
 does
> >>>>>>>> not support USB 2.0. I was successful only in passing through a =
USB
> >>>>>>>> flash drive that was forced into USB 1.1 mode by connecting it t=
o a
> >>>>>>>> real USB 1.1 hub and unloading the kext it used.
> >>>>>>>>
> >>>>>>>> Best,
> >>>>>>>> Howard
> >>>>>>>
> >>>>>>> Hi Howard, I was actually thinking about CC'ing you for this emai=
l. Glad you found it. Unloading kext files does not sound pleasant. Maybe t=
here is some better way of doing it.
> >>>>>>
> >>>>>> In any case, until you make sure nothing tries to drive the device=
 on the host, passing it to a guest likely will fail because then two drive=
rs from two OSes would try to access it simultaneously which likely creates=
 a mess as the device and drivers don't expect this. So you can't just pass=
 a device through that the host has recognised and is driving without someh=
ow getting the host to leave it alone first before you can pass it through.=
 Unloading the driver is one way to do that (although it probably breaks al=
l other similar devices too). Maybe there's another way to unbind a device =
from the host such as ejecting it first but then I'm not sure if the low le=
vel USB needed for accessing the device still works after that or it's comp=
letely forgotten. There's probably a doc somewhere that describes how it wo=
rks and how can you plug a device without also getting higher level drivers=
 to load or if there's no official ways for that then you'll need to do som=
e configuration on the host t
> >>>> o avoid it grabbing devices that you want to pass through. On Linux =
you can add an udev rule to ignore the device (maybe also adding TAG+=3D"ua=
ccess" to allow console users to use it without needing root access) but no=
t sure how USB works on macOS.
> >>>>>>
> >>>>>> Regards,
> >>>>>> BALATON Zoltan
> >>>>>
> >>>>> Being able to dissociate a real USB device from its Mac OS driver w=
ould be very useful in this situation. IOKit might be one place to look for=
 such a feature. The Mach kernel documentation is another place that might =
have what we want.
> >>>>
> >>>> Those might be a good place to start. IOKit provides the drivers and=
 also the io registry which is probably where you can get if a driver is bo=
und to a device and which one is it. How to dissociate the driver from the =
device though I don't know.
> >>>
> >>> https://developer.apple.com/library/archive/documentation/DeviceDrive=
rs/Conceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
> >>> According to this article a driver has a stop() and detach() method t=
hat is called by the IOKit to remove a device. I'm thinking QEMU can be the=
 one that calls these methods for a certain device.
> >>>
> >>>>
> >>>>> I have one theory. What if we introduce a middleman. A pseudo-USB d=
evice that the guest operating system could apply its configuration data to=
 and will also talk directly with to the real USB device.
> >>>>> So this:
> >>>>>
> >>>>> USB device <-> Host <-> QEMU USB middleman <-> Guest
> >>>>
> >>>> Isn't this middleman the QEMU usb-host device that we already have?
> >>>
> >>> It could be. I need to research this issue some more.
> >>>
> >>>>
> >>>>> This could make USB 2.0 and 3.0 flash drives compatible with an old=
er operating system like Mac OS 9. The USB middleman could fully accept Mac=
 OS 9's configuration and make it think it is talking to a USB 1.1 device. =
Parameters like data packet payload size would no longer be a problem. Host=
 driver unloading would no longer be needed (in theory).
> >>>>
> >>>> However I think you're mixing up a few things here. The idea of pass=
ing through USB devices is to let the guest handle it with its own drivers =
like it was connected directly to the virtual machine and not to emulate a =
USB device using host resources. If you want the latter then use usb-storag=
e, usb-audio or similar. All that usb-host does is just forwarding the pack=
ets from guest to the physical device and let it talk to it and drive it wi=
thout help from the host. (I may be wrong about the details, I haven't chec=
ked actual code but at least conceptually this should be the case.) If you =
have this scenario then you can easily see that both the host and guest dri=
ving the same USB device will not work. You should not try to mount a USB d=
rive in guest that's already mounted by the host or you can't send audio fr=
om both the guest and the host at the same time without totally confusing t=
he device and both drivers that don't expect this to ever happen. So for pa=
ssing through the device you have to make sure the host does not try to acc=
ess it while it's used by the guest.
> >>>
> >>> This clarifies things on my part.
> >>>
> >>>>
> >>>> If your guest does not have drivers for the device that you want to =
pass through that's a different problem. With pass through the guest is exc=
lusively given the task of driving the device so it should have a driver fo=
r it. If the device does not work with the guest if you plug it in a physic=
al machine then it won't work with pass through either. But the problem her=
e is probably not that but the disagreement between USB speed between host =
and guest. If the guest does not have USB 2.0 then you can't pass through U=
SB 2.0 devices unless downgrading them on the host as well in some way. So =
you either connect them to an USB 1 hub to match the emulated USB hardware =
in the guest or you need to emulate an USB 2 card in the guest and connect =
passed through devices to that. Did USB 2 cards exist for older G3/G4 Macs?
> >>>
> >>> Yes. I upgraded a friend's PowerMac G4 with such a card.
> >>>
> >>>> Some PowerBooks had USB 2 ports, what hardware did those use?
> >>>
> >>> I'm assuming it was the G4 PowerBooks.
> >>>
> >>>> Could those be emulated in QEMU?
> >>>
> >>> The PowerMac already is.
> >>>
> >>>> These are separate problems though from getting the device freed fro=
m host drivers to avoid the problems with both guest and host accessing the=
 device.
> >>>
> >>> Thank you again for the help.
> >>>
> >>> I think a simple algorithm would be
> >>> 1) find out if a host driver is already using a real USB device.
> >>> 2) If it is call that driver's stop() and detach() methods for only t=
hat USB device (other devices should not be effected).
> >>> 3) Let the guest start using the USB device.
> >>>
> >>>
> >>
> >> This is what Gerd wrote about the USB 1.1 -> USB 2.0 issue:
> >>
> >> "Problem is when the device is plugged into a usb2 port you can't quer=
y
> >> the usb1 descriptors.  So qemu presents the wrong descriptors to the
> >> guest in case host and guest use different usb speeds.  That may or ma=
y
> >> not work ...
> >>
> >> The other way around is less problematic, when plugging a usb2 device
> >> into a usb3-capable (xhci) port I can tell the guest "this is a usb2
> >> device".  But reporting "this is a usb2 device" via ohci isn't going t=
o
> >> fly for obvious reasons ..."
> >>
> >> So then I forced my device it into USB 1.1 mode by attaching it to a
> >> real 1.1 hub. The qemu hub will not do this for you. Mac OS and Mac OS
> >> X guests up to 10.2.8 do not have USB 2.0 support, but from 10.2.8
> >> upwards you can use the ehci hub. This works for a simple usb storage
> >> device that uses the usbstorage kext in macOS. Indeed, as Zoltan
> >> wrote, unloading a kext for a device that has its class driver loaded,
> >> one looses access to other devices that match too. Reboot time ;-)
> >>
> >> There used to be a solution by creating an empty kext that loaded with
> >> higher priority compared to the standard kexts. I don't know whether
> >> that solution could still work with Apple putting new requirements on
> >> kext loading. I believe unloading a kext requires disabling SIP. Sudo
> >> won't do anymore from Catalina upwards.
> >>
> >> I gather Qemu is currenty relying on libusb to do the heavy lifting.
> >> For Linux that seems OK together with perhaps first unbinding a
> >> driver, but for macOS and Windows hosts the unbinding does not work.
> >>
> >> Here is some discussion on how to create an empty kext:
> >> https://github.com/libusb/libusb/issues/158#issuecomment-190582178
> >>
> >> Best,
> >> Howard
> >
> > And this:
> > https://github.com/libusb/libusb/issues/906
>
> Have you tried the proposed changes yet for libusb?
>

Hi,

Yes, I experimented with the current libusb from brew, the latest
libusb code from github and a patched version based on that. I
couldn't get a flash drive passed through with any of them. Running as
root made no difference. My Mojave host doesn't allow unloading the
kext loaded for the flash drive where Sierra allowed that, but then
that should be handled by the patches.

I'll link to the latest libusb and the patched version plus the
patches. I guess it will not work on your host, but you might be able
to persuade qemu to use them by using
install_name_tool -change /usr/local/opt/libusb/lib/libusb-1.0.0.dylib
@executable_path/libusb-1.0.0-latest.dylib qemu-system-ppc

I'll also include the patches, libusb is easily built.
https://surfdrive.surf.nl/files/index.php/s/Qs0rtTVe2qIudw4/download

Best,
Howard

