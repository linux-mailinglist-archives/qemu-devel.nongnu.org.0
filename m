Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9BC49EE43
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 23:51:06 +0100 (CET)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDbd-0007S8-D1
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 17:51:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nDDYL-00043Y-Hi
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 17:47:41 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:37251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nDDYJ-0004O7-Kz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 17:47:41 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPGJh-1muLG41MXF-00PcIM; Thu, 27 Jan 2022 23:47:33 +0100
Message-ID: <304d9a58-2826-ef3b-06e3-9f3aa87ae42d@vivier.eu>
Date: Thu, 27 Jan 2022 23:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr
To: Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org
References: <20220127205824.40626-1-dirty@apple.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user: Implement starttime field in self stat
 emulation
In-Reply-To: <20220127205824.40626-1-dirty@apple.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:T1fUgt22Ma6DUFCVccxKNHy6n7QHFYWwAzN3UywNFthhgCw/Jut
 7Af+Gu+UFOmNjBOgIF8ewz5ZtNPIFLULulegpPgQ5EROrEiGQs8nMQdKLL472ZNewbRzA1X
 RVdUd5vk4j3bj0aj1za/QJk2ivqcZONeg2PI5MtaUwdp+FdZnQtytgz6KPEQ3XADEMTfrJu
 A/RoE/m3MYyzEQS3Y79sg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jPTVZk3oyts=:6vQqQ1SIlt4n6doZlVM1cQ
 h2RPi4kPX0gv8RHVt1+GmH8stmXF5HOzQIvh2EraP5e1DXYYC04TT9lOxh4Dz7o1SyRgy3MLU
 7EIwia75PVRvU8ajEX/9pFBWFSuOdWK1NNJI+t90bbeeKZlXOCqp9E19wLM6sk4zHXU3wU03j
 Xe1up54r2LfSIP2goIavtY4TRSmJIzUEdoCOqSMeAp2ykZEyCOgGQYu9a4CWnUf7P70tAzgWj
 LNP/jodIJZnm3ateOxE1hZYiq7Z/cYxO2QtPF3WUKpUzVJeCT5kkpKcMdwuJLJCbNISLjFbLT
 QD5RZiwNkBlHeGzdK55+PDh+tFJKksqTMoSBQ3v+Gr3YZo7PjfxkxDvSPt6vTROqkLJZ/ADEJ
 wRX7ntRnbCJRfdiJAl+4v6NLY21VxCOpaPHiAt+I75HRPeQcVp1rDKcX9WUeOt6lEHYFW9xG1
 43kC1gPQkHbfNpczN1UZQfScJdUBISjdIsX9ca5hq78g9puGgOB8DUjAk9PLCv3IkwQacv9Ut
 Ogrs3M3W9LKm7rORESBvqYAlCnaMOzLQI7/R/tQT/qbD+qCPIw0VXL8EDPcbUb09chVYmLxOf
 YvVaMY1WwjOaCSYImT+Q2f8NmrJ1vUsf5HZAxeQYtc+7bAT55LHEv3sg9r4g3J1oC/g+Fo2lx
 zlHSPPAtzlbvegMHv4z9690csBuk0m8MhlyxGzu/LEkYv5cAKckryU/5ktrMYIbJ2RZE=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 27/01/2022 à 21:58, Cameron Esfahani a écrit :
> Instead of always returning 0, return actual starttime.
> 
> v2: Use clock_gettime() instead of scanning /proc/self/stat
> 
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> ---
>   linux-user/main.c    | 11 +++++++++++
>   linux-user/qemu.h    |  3 +++
>   linux-user/syscall.c |  3 +++
>   3 files changed, 17 insertions(+)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 16def5215d..2e5e0e886b 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -196,6 +196,17 @@ void init_task_state(TaskState *ts)
>           .ss_size = 0,
>           .ss_flags = TARGET_SS_DISABLE,
>       };
> +
> +    /* Capture task start time relative to system boot */
> +
> +    long long ticksPerSec = sysconf(_SC_CLK_TCK);

I don't think we need a "long long" here. sysconf() returns "long".

Use lower case with underscore

https://qemu-project.gitlab.io/qemu/devel/style.html#variable-naming-conventions

Put the declaration at the beginning of the function

https://qemu-project.gitlab.io/qemu/devel/style.html#declarations

> +    struct timespec bt;
> +
> +    if ((ticksPerSec > 0) && !clock_gettime(CLOCK_BOOTTIME, &bt)) {
> +        /* start_boottime is expressed in clock ticks */
> +        ts->start_boottime = bt.tv_sec * ticksPerSec;

You can cast ticksPerSec with uint64_t to have a 64bit result.

> +        ts->start_boottime += bt.tv_nsec * ticksPerSec / 1000000000L;

Use NANOSECONDS_PER_SECOND

> +    }
>   }
>   
>   CPUArchState *cpu_copy(CPUArchState *env)
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 7910ce59cc..86bc169e72 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -158,6 +158,9 @@ typedef struct TaskState {
>   
>       /* This thread's sigaltstack, if it has one */
>       struct target_sigaltstack sigaltstack_used;
> +
> +    /* Start time of task after system boot in clock ticks */
> +    unsigned long long start_boottime;

Use uint64_t, like the kernel does for start_boottime.

>   } __attribute__((aligned(16))) TaskState;
>   
>   abi_long do_brk(abi_ulong new_brk);
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5950222a77..2f77dbdda7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8107,6 +8107,9 @@ static int open_self_stat(void *cpu_env, int fd)
>           } else if (i == 3) {
>               /* ppid */
>               g_string_printf(buf, FMT_pid " ", getppid());
> +        } else if (i == 21) {
> +            /* starttime */
> +            g_string_printf(buf, "%llu ", ts->start_boottime);

with uint64_t, use "%PRIu64 ".

>           } else if (i == 27) {
>               /* stack bottom */
>               g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);

Except these minor tweaks, it looks good.

Thanks,
Laurent

