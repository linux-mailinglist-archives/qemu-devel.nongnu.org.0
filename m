Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BB5FABCB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 07:04:24 +0200 (CEST)
Received: from localhost ([::1]:38028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi7RH-0004Ex-D6
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 01:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oi7PM-00020J-JL
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:02:24 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oi7PD-0003ND-VB
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:02:24 -0400
Received: by mail-pj1-x102b.google.com with SMTP id pq16so11522068pjb.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 22:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ChkVII9hRKnSebw7iEwTFp3kBuEw1C1yTBRz7VGiOk=;
 b=ibmzJuO/+wmBJtprMyynEb51vm5/smYFXalE3zDTbJce0s1xHt/fBRUfmmAJXOGNsQ
 /mqMUCgbTOMx8EQ5wHglUfwZcOIA78XIBzzUWP/2+p9PuJ8eKryzelj2RyLzzcOOVN24
 efywbF4na6ASLgTY+BmnYLYnGSVIrc0xMqSgrz3UvgOXhh8ybQEVHloqB8Va13N1EFK/
 7ZjmBQShIrM5sTuUCJrW22UIOYc2YpENFOJLdyDvrTSg0Lny8uMyBQUAAX/fGHIIZyUK
 pcST56p7Sm/2itKozDEtnyLSzGeAavfcLxmk/gyy8xWv1an2JwxAah7txgSoMT8b0AUb
 o33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ChkVII9hRKnSebw7iEwTFp3kBuEw1C1yTBRz7VGiOk=;
 b=0je5+Tou6jFQgqeWi3JbleGDOSbr/MdIm8UZ68RD3iq1syVD7Fg4D2s9+s8OxoC8JU
 cL4A7XH6xmwKOyLNk96TLln7ph+DHygJSdbZzbFecxTEYg1LVDk+YdNHjLar854YGWlG
 HCo42zGScBS86tsjyhttiM3GaqZ5lQZDzbqaVihi/cv2tHCqrn9hot97wQWHUWFngMzU
 y7CI+OajeRJF19WUMG2vuzrrDtv6Za40C+EUdnoDt6DfKMeF1fuW5QG+ln+nzoETix1P
 KnzxSJ62rR7PGiDPInc1IJTlznWvjVJWw2yyYLsn5JeWjcYy5hS+/ovltdXqjojMJKpk
 aI0A==
X-Gm-Message-State: ACrzQf0z9REyK92vrjsBl/+6qNmRj6T7EuWrYciwiEAWJeqGFnQwl7zk
 7D5kjJF/Ap5r7uzWh7VbvyxC7CmM7QY7nyl+BWRvl9F6kaSK/g==
X-Google-Smtp-Source: AMsMyM4lqC2PN3lhN3HC1J87nTzXN+WNBdDFkdYbW9JKTjR75/iplgqpdWxH/t5GO9blLqPmiet/Gx/YbxV83VqRI88=
X-Received: by 2002:a17:902:8693:b0:17a:f71:98fd with SMTP id
 g19-20020a170902869300b0017a0f7198fdmr22566479plo.25.1665464533879; Mon, 10
 Oct 2022 22:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221004141051.110653-1-richard.henderson@linaro.org>
 <20221004141051.110653-9-richard.henderson@linaro.org>
In-Reply-To: <20221004141051.110653-9-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Oct 2022 15:01:47 +1000
Message-ID: <CAKmqyKOoYbOispd4RxF9wBv-J3Wm0Go8TCPR9HZ4Ph8_f7FK=g@mail.gmail.com>
Subject: Re: [PATCH v7 08/18] accel/tcg: Introduce tlb_set_page_full
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 5, 2022 at 1:11 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have collected all of the page data into
> CPUTLBEntryFull, provide an interface to record that
> all in one go, instead of using 4 arguments.  This interface
> allows CPUTLBEntryFull to be extended without having to
> change the number of arguments.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-defs.h | 14 +++++++++++
>  include/exec/exec-all.h | 22 ++++++++++++++++++
>  accel/tcg/cputlb.c      | 51 ++++++++++++++++++++++++++---------------
>  3 files changed, 69 insertions(+), 18 deletions(-)
>
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index f70f54d850..5e12cc1854 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -148,7 +148,21 @@ typedef struct CPUTLBEntryFull {
>       *     + the offset within the target MemoryRegion (otherwise)
>       */
>      hwaddr xlat_section;
> +
> +    /*
> +     * @phys_addr contains the physical address in the address space
> +     * given by cpu_asidx_from_attrs(cpu, @attrs).
> +     */
> +    hwaddr phys_addr;
> +
> +    /* @attrs contains the memory transaction attributes for the page. *=
/
>      MemTxAttrs attrs;
> +
> +    /* @prot contains the complete protections for the page. */
> +    uint8_t prot;
> +
> +    /* @lg_page_size contains the log2 of the page size. */
> +    uint8_t lg_page_size;
>  } CPUTLBEntryFull;
>
>  /*
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index d255d69bc1..b1b920a713 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -257,6 +257,28 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUSt=
ate *cpu,
>                                                 uint16_t idxmap,
>                                                 unsigned bits);
>
> +/**
> + * tlb_set_page_full:
> + * @cpu: CPU context
> + * @mmu_idx: mmu index of the tlb to modify
> + * @vaddr: virtual address of the entry to add
> + * @full: the details of the tlb entry
> + *
> + * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
> + * @full must be filled, except for xlat_section, and constitute
> + * the complete description of the translated page.
> + *
> + * This is generally called by the target tlb_fill function after
> + * having performed a successful page table walk to find the physical
> + * address and attributes for the translation.
> + *
> + * At most one entry for a given virtual address is permitted. Only a
> + * single TARGET_PAGE_SIZE region is mapped; @full->lg_page_size is only
> + * used by tlb_flush_page.
> + */
> +void tlb_set_page_full(CPUState *cpu, int mmu_idx, target_ulong vaddr,
> +                       CPUTLBEntryFull *full);
> +
>  /**
>   * tlb_set_page_with_attrs:
>   * @cpu: CPU to add this TLB entry for
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index e3ee4260bd..361078471b 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1095,16 +1095,16 @@ static void tlb_add_large_page(CPUArchState *env,=
 int mmu_idx,
>      env_tlb(env)->d[mmu_idx].large_page_mask =3D lp_mask;
>  }
>
> -/* Add a new TLB entry. At most one entry for a given virtual address
> +/*
> + * Add a new TLB entry. At most one entry for a given virtual address
>   * is permitted. Only a single TARGET_PAGE_SIZE region is mapped, the
>   * supplied size is only used by tlb_flush_page.
>   *
>   * Called from TCG-generated code, which is under an RCU read-side
>   * critical section.
>   */
> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
> -                             hwaddr paddr, MemTxAttrs attrs, int prot,
> -                             int mmu_idx, target_ulong size)
> +void tlb_set_page_full(CPUState *cpu, int mmu_idx,
> +                       target_ulong vaddr, CPUTLBEntryFull *full)
>  {
>      CPUArchState *env =3D cpu->env_ptr;
>      CPUTLB *tlb =3D env_tlb(env);
> @@ -1117,35 +1117,36 @@ void tlb_set_page_with_attrs(CPUState *cpu, targe=
t_ulong vaddr,
>      CPUTLBEntry *te, tn;
>      hwaddr iotlb, xlat, sz, paddr_page;
>      target_ulong vaddr_page;
> -    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
> -    int wp_flags;
> +    int asidx, wp_flags, prot;
>      bool is_ram, is_romd;
>
>      assert_cpu_is_self(cpu);
>
> -    if (size <=3D TARGET_PAGE_SIZE) {
> +    if (full->lg_page_size <=3D TARGET_PAGE_BITS) {
>          sz =3D TARGET_PAGE_SIZE;
>      } else {
> -        tlb_add_large_page(env, mmu_idx, vaddr, size);
> -        sz =3D size;
> +        sz =3D (hwaddr)1 << full->lg_page_size;
> +        tlb_add_large_page(env, mmu_idx, vaddr, sz);
>      }
>      vaddr_page =3D vaddr & TARGET_PAGE_MASK;
> -    paddr_page =3D paddr & TARGET_PAGE_MASK;
> +    paddr_page =3D full->phys_addr & TARGET_PAGE_MASK;
>
> +    prot =3D full->prot;
> +    asidx =3D cpu_asidx_from_attrs(cpu, full->attrs);
>      section =3D address_space_translate_for_iotlb(cpu, asidx, paddr_page=
,
> -                                                &xlat, &sz, attrs, &prot=
);
> +                                                &xlat, &sz, full->attrs,=
 &prot);
>      assert(sz >=3D TARGET_PAGE_SIZE);
>
>      tlb_debug("vaddr=3D" TARGET_FMT_lx " paddr=3D0x" TARGET_FMT_plx
>                " prot=3D%x idx=3D%d\n",
> -              vaddr, paddr, prot, mmu_idx);
> +              vaddr, full->phys_addr, prot, mmu_idx);
>
>      address =3D vaddr_page;
> -    if (size < TARGET_PAGE_SIZE) {
> +    if (full->lg_page_size < TARGET_PAGE_BITS) {
>          /* Repeat the MMU check and TLB fill on every access.  */
>          address |=3D TLB_INVALID_MASK;
>      }
> -    if (attrs.byte_swap) {
> +    if (full->attrs.byte_swap) {
>          address |=3D TLB_BSWAP;
>      }
>
> @@ -1236,8 +1237,10 @@ void tlb_set_page_with_attrs(CPUState *cpu, target=
_ulong vaddr,
>       * subtract here is that of the page base, and not the same as the
>       * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
>       */
> +    desc->fulltlb[index] =3D *full;
>      desc->fulltlb[index].xlat_section =3D iotlb - vaddr_page;
> -    desc->fulltlb[index].attrs =3D attrs;
> +    desc->fulltlb[index].phys_addr =3D paddr_page;
> +    desc->fulltlb[index].prot =3D prot;
>
>      /* Now calculate the new entry */
>      tn.addend =3D addend - vaddr_page;
> @@ -1272,9 +1275,21 @@ void tlb_set_page_with_attrs(CPUState *cpu, target=
_ulong vaddr,
>      qemu_spin_unlock(&tlb->c.lock);
>  }
>
> -/* Add a new TLB entry, but without specifying the memory
> - * transaction attributes to be used.
> - */
> +void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
> +                             hwaddr paddr, MemTxAttrs attrs, int prot,
> +                             int mmu_idx, target_ulong size)
> +{
> +    CPUTLBEntryFull full =3D {
> +        .phys_addr =3D paddr,
> +        .attrs =3D attrs,
> +        .prot =3D prot,
> +        .lg_page_size =3D ctz64(size)
> +    };
> +
> +    assert(is_power_of_2(size));

I'm hitting this assert with embedded RISC-V machines using PMP

What's happening is that I'm going through riscv_cpu_tlb_fill() for a
single stage machine mode (no MMU) lookup. This calls
get_physical_address_pmp(), which then calls pmp_is_range_in_tlb() to
determine the tlb size.

That ends up in pmp_get_tlb_size() with

pmp_sa: 0x10004abc
pmp_ea: 0x1000ffff
tlb_sa: 0x10004000
tlb_ea: 0x10004fff

So we take the:

    if (pmp_sa >=3D tlb_sa && pmp_sa <=3D tlb_ea && pmp_ea >=3D tlb_ea) {
        return tlb_ea - pmp_sa + 1;
    }

path and return 1348 (0x544) for the tlb size, which isn't a multiple of 2.

Any ideas of what to do here?

Alistair

