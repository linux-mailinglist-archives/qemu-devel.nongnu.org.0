Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294FD6078AF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 15:41:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsHL-0000z8-Sr
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:41:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olsCQ-0005LC-PF
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 09:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olsBy-00051j-9U
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:36:16 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1olsBv-00076C-T0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 09:36:06 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MjSDU-1pVMLC3CR8-00kuUR; Fri, 21 Oct 2022 15:35:52 +0200
Message-ID: <525dc49d-716f-f970-6fe2-028033d30197@vivier.eu>
Date: Fri, 21 Oct 2022 15:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2] linux-user: Add guest memory layout to exception dump
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <YzMru6y+v5bbsTRn@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <YzMru6y+v5bbsTRn@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:D6guE41CDthgrDR8qEKqMPzjhuLixoGXDC/1aBkb4r9nAJFAKGu
 LLy0Cy7w3+VZk0v87nTN6A4D3M2pfCq+Yz1H/cG02dFQx/uSAUL6P9+Iuc5DcBxegYP7nJo
 kLA9UlP0KrmSj50jZx4M6hzuszKRj4VVF84DFg+t5oni54MJ1ucwnfWyw4zHTUAadRcmTG4
 K0WWpMNMhQeHrfciE950A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dkPqhpIm7PM=:7ylOKzAlv5P6nxaIP5DtvH
 I4U87O4lok3Pl/xWTQ7CTk7gealx3EBr+nhtOhwZ4M0oypLvYMK1fIIvuofMYBRJC17KQYduX
 rO1qi4cWgjvkQqx7MO0IXEhM9bibYGdqK1aq80YAcdbIRD0mPNhnwtpg8LlUOLQG3+qsmPVUY
 UQR4IhWfaxjspjlClO6z8cNVXGt48Pv3qjrPWUCL6Zds0WoG+sPnSNVCeuh/ncqGSkLeKtsWz
 0ICK1wKxR8Njs62JYfyFFEq5R8+d/PvRtegTcvTHUN7uVLUJSH7RAwLwfl02Esb3X4bIB3kkD
 MFH+XTtJajfT4Q/8QVd/g0Ou45FgXhhiY2l2Xrf3H74QPsAoeAFB919K2LL0vwrHVIpqG4sPv
 z3V4sZxbUvhhpipCesmL3mLh6RiRit20a5aN+yGzZr4Rsi3Mo4YXUziHj+JtVKS0xK7J/udMm
 walgp5UqSEJRUYyWbF9D1zgQDi4Ogo3PQKNEuQyS/GKGJV5mXSouqbeN/gDxkJ5CN6CvQ4P5C
 RFTej2izKzQ32XrWrqCtyPK+FSG+LAXdNfcPz8Trzi5eVRQj17gpjTuOqqak719iJmUNQQWMK
 QLTclGXsVt5b3ScbO3lHddf537eIs7mDBI7N0NjrG1eapxdWkZ3kRaMUY237FBZl8fYvDHgMW
 Mmt1kAYSxF0HG6liJScWPeTE/eAR77fB4S5Nqrivhd15E2vTTfE8CwyDJjmpp3jhbE9P4elsk
 lWHnUhxmeMMwwXLWhm7KwyB2cABsoU+llzrRihrfL26lWlBKExPj0+jEwwG7z+XEdoatIcUev
 RawFUji
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 27/09/2022 à 18:58, Helge Deller a écrit :
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
> 
> ---
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
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



