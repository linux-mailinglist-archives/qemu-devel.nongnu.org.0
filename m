Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD10B6AE444
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:17:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZ4J-00057w-Hd; Tue, 07 Mar 2023 10:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZ4E-00056i-4I
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:17:31 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZ4A-0000Tq-Eo
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 10:17:29 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUGyh-1pz6Zj0hud-00RKFd; Tue, 07 Mar 2023 16:17:24 +0100
Message-ID: <0b0c8820-3c45-9335-5506-7ed1c85fa3f8@vivier.eu>
Date: Tue, 7 Mar 2023 16:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: Provide print_raw_param64() for 64-bit values
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <Y9lNbFNyRSUhhrHa@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y9lNbFNyRSUhhrHa@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:y/3ZHFIYPcmiosYQ9VzsPmhiHz/WFtRa2oGicFwBf7eHIfTiAWj
 hLpsHJLvpYT/1DlHBPXthjRIbD+ICG7ssmEAz+9JfavFRZ/v1ETS6drwZlI7bkqTyqWt7Nd
 tvuV/ASXbDqI8QQtkunqohVzDL8/ryZTQGjy6jDvR4QxtFWj7kg5q51UiWuYeAGXoLF1CH9
 LOLDn7LC/FLtF8OLxnG8A==
UI-OutboundReport: notjunk:1;M01:P0:YJxoh22trm0=;Aie4fOJWoWjSJjvC9AY/xDTXhP9
 0iq3B2cTiC/aGuF7TGHVjkntJtctHoaYx2SE80Cnc3DAbnPBPJSvBMBr4HE03TuExUmVAUNNJ
 iWp71oO7MwS/PqcqkRabB72A2VTQVLhiP50eSFkhD4ATtMD0omD8VpWczLMgRCMxhzDkyDJKR
 iLVYsBbjh4qVek3G9jRHUxECUquDYhh62onZGrKX/84lbAOACyu7C53E0NnA7GvPpyeBUbAW2
 7/Pc0u1F5AHhN5RGeebUeRMaMSCrpJECjH5Z+7ZxugzqUEFbijAm95KdidecqL69XKdGJHczN
 SakquLpsD4CFwS7AI/0BpamcYFalCM/cJEvlqpIN+DBQHpfWmUYkYDdLKpuTNGctLqjVhSXEM
 vL3oAgj5weuzvjc3RKh2u2fxIE/f57e4HOfCWZZo8YcTrELtd/e/6JvxSsUqnxLl2WYqKkmSB
 Dl9f+6AjHHBYJwGPIRh8sVG5pnsZizccufJP7mn4PgK8XxP89a+g6C4zyALberP1+FFIklIWs
 7Az1HqDu2CvWcAYjuWQ3AhnLrhQI5cEDcfHbj8pKVj+GMbo0qzji0aCb6JVvU/YWPqWJIL7IR
 Xkr0XzJwzm30mGRr9Va6pIlCrgLjvX+Rv+9S+TDQuXe4eGvWx8PKuXOqpSZoSvBdWCt+fNUz0
 ZJbAlAGnuBL/Dr6lewAa5RuI6V5kaXlD59+WKhozPw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 31/01/2023 à 18:18, Helge Deller a écrit :
> Add a new function print_raw_param64() to print 64-bit values in the
> same way as print_raw_param(). This prevents that qemu_log() is used to
> work around the problem that print_raw_param() can only print 32-bit
> values when compiled for 32-bit targets.
> 
> Additionally convert the existing 64-bit users in print_timespec64(),
> print_rlimit64() and print_preadwrite64() over to this new function and
> drop some unneccessary spaces.
> 
> Suggested-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 379536f5c9..35d22be027 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -81,6 +81,7 @@ UNUSED static void print_syscall_epilogue(const struct syscallname *);
>   UNUSED static void print_string(abi_long, int);
>   UNUSED static void print_buf(abi_long addr, abi_long len, int last);
>   UNUSED static void print_raw_param(const char *, abi_long, int);
> +UNUSED static void print_raw_param64(const char *, long long, int last);
>   UNUSED static void print_timeval(abi_ulong, int);
>   UNUSED static void print_timespec(abi_ulong, int);
>   UNUSED static void print_timespec64(abi_ulong, int);
> @@ -1615,6 +1616,19 @@ print_raw_param(const char *fmt, abi_long param, int last)
>       qemu_log(format, param);
>   }
> 
> +/*
> + * Same as print_raw_param() but prints out raw 64-bit parameter.
> + */
> +static void
> +print_raw_param64(const char *fmt, long long param, int last)
> +{
> +    char format[64];
> +
> +    (void) snprintf(format, sizeof (format), "%s%s", fmt, get_comma(last));
> +    qemu_log(format, param);
> +}
> +
> +
>   static void
>   print_pointer(abi_long p, int last)
>   {
> @@ -1691,10 +1705,8 @@ print_timespec64(abi_ulong ts_addr, int last)
>               print_pointer(ts_addr, last);
>               return;
>           }
> -        qemu_log("{tv_sec = %lld"
> -                 ",tv_nsec = %lld}%s",
> -                 (long long)tswap64(ts->tv_sec), (long long)tswap64(ts->tv_nsec),
> -                 get_comma(last));
> +        print_raw_param64("{tv_sec=%" PRId64, tswap64(ts->tv_sec), 0);
> +        print_raw_param64("tv_nsec=%" PRId64 "}", tswap64(ts->tv_nsec), last);
>           unlock_user(ts, ts_addr, 0);
>       } else {
>           qemu_log("NULL%s", get_comma(last));
> @@ -3814,10 +3826,9 @@ print_rlimit64(abi_ulong rlim_addr, int last)
>               print_pointer(rlim_addr, last);
>               return;
>           }
> -        qemu_log("{rlim_cur = %lld, rlim_max = %lld}%s",
> -                 (long long)tswap64(rl->rlim_cur),
> -                 (long long)tswap64(rl->rlim_max),
> -                 get_comma(last));
> +        print_raw_param64("{rlim_cur=%" PRId64, tswap64(rl->rlim_cur), 0);
> +        print_raw_param64("rlim_max=%" PRId64 "}", tswap64(rl->rlim_max),
> +                            last);
>           unlock_user(rl, rlim_addr, 0);
>       } else {
>           qemu_log("NULL%s", get_comma(last));
> @@ -3838,7 +3849,7 @@ print_preadwrite64(CPUArchState *cpu_env, const struct syscallname *name,
>       print_raw_param("%d", arg0, 0);
>       print_pointer(arg1, 0);
>       print_raw_param("%d", arg2, 0);
> -    qemu_log("%lld", (long long)target_offset64(arg3, arg4));
> +    print_raw_param64("%" PRId64, target_offset64(arg3, arg4), 1);
>       print_syscall_epilogue(name);
>   }
>   #endif
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


