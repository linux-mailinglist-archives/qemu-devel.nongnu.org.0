Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7E6AE672
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:27:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaAB-0006OS-UY; Tue, 07 Mar 2023 11:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZa9r-0006NS-Mj
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:27:24 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZa9m-0000Bk-CU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:27:21 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M3UlW-1pZ2By15zm-000YDO; Tue, 07 Mar 2023 17:27:16 +0100
Message-ID: <9aac502f-dcce-36d7-ebb4-6ad9e0fc38ae@vivier.eu>
Date: Tue, 7 Mar 2023 17:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] linux-user: Emulate CLONE_PIDFD flag in clone()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <Y4XoJCpvUA1JD7Sj@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y4XoJCpvUA1JD7Sj@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1m8MQGmxybHI/qpJAmDFzV3qAHjlS8FfSKeWz9Ky/8/xEr7T/tY
 P6LlM4FHvUBP4WX/8NVYSt6uD5jcuzluMPZf+OQnrJvQLdweKT+Nkg0HhDUBEk8affFUPVc
 d+qlBQ8vbJBDXuW6Lcz1vgSL5W80wT4OtGoiwwoPPU3njJwiEaqWuczWf95JzlRXKU1mP68
 QG6bgZjKz8fuS0TTPXjSw==
UI-OutboundReport: notjunk:1;M01:P0:g5W2p6wcsZs=;jTnaOF99nJ4zK7oEFcCYrLCLxax
 yatq9sAZKc6j+tvw+jPBQ5lsG5jpb0YMstQQzqH3NkzsfM/oWXs+mfq4+Z1mw9n5qvOgBb2EG
 uQWR2GkEU38jrzXH0t+QevbRnvZH3WOzsV/ntfXfMERGjJIIRMb05dB8f531P8csbRoFo+F3V
 7FUenuCRNJRrviIYrBxrzXSVKsJtdnPS+gR9TZdDfqfhFkXqTShQ5A8KE+DXm+HFtXfQA8Qi0
 CEqF+d2T4OnFP3LGoFsQBqyp8WseHo0yjn6xLEQ+neeWsQIwoYgZCS87tDOJ+uMiuCgFG23Iw
 aWFTutGCfVNJ2e8cK4Tvj13I404KHUIUt+otzGx6ZHf+gdn/MzWR1fiPRbT1gj0lRRzLdiw1k
 d8qW/N1V6MDM61weEiDftc3lfGbpBDeoHqXAXdlL6/2JHXxv39/uReAsgmHc0EiaDhYkfZHbn
 b3yKYK8okrf9taArsyzFbt6X++qZe4OUssZwH4HLbvDxD2z5beOFc++nV8fNvb374R1CAUzOJ
 kPGgu9a6+E1lUbNvxY6GJmr/8NrJmrdATCTgl1fjBv61yhIn/GC1ecAuRTvjHCi/0+xDSiVVM
 MGLDHSQrsrljw3WSJ/RlOq2PX7LFUAac1/tWW7P7GR8IKKLHqK62/igLOWC2Xp0RR7/TjzOFq
 890iGMekjkT0D6I8l8/43qSbm849l0oXLEit/gu6AQ==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 29/11/2022 à 12:08, Helge Deller a écrit :
> Add emulation for the CLONE_PIDFD flag of the clone() syscall.
> This flag was added in Linux kernel 5.2.
> 
> Successfully tested on a x86-64 Linux host with hppa-linux target.
> Can be verified by running the testsuite of the qcoro debian package,
> which breaks hard and kills the currently logged-in user without this
> patch.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 9ae5a812cd..8fa5c1ec3d 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1097,6 +1097,7 @@ UNUSED static struct flags clone_flags[] = {
>       FLAG_GENERIC(CLONE_FS),
>       FLAG_GENERIC(CLONE_FILES),
>       FLAG_GENERIC(CLONE_SIGHAND),
> +    FLAG_GENERIC(CLONE_PIDFD),
>       FLAG_GENERIC(CLONE_PTRACE),
>       FLAG_GENERIC(CLONE_VFORK),
>       FLAG_GENERIC(CLONE_PARENT),
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 24b25759be..0468a1bad7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -213,7 +213,7 @@ struct file_clone_range {
> 
>   /* Flags for fork which we can implement within QEMU itself */
>   #define CLONE_OPTIONAL_FORK_FLAGS               \
> -    (CLONE_SETTLS | CLONE_PARENT_SETTID |       \
> +    (CLONE_SETTLS | CLONE_PARENT_SETTID | CLONE_PIDFD | \
>        CLONE_CHILD_CLEARTID | CLONE_CHILD_SETTID)
> 
>   /* Flags for thread creation which we can implement within QEMU itself */
> @@ -6747,6 +6747,17 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
>               return -TARGET_EINVAL;
>           }
> 
> +#if !defined(__NR_pidfd_open) || !defined(TARGET_NR_pidfd_open)
> +        if (flags & CLONE_PIDFD) {
> +            return -TARGET_EINVAL;
> +        }
> +#endif
> +
> +        /* Can not allow CLONE_PIDFD with CLONE_PARENT_SETTID */
> +        if ((flags & CLONE_PIDFD) && (flags & CLONE_PARENT_SETTID)) {
> +            return -TARGET_EINVAL;
> +        }
> +
>           if (block_signals()) {
>               return -QEMU_ERESTARTSYS;
>           }
> @@ -6774,6 +6785,20 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
>                   ts->child_tidptr = child_tidptr;
>           } else {
>               cpu_clone_regs_parent(env, flags);
> +            if (flags & CLONE_PIDFD) {
> +                int pid_fd = 0;
> +#if defined(__NR_pidfd_open) && defined(TARGET_NR_pidfd_open)
> +                int pid_child = ret;
> +                pid_fd = pidfd_open(pid_child, 0);
> +                if (pid_fd >= 0) {
> +                        fcntl(pid_fd, F_SETFD, fcntl(pid_fd, F_GETFL)
> +                                               | FD_CLOEXEC);
> +                } else {
> +                        pid_fd = 0;
> +                }
> +#endif
> +                put_user_u32(pid_fd, parent_tidptr);
> +                }
>               fork_end(0);
>           }
>       }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

