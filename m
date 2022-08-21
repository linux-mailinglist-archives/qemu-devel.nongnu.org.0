Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C224F59B6C7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:36:43 +0200 (CEST)
Received: from localhost ([::1]:35026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuUk-0003IJ-Sz
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuRo-00010w-Rb
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:33:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuRn-000216-1M
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:33:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s206so7973182pgs.3
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=7P/i8lBZRJAboK4z1Z+YELbl3EUqdGJfPckR1aOjIdg=;
 b=KpCL808zDUlCOzAEDMBoOuxQZvbpN4T85fuMKxW+mYp/b/LVzfe5pP3wyRDv+mAbUd
 t/h7upI48rho1tQ/fsHB4w4TdL3wDx9H4kD8Wdfm78IipeK0iZArkEVGag0sNllTRjX+
 z+2SysffFqSGI6HopxlJam8Z9x+UCmGL1W/1xr6ml4OhbzxdFsXXXTA39PvwvPktJBfh
 sayHq+bxzSS5oAD4zlZWNMZj8LDdZ/lYkSJ6qb9/5v/B7Ns1OQ6z/T88GV14bR5NOG0e
 bo6TEQlAgr2+8UHbtMBwVNvHXZlL65I0CDCGrZEYrzRnRqlGCtP682dDBzkeXNKOS982
 23Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=7P/i8lBZRJAboK4z1Z+YELbl3EUqdGJfPckR1aOjIdg=;
 b=knbuLS7D5MKOD/rn2uyaKRCHw/dNwoD8uu9oIBMeAdbAXLZSktXOgXZVogthBv6+I9
 JJfcCqcebIjmdyrV602Rhs/8NeCBZ3NcsVIGyu/1+aHjMp3k1W1yyLwXAGAT1uxsTF+N
 bJxm6G8io8CcCyVXhIXapD/gz8yuVGl3+v9qALYWkEIThMaj/3c8+2FaiRiqeC1hQRD+
 rg/+4whARMbOK3te1MSLpkUUVfO8b11Z/LsZn6AQXEJaSb/njQxRyKIyYIRWgCdqj9+m
 Dr4vpiR97G2mWpwNuh+hPvdd4HQbq4FHk1ddoZHAmv20OLgQf7BCRDEHtZSLXoDUyfy5
 4moQ==
X-Gm-Message-State: ACgBeo1mMkb+86fHVNyT94MV9lnA7p3LuVGHMHxcTgPj9AwPsTsvpJDk
 x2FRoaheRCqVEBYkh+lzKbdXVPoAbz2S9LzN8w0=
X-Google-Smtp-Source: AA6agR6oIt+ry207zm/yqXZceaISp4RSC3DSc3OADVXGlOh6TxYzLNtgXt7n6O0JjNUFEiQNwHa2OFqOOO4JQ8tuoRo=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr17944739pfj.83.1661124817373; Sun, 21
 Aug 2022 16:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-11-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-11-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:33:11 +1000
Message-ID: <CAKmqyKP3YH6jBcYB2gjxcPLW+xD+hNUDN9HgT6TZn24mMfte3w@mail.gmail.com>
Subject: Re: [PATCH v6 10/21] accel/tcg: Make tb_htable_lookup static
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 1:33 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The function is not used outside of cpu-exec.c.  Move it and
> its subroutines up in the file, before the first use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/exec-all.h |   3 -
>  accel/tcg/cpu-exec.c    | 122 ++++++++++++++++++++--------------------
>  2 files changed, 61 insertions(+), 64 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 0475ec6007..9f35e3b7a9 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -552,9 +552,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
>  #endif
>  void tb_flush(CPUState *cpu);
>  void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
> -TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
> -                                   target_ulong cs_base, uint32_t flags,
> -                                   uint32_t cflags);
>  void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
>
>  /* GETPC is the true target of the return instruction that we'll execute.  */
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index d18081ca6f..7887af6f45 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -170,6 +170,67 @@ uint32_t curr_cflags(CPUState *cpu)
>      return cflags;
>  }
>
> +struct tb_desc {
> +    target_ulong pc;
> +    target_ulong cs_base;
> +    CPUArchState *env;
> +    tb_page_addr_t phys_page1;
> +    uint32_t flags;
> +    uint32_t cflags;
> +    uint32_t trace_vcpu_dstate;
> +};
> +
> +static bool tb_lookup_cmp(const void *p, const void *d)
> +{
> +    const TranslationBlock *tb = p;
> +    const struct tb_desc *desc = d;
> +
> +    if (tb->pc == desc->pc &&
> +        tb->page_addr[0] == desc->phys_page1 &&
> +        tb->cs_base == desc->cs_base &&
> +        tb->flags == desc->flags &&
> +        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
> +        tb_cflags(tb) == desc->cflags) {
> +        /* check next page if needed */
> +        if (tb->page_addr[1] == -1) {
> +            return true;
> +        } else {
> +            tb_page_addr_t phys_page2;
> +            target_ulong virt_page2;
> +
> +            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
> +            phys_page2 = get_page_addr_code(desc->env, virt_page2);
> +            if (tb->page_addr[1] == phys_page2) {
> +                return true;
> +            }
> +        }
> +    }
> +    return false;
> +}
> +
> +static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
> +                                          target_ulong cs_base, uint32_t flags,
> +                                          uint32_t cflags)
> +{
> +    tb_page_addr_t phys_pc;
> +    struct tb_desc desc;
> +    uint32_t h;
> +
> +    desc.env = cpu->env_ptr;
> +    desc.cs_base = cs_base;
> +    desc.flags = flags;
> +    desc.cflags = cflags;
> +    desc.trace_vcpu_dstate = *cpu->trace_dstate;
> +    desc.pc = pc;
> +    phys_pc = get_page_addr_code(desc.env, pc);
> +    if (phys_pc == -1) {
> +        return NULL;
> +    }
> +    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> +    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
> +    return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
> +}
> +
>  /* Might cause an exception, so have a longjmp destination ready */
>  static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
>                                            target_ulong cs_base,
> @@ -485,67 +546,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
>      end_exclusive();
>  }
>
> -struct tb_desc {
> -    target_ulong pc;
> -    target_ulong cs_base;
> -    CPUArchState *env;
> -    tb_page_addr_t phys_page1;
> -    uint32_t flags;
> -    uint32_t cflags;
> -    uint32_t trace_vcpu_dstate;
> -};
> -
> -static bool tb_lookup_cmp(const void *p, const void *d)
> -{
> -    const TranslationBlock *tb = p;
> -    const struct tb_desc *desc = d;
> -
> -    if (tb->pc == desc->pc &&
> -        tb->page_addr[0] == desc->phys_page1 &&
> -        tb->cs_base == desc->cs_base &&
> -        tb->flags == desc->flags &&
> -        tb->trace_vcpu_dstate == desc->trace_vcpu_dstate &&
> -        tb_cflags(tb) == desc->cflags) {
> -        /* check next page if needed */
> -        if (tb->page_addr[1] == -1) {
> -            return true;
> -        } else {
> -            tb_page_addr_t phys_page2;
> -            target_ulong virt_page2;
> -
> -            virt_page2 = (desc->pc & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
> -            phys_page2 = get_page_addr_code(desc->env, virt_page2);
> -            if (tb->page_addr[1] == phys_page2) {
> -                return true;
> -            }
> -        }
> -    }
> -    return false;
> -}
> -
> -TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
> -                                   target_ulong cs_base, uint32_t flags,
> -                                   uint32_t cflags)
> -{
> -    tb_page_addr_t phys_pc;
> -    struct tb_desc desc;
> -    uint32_t h;
> -
> -    desc.env = cpu->env_ptr;
> -    desc.cs_base = cs_base;
> -    desc.flags = flags;
> -    desc.cflags = cflags;
> -    desc.trace_vcpu_dstate = *cpu->trace_dstate;
> -    desc.pc = pc;
> -    phys_pc = get_page_addr_code(desc.env, pc);
> -    if (phys_pc == -1) {
> -        return NULL;
> -    }
> -    desc.phys_page1 = phys_pc & TARGET_PAGE_MASK;
> -    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
> -    return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
> -}
> -
>  void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr)
>  {
>      if (TCG_TARGET_HAS_direct_jump) {
> --
> 2.34.1
>
>

