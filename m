Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB59F8B9F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 10:23:31 +0100 (CET)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUSOY-00075M-Bg
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 04:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iUSNA-0006Wz-2h
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 04:22:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iUSN7-0007Pb-W5
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 04:22:03 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:33235)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iUSN5-0007NE-U0
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 04:22:01 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M1INQ-1iRhU13SRe-002lPj; Tue, 12 Nov 2019 10:21:56 +0100
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 Andrew Kelley <andrew@ziglang.org>
References: <7fc7a64e-cb52-fab6-5739-807b40be9c1d@ziglang.org>
 <66c80f5a-253a-722b-6f99-4e5b82078d1b@ziglang.org>
 <CAL1e-=iemtSNCyS1O6vfe1QL5EYP5tbKhZPAYJF8YQ4USPMFww@mail.gmail.com>
 <CAL1e-=hf6Z4cdZ-kfY=vg6fXWLX1Vo9R604AvDwxj7rFoXB2Tg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] enable translating statx syscalls on more arches
Message-ID: <7e108b25-565a-1047-4979-f29b3e930d1c@vivier.eu>
Date: Tue, 12 Nov 2019 10:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL1e-=hf6Z4cdZ-kfY=vg6fXWLX1Vo9R604AvDwxj7rFoXB2Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:30AzqygarOj85IDSemifOIeiOAD34NzlHF8sj6xJFE9xiYr/wt6
 jEbnWqOT5osd4FkU0vPb3J2KXgFgxsnk9R0Z9lQQsZ6QMLWkcIfK/upn7M4X5JjVo3aoA94
 qv6QNSKZ1iKTz/Gm+vMKjrZv/8kKLy1pV6otzLQ7O/hhVfQwPfcvcyskcmYoJ1VmTohEV5Y
 SjQt0vIMqLkJhm2NwaznQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+5ILh7MBLXo=:Ukn947tRAfK+pUADxf18NG
 ICPdIdnLl7xqQuCKReTQ6tJJjyxVOupyK9DVc0frj8dGnuGZasTlo4UsG+OlNYUklnzkVTZR1
 OEWbma6fdRyi6rQM7oJkAWwVBRDPTk1alVmLBr6ApOg4XrThC7psVamJImThr2+zMuUueJv/P
 QWW2Sqfkc/OjnxcAsHeodymjYvOx9hHjKv1PsXGG2KRX/x+rZR8n+g5uMapeVkYWyGpp7EotT
 ghEmnxv75kmCPtwV3b9pykCpvAW8XqLwjJqWCopBmxXi0Du4m8I1ZuC831ivHp6BA4L1qI3z6
 oW67qB3Xih+/qTcAZ/ADdt5lrUkKVU2+XCrweHNlLrnLI7ukExF/YBGgk7lUMoakKosJC/51T
 zLxYHRqcW17a9wpWSDbetMYJqT/e6IhWjp6h+mHlOJvIdexy/YrgfkpqgPDqdKQHcgvuQ68BS
 Df4LSjBwL2ro+cJ6g2LnJl9rhg0d+t0vZfe94nBk3Vi4QiA9h8SAyYDkiBjrIvtGBA2GrEAYy
 h+mxnr6EvVy4L6Nv/c7pNPIJU3ZWehSBzxA/lHXMwtodv2jSG6w31CM5BWe7cLnvZD6s1pi/X
 DINuZHUh9f3Hkcx9hcqQdGNmiJDUpefW6Tya7OnuFuZg+OeFtNJtPTvGdRgCGmgl2Y9h5CwkY
 kdeGc0hpoxbDLchbO1sKr7gSSYrkviN4GWUB6tRZ/sALGTtxweHaIuUkfHUTyFkBGU11cx2mq
 qzbVskLuoyrxF7kiruSVhna4vmwtlNwgpTq9Jj5u7nTlYDfpjePQt/zPSZVRC5UErUTKqKGBW
 fKv7IdTeccaUTCjqdpv3RsnyORuiGCMb9jdqZTjlmye218XCHnWjRLlvNZJQ3S9tPEtFMnvGY
 sGkQRAjZSFgrdH5RLJTxXpEa6ur9qoDmkovUjazw4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/11/2019 à 09:27, Aleksandar Markovic a écrit :
> 
> 
> On Tuesday, November 12, 2019, Aleksandar Markovic
> <aleksandar.m.mail@gmail.com <mailto:aleksandar.m.mail@gmail.com>> wrote:
> 
> 
> 
>     On Tuesday, November 12, 2019, Andrew Kelley <andrew@ziglang.org
>     <mailto:andrew@ziglang.org>> wrote:
> 
>         ping
> 
>         On 10/16/19 5:01 PM, Andrew Kelley wrote:
>         > Signed-off-by: Andrew Kelley <andrew@ziglang.org
>         <mailto:andrew@ziglang.org>>
>         > ---
>         >  linux-user/aarch64/syscall_nr.h | 13 ++++++++++
>         >  linux-user/arm/syscall_nr.h     | 38 ++++++++++++++++++++++++++++
>         >  linux-user/i386/syscall_nr.h    | 43
>         ++++++++++++++++++++++++++++++++
>         >  linux-user/mips/cpu_loop.c      |  6 +++++
>         >  linux-user/ppc/syscall_nr.h     | 44
>         +++++++++++++++++++++++++++++++++
>         >  5 files changed, 144 insertions(+)
>         > 
> 
> 
>     Hello, Andrew.
> 
>     I support your change, but its title is not appropriate. It should
>     have been "linux-user: Update system call code numbers for some
>     targets" or similar. Also, you should have mentioned Laurent Vivier
>     in cc. Also, are other targets updated? If not, I think you should
>     include them as well. Additionally, what was the version (or commit
>     number) of the kernel uou used as the reference?
> 
>     Thanks, Aleksandar
> 
> 
> 
> Forwarding to Laurent.

Thank you Aleksandar,

> Laurent, can this or similar patch be integrated into 4.2? It can be
> viewed as a bug fix, in a way.
> 

Yes, but we need in the commit message the release version of the kernel
they come from. Updating the other targets would be great too.

Thanks,
Laurent


