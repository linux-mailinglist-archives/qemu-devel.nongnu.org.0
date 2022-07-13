Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8C573DD5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:32:19 +0200 (CEST)
Received: from localhost ([::1]:57726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBj1t-00033k-Tf
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBj0O-0001ZA-J0; Wed, 13 Jul 2022 16:30:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBj0K-00032o-OX; Wed, 13 Jul 2022 16:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ivPLxjyqqILG86Ints9Qjm2Ik0zE0xwYvNWcQA+NPk=; b=KnVif4LUGkzUTiwxDcGWCvSyvr
 hVTOAQI6ySvhXRqdlg4KBn2lYR+UaewBYTFLwyNFi6iTiHQAYbhEDj1LwkaKgXSATLpdGUC46GxYc
 RE6re1/32ofm1J2oxtLZshu261yrM2TPhCV23p11IoZnvfGx9MRjswVL/F56SLtZnVtq3pfNiU3FG
 kLqbv6qp+Vmko2tQuLQueI8XzxJM1TmouRMp8pPUVvRNyu8I7RhjGJ9KgUCpxp9XsuECntNoyNnS6
 5BjxtURCr3kYIxWmjPGQJmuE10CTk9/ezERwF8kgXn+5c0/kSrSr1dVx5AupGWhdLJ+zsO8H/aFy8
 0Nk62WVpB0niW6Q3XjdvN8T4TJ+aPP0KZbA6ipTJCdevbhg7LAMYuHfeXUAFCB31J946d5Ko8fwz2
 fxPew0xGZhVXEZsmV7kM2NFuRO5HTEW3eqT9g1cXtjjkMmZ/bE9k22Pyb/9FpVI2nZVwD4r51QjRK
 4CWk4sNwCA/rU39FfZzTpMj0ZPpQXb+W0zdniKmUh5WkA6oknsdQ0I52Tma2yLUjuByedeq7OXOtc
 Jcgo5e9HSHVfgbaEYHErxnqJDYC67ci8mLo0CLpDIWfOxs1WcGPoei/oKzemPnzMX3nseXABVGmdO
 ITHKVc9I/4tb5r28pNDB0qcnxOMp3aI+fbZ2MJw4Q=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBiyq-000571-Rc; Wed, 13 Jul 2022 21:29:12 +0100
Message-ID: <7b8c62f9-1821-e3ed-ff2c-35a8ed8583f4@ilande.co.uk>
Date: Wed, 13 Jul 2022 21:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
 <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
 <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
 <1d2cd44f-fd61-4693-ecc0-f71c80131005@ilande.co.uk>
 <6b5e0e42-973d-19de-4979-7db06941ea19@kaod.org>
 <13b65b0e-716f-a6e0-fd63-c1e7cfe2a63c@kaod.org>
 <c08df33f-f6e8-67bb-9159-190a0b9a2dd5@ilande.co.uk>
 <af1b3289-a9ff-b417-e2dd-ae9801f2c74a@kaod.org>
 <4ff0668b-02b9-b0dc-99fc-6471d534a404@ilande.co.uk>
 <7c4a60d8-a112-5d99-3720-ee707efcfb5d@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <7c4a60d8-a112-5d99-3720-ee707efcfb5d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/07/2022 15:54, BALATON Zoltan wrote:

> On Tue, 12 Jul 2022, Mark Cave-Ayland wrote:
>> On 11/07/2022 08:42, Cédric Le Goater wrote:
>>>>> Anything special I should know ?
>>>>
>>>> As I don't have access to a G5 I've never tried that, however the 
>>>> qemu-system-ppc64 mac99 is wired differently to the qemu-system-ppc mac99 machine 
>>>> so I wouldn't be surprised if something is broken there.
>>>>
>>>> My normal test for MacOS is something like:
>>>>
>>>>     qemu-system-ppc -M mac99 -accel kvm -hda macos104.img
>>>>
>>>> Can you try qemu-system-ppc and see if it is any better? If not then I can fire 
>>>> up the G4 and get the git hashes for my last known working configuration.
>>>
>>> Same issue with 32bit.
>>
>> I've just fired up my G4 to test this again, pulled the latest QEMU git master and 
>> confirmed that I have a working setup with the details below:
>>
>> Host kernel: (5.1.0-rc2+)
>> commit a3ac7917b73070010c05b4485b8582a6c9cd69b6
>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>> Date:   Mon Mar 25 14:49:00 2019 -0700
>>
>> Guest kernel: (4.14.0-3-powerpc)
>> using Debian ports debian-9.0-powerpc-NETINST-1.iso
>>
>> Command line:
>> ./qemu-system-ppc [-M mac99] -accel kvm -cdrom 
>> /home/mca/images/debian-9.0-powerpc-NETINST-1.iso -boot d -nographic
>>
>> However if I switch to using the latest Debian ports 
>> debian-10.0.0-powerpc-NETINST-1.iso then I get a failure:
>>
>> [    0.198565] BUG: Unable to handle kernel data access on read at 0xbb0030d4
> 
> What is or should be at this address and why does the kernel access it? By default I 
> see nothing mapped there. Do you need more RAM? Maybe the default 128 MB is not 
> enough for newer kernels? I've seen such problem with other OSes before.

Yeah I've already tried increasing the RAM and it makes no difference. It wouldn't 
surprise me if it's a kernel issue since Christophe has done a lot of low-level work 
for 32-bit PPC including moving routines from asm to C and KASAN. I'm away for a few 
days but I will do a bisect when I get back, unless anyone beats me to it...


ATB,

Mark.

