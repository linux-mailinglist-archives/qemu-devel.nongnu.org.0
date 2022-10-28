Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62079611129
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooONJ-0004o8-4g; Fri, 28 Oct 2022 08:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooOMG-0004Fb-4N; Fri, 28 Oct 2022 08:21:11 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooOMA-00026Q-2e; Fri, 28 Oct 2022 08:21:07 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5771174638A;
 Fri, 28 Oct 2022 14:20:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E07C174633D; Fri, 28 Oct 2022 14:20:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DF52574632B;
 Fri, 28 Oct 2022 14:20:57 +0200 (CEST)
Date: Fri, 28 Oct 2022 14:20:57 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v4 19/19] mac_newworld: Document deprecation
In-Reply-To: <72df99a7-3b11-c460-5b31-2b24da92b1ae@ilande.co.uk>
Message-ID: <fef9ea11-e14-7d72-c7bc-3582e45b260@eik.bme.hu>
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <7832e9b6d79c5243d21f54b0679f487c32d968dd.1666715145.git.balaton@eik.bme.hu>
 <72df99a7-3b11-c460-5b31-2b24da92b1ae@ilande.co.uk>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
> On 25/10/2022 17:44, BALATON Zoltan wrote:
>> Also update PowerMac family docs with some more recent info.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   docs/about/deprecated.rst    |  7 +++++++
>>   docs/system/ppc/powermac.rst | 12 ++++++++----
>>   2 files changed, 15 insertions(+), 4 deletions(-)
>> 
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 93affe3669..07661af7fe 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -248,6 +248,13 @@ These old machine types are quite neglected nowadays 
>> and thus might have
>>   various pitfalls with regards to live migration. Use a newer machine type
>>   instead.
>>   +``mac99`` variants other than the default qemu-system-ppc version (since 
>> 7.2)
>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +The ``mac99`` machine emulates different hardware depending on using
>> +qemu-system-ppc64 or ``via`` property. To avoid confusion new machine
>> +types has been added for these variants which are now preferred over
>> +``mac99``.
>>     Backend options
>>   ---------------
>> diff --git a/docs/system/ppc/powermac.rst b/docs/system/ppc/powermac.rst
>> index 04334ba210..9a37e69b1b 100644
>> --- a/docs/system/ppc/powermac.rst
>> +++ b/docs/system/ppc/powermac.rst
>> @@ -4,8 +4,12 @@ PowerMac family boards (``g3beige``, ``mac99``)
>>   Use the executable ``qemu-system-ppc`` to simulate a complete PowerMac
>>   PowerPC system.
>>   -- ``g3beige``              Heathrow based PowerMAC
>> -- ``mac99``                Mac99 based PowerMAC
>> +- ``g3beige``           Heathrow based old world Power Macintosh G3
>> +- ``mac99``             Core99 based generic PowerMac
>> +- ``powermac3_1``       Power Mac G4 AGP (Sawtooth)
>> +- ``powerbook3_2``      PowerBook G4 Titanium (Mercury)
>> +- ``powermac7_3``       Power Mac G5 (Niagara) (only in 
>> ``qemu-system-ppc64``)
>> +
>>     Supported devices
>>   -----------------
>> @@ -15,9 +19,9 @@ QEMU emulates the following PowerMac peripherals:
>>    *  UniNorth or Grackle PCI Bridge
>>    *  PCI VGA compatible card with VESA Bochs Extensions
>>    *  2 PMAC IDE interfaces with hard disk and CD-ROM support
>> - *  NE2000 PCI adapters
>> + *  Sungem PCI network adapter
>>    *  Non Volatile RAM
>> - *  VIA-CUDA with ADB keyboard and mouse.
>> + *  VIA-CUDA or VIA-PMU99 with ot without ADB or USB keyboard and mouse.
>>       Missing devices
>
> Documentation updates are always useful, but until there is consensus as to 
> how the 32-bit and 64-bit targets should be handled then I don't think we 
> should go ahead with a potential compatibility break/deprecation until we 
> have a clear path forward.
>
> Given that freeze is so close, I suggest leaving this for 7.2 and 
> resurrecting the appropriate thread from earlier in the year at the start of 
> the 8.0 development cycle.

Please don't postpone patches because you were not able to review in time. 
A better approach would be to merge these now and drop them during the 
freeze if any problem that can't be fixed is found. The deprecation 
process itself is also to allow backing off if this turns out to be a bad 
idea so no need to wait for more votes now and postpone this further.

Regards,
BALATON Zoltan

