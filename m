Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E160BA94
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 22:38:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on45E-0005X9-75; Mon, 24 Oct 2022 16:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1on45C-0005Wx-J4
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:30:02 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1on45A-0003pE-NX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:30:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MN5S1-1oUZC23wEH-00J2Wv; Mon, 24 Oct 2022 22:29:56 +0200
Message-ID: <74966876-89f0-92bb-9af5-8998e590311d@vivier.eu>
Date: Mon, 24 Oct 2022 22:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] linux-user: Add guest memory layout to exception dump
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <Y1bzAWbw07WBKPxw@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y1bzAWbw07WBKPxw@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QiwTtOeJbow9jpnQz7dRA3voqtRq7NRPH23S/r/0GHETpfahc3r
 Li74TNzROgxKHJyStzAutpqH2C+gB5AawvIoyGzQsqX2q2NC1idA2iwgnaoDg1gMCQ8Qe3f
 epFULGS+RAyVm1l68usqizR4QyQbvSod7zqSCa/1qgLY3Ok+obmowFz6MNWchgx/8JqHuBn
 lNPn0GLbH+ys7DgS10v3w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yqgH1FU9DjA=:/Wjyf9D1r42G5vcwoIQvVp
 aJl5l9TTqmJvn1X+muCnUA+mq/+08MCwgxISYIlA0OON9I6JamGMU84XJAOAEDvtUcZvjjn1Y
 IPbG6KE0SF3ZOqhSQu5pc7xTvIL/Is2DTRLSHJFo1Ira5q/TPjmZv7IWSxE3v7fazzNM6T9gD
 lq9N2z1W0QGaFwl9XQcIdVj5eF+m3/Kek+MJiA/OJLCQ2fe6bpeXifZv9Z1hTEQaK/OQnpMqL
 kx7gKgmbzaoqPF77MQkgxtHbxQfMJFnMXcpF85FWDXJoNd1stxGXW3InUuxt8WlBCqxvqo/KI
 PLEwAfz1EjiSsDERVbF80ORoC8UwR/HJ1eWsYD7MZMoD0lb3IT7amBAzLTizSeAkkinYCZL7N
 +EQVw9KtwwANUv09dhujNgbqPgrpXmv3Ng9ab/4BgZkbjIJ3hE7mEzeGg8Yhqdpsmck0tWYp9
 bh8C7NRcV1e4wwBVDdMcMzIidqU1z/ievVlcdTWfDDRbtMmpwfsfEzp+Op7f+ywM45h8RLcIR
 M3KdrsXgMQu8ZEiJnScL4REnXHwWqFwFWTQW/i6jPQz+L5w34THxxYhPMdotqubnKvaMseV1W
 1J5QNl2q9+NbxmM/p7UgBNZRdTwmMuzQu888Oz2vp8gKOih1hRXDpuxkNbj/wHl0I5kOs8xts
 CcsGwfHmQhGj4joT39YEIakURVxFSlQTWe0RSm4dnJ2OuvJCGJpGoHzZuBoQlCHQqD8yuOE5h
 Sfkub0Ax9gC3tExCy3K+WU9Qe21pGu2wCUqeM5UW4A92VTF1O4oOdMXYfUOgo8AsE75K9Q72J
 AVePGFD
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 24/10/2022 à 22:18, Helge Deller a écrit :
> When the emulation stops with a hard exception it's very useful for
> debugging purposes to dump the current guest memory layout (for an
> example see /proc/self/maps) beside the CPU registers.
> 
> The open_self_maps() function provides such a memory dump, but since
> it's located in the syscall.c file, various changes (add #includes, make
> this function externally visible, ...) are needed to be able to call it
> from the existing EXCP_DUMP() macro.
> 
> This patch takes another approach by re-defining EXCP_DUMP() to call
> target_exception_dump(), which is in syscall.c, consolidates the log
> print functions and allows to add the call to dump the memory layout.
> 
> Beside a reduced code footprint, this approach keeps the changes across
> the various callers minimal, and keeps EXCP_DUMP() highlighted as
> important macro/function.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> 
> v3:
> Fix build error in i386/cpu_loop.c
> 
> v2:
> Based on feedback by Philippe Mathieu-Daudé, renamed the two functions
> to excp_dump_file() and target_exception_dump(), and #define'ed
> EXCP_DUMP() to target_exception_dump().
> I intentionally did not replace all occurences of EXCP_DUMP() by
> target_exception_dump() as I think it's unneccesary and not beneficial.
> If this is really wished, I will send a v3.
> 
> 
> diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
> index 36ff5b14f2..e644d2ef90 100644
> --- a/linux-user/cpu_loop-common.h
> +++ b/linux-user/cpu_loop-common.h
> @@ -23,18 +23,9 @@
>   #include "exec/log.h"
>   #include "special-errno.h"
> 
> -#define EXCP_DUMP(env, fmt, ...)                                        \
> -do {                                                                    \
> -    CPUState *cs = env_cpu(env);                                        \
> -    fprintf(stderr, fmt , ## __VA_ARGS__);                              \
> -    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
> -    cpu_dump_state(cs, stderr, 0);                                      \
> -    if (qemu_log_separate()) {                                          \
> -        qemu_log(fmt, ## __VA_ARGS__);                                  \
> -        qemu_log("Failing executable: %s\n", exec_path);                \
> -        log_cpu_state(cs, 0);                                           \
> -    }                                                                   \
> -} while (0)
> +void target_exception_dump(CPUArchState *env, const char *fmt, int code);
> +#define EXCP_DUMP(env, fmt, code) \
> +    target_exception_dump(env, fmt, code)
> 
>   void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs);
>   #endif
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index 42837399bc..404f6d6634 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -308,8 +308,8 @@ void cpu_loop(CPUX86State *env)
>               break;
>           default:
>               pc = env->segs[R_CS].base + env->eip;
> -            EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
> -                      (long)pc, trapnr);
> +            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n",
> +                      trapnr);
>               abort();
>           }
>           process_pending_signals(env);
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 2e954d8dbd..7d29c4c396 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -158,6 +158,7 @@
>   #include "qapi/error.h"
>   #include "fd-trans.h"
>   #include "tcg/tcg.h"
> +#include "cpu_loop-common.h"
> 
>   #ifndef CLONE_IO
>   #define CLONE_IO                0x80000000      /* Clone io context */
> @@ -8144,6 +8145,33 @@ static int is_proc_myself(const char *filename, const char *entry)
>       return 0;
>   }
> 
> +static void excp_dump_file(FILE *logfile, CPUArchState *env,
> +                      const char *fmt, int code)
> +{
> +    if (logfile) {
> +        CPUState *cs = env_cpu(env);
> +
> +        fprintf(logfile, fmt, code);
> +        fprintf(logfile, "Failing executable: %s\n", exec_path);
> +        cpu_dump_state(cs, logfile, 0);
> +        open_self_maps(env, fileno(logfile));
> +    }
> +}
> +
> +void target_exception_dump(CPUArchState *env, const char *fmt, int code)
> +{
> +    /* dump to console */
> +    excp_dump_file(stderr, env, fmt, code);
> +
> +    /* dump to log file */
> +    if (qemu_log_separate()) {
> +        FILE *logfile = qemu_log_trylock();
> +
> +        excp_dump_file(logfile, env, fmt, code);
> +        qemu_log_unlock(logfile);
> +    }
> +}
> +
>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
>       defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
>   static int is_proc(const char *filename, const char *entry)

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


