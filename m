Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546961214A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:11:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oogun-0007Ac-OK; Sat, 29 Oct 2022 04:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oogug-00077w-Gi; Sat, 29 Oct 2022 04:09:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oogue-0000Hc-7Y; Sat, 29 Oct 2022 04:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R222kYYkdmhxn/on5rHRyKlWt1E7iyqsVU/NCf3rQLY=; b=ooF67oWIR63/UvYqIqmLphhNS2
 YyLgAd+8qOyAUNG5XjTNvkWCj9tcf5Il/upNckZPtMNhGEhP/ejs9KhA1BHZBEjBJpX+jPyI7xVnA
 WAwOdnT5bkygI+/cXHPKRujtwfSpNFmv50Y41XRCCpcqfJOPxSAjm2s1kyFitTglyZ9V89vHMhfSe
 5y6EifKIA3EzLB+NWXEvT44wnT/D8w1zPsVmsC+UQuCTYISyjH2rkbMpdxLp49sWQkjsiN2hb5+S+
 64/GzK1fCXF1mtYr23VqNJytq22cFB1fRgEmxwF4DIyt1r6HyghjroUS7UlFLCfrHyRetO67hxbDO
 yKEiWWFeSKp5uvN3BO1cwAjokXSayMRN1qCMJ9WRFj7RxxImuAJsTQriHBLXl+VP+Tuj+5//gns2D
 EsI1Q1XM+XWl/Yh93gUmXf1UrznlsQlCvtL4xzx2jx/j7dn3JOYc8blicrU+LZ0e0DlraUhaFKewQ
 3T2x7Q8f7Ku4b4+1ZWml/WmyigZEqWgvtzJdxm5l+LJ+4Rc/Gn3wUO2p1FbAr7so0nZEkXCLs3WQ1
 5jGjpurqDUjL7X1yQpb06ElvgKrXZYf5yBZDBh/2IAJXmujbRK+7FOJVRamdJ5RIBGvV4Ud2/Ht98
 JMr+4uJNgV+m9Lp3iR2xblph3HCw5gU1d9PqW0Oms=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooguV-0003O4-1B; Sat, 29 Oct 2022 09:09:47 +0100
Message-ID: <98cdd27e-a2f8-7479-7bc2-37baa3ffaa31@ilande.co.uk>
Date: Sat, 29 Oct 2022 09:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <7832e9b6d79c5243d21f54b0679f487c32d968dd.1666715145.git.balaton@eik.bme.hu>
 <72df99a7-3b11-c460-5b31-2b24da92b1ae@ilande.co.uk>
 <fef9ea11-e14-7d72-c7bc-3582e45b260@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <fef9ea11-e14-7d72-c7bc-3582e45b260@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 19/19] mac_newworld: Document deprecation
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/10/2022 13:20, BALATON Zoltan wrote:

> On Fri, 28 Oct 2022, Mark Cave-Ayland wrote:
>> On 25/10/2022 17:44, BALATON Zoltan wrote:
>>> Also update PowerMac family docs with some more recent info.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   docs/about/deprecated.rst    |  7 +++++++
>>>   docs/system/ppc/powermac.rst | 12 ++++++++----
>>>   2 files changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>> index 93affe3669..07661af7fe 100644
>>> --- a/docs/about/deprecated.rst
>>> +++ b/docs/about/deprecated.rst
>>> @@ -248,6 +248,13 @@ These old machine types are quite neglected nowadays and thus 
>>> might have
>>>   various pitfalls with regards to live migration. Use a newer machine type
>>>   instead.
>>>   +``mac99`` variants other than the default qemu-system-ppc version (since 7.2)
>>> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>> +
>>> +The ``mac99`` machine emulates different hardware depending on using
>>> +qemu-system-ppc64 or ``via`` property. To avoid confusion new machine
>>> +types has been added for these variants which are now preferred over
>>> +``mac99``.
>>>     Backend options
>>>   ---------------
>>> diff --git a/docs/system/ppc/powermac.rst b/docs/system/ppc/powermac.rst
>>> index 04334ba210..9a37e69b1b 100644
>>> --- a/docs/system/ppc/powermac.rst
>>> +++ b/docs/system/ppc/powermac.rst
>>> @@ -4,8 +4,12 @@ PowerMac family boards (``g3beige``, ``mac99``)
>>>   Use the executable ``qemu-system-ppc`` to simulate a complete PowerMac
>>>   PowerPC system.
>>>   -- ``g3beige``              Heathrow based PowerMAC
>>> -- ``mac99``                Mac99 based PowerMAC
>>> +- ``g3beige``           Heathrow based old world Power Macintosh G3
>>> +- ``mac99``             Core99 based generic PowerMac
>>> +- ``powermac3_1``       Power Mac G4 AGP (Sawtooth)
>>> +- ``powerbook3_2``      PowerBook G4 Titanium (Mercury)
>>> +- ``powermac7_3``       Power Mac G5 (Niagara) (only in ``qemu-system-ppc64``)
>>> +
>>>     Supported devices
>>>   -----------------
>>> @@ -15,9 +19,9 @@ QEMU emulates the following PowerMac peripherals:
>>>    *  UniNorth or Grackle PCI Bridge
>>>    *  PCI VGA compatible card with VESA Bochs Extensions
>>>    *  2 PMAC IDE interfaces with hard disk and CD-ROM support
>>> - *  NE2000 PCI adapters
>>> + *  Sungem PCI network adapter
>>>    *  Non Volatile RAM
>>> - *  VIA-CUDA with ADB keyboard and mouse.
>>> + *  VIA-CUDA or VIA-PMU99 with ot without ADB or USB keyboard and mouse.
>>>       Missing devices
>>
>> Documentation updates are always useful, but until there is consensus as to how the 
>> 32-bit and 64-bit targets should be handled then I don't think we should go ahead 
>> with a potential compatibility break/deprecation until we have a clear path forward.
>>
>> Given that freeze is so close, I suggest leaving this for 7.2 and resurrecting the 
>> appropriate thread from earlier in the year at the start of the 8.0 development cycle.
> 
> Please don't postpone patches because you were not able to review in time. A better 
> approach would be to merge these now and drop them during the freeze if any problem 
> that can't be fixed is found. The deprecation process itself is also to allow backing 
> off if this turns out to be a bad idea so no need to wait for more votes now and 
> postpone this further.

As I've previously mentioned, there is no commercial sponsorship for the QEMU Mac 
machines which is why the Mac machines are marked as Maintained, and so patch review 
is often limited by my available spare time. This does not mean that we should bypass 
the entire QEMU review process though.


ATB,

Mark.

