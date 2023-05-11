Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868A96FF0AE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:48:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4mM-00008b-S3; Thu, 11 May 2023 07:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1px4mK-0008U1-Nx
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:48:12 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1px4mI-0007Eq-D2
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:48:12 -0400
Received: from [192.168.100.30] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MSbt9-1pmKBK3NLF-00T0Hl; Thu, 11 May 2023 13:48:08 +0200
Message-ID: <49a92210-ee40-e284-7bf8-ca3c13d2c087@vivier.eu>
Date: Thu, 11 May 2023 13:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 11/15] include/exec: Change reserved_va semantics to last
 byte
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
 <20230328225806.2278728-12-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230328225806.2278728-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3HdclojRJ4NpQRgHTroEad2vq+Bld7+iM6iNRred3WIS8VtSE2R
 SeFD1zQH84KUWQPlTxqrG00EfTr+T7HTbOdCc73s8MIHIHQNKnFTYeOPH04odrNRQM4+srD
 Nf0H7u4ajH+aHX8f+ORmqmpY81TY42d29y6TgBIUM5HmjF1bcUxJ37E3qhEuZfKnKtUtm0D
 HWHq6TIZ3MdHGW4kCuW5w==
UI-OutboundReport: notjunk:1;M01:P0:8X7pW7ZFjcs=;mUy2mqH7PDzSWh5gVRBbaKfxGYD
 pOGHvrvh9Zmda9ZbA39yD4KvuSVQeTnvy3cpJRJ6HMRaOdqBXnM+iRsAkVIXMLSAUstE2mVn1
 sCeO6ymnaFe4EzQ0kJDML7HV10QKMUaDFIMuy4/yiINze3ixx5APoL1oFkB1AzwAK+yiWSC7X
 Rfj8M6Vql7xJxBNBIXcYC7HrzMay8sy9mb5s0nRZ0VibiZHjwcca1ZqP+1EtzmS9RL4Yh5jXr
 uPZXc67fKKg4VUm7/cqTAQkDlYrwUc5jlvjpI7yEkoz1l1W8FTWT50SQFo8WHzQbioWpZgTPz
 WEFh/cf2MTH3kE7iTdPC9Wa2UxJh5P1NUGwTIjGHKP2voVmhnlu/xUlKvV2m48/LsWdlEOOcG
 /Zm7zvyZ6VFnSzzUPaOvGs/2iuNGu8kUk/gHieuQHS2VXmo2NwdcgQ6wvTFglNmEtcl7WdS5m
 yuI00GokXqqarxKyXcteMhiUGHytuBrzJ2rINgOXXUkHY7CT3DD0JQHgcZhBo2j5wOeA/TsOn
 QnSyrLk+YxqPoBWbyTTkqzpGGT4q3AV1hQL7l3ShwXBHmYTu/6Rqwqo1Q74ai/c3373YwqeuS
 ve/CzzyWltcSJdFFUjbYPx/F0kZuVTG/Wv3lI2XVEaQ80c2kQ7IRDkWce7+VjphtVmBGzAkHR
 BKsEYjBAghCTZSBbOJDhdrgx4FOwqBWaS4xfB8AObA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 3/29/23 00:58, Richard Henderson wrote:
