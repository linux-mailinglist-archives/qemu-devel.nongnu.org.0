Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496FE966
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:43:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLAJD-0007OC-Dw
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:43:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLA2I-0000eF-UP
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLA2H-00041L-P9
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:25:50 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLA2H-00040w-CZ
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:25:49 -0400
Received: by mail-oi1-x243.google.com with SMTP id t70so3400603oif.5
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YSKpVbzfQ0fIqgDUYvjBXbgcoHsBD+WCXb+cktmGkgg=;
	b=Fxfv8wYhWL2syRtiXB1zvBjs6OKkfWtzZPj1efa2kHFQ6+hdUEUoigqA3ZqwQzUWcn
	AsiWOOdBhq7hjOZQdxTXsai3WTV9JO+vmrEvugwXpwF64uCUEQ/LQ2VbUwhnwo0WXsaf
	7ssJ/YtYZnZdhcPgXSRWK7iaOWg0x670zhK1vmsk8comekiKAjzeHEaYUrWQMqJuSXsE
	8VkfGFUXtRY2e4J5G3NSgEG3llovaq3zC6qIOoMwdJ/dDSZOK0/bXVmttKb+gfRC4mSm
	rzu8XfA5OGn1IVpABKWIE3TXeLzAJJYcCG7/jmQEHPN+B4pHcRbkITypBVBry4AvDo95
	Svew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YSKpVbzfQ0fIqgDUYvjBXbgcoHsBD+WCXb+cktmGkgg=;
	b=CaEpU8h2vRSB1jYEmQ0bS+sr5D2dfTlTVj5zrBwkSuGcgd6kb8DsGjbTr79TZPLZaj
	RtiR5fnWntSJmUeUtYqcXcD6aEQb0kfRY+ObEFdCEOQX9y50Hm45Cjsy58Rae7SLR3pi
	wS7oovLl4T0Tzn9kyuhy3advA7vOfjywC80hd0eRnfCJQfRWkizKTQMpjqOUWJgvG+y5
	SnLQWhJ/J7sHjyL7jwFOf9cMh66KDSDhIHZvzbyFHM/sihG4lxT9vqc13tbwXXPDtax+
	63GxqfKR7lZHGoqwLK8+8uPgXegk41tMF98Ao9bSx6O55LqTKJp/dV1b08ggn1TlJ27J
	fs6g==
X-Gm-Message-State: APjAAAUDPC05KXOe9KRHCTE6DqPiq72MlpOp/en/nWhwMmqmKJYni7SV
	Fb7U0culOjc1kQeEr3XG2hMsk4K5HusMjZDsGi9f+ToCXDk=
X-Google-Smtp-Source: APXvYqzyccXSQc3Ek/cM7fL9oK2IDkNpEGe9LkXAVrpjK6BDysH+4OheQXjkjIvmtbdHnX70hxLKl0lTSOZO3qNeT7M=
X-Received: by 2002:aca:e054:: with SMTP id x81mr129996oig.146.1556558748484; 
	Mon, 29 Apr 2019 10:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-3-richard.henderson@linaro.org>
In-Reply-To: <20190403034358.21999-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 18:25:37 +0100
Message-ID: <CAFEAcA_=PiLXOn+H9=VAdXx-YKDbh0eZ83NDWw=TmbrqTmGn7g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 02/26] tcg: Add CPUClass::tlb_fill
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Apr 2019 at 04:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This hook will replace the (user-only mode specific) handle_mmu_fault
> hook, and the (system mode specific) tlb_fill function.
>
> The handle_mmu_fault hook was written as if there was a valid
> way to recover from an mmu fault, and had 3 possible return states.
> In reality, the only valid action is to raise an exception,
> return to the main loop, and delver the SIGSEGV to the guest.

"deliver"

You might also mention here that all of the implementations
of handle_mmu_fault for guest architectures which support
linux-user do in fact only ever return 1.

>
> Using the hook for system mode requires that all targets be converted,
> so for now the hook is (optionally) used only from user-only mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qom/cpu.h     |  9 +++++++++
>  accel/tcg/user-exec.c | 42 ++++++++++++++----------------------------
>  2 files changed, 23 insertions(+), 28 deletions(-)
>
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 1d6099e5d4..7e96a0aed3 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -119,6 +119,12 @@ struct TranslationBlock;
>   *       will need to do more. If this hook is not implemented then the
>   *       default is to call @set_pc(tb->pc).
>   * @handle_mmu_fault: Callback for handling an MMU fault.
> + * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
> + *       address fault.  For system mode, if the access is valid, call
> + *       tlb_set_page and return true; if the access is invalid, and
> + *       probe is true, return false; otherwise raise an exception and
> + *       do not return.  For user-only mode, always raise an exception
> + *       and do not return.
>   * @get_phys_page_debug: Callback for obtaining a physical address.
>   * @get_phys_page_attrs_debug: Callback for obtaining a physical address and the
>   *       associated memory transaction attributes to use for the access.
> @@ -194,6 +200,9 @@ typedef struct CPUClass {
>      void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *tb);
>      int (*handle_mmu_fault)(CPUState *cpu, vaddr address, int size, int rw,
>                              int mmu_index);
> +    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
> +                     MMUAccessType access_type, int mmu_idx,
> +                     bool probe, uintptr_t retaddr);
>      hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
>      hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
>                                          MemTxAttrs *attrs);
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index fa9380a380..f13c0b2b67 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -65,6 +65,7 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
>      CPUClass *cc;
>      int ret;
>      unsigned long address = (unsigned long)info->si_addr;
> +    MMUAccessType access_type;
>
>      /* We must handle PC addresses from two different sources:
>       * a call return address and a signal frame address.
> @@ -151,40 +152,25 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
>  #if TARGET_LONG_BITS == 32 && HOST_LONG_BITS == 64
>      g_assert(h2g_valid(address));
>  #endif
> -
> -    /* Convert forcefully to guest address space, invalid addresses
> -       are still valid segv ones */

This comment is still valid so I don't think it should be deleted.

>      address = h2g_nocheck(address);

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

