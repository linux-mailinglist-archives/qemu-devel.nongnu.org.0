Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DA5F9B85
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:59:42 +0200 (CEST)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohodR-0001U8-57
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ohoY8-0004SQ-U3
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:54:14 -0400
Received: from mout.gmx.net ([212.227.17.22]:58675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1ohoY5-0006MB-Pp
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1665392030;
 bh=TmKewXBy5Dc8BVcW624YtcCJuFsXJT4Hfj0Rd2uafdA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Y7en3Bbmv1mitp3NkKVrLaIBNsFCMZnVQQI9txteF9WvBXyOuhtyzBdfvIfhiYurl
 TE5Go2svesD9rMVnA28DijxoI8G3mBx0OZZmHLfml69rOUR6wpkZGK5n2UyXOimNC4
 tHThbpy82Lk2xUtkgKKUeYhV3by5f8RI2UwmMk0s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.63]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1oVcoD4BLo-00NCuX; Mon, 10
 Oct 2022 10:53:50 +0200
Message-ID: <f47945b7-afce-f0e3-2ca9-6c6cd119cae7@gmx.de>
Date: Mon, 10 Oct 2022 10:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] linux-user: Implement faccessat2
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>
References: <20221009060813.2289077-1-xen0n@gentoo.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20221009060813.2289077-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yOlNTRUbBZI5AaL/Q5Hkw18Bq1UDIz+I73zL/4OgrHgXsPjT1j1
 a4EXDsYvvcsR2sx3H7mDPdKV1xMbhITABqptb6VJHR0rg0IbziYfxgtaVvxz1/qPw1j6hOo
 HARuG4r5voqNIKuXLpOzvFEXigOUiGG7ae8jDHCQY82rqYjTCEcPs3W7MUAZTcSY/d7YjRJ
 n7Id93sdEXy9cFfFSLYQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kUMtzVbgS8E=:jxIubYS8got0ppbqxJF6lE
 4UBQM7D51cMGfwS0spAjGyjoO7KUGiNWUF51ply4U1ZSMw8YTkkIUVWEfhvBZ8q5XqmQIhE0X
 kUpEZfJDDrpwEGpt9op5EPpLw0W/3Txe+FiW73ttPh/at7BNpfJi1LohuKhEExYqkIO0NdD+m
 3LdmpGXnZGQdiOAAqwNTZritxgx7Uf1pTBxdYBhszgdMwgl1bvqKvCwQgjnLpbbKU2bA2k35m
 a59nHZwfYVm1RWmOA+Sz+L/zLKQZbgyxu0KRZU+vEJxj834xbkgwC+VW1jtyhok66yevTce4W
 vGjckKCl3wrzmgtNWpcL0yHEE+YeP1Twqe0c3/NbIHOve1U4RrAOJhAty5tWni+atmLKm30lF
 e8Ctjic8XIFDQ2VK/wdjnMjQ596xa6W14pWoqpx4jMdXQCMl4SMFSdQ/2xgzdXphgeSWtyxfI
 f+T10Cdq6n+DxL9ypX1YoTCqV2BNV+xnujnwBKxdbkr/d8j0TdYj47/o93Jgl8lOwFBHw9y2o
 kTX/A6ylfONNapJw7tU3I5JEJ6J96MJRsTFNKD0HBt+MrJqr8Thbz4yZmxr2qDC2cvQ7DrNo9
 wQU0+rb3XqxGQl8heEZHt2SghLFeeFb4sZ2LyiYtfUEPn8JpVpTTaCQNp91aeGzx/tw9VJwYM
 uH1lRs7tNZBK80zcnfXlmTldB1Rz4yIWJOiC/4oE4qmluaKyqoAGreKKUF9Ec23IW0gdXcj3z
 YW72ISn95sNQRxlEtaZJF3O3GfvKZ4wXCnD/6QeyzkHWQlarUXC/dfENkku53XlwNg3z13kI1
 B6hq+eLJE2aTdIIwXm25is1VwWy25e4x47scGkL0Mg8U3L8CWciQGD/rhFBN27IUYzO050M3e
 KAcA3GvlyvABEmdzbi70TaAcBNAqL4pf223568qJTsvqbMjHDqtTAgdp3dV6Oy6orzHMc7aaw
 cNdWmwMUdbMceJ6/azZ73NEFkz3VyAW6gI05OFP6c+ewtUkDQp7sah0VDoZu/EYrnPOfyxgEg
 Epn9Pg3LTeKpAUxKF3kWXJq4s3NrDo4r/4NOdkClLs0mhbeaXnQ52lTwJCu2OPoZJubKc0RkR
 QWEXHoXbqq+hAhDXafQPmUYdMlmlgUrkhOaxPkFU78bmnKBHV19vcBaUoSNAGFLiGW2oOf7MS
 f3owiR7xTJDSoLQLMyx6o0yj82EzqFeDX4heCIX3JfOsM3oTXeJdNkQiEmhSI8jqa8YT/LxNz
 NqzHl5cu2GwpIKnl4nx09AjbRrPYm+/VeN49mdliuZjEuceIuP58SEfgV5UQ4U23YSZZcaMVY
 GFfhjjDtYJxuqqD6ypFFlxDm0X6AZL9q7e/z2cOK5Vst9ZJ+P6YXCcSdClohTK5QG3wYzZZLQ
 hYZ4ChfoEm2yZJ6KXS6SsyONleF0K4wQJ9GIsaahQqKcRzjgDvR0rn9x61PS9GnrF4JVMHxBU
 jmkBs4Xg1V+DDk9b8QktJl5j+Jd/3d68PfFHI3Sw9MnDeDR0msQBCW0eKsAmcEXFR2x/TP1W4
 97B78kqGZEDU2lKa2KK6VMUtJKw9fqJtQ703xo714Fnnw
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.934,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/22 08:08, WANG Xuerui wrote:
> User space has been preferring this syscall for a while, due to its
> closer match with C semantics, and newer platforms such as LoongArch
> apparently have libc implementations that don't fallback to faccessat
> so normal access checks are failing without the emulation in place.
>
> Tested by successfully emerging several packages within a Gentoo loong
> stage3 chroot, emulated on amd64 with help of static qemu-loongarch64.
>
> Reported-by: Andreas K. H=C3=BCttel <dilfridge@gentoo.org>
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> ---
>   linux-user/strace.list | 3 +++
>   linux-user/syscall.c   | 9 +++++++++
>   2 files changed, 12 insertions(+)

