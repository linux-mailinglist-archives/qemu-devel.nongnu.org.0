Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89531355C30
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 21:31:10 +0200 (CEST)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTrPp-0005KA-1J
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 15:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTrNo-0004nQ-Ip
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:29:04 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTrNm-0007yQ-JI
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 15:29:04 -0400
Received: by mail-qk1-x731.google.com with SMTP id z10so16151698qkz.13
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nliWD3zLVgkRwvqnJx48avHnGwHyMxgISjkLME172W0=;
 b=dMG1Hheibs5o0DTDoOgXQZLrjhLxYuUr8TkVuDWSFEgCXnFNk82cq7vzD7K56v1SrD
 JFE6gUImAqPafHuTuIZt/Abg/WBLtyAWoEOo4tpH12U7bbKupKdueBgc2vcn3FBxrq9W
 8/hYR2l7QT7uGBETKrXD1/L0sGPNucm+hHbVchldgPXyCS5vbODXQbxtNKDhGfGklxws
 0FRKG+OkK1OuH7c9G8Ui4+97Ary5HOfjsXBI3gjavNek9X+4VAyQisrD8zr+QBh3yJ4i
 MN1/vVc3VDyXq51YwSExwS4CbABfIiPJbHUhtS6Sam9RrgbPIHcbi2XNJEPjuAmdAUJu
 mkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=nliWD3zLVgkRwvqnJx48avHnGwHyMxgISjkLME172W0=;
 b=fwHqLSjgTCYe97md/mFc5Ttml2H83Z8HhanLBLhwzOV4H24+3VxOA06emJg+eGIoIy
 LoxpApcEQB5t/ZwCQuojibwKALZvdN7iLbLowSw3C5gBSOW9LfFxiit6xUyi/rOi9Exj
 Uc4VdmoSdiHO85QLDldC7LchB5bIjiU2f6otdQx2L55Oj24BLpCPC273MDYSl4h14sVJ
 pPvovENgBHMTCquaC2SOYImH28vYMdmVV0BLEHeDl/1I6vyj/0aNBPy3ZdHrkwgxEhPY
 PJtXheXXt5klmNNdhDz4uzcfYhQu6y8bQ28gFbLC+53vKeGys9FX0bsY35Bg8ejLoFLm
 yWJQ==
X-Gm-Message-State: AOAM532Sp6iDpT6Z8XMODL+q7fUEirg3sD29h+wZmNSPmRLQEGlSa8e0
 0+YIdpOzxi99e/I0RtMjhtw=
X-Google-Smtp-Source: ABdhPJyYxMftJwoNflh1dUeY1suJU2y3hUCVCe0nxD2nlZHGXiuMnw/NEygegggJfxff9/jVgNkX4w==
X-Received: by 2002:ae9:e010:: with SMTP id m16mr30388791qkk.44.1617737341342; 
 Tue, 06 Apr 2021 12:29:01 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id s133sm16874180qke.1.2021.04.06.12.29.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Apr 2021 12:29:00 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
Date: Tue, 6 Apr 2021 15:28:59 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 6, 2021, at 12:53 PM, BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>=20
> On Tue, 6 Apr 2021, Programmingkid wrote:
>>> On Apr 6, 2021, at 10:01 AM, Howard Spoelstra <hsp.cat7@gmail.com> =
wrote:
>>> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid =
<programmingkidx@gmail.com> wrote:
>>>>=20
>>>> Hi Gerd,
>>>>=20
>>>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 =
machine to test USB support. I am on Mac OS 11.1 and cannot make USB =
devices work with any of my guests. So far these are the guests I have =
tested with:
>>>>=20
>>>> - Windows 7
>>>> - Mac OS 9.2
>>>> - Windows 2000
>>>>=20
>>>> I have tried using USB flash drives, USB sound cards, and an USB =
headset. They all show up under 'info usb', but cannot be used in the =
guest. My setup does use a USB-C hub so I'm not sure if this is a bug =
with QEMU or an issue with the hub. Would you have any information on =
this issue?
>>>=20
>>> Hi John,
>>>=20
>>> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it =
does
>>> not support USB 2.0. I was successful only in passing through a USB
>>> flash drive that was forced into USB 1.1 mode by connecting it to a
>>> real USB 1.1 hub and unloading the kext it used.
>>>=20
>>> Best,
>>> Howard
>>=20
>> Hi Howard, I was actually thinking about CC'ing you for this email. =
Glad you found it. Unloading kext files does not sound pleasant. Maybe =
there is some better way of doing it.
>=20
> In any case, until you make sure nothing tries to drive the device on =
the host, passing it to a guest likely will fail because then two =
drivers from two OSes would try to access it simultaneously which likely =
creates a mess as the device and drivers don't expect this. So you can't =
just pass a device through that the host has recognised and is driving =
without somehow getting the host to leave it alone first before you can =
pass it through. Unloading the driver is one way to do that (although it =
probably breaks all other similar devices too). Maybe there's another =
way to unbind a device from the host such as ejecting it first but then =
I'm not sure if the low level USB needed for accessing the device still =
works after that or it's completely forgotten. There's probably a doc =
somewhere that describes how it works and how can you plug a device =
without also getting higher level drivers to load or if there's no =
official ways for that then you'll need to do some configuration on the =
host to avoid it grabbing devices that you want to pass through. On =
Linux you can add an udev rule to ignore the device (maybe also adding =
TAG+=3D"uaccess" to allow console users to use it without needing root =
access) but not sure how USB works on macOS.
>=20
> Regards,
> BALATON Zoltan

Being able to dissociate a real USB device from its Mac OS driver would =
be very useful in this situation. IOKit might be one place to look for =
such a feature. The Mach kernel documentation is another place that =
might have what we want.

I have one theory. What if we introduce a middleman. A pseudo-USB device =
that the guest operating system could apply its configuration data to =
and will also talk directly with to the real USB device.=20
So this:

USB device <-> Host <-> QEMU USB middleman <-> Guest

This could make USB 2.0 and 3.0 flash drives compatible with an older =
operating system like Mac OS 9. The USB middleman could fully accept Mac =
OS 9's configuration and make it think it is talking to a USB 1.1 =
device. Parameters like data packet payload size would no longer be a =
problem. Host driver unloading would no longer be needed (in theory).=20



