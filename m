Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C851ABEFD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 13:20:02 +0200 (CEST)
Received: from localhost ([::1]:60994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jP2Yr-0006Zq-FS
	for lists+qemu-devel@lfdr.de; Thu, 16 Apr 2020 07:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jP2Xs-00069Q-P2
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 07:19:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jP2Xq-0001ZY-4G
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 07:19:00 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37705)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jP2Xp-0001Yk-SR
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 07:18:58 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8yoa-1jMGaI3fIk-0063xh; Thu, 16 Apr 2020 13:18:53 +0200
Subject: Re: m68k: gdbstub crashing setting float register on cfv4e cpu
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <3be54f78-cf6d-af3b-6e1f-e91d146c6a3a@amsat.org>
 <87sgh680qb.fsf@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7922d9aa-f849-7774-7f6e-71ce3dacde43@vivier.eu>
Date: Thu, 16 Apr 2020 13:18:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87sgh680qb.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ljKSSWSShddrsw3NPOe3R/2MooOL4c8pUJUtKYyh3i4yyzqxGln
 /Q76mKLO7hKUzxY/Q7fRnpEiZXCXVWDgYv+FksTpmDBJwFxCIl0j4/FVfruGljS1gJ77JGt
 BOT/H0kKkpqwoYQNnRBtOKJXW3LyJqPIO2HSD/YL06G3AwDbd1natRTfW5W6gGPHvregIbY
 CXcFq0hFv/aJ2xqrsYslw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:39oiFbmnIOE=:oYHhlDzYniXaviasFbEqyN
 SPbH3o6dRyxZrirWnL43JW7asPCZzu0PwlU3fdEt+2DinAhQ3D7k4b4AruGJ9IDUTHupf0wum
 7kTachonUIjT0aVZ7+Rx0fB0IBD0eCp3XNpTqcjtx1ABASY6AMIxCVSBT6yq7rQSj6QQEGV/D
 D1omp9caChPUgASmRTUKZbSJhhdIMhO1AJ/D6wOsoIgeb+Gwl8oS/3ZBBpoWYFZ8vNoS+YI5L
 7R3p4igeBi00hPJfC0zvu/F88aAuJwGY+BTSw2Yddc/uS0O/QzcJrbXWjlr3hppMToeO+h1i7
 IIJ3Z7xsiZEF319agGCWwbOWxANUG4ueAWRVf23nVbVqB7I3WOgYXTEcrCcGlo8vOaZodlr7Y
 o8I05kIEGmwM2XKJlUXS+aR/l6Z/VWH3/Uh3HUM1TFpn49Yz+xM2Wp+KV1V5aLs0QcffzBkUZ
 L6rQ3T6DqdDMu0vqI+3uxfSLk2ABS78cft0xOOI895zqx0Cdv/dXnJcNObeC8Zer2R+RUR5yU
 dDb/z8ylTdCK1nfUJe6eYGMqRmEKrT36JFQk7itH9szZCSAoBiOFLOBXGN0ka090Vc+uqecqK
 l3DIYzXbqnw6ULprIxT4TEz+7na2Ahj90RnOEMGYdGEa+53jruG98UGxlTOgNgN0Y4NLV5wJ0
 X7oEbiqjJGPrCwsHNEiCOv9CZPLPLSUog8EpRWaEQZ34+96nMrQL7FEHj5RrMKw69eQJu4Mde
 NQiN/Qn7SPk653o82j9+B1LsOn0/rcjvqm9BJGaZCwgkJNci6K3hS3nfFbHXztaJUP3F9u2FZ
 VdH9McrxKMFF+RjxwPQ0yK/xLEtsYb2J1GZBNZxu8BU3TtN+Bo3akhLc0xaarjfPmNKCpd0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/04/2020 à 18:56, Alex Bennée a écrit :
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> gdbstub/m68k seems broken with floats, previous to refactor commit
>> a010bdbe719 ("extend GByteArray to read register helpers").
>>
>> HEAD at 6fb1603aa2:
>>
>> $ qemu-system-m68k -s -S -cpu cfv4e
>>
>> ---[GUEST]---
>>
>> (gdb) set architecture m68k:cfv4e
>> The target architecture is assumed to be m68k:cfv4e
>> (gdb) target remote 172.17.0.1:1234
>> Remote debugging using 172.17.0.1:1234
>> (gdb) info float
>> fp0            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fp1            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fp2            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fp3            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fp4            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fp5            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fp6            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fp7            -nan(0xfffffffffff7f) (raw 0xffffffffffffff7f)
>> fpcontrol      0x0                 0
>> fpstatus       0x0                 0
>> fpiaddr        0x0                 0x0
>> (gdb) set $fp0=1
>> Remote communication error.  Target disconnected.: Connection reset by
>> peer.
> 
> With my sha1 debugging test case I get different results depending on
> the cpu type:
> 
>   /home/alex/lsrc/qemu.git/tests/guest-debug/run-test.py --gdb /home/alex/src/tools/binutils-gdb.git/builds/all/install/bin/gdb --qemu /home/alex/lsrc/qemu.git/builds/user.static/m68k-linux-user/qemu-m68k --qargs "" --bin tests/tcg/m68k-linux-user/sha1 --test /home/alex/lsrc/qemu.git/tests/tcg/multiarch/gdbstub/sha1.py
>   GNU gdb (GDB) 10.0.50.20200414-git
>   Copyright (C) 2020 Free Software Foundation, Inc.
>   License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
>   This is free software: you are free to change and redistribute it.
>   There is NO WARRANTY, to the extent permitted by law.
>   Type "show copying" and "show warranty" for details.
>   This GDB was configured as "x86_64-pc-linux-gnu".
>   Type "show configuration" for configuration details.
>   For bug reporting instructions, please see:
>   <http://www.gnu.org/software/gdb/bugs/>.
>   Find the GDB manual and other documentation resources online at:
>       <http://www.gnu.org/software/gdb/documentation/>.
> 
>   For help, type "help".
>   Type "apropos word" to search for commands related to "word"...
>   Executed .gdbinit
>   Reading symbols from tests/tcg/m68k-linux-user/sha1...
>   Remote debugging using localhost:1234
>   warning: Register "fp0" has an unsupported size (96 bits)
>   warning: Register "fp1" has an unsupported size (96 bits)
>   warning: Register "fp2" has an unsupported size (96 bits)
>   warning: Register "fp3" has an unsupported size (96 bits)
>   warning: Register "fp4" has an unsupported size (96 bits)
>   warning: Register "fp5" has an unsupported size (96 bits)
>   warning: Register "fp6" has an unsupported size (96 bits)
>   warning: Register "fp7" has an unsupported size (96 bits)
>   Remote 'g' packet reply is too long (expected 148 bytes, got 180 bytes): 000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000408009f000000000800003407fff0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff7fff0000ffffffffffffffff000000000000000000000000

This is a bug in GDB that doesn't support 96bit float registers of 680x0
but only 64bit registers of coldfire.

There was a rework of GDB in the past that has broken that and no one
noticed. I bisected and found the commit but it was really too complex
and difficult to fix.

To be able to debug remotely m68k I use gdb from etch-m68k in a chroot
(or from real hardware).

Thanks,
Laurent

