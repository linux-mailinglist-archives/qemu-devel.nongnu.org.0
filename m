Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8EE2512E3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 09:19:07 +0200 (CEST)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kATEY-0002JA-MI
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 03:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kATDj-0001Se-Rt
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 03:18:15 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kATDh-0000IK-Sa
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 03:18:15 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKbTo-1ju2Ig3HTQ-00Kw3p; Tue, 25 Aug 2020 09:18:11 +0200
Subject: Re: [PATCH v2 2/2] linux-user: Add support for utimensat_time64() and
 semtimedop_time64()
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200824223050.92032-1-Filip.Bozuta@syrmia.com>
 <20200824223050.92032-3-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a5e54c27-a604-2b6a-6099-f4045eb2825c@vivier.eu>
Date: Tue, 25 Aug 2020 09:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824223050.92032-3-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:St5HC8ZvG8z92GqHzSBGxe4nupSjeT4T9NryfAUgyyuF/0vDu8o
 Qa//i9QiaZW1k5pqABNt7MEbDSAhUo9lwNpUI8w/CduIUUEKugmU54V0aUBLaEs5D2XFWwk
 xg5bONQAE6TWhbKLlv2h/3F/++Sf01HKMUCnI6ko6Z2RiPF1KBQQG9ddhsAZuGtHyKDCge0
 7p9bbkmnw9VwGWz73dViw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7awlzvlNKMo=:J4ioD+tjsft39vFActousA
 P1hcVofSWDAiuywhqpZAAtVxdDcHmaam3H1QUgTZzc47E3Rot6NZz20dyrj8Wi5J9D2RYBUMG
 MR1anUBdHy5PYfzI+DbRhaO968ztc1XhyqPjbi2o4n0qiO0WLgIKLzDGkK8wv0iN5li6xFaEW
 BOaBonI52wRMFjASlckoRbbQAuNmnSkmt+aaRHSBiiAcvnRvBcPbGUs1FI1B5w7CHH6CvUGVa
 xo/acaGrQYM6hQHua1Vydmb/3z6cEqR8uWMPxz5LVhmSdZLsR46ZwOKbo9hACZxESRbQxYD2m
 nj1ZydwfRYklOQUbj32PQ0HZkSp+Qz/6o0iwUIAo1FCgXwnfGFp/oZAiVpkvpJUUaqMkQfPcV
 DpqRatpu5KL/FwQiam7UD77Yahgd1nlTrivdJyaw/m7LrBaZgtjSwPoXvwpaJxf0qHmbj+G4U
 tyh01oZjByrJBzgY8OuN3+fpMMZmbWpwNDCDGQYn8eL/FbEU6UoM3nnuTwVbJvC8F1+kzHH22
 LtvVf5r3euEU8gbuy/VMNN4QaVtRUhky9RKQDPcWfth8usjriF7C71YeE0jvGeEMbG4d6T6NO
 icKYrEl2tgIlqaSHc+lnvtxTJrFaFlPyl0Rh8+uuG1cbS8E75XZjo58FtGHi4yY1n2pJeKMA+
 K/HHSoF9NO8I/mSIdRvmsbOzSOx/I/CcKFvKmNKyiMbLJ6NsmUF1aVylnXIPWts7Ct9y7BHxQ
 +I/c+ChBhrZX45jUBJumJNOgWUAe8SVlLvinSbqpXKZ3LrJQuPQHUi5U4UjmloherJrHtkVjF
 zs0LZZTYzzgEZy1mizzKiNpn/Lz/DkQsgoSI8wqovcs6DugQpDsXZP3wzDoQD1OJBZNtefY
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 03:18:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 25/08/2020 à 00:30, Filip Bozuta a écrit :
> This patch introduces functionality for following time64 syscalls:
> 
> *utimensat_time64()
> 
>     int utimensat(int dirfd, const char *pathname,
>                   const struct timespec times[2], int flags);
>     -- change file timestamps with nanosecond precision --
>     man page: https://man7.org/linux/man-pages/man2/utimensat.2.html
> 
> *semtimedop_time64()
> 
>     int semtimedop(int semid, struct sembuf *sops, size_t nsops,
>                    const struct timespec *timeout);
>     -- System V semaphore operations --
>     man page: https://www.man7.org/linux/man-pages/man2/semtimedop.2.html
> 
> Implementation notes:
> 
>    Syscall 'utimensat_time64()' is implemented in similar way as its
>    regular variants only difference being that time64 converting function
>    is used to convert values of 'struct timespec' between host and target
>    ('target_to_host_timespec64()').
> 
>    For syscall 'semtimedop_time64()' and additional argument is added
>    in function 'do_semtimedop()' through which the aproppriate 'struct timespec'
>    converting function is called (false for regular target_to_host_timespec()
>    and true for target_to_host_timespec64()). For 'do_ipc()' a
>    check was added as that additional argument: 'TARGET_ABI_BITS == 64'.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/syscall.c | 60 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index fc6a6e32e4..4d460af744 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1253,7 +1253,8 @@ static inline abi_long target_to_host_timespec(struct timespec *host_ts,
>  #endif
>  
>  #if defined(TARGET_NR_clock_settime64) || defined(TARGET_NR_futex_time64) || \
> -    defined(TARGET_NR_pselect6_time64) || defined(TARGET_NR_ppoll_time64)
> +    defined(TARGET_NR_pselect6_time64) || defined(TARGET_NR_ppoll_time64) || \
> +    defined(TARGET_NR_utimensat_time64) || defined(TARGET_NR_semtimedop_time64)
>  static inline abi_long target_to_host_timespec64(struct timespec *host_ts,
>                                                   abi_ulong target_addr)
>  {
> @@ -4117,7 +4118,7 @@ static inline abi_long target_to_host_sembuf(struct sembuf *host_sembuf,
>  }
>  
>  #if defined(TARGET_NR_ipc) || defined(TARGET_NR_semop) || \
> -    defined(TARGET_NR_semtimedop)
> +    defined(TARGET_NR_semtimedop) || defined(TARGET_NR_semtimedop_time64)
>  
>  /*
>   * This macro is required to handle the s390 variants, which passes the
> @@ -4134,7 +4135,7 @@ static inline abi_long target_to_host_sembuf(struct sembuf *host_sembuf,
>  static inline abi_long do_semtimedop(int semid,
>                                       abi_long ptr,
>                                       unsigned nsops,
> -                                     abi_long timeout)
> +                                     abi_long timeout, bool time64)
>  {
>      struct sembuf sops[nsops];
>      struct timespec ts, *pts = NULL;
> @@ -4142,8 +4143,14 @@ static inline abi_long do_semtimedop(int semid,
>  
>      if (timeout) {
>          pts = &ts;
> -        if (target_to_host_timespec(pts, timeout)) {
> -            return -TARGET_EFAULT;
> +        if (time64) {
> +            if (target_to_host_timespec64(pts, timeout)) {
> +                return -TARGET_EFAULT;
> +            }
> +        } else {
> +            if (target_to_host_timespec(pts, timeout)) {
> +                return -TARGET_EFAULT;
> +            }
>          }
>      }
>  
> @@ -4657,7 +4664,7 @@ static abi_long do_ipc(CPUArchState *cpu_env,
>  
>      switch (call) {
>      case IPCOP_semop:
> -        ret = do_semtimedop(first, ptr, second, 0);
> +        ret = do_semtimedop(first, ptr, second, 0, false);
>          break;
>      case IPCOP_semtimedop:
>      /*
> @@ -4667,9 +4674,9 @@ static abi_long do_ipc(CPUArchState *cpu_env,
>       * to a struct timespec where the generic variant uses fifth parameter.
>       */
>  #if defined(TARGET_S390X)
> -        ret = do_semtimedop(first, ptr, second, third);
> +        ret = do_semtimedop(first, ptr, second, third, TARGET_ABI_BITS == 64);
>  #else
> -        ret = do_semtimedop(first, ptr, second, fifth);
> +        ret = do_semtimedop(first, ptr, second, fifth, TARGET_ABI_BITS == 64);
>  #endif
>          break;
>  
> @@ -9887,11 +9894,15 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>  #endif
>  #ifdef TARGET_NR_semop
>      case TARGET_NR_semop:
> -        return do_semtimedop(arg1, arg2, arg3, 0);
> +        return do_semtimedop(arg1, arg2, arg3, 0, false);
>  #endif
>  #ifdef TARGET_NR_semtimedop
>      case TARGET_NR_semtimedop:
> -        return do_semtimedop(arg1, arg2, arg3, arg4);
> +        return do_semtimedop(arg1, arg2, arg3, arg4, false);
> +#endif
> +#ifdef TARGET_NR_semtimedop_time64
> +    case TARGET_NR_semtimedop_time64:
> +        return do_semtimedop(arg1, arg2, arg3, arg4, true);
>  #endif
>  #ifdef TARGET_NR_semctl
>      case TARGET_NR_semctl:
> @@ -11938,6 +11949,35 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          }
>          return ret;
>  #endif
> +#ifdef TARGET_NR_utimensat_time64
> +    case TARGET_NR_utimensat_time64:
> +        {
> +            struct timespec *tsp, ts[2];
> +            if (!arg3) {
> +                tsp = NULL;
> +            } else {
> +                if (target_to_host_timespec64(ts, arg3)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                if (target_to_host_timespec64(ts + 1, arg3 +
> +                                     sizeof(struct target__kernel_timespec))) {
> +                    return -TARGET_EFAULT;
> +                }
> +                tsp = ts;
> +            }
> +            if (!arg2)
> +                ret = get_errno(sys_utimensat(arg1, NULL, tsp, arg4));
> +            else {
> +                p = lock_user_string(arg2);
> +                if (!p) {
> +                    return -TARGET_EFAULT;
> +                }
> +                ret = get_errno(sys_utimensat(arg1, path(p), tsp, arg4));
> +                unlock_user(p, arg2, 0);
> +            }
> +        }
> +        return ret;
> +#endif
>  #ifdef TARGET_NR_futex
>      case TARGET_NR_futex:
>          return do_futex(arg1, arg2, arg3, arg4, arg5, arg6);
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


