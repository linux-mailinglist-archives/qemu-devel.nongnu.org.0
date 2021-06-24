Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2593B31AD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:43:39 +0200 (CEST)
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQZu-000167-4c
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwQYu-0008BA-78
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:42:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57966
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwQYs-0006VE-BE
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:42:35 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=[192.168.1.65]) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwQYP-0001dt-AY; Thu, 24 Jun 2021 15:42:09 +0100
To: Finn Thain <fthain@fastmail.com.au>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
 <20a706c7-9b44-13cc-b294-1ee0f3cff6bb@amsat.org>
 <2a2fff87-6e6f-3362-24e3-760f1aea4573@ilande.co.uk>
 <17f0917-de30-6771-26d0-7a10214221ca@nippy.intranet>
 <38512250-86bb-7cbd-caca-9bc0378e54e8@ilande.co.uk>
 <2a99f70-4584-be2f-4d82-72641d65d7a@nippy.intranet>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <246849c9-c674-7b33-6fe0-ddfff1d128fe@ilande.co.uk>
Date: Thu, 24 Jun 2021 15:42:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a99f70-4584-be2f-4d82-72641d65d7a@nippy.intranet>
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

On 18/06/2021 07:22, Finn Thain wrote:

> I was able to test this patch series successfully, using both
> "qemu-system-mipsel -M magnum" and "qemu-system-m68k -M q800". With the
> latter emulator I used a Linux/m68k guest and with the former I used both
> Linux/mips and NetBSD/arc guests.
> 
> Basic dp8393x functionality worked fine. I don't know how the m68k guest
> obtained its MAC address setting, but the macsonic driver banner message
> agrees with what's on the wire, at least.
> 
> The mips guest has ARC firmware which allowed the MAC address to be
> programmed manually:
> 
>   JAZZ Setup Program Version 0.17            Friday, 6-18-2021   5:06:02 AM
>   Copyright (c) 1991, 1992  Microsoft Corporation
> 
>       The current Ethernet station address is: 900090001122
>       Enter the new station address:  900090123456
>       The value written to NVRAM is: 9000901234560042
>   Press any key to continue...
> 
> I'm guessing that the "0042" is the checksum?
> 
> BTW, the patch in the message quoted above does not seem to affect my
> results. (This host is little-endian...) I don't know how to test
> that one. For the others:
> Tested-by: Finn Thain <fthain@linux-m68k.org>

Thanks for the link and the detailed testing information. I've been trying to 
understand why you had to set the MAC address in the ARC firmware so I had a bit of 
an experiment here.

The reason that you need to do this is because of the NVRAM configuration in your 
command line, in particular -global ds1225y.size=8200. What this does is extend the 
NVRAM over the top of the dp8393x-prom area where QEMU places the NIC MAC address and 
checksum on startup, so the NVRAM captures the MAC address reads/writes instead. The 
net effect of this is that the empty NVRAM initially reads all zeros and why an 
initial setup is required to set the MAC address.

This can be seen quite clearly in the "info mtree" output:

     0000000080009000-000000008000b007 (prio 0, i/o): nvram
     000000008000b000-000000008000bfff (prio 0, rom): dp8393x-prom

However if you completely drop -global ds1225y.size=8200 from your command line then 
the NVRAM doesn't overrun into the dp8393x-prom area, and the ARC firmware picks up 
the MAC address from QEMU correctly:

     0000000080009000-000000008000afff (prio 0, i/o): nvram
     000000008000b000-000000008000bfff (prio 0, rom): dp8393x-prom

I've also looked over the entire SONIC datasheet to see if the PROM format is 
documented, and according to that there is no non-volatile storage available on the 
chip itself. Testing shows that the checksum algorithm currently used for the dp8393x 
device generates the same result as that generated by the ARC firmware, which is 
known to be different than that used by the Q800 machine.

 From this I conclude that the PROM is provided by the board and not the chipset, and 
therefore each machine should construct its own PROM accordingly. I'll send a v2 
patchset shortly with these changes which shall also include the proposed endian patch.


ATB,

Mark.