> Change the semantics to be the last byte of the guest va, rather
> than the following byte.  This avoids some overflow conditions.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/cpu-all.h      | 11 ++++++++++-
>   linux-user/arm/target_cpu.h |  2 +-
>   bsd-user/main.c             | 10 +++-------
>   bsd-user/mmap.c             |  4 ++--
>   linux-user/elfload.c        | 14 +++++++-------
>   linux-user/main.c           | 27 +++++++++++++--------------
>   linux-user/mmap.c           |  4 ++--
>   7 files changed, 38 insertions(+), 34 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 64cb62dc54..090922e4a8 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -152,6 +152,15 @@ static inline void tswap64s(uint64_t *s)
>    */
>   extern uintptr_t guest_base;
>   extern bool have_guest_base;
> +
> +/*
> + * If non-zero, the guest virtual address space is a contiguous subset
> + * of the host virtual address space, i.e. '-R reserved_va' is in effect
> + * either from the command-line or by default.  The value is the last
> + * byte of the guest address space e.g. UINT32_MAX.
> + *
> + * If zero, the host and guest virtual address spaces are intermingled.
> + */
>   extern unsigned long reserved_va;
>   
>   /*
> @@ -171,7 +180,7 @@ extern unsigned long reserved_va;
>   #define GUEST_ADDR_MAX_                                                 \
>       ((MIN_CONST(TARGET_VIRT_ADDR_SPACE_BITS, TARGET_ABI_BITS) <= 32) ?  \
>        UINT32_MAX : ~0ul)
> -#define GUEST_ADDR_MAX    (reserved_va ? reserved_va - 1 : GUEST_ADDR_MAX_)
> +#define GUEST_ADDR_MAX    (reserved_va ? : GUEST_ADDR_MAX_)
>   
>   #else
>   
> diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
> index 89ba274cfc..f6383a7cd1 100644
> --- a/linux-user/arm/target_cpu.h
> +++ b/linux-user/arm/target_cpu.h
> @@ -30,7 +30,7 @@ static inline unsigned long arm_max_reserved_va(CPUState *cs)
>            * the high addresses.  Restrict linux-user to the
>            * cached write-back RAM in the system map.
>            */
> -        return 0x80000000ul;
> +        return 0x7ffffffful;
>       } else {
>           /*
>            * We need to be able to map the commpage.
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 89f225dead..babc3b009b 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -68,13 +68,9 @@ bool have_guest_base;
>   # if HOST_LONG_BITS > TARGET_VIRT_ADDR_SPACE_BITS
>   #  if TARGET_VIRT_ADDR_SPACE_BITS == 32 && \
>         (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
> -/*
> - * There are a number of places where we assign reserved_va to a variable
> - * of type abi_ulong and expect it to fit.  Avoid the last page.
> - */
> -#   define MAX_RESERVED_VA  (0xfffffffful & TARGET_PAGE_MASK)
> +#   define MAX_RESERVED_VA  0xfffffffful
>   #  else
> -#   define MAX_RESERVED_VA  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
> +#   define MAX_RESERVED_VA  ((1ul << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
>   #  endif
>   # else
>   #  define MAX_RESERVED_VA  0
> @@ -466,7 +462,7 @@ int main(int argc, char **argv)
>       envlist_free(envlist);
>   
>       if (reserved_va) {
> -            mmap_next_start = reserved_va;
> +        mmap_next_start = reserved_va + 1;
>       }
>   
>       {
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 696057551a..565b9f97ed 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -234,7 +234,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
>       size = HOST_PAGE_ALIGN(size) + alignment;
>       end_addr = start + size;
>       if (end_addr > reserved_va) {
> -        end_addr = reserved_va;
> +        end_addr = reserved_va + 1;
>       }
>       addr = end_addr - qemu_host_page_size;
>   
> @@ -243,7 +243,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
>               if (looped) {
>                   return (abi_ulong)-1;
>               }
> -            end_addr = reserved_va;
> +            end_addr = reserved_va + 1;
>               addr = end_addr - qemu_host_page_size;
>               looped = 1;
>               continue;
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index dfae967908..f1370a7a8b 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -208,7 +208,7 @@ static bool init_guest_commpage(void)
>        * has specified -R reserved_va, which would trigger an assert().
>        */
>       if (reserved_va != 0 &&
> -        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE >= reserved_va) {
> +        TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE - 1 > reserved_va) {
>           error_report("Cannot allocate vsyscall page");
>           exit(EXIT_FAILURE);
>       }
> @@ -2504,7 +2504,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
>           if (guest_hiaddr > reserved_va) {
>               error_report("%s: requires more than reserved virtual "
>                            "address space (0x%" PRIx64 " > 0x%lx)",
> -                         image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
> +                         image_name, (uint64_t)guest_hiaddr, reserved_va);
>               exit(EXIT_FAILURE);
>           }
>       } else {
> @@ -2525,7 +2525,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
>       if (reserved_va) {
>           guest_loaddr = (guest_base >= mmap_min_addr ? 0
>                           : mmap_min_addr - guest_base);
> -        guest_hiaddr = reserved_va - 1;
> +        guest_hiaddr = reserved_va;
>       }
>   
>       /* Reserve the address space for the binary, or reserved_va. */
> @@ -2755,7 +2755,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
>       if (guest_hiaddr > reserved_va) {
>           error_report("%s: requires more than reserved virtual "
>                        "address space (0x%" PRIx64 " > 0x%lx)",
> -                     image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
> +                     image_name, (uint64_t)guest_hiaddr, reserved_va);
>           exit(EXIT_FAILURE);
>       }
>   
> @@ -2768,17 +2768,17 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
>       /* Reserve the memory on the host. */
>       assert(guest_base != 0);
>       test = g2h_untagged(0);
> -    addr = mmap(test, reserved_va, PROT_NONE, flags, -1, 0);
> +    addr = mmap(test, reserved_va + 1, PROT_NONE, flags, -1, 0);
>       if (addr == MAP_FAILED || addr != test) {
>           error_report("Unable to reserve 0x%lx bytes of virtual address "
>                        "space at %p (%s) for use as guest address space (check your "
>                        "virtual memory ulimit setting, min_mmap_addr or reserve less "
> -                     "using -R option)", reserved_va, test, strerror(errno));
> +                     "using -R option)", reserved_va + 1, test, strerror(errno));
>           exit(EXIT_FAILURE);
>       }
>   
>       qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %lu bytes\n",
> -                  __func__, addr, reserved_va);
> +                  __func__, addr, reserved_va + 1);
>   }
>   
>   void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 39d9bd4d7a..fe03293516 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -109,11 +109,9 @@ static const char *last_log_filename;
>   # if HOST_LONG_BITS > TARGET_VIRT_ADDR_SPACE_BITS
>   #  if TARGET_VIRT_ADDR_SPACE_BITS == 32 && \
>         (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
> -/* There are a number of places where we assign reserved_va to a variable
> -   of type abi_ulong and expect it to fit.  Avoid the last page.  */
> -#   define MAX_RESERVED_VA(CPU)  (0xfffffffful & TARGET_PAGE_MASK)
> +#   define MAX_RESERVED_VA(CPU)  0xfffffffful
>   #  else
> -#   define MAX_RESERVED_VA(CPU)  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
> +#   define MAX_RESERVED_VA(CPU)  ((1ul << TARGET_VIRT_ADDR_SPACE_BITS) - 1)
>   #  endif
>   # else
>   #  define MAX_RESERVED_VA(CPU)  0
> @@ -379,7 +377,9 @@ static void handle_arg_reserved_va(const char *arg)
>   {
>       char *p;
>       int shift = 0;
> -    reserved_va = strtoul(arg, &p, 0);
> +    unsigned long val;
> +
> +    val = strtoul(arg, &p, 0);
>       switch (*p) {
>       case 'k':
>       case 'K':
> @@ -393,10 +393,10 @@ static void handle_arg_reserved_va(const char *arg)
>           break;
>       }
>       if (shift) {
> -        unsigned long unshifted = reserved_va;
> +        unsigned long unshifted = val;
>           p++;
> -        reserved_va <<= shift;
> -        if (reserved_va >> shift != unshifted) {
> +        val <<= shift;
> +        if (val >> shift != unshifted) {
>               fprintf(stderr, "Reserved virtual address too big\n");
>               exit(EXIT_FAILURE);
>           }
> @@ -405,6 +405,8 @@ static void handle_arg_reserved_va(const char *arg)
>           fprintf(stderr, "Unrecognised -R size suffix '%s'\n", p);
>           exit(EXIT_FAILURE);
>       }
> +    /* The representation is size - 1, with 0 remaining "default". */
> +    reserved_va = val ? val - 1 : 0;
>   }
>   
>   static void handle_arg_singlestep(const char *arg)
> @@ -793,7 +795,7 @@ int main(int argc, char **argv, char **envp)
>        */
>       max_reserved_va = MAX_RESERVED_VA(cpu);
>       if (reserved_va != 0) {
> -        if (reserved_va % qemu_host_page_size) {
> +        if ((reserved_va + 1) % qemu_host_page_size) {
>               char *s = size_to_str(qemu_host_page_size);
>               fprintf(stderr, "Reserved virtual address not aligned mod %s\n", s);
>               g_free(s);
> @@ -804,11 +806,8 @@ int main(int argc, char **argv, char **envp)
>               exit(EXIT_FAILURE);
>           }
>       } else if (HOST_LONG_BITS == 64 && TARGET_VIRT_ADDR_SPACE_BITS <= 32) {
> -        /*
> -         * reserved_va must be aligned with the host page size
> -         * as it is used with mmap()
> -         */
> -        reserved_va = max_reserved_va & qemu_host_page_mask;
> +        /* MAX_RESERVED_VA + 1 is a large power of 2, so is aligned. */
> +        reserved_va = max_reserved_va;
>       }
>   
>       {
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 995146f60d..0aa8ae7356 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -283,7 +283,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
>       end_addr = start + size;
>       if (start > reserved_va - size) {
>           /* Start at the top of the address space.  */
> -        end_addr = ((reserved_va - size) & -align) + size;
> +        end_addr = ((reserved_va + 1 - size) & -align) + size;
>           looped = true;
>       }
>   
> @@ -297,7 +297,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size,
>                   return (abi_ulong)-1;
>               }
>               /* Re-start at the top of the address space.  */
> -            addr = end_addr = ((reserved_va - size) & -align) + size;
> +            addr = end_addr = ((reserved_va + 1 - size) & -align) + size;
>               looped = true;
>           } else {
>               prot = page_get_flags(addr);

This patch breaks something.

In LTP (20230127), fcntl36 fails now (all archs):

sudo unshare --time --ipc --uts --pid --fork --kill-child --mount --mount-proc --root 
chroot/m68k/sid
# /opt/ltp/testcases/bin/fcntl36

tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
fcntl36.c:288: TINFO: OFD read lock vs OFD write lock
tst_kernel.c:87: TINFO: uname.machine=m68k kernel is 32bit
fcntl36.c:366: TPASS: Access between threads synchronized
fcntl36.c:288: TINFO: OFD write lock vs POSIX write lock
fcntl36.c:318: TBROK: pthread_create(0x40800330,(nil),0x80004328,0x40800068) failed: 
EAGAIN/EWOULDBLOCK

Expected result:

tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
fcntl36.c:289: TINFO: OFD read lock vs OFD write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD read lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs POSIX read lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD write lock vs OFD write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD r/w lock vs POSIX write lock
fcntl36.c:367: TPASS: Access between threads synchronized
fcntl36.c:289: TINFO: OFD r/w lock vs POSIX read lock
fcntl36.c:367: TPASS: Access between threads synchronized

Thanks,
Laurent


