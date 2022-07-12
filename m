Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C6571991
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:14:29 +0200 (CEST)
Received: from localhost ([::1]:39308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBEmZ-0003sh-Q1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBEja-0000sr-8l; Tue, 12 Jul 2022 08:11:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBEjY-0002p5-Kr; Tue, 12 Jul 2022 08:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e0JJ6zQg2ExsQTqxwJOvUkbMKgW6PkV4BZZengdUaog=; b=syALaxq5TAzgdpqK/22Y91UA/y
 dMJ1GlQXD+YZmmKAhxDd2+YBY30CbTbacDvXLm+dCpLOm4Y9c/bTMMxmBmc3fbV+78Tar0S/hYNom
 snjNrkFJhBcHK18/37J8n/V25s2QdSHYfoyvTuhwyToceAwR94F7fn9CB3y//lCKaEV72KkGvaXmp
 DN2nhKR0j0X2LhvC9kuUtQhNCqMVKcnM0BBEtYPAOxietdIpePSY0OkF/rXW5qkNFil+PTjADlPpo
 8GO5ruaQFUnmBnn4Mb86bWih4ZoA1T1syb+/2ASjXFPC9rwQl/KCAMKq3BtAaSXBL0nG3eAWk/Pn9
 shqhicYx9TEQl6ekpvNy06hkMb2YDA4XdNrxWl48EAD2IdnvsG1btn4vH4mnMXxI5Xr0g/O+yAuTH
 ZBb+FopNvJwow/jyGaEbVZYapwSbqJKqnnyTqB9zhWLvOk+I9KWTm9cxSUMudeXRDmNEFO4uM1t6t
 vGFJ9pZYOwa/sKD2ctnIEszh/Rew9lCxwzymanMUJ24Bikvj/JtNyoHs16YAch4ynGIxrDOCQXP8b
 LsIY8cmNQXeHiJV4vgoa0aw72VA0q40SWSKVEYym2g4NHfqDYA1/3HpY7uVsqcMGrD3oSH7yB167M
 31KPyTPHjUkdsszb9t7SjEV55PEcfhuYEm9TZ1Ex0=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBEiB-0009Kj-Gn; Tue, 12 Jul 2022 13:09:59 +0100
Message-ID: <4ff0668b-02b9-b0dc-99fc-6471d534a404@ilande.co.uk>
Date: Tue, 12 Jul 2022 13:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
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
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <af1b3289-a9ff-b417-e2dd-ae9801f2c74a@kaod.org>
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

On 11/07/2022 08:42, Cédric Le Goater wrote:

>>> Anything special I should know ?
>>
>> As I don't have access to a G5 I've never tried that, however the qemu-system-ppc64 
>> mac99 is wired differently to the qemu-system-ppc mac99 machine so I wouldn't be 
>> surprised if something is broken there.
>>
>> My normal test for MacOS is something like:
>>
>>     qemu-system-ppc -M mac99 -accel kvm -hda macos104.img
>>
>> Can you try qemu-system-ppc and see if it is any better? If not then I can fire up 
>> the G4 and get the git hashes for my last known working configuration.
> 
> Same issue with 32bit.

I've just fired up my G4 to test this again, pulled the latest QEMU git master and 
confirmed that I have a working setup with the details below:

Host kernel: (5.1.0-rc2+)
commit a3ac7917b73070010c05b4485b8582a6c9cd69b6
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon Mar 25 14:49:00 2019 -0700

Guest kernel: (4.14.0-3-powerpc)
using Debian ports debian-9.0-powerpc-NETINST-1.iso

Command line:
./qemu-system-ppc [-M mac99] -accel kvm -cdrom 
/home/mca/images/debian-9.0-powerpc-NETINST-1.iso -boot d -nographic

However if I switch to using the latest Debian ports 
debian-10.0.0-powerpc-NETINST-1.iso then I get a failure:

[    0.198565] BUG: Unable to handle kernel data access on read at 0xbb0030d4
[    0.205152] Faulting instruction address: 0x0001b0c4
[    0.210175] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.214933] BE PAGE_SIZE=4K MMU=Hash PowerMac
[    0.218226] Modules linked in:
[    0.220746] CPU: 0 PID: 0 Comm: swapper Not tainted 5.6.0-2-powerpc #1 Debian 5.6.14-1
[    0.226967] NIP:  0001b0c4 LR: 000030d4 CTR: 00000000
[    0.230869] REGS: c7fb5908 TRAP: 0300   Not tainted  (5.6.0-2-powerpc Debian 5.6.14-1)
[    0.236844] MSR:  00001012 <ME,DR,RI>  CR: 24002820  XER: 20000000
[    0.242096] DAR: bb0030d4 DSISR: 40000000
[    0.242096] GPR00: c0044e70 c7fb59c0 c0b26510 c7fb5f48 bb0030d4 40000000 00000000 
00000001
[    0.242096] GPR08: ff340038 bb0030d4 00001032 c7fb59c0 00000000 00000000 00000000 
00000004
[    0.242096] GPR16: 029c61f0 029c5d68 07c5cd08 00000001 029dd844 fffffffd fff55d10 
42000000
[    0.242096] GPR24: c0af6704 c0b20d94 00000000 00000000 c0bd862c 00000000 00000000 
0000000d
[    0.271138] NIP [0001b0c4] 0x1b0c4
[    0.273978] LR [000030d4] 0x30d4
[    0.276410] Call Trace:
[    0.278812] Instruction dump:
[    0.281219] 55290206 XXXXXXXX XXXXXXXX XXXXXXXX 4c00012c XXXXXXXX XXXXXXXX XXXXXXXX
[    0.287561] 419f0028 XXXXXXXX XXXXXXXX XXXXXXXX 81690000 XXXXXXXX XXXXXXXX XXXXXXXX
[    0.293922] ---[ end trace 3a9d775bab6f3340 ]---
[    0.297491]
[    1.284408] Kernel panic - not syncing: Attempted to kill the idle task!
[    1.290027] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---


Decompressing the initrd takes quite a long time, but I think this is the issue that 
was recently discussed on the mailing list?

I think the next step should be to move my host kernel forward to a more current 
version with the working debian-9.0-powerpc-NETINST-1.iso and see if it is able to 
boot without any problems.


ATB,

Mark.

