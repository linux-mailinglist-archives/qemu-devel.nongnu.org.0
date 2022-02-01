Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52F4A586A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:23:45 +0100 (CET)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEoS0-0000F7-FG
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nEnBB-00021f-Q2; Tue, 01 Feb 2022 02:02:17 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:56781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nEnB9-0002Di-DN; Tue, 01 Feb 2022 02:02:17 -0500
Received: from [192.168.100.1] ([82.142.10.94]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKbTo-1mw1JB0Nzg-00Kyxy; Tue, 01 Feb 2022 08:02:13 +0100
Message-ID: <bf2f08b6-d6b2-3080-f031-b3cec85b64cd@vivier.eu>
Date: Tue, 1 Feb 2022 08:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] linux-user: Move generic TARGET_RLIMIT* definitions to
 generic/target_resource.h
Content-Language: fr
To: Serge Belyshev <belyshev@depni.sinp.msu.ru>
References: <87y236lpwb.fsf@depni.sinp.msu.ru>
 <4e110850-a303-d0a4-158b-6186367aa739@vivier.eu>
 <87ilu2l473.fsf@depni.sinp.msu.ru> <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87ee4ql3yk.fsf_-_@depni.sinp.msu.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EqkOwcb4cGs03HmCoJ+mng2mqKTHI5zG2ucpXUXvqwvuf5+877Z
 slo57m8RpdsRXvfmbcSs3PxunMJwBpb1bVFqueTxbolkYcnfFtkz8Ujln8CR3PtoRs+EiIN
 h+cThpAKfkOhc5HliY5uk0FgctxfXR/nipOST0b3+3F0E22cm5xkkOsb8S4jzuIF6fWYlav
 EJI8rHjLHSElskK9taR6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dNOLixC2iZM=:jB7s3U1o92/9ch+52e0hn8
 j4Oe4/LbeLf7450romwPbUS+pBlUQvQ9wzqRgg6pYlitvdyz1A0C62ie1JGgrfipj+PwkL3Vd
 6JsnFpRNUkhMRVc0y9YGUvcMh8pHnPDmmzozGFvUBdMNu9oM5oBFXqe49bz3t5xkMIyCQ+BUz
 Fn1iJe5gXLu8HLdY7FIwL7XCV217A5xXcZ3wu4pAd4mneLOTNrJuk1TluJNeoSng4DOOJaNXK
 r3ZsNgzxCEtWeqtNLnSOUAqw8vRKTjTYzjMcHhdd9TIc6Mmc+LCjUDiGpCfuruA7J2hcuO7/C
 hS0E1W8KO2BRH4jFgPIXmrbMJkqL6kaD0jVYn3X76Z2CWa/r+eJyRKXzxLDBz2ujSBS5HluLs
 cYAtqocF0iPoDsgmoK/b/Sd6bUWbRSmOs4SyWhqkguRXBp4Z3EEgqn3sZnB63Db85iMYkh+H6
 plA6CSPQ+751cZc4AL8znpFRYd7/6ylmngbbiCUbI56UCDZMvpPZtwlyElUtHE9YZpXzxxrz2
 mSZmIZOp+CDY1zyLJsqswd3p0CcbqJJQ+vbL7Ud+x/5wdccNro7HbUHRab/ZgYXOtdYFl73lS
 OOq5TzjPAX2mcdyt4HC+qjfCnjyo6bLZATj29XewEw+uCHhzn8si3ErhJkMBW9pKt6LNenSKE
 BzhfNoay1dZVMHATX+v0GEa3nCg/u+gwvu6BS6EIMKwNZBCF6drX81STc/VPu4gNqAio=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/01/2022 à 20:46, Serge Belyshev a écrit :
