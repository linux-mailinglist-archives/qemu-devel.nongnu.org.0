Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AB4827AE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jan 2022 14:17:04 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3eFr-0002m2-14
	for lists+qemu-devel@lfdr.de; Sat, 01 Jan 2022 08:17:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n3eEh-0001uJ-Bi
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 08:15:51 -0500
Received: from [2a00:1450:4864:20::42e] (port=40482
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n3eEf-0001WP-2n
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 08:15:51 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q16so60560857wrg.7
 for <qemu-devel@nongnu.org>; Sat, 01 Jan 2022 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SatgV+RMvTwTvHGyt4nEXoJAgF0vRCGgej/z8x3N8qA=;
 b=a7ffHTEm9TSoqZgaPKbkRV6VWf0FYM8RNBtBXUFXAdHDNvOoHLnaBhcSYxGTn6fkHf
 sQbWEVEdRS1L94tUO7wE3XZnDlrz2FkpVmMkXBzofh/sInYSY2HrbvBz5WbabTpj59KS
 qTJp1jm7OFtRlQTPpKbsHVYIf2BGD61P5XK14D84nE7IEVQp/d9tqI3YjHKRaWwjh29T
 5BDLVj7YSadXBjvwcKEXdXD9BngW9JrgLHdvaB7ZHGsnkazSUDzLetwidVJn3aenkmA6
 tEKMysASCyLJluvZ9+Vj10zvotdwztNYYM04ThGsaMgGPj0BQkJQ6HmflPRO2B1c6+be
 CgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SatgV+RMvTwTvHGyt4nEXoJAgF0vRCGgej/z8x3N8qA=;
 b=T7aT+1xH+QQ09DppLRxgFFGyqf4UqWyZOhFj3jHrQT+N/1B2tmCgs2mRJg8F8iez6G
 Ddp4snk/4/r4JPHku7XKv+7ehq9sDYRwvlKk5MfDhy0yXz5OU4YHRup2aVmrHskCH//w
 H9tfucKpZPzJQ4Rz8+jTU/DSkNpJENZSMkj3ORiJOAtBmarnbehjtkTH8l+UoLMYdrXZ
 k5Ab7eiMHYRumdVYa6zIDsW1lnvPdOowMm4hwwunD4MFO/+jGHDJS/DbZnY4P+b7Ho/j
 bH8ntIX5Jv7z4nD2KXMl37VTTKleWkrXL7ZK6RlHYPJrEiHnsXjVxjnjzdR4+tic1deD
 SR0g==
X-Gm-Message-State: AOAM53272+KfVOE2nm6JdoNI0tkfLfcqpzE2bA926XH4iN5KXGZQwGny
 +rYg2Cyy0lJAxCVXW8LVxnjssbUnGGNRr3NLNTJnIQ==
X-Google-Smtp-Source: ABdhPJxCfgqLw8qo3e5IAYOnb5WtQUD2d+7XVf82eWd/q5AduWkWQyiLhg4wW5N6hfwlS39yNFypjTVn44cq0EYtTvo=
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr32111208wrd.346.1641042946915; 
 Sat, 01 Jan 2022 05:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20211231080923.24252-1-liweiwei@iscas.ac.cn>
 <20211231080923.24252-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20211231080923.24252-3-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Jan 2022 18:45:36 +0530
Message-ID: <CAAhSdy32+q_oT4hE2ohsVnNcaEK29=BWnqyu5V3MQuXUMA7Rvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: add support for svinval extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42e;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, wangjunqiang@iscas.ac.cn,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 31, 2021 at 1:43 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu.c                          |  1 +
>  target/riscv/cpu.h                          |  1 +
>  target/riscv/insn32.decode                  |  7 ++
>  target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  5 files changed, 85 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cbcb7f522b..77ef0f85fe 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -647,6 +647,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
> +    DEFINE_PROP_BOOL("x-svinval", RISCVCPU, cfg.ext_svinval, false),

Please drop the "x-" prefix. The Svinval extension is already ratified.

Regards,
Anup

>      DEFINE_PROP_BOOL("x-svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1fbbde28c6..5dd9e53293 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -315,6 +315,7 @@ struct RISCVCPU {
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_svinval;
>          bool ext_svnapot;
>          bool ext_zfh;
>          bool ext_zfhmin;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 8617307b29..809464113a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -784,3 +784,10 @@ fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
> +
> +# *** Svinval Standard Extension ***
> +sinval_vma        0001011 ..... ..... 000 00000 1110011 @sfence_vma
> +sfence_w_inval    0001100 00000 00000 000 00000 1110011
> +sfence_inval_ir   0001100 00001 00000 000 00000 1110011
> +hinval_vvma       0011011 ..... ..... 000 00000 1110011 @hfence_vvma
> +hinval_gvma       0111011 ..... ..... 000 00000 1110011 @hfence_gvma
> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
> new file mode 100644
> index 0000000000..1dde665661
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
> @@ -0,0 +1,75 @@
> +/*
> + * RISC-V translation routines for the Svinval Standard Instruction Set.
> + *
> + * Copyright (c) 2020-2021 PLCT lab
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#define REQUIRE_SVINVAL(ctx) do {                    \
> +    if (!RISCV_CPU(ctx->cs)->cfg.ext_svinval) {      \
> +        return false;                                \
> +    }                                                \
> +} while (0)
> +
> +static bool trans_sinval_vma(DisasContext *ctx, arg_sinval_vma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as sfence.vma currently */
> +    REQUIRE_EXT(ctx, RVS);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> +
> +static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    REQUIRE_EXT(ctx, RVS);
> +    /* Do nothing currently */
> +    return true;
> +}
> +
> +static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    REQUIRE_EXT(ctx, RVS);
> +    /* Do nothing currently */
> +    return true;
> +}
> +
> +static bool trans_hinval_vvma(DisasContext *ctx, arg_hinval_vvma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as hfence.vvma currently */
> +    REQUIRE_EXT(ctx, RVH);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_hyp_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> +
> +static bool trans_hinval_gvma(DisasContext *ctx, arg_hinval_gvma *a)
> +{
> +    REQUIRE_SVINVAL(ctx);
> +    /* Do the same as hfence.gvma currently */
> +    REQUIRE_EXT(ctx, RVH);
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_hyp_gvma_tlb_flush(cpu_env);
> +    return true;
> +#endif
> +    return false;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 5df6c0d800..47541a4db0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -651,6 +651,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>  #include "insn_trans/trans_rvb.c.inc"
>  #include "insn_trans/trans_rvzfh.c.inc"
>  #include "insn_trans/trans_privileged.c.inc"
> +#include "insn_trans/trans_svinval.c.inc"
>
>  /* Include the auto-generated decoder for 16 bit insn */
>  #include "decode-insn16.c.inc"
> --
> 2.17.1
>
>

