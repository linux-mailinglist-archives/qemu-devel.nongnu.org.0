Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED084299C6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 01:22:28 +0200 (CEST)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma4cl-0003LQ-Fg
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 19:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4aT-0002Dj-EE
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 19:20:06 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:33521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4aO-000337-W4
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 19:20:05 -0400
Received: by mail-io1-xd35.google.com with SMTP id n7so12783023iod.0
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 16:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jBwV0nr9Id/PDzZCJjpAPJ/BYNXaGg0ZMaTtTGKEPh4=;
 b=HvUAcrgze7nOk2Q7Ha2qHx2paXKD0zmvZobDIMdJdg3Mr/fZAq8IaZe2fxdh/Qqfv5
 drdRuPll1sDbN3nNmZI3HfTXtVZRBXIXqlV3x6P9INydp6kLHZF3gkLdf1v0OVkYhy59
 Qk1B/Viezfblls+7MzO13R9n9kv5EQ17Fb5k2HxrQwa5XzAA8L05kqWEaxJpaRfp/PcE
 DYvXjEyN5ZJNGn57w6QEYE/olDu5vQdAEROsmXDj2KBZjRCzTdw7F/cWixaUN1NZIznm
 Pzv4KN/qR3Tnsp5tqtJKaWwX9QC7LNxwuZSRf5MGRHAyllsYI7CbRzvV87qBeh0BAHrj
 pytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jBwV0nr9Id/PDzZCJjpAPJ/BYNXaGg0ZMaTtTGKEPh4=;
 b=JikLg7qnFCRv5SVCjfpCRmE6es0T6hAiN/1RLlNe96sWydj6/jlF6ACi4j3Os5GFLZ
 0ZdqYnH3//fCtODlJvo2Px+yNaY3A3XkNWwlCCvfp9moIVC/cpCVGqUnJow/WvjlYywC
 Sg+0KtnRyghxtQnQukUh7zJwBdje1/2NQ1eA0+dfRGLBhLfDNkIVh5WsyiOqsxvvXvbu
 lbUniLC5SP4hW2DlltlRDn3jvNYMugoWgLAg9GcFc3SlCHQuWSpEfdyOTpxRfzJ8hAwB
 G3+rxWyetvf8iBjMPYykWjPhheqECvE26wmuu8die7B4xVUGBWcuNT9BK7+x5DycoQPd
 6P0w==
X-Gm-Message-State: AOAM530r6hvmme8tycLsvMWffVRFdEumkxvdW5zB7wzH1gQDuMQs3GgZ
 MLisd5QpTbKd2j8c/LfvBEpUqDX49loHXbsPE24=
X-Google-Smtp-Source: ABdhPJx4BhzPLe5JoCT0tAHly86hoOQfCGvtBn4uNUmvCnqcod12GbpS0HrdTIncSuBTUXortmWjcbXFJF7hYJxmSWA=
X-Received: by 2002:a05:6638:9a:: with SMTP id
 v26mr6161716jao.18.1633994399524; 
 Mon, 11 Oct 2021 16:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-3-richard.henderson@linaro.org>
In-Reply-To: <20211010174401.141339-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Oct 2021 09:19:33 +1000
Message-ID: <CAKmqyKM1UzoJgpXdwhpfuke7eVDB7DGckPZtW77rPK+h4usuNA@mail.gmail.com>
Subject: Re: [PATCH 2/8] accel/tcg: Split out g2h_tlbe
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: git@xen0n.name, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 3:44 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a new function to combine a CPUTLBEntry addend
> with the guest address to form a host address.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  accel/tcg/cputlb.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 46140ccff3..761f726722 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -90,6 +90,11 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
>      return fast->mask + (1 << CPU_TLB_ENTRY_BITS);
>  }
>
> +static inline uintptr_t g2h_tlbe(const CPUTLBEntry *tlb, target_ulong gaddr)
> +{
> +    return tlb->addend + (uintptr_t)gaddr;
> +}
> +
>  static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
>                               size_t max_entries)
>  {
> @@ -976,8 +981,7 @@ static void tlb_reset_dirty_range_locked(CPUTLBEntry *tlb_entry,
>
>      if ((addr & (TLB_INVALID_MASK | TLB_MMIO |
>                   TLB_DISCARD_WRITE | TLB_NOTDIRTY)) == 0) {
> -        addr &= TARGET_PAGE_MASK;
> -        addr += tlb_entry->addend;
> +        addr = g2h_tlbe(tlb_entry, addr & TARGET_PAGE_MASK);
>          if ((addr - start) < length) {
>  #if TCG_OVERSIZED_GUEST
>              tlb_entry->addr_write |= TLB_NOTDIRTY;
> @@ -1527,7 +1531,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
>          return -1;
>      }
>
> -    p = (void *)((uintptr_t)addr + entry->addend);
> +    p = (void *)g2h_tlbe(entry, addr);
>      if (hostp) {
>          *hostp = p;
>      }
> @@ -1619,7 +1623,7 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>      }
>
>      /* Everything else is RAM. */
> -    *phost = (void *)((uintptr_t)addr + entry->addend);
> +    *phost = (void *)g2h_tlbe(entry, addr);
>      return flags;
>  }
>
> @@ -1727,7 +1731,7 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
>              data->v.io.offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
>          } else {
>              data->is_io = false;
> -            data->v.ram.hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
> +            data->v.ram.hostaddr = (void *)g2h_tlbe(tlbe, addr);
>          }
>          return true;
>      } else {
> @@ -1826,7 +1830,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>          goto stop_the_world;
>      }
>
> -    hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
> +    hostaddr = (void *)g2h_tlbe(tlbe, addr);
>
>      if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
>          notdirty_write(env_cpu(env), addr, size,
> @@ -1938,7 +1942,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
>                              access_type, op ^ (need_swap * MO_BSWAP));
>          }
>
> -        haddr = (void *)((uintptr_t)addr + entry->addend);
> +        haddr = (void *)g2h_tlbe(entry, addr);
>
>          /*
>           * Keep these two load_memop separate to ensure that the compiler
> @@ -1975,7 +1979,7 @@ load_helper(CPUArchState *env, target_ulong addr, MemOpIdx oi,
>          return res & MAKE_64BIT_MASK(0, size * 8);
>      }
>
> -    haddr = (void *)((uintptr_t)addr + entry->addend);
> +    haddr = (void *)g2h_tlbe(entry, addr);
>      return load_memop(haddr, op);
>  }
>
> @@ -2467,7 +2471,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>              notdirty_write(env_cpu(env), addr, size, iotlbentry, retaddr);
>          }
>
> -        haddr = (void *)((uintptr_t)addr + entry->addend);
> +        haddr = (void *)g2h_tlbe(entry, addr);
>
>          /*
>           * Keep these two store_memop separate to ensure that the compiler
> @@ -2492,7 +2496,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
>          return;
>      }
>
> -    haddr = (void *)((uintptr_t)addr + entry->addend);
> +    haddr = (void *)g2h_tlbe(entry, addr);
>      store_memop(haddr, val, op);
>  }
>
> --
> 2.25.1
>
>

