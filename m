Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8255337C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 15:20:23 +0200 (CEST)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3dnp-0004AO-Vc
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 09:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3daN-0004tN-Ce
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:06:28 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:57061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3daK-0006Qn-Ll
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 09:06:26 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mgek8-1nTEUo132S-00h4D6; Tue, 21 Jun 2022 15:05:46 +0200
Message-ID: <e8973e76-080b-babb-a9fc-ac2623240762@vivier.eu>
Date: Tue, 21 Jun 2022 15:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Simon Hausmann <Simon.Hausmann@qt.io>, Chris Fallin <chris@cfallin.org>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20220620224936.52623-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Add partial support for MADV_DONTNEED
In-Reply-To: <20220620224936.52623-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mRf6Qm/EfYdUN+ySE2qen2EnKtzNCzQ9ErzoKbgvGvyvdKyLD7O
 xQvOEYjA/3gOpc+eIVBZQGJY1uL2w2mU1rnZMLgqRlQKYSBzEL5k1pWwXf2tIXFsUFy98mS
 FpiQkr7Oxt0YFeTRBcYsMsErW91+TSUmeHDoBQ7ATqeTuy03wD1xI26ORnhqM5BNDtdOUkm
 LUPGVt18DJwlrW3xszvuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+UbC4PavQlY=:d3zv47AEbKbKz79lDkXzM4
 l7m0cmxPsTum9wSSUlCZwOT2yr6q2WwKhmc3LvUdrJLHKipMN92ZnGyDqKJo/fPIZBKvnsZJs
 du9oFQ1A19zS1D+E3WglCgOMwEoSeKEUrhCvwFVoESpdq0NWnHoMWzN038P5JNpIgac3ewHNZ
 giY1lgRFaQySTyVPd0rfj0pXPgdUsBV19MqMIYFKQBbcE9Z5kfFRS40Z3kWTT7GaxhY9NscLx
 JRW7wCMJM1M6q3ejgm+Bh1bxytoAcDc8eJ30uEOZw2VJD4yiTmbGRMB8Ufe6dw8R+r3agAs3+
 v8MXLrwjwJCSjb3E1+OrZXz/GTQ+iiSgKZCOii+xQHs2oPlsnyMjdu2VfeNqZv2valexS+MgO
 iiG/Atrh+dLB9HZRaaq1yoz4ynes6hgs/taTMXxFeYT73mxk18yO9+jpbuaZvYXZeNNIxhXxc
 7hFWty669jOfcQX6T1m/4UYFsnu9/hLWLvma6bA3UYp/AyYcX1KTyMebxYE8f35w9cMwIqvdu
 Yy4AFU+CMbUXmsSNwOJ1QUTvKkKbgFXWgZ8rmOvp06zCa0DbRu8gTp9aySaygliaxVHAfC8zb
 bk/4xZ8A2f8RbAilZOjP5T8Yc0QFJqRjE/gJk5tprFdY7TTNHrfhmRL16+Yg6DINTrw/N4QZg
 DlXnt6eIRgGTzeYarfbHDhnjt9mhVeBxJb4n6Dw5MAVzO5aWnBFSMvLgDXftfeoCrWPbzYCIz
 LCq9xH1EYfNMxTHuaP9LgzjLLS4mw0c7Y7RVvg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2022 à 00:49, Ilya Leoshkevich a écrit :
