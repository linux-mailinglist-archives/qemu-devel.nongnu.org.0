Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983D319786
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:37:02 +0100 (CET)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAMSD-0001lS-GX
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAMR3-0001L1-DH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:35:49 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:48505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAMR1-0005vE-Hq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:35:49 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N3bfB-1lsSk90GyR-010fJz; Fri, 12 Feb 2021 01:35:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210211132959.574168-1-thuth@redhat.com>
 <2baf117e-2af0-5bb7-944c-219bcb9282ba@vivier.eu>
Subject: Re: [PATCH] linux-user/syscall: Silence warning from the undefined
 behavior sanitizer
Message-ID: <5ac6434b-b7af-cf3f-777d-6a2e993c0815@vivier.eu>
Date: Fri, 12 Feb 2021 01:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2baf117e-2af0-5bb7-944c-219bcb9282ba@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QB58dfaF/W+RZCv4uZ3d8BUsxRGcZBcLsckY9GBxA38vfO52Z0i
 mcc2hgl3pjVPPJtBP8JJ2dB8Sh2STW+TVarQjVnWX+kOIpk2gv+T9P8bd9GRM1hIw/Sf1xX
 zV3V9MS3EW4YWoiaygY9D+SV708eSFdOzo2ytlw8CyGq7Tot7Z4yOYj8e6pnkovHvKkKAn0
 p04G1C4f5kc4TaKZq9+uQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/KtcfXYuX4I=:d1h1z/YuXSnkCQT1h3381n
 1C0nBDf+zlTtwoVSduAwcouY8tVI5fgHutFkLdZXiZkC4PE+ptGhywc6l4phLfKN+Y6L7vJqA
 /afP5ch9hxQpi8WCOz7C9db8Xad869Kvso5IVzzpc6l8DTOVTdF8ftTf/3vrDMuD4qyOhepNf
 EYfAMiEfWdYFvHmXWDzz+ee/jFXMo/gHvJjUKivaWH4itLAvh2Wqesv5dx2VhmzqHPX6cjljr
 Pe1UJ0oNxtJUYcOPcDrxgraiWlvbbXXxdyzVTv+1HAscC70e8BlwsOSvCkACbxN0Y4tBxg9nB
 w4pAPdO+Pjwk30t4eBGoYqxKcxjQo19OBHjOUZQu7E6sf8zs7Aw+LSU6ISphCgmZwbT1Ze+MJ
 7+gcQvqG7jh/IZkKKgGQNJ8nIa0stnxFNG60WsbSz9ZHZ2Ng79pEOBRTi7Gzt7e3PHKwonRoo
 AWvcaNTbBA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/02/2021 à 22:28, Laurent Vivier a écrit :
> Le 11/02/2021 à 14:29, Thomas Huth a écrit :
>> When compiling QEMU with -fsanitize=undefined, there is a warning when
>> running "make check-tcg":
>>
>>   TEST    linux-test on m68k
>> ../linux-user/syscall.c:10499:34: runtime error: member access within
>>  misaligned address 0x00008006df3c for type 'struct linux_dirent64',
>>  which requires 8 byte alignment
>> 0x00008006df3c: note: pointer points here
>>   00 00 00 00 68 03 28 00  00 00 00 00 5b 96 3e e4  61 4b 05 26 18 00 04 2e  00 00 00 00 da 3f 18 00
>>               ^
>>
>> It's likely not an issue in reality, since I assume that on hosts where
>> the alignment really matters (like sparc64), the Linux kernel likely
>> adds the right padding. Anyway, let's use the stw_p() / stq_p() accessor
>> helpers here to silence the warning and thus to allow to compile the code
>> with -fsanitize=undefined, too.

Wait... if the alignment differs between m68k and the host, I guess the size of the structure differs?

In this case we cannot use the guest memory to call the host syscall, we must allocate a host
structure and copy the values into the guest structure.

Thanks,
Laurent


>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  linux-user/syscall.c | 16 +++++++++-------
>>  1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 34760779c8..50de535ade 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -10491,20 +10491,22 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>>                  return -TARGET_EFAULT;
>>              ret = get_errno(sys_getdents64(arg1, dirp, count));
>>              if (!is_error(ret)) {
>> -                struct linux_dirent64 *de;
>> +                char *de;
>>                  int len = ret;
>>                  int reclen;
>> -                de = dirp;
>> +                de = (char *)dirp;
>> +                #define de64(x) offsetof(struct linux_dirent64, x)
> 
> Do we really need the cast to the "(char *)"?
> 
> can't we use "&de->XXX" with the accessors?
> We don't access the memory, only read the address, the compiler should be happy.
> 
> 
>>                  while (len > 0) {
>> -                    reclen = de->d_reclen;
>> +                    reclen = lduw_he_p(de + de64(d_reclen));
> 
> to avoid human error, it would be better to let the compiler take the good accessor:
> 
>  ldn_he_p(&de->d_reclen, sizeof(de->d_reclen))
> 
>>                      if (reclen > len)
>>                          break;
>> -                    de->d_reclen = tswap16(reclen);
>> -                    tswap64s((uint64_t *)&de->d_ino);
>> -                    tswap64s((uint64_t *)&de->d_off);
>> -                    de = (struct linux_dirent64 *)((char *)de + reclen);
>> +                    stw_p(de + de64(d_reclen), reclen);
>> +                    stq_p(de + de64(d_ino), ldq_he_p(de + de64(d_ino)));
>> +                    stq_p(de + de64(d_off), ldq_he_p(de + de64(d_off)));
> 
> and stwn_he_p() here too.
> 
>> +                    de += reclen;
>>                      len -= reclen;
>>                  }
>> +                #undef de64
>>              }
>>              unlock_user(dirp, arg2, ret);
>>          }
>>
> 
> Thank you Thomas for your help.
> 
> Laurent
> 


