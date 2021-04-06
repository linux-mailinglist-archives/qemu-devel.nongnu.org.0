Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C671355684
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:22:26 +0200 (CEST)
Received: from localhost ([::1]:56424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmb3-0006r2-8M
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lTmZR-0005hR-4O
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:20:45 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lTmZM-0006d4-O8
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:20:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0FA7374581E;
 Tue,  6 Apr 2021 16:20:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E53F67456E3; Tue,  6 Apr 2021 16:20:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E3DB57456B4;
 Tue,  6 Apr 2021 16:20:36 +0200 (CEST)
Date: Tue, 6 Apr 2021 16:20:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Mac OS real USB device support issue
In-Reply-To: <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
Message-ID: <97cddc56-1b13-dab4-33d8-5fdaeae575d7@eik.bme.hu>
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>, gerd@kraxel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021, Howard Spoelstra wrote:
> On Tue, Apr 6, 2021 at 3:44 PM Programmingkid <programmingkidx@gmail.com> wrote:
>>
>> Hi Gerd,
>>
>> I was wondering if you had access to a Mac OS 10 or Mac OS 11 machine to test USB support. I am on Mac OS 11.1 and cannot make USB devices work with any of my guests. So far these are the guests I have tested with:
>>
>> - Windows 7
>> - Mac OS 9.2
>> - Windows 2000
>>
>> I have tried using USB flash drives, USB sound cards, and an USB headset. They all show up under 'info usb', but cannot be used in the guest. My setup does use a USB-C hub so I'm not sure if this is a bug with QEMU or an issue with the hub. Would you have any information on this issue?
>
> Hi John,
>
> As far as the Mac OS 9.2 guest is concerned on a mac OS host, it does
> not support USB 2.0. I was successful only in passing through a USB
> flash drive that was forced into USB 1.1 mode by connecting it to a
> real USB 1.1 hub and unloading the kext it used.

I think USB passthorugh works in VirtualBox on macOS so maybe you could 
check how that works there and what might need to be done for it. Although 
I'm not sure if it's in the open source part or in the non-free extensions 
so may not be that easy to find out what's needed if the sources for it 
are not available.

Regards.
BALATON Zoltan

