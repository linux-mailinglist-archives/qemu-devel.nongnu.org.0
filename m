Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE2547D12
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 02:25:52 +0200 (CEST)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0Xtv-0001dD-37
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 20:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0XrP-0007ie-1R
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 20:23:15 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o0XrK-0002es-8B
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 20:23:14 -0400
Received: by mail-pl1-x634.google.com with SMTP id f9so3825765plg.0
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 17:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MFcg6m6jOFnDqJZ6ed2gEM2Ab/I7Ayg90tDJo8AS/8M=;
 b=mkDaD+nGGIwRe1h3ueZS/CZrgMEh+SI6/LDmr5fGDVQry46qsc5SPNwkRvmXusGHg9
 +Ia5XH/XUy2+NR33Zqgc/g01594DHyU5pRz4fxcVOZTY9An4ggrMMsNsNVQMGyPZR9G9
 3XDIGjuPhR3EAfksUs6bBARsY7zdJew4MSr5YeLMv/AE2CPwfGtDWF/ra+2xEIpqI4ql
 4m5/n2jmlbSKMfQu/SPkiscGzVppcdF27m9Tz2frQNDPrAH9wiXVa7Kty7qiIikvUTYW
 8JC5cfCY9+OCfkOADeP5L/yN5/dxNNdbIuv4vm71GNYyzOhbqIc2NEVsvvp/SAFwH7LE
 mN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MFcg6m6jOFnDqJZ6ed2gEM2Ab/I7Ayg90tDJo8AS/8M=;
 b=Ur2hj1f/umAK73rsPiCIL1iY9pCsdtO+upz74aH9HcrL8Mm7ZP78lKWCoID1wpsrVb
 7DBhYsudgMAQqMTQ0WhWIdHHhPWlu/Oj/0C40pqG/E7M0MjIPbAiPbwW3srpFBX8MAth
 k9w3hoQCsNwwc9A5srbxeUJamF3RU8o1C/+fabD9ptLqNXa3L7QBwq8UjOuSFiSmTCs7
 R/YXHnKzyfSmR0W9nDpCimbOWIdKbot82L3rHft7hILDjAEZYnwiqBp5TEa5ibC8IolG
 vGHJH75ecLtah3iV+AtYbRD5Nwa+yaAZFWU4HDOCDTg86ZSd90LULqamYC83hWUFn8Bq
 Zd+A==
X-Gm-Message-State: AOAM533WjEIKSCuTQo5SxXeYi1YegKdBemwmo2O9wla4uPHU+RPpyvpn
 s5oKmcbV2cKP4ciUscl5nvYKyS480CoNg5jaxM5cPVEdtiO7bFp0
X-Google-Smtp-Source: ABdhPJy4CrD4rMK9WUDrR448uqOo3TZPeGV1qWG7hXyYrqGyPGVTU9bl9GiWk9AzZGcpaaW54ngXyH0h02GcVI6gOj8=
X-Received: by 2002:a17:90b:3b4b:b0:1e8:434c:5ab1 with SMTP id
 ot11-20020a17090b3b4b00b001e8434c5ab1mr12779893pjb.129.1655079788698; Sun, 12
 Jun 2022 17:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220604231004.49990-1-richard.henderson@linaro.org>
 <20220604231004.49990-3-richard.henderson@linaro.org>
In-Reply-To: <20220604231004.49990-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jun 2022 10:22:42 +1000
Message-ID: <CAKmqyKOCE3DERTK0ic=g+TZvLpibMOWqFV0AoZ-CG4xxPxaCjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/riscv: Remove generate_exception_mtval
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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

On Sun, Jun 5, 2022 at 9:13 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The function doesn't set mtval, it sets badaddr. Move the set
> of badaddr directly into gen_exception_inst_addr_mis and use
> generate_exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 9196aa71db..6e4bbea1cd 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -228,14 +228,6 @@ static void generate_exception(DisasContext *ctx, int excp)
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
>
> -static void generate_exception_mtval(DisasContext *ctx, int excp)
> -{
> -    gen_set_pc_imm(ctx, ctx->base.pc_next);
> -    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
> -    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
> -    ctx->base.is_jmp = DISAS_NORETURN;
> -}
> -
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
>      tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> @@ -245,7 +237,8 @@ static void gen_exception_illegal(DisasContext *ctx)
>
>  static void gen_exception_inst_addr_mis(DisasContext *ctx)
>  {
> -    generate_exception_mtval(ctx, RISCV_EXCP_INST_ADDR_MIS);
> +    tcg_gen_st_tl(cpu_pc, cpu_env, offsetof(CPURISCVState, badaddr));
> +    generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
>  }
>
>  static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
> --
> 2.34.1
>
>

