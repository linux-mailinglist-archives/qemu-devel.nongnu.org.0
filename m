Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B223FCEF3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 23:09:18 +0200 (CEST)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLB0O-0004ds-Ov
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 17:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mLAzM-0003p3-14; Tue, 31 Aug 2021 17:08:12 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mLAzJ-0000dW-9g; Tue, 31 Aug 2021 17:08:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DCDE2746398;
 Tue, 31 Aug 2021 23:08:01 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B77FD7462D3; Tue, 31 Aug 2021 23:08:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B604F745708;
 Tue, 31 Aug 2021 23:08:01 +0200 (CEST)
Date: Tue, 31 Aug 2021 23:08:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
In-Reply-To: <9E32E4A0-D1BB-4DDF-8F57-38BD5044DF1D@gmail.com>
Message-ID: <91bc8dea-deb6-193e-326d-7a6467fa1214@eik.bme.hu>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
 <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
 <CAFEAcA_mb5zAaBiVjzo1QGGo-4Yt+j89iD9AUVKJP-pP1XCJmQ@mail.gmail.com>
 <8ED650E0-5874-4AE6-85E3-631E7B76D37A@gmail.com>
 <CAFEAcA96V6d-aAR65xiZQrB65aTfQEJfHq5x_ZSa3mpAoSUMQw@mail.gmail.com>
 <269a250-93ec-2e6-8813-5b65aa9fb76@eik.bme.hu>
 <9E32E4A0-D1BB-4DDF-8F57-38BD5044DF1D@gmail.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021, Programmingkid wrote:
>> On Aug 30, 2021, at 5:47 PM, BALATON Zoltan <balaton@eik.bme.hu> wrote:

>> On Mon, 30 Aug 2021, Peter Maydell wrote:
>>> On Mon, 30 Aug 2021 at 21:29, Programmingkid <programmingkidx@gmail.com> wrote:
>>>> I found out that there are two pc-bios folders. One in the root directory
>>>> and one in the build directory. QEMU is looking in the pc-bios folder
>>>> located inside the build folder. The qemu_vga.ndrv file is only located
>>>> in the root directory pc-bios folder. I think a good solution to this
>>>> issue is to first remove one of the pc-bios folders. I'm not sure if it
>>>> is just me who has two pc-bios folders or if everyone does.
>>>
>>> Having two pc-bios folders is expected. The one in the source tree is
>>> the one which has the files we actually carry around in git. The one
>>> in the build tree is created by 'configure' and populated with symbolic
>>> links back to the files in the source tree. We need this one because
>>> the QEMU executable doesn't (and shouldn't) know where the source tree is:
>>> when it is looking for files it will look in places relative to the
>>> location of the executable itself (ie relative to the build tree)
>>> as well as places set by configure (used when you install QEMU and
>>> its various supporting files).
>>>
>>> The reason qemu_vga.ndrv is not in the pc-bios folder in the build
>>> tree is because when that file was added we forgot to add handling
>>> for it in configure. I'm not sure why nobody else has fallen over
>>> this in the intervening 3 years: running QEMU from the build tree
>>> will never find the file, and it will not be installed via
>>> 'make install' either.
>>
>> This file is a driver for MacOS and not many people run that old OS. Those who do probably use Howard's binaries and follow his guides that tell you to use -L pc-bios on command line. I always wondered why that's needed when it should find it by default but this explains it and probably also your question why nobody complained.
>>
>> Regards,
>> BALATON Zoltan
>
> This does sound like a good explanation. I am pretty sure I was able to 
> use my Mac OS 9 VM without the -L option in the past and still have many 
> video resolutions available.

Depends how far back in the past was that. If before the meson conversion 
that introduced the build dir maybe you run it from the source dir (if 
used in-tree build) and it found the file. I'm not sure if it still works 
if you run from source dir such as build/qemu-system-ppc that is without 
changing current dir to build dir. If it works that way then maybe you 
ran it like that before. (Or maybe had an installed version and it picked 
up the file from there.)

Regards,
BALATON Zoltan

