Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4E1AD0D6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 22:07:39 +0200 (CEST)
Received: from localhost ([::1]:38862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPAnS-00058a-SY
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 16:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56591)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pierre@freepascal.org>) id 1jPAjI-0000ZR-TR
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 16:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pierre@freepascal.org>) id 1jPAjG-0001mU-86
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 16:03:20 -0400
Received: from vps46799.freepascal.org ([85.222.228.11]:40470
 helo=mail.freepascal.org) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <pierre@freepascal.org>) id 1jPAjF-0001ln-VJ
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 16:03:18 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.freepascal.org (Postfix) with ESMTP id 0FEF6800A7;
 Thu, 16 Apr 2020 22:03:16 +0200 (CEST)
Received: from mail.freepascal.org ([127.0.0.1])
 by localhost (idefix.freepascal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HlsIXG4QbOH; Thu, 16 Apr 2020 22:03:15 +0200 (CEST)
Received: from [192.168.2.110] (lec67-1-81-56-105-56.fbx.proxad.net
 [81.56.105.56])
 by mail.freepascal.org (Postfix) with ESMTPSA id 81D6E80073;
 Thu, 16 Apr 2020 22:03:15 +0200 (CEST)
Subject: Re: m68k: gdbstub crashing setting float register on cfv4e cpu
To: Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <3be54f78-cf6d-af3b-6e1f-e91d146c6a3a@amsat.org>
 <87sgh680qb.fsf@linaro.org> <7922d9aa-f849-7774-7f6e-71ce3dacde43@vivier.eu>
From: Pierre Muller <pierre@freepascal.org>
Autocrypt: addr=pierre@freepascal.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3f2fdc71-26d7-209b-02bc-4521dfe31b08@freepascal.org>
Date: Thu, 16 Apr 2020 22:03:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7922d9aa-f849-7774-7f6e-71ce3dacde43@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 85.222.228.11
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
Reply-To: Pierre Muller <pierre@freepascal.org>
Cc: Thomas Huth <huth@tuxfamily.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/04/2020 =C3=A0 13:18, Laurent Vivier a =C3=A9crit :
> Le 14/04/2020 =C3=A0 18:56, Alex Benn=C3=A9e a =C3=A9crit :
>>
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>
>>> gdbstub/m68k seems broken with floats, previous to refactor commit
>>> a010bdbe719 ("extend GByteArray to read register helpers").
>>>
>>> HEAD at 6fb1603aa2:
>>>
>>> $ qemu-system-m68k -s -S -cpu cfv4e
>>>
>>> ---[GUEST]---
>>>
>>> (gdb) set architecture m68k:cfv4e
>>> The target architecture is assumed to be m68k:cfv4e
>>> (gdb) target remote 172.17.0.1:1234
>>> Remote debugging using 172.17.0.1:1234
>>> (gdb) info float
>>> fp0            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fp1            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fp2            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fp3            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fp4            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fp5            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fp6            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fp7            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>>> fpcontrol      0x0                 0
>>> fpstatus       0x0                 0
>>> fpiaddr        0x0                 0x0
>>> (gdb) set $fp0=3D1
>>> Remote communication error.  Target disconnected.: Connection reset b=
y
>>> peer.
>>
>> With my sha1 debugging test case I get different results depending on
>> the cpu type:
>>
>>   /home/alex/lsrc/qemu.git/tests/guest-debug/run-test.py --gdb /home/a=
lex/src/tools/binutils-gdb.git/builds/all/install/bin/gdb --qemu /home/al=
ex/lsrc/qemu.git/builds/user.static/m68k-linux-user/qemu-m68k --qargs "" =
--bin tests/tcg/m68k-linux-user/sha1 --test
/home/alex/lsrc/qemu.git/tests/tcg/multiarch/gdbstub/sha1.py
>>   GNU gdb (GDB) 10.0.50.20200414-git
>>   Copyright (C) 2020 Free Software Foundation, Inc.
>>   License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/=
gpl.html>
>>   This is free software: you are free to change and redistribute it.
>>   There is NO WARRANTY, to the extent permitted by law.
>>   Type "show copying" and "show warranty" for details.
>>   This GDB was configured as "x86_64-pc-linux-gnu".
>>   Type "show configuration" for configuration details.
>>   For bug reporting instructions, please see:
>>   <http://www.gnu.org/software/gdb/bugs/>.
>>   Find the GDB manual and other documentation resources online at:
>>       <http://www.gnu.org/software/gdb/documentation/>.
>>
>>   For help, type "help".
>>   Type "apropos word" to search for commands related to "word"...
>>   Executed .gdbinit
>>   Reading symbols from tests/tcg/m68k-linux-user/sha1...
>>   Remote debugging using localhost:1234
>>   warning: Register "fp0" has an unsupported size (96 bits)
>>   warning: Register "fp1" has an unsupported size (96 bits)
>>   warning: Register "fp2" has an unsupported size (96 bits)
>>   warning: Register "fp3" has an unsupported size (96 bits)
>>   warning: Register "fp4" has an unsupported size (96 bits)
>>   warning: Register "fp5" has an unsupported size (96 bits)
>>   warning: Register "fp6" has an unsupported size (96 bits)
>>   warning: Register "fp7" has an unsupported size (96 bits)
>>   Remote 'g' packet reply is too long (expected 148 bytes, got 180 byt=
es):
0000000000000000000000000000000000000000000000000000000000000000000000000=
00000000000000000000000000000000000000000000000408009f000000000800003407f=
ff0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff7ff=
f0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff7fff=
0000ffffffffffffffff7fff0000ffffffffffffffff000000000000000000000000
>
> This is a bug in GDB that doesn't support 96bit float registers of 680x=
0
> but only 64bit registers of coldfire.
>
> There was a rework of GDB in the past that has broken that and no one
> noticed. I bisected and found the commit but it was really too complex
> and difficult to fix.
>
> To be able to debug remotely m68k I use gdb from etch-m68k in a chroot
> (or from real hardware).

  I do have a fix for gdb-8.3 release: it works for me.
See patch below,

  You could test it out on other versions,
changes to m68k-tdep.c are not that big in recent GDB releases.
  I use it with a locally modified qemu to try to support FPU
exceptions for m68k FPU.
  But I never found the time nor the enery to try to submit those
to qemu-devel, especially after viewing what happened to a similar
attempt for powerpc hardware fpu support.
See "[RFC PATCH v2] target/ppc: Enable hardfloat for PPC" thread, up to
https://lists.nongnu.org/archive/html/qemu-ppc/2020-03/msg00006.html


Pierre Muller


muller@gcc123:~/gnu/gdb$ cat gdb-8.3-m68k-fpu-fix.patch
diff -rc gdb-8.3/gdb/m68k-tdep.c gdb-8.3-for-m68k/gdb/m68k-tdep.c
*** gdb-8.3/gdb/m68k-tdep.c     2019-02-27 04:51:50.000000000 +0000
--- gdb-8.3-for-m68k/gdb/m68k-tdep.c    2019-09-30 14:28:02.632962365 +00=
00
***************
*** 1124,1131 ****
--- 1124,1136 ----

        feature =3D tdesc_find_feature (info.target_desc,
                                    "org.gnu.gdb.coldfire.fp");
+       if (!feature)
+       feature =3D tdesc_find_feature (info.target_desc,
+                                     "org.gnu.gdb.m68k.fp");
        if (feature !=3D NULL)
        {
+         int bitsize;
+
          valid_p =3D 1;
          for (i =3D M68K_FP0_REGNUM; i <=3D M68K_FPI_REGNUM; i++)
            valid_p &=3D tdesc_numbered_register (feature, tdesc_data, i,
***************
*** 1135,1140 ****
--- 1140,1155 ----
              tdesc_data_cleanup (tdesc_data);
              return NULL;
            }
+           bitsize =3D tdesc_register_bitsize (feature, "fp0");
+           if (bitsize =3D=3D 64)
+             long_double_format =3D floatformats_ieee_double;
+         else if (bitsize =3D=3D 96)
+             long_double_format =3D floatformats_m68881_ext;
+         else
+           {
+             tdesc_data_cleanup (tdesc_data);
+             return NULL;
+           }
        }
        else
        has_fp =3D 0;
***************
*** 1181,1188 ****
    tdep->fpregs_present =3D has_fp;
    tdep->flavour =3D flavour;

-   if (flavour =3D=3D m68k_coldfire_flavour || flavour =3D=3D m68k_fido_=
flavour)
-     long_double_format =3D floatformats_ieee_double;
    set_gdbarch_long_double_format (gdbarch, long_double_format);
    set_gdbarch_long_double_bit (gdbarch, long_double_format[0]->totalsiz=
e);

--- 1196,1201 ----


