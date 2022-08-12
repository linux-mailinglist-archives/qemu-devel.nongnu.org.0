Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D977591155
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 15:25:31 +0200 (CEST)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMUfJ-0006Zr-Ky
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 09:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMUbE-0001eU-IO
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:21:16 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMUbC-00032v-RP
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 09:21:16 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-324ec5a9e97so9643767b3.7
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xbMc+4ywE8v9x8fj8VxK87gIYSlFPEqmDqeh0q1o+KE=;
 b=fYOU4O9tqCdi0UlFd0QkXiLqRo0w/XwVoiXxwxS+HR+I5Wmzck1wiigJGoVzDOlWPR
 9zTCI1GiWz29y5Sf/Fs5QF+U8WaAuUEkx0Ufo/ZOW8pVaIaxb0f9qehbTDzfF0fh3s/S
 /kP15r6JhKoSEHceVxXlvRR8Qhn4hgfwoAKJ2lJnIwv1gIyBsTgp2wm7poJjSUJRqlCl
 IyyRDvzOZLHcuIT7z8FcKc2eOB0evnZcqQ8m6hFAIZ3zQKStNhaw4wfFSWZRAhTwK2V+
 NpKAwXZPpW+aryR42J+NWIEHJSroUA6Tr1i4pBkInlPU+Za+ZsnwSdwF3U0duyRL83ea
 xwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xbMc+4ywE8v9x8fj8VxK87gIYSlFPEqmDqeh0q1o+KE=;
 b=NtpPTGCt1hKs9xMEYVv11p89ZmUehFV/p9jLJhwbbxmFDxV5V6NwSLes/wkfFqazz9
 KQbiT7PaTVYAvzy782Hlo3ZXNx+aLxYKDbS4gKOo/5DdPG28cP9xETnSTrh/2Fc9rAly
 sivDGdMLx7fxCEzi78AO4xBb9CYhrELY+5dYxaL519A5WiPYsBzWXTonvnx9oCjvuiH8
 wELBch1aAbjirP/s5Q7x/+j2JrzuP1/m7LggRMyhNkTWQj8/mEQpGE6rPu+aU6W6JtK4
 M47OdkdkRnqj+uZIE4fJsQ5Q+MWqzbODNPGoCieakroh5y1CrkEyWNgZXh7A/zRLRjxq
 51FQ==
X-Gm-Message-State: ACgBeo0WcT5gGXDYNjB1Oy4OgMVjV4jGA3xfp+dZ7MrR706nHc72/nsf
 WBBRlqGDaXxYM/nzBHdWrzqj5ZDAhk9yqs8o8Lkqig==
X-Google-Smtp-Source: AA6agR4Vwmohq4RMzXEeLXR9ZP+Re6iFjq2/Y8JciEvzMpd3x88XgSg8cdkTR7rmlh1/oX52JqfHrVVWBnbdsV0Uv+w=
X-Received: by 2002:a81:13c5:0:b0:32a:8e40:d469 with SMTP id
 188-20020a8113c5000000b0032a8e40d469mr3939695ywt.64.1660310473715; Fri, 12
 Aug 2022 06:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
In-Reply-To: <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 14:21:02 +0100
Message-ID: <CAFEAcA9tQDu_4N+6QKhX66R5PtddXWkL-zmn1vDTDdQceCtHdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: fence: reconcile with specification
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 12 Aug 2022 at 14:17, Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> Our decoding of fence-instructions is problematic in respect to the
> RISC-V ISA specification:
> - rs and rd are ignored, but need to be 0
> - fm is ignored
>
> This change adjusts the decode pattern to enfore rs and rd being 0,
> and validates the fm-field (together with pred/succ for FENCE.TSO) to
> determine whether a reserved instruction is specified.
>
> While the specification allows UNSPECIFIED behaviour for reserved
> instructions, we now always raise an illegal instruction exception.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
>
> ---
>
>  target/riscv/insn32.decode              |  2 +-
>  target/riscv/insn_trans/trans_rvi.c.inc | 19 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 089128c3dc..4e53df1b62 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -150,7 +150,7 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>  sra      0100000 .....    ..... 101 ..... 0110011 @r
>  or       0000000 .....    ..... 110 ..... 0110011 @r
>  and      0000000 .....    ..... 111 ..... 0110011 @r
> -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> +fence    fm:4 pred:4 succ:4 00000 000 00000 0001111
>  fence_i  000000000000     00000 001 00000 0001111
>  csrrw    ............     ..... 001 ..... 1110011 @csr
>  csrrs    ............     ..... 010 ..... 1110011 @csr
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index ca8e3d1ea1..515bb3b22a 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -795,7 +795,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
>
>  static bool trans_fence(DisasContext *ctx, arg_fence *a)
>  {
> -    /* FENCE is a full memory barrier. */
> +    switch (a->fm) {
> +    case 0b0000:
> +         /* normal fence */
> +         break;
> +
> +    case 0b0001:
> +         /* FENCE.TSO requires PRED and SUCC to be RW */
> +         if (a->pred != 0xb0011 || a->succ != 0b0011) {
> +            return false;
> +         }
> +         break;
> +
> +    default:
> +        /* reserved for future use */
> +        return false;
> +    }

I think it would be neater to do this decode in the
.decode file, rather than by hand in the trans function.

thanks
-- PMM

