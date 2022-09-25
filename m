Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4D5E93D8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:10:57 +0200 (CEST)
Received: from localhost ([::1]:55274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTHQ-00030n-4Y
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTFp-0001R7-Ul
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:09:13 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTFo-0004Cz-AL
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:09:13 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N17cq-1pNF5q1LRK-012YYu; Sun, 25 Sep 2022 17:09:08 +0200
Message-ID: <5499dddd-4e60-ae0c-eaf4-ad56561f3585@vivier.eu>
Date: Sun, 25 Sep 2022 17:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 02/12] linux-user: Add missing clock_gettime64()
 syscall strace
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-3-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-3-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JRRf0LWbuYXmfbrRYOypqO2vJ5hsft4AGt8N1oVFa2pePhX3l5D
 mOs/f9R0nTm8v2ehWJ7/7Y8tixCTmkq4J4UAaWUKqJz9kPR+k6HLGo69PdsBx+JUu6foEln
 YokiVmNXPakVvlS3I8ELOsmqMGr5UTDwdIxtNot2tPDxdxi1bWJdNaw6uZVWjI7uW65JcHz
 NRJGPUKtKNgfXYtZx8vdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zXLz5b7eV7Y=:mywQ3cBh+MCg2f8rclM0uk
 cJLat8GzUr+HAU3op2O1h8fcsKRlR5OP8fQs7iOkyziG39DHeCLryuZM3WA9Y6SPRBiDiIGh4
 9M1sbSZjElcYVh8FhGC+tHP8TAQonse6uFKLzqOQz5q7v7RGR6UJ16C3qNU7/qewYJH+L097p
 aX+3iXN3xfN/0WPlXJW4qe4HpyEJejLbxhYo3BFkcyt874hiFAPzgUffrNaVgx+V7iUjpfQ2g
 S84kFBYsuepHrAQxSrVbS34V0up1apLLYOzSbLLBy+sZ3XHHpEA8HKCY3c2+aSHDkXCJXdRV8
 l58aVWk4gj3kI3PMQgjdbzDVuRKVfYJjUYCYAh3Q4p4ZBgIEmgNOVmHyx2D27j0vGgM3Lo7RR
 5TPVRHvu15xm/QRJ5vsIUhfT0Y/mgRBSF8+87QFQaPOW+c8yfJWsGCHniTGkLcjg29uvAIwzV
 1XzaBKYpZrJORyKADYkp80yzBXw3Yz9oZal73+eVM2jgZ4YqcdIBJB6rrNsSpymQdiZ8MOzr2
 w3TWmTbwbpTltQ2WKcbuzNDMaGpg/RWfevF9539Hf+sRIRWVAmHfCED/LFGbmeujJ2tha6mns
 uZq3iw0LvCAg3gyVG0BR5/2DHZRyAmIXYudKTUSg5q4U7iuip/8+VrfsfsQZQ4BE/jnV54I8w
 0qM8YY5ObDgYXSWw48WyPg6MxuCjVo53fC0f8ocCdSDcWmSYU3Tr9bo/NehCIdWzWStsH5E4g
 sHFiyT5cXK5stwwM3tO5NWDuvorJfUXe/DKKUwSX+b3CiQytv/PA1SsSXLv2p8KXyFnghn7HS
 zA1D8je
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
> Allow linux-user to strace the clock_gettime64() syscall.
> This syscall is used a lot on 32-bit guest architectures which use newer
> glibc versions.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c    | 53 ++++++++++++++++++++++++++++++++++++++++++
>   linux-user/strace.list |  4 ++++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index a4eeef7ae1..816e679995 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -82,6 +82,7 @@ UNUSED static void print_buf(abi_long addr, abi_long len, int last);
>   UNUSED static void print_raw_param(const char *, abi_long, int);
>   UNUSED static void print_timeval(abi_ulong, int);
>   UNUSED static void print_timespec(abi_ulong, int);
> +UNUSED static void print_timespec64(abi_ulong, int);
>   UNUSED static void print_timezone(abi_ulong, int);
>   UNUSED static void print_itimerval(abi_ulong, int);
>   UNUSED static void print_number(abi_long, int);
> @@ -795,6 +796,24 @@ print_syscall_ret_clock_gettime(CPUArchState *cpu_env, const struct syscallname
>   #define print_syscall_ret_clock_getres     print_syscall_ret_clock_gettime
>   #endif
> 
> +#if defined(TARGET_NR_clock_gettime64)
> +static void
> +print_syscall_ret_clock_gettime64(CPUArchState *cpu_env, const struct syscallname *name,
> +                                abi_long ret, abi_long arg0, abi_long arg1,
> +                                abi_long arg2, abi_long arg3, abi_long arg4,
> +                                abi_long arg5)
> +{
> +    if (!print_syscall_err(ret)) {
> +        qemu_log(TARGET_ABI_FMT_ld, ret);
> +        qemu_log(" (");
> +        print_timespec64(arg1, 1);
> +        qemu_log(")");
> +    }
> +
> +    qemu_log("\n");
> +}
> +#endif
> +
>   #ifdef TARGET_NR_gettimeofday
>   static void
>   print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const struct syscallname *name,
> @@ -1652,6 +1671,27 @@ print_timespec(abi_ulong ts_addr, int last)
>       }
>   }
> 
> +static void
> +print_timespec64(abi_ulong ts_addr, int last)
> +{
> +    if (ts_addr) {
> +        struct target__kernel_timespec *ts;
> +
> +        ts = lock_user(VERIFY_READ, ts_addr, sizeof(*ts), 1);
> +        if (!ts) {
> +            print_pointer(ts_addr, last);
> +            return;
> +        }
> +        qemu_log("{tv_sec = %lld"
> +                 ",tv_nsec = %lld}%s",
> +                 (long long)tswap64(ts->tv_sec), (long long)tswap64(ts->tv_nsec),
> +                 get_comma(last));
> +        unlock_user(ts, ts_addr, 0);
> +    } else {
> +        qemu_log("NULL%s", get_comma(last));
> +    }
> +}
> +
>   static void
>   print_timezone(abi_ulong tz_addr, int last)
>   {
> @@ -2267,6 +2307,19 @@ print_clock_gettime(CPUArchState *cpu_env, const struct syscallname *name,
>   #define print_clock_getres     print_clock_gettime
>   #endif
> 
> +#if defined(TARGET_NR_clock_gettime64)
> +static void
> +print_clock_gettime64(CPUArchState *cpu_env, const struct syscallname *name,
> +                    abi_long arg0, abi_long arg1, abi_long arg2,
> +                    abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    print_syscall_prologue(name);
> +    print_enums(clockids, arg0, 0);
> +    print_pointer(arg1, 1);
> +    print_syscall_epilogue(name);
> +}
> +#endif

I think it could be simply:

#define print_clock_gettime64 print_clock_gettime where print_clock_gettime() is defined.

except that:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


