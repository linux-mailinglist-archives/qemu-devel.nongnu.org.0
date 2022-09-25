Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749295E9408
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:44:37 +0200 (CEST)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTo3-0006ar-Sm
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTmS-0004SB-SF
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:42:56 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:41425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTmR-0000cc-95
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:42:56 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mhl8Y-1p7Og746RE-00dlhY for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022
 17:42:52 +0200
Message-ID: <730a6c07-883f-b1f6-600b-fd1645fc5f0d@vivier.eu>
Date: Sun, 25 Sep 2022 17:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 11/12] linux-user: Add close_range() syscall
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-12-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-12-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sfo964GFdwbpMymj8AtQt1UTgJTmbKO8z8gl1ac7u/uUAqSrIjw
 fLBpkxXo1ndkQ/m5bgpj07yleELXf/XgWXUZTGqS2LeHyIheD2zU/q+YErnfxBL6KLUeWj6
 DiGXpxJBKtYXksGo7wqlquh88YV7zrAX3ePOpRo6ulBgxGD+XDu0cbVY04r1MnLchrl6sOY
 zHFRBqWH1q/qTFN63t0ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LALPtqR1AiA=:t0QOPcKTfD+vgo7pIldSoS
 HWXT0N0Xgq7ZIcbObKs+WE6cocuFopyvVdLqVThNGlQupLqpJvUNeVjBXXo7H2RJ4EHLMz25e
 ic4AjOFNs6y5+LEQq0CyRirEwD1ymL408PieVLEhm0PDirJWxFn8arO0ux6xatM0qkcytbFiV
 ng/CrPlj5/2nhdJlZvejYG1mJIdJBlUwKGggLRGiaYK/ybvsQZge0oZuygDhEYfBOeS54C9Pj
 I8wkbHBg+yFwwVavzwS9kc07yfVOVyr3GnxWQmNE+EK78JU9CULa6Qlm7YaeQXz2lsBzg0uV0
 GJPASFiBEirz0VLLrQ+1xKBseJlQhmWetGp4E3SakWAp/Ro24YbQvvHo6aa/JBbK4q4EGELqP
 YFHhsLbnhN7akXM8yGCdbxXVxsb1qlgBERl7zmZmJB/mYn3QoQnsKAB0kjLS6rlifWG4Gcgjm
 PiwAZrpUfsjuFwOKiDLcJ67Kdmdu8o61E3KM/O55Wyz7D91D1Zfof4KDXtV9ARJRDbUygM9JM
 2E5XvAhS8g3/RZhJrafYs1bqa5yV7Ohy1SHTQQOuHgqZ/fCWS1ZWoA1d25u0NciqMtQ6rgAkO
 kPEqv+HWOgs4jI3/v0zagEm+WBzzFM/SsMJkTdqbvF//mbauhsFHKgeQR3+ArTyoiRtQEr3LY
 pNZ7BkjiuhF6RhyF7LHibBWJeSAOWsRldwmVvzT8WcMmZFZ1Is9KGobWz/pG3WEXkokLE5e8U
 CsyiRL2DXT45Cqv8xeaNLc+qfb1cOAzkJxnTATShuge1H4PKze3Uwj2/wAnhmuHK4Q64zDXzc
 ZPp7/xp
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list |  3 +++
>   linux-user/syscall.c   | 16 ++++++++++++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 215d971b2a..ad9ef94689 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -103,6 +103,9 @@
>   #ifdef TARGET_NR_close
>   { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
>   #endif
> +#ifdef TARGET_NR_close_range
> +{ TARGET_NR_close_range, "close_range" , "%s(%d,%d,%d)", NULL, NULL },
> +#endif
>   #ifdef TARGET_NR_connect
>   { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
>   #endif
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ca39acfceb..2e0e974562 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -338,6 +338,10 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
>   #ifdef __NR_exit_group
>   _syscall1(int,exit_group,int,error_code)
>   #endif
> +#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
> +#define __NR_sys_close_range __NR_close_range
> +_syscall3(int,sys_close_range,int,first,int,last,int,flags)
> +#endif
>   #if defined(__NR_futex)
>   _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
>             const struct timespec *,timeout,int *,uaddr2,int,val3)
> @@ -8721,6 +8725,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_close:
>           fd_trans_unregister(arg1);
>           return get_errno(close(arg1));
> +#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
> +    case TARGET_NR_close_range:
> +        {
> +            abi_long fd;
> +            abi_long maxfd = (arg2 == (abi_long)-1) ? target_fd_max : arg2;
> +
> +            for (fd = arg1; fd <= maxfd; fd++) {
> +                fd_trans_unregister(fd);
> +            }
> +        }
> +        return get_errno(sys_close_range(arg1, arg2, arg3));

if flags is CLOSE_RANGE_CLOEXEC, the fd is not closed so you don't want to call 
fd_trans_unregister() in this case.

It would be better to call fd_trans_unregister() loop only if sys_close_range() doesn't fail.

Thanks,
Laurent

> +#endif
> 
>       case TARGET_NR_brk:
>           return do_brk(arg1);
> --
> 2.37.3
> 
> 


