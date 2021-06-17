Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FBF3ABCCA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:32:16 +0200 (CEST)
Received: from localhost ([::1]:51356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxkN-0006sK-Pq
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltxbT-0001Dp-G4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:23:03 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltxbP-0003TI-EG
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:23:03 -0400
Received: by mail-ej1-x636.google.com with SMTP id ji1so5717107ejc.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zrG7L2FV1w06vgFqT2/2igabM5UFxRrsRY1/b1/itlw=;
 b=Z02Li6Sj1Xfx6Rj76S1+fPAE2dtulmmZRlNko4G5rFdTffugDnHDBNERNrNj7ml4mN
 fy8eRtN5XYpJXuzlN7qzLyBNyu6xtSW4KS5LrKJEc7/qVgbrpIAAHBA0pfzGuShkSopY
 VzLdh1zWJA8eVY9p/jWsqTcbhOmqtpV4uTnvy9HqwMEZmLo97U1Xnay1sfpXhXjGVtLI
 Bi+sX4mIVVSb7D7Fu1E5vPyGZLqgXfjJVjU2BbJPwNh+LU8CwCds9k/lWI3QxiJDyzXW
 QNsaeWlONJNt0wwXgQfpCT2dBg1s8bc+X35+JK3RPVoYSMl9N05xNx3weX+9CPHePnn+
 JHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zrG7L2FV1w06vgFqT2/2igabM5UFxRrsRY1/b1/itlw=;
 b=fo3nkK5+l2FOx9Ad36s5AwH44mxbY4iZWuDLurNiAdM+E907UJBkru0A45hx7MejDF
 kbSUQpJay5LZO5SnsAxEGv/UH3pTg5GeEt+Rl3uJJP2inzD+Z2uarVmFkMMOqIOXd9Mc
 D8Ko1H7nkaHVrnV2yqS9B3+4Fj7y5atmvBP22JHcidXOGEsKcEp0YprZwsWtEbsNB8o4
 2MSIDYBlnaa+27VKc2nbBsVFhEIbddkiSU79R8uCmXJjLwm4DtJctFFJEO39SWQmaRYT
 KZ0DL3cGkCz1L6O2JHIdG1qZUZ2zq5bqNkPODTsA0K2V81PlsxfMvEdVHeh8XAbzbCDI
 bvww==
X-Gm-Message-State: AOAM533t6kF/uYRDhHojm3gEj4aAmAgwuFfB7Z7NocKz6sWtPO8m4lbq
 15p658RHR3mcx+UVo2tjG+QGDczHt1i3FR84ZxjP8Q==
X-Google-Smtp-Source: ABdhPJxuN4fra0d/FWB8RmAe30NkrF/588AqN6xC4XJ5ryWBG4+CIcUsNZr/NhRx1Gz2QBPcBCcfgWshjvThaqX9K7M=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr5259049ejc.85.1623957776114; 
 Thu, 17 Jun 2021 12:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210615165800.23265-1-alex.bennee@linaro.org>
 <20210615165800.23265-2-alex.bennee@linaro.org>
In-Reply-To: <20210615165800.23265-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jun 2021 20:22:20 +0100
Message-ID: <CAFEAcA8t8q8pJNOOYK-zkDtME7hOWfXVUj3+HLVMRkFzY6Ei1g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021 at 18:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The previous numbers were a guess at best and rather arbitrary without
> taking into account anything that might be loaded. Instead of using
> guesses based on the state of registers implement a new function that
> scans MemoryRegions for the RAM of the current address space and then
> looks for the lowest address above any ROM blobs (which include
> -kernel loaded code).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andrew Strauss <astrauss11@gmail.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - report some known information (limits)
>   - reword the commit message
> v3
>   - rework to use the ROM blob scanning suggested by Peter
>   - drop arch specific wrappers
>   - dropped rb/tb tags as it's a rework
> ---
>  include/hw/loader.h           |  10 +++
>  hw/core/loader.c              |  19 +++++
>  semihosting/arm-compat-semi.c | 131 ++++++++++++++++++----------------
>  3 files changed, 99 insertions(+), 61 deletions(-)
>
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index cbfc184873..037828e94d 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -349,4 +349,14 @@ int rom_add_option(const char *file, int32_t bootind=
ex);
>   * overflow on real hardware too. */
>  #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
>
> +/**
> + * rom_find_highest_addr: return highest address of ROM in region
> + *
> + * This function is used to find the highest ROM address (or loaded
> + * blob) so we can advise where true heap memory may be.
> + *
> + * Returns: highest found address in region
> + */
> +hwaddr rom_find_highest_addr(hwaddr base, size_t size);
> +
>  #endif
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 5b34869a54..05003556ee 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1310,6 +1310,25 @@ static Rom *find_rom(hwaddr addr, size_t size)
>      return NULL;
>  }
>
> +hwaddr rom_find_highest_addr(hwaddr base, size_t size)
> +{
> +    Rom *rom;
> +    hwaddr lowest =3D base;
> +
> +    QTAILQ_FOREACH(rom, &roms, next) {

You should ignore roms with rom->mr non-NULL (which are rom blobs
that have been set up to be loaded into a specific MR), and ones with
fw_file non NULL (which are rom blobs that have been set up to be
loaded into the fw_cfg device).

> +        if (rom->addr < base) {
> +            continue;
> +        }
> +        if (rom->addr + rom->romsize > base + size) {
> +            continue;
> +        }

This will incorrectly ignore ROM blobs that start below
'base' but end partway through it, as well as blobs that
start within the region but end after it.

> +        if (rom->addr + rom->romsize > lowest) {
> +            lowest =3D rom->addr + rom->romsize;
> +        }
> +    }

There's a cute algorithm (suggested by a friend) which you could
use to find the largest unoccupied chunk of (base, size) rather than
merely looking for the unoccupied part at the top of it:

(1) iterate through the rom list, constructing a list of tuples
(hwaddr addr, int count). For every relevant rom, add two entries
to the tuple list: (rom->addr, 1) and (rom->addr + rom->romsize, -1)
(2) Sort the tuple list by addr; break ties by sorting (x,1) before (x,-1)
(3) Set gapstart to 0.
(4) iterate through the sorted tuple list, keeping a running count
(increment the count for each (x, 1) tuple, decrement for (x, -1) tuples).
If the count goes from 0 to 1, you've just left an empty section of
the range, and there was a gap from gapstart to x-1 (so if that's the
largest gap you've seen so far, remember it). If the count goes from
1 to 0, that's the beginning of a new gap, so set gapstart to x.
(5) Return whatever is the largest gap we saw.

Exercises for the reader:
 (a) locate any off-by-one errors in the above sketch
 (b) account for the fact that gaps outside our (base,size)
     are of no use to us and should be ignored, and gaps that
     overlap with our range need to be clipped
 (c) decide whether you think this is worth doing :-)

> +    return lowest;
> +}
> +
>  /*
>   * Copies memory from registered ROMs to dest. Any memory that is contai=
ned in
>   * a ROM between addr and addr + size is copied. Note that this can invo=
lve
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 1c29146dcf..a276161181 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -44,6 +44,7 @@
>  #else
>  #include "exec/gdbstub.h"
>  #include "qemu/cutils.h"
> +#include "hw/loader.h"
>  #ifdef TARGET_ARM
>  #include "hw/arm/boot.h"
>  #endif
> @@ -144,33 +145,71 @@ typedef struct GuestFD {
>  static GArray *guestfd_array;
>
>  #ifndef CONFIG_USER_ONLY
> -#include "exec/address-spaces.h"
> -/*
> - * Find the base of a RAM region containing the specified address
> +
> +/**
> + * common_semi_find_bases: find information about ram and heap base
> + *
> + * This function attempts to provide meaningful numbers for RAM and
> + * HEAP base addresses. The rambase is simply the lowest addressable
> + * RAM position. For the heapbase we scan though the address space and
> + * return the first available address above any ROM regions created by
> + * the loaders.
> + *
> + * Returns: a structure with the numbers we need.
>   */
> -static inline hwaddr
> -common_semi_find_region_base(hwaddr addr)
> +
> +typedef struct LayoutInfo {
> +    target_ulong rambase;
> +    size_t ramsize;
> +    target_ulong heapbase;
> +    target_ulong heaplimit;
> +    target_ulong stackbase;
> +    target_ulong stacklimit;

You should work in 'hwaddr's at least while you're working with
addresses from the memory subsystem; convert to target_ulong only
at the end (and it would probably be a good idea to catch the
improbable case of "turns out the RAM we found for the heap is
beyond the range of a target_ulong"...)

> +} LayoutInfo;
> +
> +static bool find_ram_cb(Int128 start, Int128 len, const MemoryRegion *mr=
,
> +                        hwaddr offset_in_region, void *opaque)
>  {
> -    MemoryRegion *subregion;
> +    LayoutInfo *info =3D (LayoutInfo *) opaque;
> +
> +    if (!mr->ram || mr->readonly) {
> +        return false;
> +    }
> +
> +    info->rambase =3D mr->addr;
> +    info->ramsize =3D int128_get64(len);
> +
> +    return true;

This will pick the first MR it finds that happens to be RAM (which
could be some tiny thing). You don't want that, you want specifically
whatever the board decided was the system RAM, which is the MemoryRegion
MachineState::ram.

mr->addr is also not the address of the MR in the flatview, it's
the address of the MR in its container, which might not start at the
base of the address space.

In this case what we want is the address within the flatrange
of the first visible bit of that MR, which is just 'start'.

> +}
> +
> +static LayoutInfo common_semi_find_bases(CPUState *cs)
> +{
> +    FlatView *fv;
> +    LayoutInfo info =3D { 0, 0, 0, 0, 0, 0 };
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    fv =3D address_space_to_flatview(cs->as);
> +    flatview_for_each_range(fv, find_ram_cb, &info);
>
>      /*
> -     * Find the chunk of R/W memory containing the address.  This is
> -     * used for the SYS_HEAPINFO semihosting call, which should
> -     * probably be using information from the loaded application.
> +     * If we have found the RAM lets iterate through the ROM blobs to
> +     * workout the best place for the remainder of RAM and split it
> +     * equally between stack and heap.
>       */
> -    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
> -                   subregions_link) {
> -        if (subregion->ram && !subregion->readonly) {
> -            Int128 top128 =3D int128_add(int128_make64(subregion->addr),
> -                                       subregion->size);
> -            Int128 addr128 =3D int128_make64(addr);
> -            if (subregion->addr <=3D addr && int128_lt(addr128, top128))=
 {
> -                return subregion->addr;
> -            }
> -        }
> +    if (info.rambase && info.ramsize) {
> +        hwaddr limit =3D info.rambase + info.ramsize;
> +        size_t space;
> +        info.heapbase =3D rom_find_highest_addr(info.rambase, info.ramsi=
ze);
> +        space =3D QEMU_ALIGN_DOWN((limit - info.heapbase) / 2, TARGET_PA=
GE_SIZE);
> +        info.heaplimit =3D info.heapbase + space;
> +        info.stackbase =3D info.rambase + info.ramsize;
> +        info.stacklimit =3D info.stackbase - space;

I don't think we need to divide the memory into separate stack
and heap like this -- guests can probably handle the heaplimit
being the same as the stackbase and the stacklimit being the
same as the heapbase, which is what we've been giving them so far.

>      }
> -    return 0;
> +
> +    return info;

This will recalculate it for every call, but I don't suppose the
guest is going to call it more than once so that's fine.

>  }
> +
>  #endif
>
>  #ifdef TARGET_ARM
> @@ -204,28 +243,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
>      return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
>  }
>
> -#ifndef CONFIG_USER_ONLY
> -#include "hw/arm/boot.h"
> -static inline target_ulong
> -common_semi_rambase(CPUState *cs)
> -{
> -    CPUArchState *env =3D cs->env_ptr;
> -    const struct arm_boot_info *info =3D env->boot_info;
> -    target_ulong sp;
> -
> -    if (info) {
> -        return info->loader_start;
> -    }
> -
> -    if (is_a64(env)) {
> -        sp =3D env->xregs[31];
> -    } else {
> -        sp =3D env->regs[13];
> -    }
> -    return common_semi_find_region_base(sp);
> -}
> -#endif
> -
>  #endif /* TARGET_ARM */
>
>  #ifdef TARGET_RISCV
> @@ -251,17 +268,6 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
>      return (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) =
=3D=3D 8);
>  }
>
> -#ifndef CONFIG_USER_ONLY
> -
> -static inline target_ulong
> -common_semi_rambase(CPUState *cs)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    CPURISCVState *env =3D &cpu->env;
> -    return common_semi_find_region_base(env->gpr[xSP]);
> -}
> -#endif
> -
>  #endif
>
>  /*
> @@ -1165,12 +1171,12 @@ target_ulong do_common_semihosting(CPUState *cs)
>      case TARGET_SYS_HEAPINFO:
>          {
>              target_ulong retvals[4];
> -            target_ulong limit;
>              int i;
>  #ifdef CONFIG_USER_ONLY
>              TaskState *ts =3D cs->opaque;
> +            target_ulong limit;
>  #else
> -            target_ulong rambase =3D common_semi_rambase(cs);
> +            LayoutInfo info =3D common_semi_find_bases(cs);
>  #endif
>
>              GET_ARG(0);
> @@ -1201,12 +1207,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[2] =3D ts->stack_base;
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
> -            limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application. =
 */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> -            retvals[3] =3D rambase; /* Stack limit.  */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */

AIUI this is true for the specific case of "zero heapbase" but
probably not for zero anything else. (That bit of Arm compiler
docs that had a note not in the semihosting spec is apparently
accidentally over-optimistic about what the Arm compiler libc
implementation can handle.) Still, if we have no idea I guess
returning all-zeroes is the best we can do.

> +            retvals[0] =3D info.heapbase; /* Heap Base */
> +            retvals[1] =3D info.heaplimit; /* Heap Limit */
> +            retvals[2] =3D info.stackbase; /* Stack base */
> +            retvals[3] =3D info.stacklimit; /* Stack limit.  */
>  #endif

-- PMM

