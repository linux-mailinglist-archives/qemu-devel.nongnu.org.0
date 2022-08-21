Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C1659B6DE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:54:48 +0200 (CEST)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPumF-0000P0-BY
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPug8-00088t-DT
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:48:28 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPug6-00049v-FJ
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:48:28 -0400
Received: by mail-pg1-x52b.google.com with SMTP id l64so8004880pge.0
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Z8EZfbCE3ZyON/L+ORxjFW53IsIuMN8HyKo5z8bnLOg=;
 b=EjNn2L9xkLUM5lgKuUyF57KHlZC78MIi37wMqCAquj9eDv7nbSu6gsgx9RLCX3AhSg
 pkhilppHxkpe8NujzvYuqHvfU1nkUBg8IIdSNyKLn7wzkf7BGk2FzxdnswDvPjVtfhhD
 njFH2zfRm/23jSn+zr9ZHr8d9+PjlVoN4ji1jimTtigrCp/R0eUy+0UsX/V9shD+F+is
 yz70XjfReN8kjJtxzvrgK3G2TAu02CnkuJcUjx6ODqARL4wAy0/1vOlbO3nqoFmmZSCO
 uwH1vvFBWpzT8Q70HX7R56NIxvWhP+DBe6ScwLSiAin3I/u2xYKyzC7fIFs4G/zU5J/t
 UO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Z8EZfbCE3ZyON/L+ORxjFW53IsIuMN8HyKo5z8bnLOg=;
 b=zYlIB3Anim+kBWuTZFwamTj4Z+zmhpz2jgWTKzFJCEXATOxy/p/ujHKnFKDpDpp7eB
 ueO+G8q97inem7NL+CFgrobmVMfBK2TBTria9CofyJAvqZjX6ANwmGFdBkXvWvbENyzf
 fbOoW40z7ZRgiK7irHLsfHS0qVi0dxJ0TvLFRcwwKFMeIuJsGP8psGLnshPOgOcFoynK
 4vBtenPLXErC+43MsiI/Ua0wasJHZYqtA5TyvrKGU9rl2lbeMvckoWW+wOnyBx0XVFz5
 dsjtzOoiLGUS5dFLxcG0T/wKalm1qzUUjNhQaeykutuNeBwXJOsSQe4qA/mIFNGCYENL
 PhRQ==
X-Gm-Message-State: ACgBeo3jrkx0AW9tgP22qoSdBpH3ejkVMvwQm2X4cpyTRGfG0Tg4aSn0
 rWbL4gFxI2LGRcENJfJ0KN996m/7+T4CuULTEFs=
X-Google-Smtp-Source: AA6agR4y1y3PLAQlRCAIHwWEowioHxiKGjYMwhajRqmQiC18PULKqtTGwgJDyjyLtz9nAKuy3QvxVfBF7E74Q4SEC8g=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr17980052pfj.83.1661125704803; Sun, 21
 Aug 2022 16:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-22-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-22-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:47:58 +1000
Message-ID: <CAKmqyKNRBkLF=o+Ebe=DASQ1WffdoS75Px++BZJwUemi_1TALg@mail.gmail.com>
Subject: Re: [PATCH v6 21/21] target/riscv: Make translator stop before the
 end of a page
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52b.google.com
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