> 
> Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
> ---
> Compile tested, and also verified that target definitions did not change.
> 
>   linux-user/aarch64/target_resource.h    |  1 +
>   linux-user/alpha/target_resource.h      | 21 ++++++++++
>   linux-user/arm/target_resource.h        |  1 +
>   linux-user/cris/target_resource.h       |  1 +
>   linux-user/generic/target_resource.h    | 37 +++++++++++++++++
>   linux-user/hexagon/target_resource.h    |  1 +
>   linux-user/hppa/target_resource.h       |  1 +
>   linux-user/i386/target_resource.h       |  1 +
>   linux-user/m68k/target_resource.h       |  1 +
>   linux-user/microblaze/target_resource.h |  1 +
>   linux-user/mips/target_resource.h       | 24 +++++++++++
>   linux-user/mips64/target_resource.h     |  1 +
>   linux-user/nios2/target_resource.h      |  1 +
>   linux-user/openrisc/target_resource.h   |  1 +
>   linux-user/ppc/target_resource.h        |  1 +
>   linux-user/riscv/target_resource.h      |  1 +
>   linux-user/s390x/target_resource.h      |  1 +
>   linux-user/sh4/target_resource.h        |  1 +
>   linux-user/sparc/target_resource.h      | 17 ++++++++
>   linux-user/syscall_defs.h               | 53 +------------------------
>   linux-user/x86_64/target_resource.h     |  1 +
>   linux-user/xtensa/target_resource.h     |  1 +
>   22 files changed, 117 insertions(+), 52 deletions(-)
>   create mode 100644 linux-user/aarch64/target_resource.h
>   create mode 100644 linux-user/alpha/target_resource.h
>   create mode 100644 linux-user/arm/target_resource.h
>   create mode 100644 linux-user/cris/target_resource.h
>   create mode 100644 linux-user/generic/target_resource.h
>   create mode 100644 linux-user/hexagon/target_resource.h
>   create mode 100644 linux-user/hppa/target_resource.h
>   create mode 100644 linux-user/i386/target_resource.h
>   create mode 100644 linux-user/m68k/target_resource.h
>   create mode 100644 linux-user/microblaze/target_resource.h
>   create mode 100644 linux-user/mips/target_resource.h
>   create mode 100644 linux-user/mips64/target_resource.h
>   create mode 100644 linux-user/nios2/target_resource.h
>   create mode 100644 linux-user/openrisc/target_resource.h
>   create mode 100644 linux-user/ppc/target_resource.h
>   create mode 100644 linux-user/riscv/target_resource.h
>   create mode 100644 linux-user/s390x/target_resource.h
>   create mode 100644 linux-user/sh4/target_resource.h
>   create mode 100644 linux-user/sparc/target_resource.h
>   create mode 100644 linux-user/x86_64/target_resource.h
>   create mode 100644 linux-user/xtensa/target_resource.h
> 
> diff --git a/linux-user/aarch64/target_resource.h b/linux-user/aarch64/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/aarch64/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/alpha/target_resource.h b/linux-user/alpha/target_resource.h
> new file mode 100644
> index 0000000000..c9b082faee
> --- /dev/null
> +++ b/linux-user/alpha/target_resource.h
> @@ -0,0 +1,21 @@
> +#ifndef ALPHA_TARGET_RESOURCE_H
> +#define ALPHA_TARGET_RESOURCE_H
> +
> +#include "../generic/target_resource.h"
> +
> +#undef TARGET_RLIM_INFINITY
> +#define TARGET_RLIM_INFINITY    0x7fffffffffffffffull
> +
> +#undef TARGET_RLIMIT_NOFILE
> +#define TARGET_RLIMIT_NOFILE    6
> +
> +#undef TARGET_RLIMIT_AS
> +#define TARGET_RLIMIT_AS        7
> +
> +#undef TARGET_RLIMIT_NPROC
> +#define TARGET_RLIMIT_NPROC     8
> +
> +#undef TARGET_RLIMIT_MEMLOCK
> +#define TARGET_RLIMIT_MEMLOCK   9
> +
> +#endif
> diff --git a/linux-user/arm/target_resource.h b/linux-user/arm/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/arm/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/cris/target_resource.h b/linux-user/cris/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/cris/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
> new file mode 100644
> index 0000000000..f04c93b125
> --- /dev/null
> +++ b/linux-user/generic/target_resource.h
> @@ -0,0 +1,37 @@
> +/*
> + * Target definitions of RLIMIT_* constants. These may be overridden by an
> + * architecture specific header if needed.
> + */
> +
> +#ifndef GENERIC_TARGET_RESOURCE_H
> +#define GENERIC_TARGET_RESOURCE_H
> +
> +struct target_rlimit {
> +    abi_ulong rlim_cur;
> +    abi_ulong rlim_max;
> +};
> +
> +struct target_rlimit64 {
> +    uint64_t rlim_cur;
> +    uint64_t rlim_max;
> +};
> +
> +#define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
> +
> +#define TARGET_RLIMIT_CPU               0
> +#define TARGET_RLIMIT_FSIZE             1
> +#define TARGET_RLIMIT_DATA              2
> +#define TARGET_RLIMIT_STACK             3
> +#define TARGET_RLIMIT_CORE              4
> +#define TARGET_RLIMIT_RSS               5
> +#define TARGET_RLIMIT_NPROC             6
> +#define TARGET_RLIMIT_NOFILE            7
> +#define TARGET_RLIMIT_MEMLOCK           8
> +#define TARGET_RLIMIT_AS                9
> +#define TARGET_RLIMIT_LOCKS             10
> +#define TARGET_RLIMIT_SIGPENDING        11
> +#define TARGET_RLIMIT_MSGQUEUE          12
> +#define TARGET_RLIMIT_NICE              13
> +#define TARGET_RLIMIT_RTPRIO            14
> +
> +#endif
> diff --git a/linux-user/hexagon/target_resource.h b/linux-user/hexagon/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/hexagon/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/hppa/target_resource.h b/linux-user/hppa/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/hppa/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/i386/target_resource.h b/linux-user/i386/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/i386/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/m68k/target_resource.h b/linux-user/m68k/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/m68k/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/microblaze/target_resource.h b/linux-user/microblaze/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/microblaze/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/mips/target_resource.h b/linux-user/mips/target_resource.h
> new file mode 100644
> index 0000000000..6d131b041d
> --- /dev/null
> +++ b/linux-user/mips/target_resource.h
> @@ -0,0 +1,24 @@
> +#ifndef MIPS_TARGET_RESOURCE_H
> +#define MIPS_TARGET_RESOURCE_H
> +
> +#include "../generic/target_resource.h"
> +
> +#undef TARGET_RLIM_INFINITY
> +#define TARGET_RLIM_INFINITY    0x7fffffffUL
> +
> +#undef TARGET_RLIMIT_NOFILE
> +#define TARGET_RLIMIT_NOFILE    5
> +
> +#undef TARGET_RLIMIT_AS
> +#define TARGET_RLIMIT_AS        6
> +
> +#undef TARGET_RLIMIT_RSS
> +#define TARGET_RLIMIT_RSS       7
> +
> +#undef TARGET_RLIMIT_NPROC
> +#define TARGET_RLIMIT_NPROC     8
> +
> +#undef TARGET_RLIMIT_MEMLOCK
> +#define TARGET_RLIMIT_MEMLOCK   9
> +
> +#endif
> diff --git a/linux-user/mips64/target_resource.h b/linux-user/mips64/target_resource.h
> new file mode 100644
> index 0000000000..fe29002a12
> --- /dev/null
> +++ b/linux-user/mips64/target_resource.h
> @@ -0,0 +1 @@
> +#include "../mips/target_resource.h"
> diff --git a/linux-user/nios2/target_resource.h b/linux-user/nios2/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/nios2/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/openrisc/target_resource.h b/linux-user/openrisc/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/openrisc/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/ppc/target_resource.h b/linux-user/ppc/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/ppc/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/riscv/target_resource.h b/linux-user/riscv/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/riscv/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/s390x/target_resource.h b/linux-user/s390x/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/s390x/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/sh4/target_resource.h b/linux-user/sh4/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/sh4/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/sparc/target_resource.h b/linux-user/sparc/target_resource.h
> new file mode 100644
> index 0000000000..d9a2fb814a
> --- /dev/null
> +++ b/linux-user/sparc/target_resource.h
> @@ -0,0 +1,17 @@
> +#ifndef SPARC_TARGET_RESOURCE_H
> +#define SPARC_TARGET_RESOURCE_H
> +
> +#include "../generic/target_resource.h"
> +
> +#if TARGET_ABI_BITS == 32
> +#undef TARGET_RLIM_INFINITY
> +#define TARGET_RLIM_INFINITY    0x7fffffffUL
> +#endif
> +
> +#undef TARGET_RLIMIT_NOFILE
> +#define TARGET_RLIMIT_NOFILE    6
> +
> +#undef TARGET_RLIMIT_NPROC
> +#define TARGET_RLIMIT_NPROC     7
> +
> +#endif
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 3fcabaeae3..78607effe8 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -717,54 +717,7 @@ typedef struct target_siginfo {
>   #define TARGET_TRAP_HWBKPT      (4)     /* hardware breakpoint/watchpoint */
>   #define TARGET_TRAP_UNK         (5)     /* undiagnosed trap */
>   
> -struct target_rlimit {
> -        abi_ulong   rlim_cur;
> -        abi_ulong   rlim_max;
> -};
> -
> -#if defined(TARGET_ALPHA)
> -#define TARGET_RLIM_INFINITY	0x7fffffffffffffffull
> -#elif defined(TARGET_MIPS) || (defined(TARGET_SPARC) && TARGET_ABI_BITS == 32)
> -#define TARGET_RLIM_INFINITY	0x7fffffffUL
> -#else
> -#define TARGET_RLIM_INFINITY	((abi_ulong)-1)
> -#endif
> -
> -#define TARGET_RLIMIT_CPU		0
> -#define TARGET_RLIMIT_FSIZE		1
> -#define TARGET_RLIMIT_DATA		2
> -#define TARGET_RLIMIT_STACK		3
> -#define TARGET_RLIMIT_CORE		4
> -#if defined(TARGET_MIPS)
> -#define TARGET_RLIMIT_NOFILE		5
> -#define TARGET_RLIMIT_AS		6
> -#define TARGET_RLIMIT_RSS		7
> -#define TARGET_RLIMIT_NPROC		8
> -#define TARGET_RLIMIT_MEMLOCK		9
> -#elif defined(TARGET_ALPHA)
> -#define TARGET_RLIMIT_RSS		5
> -#define TARGET_RLIMIT_NOFILE		6
> -#define TARGET_RLIMIT_AS		7
> -#define TARGET_RLIMIT_NPROC		8
> -#define TARGET_RLIMIT_MEMLOCK		9
> -#elif defined(TARGET_SPARC)
> -#define TARGET_RLIMIT_RSS		5
> -#define TARGET_RLIMIT_NOFILE		6
> -#define TARGET_RLIMIT_NPROC		7
> -#define TARGET_RLIMIT_MEMLOCK		8
> -#define TARGET_RLIMIT_AS		9
> -#else
> -#define TARGET_RLIMIT_RSS		5
> -#define TARGET_RLIMIT_NPROC		6
> -#define TARGET_RLIMIT_NOFILE		7
> -#define TARGET_RLIMIT_MEMLOCK		8
> -#define TARGET_RLIMIT_AS		9
> -#endif
> -#define TARGET_RLIMIT_LOCKS		10
> -#define TARGET_RLIMIT_SIGPENDING	11
> -#define TARGET_RLIMIT_MSGQUEUE		12
> -#define TARGET_RLIMIT_NICE		13
> -#define TARGET_RLIMIT_RTPRIO		14
> +#include "target_resource.h"
>   
>   struct target_pollfd {
>       int fd;           /* file descriptor */
> @@ -2769,10 +2722,6 @@ struct target_epoll_event {
>   #define TARGET_EP_MAX_EVENTS (INT_MAX / sizeof(struct target_epoll_event))
>   
>   #endif
> -struct target_rlimit64 {
> -    uint64_t rlim_cur;
> -    uint64_t rlim_max;
> -};
>   
>   struct target_ucred {
>       uint32_t pid;
> diff --git a/linux-user/x86_64/target_resource.h b/linux-user/x86_64/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/x86_64/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"
> diff --git a/linux-user/xtensa/target_resource.h b/linux-user/xtensa/target_resource.h
> new file mode 100644
> index 0000000000..227259594c
> --- /dev/null
> +++ b/linux-user/xtensa/target_resource.h
> @@ -0,0 +1 @@
> +#include "../generic/target_resource.h"

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


