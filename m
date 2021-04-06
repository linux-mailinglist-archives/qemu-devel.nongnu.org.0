Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EDD3559D0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 18:57:29 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTp16-0005yx-U4
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 12:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lToxW-0004Mr-DN
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:53:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:25713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lToxS-00077P-W8
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 12:53:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B110D7456E3;
 Tue,  6 Apr 2021 18:53:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8F0807456B7; Tue,  6 Apr 2021 18:53:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8D6F77456B4;
 Tue,  6 Apr 2021 18:53:37 +0200 (CEST)
Date: Tue, 6 Apr 2021 18:53:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Mac OS real USB device support issue
In-Reply-To: <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
Message-ID: <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
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

On Tue, 6 Apr 2021, Programmingkid wrote:
>> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid <programmingkidx@gmail.com> wrote:
>>>
>>> Hi Gerd,
>>>
>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 machine to test USB support. I am on Mac OS 11.1 and cannot make USB devices work with any of my guests. So far these are the guests I have tested with:
>>>
>>> - Windows 7
>>> - Mac OS 9.2
>>> - Windows 2000
>>>
>>> I have tried using USB flash drives, USB sound cards, and an USB headset. They all show up under 'info usb', but cannot be used in the guest. My setup does use a USB-C hub so I'm not sure if this is a bug with QEMU or an issue with the hub. Would you have any information on this issue?
>>
>> Hi John,
>>
>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it does
>> not support USB 2.0. I was successful only in passing through a USB
>> flash drive that was forced into USB 1.1 mode by connecting it to a
>> real USB 1.1 hub and unloading the kext it used.
>>
>> Best,
>> Howard
>
> Hi Howard, I was actually thinking about CC'ing you for this email. Glad 
> you found it. Unloading kext files does not sound pleasant. Maybe there 
> is some better way of doing it.

In any case, until you make sure nothing tries to drive the device on the 
host, passing it to a guest likely will fail because then two drivers from 
two OSes would try to access it simultaneously which likely creates a mess 
as the device and drivers don't expect this. So you can't just pass a 
device through that the host has recognised and is driving without somehow 
getting the host to leave it alone first before you can pass it through. 
Unloading the driver is one way to do that (although it probably breaks 
all other similar devices too). Maybe there's another way to unbind a 
device from the host such as ejecting it first but then I'm not sure if 
the low level USB needed for accessing the device still works after that 
or it's completely forgotten. There's probably a doc somewhere that 
describes how it works and how can you plug a device without also getting 
higher level drivers to load or if there's no official ways for that then 
you'll need to do some configuration on the host to avoid it grabbing 
devices that you want to pass through. On Linux you can add an udev rule 
to ignore the device (maybe also adding TAG+="uaccess" to allow console 
users to use it without needing root access) but not sure how USB works on 
macOS.

Regards,
BALATON Zoltan