> Currently QEMU ignores madvise(MADV_DONTNEED), which break apps that
> rely on this for zeroing out memory [1]. Improve the situation by doing
> a passthrough when the range in question is a host-page-aligned
> anonymous mapping.
> 
> This is based on the patches from Simon Hausmann [2] and Chris Fallin
> [3]. The structure is taken from Simon's patch. The PAGE_MAP_ANONYMOUS
> bits are superseded by commit 26bab757d41b ("linux-user: Introduce
> PAGE_ANON"). In the end the patch acts like the one from Chris: we
> either pass-through the entire syscall, or do nothing, since doing this
> only partially would not help the affected applications much. Finally,
> add some extra checks to match the behavior of the Linux kernel [4].
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/326
> [2] https://patchew.org/QEMU/20180827084037.25316-1-simon.hausmann@qt.io/
> [3] https://github.com/bytecodealliance/wasmtime/blob/v0.37.0/ci/qemu-madvise.patch
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/madvise.c?h=v5.19-rc3#n1368
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/mmap.c      | 68 ++++++++++++++++++++++++++++++++++++++++++
>   linux-user/syscall.c   |  6 +---
>   linux-user/user-mmap.h |  1 +
>   3 files changed, 70 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 48e1373796..900df7b28c 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -835,3 +835,71 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>       mmap_unlock();
>       return new_addr;
>   }
> +
> +static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
> +{
> +    ulong addr;
> +
> +    if ((start | end) & ~qemu_host_page_mask) {
> +        return false;
> +    }
> +
> +    for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
> +        if (!(page_get_flags(addr) & PAGE_ANON)) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +int target_madvise(abi_ulong start, abi_ulong len_in, int advice)
> +{
> +    abi_ulong len, end;
> +    int ret = 0;
> +
> +    if (start & ~TARGET_PAGE_MASK) {
> +        errno = EINVAL;
> +        return -1;

You should remove the "errno = EINVAL" and return -TARGET_EINVAL.

> +    }
> +    len = TARGET_PAGE_ALIGN(len_in);
> +
> +    if (len_in && !len) {
> +        errno = EINVAL;
> +        return -1;

return -TARGET_EINVAL

> +    }
> +
> +    end = start + len;
> +    if (end < start) {
> +        errno = EINVAL;
> +        return -1;

return -TARGET_EINVAL

> +    }
> +
> +    if (end == start) {
> +        return 0;
> +    }
> +
> +    if (!guest_range_valid_untagged(start, len)) {
> +        errno = EINVAL;
> +        return -1;

return -TARGET_EINVAL

> +    }
> +
> +    /*
> +     * A straight passthrough may not be safe because qemu sometimes turns
> +     * private file-backed mappings into anonymous mappings.
> +     *
> +     * This is a hint, so ignoring and returning success is ok.
> +     *
> +     * This breaks MADV_DONTNEED, completely implementing which is quite
> +     * complicated. However, there is one low-hanging fruit: host-page-aligned
> +     * anonymous mappings. In this case passthrough is safe, so do it.
> +     */
> +    mmap_lock();
> +    if ((advice & MADV_DONTNEED) &&
> +        can_passthrough_madv_dontneed(start, end)) {
> +        ret = madvise(g2h_untagged(start), len, MADV_DONTNEED);

ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));

> +    }
> +    mmap_unlock();
> +
> +    return ret;
> +}
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f55cdebee5..d25759b992 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11807,11 +11807,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>   
>   #ifdef TARGET_NR_madvise
>       case TARGET_NR_madvise:
> -        /* A straight passthrough may not be safe because qemu sometimes
> -           turns private file-backed mappings into anonymous mappings.
> -           This will break MADV_DONTNEED.
> -           This is a hint, so ignoring and returning success is ok.  */
> -        return 0;
> +        return get_errno(target_madvise(arg1, arg2, arg3));

return target_madvise(arg1, arg2, arg3);

>   #endif
>   #ifdef TARGET_NR_fcntl64
>       case TARGET_NR_fcntl64:
> diff --git a/linux-user/user-mmap.h b/linux-user/user-mmap.h
> index d1dec99c02..41cd358c7a 100644
> --- a/linux-user/user-mmap.h
> +++ b/linux-user/user-mmap.h
> @@ -25,6 +25,7 @@ int target_munmap(abi_ulong start, abi_ulong len);
>   abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
>                          abi_ulong new_size, unsigned long flags,
>                          abi_ulong new_addr);
> +int target_madvise(abi_ulong start, abi_ulong len_in, int advice);
>   extern unsigned long last_brk;
>   extern abi_ulong mmap_next_start;
>   abi_ulong mmap_find_vma(abi_ulong, abi_ulong, abi_ulong);

Except comments above, it looks good.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

