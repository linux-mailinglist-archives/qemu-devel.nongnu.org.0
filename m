Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8BA3C16A3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:51:31 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WJG-0008Ay-Aa
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vtt-0001rZ-6C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:18 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vtn-0001mA-7i
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:25:16 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXH3e-1lg9Gj2AIA-00YeNo; Thu, 08 Jul 2021 17:25:03 +0200
Subject: Re: [PATCH v2 3/8] linux-user: Extract target errno to
 'target_errno_defs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-4-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8087bff1-1a1b-2fae-ee4e-95045ffc4f3d@vivier.eu>
Date: Thu, 8 Jul 2021 17:25:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KjEE/cKIguBYi7PyaI6HlLVXRJiHTQ7Z3Z1lKSWgHyZqMJo18zX
 PHM0f5Eg43lLmaNsGdCiBnJc2fTzHr8D6awcn1wkRsiGv5cWTf+SsRrUW6LyKnqIBVlgLD6
 VgpjwlWdGYbUH5rM1+R/12lEz5aa4buluFqadK+vxnV1YKXy02Ko23WY/+qoPFT8tpxpHs1
 p5tLCoHjSn0cKh3xwCGAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gdFApO6hku4=:7FrAVaPakPX1AaXNE2KKQp
 j+eCiUeqKMXfwL6Fly/4fiW0JyRditr2EgLC6Yc4/IwcB4tzJ03IWAW4HfsAKnuWWlIgxsAlJ
 NnQAWAXOjbJ1up688pOWcDgF1nGmdrknt9uTO3vtxoNmVvepyVc01UnM8fOgoo2ijBFl/vgWP
 urmyl5o89ug/FDiCvTM7XMqIehwo29RTIhm5vmE1zTF7nfJTpTsqSmn5WA3SbnQUECaAHNaPz
 tcDphwIV0JuzihqpmVgcd/hYfq5jeBvti7TpnInZ65Jcll8wmWE1NXU2cfLnVtuehVxTz4H9u
 tCJdGBQI03lyi3eSVsLAR0bTjyaK9akuio8yymDdFRlXikyl3adfVW4kKqYdaupl0Y0sK7zBb
 1gpCLnLYyQVZykFc6LgZnVEby9G8dUUqFCO3jtGOpcppGZMNrOK/D+/g7hu5vI0nq3dxODmFn
 Z++naGqxmaL4g5xUsBuNy1mA8bj28OQO/uB9UgxmPn9W4qbLqQipW4Shcyax0W76Efd2/5Bnz
 dfuuUW8/yloYzxAEYVYUB0LvQDtxngF/6z66TEFT5YPGZ9+Hj6iB0sQxwrBtxI6+Q0dHsirKa
 vUGpf5bNu4fiWgeS4mGurt5ohZDxPNd5mHwyTHXjfPgklmjbIhg+ggrDVeOkMAZnkHfDVnOzL
 nxNf1WuS4tDhj43GlKdtyQ4a83ztBxjhBJkdvk8hZsVpa+s6AngjmqCBtHDZJ5/6oMSSkCoSk
 hjehX4Tv+3BWDK8FOXT8HDGQK6F1Y6E4PWTnQVeG8X8VooND1T5aC6vLGv/WRYv0P69rTvESR
 4yZPSW+p1aad+2XiJr+B20QP4YI/TN5twFY/gVYGwut/kv6bbqKLjm2zPyNF0obOK6tJXAr
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
> We want to access the target errno indepently of the rest of the
> linux-user code. Move the header containing the generic errno
> definitions ('errno_defs.h') to 'generic/target_errno_defs.h',
> create a new 'target_errno_defs.h' in each target which itself
> includes 'generic/target_errno_defs.h'.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/aarch64/target_errno_defs.h                   | 6 ++++++
>  linux-user/alpha/target_errno_defs.h                     | 6 ++++++
>  linux-user/arm/target_errno_defs.h                       | 6 ++++++
>  linux-user/cris/target_errno_defs.h                      | 6 ++++++
>  linux-user/{errno_defs.h => generic/target_errno_defs.h} | 4 ++--
>  linux-user/hexagon/target_errno_defs.h                   | 6 ++++++
>  linux-user/hppa/target_errno_defs.h                      | 6 ++++++
>  linux-user/i386/target_errno_defs.h                      | 6 ++++++
>  linux-user/m68k/target_errno_defs.h                      | 6 ++++++
>  linux-user/microblaze/target_errno_defs.h                | 6 ++++++
>  linux-user/mips/target_errno_defs.h                      | 6 ++++++
>  linux-user/mips64/target_errno_defs.h                    | 6 ++++++
>  linux-user/nios2/target_errno_defs.h                     | 6 ++++++
>  linux-user/openrisc/target_errno_defs.h                  | 6 ++++++
>  linux-user/ppc/target_errno_defs.h                       | 6 ++++++
>  linux-user/riscv/target_errno_defs.h                     | 6 ++++++
>  linux-user/s390x/target_errno_defs.h                     | 6 ++++++
>  linux-user/sh4/target_errno_defs.h                       | 6 ++++++
>  linux-user/sparc/target_errno_defs.h                     | 2 ++
>  linux-user/sparc/target_syscall.h                        | 2 --
>  linux-user/syscall_defs.h                                | 2 +-
>  linux-user/x86_64/target_errno_defs.h                    | 6 ++++++
>  linux-user/xtensa/target_errno_defs.h                    | 6 ++++++
>  linux-user/safe-syscall.S                                | 2 +-
>  24 files changed, 120 insertions(+), 6 deletions(-)
>  create mode 100644 linux-user/aarch64/target_errno_defs.h
>  create mode 100644 linux-user/alpha/target_errno_defs.h
>  create mode 100644 linux-user/arm/target_errno_defs.h
>  create mode 100644 linux-user/cris/target_errno_defs.h
>  rename linux-user/{errno_defs.h => generic/target_errno_defs.h} (99%)
>  create mode 100644 linux-user/hexagon/target_errno_defs.h
>  create mode 100644 linux-user/hppa/target_errno_defs.h
>  create mode 100644 linux-user/i386/target_errno_defs.h
>  create mode 100644 linux-user/m68k/target_errno_defs.h
>  create mode 100644 linux-user/microblaze/target_errno_defs.h
>  create mode 100644 linux-user/mips/target_errno_defs.h
>  create mode 100644 linux-user/mips64/target_errno_defs.h
>  create mode 100644 linux-user/nios2/target_errno_defs.h
>  create mode 100644 linux-user/openrisc/target_errno_defs.h
>  create mode 100644 linux-user/ppc/target_errno_defs.h
>  create mode 100644 linux-user/riscv/target_errno_defs.h
>  create mode 100644 linux-user/s390x/target_errno_defs.h
>  create mode 100644 linux-user/sh4/target_errno_defs.h
>  create mode 100644 linux-user/x86_64/target_errno_defs.h
>  create mode 100644 linux-user/xtensa/target_errno_defs.h
> 
> diff --git a/linux-user/aarch64/target_errno_defs.h b/linux-user/aarch64/target_errno_defs.h
> new file mode 100644
> index 00000000000..eee9762ba32
> --- /dev/null
> +++ b/linux-user/aarch64/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef AARCH64_TARGET_ERRNO_DEFS_H
> +#define AARCH64_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
> new file mode 100644
> index 00000000000..54770108c02
> --- /dev/null
> +++ b/linux-user/alpha/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef ALPHA_TARGET_ERRNO_DEFS_H
> +#define ALPHA_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/arm/target_errno_defs.h b/linux-user/arm/target_errno_defs.h
> new file mode 100644
> index 00000000000..448cc407662
> --- /dev/null
> +++ b/linux-user/arm/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef ARM_TARGET_ERRNO_DEFS_H
> +#define ARM_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/cris/target_errno_defs.h b/linux-user/cris/target_errno_defs.h
> new file mode 100644
> index 00000000000..02c040982df
> --- /dev/null
> +++ b/linux-user/cris/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef CRIS_TARGET_ERRNO_DEFS_H
> +#define CRIS_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/errno_defs.h b/linux-user/generic/target_errno_defs.h
> similarity index 99%
> rename from linux-user/errno_defs.h
> rename to linux-user/generic/target_errno_defs.h
> index aaf5208d62d..17d85e0b61b 100644
> --- a/linux-user/errno_defs.h
> +++ b/linux-user/generic/target_errno_defs.h
> @@ -5,8 +5,8 @@
>   * Taken from asm-generic/errno-base.h and asm-generic/errno.h
>   */
>  
> -#ifndef LINUX_USER_ERRNO_DEFS_H
> -#define LINUX_USER_ERRNO_DEFS_H
> +#ifndef GENERIC_TARGET_ERRNO_DEFS_H
> +#define GENERIC_TARGET_ERRNO_DEFS_H
>  
>  #define TARGET_EPERM            1      /* Operation not permitted */
>  #define TARGET_ENOENT           2      /* No such file or directory */
> diff --git a/linux-user/hexagon/target_errno_defs.h b/linux-user/hexagon/target_errno_defs.h
> new file mode 100644
> index 00000000000..0644ae802b4
> --- /dev/null
> +++ b/linux-user/hexagon/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef HEXAGON_TARGET_ERRNO_DEFS_H
> +#define HEXAGON_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/hppa/target_errno_defs.h b/linux-user/hppa/target_errno_defs.h
> new file mode 100644
> index 00000000000..d6e9676ce25
> --- /dev/null
> +++ b/linux-user/hppa/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef HPPA_TARGET_ERRNO_DEFS_H
> +#define HPPA_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/i386/target_errno_defs.h b/linux-user/i386/target_errno_defs.h
> new file mode 100644
> index 00000000000..d34466d583f
> --- /dev/null
> +++ b/linux-user/i386/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef I386_TARGET_ERRNO_DEFS_H
> +#define I386_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/m68k/target_errno_defs.h b/linux-user/m68k/target_errno_defs.h
> new file mode 100644
> index 00000000000..91c51b79cdc
> --- /dev/null
> +++ b/linux-user/m68k/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef M68K_TARGET_ERRNO_DEFS_H
> +#define M68K_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/microblaze/target_errno_defs.h b/linux-user/microblaze/target_errno_defs.h
> new file mode 100644
> index 00000000000..7be53eb2365
> --- /dev/null
> +++ b/linux-user/microblaze/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef MICROBLAZE_TARGET_ERRNO_DEFS_H
> +#define MICROBLAZE_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/mips/target_errno_defs.h b/linux-user/mips/target_errno_defs.h
> new file mode 100644
> index 00000000000..daef95ea703
> --- /dev/null
> +++ b/linux-user/mips/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef MIPS_TARGET_ERRNO_DEFS_H
> +#define MIPS_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/mips64/target_errno_defs.h b/linux-user/mips64/target_errno_defs.h
> new file mode 100644
> index 00000000000..82b0a704f62
> --- /dev/null
> +++ b/linux-user/mips64/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef MIPS64_TARGET_ERRNO_DEFS_H
> +#define MIPS64_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/nios2/target_errno_defs.h b/linux-user/nios2/target_errno_defs.h
> new file mode 100644
> index 00000000000..daceaf30347
> --- /dev/null
> +++ b/linux-user/nios2/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef NIOS2_TARGET_ERRNO_DEFS_H
> +#define NIOS2_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/openrisc/target_errno_defs.h b/linux-user/openrisc/target_errno_defs.h
> new file mode 100644
> index 00000000000..1d32c8798f7
> --- /dev/null
> +++ b/linux-user/openrisc/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef OR1K_TARGET_ERRNO_DEFS_H
> +#define OR1K_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/ppc/target_errno_defs.h b/linux-user/ppc/target_errno_defs.h
> new file mode 100644
> index 00000000000..01b25bb5d06
> --- /dev/null
> +++ b/linux-user/ppc/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef PPC_TARGET_ERRNO_DEFS_H
> +#define PPC_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/riscv/target_errno_defs.h b/linux-user/riscv/target_errno_defs.h
> new file mode 100644
> index 00000000000..785614ba0a5
> --- /dev/null
> +++ b/linux-user/riscv/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef RISCV_TARGET_ERRNO_DEFS_H
> +#define RISCV_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/s390x/target_errno_defs.h b/linux-user/s390x/target_errno_defs.h
> new file mode 100644
> index 00000000000..bca1c3b4a10
> --- /dev/null
> +++ b/linux-user/s390x/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef S390X_TARGET_ERRNO_DEFS_H
> +#define S390X_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/sh4/target_errno_defs.h b/linux-user/sh4/target_errno_defs.h
> new file mode 100644
> index 00000000000..de2de2d3f8d
> --- /dev/null
> +++ b/linux-user/sh4/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef SH4_TARGET_ERRNO_DEFS_H
> +#define SH4_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/sparc/target_errno_defs.h b/linux-user/sparc/target_errno_defs.h
> index e0008109867..416acbb4593 100644
> --- a/linux-user/sparc/target_errno_defs.h
> +++ b/linux-user/sparc/target_errno_defs.h
> @@ -1,6 +1,8 @@
>  #ifndef SPARC_TARGET_ERRNO_DEFS_H
>  #define SPARC_TARGET_ERRNO_DEFS_H
>  
> +#include "../generic/target_errno_defs.h"
> +
>  /* Target errno definitions taken from asm-sparc/errno.h */
>  #undef TARGET_EWOULDBLOCK
>  #define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
> diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
> index dad501d008c..087b39d39c4 100644
> --- a/linux-user/sparc/target_syscall.h
> +++ b/linux-user/sparc/target_syscall.h
> @@ -1,8 +1,6 @@
>  #ifndef SPARC_TARGET_SYSCALL_H
>  #define SPARC_TARGET_SYSCALL_H
>  
> -#include "target_errno_defs.h"
> -
>  #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
>  struct target_pt_regs {
>      abi_ulong u_regs[16];
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 18b031a2f6a..a5ce487dcc3 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2751,7 +2751,7 @@ struct target_drm_i915_getparam {
>  
>  #include "socket.h"
>  
> -#include "errno_defs.h"
> +#include "target_errno_defs.h"
>  
>  #define FUTEX_WAIT              0
>  #define FUTEX_WAKE              1
> diff --git a/linux-user/x86_64/target_errno_defs.h b/linux-user/x86_64/target_errno_defs.h
> new file mode 100644
> index 00000000000..43b4068ba93
> --- /dev/null
> +++ b/linux-user/x86_64/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef X86_64_TARGET_ERRNO_DEFS_H
> +#define X86_64_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/xtensa/target_errno_defs.h b/linux-user/xtensa/target_errno_defs.h
> new file mode 100644
> index 00000000000..7d39e77251c
> --- /dev/null
> +++ b/linux-user/xtensa/target_errno_defs.h
> @@ -0,0 +1,6 @@
> +#ifndef XTENSA_TARGET_ERRNO_DEFS_H
> +#define XTENSA_TARGET_ERRNO_DEFS_H
> +
> +#include "../generic/target_errno_defs.h"
> +
> +#endif
> diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
> index b5df6254aea..42ea7c40ba3 100644
> --- a/linux-user/safe-syscall.S
> +++ b/linux-user/safe-syscall.S
> @@ -11,7 +11,7 @@
>   */
>  
>  #include "hostdep.h"
> -#include "errno_defs.h"
> +#include "target_errno_defs.h"
>  
>  /* We have the correct host directory on our include path
>   * so that this will pull in the right fragment for the architecture.
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

