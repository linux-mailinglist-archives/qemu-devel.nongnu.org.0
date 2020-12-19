Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E389C2DF060
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 17:04:36 +0100 (CET)
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqeih-0004tb-DE
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 11:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kqehS-0004O6-9P
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 11:03:18 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kqehO-00009T-PX
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 11:03:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BFFC17470DD;
 Sat, 19 Dec 2020 17:03:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7EABD74646C; Sat, 19 Dec 2020 17:03:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7CF80746383;
 Sat, 19 Dec 2020 17:03:09 +0100 (CET)
Date: Sat, 19 Dec 2020 17:03:09 +0100 (CET)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 0/8] hm/mips/fuloong2e fixes
In-Reply-To: <5cb09aab-f425-4faa-969d-9df324768af2@www.fastmail.com>
Message-ID: <b3e15e5d-2ecf-9364-1963-3d6dae5b7b7@eik.bme.hu>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <516bc88e-d49-94f9-b4a2-a9d31e9026@eik.bme.hu>
 <5cb09aab-f425-4faa-969d-9df324768af2@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-367278282-1608393789=:87178"
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
Cc: chenhuacai@kernel.org, qemu-devel@nongnu.org, wainersm@redhat.com,
 f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-367278282-1608393789=:87178
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 19 Dec 2020, Jiaxun Yang wrote:
> 在2020年12月19日十二月 下午8:13，BALATON Zoltan写道：
>> On Sat, 19 Dec 2020, Jiaxun Yang wrote:
>>> It can now boot Debian installer[1] as well as a custom PMON bootloader
>>> distribution[2].
>>>
>>> Note that it can't boot PMON shipped with actual machine as our ATI vgabios
>>> is using some x86 hack that can't be handled by x86emu in original PMON.
>>
>> This may be similar problem that I've seen with similar PPC firmwares:
>>
>> https://osdn.net/projects/qmiga/wiki/SubprojectAti
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2#h3-Known.20issues
>>
>> TLDR; vgabios-ati.bin is compiled for i386 real mode (bacause that's what
>> gcc can do, real x86 real mode would need something like bcc I think) that
>> some x86emu can't handle. You can either use Bochs vga bios via romfile
>> property of the vga emulation or try the option for x86emu when compiling
>> vgabios-ati.bin (which did not help the firmwares I've tried).
>
> Hi,
>
> Thinks for your reminder!
>
> To be more specified, our x86emu in PMON can handle i386 real mode,
> however vgabios-ati uses INT15h when INT10h ax=0x4f01 (Get VESA Mode)
> is called. And x86emu won't process INT15h properly.
>
> My workround[1] is to allow 0x4f01 to be failed in PMON, as ax=0x4f02
> (Set VESA Mode) do work, it won't be a actual problem.

Adding Gerd who is the vgabios maintainer and added the VESA mode support 
so he knows about this even if no fix is needed but maybe he knows a 
simple way to work around it anyway. Maybe this could be related to my 
problems too but with the sam460ex firmware I did not get any output, it 
just stops (did not check u-boot-sam460ex source yet), but with the 
pegasos2 firmware I got this diagnostics:

INTERNAL ERROR: 0000000E=UNIMPLEMENTED EXTENDED OPCODE

EAX=0000 EBX=0000 ECX=2222 EDX=3333 ESP=0000 EBP=0000 ESI=6666 EDI=0000
  AX=0055  BX=FFDA  CX=2222  DX=3333  SP=FF86  BP=FF9A  SI=6666  DI=FFA6
  DS=1000  ES=BAD0  SS=1000  CS=C000  IP=2E05   NV UP -- PL NZ NA PE NC
CS:IP = 0F
STACK: 0000 0000 0000 0000 FFDA 0000 6666 6666
   00: FE00 F000 FE01 F000 FE02 F000 FE03 F000
   10: FE04 F000 FE05 F000 FE06 F000 FE07 F000
   20: FE08 F000 FE09 F000 FE0A F000 FE0B F000
   30: FE0C F000 FE0D F000 FE0E F000 FE0F F000
   40: FE10 F000 FE11 F000 FE12 F000 FE13 F000
   50: FE14 F000 FE15 F000 FE16 F000 FE17 F000
   60: FE18 F000 FE19 F000 FE1A F000 FE1B F000
   70: FE1C F000 FE1D F000 FE1E F000 FE1F F000
   80: FE20 F000 FE21 F000 FE22 F000 FE23 F000
   90: FE24 F000 FE25 F000 FE26 F000 FE27 F000
   A0: FE28 F000 FE29 F000 FE2A F000 FE2B F000
   B0: FE2C F000 FE2D F000 FE2E F000 FE2F F000
   C0: FE30 F000 FE31 F000 FE32 F000 FE33 F000
   D0: FE34 F000 FE35 F000 FE36 F000 FE37 F000
   E0: FE38 F000 FE39 F000 FE3A F000 FE3B F000
   F0: FE3C F000 FE3D F000 FE3E F000 FE3F F000
   00: FE40 F000 FE41 F000 FE42 F000 FE43 F000
   10: FE44 F000 FE45 F000 FE46 F000 FE47 F000
   20: FE48 F000 FE49 F000 FE4A F000 FE4B F000
   30: FE4C F000 FE4D F000 FE4E F000 FE4F F000
MISC: UNHANDLED 32 BIT DATA PREFIX AT CS:IP = 0000C000:00002E04 0F
INTERNAL ERROR: 0000000A=UNHANDLED 32BIT PREFIX

EAX=0000 EBX=0000 ECX=2222 EDX=3333 ESP=0000 EBP=0000 ESI=6666 EDI=0000
  AX=0055  BX=FFDA  CX=2222  DX=3333  SP=FF86  BP=FF9A  SI=6666  DI=FFA6
  DS=1000  ES=BAD0  SS=1000  CS=C000  IP=2E05   NV UP -- PL NZ NA PE NC
CS:IP = 0F
STACK: 0000 0000 0000 0000 FFDA 0000 6666 6666
   00: FE00 F000 FE01 F000 FE02 F000 FE03 F000
   10: FE04 F000 FE05 F000 FE06 F000 FE07 F000
   20: FE08 F000 FE09 F000 FE0A F000 FE0B F000
   30: FE0C F000 FE0D F000 FE0E F000 FE0F F000
   40: FE10 F000 FE11 F000 FE12 F000 FE13 F000
   50: FE14 F000 FE15 F000 FE16 F000 FE17 F000
   60: FE18 F000 FE19 F000 FE1A F000 FE1B F000
   70: FE1C F000 FE1D F000 FE1E F000 FE1F F000
   80: FE20 F000 FE21 F000 FE22 F000 FE23 F000
   90: FE24 F000 FE25 F000 FE26 F000 FE27 F000
   A0: FE28 F000 FE29 F000 FE2A F000 FE2B F000
   B0: FE2C F000 FE2D F000 FE2E F000 FE2F F000
   C0: FE30 F000 FE31 F000 FE32 F000 FE33 F000
   D0: FE34 F000 FE35 F000 FE36 F000 FE37 F000
   E0: FE38 F000 FE39 F000 FE3A F000 FE3B F000
   F0: FE3C F000 FE3D F000 FE3E F000 FE3F F000
   00: FE40 F000 FE41 F000 FE42 F000 FE43 F000
   10: FE44 F000 FE45 F000 FE46 F000 FE47 F000
   20: FE48 F000 FE49 F000 FE4A F000 FE4B F000
   30: FE4C F000 FE4D F000 FE4E F000 FE4F F000
Failed to emulate CS:IP [C000:2E04]=66,0F,BE,C0,E9,FB
UNHANDLED INT 10 FUNCTION 0100 WITHIN EMULATION
EA: BYTE READ FROM UNINITIALIZED LOW MEM 0040:0085
UNHANDLED INT 10 FUNCTION 0300 WITHIN EMULATION
UNHANDLED INT 10 FUNCTION 1301 WITHIN EMULATION
UNHANDLED INT 10 FUNCTION 0300 WITHIN EMULATION
UNHANDLED INT 10 FUNCTION 1301 WITHIN EMULATION
UNHANDLED INT 10 FUNCTION 0300 WITHIN EMULATION
UNHANDLED INT 10 FUNCTION 1301 WITHIN EMULATION
UNHANDLED INT 10 FUNCTION 0300 WITHIN EMULATION

which I assumed could be the same problem with sam460ex too but maybe it's 
different then.

Regards,
BALATON Zoltan

>
> - Jiaxun
>
>
--3866299591-367278282-1608393789=:87178--

