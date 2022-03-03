Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575144CC0D7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:12:28 +0100 (CET)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPn7z-0006d8-Ej
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPn0l-0007Iq-PC
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:04:59 -0500
Received: from [2607:f8b0:4864:20::b36] (port=42938
 helo=mail-yb1-xb36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPn0k-0001yX-0t
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:04:59 -0500
Received: by mail-yb1-xb36.google.com with SMTP id f5so10763561ybg.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09t/AP4cZTWCfm3YZ7oe5Yk0JOkKWCnUapVNBTA8Hc8=;
 b=AyzVxBCXqlqdv/KPlN/to3cboCU/dxFrKpUOogOk9yXzpSgZLf+mdXfRttuF1fzxNG
 SFr6fGoplNr6EBy+jzSOXY8+LpvMQkRYjeQFWFBBtNsd90ZghO8yH11GKmb3b8ZlQGP9
 iLR2xdt5mNS7uULcd0MEmUX6YXcBKDPEaXLlgv1g0NayTrHs36j14a7tRlVyT85KEmUs
 KioEmBNE8TDQBXPZnmHGox9Ddae88AoiYIjNgYu24pv8QRUQCBf7A/zy8o6NcdBnrMGn
 RW1heFrrWsbnRYKbrChHP0/dBrHcIXqNp1mlMTm0er3o6AAOHEatUxLX/SZYvKScV4Z8
 bH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09t/AP4cZTWCfm3YZ7oe5Yk0JOkKWCnUapVNBTA8Hc8=;
 b=ZNhFm9zoe/vSHw6ubl6y9GDMdIIoA+IXjjGNW1ztgpdgkc/O6IsvkTL/m1f1Kr1tN/
 /QV+Zs1hnBfFDN8OFqOdpZuAiam4UNsvfovgi8S7RTrJ4WcutZd8miDg1po/z5N5o968
 jVZw6GZ2i4XZmKuV3aahTHa5GwKD6hDd0SBbu4pcWojM+ERqNMpzpIYm7VKUNONWWfbs
 xDo6z/rKza7BBCqxPaW/c6XKt3i7sdylArxaRusVUZkGgByjw4CLwKERuWfld+Tvyrwj
 xlUmMnSKB5r83ZSv2LQvyujmN7qZrcJFTW28t6JgLqqi2bVxEM5ApgTSxqUTE44TLRn9
 /W3Q==
X-Gm-Message-State: AOAM531SZIYGLkO+tV6cBZWclUHB6ei5dnrdUcK8bWHuEMXXbRDW+31P
 Af2DM7KPynAytpXuXZvDZ8MFfcfiiv/ZdC5z6vQWiQ==
X-Google-Smtp-Source: ABdhPJzZI3UTe0hiTSlJUmZXgKbCtJtJwkJsBDdpZYoW0AFYazOAYmPpSDy6TdeOApWA7CTHw7GjTCcJA6GdtHIl3Ik=
X-Received: by 2002:a25:9c08:0:b0:628:a472:30f4 with SMTP id
 c8-20020a259c08000000b00628a47230f4mr7208859ybo.67.1646319895326; Thu, 03 Mar
 2022 07:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-7-richard.henderson@linaro.org>
In-Reply-To: <20220227020413.11741-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:04:44 +0000
Message-ID: <CAFEAcA_wCDP=-=FFp_hKE9r-5Vz7RMxpQV2BkH63cpv1oZRjbw@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] tcg/aarch64: Support TCG_TARGET_SIGNED_ADDR32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 02:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> AArch64 has both sign and zero-extending addressing modes, which
> means that either treatment of guest addresses is equally efficient.
> Enabling this for AArch64 gives us testing of the feature in CI.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target-sa32.h |  8 +++-
>  tcg/aarch64/tcg-target.c.inc  | 69 +++++++++++++++++++++++------------
>  2 files changed, 52 insertions(+), 25 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target-sa32.h b/tcg/aarch64/tcg-target-sa32.h
> index cb185b1526..c99e502e4c 100644
> --- a/tcg/aarch64/tcg-target-sa32.h
> +++ b/tcg/aarch64/tcg-target-sa32.h
> @@ -1 +1,7 @@
> -#define TCG_TARGET_SIGNED_ADDR32 0
> +/*
> + * AArch64 has both SXTW and UXTW addressing modes, which means that
> + * it is agnostic to how guest addresses should be represented.
> + * Because aarch64 is more common than the other hosts that will
> + * want to use this feature, enable it for continuous testing.
> + */
> +#define TCG_TARGET_SIGNED_ADDR32 1
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 077fc51401..65cab73ea0 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc


>  static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
>                              MemOpIdx oi, TCGType ext)
>  {
>      MemOp memop = get_memop(oi);
> -    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
> +    int option = ldst_ext_option();
>
>      /* Byte swapping is left to middle-end expansion. */
>      tcg_debug_assert((memop & MO_BSWAP) == 0);
> @@ -1833,7 +1854,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
>
>      tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 1);
>      tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> -                           TCG_REG_X1, otype, addr_reg);
> +                           TCG_REG_X1, option, addr_reg);
>      add_qemu_ldst_label(s, true, oi, ext, data_reg, addr_reg,
>                          s->code_ptr, label_ptr);
>  #else /* !CONFIG_SOFTMMU */
> @@ -1843,10 +1864,10 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
>      }
>      if (USE_GUEST_BASE) {
>          tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> -                               TCG_REG_GUEST_BASE, otype, addr_reg);
> +                               TCG_REG_GUEST_BASE, option, addr_reg);
>      } else {
>          tcg_out_qemu_ld_direct(s, memop, ext, data_reg,
> -                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
> +                               addr_reg, option, TCG_REG_XZR);

This doesn't look right. 'option' specifies how we extend the offset
register, but here that is XZR, which is 0 no matter how we choose
to extend it, whereas we aren't going to be extending the base
register 'addr_reg' which is what we do need to either zero or
sign extend. Unfortunately we can't just flip addr_reg and XZR
around, because XZR isn't valid as the base reg.

Is this a pre-existing bug? If addr_reg needs zero extending
we won't be doing that.

>      }
>  #endif /* CONFIG_SOFTMMU */
>  }
> @@ -1855,7 +1876,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
>                              MemOpIdx oi)
>  {
>      MemOp memop = get_memop(oi);
> -    const TCGType otype = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
> +    int option = ldst_ext_option();
>
>      /* Byte swapping is left to middle-end expansion. */
>      tcg_debug_assert((memop & MO_BSWAP) == 0);
> @@ -1866,7 +1887,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
>
>      tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, mem_index, 0);
>      tcg_out_qemu_st_direct(s, memop, data_reg,
> -                           TCG_REG_X1, otype, addr_reg);
> +                           TCG_REG_X1, option, addr_reg);
>      add_qemu_ldst_label(s, false, oi, (memop & MO_SIZE)== MO_64,
>                          data_reg, addr_reg, s->code_ptr, label_ptr);
>  #else /* !CONFIG_SOFTMMU */
> @@ -1876,10 +1897,10 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
>      }
>      if (USE_GUEST_BASE) {
>          tcg_out_qemu_st_direct(s, memop, data_reg,
> -                               TCG_REG_GUEST_BASE, otype, addr_reg);
> +                               TCG_REG_GUEST_BASE, option, addr_reg);
>      } else {
>          tcg_out_qemu_st_direct(s, memop, data_reg,
> -                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
> +                               addr_reg, option, TCG_REG_XZR);
>

Similarly here.

thanks
-- PMM

