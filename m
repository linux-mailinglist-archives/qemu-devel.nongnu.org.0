Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8868B2F7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 01:03:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOoxa-0001uX-J2; Sun, 05 Feb 2023 19:02:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoxX-0001uA-7A
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 19:02:11 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pOoxU-0005UT-3f
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 19:02:10 -0500
Received: by mail-vs1-xe32.google.com with SMTP id a24so11071947vsl.2
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 16:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BQHDUj3tn+tupjdBoTIO2i76pdBK+eiKuvryAKOW9M8=;
 b=FkDAItRpAj2zcED1leZ5pZ3YLjCLmFdcePrr+YQmP7Gossa1b5oAMgsQanqw2QvMbM
 5lFMcfsvTAK/vzpYaEQAr3hwj/sAz/oV8dlssCn6zhJls1Q8VI9easYZDel35Jx/2hpn
 jBTG8AaDMyzhx+btj8nxoVvZmfKpDrB+VNF5QWdKIZBZc5s/IIvoXhWlOl1Xa+BNAxBb
 UqMOicLWLEdXwksHqxxVHQi0ji184dtowX+oNT53SJaL4fq9Ql8B3JUhA79mnpUldrm0
 OvJznFaFCLxvx/6X2y8+kz+PQizXo+fPS/lXvLJLSr/N7BilOx/HB8nmBIw+AJpfZXyV
 5G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BQHDUj3tn+tupjdBoTIO2i76pdBK+eiKuvryAKOW9M8=;
 b=hChBecbFnpeiEGkbcZpkQguygUZxSgGKZyB+3t92wo+b5GlZ8mKYsOKvOA97fHzYh0
 qVy1VOyylv7Pp3CJ/y35jEmJ3gVggb2rSlKrrsep2QVzO+YH9hfzXCVgbxojM4JviuR3
 gnIMfO/Dxj4grbu7pri4rPDiScqjWiPooNBxU3TUGpY0eW7LN7vaZAkVqrl6qznN6ILn
 OXeeIUQzqD7xkMMRIwScTg1t5cVtC5HeLZ4dz1Cus6g4E+j1k1ZoTLczuH95+LDmTdxy
 32QylJAwQTzHO7fCxzkF1t2gXsh/bYQtmbdZ+RtEsp1A7gYvwkR79zvKSArRSZkUHaWM
 GS3Q==
X-Gm-Message-State: AO0yUKXnDkNfdl4nRAhG1P1jKBl84liluk2I+EUABYEVvwaIvPTw+D5t
 krw7Ah6vpUqg2JBDCXuXwNY3s+vFrfYHiSGPwU6JW6QmNNo=
X-Google-Smtp-Source: AK7set8PRcd4M8WKuXCnXxvtJEJRW/rmZkxr6N+3iSkjktbWjRsO8nOnE8eIePzLKN7uNRd7qShJqrQGjxq0yMcMzSc=
X-Received: by 2002:a67:ab0f:0:b0:401:5ed:9a8 with SMTP id
 u15-20020a67ab0f000000b0040105ed09a8mr2365984vse.10.1675641726987; 
 Sun, 05 Feb 2023 16:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20230127191758.755844-1-debug@rivosinc.com>
In-Reply-To: <20230127191758.755844-1-debug@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 10:01:41 +1000
Message-ID: <CAKmqyKNUEiEODbhAd4MESN-dD2qm2jTVC90ko=7MFv1hBBdJhA@mail.gmail.com>
Subject: Re: [PATCH: fix for virt instr exception] target/riscv: fix for
 virtual instr exception
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Jan 28, 2023 at 6:36 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> commit fb3f3730e4 added mechanism to generate virtual instruction
> exception during instruction decode when virt is enabled.
>
> However in some situations, illegal instruction exception can be raised
> due to state of CPU. One such situation is implementing branch tracking.
> [1] An indirect branch if doesn't land on a landing pad instruction, then
> cpu must raise an illegal instruction exception.
> Implementation would raise such expcetion due to missing landing pad inst
> and not due to decode. Thus DisasContext must have `virt_inst_excp`
> initialized to false during DisasContxt initialization for TB.
>
> [1] - https://github.com/riscv/riscv-cfi
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index df38db7553..76f61a39d3 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1167,6 +1167,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
>      ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>      ctx->zero = tcg_constant_tl(0);
> +    ctx->virt_inst_excp = false;
>  }
>
>  static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
> --
> 2.25.1
>
>

