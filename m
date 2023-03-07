Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF186AE20D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:22:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYCH-0007jz-6k; Tue, 07 Mar 2023 09:21:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYCE-0007j2-Pj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:21:42 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYCC-0005W4-2T
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:21:42 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MHmuE-1pl9qN1fuA-00EyhS; Tue, 07 Mar 2023 15:21:17 +0100
Message-ID: <9be9624e-11c5-d65a-d762-f434b10eeab4@vivier.eu>
Date: Tue, 7 Mar 2023 15:21:16 +0100
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
X-Provags-ID: V03:K1:+nV3p9siNto74HR+BtpEjUW1hoUUXzGL78BXHx/WAUtHCpdLCkn
 xf+Okng0CrpuDapqrnAaAicFNgh5n/EsbNFT6z4JGkbFbl1XqrHjo6Z2qPFQSya2Y/ipjL2
 q9dopOsKhUpwGmECU+mA8CsOi721/SUH/ihSjw3kSxPjB180iFOykp8shc/8AGdnsnF/1eT
 AiCGyXBfQ7glwFqpO3YCg==
UI-OutboundReport: notjunk:1;M01:P0:Bpa4HWCG7VQ=;Htw8qbGPlKcuVPDM1uzBWfbBTJF
 HChshdLgp5kAvh6qdMMI/+I/NBsiKoper0lL/9Y/Glp1XMlVeiiw6xs6L9c4/ps7xAUqcWYNG
 pl24+pofHT3B5/AaollPx2d9TGwFqok7fIh1XGSB0YrZZWg45s06d7oqxigLMED2HiF4MI/zM
 ma3gH6gw95W7SN1qe7MuMzR0vychXK7CwjFBYF1EFDhXOUxvOv9DG0OEsrpztRNo4tLjnVWEN
 hCpdtyVNwbp4f8UN0AbWTlMom+a7RWyzeRd/8ymvcfB508hTWRugawRwF+Vkze5eO3zVB5Hqj
 OoaAx4LKCkITdgH71TPR3v1cqEtUYLZoXEYV7AzLXOqE73GytE3ZO4is9BgL13Uca5rhAD2ef
 NZ8Rh0zhDAbmviXeJ54oDNL98SOeLnOPKpXJnrHx0fKY5wtbQ6ozQlq/6bkYzQ8Exe0D7s/HJ
 fZqeq0696AMgQdO7aFHLHVAi7ZhKBC8Yc9/7AIKx3vKgvNuZZZe3t2ag6zII+lIjuR1dHwWhQ
 8sVxLxuvZtfuZofiXePH2V+kOygIqLQx2TDKwgEw0IZ5kN6rQUxwrIkphYNm2saA7mp4d3rUs
 /iP9KzH2rfsW5DerLbx0tPpPpS+Yj7XYfPKgdqnFMdAyQR0C1sgh/DT2VQSvDOb1lFDvqLfE5
 nP4It7SrUAvdEz8gh93agqQYx1Oyc+ZpEbvr7e//AQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

