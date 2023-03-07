Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4AC6AE377
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:56:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYjp-0000s9-QM; Tue, 07 Mar 2023 09:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYjn-0000rV-98
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:56:23 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZYjl-0004HW-I7
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:56:23 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIKs0-1plgE3190O-00EQg0; Tue, 07 Mar 2023 15:56:19 +0100
Message-ID: <08bdd96d-a4dd-945c-a0e0-61583e4372c8@vivier.eu>
Date: Tue, 7 Mar 2023 15:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: Add strace for prlimit64() syscall
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20221222190639.124078-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221222190639.124078-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cSgq69ezcgybQM2oEqHFCy5dUj4vliyYFfMacHzjqKaedclx/t6
 FywCxq6L+l2iCXPlOuUEs09MPXigEwLmD4ehhtJk22eSCuUbBg1vfj1NTabDgOCqIX0Hr6G
 +aax4v81fv2dbHOWSyM20DFV8C7fGdChR/AxLZxU63qBDZpuieaQRYpKh4qgY5miTjh6Dlb
 rgGUW99JIYEFtg0xCUvbQ==
UI-OutboundReport: notjunk:1;M01:P0:QOaZDi29QEs=;R5od6wGMUjQytpPApYZOuarWRzL
 toHOR01bHLRcsVUTPhaP/0w5VKZ/ooMoH1FJ2/gq8bWFitFN3fWdHWiR+hxLZFJ2vw29HAvEd
 LFonEnWJ5Yxxwi3a8FKDih85dPFOL54fBbQBIeOOafjKeRzvSwR+0JkZfVs2SDRP2R/6VAOui
 io38B7gUkaN0Z38WNvr2SJtbDK8DQ1pVhh8hK2AdtQQpYROT/YP8O14lICIKB68GAZSWbFuN/
 Gmxrbtspw21BtvE4ygxa6uM9DrELg+o4C5ZPjhHmOxSYHaCbYTXckcq33z2pwRgKCCTIRX30K
 aHShTrt1Wuzir/hWkbplLoJ1dcdMTzfKnL56Xl2X3F8JYIsrEs16+nHy6nER8ft2iGv4P1JDU
 Ye+bmSDn/I6zX+bRNfbzr/3YWTTbcy+dA6y0pNDb4KTdzsvpIltFGLjej1qoh+OKrXKCqU0lR
 PkFy0t7kRDrcI6JQkDf7O6cCbHwyzPNAfyNXaca6BDHsElAIzMgrm0t2MJ4oE7WPzHGpO+yMM
 sZoeXQ+XieUJmyI7Z6jsSMQkThOEPkmGtd5Qt8KYf+tNfMb0bL9eeF2NmWTFsQwAOHcHbhpwt
 oGmCYOs0Hbl/foldfD5nx3Ck8Jx7DEy0WjJoBcnSjV5j+BXKYHjwXTy6A99nQ68Twm/ekuLSx
 /cWeffdGCcBQx4qa8Fl+mxqsoo1rTa4rtrmQQfT3Zw==
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/12/2022 à 20:06, Helge Deller a écrit :
> Add proper prlimit64() strace output.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.c    | 89 ++++++++++++++++++++++++++++++++++++++++++
>   linux-user/strace.list |  3 +-
>   2 files changed, 91 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 3ea91084fb..82dc1a1e20 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3774,6 +3774,95 @@ print_futex(CPUArchState *cpu_env, const struct syscallname *name,
>   }
>   #endif
> 
> +#ifdef TARGET_NR_prlimit64
> +static const char *target_ressource_string(abi_ulong r)
> +{
> +    #define RET_RES_ENTRY(res) case TARGET_##res:  return #res;
> +    switch (r) {
> +    RET_RES_ENTRY(RLIMIT_AS);
> +    RET_RES_ENTRY(RLIMIT_CORE);
> +    RET_RES_ENTRY(RLIMIT_CPU);
> +    RET_RES_ENTRY(RLIMIT_DATA);
> +    RET_RES_ENTRY(RLIMIT_FSIZE);
> +    RET_RES_ENTRY(RLIMIT_LOCKS);
> +    RET_RES_ENTRY(RLIMIT_MEMLOCK);
> +    RET_RES_ENTRY(RLIMIT_MSGQUEUE);
> +    RET_RES_ENTRY(RLIMIT_NICE);
> +    RET_RES_ENTRY(RLIMIT_NOFILE);
> +    RET_RES_ENTRY(RLIMIT_NPROC);
> +    RET_RES_ENTRY(RLIMIT_RSS);
> +    RET_RES_ENTRY(RLIMIT_RTPRIO);
> +#ifdef RLIMIT_RTTIME
> +    RET_RES_ENTRY(RLIMIT_RTTIME);
> +#endif
> +    RET_RES_ENTRY(RLIMIT_SIGPENDING);
> +    RET_RES_ENTRY(RLIMIT_STACK);
> +    default:
> +        return NULL;
> +    }
> +    #undef RET_RES_ENTRY
> +}
> +
> +static void
> +print_rlimit64(abi_ulong rlim_addr, int last)
> +{
> +    if (rlim_addr) {
> +        struct target_rlimit64 *rl;
> +
> +        rl = lock_user(VERIFY_READ, rlim_addr, sizeof(*rl), 1);
> +        if (!rl) {
> +            print_pointer(rlim_addr, last);
> +            return;
> +        }
> +        qemu_log("{rlim_cur = %lld, rlim_max = %lld}%s",
> +                 (long long)tswap64(rl->rlim_cur),
> +                 (long long)tswap64(rl->rlim_max),
> +                 get_comma(last));
> +        unlock_user(rl, rlim_addr, 0);
> +    } else {
> +        qemu_log("NULL%s", get_comma(last));
> +    }
> +}
> +
> +static void
> +print_prlimit64(CPUArchState *cpu_env, const struct syscallname *name,
> +           abi_long arg0, abi_long arg1, abi_long arg2,
> +           abi_long arg3, abi_long arg4, abi_long arg5)
> +{
> +    const char *rlim_name;
> +
> +    print_syscall_prologue(name);
> +    print_raw_param("%d", arg0, 0);
> +    rlim_name = target_ressource_string(arg1);
> +    if (rlim_name) {
> +        qemu_log("%s,", rlim_name);
> +    } else {
> +        print_raw_param("%d", arg1, 0);
> +    }
> +    print_rlimit64(arg2, 0);
> +    print_pointer(arg3, 1);
> +    print_syscall_epilogue(name);
> +}
> +
> +static void
> +print_syscall_ret_prlimit64(CPUArchState *cpu_env,
> +                       const struct syscallname *name,
> +                       abi_long ret, abi_long arg0, abi_long arg1,
> +                       abi_long arg2, abi_long arg3, abi_long arg4,
> +                       abi_long arg5)
> +{
> +    if (!print_syscall_err(ret)) {
> +        qemu_log(TARGET_ABI_FMT_ld, ret);
> +        if (arg3) {
> +            qemu_log(" (");
> +            print_rlimit64(arg3, 1);
> +            qemu_log(")");
> +        }
> +    }
> +    qemu_log("\n");
> +}
> +#endif
> +
>   #ifdef TARGET_NR_kill
>   static void
>   print_kill(CPUArchState *cpu_env, const struct syscallname *name,
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index ac8f872371..f9254725a1 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -1067,7 +1067,8 @@
>   { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_prlimit64
> -{ TARGET_NR_prlimit64, "prlimit64" , NULL, NULL, NULL },
> +{ TARGET_NR_prlimit64, "prlimit64" , NULL, print_prlimit64,
> +                    print_syscall_ret_prlimit64 },
>   #endif
>   #ifdef TARGET_NR_process_vm_readv
>   { TARGET_NR_process_vm_readv, "process_vm_readv" , NULL, NULL, NULL },
> --
> 2.38.1
> 
> 

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


