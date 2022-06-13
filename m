Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE6A547D11
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 02:24:11 +0200 (CEST)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0XsH-0008C3-O3
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 20:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Xq8-0007KR-3g
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 20:21:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0Xq6-0002cC-5c
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 20:21:55 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j7so4207161pjn.4
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 17:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hIv/LXEXy49rnkZ9Ao1GHCYqP7n+kWsJgPcdMAu0S4E=;
 b=lz+cJQDNxN/hXkZcbQhOpoJwxJy7pKn0vKZpzclzPmYX58/jXECZQaZP95B5lWvyD1
 ESeoL+wv7426hKB+lmM+iWBkW2QrgSLfFIn9/4+/SokjfkyDduhCT9NJp6JzJvh7U7Z8
 P/sXVzfkf/HCavrZS3hl2GU6yj+9NxRGoLRQDOTryQvMwLv/XkQVa3W/tS7atiZexltr
 ySpwK3TfOJk7gqGhIS6K5EEPU9+zbfOreUE8mK/jK1Y5bIOkev3NWx3V5N37Ra/WO0i+
 Xn+X853IpDDfpDFrNN+SKfz+14jLrZGxKUf7zgvdmrGNpnFVO2PanlaTNEZHdR/GfupF
 3T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hIv/LXEXy49rnkZ9Ao1GHCYqP7n+kWsJgPcdMAu0S4E=;
 b=In7nsHW8sPbVXRWplByKsdyo9J6ByPClhQioTGQic5yL5SO98RjSOOaJPUFkfjMSqG
 dXHPQDqq4b6gFz0JfLnxzEF5tO26Gaq9YbLOMrDkMl9xlnzjXfaGFR1VKqXJ1BpckQEf
 4VtjYnFFGnYHCIY+88yaZFrsYLEhEWUlNylberQtVuTq23f0x8e4RlMh7R4nY+k6bVd4
 dudHqQmH0oQp68e4Xn0rD46BD2VQAB2fXjaKdtPxJXSYZSgJOXh64vYq36kN5liwGADl
 ittq2MyrixnupNMBmTxP474v7uWZbgHjt5qngZDGHVzKhcqwBWeRr1mwNfBNKw3dykbO
 MZ/w==
X-Gm-Message-State: AOAM5338FdAuXyzcOHFyMmtaJmEMdwFOM1cbjQq6FuhtDPtOFdg+zz0A
 IeK1OWul2H7n1XSPJCr7gOuEhjInw1GjIEJQnvCHaW2mFro6FEPC
X-Google-Smtp-Source: ABdhPJzNCOKxKBSQPxZNXK/lu0UZCZdk0pxs1e6BfPdIQaWDz2qBWwrgXxCxN8s3vx1JmTn9QMZjxVG/lrS/ilZODwc=
X-Received: by 2002:a17:90b:3e85:b0:1e8:8f2f:bd2f with SMTP id
 rj5-20020a17090b3e8500b001e88f2fbd2fmr12662961pjb.120.1655079712667; Sun, 12
 Jun 2022 17:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220604231004.49990-1-richard.henderson@linaro.org>
 <20220604231004.49990-2-richard.henderson@linaro.org>
In-Reply-To: <20220604231004.49990-2-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 10:21:25 +1000
Message-ID: <CAKmqyKNGGC0MVGJSZPAZPEZ6Q+-7s93f6b0CXdNYpqdK=moexg@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Set env->bins in gen_exception_illegal
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1035.google.com
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

On Sun, Jun 5, 2022 at 9:11 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While we set env->bins when unwinding for ILLEGAL_INST,
> from e.g. csrrw, we weren't setting it for immediately
> illegal instructions.
>
> Add a testcase for mtval via both exception paths.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1060
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                  |  2 +
>  tests/tcg/riscv64/Makefile.softmmu-target | 21 +++++++++
>  tests/tcg/riscv64/issue1060.S             | 53 +++++++++++++++++++++++
>  tests/tcg/riscv64/semihost.ld             | 21 +++++++++
>  4 files changed, 97 insertions(+)
>  create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
>  create mode 100644 tests/tcg/riscv64/issue1060.S
>  create mode 100644 tests/tcg/riscv64/semihost.ld
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 55a4713af2..9196aa71db 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -238,6 +238,8 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
>
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
> +    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> +                   offsetof(CPURISCVState, bins));
>      generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
>  }
>
> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
> new file mode 100644
> index 0000000000..d51ece7023
> --- /dev/null
> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
> @@ -0,0 +1,21 @@
> +#
> +# Aarch64 system tests

