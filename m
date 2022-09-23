Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017505E8538
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 23:59:58 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqiD-0003fT-41
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 17:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqa1-0008FD-Rv
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:51:29 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:34909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqZz-0007CX-J8
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:51:29 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8QFi-1ogGQ72LBY-004SMM; Fri, 23 Sep 2022 23:51:15 +0200
Message-ID: <4a4034e5-b944-ca22-0cd7-3cbc5a3f120a@vivier.eu>
Date: Fri, 23 Sep 2022 23:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 1/5] linux-user: Provide MADV_* definitions
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220906000839.1672934-1-iii@linux.ibm.com>
 <20220906000839.1672934-2-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220906000839.1672934-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HR58y32JQGtxDBuuU7Ql12EX8x4cbUzs0A2rxxquThI4Qovu9mP
 qClrNhGaJzvJ3+sIiI0a31yV2/iz1uSiQ4qhJR2SXT54I1DADI54rIS1YidzMEVUwkH6MGs
 syPcbPtIe5BDwjCVwbUKkBYBrAiVX65IsD9J2fPabGyNd4PTXgR0+5IhyirlRZcRERvyVd8
 aaxgJjkuDx046QND46J7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EWFkZ+tHqg0=:lbSxYw4qR2q//4MeWkB4Eq
 LPPUBaEZ5ZLxt9Wxio/0F5gViV3kP0Dp9/mlLUz/SIyiOXmCnkaHuvy4uLNOzg1ajci036b3Q
 AVt2IA/a4kw0xmE4qlYCB9jjzupewbm66f9mi7+bfpcvxybMRSgTFtDfSlNTGgumfKPyTGu+o
 wMhPkaYUWnKj/CqVQhdhh0alPbNFtqzwA/76Pm71Ac6dlJCH1T+miEKAPQrcaWYcyxIDt0zU9
 ZOOAd82Onn0CXCN4G7V6y2w3tf33aT9rFoyMohhbpVmu/7sXa9zVPb7V3XnCM8IGJbnmz/Dw9
 QLOH23kyKBVQCQ54GUM8ItpyLOhbrPMWqyIRks4fiNj/0t9b6sU4IswhVe8u6UaS3LdI/knAN
 hojlJpOZjmJkDQLnRWGnNdegwFaJusgZr3jXYRmwVq6VZxNcwhW+mk1r1ovHdu+ZQLRjxhCoY
 qartE0jTCSSU78VH4NRO5DB6uCUwnk4xqxfVXy5EbdkKI/i+NGo+UWbtiFK8dnh2xG+uExyxM
 m/HWa+rVxC2nbwTuNEIR5xFcwBDNsHqjZwMxr9BRILzl6fjJx9iz0kvaM6dkoPD733R1/iQB1
 ifKod7bafW6IVu8f/u+/ehhn9XIGmzd2U5a7xCCMDwG+JHHMqUj4wurK+uV1HTkrUKuJgh3Ps
 IPwWb6Qu1i4AwXX8GVymigSlS0SGCuu5YQWK0MeaBfwxa9HdlvUZjrX93+cBwj9pgTummNiJN
 EvaGLrdLwRQ5n+pwc5G74MElJGqV4E3Kuh5aYxqOIvmJTHu9u9d0Itz0qOlQwkOyM0xYw08JX
 071i4sq
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

