Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194683569C0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 12:34:12 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU5Vj-0002la-22
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 06:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lU5Oy-0005ns-4L
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:27:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:47468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lU5Os-00065A-2K
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 06:27:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AEF587462E0;
 Wed,  7 Apr 2021 12:27:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 851737462D6; Wed,  7 Apr 2021 12:27:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 835237456B4;
 Wed,  7 Apr 2021 12:27:00 +0200 (CEST)
Date: Wed, 7 Apr 2021 12:27:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Mac OS real USB device support issue
In-Reply-To: <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
Message-ID: <2ad99672-442b-a64b-dec-2fe3c027effd@eik.bme.hu>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
 <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021, Howard Spoelstra wrote:
> On Wed, Apr 7, 2021 at 7:26 AM Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>> On Wed, Apr 7, 2021 at 3:53 AM Programmingkid <programmingkidx@gmail.com> wrote:
>>>> On Apr 6, 2021, at 7:18 PM, BALATON Zoltan <balaton@eik.bme.hu> 
>>>> wrote: Those might be a good place to start. IOKit provides the 
>>>> drivers and also the io registry which is probably where you can get 
>>>> if a driver is bound to a device and which one is it. How to 
>>>> dissociate the driver from the device though I don't know.
>>>
>>> https://developer.apple.com/library/archive/documentation/DeviceDrivers/Conceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
>>> According to this article a driver has a stop() and detach() method 
>>> that is called by the IOKit to remove a device. I'm thinking QEMU can 
>>> be the one that calls these methods for a certain device.

I think drivers are managed by IOKit so QEMU should and probably could not 
call driver methods directly. There should be some upper management layer 
to control this that you should talk to instead.

>>>> guest and connect passed through devices to that. Did USB 2 cards 
>>>> exist for older G3/G4 Macs?
>>>
>>> Yes. I upgraded a friend's PowerMac G4 with such a card.
>>>
>>>> Some PowerBooks had USB 2 ports, what hardware did those use?
>>>
>>> I'm assuming it was the G4 PowerBooks.
>>>
>>>> Could those be emulated in QEMU?
>>>
>>> The PowerMac already is.

The PowerMacs don't have USB2, only USB1 I think and as Howard wrote MacOS 
does not have drivers either so you'd need to emulate the USB2 card and 
probably also need its driver from the FCode ROM on it or a new enough Mac 
OS X with USB2 drivers. Or pass through devices as USB1 but then you may 
need to somehow downgrade them to that level on the host for which using a 
USB1 only hub seems to work and as Howard found the hub in older Apple 
keyboards work for that.

>> This is what Gerd wrote about the USB 1.1 -> USB 2.0 issue:
>>
>> "Problem is when the device is plugged into a usb2 port you can't query
>> the usb1 descriptors.  So qemu presents the wrong descriptors to the
>> guest in case host and guest use different usb speeds.  That may or may
>> not work ...
>>
>> The other way around is less problematic, when plugging a usb2 device
>> into a usb3-capable (xhci) port I can tell the guest "this is a usb2
>> device".  But reporting "this is a usb2 device" via ohci isn't going to
>> fly for obvious reasons ..."
>>
>> So then I forced my device it into USB 1.1 mode by attaching it to a
>> real 1.1 hub. The qemu hub will not do this for you. Mac OS and Mac OS
>> X guests up to 10.2.8 do not have USB 2.0 support, but from 10.2.8
>> upwards you can use the ehci hub. This works for a simple usb storage
>> device that uses the usbstorage kext in macOS. Indeed, as Zoltan
>> wrote, unloading a kext for a device that has its class driver loaded,
>> one looses access to other devices that match too. Reboot time ;-)
>>
>> There used to be a solution by creating an empty kext that loaded with
>> higher priority compared to the standard kexts. I don't know whether
>> that solution could still work with Apple putting new requirements on
>> kext loading. I believe unloading a kext requires disabling SIP. Sudo
>> won't do anymore from Catalina upwards.
>>
>> I gather Qemu is currenty relying on libusb to do the heavy lifting.
>> For Linux that seems OK together with perhaps first unbinding a
>> driver, but for macOS and Windows hosts the unbinding does not work.
>>
>> Here is some discussion on how to create an empty kext:
>> https://github.com/libusb/libusb/issues/158#issuecomment-190582178
>>
>> Best,
>> Howard
>
> And this:
> https://github.com/libusb/libusb/issues/906

That sounds like it could be what's needed, I haven't read it in detail 
but somebody could try to make a patch based on this info and test it if 
it still works with latest macOS.

Regards,
BALATON Zoltan

