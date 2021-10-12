Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F283042AF17
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:38:05 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPTJ-00007b-0o
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maPR8-0005pj-1v
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:35:50 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maPR5-00017Y-Lg
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:35:49 -0400
Received: by mail-io1-xd2f.google.com with SMTP id p68so489316iof.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k8c3I3RCSVUtSablS1WId3uFyRqF80UVH0BUwJs2+LU=;
 b=a92JVPn1JiQWGYXYqXqKS+coqiXfvtSxE4xMwfyTNggGBcDAJSSupvATQPTGk/IgpU
 9mMjFGdRXfqrIhyMZftO8aiihm30KdR4KalNwxb7WawOrFttyaMk0Go+FVn5cyeoNaz8
 OJ+BMsFmDShit0osaF9zBlesy97mHvC7DI5ktbnCchciIe6J2a+LBu84Tf6j6vU46ZPF
 ab5GzCRQYYg/Sd10b//aVKvi59n830I6y3GI3gLqbCPbv8s96vGUgFgJl5omkesoetkp
 FElb6chODt72zI5qW+zWCISubn52sVXuH2SKr3inVm8mQF3+C1In3q/H1BQmjfQO4akE
 ktZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8c3I3RCSVUtSablS1WId3uFyRqF80UVH0BUwJs2+LU=;
 b=g5yvRyx/4oojN5u+3uImx9uIlHapeYk2T+czkI8d05bZlnVj2verYPA8S/aneEtgno
 7wyEd7OVQDDw1yZOPu1Rq8Yp3ux68uxWcq699WNHxKhCi5e1wUh4Ff+vf+3Ei/tnJUmj
 KMQuXi0EtbxamJ5wkD1hmACKj6lEx7YXC0T6izTLQO7m8C781N5WrDX8WkhdIovPrmJG
 JzpTEMJao+swL+VEmhd8vIgHOHgHzu40c0fIk606pNvdGywGwtSmMZSAw8r2iK8JNPxR
 GbpmAc0VZHMV6Zzq1qsMve4EXNYin9tvrnOY4lP5+KHQiR5fmZFJOtI70opcOIJKBwiD
 raIA==
X-Gm-Message-State: AOAM530v8xk+PkNOdaIuB4F2N0SDlkzB/qOvHwp9UEZ4r4cnimj2dMDK
 N5b4s/bG3D3lSRCll7Cc2L0vaY7LHcLQqTbF/pnaaym8OQoguw==
X-Google-Smtp-Source: ABdhPJzDUWiSyxbYCmgphp2MxKjypbIfl/Ks75XNK1HrTHn6mUwb8+nRFSvelwIgVUtdvOl6oZdGSnjfE8SNqhtR4Tw=
X-Received: by 2002:a05:6638:9a:: with SMTP id
 v26mr10271366jao.18.1634074546654; 
 Tue, 12 Oct 2021 14:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-18-richard.henderson@linaro.org>
In-Reply-To: <20211012162159.471406-18-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 07:35:20 +1000
Message-ID: <CAKmqyKPFoy0R5amTwgrq+MPkL3eGQ6zts_ExP_awTVdX90_-Jw@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] target/riscv: Remove dead code after exception
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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

On Wed, Oct 13, 2021 at 2:35 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have already set DISAS_NORETURN in generate_exception,
> which makes the exit_tb unreachable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_privileged.c.inc | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 32312be202..a7afcb15ce 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -22,8 +22,6 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
>  {
>      /* always generates U-level ECALL, fixed in do_interrupt handler */
>      generate_exception(ctx, RISCV_EXCP_U_ECALL);
> -    exit_tb(ctx); /* no chaining */
> -    ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  }
>
> @@ -60,13 +58,11 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>          post   = opcode_at(&ctx->base, post_addr);
>      }
>
> -    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
> +    if (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
>          generate_exception(ctx, RISCV_EXCP_SEMIHOST);
>      } else {
>          generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
>      }
> -    exit_tb(ctx); /* no chaining */
> -    ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  }
>
> --
> 2.25.1
>
>

