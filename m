Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E44F3AC3FB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 08:33:28 +0200 (CEST)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu84F-0006Tx-6U
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 02:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu82B-0005mP-ER
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 02:31:19 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu827-0003me-5b
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 02:31:19 -0400
Received: by mail-io1-xd32.google.com with SMTP id p66so5850282iod.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 23:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIX3DOcc6Km/N3pE5YzH/rYiou3luUzDD/Qm98l6mt8=;
 b=DvHtqyVbXEEfT9YhNcV9XzAdGZkCt6woRkGoJHsmTYBixYwvznVWVVY1ZhjCwZS+E2
 7fp5+mPqFvwcHTLRS2Cg2WxirPDu0zdLXQCKGxOHxAZWO1Mup1hQijRm/vmx4nT0ZAZT
 Q3ZJhFB1zBClMF1jAnt2utHRmdJhw6lW7ywuHYKOay2OELcgqoV54Lr+fg1EXa1Ic/63
 +EubtbHBOhTIKo4iNN5U79wjxQd4c99j7lG/IdstCcCymklt9hHw7SG3pmQrIJeT0LE5
 zFkEZQXi3iuuO8hph2Jr7021CBJVa+XgOCZKn7MF8Eb2culSFvuT6PleWwOiv0BXl5VS
 xi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIX3DOcc6Km/N3pE5YzH/rYiou3luUzDD/Qm98l6mt8=;
 b=Mh13NoMdz7h8LrAuRmIgdFGZaQ9OhOcAObUBaPZ7nlR6vpaaPLbYckCuumDae/9sPP
 mR/QzXAWNM/wXrMk2NEuzx81K+B9gxwMeuvjrox57Ly56R3M1bCwKCXiB2fFjlXBzA8f
 0mZF0l7Z2ecGxH1oLIjAhbF4Nf/2KkclHev/DH7iOjSIdFr6XQvdeH+biGQm5hu6aNnS
 91mitiHMmd/BvNw1rdiVIrGQGEvVlCRL0YsnVKRsrahp43UYDB5HUMr7Zmr1jGZ2j9R5
 +GandSzPK2reIHCnPuahv5sNMWS9fjU/TLs9qqyqhvOmFSoMcwKLy2GXnMp74hoHbPx5
 ++mA==
X-Gm-Message-State: AOAM532Dk1i/M2Zo2+PBdnLJ8F124y/nJAuaevo1QgfVCJ2ImWS1/1hd
 5HdPdbYcA/r9bg5JKp3S28zx0iH5MlXR4VhYZMM=
X-Google-Smtp-Source: ABdhPJwKtgaD6NgU7lhTaubVGCHy4dNX9hfHY0tyYiAEMcqcnS9ZhurWgXZxBFtfEeLoqXQpNfCW590PDJLRgERdpY0=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr1843900jak.91.1623997873949; 
 Thu, 17 Jun 2021 23:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-29-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-29-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 16:30:47 +1000
