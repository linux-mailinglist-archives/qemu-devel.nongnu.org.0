Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A364D79B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 09:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5jP3-0004jj-OA; Thu, 15 Dec 2022 03:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5jOp-0004f6-Lj
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 03:15:28 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p5jOn-0000cp-Nz
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 03:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671092120; bh=N5saQ6v2p1ktEl2mIg5ih20+IA4YBuTRL19hw6TFnMQ=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=eLiNfnVF6q5xnD3vKvL+glmL3cB9xPgEj8cB8SD7qPf4huKoYDUgI/WgQYnOzWWJe
 F1lJIHfM+0C8OM9cHRKMSmsTQSKzcl9N2cCl9Mha2LYwPmQwUg9CKuo4FhmlZyQNaG
 UCTWYz9KsgvdBhV/4BJfKfUXHmLC0EydrOptDSo6aDfszNff0DfEGqq122Eo379Fdt
 WFLhVHO60cZYOZNIibtf5kWMmoVgA8rK++RAdS/RRniynDpiVCDAW+Lb0+eJsykGWt
 V7UhYYL64C4g5+h/43kUCX2pou68K1XR6JeoMUnFyj5OYwDWOUoi6FNEK/M/IXCO4s
 hFjwIRjI6TTBg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.161.210]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5Q5-1pAxvr1vt9-00FFcK; Thu, 15
 Dec 2022 09:15:20 +0100
Message-ID: <4425d130-42f3-e15b-c29f-eed81f4bc7dc@gmx.de>
Date: Thu, 15 Dec 2022 09:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Add translation for argument of msync()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <Y5rMcts4qe15RaVN@p100>
 <165fbdfe-8e72-0ab7-727e-0f54df9957b3@linaro.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <165fbdfe-8e72-0ab7-727e-0f54df9957b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y7HOVyOBG87+4vcWQeQ3ap7CLvhfQVCjodoDD0KocafcKbH7k1f
 f4+x0P7dyk7H6bafVh9Cy9VBXcRM/BgehtAwXvh7lI3Sr8FUfEc8j2uwPREWe7O/NMhVxCQ
 X8RShfvV3zxKJLZM5YjBFuHJHDX/F2bc+qUWxd1ct/zopIUrHFn1NgGgoFGVJ+JOIqnwsiy
 pu28e5b5VwQfPq8F7aZtg==
UI-OutboundReport: notjunk:1;M01:P0:BYz6XYT9W/g=;oDN+CKul/feAdgbwJum+Vhw/ctp
 8ArPOIu6Dyr3vfu8kgI6Fz06LdztTWMJi5s+QP8rfqTBN74V6Jjl3L8uxfLNK6zT731eyRxG9
 VdR5Mw0qlgkkpCurIGrGOY7HvH6HZoJR7LymNYYpPmz/ksIEC/MoCRvTKC3I5O9nrZU9oOBiX
 NaHSTTjXMGDC2Z/FxQLA7DYHkFY3JbR8uQVIT9sxqMS+1LImWOgrUX8J78OquzyIDyMGl1WsC
 R2Kt00kKuvxD/Z3B+3DhElmXp0cGuGH0BhEOXxtycUN4Uf4iOcNsmx4ya13d43a2myGafOmTz
 2OtCt2kD3asLzilmghoGYOJwON+/Iw0HpuIUE+Q5U4b+PrCtpEQra0Zv4g0nW0ohtUzEsYDyV
 jnLEyyIte6hFQ+4b6pw+S6hLHtPZetehqQ9Sk/+9aYUXryUq0KovT8iOhh5MlmV47iEM1LTTO
 Ai/kRuVZXHfTwJQGmrkmmsEd8siZS7d+L8mMmKVh7/07BeA//RWVHOF/9MfG+ZFlkuC/RSCYI
 L4vMdRGmbNEBXwB+Lk8djdbPXhR+YXm3Y/gHlXtO4EyU8R+lUmukKEt/gG0Juq8NPPCEpf4m7
 sFJymkGoUEv/4xL5X52+n11ng5xGAMEsk2v1c8nyCarsh1dZWv/LgToW/2wL04rKtBIPQPjdP
 h6eaf/z00lb7zW9njRHbxupHm9uEe6mt7ljRCax/LTMtDTBkN+Ve2atq2SkehBxfc4qCYKp8w
 tCi/tnBmxnapmbvQNoVDWYoechuxvFA3btolpQ24KZvONNraY16BXaXKA6Qyh/E2cB0aAq9IV
 0/fItlqja34LID1pWRUuueAV2pKWH/hIs71872bCGMv4plBracdUMkDk7y/rSQNhaAh53F3Cz
 IU0X1XlobN1PJ0JO+n9A4M+UwODTgQpQorAJRcAcmEtu+cyzys9x6CS/wgJNRA5BwmLF4P2xU
 ZFwJsMpVR3GSLn64todfxN036DE=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/15/22 08:58, Philippe Mathieu-Daud=C3=A9 wrote:
