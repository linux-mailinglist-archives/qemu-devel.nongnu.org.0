Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF3631952C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:33:07 +0100 (CET)
Received: from localhost ([::1]:36166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJaD-0007HM-SJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAJWU-0005TX-EZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:29:14 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:39281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAJWK-0008H0-F8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:29:14 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MjjGX-1ld1ZR3wWR-00lDjP; Thu, 11 Feb 2021 22:28:59 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210211132959.574168-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/syscall: Silence warning from the undefined
 behavior sanitizer
Message-ID: <2baf117e-2af0-5bb7-944c-219bcb9282ba@vivier.eu>
Date: Thu, 11 Feb 2021 22:28:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211132959.574168-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZFa8V7IyLziW6DucU0UrMOfCYWJhAjMumBOib6Yti5Hwp450TV2
 nW3Fj0oMlvx0kgVpwop68NE5BtqPLAIEjl/nGPlN/oBBouca1lEUVQKtDbRn4vD5UHxuzK8
 BPyBK4sEVVD9FsMOCHoRA0j+t52d+gk3aP75M/hUuCMiX1rBx0cOt+bbogMWYE9lFJvPWTN
 Wzg0ta6qF6TdMoXwMKU/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mr+fLWKbwxI=:u2dwZHo8l4uYe7HTrQGTLQ
 40pyupH7Cp+DSJyWqmMnkSGJrT6j32snfv0Oy31JLrr3h1HTKOIsWqLs2Yc4PP578Rrv0OmYd
 BCLNA0Jcgo6HxVmQFB4/Rrv/i1FfUFD8Y0O7abtH8DECG6yfAKjyNnAe25UWEse9N+VN8UlsY
 Eo1EHoDVvCuKy/3RTHfm16ruRZyJLzRpZXN329yagpqGCIO2dTqJnCNSQEV/p74VThULKzqrF
 0R2WVPSuIxr1Lm79iov0V44NjwfZxLgtZp5+sIG2KVxyuEwdX/LM2VD6jClgQbDHghK6scYLl
 EZKFhtMCnHkNFQci6UxAHcwyi51GiZ7rged80GGS3TVOyDMBW6IGaec/pUHDl6pvwMQbHH9Nm
 SD1ekdqy/UztpHDgwZPsrjNnenWapn09zGo5308U2DNrKSMqHqW85U0kPULATopp0eqOESWeI
 B+r+Bjp3Ew==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

Le 11/02/2021 à 14:29, Thomas Huth a écrit :
> When compiling QEMU with -fsanitize=undefined, there is a warning when
> running "make check-tcg":
> 
>   TEST    linux-test on m68k
> ../linux-user/syscall.c:10499:34: runtime error: member access within
>  misaligned address 0x00008006df3c for type 'struct linux_dirent64',
>  which requires 8 byte alignment
> 0x00008006df3c: note: pointer points here
>   00 00 00 00 68 03 28 00  00 00 00 00 5b 96 3e e4  61 4b 05 26 18 00 04 2e  00 00 00 00 da 3f 18 00
>               ^
> 
> It's likely not an issue in reality, since I assume that on hosts where
> the alignment really matters (like sparc64), the Linux kernel likely
> adds the right padding. Anyway, let's use the stw_p() / stq_p() accessor
> helpers here to silence the warning and thus to allow to compile the code
> with -fsanitize=undefined, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  linux-user/syscall.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 34760779c8..50de535ade 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -10491,20 +10491,22 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                  return -TARGET_EFAULT;
>              ret = get_errno(sys_getdents64(arg1, dirp, count));
>              if (!is_error(ret)) {
> -                struct linux_dirent64 *de;
> +                char *de;
>                  int len = ret;
>                  int reclen;
> -                de = dirp;
> +                de = (char *)dirp;
> +                #define de64(x) offsetof(struct linux_dirent64, x)

Do we really need the cast to the "(char *)"?

can't we use "&de->XXX" with the accessors?
We don't access the memory, only read the address, the compiler should be happy.


>                  while (len > 0) {
> -                    reclen = de->d_reclen;
> +                    reclen = lduw_he_p(de + de64(d_reclen));

to avoid human error, it would be better to let the compiler take the good accessor:

 ldn_he_p(&de->d_reclen, sizeof(de->d_reclen))

>                      if (reclen > len)
>                          break;
> -                    de->d_reclen = tswap16(reclen);
> -                    tswap64s((uint64_t *)&de->d_ino);
> -                    tswap64s((uint64_t *)&de->d_off);
> -                    de = (struct linux_dirent64 *)((char *)de + reclen);
> +                    stw_p(de + de64(d_reclen), reclen);
> +                    stq_p(de + de64(d_ino), ldq_he_p(de + de64(d_ino)));
> +                    stq_p(de + de64(d_off), ldq_he_p(de + de64(d_off)));

and stwn_he_p() here too.

> +                    de += reclen;
>                      len -= reclen;
>                  }
> +                #undef de64
>              }
>              unlock_user(dirp, arg2, ret);
>          }
> 

Thank you Thomas for your help.

Laurent

