Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097AF9B4EE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 18:53:14 +0200 (CEST)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1CoK-0000Fj-TM
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 12:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i1Cew-0000wD-2N
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i1Cej-0006Jp-7S
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:43:29 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:39487)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i1Cei-0006GB-GG
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 12:43:16 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MrPRB-1iY4Z949JP-00oa72; Fri, 23 Aug 2019 18:43:01 +0200
To: Peter Maydell <peter.maydell@linaro.org>, Shu-Chun Weng <scw@google.com>
References: <20190816211049.57317-1-scw@google.com>
 <CAFEAcA-GWR6_wGCMWkMHttU3ARJPqfADvNTnqQUU_OzcWgHHuQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <02298489-b0d0-c7d5-6f8a-7b0ff604aac6@vivier.eu>
Date: Fri, 23 Aug 2019 18:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-GWR6_wGCMWkMHttU3ARJPqfADvNTnqQUU_OzcWgHHuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NKIshjjgRCIQlsPe0HC8FIJDUpKXu3i2KnBui4r2MFgQMa2trB9
 4kBY7TW+UA7c4yWhPfF+fPeApD0zAEIqJEicR7hOYYuvFADJ7w8xYtYWF272HJQmyI6wc5M
 WtLgf/gI1JJIt6ZseQhyFYuNAm8nj0fLidDns9lBv6vO0898tLa7wTK1Tu/U6IdSacqoHUL
 fJdWCd2S6YiwkH6VK/x4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HnIOg69nMd0=:LbTqTfGExQVom60CIu1gk1
 W1gEBAyXuNb1WrFB52Ntv+jPNQ8uU+cGvNnjeok8+AUK9SuLZcA6hXM2ss798NvvACky2ahvC
 SIpYh/FWI7nZ0RyFslZFFwprWdAi/8FcPX+pLfBFLvN+jZHiYXuzyAmy9cimo1W188b/G2b38
 vWZEIo9uUSu0+kr9uwrzvxqacI+So969h2krudcmVxQwVPGjLmA2auSIrB++1uw4SxrRBvX/i
 o+4Ybj2FkGWLSuZk/RxYtlZiCNz3AtCGlFc9ppnjSZjeh6jOIF5K4aYsca1h3y60dybdQx7Db
 zoQ/PpHDAlaeb2/QJ7pVkIPYDRdZBZa1tRVt5uDi5f/s0oJ0Z/4tOIfZLKktGmImtkgrodcFY
 3xOI7BPDR7hzuFaDhmBWmPnIWQyTqxulYWEvcr1vpa6j3vvlIY1NiMmaS3FYgNMaariwlkdBf
 Q2E1mt1dolig+2ZmbMCqROKdbrR7C35G3BZVrD5bp8NFN4f9aCO8pXAMKym+CzGmsVix9NXZL
 O8qM4Rv87Sn8pMET30h2WXpnQZJX1gqE3C/yNIkQpgl51fY9eFMmAsrEEF64jZRW25RhSHkXd
 4D9k5sFEC7KOwbgL4CPNde5T1PUIyVFMOMFILd/j20u/Ovtm7Q8PKxIvFd5SBCwtt9TUMIJCb
 j1278cgnOLMMWH84gdHzx82zbiAe7pDRpRns3hNZD8cZ7ez7vqqVowFMh6Xd2uQTE01srTK8Q
 aC/GkXkCHdWRv3MHMEFBNGQaoB53KMImfUztFtvaEU32YBSs98tW1mIMP/8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-devel] [PATCH] linux-user: add memfd_create
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
Cc: arunkaly@google.com, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/08/2019 à 13:56, Peter Maydell a écrit :
> On Fri, 16 Aug 2019 at 22:28, Shu-Chun Weng via Qemu-devel
> <qemu-devel@nongnu.org> wrote:
>>
>> Add support for the memfd_create syscall. If the host does not have the
>> libc wrapper, translate to a direct syscall with NC-macro.
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1734792
>> Signed-off-by: Shu-Chun Weng <scw@google.com>
>> ---
>>  include/qemu/memfd.h |  4 ++++
>>  linux-user/syscall.c | 11 +++++++++++
>>  util/memfd.c         |  2 +-
>>  3 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/qemu/memfd.h b/include/qemu/memfd.h
>> index d551c28b68..975b6bdb77 100644
>> --- a/include/qemu/memfd.h
>> +++ b/include/qemu/memfd.h
>> @@ -32,6 +32,10 @@
>>  #define MFD_HUGE_SHIFT 26
>>  #endif
>>
>> +#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
>> +int memfd_create(const char *name, unsigned int flags);
>> +#endif
>> +
>>  int qemu_memfd_create(const char *name, size_t size, bool hugetlb,
>>                        uint64_t hugetlbsize, unsigned int seals, Error **errp);
>>  bool qemu_memfd_alloc_check(void);
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 8367cb138d..b506c1f40e 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -20,6 +20,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qemu/cutils.h"
>>  #include "qemu/path.h"
>> +#include "qemu/memfd.h"
>>  #include <elf.h>
>>  #include <endian.h>
>>  #include <grp.h>
>> @@ -11938,6 +11939,16 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>          /* PowerPC specific.  */
>>          return do_swapcontext(cpu_env, arg1, arg2, arg3);
>>  #endif
>> +#ifdef TARGET_NR_memfd_create
>> +    case TARGET_NR_memfd_create:
>> +        p = lock_user_string(arg1);
>> +        if (!p) {
>> +            return -TARGET_EFAULT;
>> +        }
>> +        ret = get_errno(memfd_create(p, arg2));
> 
> I think here you may need to call
>            fd_trans_unregister(ret);
> 
> since memfd_create() returns a file descriptor.
> (This call unregisters any pre-existing hooks for "we need
> to mangle the data for reads/writes of this file descriptor",
> in case the fd was previously being used for a file descriptor
> type that needed that.) This is what eg NR_open does.
> 
> Laurent -- do I have this right? It's not entirely clear
> to me that we could ever be in a situation where a syscall
> like open or memfd_create returns an fd that's got an fd_trans
> hook active, because that would imply we'd failed to delete
> the hook on fd-close somehow. Is this just a belt-and-braces
> bit of coding ?

Exactly.

It's in case we missed one fd close and then to be sure an existing "fd
translator" will not mess with data of the new one.

Thanks,
Laurent



