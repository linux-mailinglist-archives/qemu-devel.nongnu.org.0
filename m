Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B527607B6F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:44:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oluCZ-0000Zd-Sf
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:44:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oluCX-00008y-3r
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oluBi-0001hA-9U
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:44:00 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oluBg-0002De-2q
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:43:57 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MCsHm-1oufbz2Z6m-008oWV; Fri, 21 Oct 2022 17:43:51 +0200
Message-ID: <7afdfcea-0b9e-9074-7331-b155dfe292e5@vivier.eu>
Date: Fri, 21 Oct 2022 17:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] linux-user: Add guest memory layout to exception dump
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <YzMru6y+v5bbsTRn@p100>
 <5cabeb0b-1219-ae01-38bc-dc0873d502c8@vivier.eu>
In-Reply-To: <5cabeb0b-1219-ae01-38bc-dc0873d502c8@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n0eQycNV5oMalxRhR0MMhr6fp4emvssr4lt9KfasG3p1wOOWakz
 Uvo1xvHTgH9TA9vboupkEYuDV01860rewSYAVhfXsppr3n0zI7V/fch12QpVQelqjNqaq+c
 UATZQTnBAmSRSPWnYVO39/Cp+ArgGHdii2EZ1hJG6dDC/olXJTuAovobcOmgoxSsIVGgIJz
 jfXnr8KGQrH6pSJ3v12oA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:swaJ6/KZ8JA=:5Nxze7uSaWiLzV9SuN6hFG
 JRk/tzZM+yr+NrG/DW1tk9P57TmHVOVvO5uuciWr+Wy68wAZ+0fwC1WE1ioWwtPQu9LWw1rxg
 dtgi9kciXUhg1EFJQ6UFiBb2809IoBhMcGVWBtoWFXgz8pf8NFGQwN/lH6g+qlke1QfHECBbP
 QICoHB3CMf6yMKK2LY1WS8jNIP/0bhBYZCbJIOrWEXhuTdkt1BWVSdOAOWb+hTTezxYX6Ji1P
 RU9RJ0pqBfv3nM1gE//Rq9IpuUNOKvjcrSsPxz5IpKuN0PNGFvh34ovM0GJnyoNbdF+xwFcLA
 KuQCWnkFusgH5gJNGE2h2gAADN4B92ljMGvoUAcYYyuXVM2TRPWu7yD3O+IKdBMLnb4gzMWKg
 2ukkMfL3MiKe8Iiw4fCOU5onjXYs4qqDIq1ZJbQXLTIT1BWvShydYWdD0LopowJe7V3gAzg+8
 fK2g2BT2AYO6P8DX+1HKzMOUgAgw1IWwBngtmMADtvPGbojImHMDynN91qAU/UUd6kEThbm7g
 ZXWgYLmhHTQl4v5DsX2pQY8ml74fT4GTDumeYpkA/yMJBKQy4OeDgDbwjU360RghC+BTejLI4
 nNFvjxDX9gg+IQ2FnqXZCHo1fifcKp5NxxHFr0l5H4nWaXPoKx2H+wwPyPux5AaTl8V0P8MYz
 7NeTLeMPeW4xjlN9rZ0QRKzsLbe2j9aZiWTgH50yniYstuOdGomNkMFXDamoO453YbQBcsJc+
 3WhtfIbeza56kYsMkyUfaFQCD+fxJbECmKo08lQM5ajDKE8gmElw+fAi2lR3J5C9b56evMJtS
 aWghd8Q
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/10/2022 à 16:57, Laurent Vivier a écrit :
> Le 27/09/2022 à 18:58, Helge Deller a écrit :
>> When the emulation stops with a hard exception it's very useful for
>> debugging purposes to dump the current guest memory layout (for an
>> example see /proc/self/maps) beside the CPU registers.
>>
>> The open_self_maps() function provides such a memory dump, but since
>> it's located in the syscall.c file, various changes (add #includes, make
>> this function externally visible, ...) are needed to be able to call it
>> from the existing EXCP_DUMP() macro.
>>
>> This patch takes another approach by re-defining EXCP_DUMP() to call
>> target_exception_dump(), which is in syscall.c, consolidates the log
>> print functions and allows to add the call to dump the memory layout.
>>
>> Beside a reduced code footprint, this approach keeps the changes across
>> the various callers minimal, and keeps EXCP_DUMP() highlighted as
>> important macro/function.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> ---
>>
>> v2:
>> Based on feedback by Philippe Mathieu-Daudé, renamed the two functions
>> to excp_dump_file() and target_exception_dump(), and #define'ed
>> EXCP_DUMP() to target_exception_dump().
>> I intentionally did not replace all occurences of EXCP_DUMP() by
>> target_exception_dump() as I think it's unneccesary and not beneficial.
>> If this is really wished, I will send a v3.
>>
>>
>> diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
>> index 36ff5b14f2..e644d2ef90 100644
>> --- a/linux-user/cpu_loop-common.h
>> +++ b/linux-user/cpu_loop-common.h
>> @@ -23,18 +23,9 @@
>>   #include "exec/log.h"
>>   #include "special-errno.h"
>>
>> -#define EXCP_DUMP(env, fmt, ...)                                        \
>> -do {                                                                    \
>> -    CPUState *cs = env_cpu(env);                                        \
>> -    fprintf(stderr, fmt , ## __VA_ARGS__);                              \
>> -    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
>> -    cpu_dump_state(cs, stderr, 0);                                      \
>> -    if (qemu_log_separate()) {                                          \
>> -        qemu_log(fmt, ## __VA_ARGS__);                                  \
>> -        qemu_log("Failing executable: %s\n", exec_path);                \
>> -        log_cpu_state(cs, 0);                                           \
>> -    }                                                                   \
>> -} while (0)
>> +void target_exception_dump(CPUArchState *env, const char *fmt, int code);
>> +#define EXCP_DUMP(env, fmt, code) \
>> +    target_exception_dump(env, fmt, code)
>>
>>   void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs);
>>   #endif
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 2e954d8dbd..7d29c4c396 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -158,6 +158,7 @@
>>   #include "qapi/error.h"
>>   #include "fd-trans.h"
>>   #include "tcg/tcg.h"
>> +#include "cpu_loop-common.h"
>>
>>   #ifndef CLONE_IO
>>   #define CLONE_IO                0x80000000      /* Clone io context */
>> @@ -8144,6 +8145,33 @@ static int is_proc_myself(const char *filename, const char *entry)
>>       return 0;
>>   }
>>
>> +static void excp_dump_file(FILE *logfile, CPUArchState *env,
>> +                      const char *fmt, int code)
>> +{
>> +    if (logfile) {
>> +        CPUState *cs = env_cpu(env);
>> +
>> +        fprintf(logfile, fmt, code);
>> +        fprintf(logfile, "Failing executable: %s\n", exec_path);
>> +        cpu_dump_state(cs, logfile, 0);
>> +        open_self_maps(env, fileno(logfile));
>> +    }
>> +}
>> +
>> +void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>> +{
>> +    /* dump to console */
>> +    excp_dump_file(stderr, env, fmt, code);
>> +
>> +    /* dump to log file */
>> +    if (qemu_log_separate()) {
>> +        FILE *logfile = qemu_log_trylock();
>> +
>> +        excp_dump_file(logfile, env, fmt, code);
>> +        qemu_log_unlock(logfile);
>> +    }
>> +}
>> +
>>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
>>       defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
>>   static int is_proc(const char *filename, const char *entry)
>>
> 
> Applied to my linux-user-for-7.2 branch.

This breaks build with:

.../linux-user/i386/cpu_loop.c: In function 'cpu_loop':
...linux-user/i386/cpu_loop.c:312:39: error: macro "EXCP_DUMP" passed 4 arguments, but takes just 3
   312 |                       (long)pc, trapnr);
       |                                       ^
In file included from .../linux-user/i386/cpu_loop.c:24:
.../linux-user/cpu_loop-common.h:27: note: macro "EXCP_DUMP" defined here
    27 | #define EXCP_DUMP(env, fmt, code) \
       |
.../linux-user/i386/cpu_loop.c:311:13: error: 'EXCP_DUMP' undeclared (first use in this function)
   311 |             EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
       |             ^~~~~~~~~
.../linux-user/i386/cpu_loop.c:311:13: note: each undeclared identifier is reported only once for 
each function it appears in
.../linux-user/i386/cpu_loop.c:204:15: error: variable 'pc' set but not used 
[-Werror=unused-but-set-variable]
   204 |     abi_ulong pc;
       |               ^~
cc1: all warnings being treated as errors