On Fri, Aug 19, 2022 at 1:39 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Right now the translator stops right *after* the end of a page, which
> breaks reporting of fault locations when the last instruction of a
> multi-insn translation block crosses a page boundary.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1155
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c          | 17 +++++--
>  tests/tcg/riscv64/noexec.c        | 79 +++++++++++++++++++++++++++++++
>  tests/tcg/riscv64/Makefile.target |  1 +
>  3 files changed, 93 insertions(+), 4 deletions(-)
>  create mode 100644 tests/tcg/riscv64/noexec.c
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index a719aa6e63..f8af6daa70 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1154,12 +1154,21 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      }
>      ctx->nftemp = 0;
>
> +    /* Only the first insn within a TB is allowed to cross a page boundary. */
>      if (ctx->base.is_jmp == DISAS_NEXT) {
> -        target_ulong page_start;
> -
> -        page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
> -        if (ctx->base.pc_next - page_start >= TARGET_PAGE_SIZE) {
> +        if (!is_same_page(&ctx->base, ctx->base.pc_next)) {
>              ctx->base.is_jmp = DISAS_TOO_MANY;
> +        } else {
> +            unsigned page_ofs = ctx->base.pc_next & ~TARGET_PAGE_MASK;
> +
> +            if (page_ofs > TARGET_PAGE_SIZE - MAX_INSN_LEN) {
> +                uint16_t next_insn = cpu_lduw_code(env, ctx->base.pc_next);
> +                int len = insn_len(next_insn);
> +
> +                if (!is_same_page(&ctx->base, ctx->base.pc_next + len)) {
> +                    ctx->base.is_jmp = DISAS_TOO_MANY;
> +                }
> +            }
>          }
>      }
>  }
> diff --git a/tests/tcg/riscv64/noexec.c b/tests/tcg/riscv64/noexec.c
> new file mode 100644
> index 0000000000..86f64b28db
> --- /dev/null
> +++ b/tests/tcg/riscv64/noexec.c
> @@ -0,0 +1,79 @@
> +#include "../multiarch/noexec.c.inc"
> +
> +static void *arch_mcontext_pc(const mcontext_t *ctx)
> +{
> +    return (void *)ctx->__gregs[REG_PC];
> +}
> +
> +static int arch_mcontext_arg(const mcontext_t *ctx)
> +{
> +    return ctx->__gregs[REG_A0];
> +}
> +
> +static void arch_flush(void *p, int len)
> +{
> +    __builtin___clear_cache(p, p + len);
> +}
> +
> +extern char noexec_1[];
> +extern char noexec_2[];
> +extern char noexec_end[];
> +
> +asm(".option push\n"
> +    ".option norvc\n"
> +    "noexec_1:\n"
> +    "   li a0,1\n"       /* a0 is 0 on entry, set 1. */
> +    "noexec_2:\n"
> +    "   li a0,2\n"      /* a0 is 0/1; set 2. */
> +    "   ret\n"
> +    "noexec_end:\n"
> +    ".option pop");
> +
> +int main(void)
> +{
> +    struct noexec_test noexec_tests[] = {
> +        {
> +            .name = "fallthrough",
> +            .test_code = noexec_1,
> +            .test_len = noexec_end - noexec_1,
> +            .page_ofs = noexec_1 - noexec_2,
> +            .entry_ofs = noexec_1 - noexec_2,
> +            .expected_si_ofs = 0,
> +            .expected_pc_ofs = 0,
> +            .expected_arg = 1,
> +        },
> +        {
> +            .name = "jump",
> +            .test_code = noexec_1,
> +            .test_len = noexec_end - noexec_1,
> +            .page_ofs = noexec_1 - noexec_2,
> +            .entry_ofs = 0,
> +            .expected_si_ofs = 0,
> +            .expected_pc_ofs = 0,
> +            .expected_arg = 0,
> +        },
> +        {
> +            .name = "fallthrough [cross]",
> +            .test_code = noexec_1,
> +            .test_len = noexec_end - noexec_1,
> +            .page_ofs = noexec_1 - noexec_2 - 2,
> +            .entry_ofs = noexec_1 - noexec_2 - 2,
> +            .expected_si_ofs = 0,
> +            .expected_pc_ofs = -2,
> +            .expected_arg = 1,
> +        },
> +        {
> +            .name = "jump [cross]",
> +            .test_code = noexec_1,
> +            .test_len = noexec_end - noexec_1,
> +            .page_ofs = noexec_1 - noexec_2 - 2,
> +            .entry_ofs = -2,
> +            .expected_si_ofs = 0,
> +            .expected_pc_ofs = -2,
> +            .expected_arg = 0,
> +        },
> +    };
> +
> +    return test_noexec(noexec_tests,
> +                       sizeof(noexec_tests) / sizeof(noexec_tests[0]));
> +}
> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
> index d41bf6d60d..b5b89dfb0e 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -3,3 +3,4 @@
>
>  VPATH += $(SRC_PATH)/tests/tcg/riscv64
>  TESTS += test-div
> +TESTS += noexec
> --
> 2.34.1
>
>

