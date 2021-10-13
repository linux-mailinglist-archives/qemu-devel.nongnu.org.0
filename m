Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3F42C9B9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 21:16:24 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majjj-0001Sa-D4
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 15:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1majg5-00008y-9n
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:12:37 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vpalatin@rivosinc.com>)
 id 1majg3-0003l2-FP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 15:12:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id g8so14460333edt.7
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 12:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cTy/yralna0hZLr4Z8FPzhhLkbx2SJ88+Q8loIm2M4g=;
 b=xHvvq44mlfycUC5A0M8Z0nBKAmeQg77FnTKobz8GbzMdgAg5QBoZtzakp+rdaIByD2
 INGtQCW0KWceiKsYnhK8EzzfTjWvS6BYQ+u95wmgKHYq+Wv8AOm0wrwcFE6NRCwgp3C1
 wewRws8+kSymrKef/gjLwdVIrlESCs+L1CKMqYv8UcVB7mXOnfjXfvvCb3tLnA573NCp
 kltW0abEkq0lmo1Qj2WPqc08nxybBRltXnuQ897j28rOxTXDapTfGYapeGr4GYM4ShSN
 j5akSMGLFgDkqPk1mzgFbz2FPvvga5bxY/oWA61Ob13Cxx+hLMUAJ7mkYuLW9WC5K8WC
 tEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTy/yralna0hZLr4Z8FPzhhLkbx2SJ88+Q8loIm2M4g=;
 b=l4lc+W8U4OWQA5RxQw38TTDy/sWBsdhiGD52zlr6ew/s0bMZaceyLzoTEs5tHV0S3z
 0mJtZzVbYAvBoieeJ7/Ysrxiz1+0Rfv4cQy6tC/lV1D4L1Osf02+fTagXvnfP28c0Nfe
 FW0nZeUWQvuElmykjBgvHc502BX5zwbBO1TPRfHQ5O1dgNO8sqr9zt/g+o9MP40tQlkg
 fS8eW/msuWVMFl3Gu07G2FTCXzAKf3xavAA05pTLqQLJUpz7ZDizZnXOzqMbgNN9lzZZ
 kjcO3uDN87XNUHhSt+K+ZjYaaeG6CQFb1+zlqI2xPk6zGfsoMEe67WvQjPXK9QLt1T5q
 6jMg==
X-Gm-Message-State: AOAM533jaaeCI8XtAKonXAqqhw2tirSoPCypFSnYJMpFabaDQkJS+78D
 gX5OiHCQuiphPTzfk1WLaJb1NL2M4/03HfsP8SgNcQ==
X-Google-Smtp-Source: ABdhPJzQofiynuK8UdknQmNx2b8tccPyVG43AnzoyhUXjmnmxuWkUia+vUmEbgpFp5I9OVbXssDVs4EINeYz+8kDLeA=
X-Received: by 2002:a17:906:134e:: with SMTP id
 x14mr1267855ejb.72.1634152353324; 
 Wed, 13 Oct 2021 12:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211013184125.2010897-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20211013184125.2010897-1-philipp.tomsich@vrull.eu>
From: Vincent Palatin <vpalatin@rivosinc.com>
Date: Wed, 13 Oct 2021 21:12:16 +0200
Message-ID: <CAOojN2X5akrSYeKmGot+5317XxqxCysm4pWvTNYrdhgwtzHdZg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix orc.b implementation
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=vpalatin@rivosinc.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 8:41 PM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> The earlier implementation fell into a corner case for bytes that were
> 0x01, giving a wrong result (but not affecting our application test
> cases for strings, as an ASCII value 0x01 is rare in those...).
>
> This changes the algorithm to:
>  1. Mask out the high-bit of each bytes (so that each byte is <= 127).
>  2. Add 127 to each byte (i.e. if the low 7 bits are not 0, this will overflow
>     into the highest bit of each byte).
>  3. Bitwise-or the original value back in (to cover those cases where the
>     source byte was exactly 128) to saturate the high-bit.
>  4. Shift-and-mask (implemented as a mask-and-shift) to extract the MSB of
>     each byte into its LSB.
>  5. Multiply with 0xff to fan out the LSB to all bits of each byte.
>
> Fixes: d7a4fcb034 ("target/riscv: Add orc.b instruction for Zbb, removing gorc/gorci")
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reported-by: Vincent Palatin <vpalatin@rivosinc.com>
>


Tested-by: Vincent Palatin <vpalatin@rivosinc.com>


> ---
>
>  target/riscv/insn_trans/trans_rvb.c.inc | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 185c3e9a60..3095624f32 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -249,13 +249,16 @@ static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
>  static void gen_orc_b(TCGv ret, TCGv source1)
>  {
>      TCGv  tmp = tcg_temp_new();
> -    TCGv  ones = tcg_constant_tl(dup_const_tl(MO_8, 0x01));
> +    TCGv  low7 = tcg_constant_tl(dup_const_tl(MO_8, 0x7f));
>
> -    /* Set lsb in each byte if the byte was zero. */
> -    tcg_gen_sub_tl(tmp, source1, ones);
> -    tcg_gen_andc_tl(tmp, tmp, source1);
> +    /* Set msb in each byte if the byte was non-zero. */
> +    tcg_gen_and_tl(tmp, source1, low7);
> +    tcg_gen_add_tl(tmp, tmp, low7);
> +    tcg_gen_or_tl(tmp, tmp, source1);
> +
> +    /* Extract the msb to the lsb in each byte */
> +    tcg_gen_andc_tl(tmp, tmp, low7);
>      tcg_gen_shri_tl(tmp, tmp, 7);
> -    tcg_gen_andc_tl(tmp, ones, tmp);
>
>      /* Replicate the lsb of each byte across the byte. */
>      tcg_gen_muli_tl(ret, tmp, 0xff);
> --
> 2.25.1
>

