Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E4595ED
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 10:20:27 +0200 (CEST)
Received: from localhost ([::1]:57564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgm7N-0002cz-Oi
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 04:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58621)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hgm5X-000238-D6
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 04:18:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hgm5V-00062O-UE
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 04:18:31 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:35799)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hgm5V-0005wi-5q
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 04:18:29 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Movrq-1iLvVe22aE-00qRJE; Fri, 28 Jun 2019 10:05:12 +0200
To: Aleksandar Markovic <amarkovic@wavecomp.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "aleksandar.markovic@rt-rk.com" <aleksandar.markovic@rt-rk.com>
References: <156166365360.6332.12789669195894130027@c4a48874b076>
 <735eb279-4f0f-b033-6ee9-eac0262a099d@vivier.eu>
 <BN6PR2201MB1251D7AD0E7630773C962012C6FC0@BN6PR2201MB1251.namprd22.prod.outlook.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <08b90cbb-830c-5731-4039-55e2de5fb80c@vivier.eu>
Date: Fri, 28 Jun 2019 10:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <BN6PR2201MB1251D7AD0E7630773C962012C6FC0@BN6PR2201MB1251.namprd22.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8Tu0cfhL3/JpFagnIb60Sug6VvFCzC5cb8XBUgy7ky+TXp8w19P
 ndk9XIEbvbwH6u+PPOjrSPIO/X2GF1zCguvKKmkWAW0BiSoft8Rr2R+jEXZwBBFAC9LGVkv
 oUIZcHV6dSvDe75B0g9p1OOJJxxlnWTCLPBsf3rIS1IpVLw+QyDdFlsOSuEPHXRWj2t6Mt4
 t4pdqD3YLyDlhxBC7MMsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sRjcw/VDrOc=:mttL5uGXwAp8hUM6mBscqR
 Mya53gQ9VkvhtE7YQ2qoPcHkPPHGyqYpDnYzd2aEhs/VovDM3zzG2PvHtrrldR+xDxBlk8Cdh
 DhAWnTqsi9NfljokIKIc8dSN5TbOv4CuAB7/7dxnvCZ2Bg60rY946/K+jsdMaF92q/isjN4mU
 pW20WG4Bcff97I8yo/wM1vEB51cq2zSoZV4qXLtyny5VyQog2PiO5nQuQ+5kVfqfkfzwansbW
 KvD/DVPVRY1aAdvhzT4EZNRjyB6CGfH8RVbWBxhCbeS/x868HxDkDWdjI6fPf2+a18vRJXn5X
 NDLIiROJIjPLIuuGH3CXqgULuna7sD+NjjKYHDafR1MQPXUPNN8twQxPPR6LxWNLAHYoZjrjK
 R+fxuIpa9P6c2nfJ22jgKrAv3pfRjm1fIgHaXFPX03KjQxTElweCXzpo87tJ3MnE43Gj5cnmK
 eLPrxAcgf054jtAbDHyfSuFFhFalnjPl5v/CJT1wktHcEc74TYxJqLW0VE8Wsk1u5mW9F5L0b
 ZDIasmIrtc37d1FfmAJ4CAcT5LJ/rXRhm76R7Moh8Xc2qZnfXKEtXfMLMlPAc9PmxSIcfBqsP
 qQGof+QKxHkI5N3FZr8z9AsN8KWIuiTOO0587NXwx/m30aDCQHJvXG5uwftx6zbmzfGQayEdz
 cFGAkif8wOT1/KEkG5gRXgeET3J4WYWH72FgcXjvTxxWFnjA9EyzE0H3rdtHW3T5SqwRsrO3M
 o8/8FZzb0tYOMe4rEBdnpa1iZBbddNaPTmrViif3bjvdLskJk5a3ezUKj1U=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-devel] [PATCH v13 0/5] linux-user: A set of miscellaneous
 patches
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/06/2019 à 09:46, Aleksandar Markovic a écrit :
>> From: Laurent Vivier <laurent@vivier.eu>
>> Sent: Friday, June 28, 2019 9:21 AM
>> To: qemu-devel@nongnu.org; aleksandar.markovic@rt-rk.com
>> Cc: Aleksandar Markovic
>> Subject: Re: [Qemu-devel] [PATCH v13 0/5] linux-user: A set of miscellaneous patches
>>
>> Le 27/06/2019 à 21:27, no-reply@patchew.org a écrit :
>>> Patchew URL: https://patchew.org/> QEMU/1561648298-18100-1-git-send-email-aleksandar.markovic@rt-rk.com/
>>>   CC      i386-linux-user/linux-user/uname.o
>>>   CCAS    i386-linux-user/linux-user/safe-syscall.o
>>>   CC      i386-linux-user/linux-user/i386/signal.o
>>> /var/tmp/patchew-tester-tmp-zqhqa95y/src/linux-user/syscall.c:323:16: error: > conflicting types for ‘statx’
>>>   323 | _syscall5(int, statx, int, dirfd, const char *, pathname, int, flags,
>>>       |                ^~~~~
>>> /var/tmp/patchew-tester-tmp-zqhqa95y/src/linux-user/syscall.c:214:13: note: in > definition of macro ‘_syscall5’
>>>
>>
>> This is a real error. To avoid this you can rename it to "sys_statx"
>> (see sys_gettid() for instance).
>>
> 
> Ok, Laurent. But the root cause is a little deeper, I would say - the error appears because <sys/stat.h> is superfluously included, and glibc defines statx() basically in that header (in fact, in a headed that is always included by stat.h) - hence the error, I guess only for build systems with glibc >= 2.28.
> 
> I am going to remove #include <sys/stat.h> too from the patch, is that OK, in your opinion? (and, honestly, I am almost positive this line removal is sufficient for removing build error without any name changes etc.)

I'm OK with that.

We'll add the name change only if it becomes needed (if we need stat.h
for another stuff).

Thanks,
Laurent




