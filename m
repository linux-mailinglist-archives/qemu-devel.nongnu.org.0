Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AE93CFB8A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:04:29 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qMG-0003DZ-TM
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5qKp-0002Nu-Sz; Tue, 20 Jul 2021 10:02:59 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5qKh-00032W-RK; Tue, 20 Jul 2021 10:02:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AD31D74570C;
 Tue, 20 Jul 2021 16:02:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 70DB8745708; Tue, 20 Jul 2021 16:02:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6DE3774570B;
 Tue, 20 Jul 2021 16:02:43 +0200 (CEST)
Date: Tue, 20 Jul 2021 16:02:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: luigi burdo <intermediadc@hotmail.com>
Subject: Re: R: R: [PULL 0/3] ppc-for-6.1 queue 20210713
In-Reply-To: <AM7PR03MB6579113A5DB8C252A57CEB00C8E19@AM7PR03MB6579.eurprd03.prod.outlook.com>
Message-ID: <36811435-c01f-ab84-9525-2a4cfa282ace@eik.bme.hu>
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
 <AM7PR03MB65797B7495CACEE7AA4C70A0C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>,
 <ff76ae6-28a7-7139-9c58-ed507f438d89@eik.bme.hu>
 <AM7PR03MB6579113A5DB8C252A57CEB00C8E19@AM7PR03MB6579.eurprd03.prod.outlook.com>
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On Tue, 20 Jul 2021, luigi burdo wrote:
> i was able to build on my quad qemu, a ram bank was die and make me the issue with gcc..
> this is what happening if i run pegasos 2 with --enable-kvm.

OK. Can you also show the full command so we know what options you used?

> via_superio_cfg: unimplemented register 0xf2
> via_superio_cfg: unimplemented register 0xf4
> via_superio_cfg: unimplemented register 0xf6
> via_superio_cfg: unimplemented register 0xf7
> via_superio_cfg: unimplemented register 0xf4
> via_superio_cfg: unimplemented register 0xf2
> PegasosII Boot Strap (c) 2002-2003 bplan GmbH
> Running on CPU PVR:000C0209
> Enable L1 ICache...                                                    Done.
> mv64361_write: Unimplemented register write 0x108 = 0
> Reading W83194 :                                                       FAILED.
> Setting Front Side Bus to 133MHz...                                    FAILED.
> Invalid access at addr 0xFE000E43, size 1, region '(null)', reason: rejected

So this shows that what I've seen on emulated KVM (running QEMU in a PPC 
Linux guest running on qemu-system-ppc64 -M mac99) does not match what 
real hardware does so that could be a bug in emulated KVM. As shown at the 
end of this message:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00146.html

I did not get the Invalid access warning but instead got endless kvm exits 
with the NIP not incrementing past the instruction doing this invalid 
access so probably there's a problem with handling invalid access with 
emulated KVM PR but I don't know where to look for that problem or how to 
fix it. It could also be a bug in guest kernel or QEMU, I'm not sure. Hope 
somebody with more knowledge about PPC KVM could give some hints. 
Aparently this is not a problem on real machine where it works as expected 
(the Invalid address is because we don't emulate this device but it's not 
needed and it boots without it and we get the same warnings with TCG).

> Invalid access at addr 0xFE000E44, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE000E41, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE000E42, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE000E40, size 1, region '(null)', reason: rejected
> Configuring DDR...mv64361_write: Unimplemented register write 0x1494 = 291
[...]
> Releasing IDE reset ...                                                Done.
> Configuring Legacy Devices
> Initializing KBD...Invalid access at addr 0xFE0003F0, size 1, region '(null)', reason: rejected
>                                                    Done.
> via_superio_cfg: unimplemented register 0xf6
> via_superio_cfg: unimplemented register 0xf7
> via_superio_cfg: unimplemented register 0xf2
> Invalid access at addr 0xFE000084, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE000085, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE000086, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE000088, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE00008C, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE00008D, size 1, region '(null)', reason: rejected
> Invalid access at addr 0xFE00008E, size 1, region '(null)', reason: rejected
> Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000

So does it stop here or do you get to the firmware ok prompt?

> In dmesg i had many of this.
>
> [ 3634.418495] kvmppc_exit_pr_progint: emulation at 700 failed (00000700)
> [ 3634.418525] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
> [ 3634.418551] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
> [ 3634.418577] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
> [ 3634.418603] Couldn't emulate instr...

This looks like we're getting Program Exceptions that's raised for invalid 
instructions so either it's going off track and tries to execute something 
it should not or could be that since we're running G4 code on a G5 there 
may be some differences so an instruction valid on G4 could be invalid on 
G5? KVM should handle these but not sure it does for all such cases or it 
works correctly as this was probably not tested for a while. We would need 
to know where it got the exception but the above logs don't show that. Was 
there anything before these? Maybe there's a kvm trace you can enable or 
adding -d int would show the exception but that would generate a lot of 
logs so you may need to filter out some unneeded ones to find the relevant 
logs. We'd need the address where it got the exception that make it go to 
0x700 and the opcode at that address. The logs above only show that it got 
to 0x700 and got endless exceptions where as a handler for Program 
Exception should be at 0x700 but probably the firmware did not install one 
as it should not get such exceptions when working normally on a G4. Which 
firmware version are you using? The 1.1 from up050404 should work but the 
1.2 from MorphOS storage is known to have a cmpd instruction that's 
invalid on G4 yet it works but may raise an exception or do something else 
on G5. With TCG that's fixed by this patch:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-07/msg00207.html

that's not in master yet but if using that firmware version this may also 
cause problem in KVM if it does not do the same on G5 than on G4. I don't 
know if that's the case but it's a possibility. Once we find out what 
opcode is causing the program exception we can look up in the G5 and G4 
manuals to see why it gets the exception and what can we do about it.

> i will build  latest linux kernel and do new test.

Apart from that you could also try what happens with the sc 1 calls that 
is used but VOF when you use -kernel boot.img instead of -bios 
pegasos2.rom. I got the host QEMU crash with that when trying on emulated 
KVM but if it works on real hardware that could also be fixed in emulation 
so I can at least reproduce the problems you find on real hardware.

Regards,
BALATON Zoltan

