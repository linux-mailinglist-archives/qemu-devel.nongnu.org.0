Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5E6A9C0A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:46:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8XC-0000w2-0p; Fri, 03 Mar 2023 11:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8X5-0000v1-3E
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:45:26 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8X0-00017i-Uf
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:45:20 -0500
Received: by mail-pg1-x52c.google.com with SMTP id z10so1844735pgr.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677861916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5AsZeK2k4xWOD39wHeOZN9susZ6CW+VBTmZIYhdUWto=;
 b=c0939mhKHDK49UXpXz1UsdRe5K/Oan5/PcZrdPn63ZtJzqBFKXNr8R3SuZdQIbxMIA
 gyrrgyXT66khszlFS+5QdHdvunQaNl935bZvs5hGtJ22PdikKFcMfkLDTI0lSN7Yr3f0
 kJV+L9eduAqGjHYUXkaFKB0GW1S7unDo84h3vhDSvyXYpkc7aLgLkCOkzzPjdw2zcDuk
 TRFKMbCv8a+UdNAkUZCIeYD13hltwDPeWsu/ng+eW8lYnjU4pDkP+yeRKyYJbWeou4Vd
 tRjfwuye9NGUAC6GkxYHZJsha4Kb9AMKsGe9XCbTm9gky18ZOqppbEHEs0aIryVBYrNg
 ks5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677861916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5AsZeK2k4xWOD39wHeOZN9susZ6CW+VBTmZIYhdUWto=;
 b=TK4oD6P3JMAtYwq7pmhwCaedCkPVwrXKGWejOFybqK/+FwmZaU1Dg6KnqSuIK9ANLT
 0KcnfdDTXyme0z0S6aT2OnzaDVo3DvFb0lK5MZrjOocJjShOtQnEnQ5qfTBfQ7yk5f2V
 TcymMyTR4LiCGG5V6OZ4KLgybH9vUxIQcsD7EbPle9OEpQ+XDvaUgnAoGzorlIyqzbTh
 Pijp13MPt4x9Xohq+Q4LcF7YPUc5PumzP95vvyOffI2vxlM0hJzY3ckdHMzCrQqcvkVp
 AVYdg+4LsPih85IJEpCIFpPdzUImNInZ3S1zE5vG9qlCavYrMn0+Y5HSiTvtHGxLM3Cc
 5Aog==
X-Gm-Message-State: AO0yUKXI74E0kVmD/6ShDLn0P9qdIpk5R3xXjOLMB1XD6NCC12Dm5IhA
 RJeuCFm0UJT/lcUTjYW93NGQdyXzo2A3CqyraSOjbg==
X-Google-Smtp-Source: AK7set/FPFRWk7N1lNcl6jgyhgmxZARmSYq11taOyPj9x4zE847U0ZXlxsG3DEVnyqkuWbO5g9B/w7oXGVKnlOSvUaY=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr730337pgh.9.1677861916379; Fri, 03 Mar
 2023 08:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-4-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:45:05 +0000
Message-ID: <CAFEAcA9jhHX7r9FcB8ZyGimN3XGLX=rEONC3jYK=n2JTmj+SSg@mail.gmail.com>
Subject: Re: [PATCH 03/13] accel/tcg: Store some tlb flags in CPUTLBEntryFull
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 23 Feb 2023 at 20:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have run out of bits we can use within the CPUTLBEntry comparators,
> as TLB_FLAGS_MASK cannot overlap alignment.
>
> Store slow_flags[] in CPUTLBEntryFull, and merge with the flags from
> the comparator.  A new TLB_FORCE_SLOW bit is set within the comparator
> as an indication that the slow path must be used.
>
> Move TLB_BSWAP to TLB_SLOW_FLAGS_MASK.  Since we are out of bits,
> we cannot create a new bit without moving an old one.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> @@ -1249,36 +1265,27 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
>       * vaddr we add back in io_readx()/io_writex()/get_page_addr_code().
>       */
>      desc->fulltlb[index] = *full;
> -    desc->fulltlb[index].xlat_section = iotlb - vaddr_page;
> -    desc->fulltlb[index].phys_addr = paddr_page;
> +    full = &desc->fulltlb[index];
> +    full->xlat_section = iotlb - vaddr_page;
> +    full->phys_addr = paddr_page;
>
>      /* Now calculate the new entry */
>      tn.addend = addend - vaddr_page;
> -    if (prot & PAGE_READ) {
> -        tn.addr_read = address;
> -        if (wp_flags & BP_MEM_READ) {
> -            tn.addr_read |= TLB_WATCHPOINT;
> -        }
> -    } else {
> -        tn.addr_read = -1;
> -    }
>
> -    if (prot & PAGE_EXEC) {
> -        tn.addr_code = address;
> -    } else {
> -        tn.addr_code = -1;
> -    }
> +    tlb_set_compare(full, &tn, vaddr_page, read_flags,
> +                    MMU_INST_FETCH, prot & PAGE_EXEC);
>
> -    tn.addr_write = -1;
> -    if (prot & PAGE_WRITE) {
> -        tn.addr_write = write_address;
> -        if (prot & PAGE_WRITE_INV) {
> -            tn.addr_write |= TLB_INVALID_MASK;
> -        }
> -        if (wp_flags & BP_MEM_WRITE) {
> -            tn.addr_write |= TLB_WATCHPOINT;
> -        }
> +    if (wp_flags & BP_MEM_READ) {
> +        read_flags |= TLB_WATCHPOINT;
>      }
> +    tlb_set_compare(full, &tn, vaddr_page, read_flags,
> +                    MMU_DATA_LOAD, prot & PAGE_READ);
> +
> +    if (wp_flags & BP_MEM_WRITE) {
> +        write_flags |= TLB_WATCHPOINT;
> +    }
> +    tlb_set_compare(full, &tn, vaddr_page, write_flags, MMU_DATA_STORE,
> +                    (prot & PAGE_WRITE) && !(prot & PAGE_WRITE_INV));

So in the old code, if PAGE_WRITE_INV then we set up the
addr_write field as normal, it just also has the TLB_INVALID_MASK bit
set. In the new code we won't do that, we'll set addr_write to -1.
I'm not fully familiar with the cputlb.c code, but doesn't this
break the code in probe_access_internal(), which assumes that
it can call tlb_fill (which will come through here) and then
fish out the TLB entry, clear out the TLB_INVALID_MASK bit and
use the TLB entry as a one-off ?

thanks
-- PMM

