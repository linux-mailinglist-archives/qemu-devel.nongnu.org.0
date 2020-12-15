Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2EB2DB2A6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:32:51 +0100 (CET)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEBu-00048z-Nl
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpE8w-0002Rj-P3
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:29:46 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpE8u-00064e-UI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:29:46 -0500
Received: by mail-il1-x141.google.com with SMTP id k8so19975749ilr.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 09:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0RJ/D3bG/M8Y1prtTF7awBEUCFFJgZ47iaBujXa/fNI=;
 b=RUfJ7yEUxqbBZ+XzOif+VpRSLwcpnNgv+XAeCYM10Ff3lIgQBMNhAwFvUcTfSvMXbl
 QmrY1kJSGx4pHhlQmuJYKkMH3RpCx26PdY/DfuVw0ry7e+R9nYcXKcwfGdEYRBLzyVlK
 BqeobNQDgQ5BTEGEsA3IYbkZZ3pMs38vZzV1UCUPlN/NLOMLsjexE/d0BcUW+3ExvyrR
 6X0/JljBb0uaI6x8Cmw8eS1yymiG/9GBXW4wEIF4va2tvGBoz/fYZM69nPK1ECoCrqxC
 np5sFkj3pRmcNaukMxQR6W7fee2D4IsNj9yklq7BFyJszITcY3ElNlY9OYHdeTOeSVN9
 /U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0RJ/D3bG/M8Y1prtTF7awBEUCFFJgZ47iaBujXa/fNI=;
 b=NJ7icuGrH85wBJDFqplMmEZtF7FDSyQZsKm0rMq4n2++ZrzQ0xP3RqE39/rR4H+7C4
 AgStJWH3rIyuU5DgjVoupqepufNnb6GiI174+a/LYrnEybTG93JokYPJYlfGktxKCI61
 nh9RFOkJP1OpZ8suNnpXdvd/cNIQPNtsnJ37Frxrs3M6ocNBn5Ks9pOsB1h7MK2BCnqk
 FnovY7YbQ5Mx+XainQ7m07x5CTa0PQ24UEujQ3AhmzkFG9q4/3l4Gja2O3HxAs6Vd54A
 l8xgvUP2W3xrEKv6vxhXRGpBTS3dM3X3aF/nkxHBh04nOzmwIQEOZPJekTC+vPQFjzaC
 FlRg==
X-Gm-Message-State: AOAM530WTDxOsOqvykHBclrMyx1wcxqTmeMsmqUvW/B7h/xvKxnq54XV
 K8PSPBlNRY4InRLnTjjvHWTmqU344VRbvNY5DnE=
X-Google-Smtp-Source: ABdhPJzS5xaR1zDCbHuQwSnomCdhT0WZoqRZfSnAUn3i3/VrZwhHdkHX3cFZPIjmDUGdgFk9xPNq6x5gv+NhDUiO3P8=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr40601284ilq.131.1608053383968; 
 Tue, 15 Dec 2020 09:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-35-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-35-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Dec 2020 09:29:17 -0800
Message-ID: <CAKmqyKO+W9R2m7qHhKkM3CFdzs1N_h7PvEzqD8sWPjGEGEMvbA@mail.gmail.com>
Subject: Re: [PATCH v4 34/43] tcg/riscv: Fix branch range checks
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x141.google.com
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

On Mon, Dec 14, 2020 at 6:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The offset even checks were folded into the range check incorrectly.
> By offsetting by 1, and not decrementing the width, we silently
> allowed out of range branches.
>
> Assert that the offset is always even instead.  Move tcg_out_goto
> down into the CONFIG_SOFTMMU block so that it is not unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 025e3cd0bb..195c3eff03 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -429,7 +429,8 @@ static bool reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>  {
>      intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
>
> -    if (offset == sextreg(offset, 1, 12) << 1) {
> +    tcg_debug_assert((offset & 1) == 0);
> +    if (offset == sextreg(offset, 0, 12)) {
>          code_ptr[0] |= encode_sbimm12(offset);
>          return true;
>      }
> @@ -441,7 +442,8 @@ static bool reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>  {
>      intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
>
> -    if (offset == sextreg(offset, 1, 20) << 1) {
> +    tcg_debug_assert((offset & 1) == 0);
> +    if (offset == sextreg(offset, 0, 20)) {
>          code_ptr[0] |= encode_ujimm20(offset);
>          return true;
>      }
> @@ -854,28 +856,21 @@ static void tcg_out_setcond2(TCGContext *s, TCGCond cond, TCGReg ret,
>      g_assert_not_reached();
>  }
>
> -static inline void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
> -{
> -    ptrdiff_t offset = tcg_pcrel_diff(s, target);
> -    tcg_debug_assert(offset == sextreg(offset, 1, 20) << 1);
> -    tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
> -}
> -
>  static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
>  {
>      TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
>      ptrdiff_t offset = tcg_pcrel_diff(s, arg);
>      int ret;
>
> -    if (offset == sextreg(offset, 1, 20) << 1) {
> +    tcg_debug_assert((offset & 1) == 0);
> +    if (offset == sextreg(offset, 0, 20)) {
>          /* short jump: -2097150 to 2097152 */
>          tcg_out_opc_jump(s, OPC_JAL, link, offset);
> -    } else if (TCG_TARGET_REG_BITS == 32 ||
> -        offset == sextreg(offset, 1, 31) << 1) {
> +    } else if (TCG_TARGET_REG_BITS == 32 || offset == (int32_t)offset) {
>          /* long jump: -2147483646 to 2147483648 */
>          tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
>          tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
> -        ret = reloc_call(s->code_ptr - 2, arg);\
> +        ret = reloc_call(s->code_ptr - 2, arg);
>          tcg_debug_assert(ret == true);
>      } else if (TCG_TARGET_REG_BITS == 64) {
>          /* far jump: 64-bit */
> @@ -962,6 +957,13 @@ QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
>  QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
>  QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
>
> +static void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
> +{
> +    tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
> +    bool ok = reloc_jimm20(s->code_ptr - 1, target);
> +    tcg_debug_assert(ok);
> +}
> +
>  static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
>                               TCGReg addrh, TCGMemOpIdx oi,
>                               tcg_insn_unit **label_ptr, bool is_load)
> --
> 2.25.1
>
>

