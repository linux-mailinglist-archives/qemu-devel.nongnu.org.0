Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1D34075B1
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 11:04:47 +0200 (CEST)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOywH-00046t-B8
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 05:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOyun-0003PC-TP
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:03:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:34484
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOyul-0000RZ-E0
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:03:13 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mOyuc-00097Q-QR; Sat, 11 Sep 2021 10:03:07 +0100
To: Howard Spoelstra <hsp.cat7@gmail.com>, Helge Konetzka <hk@zapateado.de>
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
 <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6ae0c8d0-4601-4c2c-c0cd-590f2a86a104@ilande.co.uk>
Date: Sat, 11 Sep 2021 10:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.349,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/09/2021 09:43, Howard Spoelstra wrote:

> On Sat, Sep 11, 2021 at 8:29 AM Helge Konetzka <hk@zapateado.de 
> <mailto:hk@zapateado.de>> wrote:
> 
>     Am 10.09.21 um 17:44 schrieb Paolo Bonzini:
>      > On 25/08/21 18:43, Helge Konetzka wrote:
>      >> Furthermore I would like to propose to change the instructions for
>      >> Native builds with MSYS2 on Wiki Windows page.
>      >>
>      >> Please remove the section which copies system binaries to match the
>      >> expected file names!
>      >>
>      >> Instead define variables for configure (gcc-ar and gcc-ranlib are
>      >> existing copies of x86_64-w64-mingw32-gcc-ar and
>      >> x86_64-w64-mingw32-gcc-ranlib) and add strip to enable make install:
>      >>
>      >> AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres
>      >> STRIP=strip \
>      >> ./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl
>      >
>      > Do you even need anything but "./configure"? (possibly AR=gcc-ar NM=nm
>      > at the beginning)?
> 
>     Sorry for being indistinct!
> 
>     My intention was to put "AR=gcc-ar NM=nm OBJCOPY=objcopy
>     RANLIB=gcc-ranlib WINDRES=windres STRIP=strip" in front of "./configure"
>     (see the '\' after STRIP=strip) instead of copying binaries:
> 
>     diff -Naur qemu.org.orig/Hosts/W32 qemu.org/Hosts/W32 <http://qemu.org/Hosts/W32>
>     --- qemu.org.orig/Hosts/W32     2021-09-11 08:27:01.198715675 +0200
>     +++ qemu.org/Hosts/W32 <http://qemu.org/Hosts/W32>  2021-09-11 08:28:15.853605118
>     +0200
>     @@ -232,14 +232,6 @@
>            Close the MSYS2 console.
>            Start mingw64.exe.
> 
>     -cd /mingw64/bin
>     -cp x86_64-w64-mingw32-gcc-ar.exe x86_64-w64-mingw32-ar.exe
>     -cp x86_64-w64-mingw32-gcc-ranlib.exe x86_64-w64-mingw32-ranlib.exe
>     -cp windres.exe x86_64-w64-mingw32-windres.exe
>     -cp nm.exe x86_64-w64-mingw32-nm.exe
>     -cp objcopy.exe x86_64-w64-mingw32-objcopy.exe
>     -cd ~
>     -
>            Download the QEMU source code:
> 
>        git clone https://www.github.com/qemu/qemu <https://www.github.com/qemu/qemu>
>     @@ -247,6 +239,7 @@
>            Finally build QEMU with:
> 
>        cd qemu
>     +AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib WINDRES=windres
>     STRIP=strip \
>        ./configure --cross-prefix=x86_64-w64-mingw32- --enable-gtk --enable-sdl
>        make
> 
> Hi,
> 
> I wrote those instructions as I obviously could not find a better way to get Qemu to 
> cross-compile using MSYS2 in Windows.
> When you look at configure, you see that only adding the cross-prefix will not find 
> the MSYS equivalents of some tools:
> 
> ar="${AR-${cross_prefix}ar}"
> looks for x86_64-w64-mingw32-ar.exe and not (as it is named in MSYS2) 
> x86_64-w64-mingw32-gcc-ar.exe
> 
> Perhaps it would be better to fix configure for the MSYS2 case so the flags or the 
> renaming are not required?

FWIW it was me that added the MSYS2 section to the wiki since I had a requirement to 
do some bespoke Windows builds (see 
https://wiki.qemu.org/index.php?title=Hosts/W32&diff=6803&oldid=5723).

As you can see at that point in time there was no need to copy binaries with 
different names, or pass --cross-prefix into configure.

So the question is: what has changed? I find it hard to believe that MSYS2/MingW64 is 
configured out-of-the-box to break a standard "./configure && make" build incantation.


ATB,

Mark.

