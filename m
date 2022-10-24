Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0060AE22
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:49:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy5e-00077y-I7; Mon, 24 Oct 2022 10:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omy55-000725-8C
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:05:38 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1omy52-0002bj-42
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:05:30 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McpW6-1pLTY90Uni-00Zwqt; Mon, 24 Oct 2022 16:05:23 +0200
Message-ID: <95122ba4-503d-18b9-a12f-44dbb5105504@vivier.eu>
Date: Mon, 24 Oct 2022 16:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] linux-user: Add guest memory layout to exception dump
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <YzMru6y+v5bbsTRn@p100>
 <5cabeb0b-1219-ae01-38bc-dc0873d502c8@vivier.eu>
 <7afdfcea-0b9e-9074-7331-b155dfe292e5@vivier.eu>
 <722bd3f3-3b5f-03aa-0c2e-5ceef4cfd883@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <722bd3f3-3b5f-03aa-0c2e-5ceef4cfd883@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ho2rhzIu6UeHnf+yG2+OU124ybqg/cNTl0rplzvkGQzaXL7z0tA
 f2tmdMw5xQ1XfMMek5xeja9z89+CeaE+bcP9pDXUik3kgTsz9zf/GJ/FbstEClioUEQftfg
 0tQsRfmrycH47qnXo2pfBZMwbloXAhERkfw/ZDbhYYPdJ8GZjRAWqQ3s4d77TEIymaDxWVV
 PTTczbF3MNN9fKzHGUQNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SPVYGEjl0PI=:rbT2crTS5MwL5Dfq+t6Fkb
 Bfx4tqFoQM6Y4pW2Wr8QU6wZp3gKEFCOEtsZcDv7JC9I570ipa+wAh0FgQcUJ0UJ10CAFhequ
 SGLJhxT5gCBufk4+flpG04HAjdWJkbyypdSyH3MeSwjQbcPEnp3Whtq+n2BZQtGjEXiJl83Ho
 7kcaT18A0awY6ing4VnoRoQPsadXxZwIlilk9mycKt6ZoJIGWzDExMbVZbJy69D6hBAXSZ3Hs
 LXBK3FQ6DNAlHF0ZIkneBlKWqiqa2cvLCUB5pGJPrFAUVsc6T6QsZNfwBefkTIzyklZNEhO1d
 8NIqx1QqlnA4mvV+dL6w5RPku2ma3uUDayXTkAyMHs6G7zdYpg+eBQHooiaAKBqJd19RtQ2Iy
 wODBAeuTgm6ZaBJuglY1IwPhXeNVcZY/RJO9a1y9QdNaTY+T8B1rVVZYVDypRybn64vrvfHQO
 oWLjE4TjWHSsGu0gxh636oYXF1k27MQZ6w9dpVnHf7ZFfOdoF9Olh5smreWkm60Eb05givbSy
 uPD4KHJdK12PiPo374CkqZTRc7vZcd0YVxt0+6pGYYAoWFR2GrgUFk6gwLM2d/7RT+M5dChkf
 XJrRlNeizSYR3tcxTqTXtTaRXt0rjzjnQe7zi3MXs++3pLyhMqfqyi/xKbt/HSxU5iFZijELD
 tQmYmWwjP+OXOVNOXw99AhakOTfwgNDVZd9ueOU7w7SxuFSA3+hU1Z+wfR8a5o/15BtC4tfFh
 6OqSr/9PvD3TtviMkaI5XiU/qrG3Wu6xKpnaTrbRhwlCzdVdGsj6uPnAHw3CcKpEafK7/7V76
 SxoKyFs
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 21/10/2022 à 18:21, Helge Deller a écrit :
> On 10/21/22 17:43, Laurent Vivier wrote:
>> Le 21/10/2022 à 16:57, Laurent Vivier a écrit :
>>> Le 27/09/2022 à 18:58, Helge Deller a écrit :
>>>> When the emulation stops with a hard exception it's very useful for
>>>> debugging purposes to dump the current guest memory layout (for an
>>>> example see /proc/self/maps) beside the CPU registers.
>>>>
>>>> The open_self_maps() function provides such a memory dump, but since
>>>> it's located in the syscall.c file, various changes (add #includes, make
>>>> this function externally visible, ...) are needed to be able to call it
>>>> from the existing EXCP_DUMP() macro.
>>>>
>>>> This patch takes another approach by re-defining EXCP_DUMP() to call
>>>> target_exception_dump(), which is in syscall.c, consolidates the log
>>>> print functions and allows to add the call to dump the memory layout.
>>>>
>>>> Beside a reduced code footprint, this approach keeps the changes across
>>>> the various callers minimal, and keeps EXCP_DUMP() highlighted as
>>>> important macro/function.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>
>>>> ---
>>>>
>>>> v2:
>>>> Based on feedback by Philippe Mathieu-Daudé, renamed the two functions
>>>> to excp_dump_file() and target_exception_dump(), and #define'ed
>>>> EXCP_DUMP() to target_exception_dump().
>>>> I intentionally did not replace all occurences of EXCP_DUMP() by
>>>> target_exception_dump() as I think it's unneccesary and not beneficial.
>>>> If this is really wished, I will send a v3.
>>>>
>>>>
>>>> diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
>>>> index 36ff5b14f2..e644d2ef90 100644
>>>> --- a/linux-user/cpu_loop-common.h
>>>> +++ b/linux-user/cpu_loop-common.h
>>>> @@ -23,18 +23,9 @@
>>>>   #include "exec/log.h"
>>>>   #include "special-errno.h"
>>>>
>>>> -#define EXCP_DUMP(env, fmt, ...)                                        \
>>>> -do {                                                                    \
>>>> -    CPUState *cs = env_cpu(env);                                        \
>>>> -    fprintf(stderr, fmt , ## __VA_ARGS__);                              \
>>>> -    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
>>>> -    cpu_dump_state(cs, stderr, 0);                                      \
>>>> -    if (qemu_log_separate()) {                                          \
>>>> -        qemu_log(fmt, ## __VA_ARGS__);                                  \
>>>> -        qemu_log("Failing executable: %s\n", exec_path);                \
>>>> -        log_cpu_state(cs, 0);                                           \
>>>> -    }                                                                   \
>>>> -} while (0)
>>>> +void target_exception_dump(CPUArchState *env, const char *fmt, int code);
>>>> +#define EXCP_DUMP(env, fmt, code) \
>>>> +    target_exception_dump(env, fmt, code)
>>>>
>>>>   void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs);
>>>>   #endif
>>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>>> index 2e954d8dbd..7d29c4c396 100644
>>>> --- a/linux-user/syscall.c
>>>> +++ b/linux-user/syscall.c
>>>> @@ -158,6 +158,7 @@
>>>>   #include "qapi/error.h"
>>>>   #include "fd-trans.h"
>>>>   #include "tcg/tcg.h"
>>>> +#include "cpu_loop-common.h"
>>>>
>>>>   #ifndef CLONE_IO
>>>>   #define CLONE_IO                0x80000000      /* Clone io context */
>>>> @@ -8144,6 +8145,33 @@ static int is_proc_myself(const char *filename, const char *entry)
>>>>       return 0;
>>>>   }
>>>>
>>>> +static void excp_dump_file(FILE *logfile, CPUArchState *env,
>>>> +                      const char *fmt, int code)
>>>> +{
>>>> +    if (logfile) {
>>>> +        CPUState *cs = env_cpu(env);
>>>> +
>>>> +        fprintf(logfile, fmt, code);
>>>> +        fprintf(logfile, "Failing executable: %s\n", exec_path);
>>>> +        cpu_dump_state(cs, logfile, 0);
>>>> +        open_self_maps(env, fileno(logfile));
>>>> +    }
>>>> +}
>>>> +
>>>> +void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>>>> +{
>>>> +    /* dump to console */
>>>> +    excp_dump_file(stderr, env, fmt, code);
>>>> +
>>>> +    /* dump to log file */
>>>> +    if (qemu_log_separate()) {
>>>> +        FILE *logfile = qemu_log_trylock();
>>>> +
>>>> +        excp_dump_file(logfile, env, fmt, code);
>>>> +        qemu_log_unlock(logfile);
>>>> +    }
>>>> +}
>>>> +
>>>>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
>>>>       defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
>>>>   static int is_proc(const char *filename, const char *entry)
>>>>
>>>
>>> Applied to my linux-user-for-7.2 branch.
>>
>> This breaks build with:
>>
>> .../linux-user/i386/cpu_loop.c: In function 'cpu_loop':
>> ...linux-user/i386/cpu_loop.c:312:39: error: macro "EXCP_DUMP" passed 4 arguments, but takes just 3
>>    312 |                       (long)pc, trapnr);
>>        |                                       ^
> 
> This is because of this line:
>             EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
>                        (long)pc, trapnr);
> 
> I wonder if it is ok to drop the pc value. It should be printed in the register dump
> anyway.
> If Ok, should I send a new v3 patch, or a patch in front of my v2 patch?

I think you can drop the PC value. Send a v3 please.

Thanks,
Laurent



