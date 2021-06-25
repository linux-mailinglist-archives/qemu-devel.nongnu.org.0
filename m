Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04623B42B8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:50:33 +0200 (CEST)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwkLw-0006iq-B9
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkL6-00064D-GH
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:49:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59406
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkL4-0003TI-3X
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:49:40 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=[192.168.1.65]) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwkKe-0008JK-1I; Fri, 25 Jun 2021 12:49:16 +0100
To: Finn Thain <fthain@fastmail.com.au>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
 <20a706c7-9b44-13cc-b294-1ee0f3cff6bb@amsat.org>
 <2a2fff87-6e6f-3362-24e3-760f1aea4573@ilande.co.uk>
 <17f0917-de30-6771-26d0-7a10214221ca@nippy.intranet>
 <38512250-86bb-7cbd-caca-9bc0378e54e8@ilande.co.uk>
 <2a99f70-4584-be2f-4d82-72641d65d7a@nippy.intranet>
 <246849c9-c674-7b33-6fe0-ddfff1d128fe@ilande.co.uk>
 <87cdbdeb-1228-f08f-ed15-107f5cf6484@nippy.intranet>
 <979b0b6c-19e0-d74c-eb99-9633d596ee07@ilande.co.uk>
 <4bd8b183-6cb-ec29-e8e1-acbe74d2dd@nippy.intranet>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <84a33676-fa68-9d21-7cf6-984b415d79a3@ilande.co.uk>
Date: Fri, 25 Jun 2021 12:49:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4bd8b183-6cb-ec29-e8e1-acbe74d2dd@nippy.intranet>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/5] dp8393x: fixes for MacOS toolbox ROM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 hpoussin@reactos.org, aurelien@aurel32.net, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/2021 10:32, Finn Thain wrote:

>>>> Thanks for the link and the detailed testing information. I've been
>>>> trying to understand why you had to set the MAC address in the ARC
>>>> firmware so I had a bit of an experiment here.
>>>>
>>>> The reason that you need to do this is because of the NVRAM
>>>> configuration in your command line, in particular -global
>>>> ds1225y.size=8200.
> 
> That configuration also shows up here,
> https://virtuallyfun.com/wordpress/2013/08/30/restoring-the-mips-magnum-in-qemu-1-6-0/
> with the explanation, "you'll need the NVRam stuff to add extra space for
> the ethernet MAC address". So it seems that the 8200 figure was just a
> hack and does not reflect the size of the NVRAM in an actual Magnum.

Ah that makes sense! QEMU 1.6.0 was released in 2013 and Hervé's patches to add the 
PROM MAC address support were added in 2015 so this information is outdated.

>>>> What this does is extend the NVRAM over the top of the dp8393x-prom
>>>> area where QEMU places the NIC MAC address and checksum on startup,
>>>> so the NVRAM captures the MAC address reads/writes instead. The net
>>>> effect of this is that the empty NVRAM initially reads all zeros and
>>>> why an initial setup is required to set the MAC address.
>>>>
>>>> This can be seen quite clearly in the "info mtree" output:
>>>>
>>>>       0000000080009000-000000008000b007 (prio 0, i/o): nvram
>>>>       000000008000b000-000000008000bfff (prio 0, rom): dp8393x-prom
>>>>
>>>> However if you completely drop -global ds1225y.size=8200 from your
>>>> command line then the NVRAM doesn't overrun into the dp8393x-prom
>>>> area, and the ARC firmware picks up the MAC address from QEMU
>>>> correctly:
>>>>
>>>>       0000000080009000-000000008000afff (prio 0, i/o): nvram
>>>>       000000008000b000-000000008000bfff (prio 0, rom): dp8393x-prom
>>>>
>>>> I've also looked over the entire SONIC datasheet to see if the PROM
>>>> format is documented, and according to that there is no non-volatile
>>>> storage available on the chip itself.
>>>
>>> Yes, that's my understanding also. The relevant National Semicondutor
>>> Application Notes seem to include a separate PROM. And if you closely
>>> examine the Linux macsonic.c driver, you'll see that the PowerBook 5x0
>>> models get a random MAC address because no-one (outside of Apple)
>>> knows where the real MAC address is stored.
>>
>> Agreed. This means that the revised patchset should now be doing the
>> right thing here.
>>
>> FWIW I felt that it had changed too much in its latest form to include
>> your original Tested-by tag due to the extra PROM changes, so I'd be
>> grateful if you could give it a quick test.
>>
> 
> Sure.
> 
>>>> Testing shows that the checksum algorithm currently used for the
>>>> dp8393x device generates the same result as that generated by the
>>>> ARC firmware, which is known to be different than that used by the
>>>> Q800 machine.
>>>>
>>>>   From this I conclude that the PROM is provided by the board and not
>>>> the chipset, and therefore each machine should construct its own
>>>> PROM accordingly. I'll send a v2 patchset shortly with these changes
>>>> which shall also include the proposed endian patch.
>>>>
>>>
>>> If you potentially have both a ds1225y NVRAM and a dp8393x PROM (for
>>> the magnum machine) how do you avoid ending up with conflicting state?
>>> Would the two storage devices have to be mutually exclusive?
>>
>> The ds1225y NVRAM is located between 0x80009000-0x8000afff and running
>> the nvram file through hexdump shows only the first 0x1000 bytes contain
>> any data, so any other changes made to NVRAM via the ARC firmware setup
>> will be preserved.
>>
> 
> Perhaps '-global ds1225y.size=4096' could be used to test that assumption
> about ARC firmware behaviour. Anyway, the default for ds1225y.size seems
> to be 0x2000. And a glance at the DS1225Y datasheets agrees with that
> figure. (I'm going to assume that DS1225Y is the actual part found in
> Magnum machines even though MOS6522, for instance, was not used in
> Quadras.)
> 
>> The existing default behaviour (without -global ds1225y.size=8200) is
>> that only the last few bytes at 0x8000b000 are mapped to the dp8393x
>> PROM, and this area is marked read-only to ensure that the MAC address
>> obtained by the guest OS always matches the one provided by the QEMU
>> configuration.
>>
> 
> Well, I asked about conflicting state having assumed that the NVRAM in a
> real Magnum was used to store the MAC address. But that's probably not the
> case. There's probably some other chip involved and your PROM device seems
> like a good way to model that. (Unfortunately I don't have access to a
> Magnum machine so you should take what I say about that machine with a
> grain of salt.)

Certainly on real Magnum hardware the area of memory containing the MAC address is 
backed by NVRAM and QEMU can access it, as validated by increasing the NVRAM size.

However the current default behaviour seems correct to me, since NIC MAC addresses 
are specified on the QEMU command line and so if you make this area NVRAM you can end 
up with a mismatch between what QEMU thinks the MAC address is internally vs. the 
value in the PROM...


ATB,

Mark.

