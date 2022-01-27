Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5949E473
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:19:22 +0100 (CET)
Received: from localhost ([::1]:43754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5cP-00043t-79
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nD5Tq-00022t-3u; Thu, 27 Jan 2022 09:10:30 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nD5TW-0001Ru-7o; Thu, 27 Jan 2022 09:10:25 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mate1-1mfgKa2wiB-00cUBQ; Thu, 27 Jan 2022 15:09:59 +0100
Message-ID: <9594cc96-efba-37b9-97f3-d79ee7379d44@vivier.eu>
Date: Thu, 27 Jan 2022 15:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user/alpha: Fix target rlimits for alpha and
 rearrange for clarity
Content-Language: fr
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>, qemu-devel@nongnu.org
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87y236lpwb.fsf@depni.sinp.msu.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DGLlM0IquQMamdkMx63v4gn2Bc+xmKT5rCOh5r0KZBpGJ8s0Cho
 Y97FbPJB6Qx/wkZ9bekFpz5ld4lLDmH3ymYJyo2KWvb6w0JhlhwNSwqubXfmww/0U3JPY32
 YfD9H97PKuzbL/x1PWC7Z1q7lXDthtqtOv+HVlkebxwgXcZJ+Bvw3GezpI/4kcSeEw09htL
 +Bq6ptrYukQit1aNDMJFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YRKMsUDnsfM=:bvucubHs6oFfFeh6/RtVfM
 GASv+lMrFIKSkJ1rELpe+iOdtacdpRUeZBt3W+6zE3g/Z7bpL6ZOc1A6AX2yzGX0HHaJAwq0c
 ZKBobo8UJLCErpIidO97rSl2NB0NGekpG8Pxso/HTnfIM4w1N7TSYFMHjfGSils1fDhd6zEg5
 n0R/eelG82ofzmtFJHDXBSqvq2ok76R6ewBXGLcr62ZsYBD3M9BNTxLns1GwiRREugg4dXRVP
 v46XTTzvmEE5FC404ic5Z6ZUt7OHVfxMFTDV+pd+7JrGLZQsFIpHTjBJbKacEgYu6VE3yahta
 TKGYE1NKfQvb0uOPGufr30Tpc2uzgzolRfhF5u9P7DZXjOdslnZCfHCjLVSOsz4/GHqfPg/5K
 OtPmXVRB8a9ZnnuK0AY3CtYvFNiI/Vap19xHw38qnDW5n4zVV2s/YsAO/SYtuGEESqVk6aBAx
 J9e6qaaluhw+Bk/LCuBxztLsZbU7XKUaNRvwmBs8qMDYkGgQE3Wb6a5l2gKDc4C0m/BWUlsyQ
 YCpDa19aLVsDzH7oqO4VkACc4AOQd8Xge2G1YlpuKUwKa46AfOIdEOc0+0DXMJrqDkP6KkDW9
 Ke0Mbo1d7hG6vIJChLQmDJ5u5+04gvdbEISU3dgh3AKaQm1QChRBhdCfn+06K9yvvjnmhTtu2
 D2qWA2iJc+dr0R4FPKya0Cbk5n2iagFTtaZAFmgvFSDDQzyXvZkGJb1J2qj59gt26GVI=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/01/2022 à 12:32, Serge Belyshev a écrit :
> Alpha uses different values of some TARGET_RLIMIT_* constants, which were
> missing and caused bugs like #577, fixed thus.  Also rearranged all three
> (alpha, mips and sparc) that differ from everyone else for clarity.
> 
> Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/577
> ---
>   linux-user/syscall_defs.h | 31 ++++++++++++++-----------------
>   1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index f23f0a2178..3fcabaeae3 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -730,44 +730,41 @@ struct target_rlimit {
>   #define TARGET_RLIM_INFINITY	((abi_ulong)-1)
>   #endif
>   
> -#if defined(TARGET_MIPS)
>   #define TARGET_RLIMIT_CPU		0
>   #define TARGET_RLIMIT_FSIZE		1
>   #define TARGET_RLIMIT_DATA		2
>   #define TARGET_RLIMIT_STACK		3
>   #define TARGET_RLIMIT_CORE		4
> +#if defined(TARGET_MIPS)
> +#define TARGET_RLIMIT_NOFILE		5
> +#define TARGET_RLIMIT_AS		6
>   #define TARGET_RLIMIT_RSS		7
>   #define TARGET_RLIMIT_NPROC		8
> -#define TARGET_RLIMIT_NOFILE		5
>   #define TARGET_RLIMIT_MEMLOCK		9
> -#define TARGET_RLIMIT_AS		6
> -#define TARGET_RLIMIT_LOCKS		10
> -#define TARGET_RLIMIT_SIGPENDING	11
> -#define TARGET_RLIMIT_MSGQUEUE		12
> -#define TARGET_RLIMIT_NICE		13
> -#define TARGET_RLIMIT_RTPRIO		14
> -#else
> -#define TARGET_RLIMIT_CPU		0
> -#define TARGET_RLIMIT_FSIZE		1
> -#define TARGET_RLIMIT_DATA		2
> -#define TARGET_RLIMIT_STACK		3
> -#define TARGET_RLIMIT_CORE		4
> +#elif defined(TARGET_ALPHA)
> +#define TARGET_RLIMIT_RSS		5
> +#define TARGET_RLIMIT_NOFILE		6
> +#define TARGET_RLIMIT_AS		7
> +#define TARGET_RLIMIT_NPROC		8
> +#define TARGET_RLIMIT_MEMLOCK		9
> +#elif defined(TARGET_SPARC)
>   #define TARGET_RLIMIT_RSS		5
> -#if defined(TARGET_SPARC)
>   #define TARGET_RLIMIT_NOFILE		6
>   #define TARGET_RLIMIT_NPROC		7
> +#define TARGET_RLIMIT_MEMLOCK		8
> +#define TARGET_RLIMIT_AS		9
>   #else
> +#define TARGET_RLIMIT_RSS		5
>   #define TARGET_RLIMIT_NPROC		6
>   #define TARGET_RLIMIT_NOFILE		7
> -#endif
>   #define TARGET_RLIMIT_MEMLOCK		8
>   #define TARGET_RLIMIT_AS		9
> +#endif
>   #define TARGET_RLIMIT_LOCKS		10
>   #define TARGET_RLIMIT_SIGPENDING	11
>   #define TARGET_RLIMIT_MSGQUEUE		12
>   #define TARGET_RLIMIT_NICE		13
>   #define TARGET_RLIMIT_RTPRIO		14
> -#endif
>   
>   struct target_pollfd {
>       int fd;           /* file descriptor */

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