Copy and paste error

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +#
> +
> +TEST_SRC = $(SRC_PATH)/tests/tcg/riscv64
> +VPATH += $(TEST_SRC)
> +
> +LINK_SCRIPT = $(TEST_SRC)/semihost.ld
> +LDFLAGS = -T $(LINK_SCRIPT)
> +CFLAGS += -g -Og
> +
> +%.o: %.S
> +       $(CC) $(CFLAGS) $< -c -o $@
> +%: %.o $(LINK_SCRIPT)
> +       $(LD) $(LDFLAGS) $< -o $@
> +
> +QEMU_OPTS += -M virt -display none -semihosting -device loader,file=
> +
> +EXTRA_RUNS += run-issue1060
> +run-issue1060: issue1060
> +       $(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
> diff --git a/tests/tcg/riscv64/issue1060.S b/tests/tcg/riscv64/issue1060.S
> new file mode 100644
> index 0000000000..17b7fe1be2
> --- /dev/null
> +++ b/tests/tcg/riscv64/issue1060.S
> @@ -0,0 +1,53 @@
> +       .option norvc
> +
> +       .text
> +       .global _start
> +_start:
> +       lla     t0, trap
> +       csrw    mtvec, t0
> +
> +       # These are all illegal instructions
> +       csrw    time, x0
> +       .insn   i CUSTOM_0, 0, x0, x0, 0x321
> +       csrw    time, x0
> +       .insn   i CUSTOM_0, 0, x0, x0, 0x123
> +       csrw    cycle, x0
> +
> +       # Success!
> +       li      a0, 0
> +       j       _exit
> +
> +trap:
> +       # When an instruction traps, compare it to the insn in memory.
> +       csrr    t0, mepc
> +       csrr    t1, mtval
> +       lwu     t2, 0(t0)
> +       bne     t1, t2, fail
> +
> +       # Skip the insn and continue.
> +       addi    t0, t0, 4
> +       csrw    mepc, t0
> +       mret
> +
> +fail:
> +       li      a0, 1
> +
> +# Exit code in a0
> +_exit:
> +       lla     a1, semiargs
> +       li      t0, 0x20026     # ADP_Stopped_ApplicationExit
> +       sd      t0, 0(a1)
> +       sd      a0, 8(a1)
> +       li      a0, 0x20        # TARGET_SYS_EXIT_EXTENDED
> +
> +       # Semihosting call sequence
> +       .balign 16
> +       slli    zero, zero, 0x1f
> +       ebreak
> +       srai    zero, zero, 0x7
> +       j       .
> +
> +       .data
> +       .balign 16
> +semiargs:
> +       .space  16
> diff --git a/tests/tcg/riscv64/semihost.ld b/tests/tcg/riscv64/semihost.ld
> new file mode 100644
> index 0000000000..a59cc56b28
> --- /dev/null
> +++ b/tests/tcg/riscv64/semihost.ld
> @@ -0,0 +1,21 @@
> +ENTRY(_start)
> +
> +SECTIONS
> +{
> +    /* virt machine, RAM starts at 2gb */
> +    . = 0x80000000;
> +    .text : {
> +        *(.text)
> +    }
> +    .rodata : {
> +        *(.rodata)
> +    }
> +    /* align r/w section to next 2mb */
> +    . = ALIGN(1 << 21);
> +    .data : {
> +        *(.data)
> +    }
> +    .bss : {
> +        *(.bss)
> +    }
> +}
> --
> 2.34.1
>
>

