Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB573D0204
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:01:42 +0200 (CEST)
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uzt-0007Ks-N2
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5uy2-0006Fd-Oi; Tue, 20 Jul 2021 14:59:46 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:46764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m5uxz-0004Ts-EV; Tue, 20 Jul 2021 14:59:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 39A5E7462D3;
 Tue, 20 Jul 2021 20:59:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0696874570C; Tue, 20 Jul 2021 20:59:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 04DA97456B7;
 Tue, 20 Jul 2021 20:59:38 +0200 (CEST)
Date: Tue, 20 Jul 2021 20:59:37 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: luigi burdo <intermediadc@hotmail.com>
Subject: Re: R: R: R: [PULL 0/3] ppc-for-6.1 queue 20210713
In-Reply-To: <AM7PR03MB6579FBC28216F86ABB18A8E4C8E29@AM7PR03MB6579.eurprd03.prod.outlook.com>
Message-ID: <daee8852-9ed4-3e82-3ccf-7bfb4fedcd@eik.bme.hu>
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
 <AM7PR03MB65797B7495CACEE7AA4C70A0C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>,
 <ff76ae6-28a7-7139-9c58-ed507f438d89@eik.bme.hu>
 <AM7PR03MB6579113A5DB8C252A57CEB00C8E19@AM7PR03MB6579.eurprd03.prod.outlook.com>,
 <36811435-c01f-ab84-9525-2a4cfa282ace@eik.bme.hu>
 <AM7PR03MB6579FBC28216F86ABB18A8E4C8E29@AM7PR03MB6579.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1145900191-1626806112=:12679"
Content-ID: <cb3af74-8b97-4e79-20a0-17f4de9930ad@eik.bme.hu>
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1145900191-1626806112=:12679
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <a03ba8ef-2875-22b6-48c2-5c1e42e0e4d@eik.bme.hu>

On Tue, 20 Jul 2021, luigi burdo wrote:
> i have same issue with kvm with only qemu-system-ppc -M pegasos2 -bios pegasos2.rom --enable-kvm

Yes, OK as it already fails during the firmware then other options may not 
matter now only that you're using kvm and pegasos2 ROM.

> and with this command line that work great on my PC (without kvm of course)
>
> qemu-system-ppc -M pegasos2 -bios pegasos2.rom -device 
> ati-vga,romfile="" -display sdl -rtc base=localtime -drive 
> if=none,id=hd,file=/home/gigi/peggy2,format=raw -device 
> ide-hd,drive=hd,bus=ide.0 -drive 
> if=none,id=cd,file=/home/gigi/Chrysalis_3.15.iso -device 
> ide-cd,drive=cd,bus=ide.0 -device AC97 -m 1024 -netdev user,id=mynet0 
> -device sungem,netdev=mynet0 -serial stdio --enable-kvm

The above command should be OK but I wonder if -device AC97 works? (I 
haven't tried it but this AC97 device is emulating an AC97 audio which is 
part of an Intel chipset and pegasos2 has one that is part of VIA VT8231 
that I think has different register mappings so a driver expecting VIA 
AC97 may not work with Intel one unless it somehow detects that; in other 
words if sound is not working you can drop -device AC97 and instead look 
at implementing hw/audio/via-ac97.c similar to hw/audio/ac97.c but maching 
VIA VT8231 docs for registers, that should make sound work; other options 
may be usb-audio which does not work with mac99 but did not try with 
pegasos2 or passing through a real USB or PCI audio device). The other 
option is -netdev user,id=mynet0 -device sungem,netdev=mynet0 which I 
think is stating the default as user networking is the default so you 
could shorten it to just -device sungem with the same result (or several 
other network devices are available as sungem is usually appears on Mac or 
Sun machines not as PCI card but if it works then that does not matter). 
Using the long form may only make sense if you want something else than 
user, like tap when you need a -netdev option to enable that instead of 
user. These are just some comments to simplify the command line, not 
relevant to the problem why it's not working.

> about:
>> So does it stop here or do you get to the firmware ok prompt?
> never, with kvm enable no ok promt, without kvm enabled everything work ok (on G5 and PC).
> with kvm enabled the seriel stdio log stop and because of this i check dmesg where there i found this never ending looping message:
>> [ 3634.418495] kvmppc_exit_pr_progint: emulation at 700 failed (00000700)
>> [ 3634.418525] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
>> [ 3634.418551] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
>> [ 3634.418577] Couldn't emulate instruction 0x00000700 (op 0 xop 896)
>> [ 3634.418603] Couldn't emulate instr...

Yes, this happens because it gets an unexpected Program Exception trying 
to execute something in the ROM that raises this exception which then 
jumps to 0x700 but there's no handler there which then results in another 
Program Exception due to trying to execute garbage at 0x700 which then 
repeats endlessly. The real problem is why we get here, that is the first 
exception and what opcode caused that. So should find a way to find that 
out. I'm not sure what works with KVM (TCG just logs the invalid 
instruction with -d guest_errors but KVM runs the code on real CPU so that 
will take the exception. If there's no kvm log before the above line and 
-d int or enabling some kvm traces does not help either than we may need 
to attach a gdb and break on 0x700 then get a backtrace to find the 
address it's coming from and see what's there. There's some docs here: 
https://qemu-project.gitlab.io/qemu/system/gdb.html but basically add -s 
-S to the command line, then QEMU won't start running but wait for gdb to 
connect. From another window start gdb and type 'target remote 
localhost:1234' which should then attach to the guest in QEMU. Then you 
can examine the VM from gdb or debug it. E.g. set breakpint: b *0x700, 
start vm: c (for continue), then when you get a breakpoint hit you may be 
able to get more info with bt (for backtrace) or info registers. The only 
difference from debugging a normal program is that you won't have the 
executable so no symbols so you have to write addresses as *0x<address> 
otherwise it complains about unknown symbol as it tries to interpret it as 
a function or variable name. (If you do this on a machine that's another 
architecture like running qemu-system-ppc on x86_64 host then you need a 
cross-gdb that supports the guest arch but here we're debugging KVM VM on 
same arch host so the host gdb should work.)

>> Apart from that you could also try what happens with the sc 1 calls that
> is used but VOF when you use -kernel boot.img instead of -bios
>
> i will test kvm with VOF too and report
>
> I think to build last linux kernel just because mine last is 5.04, and im  just courious if somethig was fixed in last kernel for not make you creazy for notiing 🙂

You can try. Running the latest kernel is useful if we find something in 
KVM that needs to be reported but otherwise I'm not sure how much changes 
were made to this recently so don't think it would matter but testing with 
latest version is always a good idea to at least not chase already fixed 
bugs.

Regards,
BALATON Zoltan
--3866299591-1145900191-1626806112=:12679--

