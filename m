Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59093A4E32
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 12:32:36 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls0wN-0002vS-7H
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 06:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ls0te-0001vx-Ps
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 06:29:46 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ls0tb-00073S-Ui
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 06:29:46 -0400
Received: from [192.168.100.1] ([82.142.6.178]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUY9w-1ljJkR1sZM-00QRkr; Sat, 12 Jun 2021 12:29:39 +0200
Subject: Re: [PATCH] linux-user: Set CF_PARALLEL when mapping shared memory
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210612060828.695332-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c2016ff3-8ed8-5e9c-eaa5-6c467d9ebf03@vivier.eu>
Date: Sat, 12 Jun 2021 12:29:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210612060828.695332-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UbM7qY/9X6HgSBUXigpx2ihcmUSsAiNoZQ1XPxwZOrEfepJJBvh
 CreppHBNZhKj03ibKTnnehg5B3wCe3lK9Z95XDAeaROk+TSTRTgP5K4SkvkrwLCDP5zzmix
 fVeRZ5nmNQTM69DGn/YKdp+qS2zku+yjYSDlbBhKPd8R2BdCqyZ7GR05gNyxLhFjnjoG9As
 IdNN15jyGVmJBDG4qGCmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nYq2iIF1yXc=:5XVEuCW/4by/raaE/Vlivu
 5hRUfXhlRYHk2CTEpddIJhQiGp08SfP4EED5wXuvgiJrVYPqJdNxhbpfwN6SE5xhsgESYWhnc
 u+7U9kejG95xVfkawDD4vwWQTAmBDgaW+9G3IVvXfNVvWlCIWOpu7fCV/Dc3hQC8hyqFZDGzz
 lCWUpHblx4LFYgZRRpzQWgRGCVqif7GV8yosOzcXP988+3nwxNpT5XfKUs71GJBVqpKKgokO1
 wEClcW199lJjSzXYsWP+Kwvli/bFHhvtvgRhdx0GApcER1JMenSeInrB/+OaVo1Zv6V0ry6po
 avYPLkxJkth+KbpRT9kICQ5NCLsJ+B/EQjm/HaIdp4gYqZpL1DSfJcA6rK5tFfYOUW0MpKpCu
 bXlXd3vHb6sydmLWuaU5snzkX2L+hE+5MJoxVNawkHe+wGV61ygRkn5jGtqj0UnPfR/H+1u8u
 V3udUTwYQwBQdd9VkjCRWZctSRhLaIp2L8DwjVWzezUdXoWXnjv+YaYo+a8/kaEBKQKMU3sAF
 O6czdRjrrRu9iDXzEReWMM=
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

Le 12/06/2021 à 08:08, Richard Henderson a écrit :
> Signal the translator to use host atomic instructions for
> guest operations, insofar as it is possible.  This is the
> best we can do to allow the guest to interact atomically
> with other processes.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/121
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mmap.c    | 14 ++++++++++++++
>  linux-user/syscall.c | 12 ++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 7e3b245036..0e103859fe 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -451,6 +451,20 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
>          goto fail;
>      }
>  
> +    /*
> +     * If we're mapping shared memory, ensure we generate code for parallel
> +     * execution and flush old translations.  This will work up to the level
> +     * supported by the host -- anything that requires EXCP_ATOMIC will not
> +     * be atomic with respect to an external process.
> +     */
> +    if (flags & MAP_SHARED) {
> +        CPUState *cpu = thread_cpu;
> +        if (!(cpu->tcg_cflags & CF_PARALLEL)) {
> +            cpu->tcg_cflags |= CF_PARALLEL;
> +            tb_flush(cpu);
> +        }
> +    }
> +
>      real_start = start & qemu_host_page_mask;
>      host_offset = offset & qemu_host_page_mask;
>  
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 974dd46c9a..54037db8d6 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4603,6 +4603,7 @@ static inline abi_ulong target_shmlba(CPUArchState *cpu_env)
>  static inline abi_ulong do_shmat(CPUArchState *cpu_env,
>                                   int shmid, abi_ulong shmaddr, int shmflg)
>  {
> +    CPUState *cpu = env_cpu(cpu_env);
>      abi_long raddr;
>      void *host_raddr;
>      struct shmid_ds shm_info;
> @@ -4633,6 +4634,17 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
>  
>      mmap_lock();
>  
> +    /*
> +     * We're mapping shared memory, so ensure we generate code for parallel
> +     * execution and flush old translations.  This will work up to the level
> +     * supported by the host -- anything that requires EXCP_ATOMIC will not
> +     * be atomic with respect to an external process.
> +     */
> +    if (!(cpu->tcg_cflags & CF_PARALLEL)) {
> +        cpu->tcg_cflags |= CF_PARALLEL;
> +        tb_flush(cpu);
> +    }
> +
>      if (shmaddr)
>          host_raddr = shmat(shmid, (void *)g2h_untagged(shmaddr), shmflg);
>      else {
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