Message-ID: <CAKmqyKP9wfrKgdaMfhLuYwjoXPAE+L9c02Z_VHyfc6RddSLjmA@mail.gmail.com>
Subject: Re: [PATCH 28/28] tcg/riscv: Remove MO_BSWAP handling
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 6:54 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> TCG_TARGET_HAS_MEMORY_BSWAP is already unset for this backend,
> which means that MO_BSWAP be handled by the middle-end and
> will never be seen by the backend.  Thus the indexes used with
> qemu_{ld,st}_helpers will always be zero.
>
> Tidy the comments and asserts in tcg_out_qemu_{ld,st}_direct.
> It is not that we do not handle bswap "yet", but never will.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 64 ++++++++++++++++++++------------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index da7eecafc5..c16f96b401 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -852,37 +852,43 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     TCGMemOpIdx oi, uintptr_t ra)
>   */
> -static void * const qemu_ld_helpers[16] = {
> -    [MO_UB]   = helper_ret_ldub_mmu,
> -    [MO_SB]   = helper_ret_ldsb_mmu,
> -    [MO_LEUW] = helper_le_lduw_mmu,
> -    [MO_LESW] = helper_le_ldsw_mmu,
> -    [MO_LEUL] = helper_le_ldul_mmu,
> +static void * const qemu_ld_helpers[8] = {
> +    [MO_UB] = helper_ret_ldub_mmu,
> +    [MO_SB] = helper_ret_ldsb_mmu,
> +#ifdef HOST_WORDS_BIGENDIAN
> +    [MO_UW] = helper_be_lduw_mmu,
> +    [MO_SW] = helper_be_ldsw_mmu,
> +    [MO_UL] = helper_be_ldul_mmu,
>  #if TCG_TARGET_REG_BITS == 64
> -    [MO_LESL] = helper_le_ldsl_mmu,
> +    [MO_SL] = helper_be_ldsl_mmu,
>  #endif
> -    [MO_LEQ]  = helper_le_ldq_mmu,
> -    [MO_BEUW] = helper_be_lduw_mmu,
> -    [MO_BESW] = helper_be_ldsw_mmu,
> -    [MO_BEUL] = helper_be_ldul_mmu,
> +    [MO_Q]  = helper_be_ldq_mmu,
> +#else
> +    [MO_UW] = helper_le_lduw_mmu,
> +    [MO_SW] = helper_le_ldsw_mmu,
> +    [MO_UL] = helper_le_ldul_mmu,
>  #if TCG_TARGET_REG_BITS == 64
> -    [MO_BESL] = helper_be_ldsl_mmu,
> +    [MO_SL] = helper_le_ldsl_mmu,
> +#endif
> +    [MO_Q]  = helper_le_ldq_mmu,
>  #endif
> -    [MO_BEQ]  = helper_be_ldq_mmu,
>  };
>
>  /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
>   *                                     uintxx_t val, TCGMemOpIdx oi,
>   *                                     uintptr_t ra)
>   */
> -static void * const qemu_st_helpers[16] = {
> -    [MO_UB]   = helper_ret_stb_mmu,
> -    [MO_LEUW] = helper_le_stw_mmu,
> -    [MO_LEUL] = helper_le_stl_mmu,
> -    [MO_LEQ]  = helper_le_stq_mmu,
> -    [MO_BEUW] = helper_be_stw_mmu,
> -    [MO_BEUL] = helper_be_stl_mmu,
> -    [MO_BEQ]  = helper_be_stq_mmu,
> +static void * const qemu_st_helpers[4] = {
> +    [MO_8]   = helper_ret_stb_mmu,
> +#ifdef HOST_WORDS_BIGENDIAN
> +    [MO_16] = helper_be_stw_mmu,
> +    [MO_32] = helper_be_stl_mmu,
> +    [MO_64] = helper_be_stq_mmu,
> +#else
> +    [MO_16] = helper_le_stw_mmu,
> +    [MO_32] = helper_le_stl_mmu,
> +    [MO_64] = helper_le_stq_mmu,
> +#endif
>  };
>
>  /* We don't support oversize guests */
> @@ -997,7 +1003,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>      tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
>      tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
>
> -    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
> +    tcg_out_call(s, qemu_ld_helpers[opc & MO_SSIZE]);
>      tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
>
>      tcg_out_goto(s, l->raddr);
> @@ -1042,7 +1048,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>      tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
>      tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
>
> -    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
> +    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
>
>      tcg_out_goto(s, l->raddr);
>      return true;
> @@ -1052,10 +1058,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>  static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
>                                     TCGReg base, MemOp opc, bool is_64)
>  {
> -    const MemOp bswap = opc & MO_BSWAP;
> -
> -    /* We don't yet handle byteswapping, assert */
> -    g_assert(!bswap);
> +    /* Byte swapping is left to middle-end expansion. */
> +    tcg_debug_assert((opc & MO_BSWAP) == 0);
>
>      switch (opc & (MO_SSIZE)) {
>      case MO_UB:
> @@ -1139,10 +1143,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>  static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
>                                     TCGReg base, MemOp opc)
>  {
> -    const MemOp bswap = opc & MO_BSWAP;
> -
> -    /* We don't yet handle byteswapping, assert */
> -    g_assert(!bswap);
> +    /* Byte swapping is left to middle-end expansion. */
> +    tcg_debug_assert((opc & MO_BSWAP) == 0);
>
>      switch (opc & (MO_SSIZE)) {
>      case MO_8:
> --
> 2.25.1
>
>