> On 15/12/22 08:27, Helge Deller wrote:
>> msync() uses the flags MS_ASYNC, MS_INVALIDATE and MS_SYNC, which diffe=
r
>> between platforms, specifcally on alpha and hppa.
>>
>> Add a target to host translation for those and wire up a nicer strace
>> output.
>>
>> This fixes the testsuite of the macaulay2 debian package with a hppa-li=
nux
>> guest on a x86-64 host.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/linux-user/alpha/target_mman.h b/linux-user/alpha/target_m=
man.h
>> index cd6e3d70a6..051544f5ab 100644
>> --- a/linux-user/alpha/target_mman.h
>> +++ b/linux-user/alpha/target_mman.h
>> @@ -3,6 +3,10 @@
>>
>> =C2=A0 #define TARGET_MADV_DONTNEED 6
>>
>> +#define TARGET_MS_ASYNC 1
>> +#define TARGET_MS_SYNC 2
>> +#define TARGET_MS_INVALIDATE 4
>> +
>> =C2=A0 #include "../generic/target_mman.h"
>>
>> =C2=A0 #endif
>> diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/targ=
et_mman.h
>> index 1436a3c543..32bf1a52d0 100644
>> --- a/linux-user/generic/target_mman.h
>> +++ b/linux-user/generic/target_mman.h
>> @@ -89,4 +89,17 @@
>> =C2=A0 #define TARGET_MADV_DONTNEED_LOCKED 24
>> =C2=A0 #endif
>>
>> +
>> +#ifndef TARGET_MS_ASYNC
>> +#define TARGET_MS_ASYNC 1
>
> Hmm don't we want to keep the host flag instead?
>
>  =C2=A0=C2=A0 #define TARGET_MS_ASYNC MS_ASYNC

Yes, that would be possible, but the value is the same.
In the <arch>/*h files you usually want to have numerical values
which makes it easier to search for conversion bugs.

I'd prefer to keep it as is, it's done for the other
files/values like that.

Helge


>
>> +#endif
>> +
>> +#ifndef TARGET_MS_INVALIDATE
>> +#define TARGET_MS_INVALIDATE 2
>
> Ditto,
>
>> +#endif
>> +
>> +#ifndef TARGET_MS_SYNC
>> +#define TARGET_MS_SYNC 4
>
> ditto.
>
> LGTM otherwise.
>
>> +#endif
>> +
>> =C2=A0 #endif
>> diff --git a/linux-user/hppa/target_mman.h b/linux-user/hppa/target_mma=
n.h
>> index 66dd9f7941..f9b6b97032 100644
>> --- a/linux-user/hppa/target_mman.h
>> +++ b/linux-user/hppa/target_mman.h
>> @@ -10,6 +10,10 @@
>> =C2=A0 #define TARGET_MADV_WIPEONFORK 71
>> =C2=A0 #define TARGET_MADV_KEEPONFORK 72
>>
>> +#define TARGET_MS_SYNC 1
>> +#define TARGET_MS_ASYNC 2
>> +#define TARGET_MS_INVALIDATE 4
>> +
>> =C2=A0 #include "../generic/target_mman.h"
>>
>> =C2=A0 #endif
>> diff --git a/linux-user/strace.list b/linux-user/strace.list
>> index a75101fca1..ac8f872371 100644
>> --- a/linux-user/strace.list
>> +++ b/linux-user/strace.list
>> @@ -650,7 +650,7 @@
>> =C2=A0 { TARGET_NR_msgsnd, "msgsnd" , NULL, NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_msync
>> -{ TARGET_NR_msync, "msync" , NULL, NULL, NULL },
>> +{ TARGET_NR_msync, "msync" , "%s(%p,%u,%d)", NULL, NULL },
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_multiplexer
>> =C2=A0 { TARGET_NR_multiplexer, "multiplexer" , NULL, NULL, NULL },
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index d58e9b8d10..e541fbe09a 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -22,6 +22,7 @@
>> =C2=A0 #include "qemu/path.h"
>> =C2=A0 #include "qemu/memfd.h"
>> =C2=A0 #include "qemu/queue.h"
>> +#include "target_mman.h"
>> =C2=A0 #include <elf.h>
>> =C2=A0 #include <endian.h>
>> =C2=A0 #include <grp.h>
>> @@ -7667,6 +7668,14 @@ static inline int target_to_host_mlockall_arg(in=
t arg)
>> =C2=A0 }
>> =C2=A0 #endif
>>
>> +static inline int target_to_host_msync_arg(abi_long arg)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return ((arg & TARGET_MS_ASYNC) ? MS_ASYNC : 0) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((arg & T=
ARGET_MS_INVALIDATE) ? MS_INVALIDATE : 0) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((arg & T=
ARGET_MS_SYNC) ? MS_SYNC : 0) |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (arg & ~(=
TARGET_MS_ASYNC | TARGET_MS_INVALIDATE | TARGET_MS_SYNC));
>> +}
>> +
>> =C2=A0 #if (defined(TARGET_NR_stat64) || defined(TARGET_NR_lstat64) ||=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defined(TARGET_NR_fstat64) || defi=
ned(TARGET_NR_fstatat64) ||=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defined(TARGET_NR_newfstatat))
>> @@ -10163,7 +10172,8 @@ static abi_long do_syscall1(CPUArchState *cpu_e=
nv, int num, abi_long arg1,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ??? msync/mlo=
ck/munlock are broken for softmmu.=C2=A0 */
>> =C2=A0 #ifdef TARGET_NR_msync
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_NR_msync:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return get_errno(msync(g2h(=
cpu, arg1), arg2, arg3));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return get_errno(msync(g2h(=
cpu, arg1), arg2,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_to_host_msync_arg(arg3)));
>> =C2=A0 #endif
>> =C2=A0 #ifdef TARGET_NR_mlock
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case TARGET_NR_mlock:
>>
>