Le 06/09/2022 à 02:08, Ilya Leoshkevich a écrit :
> Provide MADV_* definitions using target_mman.h header, similar to what
> kernel does. Most architectures use the same values, with the exception
> of alpha and hppa.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/aarch64/target_mman.h     |  1 +
>   linux-user/alpha/target_mman.h       |  8 +++
>   linux-user/arm/target_mman.h         |  1 +
>   linux-user/cris/target_mman.h        |  1 +
>   linux-user/generic/target_mman.h     | 92 ++++++++++++++++++++++++++++
>   linux-user/hexagon/target_mman.h     |  1 +
>   linux-user/hppa/target_mman.h        | 15 +++++
>   linux-user/i386/target_mman.h        |  1 +
>   linux-user/loongarch64/target_mman.h |  1 +
>   linux-user/m68k/target_mman.h        |  1 +
>   linux-user/microblaze/target_mman.h  |  1 +
>   linux-user/mips/target_mman.h        |  1 +
>   linux-user/mips64/target_mman.h      |  1 +
>   linux-user/nios2/target_mman.h       |  1 +
>   linux-user/openrisc/target_mman.h    |  1 +
>   linux-user/ppc/target_mman.h         |  1 +
>   linux-user/riscv/target_mman.h       |  1 +
>   linux-user/s390x/target_mman.h       |  1 +
>   linux-user/sh4/target_mman.h         |  1 +
>   linux-user/sparc/target_mman.h       |  1 +
>   linux-user/x86_64/target_mman.h      |  1 +
>   linux-user/xtensa/target_mman.h      |  1 +
>   22 files changed, 134 insertions(+)
>   create mode 100644 linux-user/aarch64/target_mman.h
>   create mode 100644 linux-user/alpha/target_mman.h
>   create mode 100644 linux-user/arm/target_mman.h
>   create mode 100644 linux-user/cris/target_mman.h
>   create mode 100644 linux-user/generic/target_mman.h
>   create mode 100644 linux-user/hexagon/target_mman.h
>   create mode 100644 linux-user/hppa/target_mman.h
>   create mode 100644 linux-user/i386/target_mman.h
>   create mode 100644 linux-user/loongarch64/target_mman.h
>   create mode 100644 linux-user/m68k/target_mman.h
>   create mode 100644 linux-user/microblaze/target_mman.h
>   create mode 100644 linux-user/mips/target_mman.h
>   create mode 100644 linux-user/mips64/target_mman.h
>   create mode 100644 linux-user/nios2/target_mman.h
>   create mode 100644 linux-user/openrisc/target_mman.h
>   create mode 100644 linux-user/ppc/target_mman.h
>   create mode 100644 linux-user/riscv/target_mman.h
>   create mode 100644 linux-user/s390x/target_mman.h
>   create mode 100644 linux-user/sh4/target_mman.h
>   create mode 100644 linux-user/sparc/target_mman.h
>   create mode 100644 linux-user/x86_64/target_mman.h
>   create mode 100644 linux-user/xtensa/target_mman.h
> 
> diff --git a/linux-user/aarch64/target_mman.h b/linux-user/aarch64/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/aarch64/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/alpha/target_mman.h b/linux-user/alpha/target_mman.h
> new file mode 100644
> index 0000000000..cd6e3d70a6
> --- /dev/null
> +++ b/linux-user/alpha/target_mman.h
> @@ -0,0 +1,8 @@
> +#ifndef ALPHA_TARGET_MMAN_H
> +#define ALPHA_TARGET_MMAN_H
> +
> +#define TARGET_MADV_DONTNEED 6
> +
> +#include "../generic/target_mman.h"
> +
> +#endif
> diff --git a/linux-user/arm/target_mman.h b/linux-user/arm/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/arm/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/cris/target_mman.h b/linux-user/cris/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/cris/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/generic/target_mman.h b/linux-user/generic/target_mman.h
> new file mode 100644
> index 0000000000..1436a3c543
> --- /dev/null
> +++ b/linux-user/generic/target_mman.h
> @@ -0,0 +1,92 @@
> +#ifndef LINUX_USER_TARGET_MMAN_H
> +#define LINUX_USER_TARGET_MMAN_H
> +
> +#ifndef TARGET_MADV_NORMAL
> +#define TARGET_MADV_NORMAL 0
> +#endif
> +
> +#ifndef TARGET_MADV_RANDOM
> +#define TARGET_MADV_RANDOM 1
> +#endif
> +
> +#ifndef TARGET_MADV_SEQUENTIAL
> +#define TARGET_MADV_SEQUENTIAL 2
> +#endif
> +
> +#ifndef TARGET_MADV_WILLNEED
> +#define TARGET_MADV_WILLNEED 3
> +#endif
> +
> +#ifndef TARGET_MADV_DONTNEED
> +#define TARGET_MADV_DONTNEED 4
> +#endif
> +
> +#ifndef TARGET_MADV_FREE
> +#define TARGET_MADV_FREE 8
> +#endif
> +
> +#ifndef TARGET_MADV_REMOVE
> +#define TARGET_MADV_REMOVE 9
> +#endif
> +
> +#ifndef TARGET_MADV_DONTFORK
> +#define TARGET_MADV_DONTFORK 10
> +#endif
> +
> +#ifndef TARGET_MADV_DOFORK
> +#define TARGET_MADV_DOFORK 11
> +#endif
> +
> +#ifndef TARGET_MADV_MERGEABLE
> +#define TARGET_MADV_MERGEABLE 12
> +#endif
> +
> +#ifndef TARGET_MADV_UNMERGEABLE
> +#define TARGET_MADV_UNMERGEABLE 13
> +#endif
> +
> +#ifndef TARGET_MADV_HUGEPAGE
> +#define TARGET_MADV_HUGEPAGE 14
> +#endif
> +
> +#ifndef TARGET_MADV_NOHUGEPAGE
> +#define TARGET_MADV_NOHUGEPAGE 15
> +#endif
> +
> +#ifndef TARGET_MADV_DONTDUMP
> +#define TARGET_MADV_DONTDUMP 16
> +#endif
> +
> +#ifndef TARGET_MADV_DODUMP
> +#define TARGET_MADV_DODUMP 17
> +#endif
> +
> +#ifndef TARGET_MADV_WIPEONFORK
> +#define TARGET_MADV_WIPEONFORK 18
> +#endif
> +
> +#ifndef TARGET_MADV_KEEPONFORK
> +#define TARGET_MADV_KEEPONFORK 19
> +#endif
> +
> +#ifndef TARGET_MADV_COLD
> +#define TARGET_MADV_COLD 20
> +#endif
> +
> +#ifndef TARGET_MADV_PAGEOUT
> +#define TARGET_MADV_PAGEOUT 21
> +#endif
> +
> +#ifndef TARGET_MADV_POPULATE_READ
> +#define TARGET_MADV_POPULATE_READ 22
> +#endif
> +
> +#ifndef TARGET_MADV_POPULATE_WRITE
> +#define TARGET_MADV_POPULATE_WRITE 23
> +#endif
> +
> +#ifndef TARGET_MADV_DONTNEED_LOCKED
> +#define TARGET_MADV_DONTNEED_LOCKED 24
> +#endif
> +
> +#endif
> diff --git a/linux-user/hexagon/target_mman.h b/linux-user/hexagon/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/hexagon/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/hppa/target_mman.h b/linux-user/hppa/target_mman.h
> new file mode 100644
> index 0000000000..66dd9f7941
> --- /dev/null
> +++ b/linux-user/hppa/target_mman.h
> @@ -0,0 +1,15 @@
> +#ifndef HPPA_TARGET_MMAN_H
> +#define HPPA_TARGET_MMAN_H
> +
> +#define TARGET_MADV_MERGEABLE 65
> +#define TARGET_MADV_UNMERGEABLE 66
> +#define TARGET_MADV_HUGEPAGE 67
> +#define TARGET_MADV_NOHUGEPAGE 68
> +#define TARGET_MADV_DONTDUMP 69
> +#define TARGET_MADV_DODUMP 70
> +#define TARGET_MADV_WIPEONFORK 71
> +#define TARGET_MADV_KEEPONFORK 72
> +
> +#include "../generic/target_mman.h"
> +
> +#endif
> diff --git a/linux-user/i386/target_mman.h b/linux-user/i386/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/i386/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/loongarch64/target_mman.h b/linux-user/loongarch64/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/loongarch64/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/m68k/target_mman.h b/linux-user/m68k/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/m68k/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/microblaze/target_mman.h b/linux-user/microblaze/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/microblaze/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/mips/target_mman.h b/linux-user/mips/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/mips/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/mips64/target_mman.h b/linux-user/mips64/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/mips64/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/nios2/target_mman.h b/linux-user/nios2/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/nios2/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/openrisc/target_mman.h b/linux-user/openrisc/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/openrisc/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/ppc/target_mman.h b/linux-user/ppc/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/ppc/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/riscv/target_mman.h b/linux-user/riscv/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/riscv/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/s390x/target_mman.h b/linux-user/s390x/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/s390x/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/sh4/target_mman.h b/linux-user/sh4/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/sh4/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/sparc/target_mman.h b/linux-user/sparc/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/sparc/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/x86_64/target_mman.h b/linux-user/x86_64/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/x86_64/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"
> diff --git a/linux-user/xtensa/target_mman.h b/linux-user/xtensa/target_mman.h
> new file mode 100644
> index 0000000000..e7ba6070fe
> --- /dev/null
> +++ b/linux-user/xtensa/target_mman.h
> @@ -0,0 +1 @@
> +#include "../generic/target_mman.h"

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