There were two similar approaches from Richard and me:
https://lore.kernel.org/qemu-devel/20220729201414.29869-1-richard.henderso=
n@linaro.org/#t
and
https://lore.kernel.org/qemu-devel/YzLdcnL6x646T61W@p100/

> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index a87415bf3d..3df2184580 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -178,6 +178,9 @@
>   #ifdef TARGET_NR_faccessat
>   { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL },
>   #endif
> +#ifdef TARGET_NR_faccessat2
> +{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
> +#endif

You are missing that part (from my patch):

=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1931,7 +1931,7 @@ print_execv(CPUArchState *cpu_env, const struct sysc=
allname *name,
  }
  #endif

-#ifdef TARGET_NR_faccessat
+#if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)

otherwise if TARGET_NR_faccessat isn't defined, you won't have
the function print_faccessat() in strace.c defined.


>   #ifdef TARGET_NR_fadvise64
>   { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd..a81f0b65b9 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9110,6 +9110,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env=
, int num, abi_long arg1,
>           unlock_user(p, arg2, 0);
>           return ret;
>   #endif
> +#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
> +    case TARGET_NR_faccessat2:
> +        if (!(p =3D lock_user_string(arg2))) {
> +            return -TARGET_EFAULT;
> +        }
> +        ret =3D get_errno(faccessat(arg1, p, arg3, arg4));

You rely here on the libc faccessat() function to either use
faccessat2() or faccessat() syscalls - which is probably the
best way around...

Helge

> +        unlock_user(p, arg2, 0);
> +        return ret;
> +#endif
>   #ifdef TARGET_NR_nice /* not on alpha */
>       case TARGET_NR_nice:
>           return get_errno(nice(arg1));


