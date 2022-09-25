Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A105E9417
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:50:06 +0200 (CEST)
Received: from localhost ([::1]:52552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTtM-0000Jh-SM
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTqu-0007BR-C1
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:47:33 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocTqs-0001Am-I3
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:47:32 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2VKr-1pOdWq2msh-013zF5; Sun, 25 Sep 2022 17:47:27 +0200
Message-ID: <12696e40-af64-4dd2-bd47-eb270285edce@vivier.eu>
Date: Sun, 25 Sep 2022 17:47:26 +0200
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
 <5499dddd-4e60-ae0c-eaf4-ad56561f3585@vivier.eu>
 <2ccd28da-552b-722e-0534-df41c1962432@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <2ccd28da-552b-722e-0534-df41c1962432@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RAvUpfzEna6Xq31QwTY2S1Laabx6iqDeB3FPr2AFCXLEYzZ1BdP
 TSOIAvLx99sqAkxyCYWT2Lvp6uHzexPRFG4jUSX6AvXBYTRDjQ7ungtxoA8MjL2yCpjkaEq
 DhBDqJyJIw8SgqEFnrhWi/+WtR6+xG3VCXWupZwzTBuiq2w59ptSUCcMVXoD0fMdCtMTd/c
 2vVDb+37InXLT0h16rB9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RFrtKPlyQ4w=:hq33wObIirg6iXhAFKNJeK
 wWXScN1SS2LcF458B1+Pe1wZs8iCDxnJw0mzbLWTGPGFFCDo3Pv2+4YQRNnTwabcP48+xmJLD
 xh8g3UMwu2K5tI0iS4ZOPWHrJEh3FqSXSX9DFKbjxChDU14PgNCCDmz8uQO5kPw+qavcvLvmR
 3pugCTAC2Srb0Ha/Ge3U4Z8t4Ftui7WCMmMuceCv4K+n6jCQSy2FAQxtnxeHhJHvmMr8TdCVQ
 9Aexmxxm+EG/asroJLgyaEu7xBsrORZB5+TRQbT+u1Cn/KfZxQJk1+iha8g3c9grtdSlkH7dZ
 htglXWATXdfgG8Md5fn8KKZ7MRml1YtRhgP+5v71UrphDMWK8+bdcNjb9xOh3OjunNgig3Nje
 YAD8kPvVWqFLBRDhZdeA8xXCEeGrPi0ay8mFf5nwLSgIDuZAQ87MF+XAv//A/90a4/zp1LWDn
 YYiAlQnn3z25EI5c1NlcmbKEYANj+6gt/8eRMSbEma7osNcTeiSv8AH5oh6mRM+/Ec/mrjvxb
 KLtNQnjF0LllU6pM881FO6hGdXsVgCUesuvysaP6GeuACiS4+UMdURiJZLXKBeomcdOyp37wY
 VQZPTiZ/SSArztJnZKvvVFRXr5NsGwoijDbl+PmEgv8VKIsDXi1tIoZ69F+EplY12jg6OFOXJ
 yFU3iLbAjdkob1uI3SbtLowNa/aGlgdVgK5HhkQPHT5uatPRk9CqURL442bcRkTTkaYwybBLN
 lV/cYZ0DMzNIFPuKv7CNMy6AHzL26KR05nOLs7LTA+kZY9WZdKOrkpT7lBAemveM4KJeXv7n3
 e/+agnS
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 25/09/2022 à 17:27, Helge Deller a écrit :
> On 9/25/22 17:09, Laurent Vivier wrote:
>> Le 18/09/2022 à 21:45, Helge Deller a écrit :
>>> Allow linux-user to strace the clock_gettime64() syscall.
>>> This syscall is used a lot on 32-bit guest architectures which use newer
>>> glibc versions.
>>>
>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>> ---
>>>   linux-user/strace.c    | 53 ++++++++++++++++++++++++++++++++++++++++++
>>>   linux-user/strace.list |  4 ++++
>>>   2 files changed, 57 insertions(+)
>>>
>>> diff --git a/linux-user/strace.c b/linux-user/strace.c
>>> index a4eeef7ae1..816e679995 100644
>>> --- a/linux-user/strace.c
>>> +++ b/linux-user/strace.c
>>> @@ -82,6 +82,7 @@ UNUSED static void print_buf(abi_long addr, abi_long len, int last);
>>>   UNUSED static void print_raw_param(const char *, abi_long, int);
>>>   UNUSED static void print_timeval(abi_ulong, int);
>>>   UNUSED static void print_timespec(abi_ulong, int);
>>> +UNUSED static void print_timespec64(abi_ulong, int);
>>>   UNUSED static void print_timezone(abi_ulong, int);
>>>   UNUSED static void print_itimerval(abi_ulong, int);
>>>   UNUSED static void print_number(abi_long, int);
>>> @@ -795,6 +796,24 @@ print_syscall_ret_clock_gettime(CPUArchState *cpu_env, const struct syscallname
>>>   #define print_syscall_ret_clock_getres     print_syscall_ret_clock_gettime
>>>   #endif
>>>
>>> +#if defined(TARGET_NR_clock_gettime64)
>>> +static void
>>> +print_syscall_ret_clock_gettime64(CPUArchState *cpu_env, const struct syscallname *name,
>>> +                                abi_long ret, abi_long arg0, abi_long arg1,
>>> +                                abi_long arg2, abi_long arg3, abi_long arg4,
>>> +                                abi_long arg5)
>>> +{
>>> +    if (!print_syscall_err(ret)) {
>>> +        qemu_log(TARGET_ABI_FMT_ld, ret);
>>> +        qemu_log(" (");
>>> +        print_timespec64(arg1, 1);
>>> +        qemu_log(")");
>>> +    }
>>> +
>>> +    qemu_log("\n");
>>> +}
>>> +#endif
>>> +
>>>   #ifdef TARGET_NR_gettimeofday
>>>   static void
>>>   print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const struct syscallname *name,
>>> @@ -1652,6 +1671,27 @@ print_timespec(abi_ulong ts_addr, int last)
>>>       }
>>>   }
>>>
>>> +static void
>>> +print_timespec64(abi_ulong ts_addr, int last)
>>> +{
>>> +    if (ts_addr) {
>>> +        struct target__kernel_timespec *ts;
>>> +
>>> +        ts = lock_user(VERIFY_READ, ts_addr, sizeof(*ts), 1);
>>> +        if (!ts) {
>>> +            print_pointer(ts_addr, last);
>>> +            return;
>>> +        }
>>> +        qemu_log("{tv_sec = %lld"
>>> +                 ",tv_nsec = %lld}%s",
>>> +                 (long long)tswap64(ts->tv_sec), (long long)tswap64(ts->tv_nsec),
>>> +                 get_comma(last));
>>> +        unlock_user(ts, ts_addr, 0);
>>> +    } else {
>>> +        qemu_log("NULL%s", get_comma(last));
>>> +    }
>>> +}
>>> +
>>>   static void
>>>   print_timezone(abi_ulong tz_addr, int last)
>>>   {
>>> @@ -2267,6 +2307,19 @@ print_clock_gettime(CPUArchState *cpu_env, const struct syscallname *name,
>>>   #define print_clock_getres     print_clock_gettime
>>>   #endif
>>>
>>> +#if defined(TARGET_NR_clock_gettime64)
>>> +static void
>>> +print_clock_gettime64(CPUArchState *cpu_env, const struct syscallname *name,
>>> +                    abi_long arg0, abi_long arg1, abi_long arg2,
>>> +                    abi_long arg3, abi_long arg4, abi_long arg5)
>>> +{
>>> +    print_syscall_prologue(name);
>>> +    print_enums(clockids, arg0, 0);
>>> +    print_pointer(arg1, 1);
>>> +    print_syscall_epilogue(name);
>>> +}
>>> +#endif
>>
>> I think it could be simply:
>>
>> #define print_clock_gettime64 print_clock_gettime where print_clock_gettime() is defined.
> 
> Unfortunately not, because one uses print_timespec() while the other uses print_timespec64().
> 

The syscall_ret part cannot be shared, but the prefix function can, they are identical.

Thanks,
Laurent


