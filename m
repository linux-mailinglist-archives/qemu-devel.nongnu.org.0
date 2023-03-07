Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DA86AE6A8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaER-0003Aw-DH; Tue, 07 Mar 2023 11:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZaEP-0003AY-PJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:32:05 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZaEN-0001PC-Uf
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:32:05 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MmlfS-1qG1nY0EII-00jrVh; Tue, 07 Mar 2023 17:32:02 +0100
Message-ID: <2dc179a5-f9ab-fe7d-3170-c7adfbe841ce@vivier.eu>
Date: Tue, 7 Mar 2023 17:32:01 +0100
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
X-Provags-ID: V03:K1:MK1nZGNVvuS8FCxOp79ehl0FnJVtbXBafBWKkF//7vsVZrylsTB
 yvMX2AsPGv1OC64Q5iJ6YCyQ+tyTVU98j3yeAWDxwX6Sr/U4S0jB5WG7p8ZiVlDhbRSNVvr
 3oo8rAQOMUQwz52DkhzOHk7qEFi+HMkGntmzmxMiTWF6NAQwfld9ciEqr+t6viouu2axds6
 HcnfidxkihgZQDttoOvCw==
UI-OutboundReport: notjunk:1;M01:P0:K2nJIS4qgJk=;spvC1GyCq/XkMOgbyDcSW+aEzph
 5Hr07hLx5a9t8OvodlmwxIs2hdFKtVYBM2UOqAkAdQ/t2K+k3nelAfxooDdX42AnMYQ8RA8ps
 JW7J2Y9fS8V0zbzwp/t3DKRSiRQo7E7SugQxkI5LoC35bH2d3ILeZzRXQlMy9QfhHmxjgc9yc
 chke8dgXsMVWN79cIN2wRVxUQhKeT5s5adgEbshEE6c7CbogQlaq9TkvdL1QwOVF9XGA/IRIM
 vg4MqMN92igAnzORAm4+sL/G7s/hS9SkG7SvJFdSm2XCz6kxmty2OCEDJCdHKETKTheRuqmZy
 RJqrDH5Gmz9joJUWpCBQXHosxn64PnYSQexTRS8hsmGR0L8lqPrcZdCoJTBGZMXVgRgEPbIoX
 1JKk9tCYzEv9XUTWpq0Z9b6q354q+im8shmBZ7DrKgpKX04PwejK9WOr18m0bqZAAFr2KJLWu
 ajypXi4C5nTazerFVNXZV5hycWIItxKTvUGRTxu6oByJkMURdOrfK49Lsi8WZ5YcLe6TtknEx
 smRlLNhhYJTNu6NLZLmlgiGw9TkhGKwYASLSHC1ao+te/YtwcO1RRcqDa52Id1N06vQ2MI6KA
 FYsDki0mO/8YCNo1gF1rV9GrOBb9HDIyYgYznXfbWO/ZUui3yQyz6yElGCOVI4HikZCp0aOOA
 7+RR1i1HbVP0T3pYLXGIpWob+zHzxK7bs8r0eYbxRA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


