Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC086051BE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 23:07:38 +0200 (CEST)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olGHp-00005P-HM
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 17:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olGAC-0001iy-68; Wed, 19 Oct 2022 16:59:44 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:46834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olGA2-0007zA-Mk; Wed, 19 Oct 2022 16:59:43 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1326637be6eso22157252fac.13; 
 Wed, 19 Oct 2022 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iLCT5gj7C/nmF+HDrEsNzSDB0UVImt+x60veZqlDeuE=;
 b=Xv2nlsxkkL859REg2OlR8/lQvOaby4IpPXggbuwabsWjF2JEAoAFPUXaiFMixnzsnK
 +8pmIBfg9Uc44KGP+DA7FYW+/3LlXbaZ4rfJKuGcfONhQC/xyENOUdxdYqTZ7+imUGzf
 Xs1PSf7Tz0bRYYRhl6thrF2kpcxsCdVUTLiK5ZOIYeRehn6EDPDXxZ8EQFGkdORZbSj5
 0x+UsbusxazVEkRxbsk3BD1Kdosy+1U/YTHNCUoOrc3KsuaDxhkHQ4I9fW9p8inYXC8w
 SXGHCJQ96ZO/jG7RDDbk7ki7p1dyibtr/U0/ieMhXSLs4PWfjMJTmJioe0GCGw1wlt7L
 4RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iLCT5gj7C/nmF+HDrEsNzSDB0UVImt+x60veZqlDeuE=;
 b=R+e9jSd0VTeuOqHGnQbifR1J0V+bk8TeZ2iOhejxIfz1OOFvbULMWqGPejhyIPpFY/
 DP4DUYaB1s7SJ6WK8+xL+B+/Q/QyENjdtxRRrdWuJxpGjARMk4mH66bTigwPdG/E9VoO
 uhEGTgOu8eHyEhHc+ms1HXJC+C49pIcRTO1EkayAbZz7tKIvPExIIAU+Zgbsz1U2LbVg
 /jfbRDjYQm7YfwtR3qz2XWvgJACKk5GqogMTxGZDsdrL/yfBqFYg9ZJMdh8XFX/zhA9x
 6pRWJ0pmNg5EWUWbz6uTvTnhufrSNdQx2Ft5IEXlZJc/2pMXAnj5hHHdF5iVRJFg6OGP
 8SIw==
X-Gm-Message-State: ACrzQf2wkYvhFTyEoCPDvMKTvyi+m12fQpuDi6306ebH6DPldYPUrbVX
 A592V+WMlKwUE0j5YZ3QMeI=
X-Google-Smtp-Source: AMsMyM4lCcHEum1hsUO8pyREJ6KHWIcwFHs4bYkc+zH7gmaIJCPVA54cAREbNvu38awke0KqjraFTg==
X-Received: by 2002:a05:6870:d28a:b0:12b:7ed3:cf38 with SMTP id
 d10-20020a056870d28a00b0012b7ed3cf38mr6600873oae.138.1666213172743; 
 Wed, 19 Oct 2022 13:59:32 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a4ac60e000000b004805cfab0ffsm6717148ooq.31.2022.10.19.13.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 13:59:32 -0700 (PDT)
Message-ID: <c092ea3d-d743-1680-1560-d01f577539ee@gmail.com>
Date: Wed, 19 Oct 2022 17:59:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 4/6] target/ppc: move msgclr/msgsnd to decodetree
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
 <20221006200654.725390-5-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221006200654.725390-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/6/22 17:06, Matheus Ferst wrote:
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/insn32.decode                      |  5 ++
>   target/ppc/translate.c                        | 34 +--------
>   .../ppc/translate/processor-ctrl-impl.c.inc   | 70 +++++++++++++++++++
>   3 files changed, 77 insertions(+), 32 deletions(-)
>   create mode 100644 target/ppc/translate/processor-ctrl-impl.c.inc
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index a5249ee32c..bba49ded1b 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -908,3 +908,8 @@ SLBSYNC         011111 ----- ----- ----- 0101010010 -
>   
>   TLBIE           011111 ..... - .. . . ..... 0100110010 -            @X_tlbie
>   TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
> +
> +# Processor Control Instructions
> +
> +MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
> +MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 435066c4a3..889cca6325 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6241,34 +6241,6 @@ static void gen_icbt_440(DisasContext *ctx)
>   
>   /* Embedded.Processor Control */
>   
> -static void gen_msgclr(DisasContext *ctx)
> -{
> -#if defined(CONFIG_USER_ONLY)
> -    GEN_PRIV(ctx);
> -#else
> -    CHK_HV(ctx);
> -    if (is_book3s_arch2x(ctx)) {
> -        gen_helper_book3s_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
> -    } else {
> -        gen_helper_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
> -    }
> -#endif /* defined(CONFIG_USER_ONLY) */
> -}
> -
> -static void gen_msgsnd(DisasContext *ctx)
> -{
> -#if defined(CONFIG_USER_ONLY)
> -    GEN_PRIV(ctx);
> -#else
> -    CHK_HV(ctx);
> -    if (is_book3s_arch2x(ctx)) {
> -        gen_helper_book3s_msgsnd(cpu_gpr[rB(ctx->opcode)]);
> -    } else {
> -        gen_helper_msgsnd(cpu_gpr[rB(ctx->opcode)]);
> -    }
> -#endif /* defined(CONFIG_USER_ONLY) */
> -}
> -
>   #if defined(TARGET_PPC64)
>   static void gen_msgclrp(DisasContext *ctx)
>   {
> @@ -6628,6 +6600,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
>   
>   #include "translate/branch-impl.c.inc"
>   
> +#include "translate/processor-ctrl-impl.c.inc"
> +
>   #include "translate/storage-ctrl-impl.c.inc"
>   
>   /* Handles lfdp */
> @@ -6901,10 +6875,6 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
>                  PPC_NONE, PPC2_BOOKE206),
>   GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
>                  PPC_NONE, PPC2_BOOKE206),
> -GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
> -               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
> -GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
> -               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
>   GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
>                  PPC_NONE, PPC2_ISA300),
>   GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
> diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
> new file mode 100644
> index 0000000000..0192b45c8f
> --- /dev/null
> +++ b/target/ppc/translate/processor-ctrl-impl.c.inc
> @@ -0,0 +1,70 @@
> +/*
> + * Power ISA decode for Storage Control instructions
> + *
> + * Copyright (c) 2022 Instituto de Pesquisas Eldorado (eldorado.org.br)
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +/*
> + * Processor Control Instructions
> + */
> +
> +static bool trans_MSGCLR(DisasContext *ctx, arg_X_rb *a)
> +{
> +    if (!(ctx->insns_flags2 & PPC2_ISA207S)) {
> +        /*
> +         * Before Power ISA 2.07, processor control instructions were only
> +         * implemented in the "Embedded.Processor Control" category.
> +         */
> +        REQUIRE_INSNS_FLAGS2(ctx, PRCNTL);
> +    }
> +
> +    REQUIRE_HV(ctx);
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    if (is_book3s_arch2x(ctx)) {
> +        gen_helper_book3s_msgclr(cpu_env, cpu_gpr[a->rb]);
> +    } else {
> +        gen_helper_msgclr(cpu_env, cpu_gpr[a->rb]);
> +    }
> +#else
> +    qemu_build_not_reached();
> +#endif
> +    return true;
> +}
> +
> +static bool trans_MSGSND(DisasContext *ctx, arg_X_rb *a)
> +{
> +    if (!(ctx->insns_flags2 & PPC2_ISA207S)) {
> +        /*
> +         * Before Power ISA 2.07, processor control instructions were only
> +         * implemented in the "Embedded.Processor Control" category.
> +         */
> +        REQUIRE_INSNS_FLAGS2(ctx, PRCNTL);
> +    }
> +
> +    REQUIRE_HV(ctx);
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    if (is_book3s_arch2x(ctx)) {
> +        gen_helper_book3s_msgsnd(cpu_gpr[a->rb]);
> +    } else {
> +        gen_helper_msgsnd(cpu_gpr[a->rb]);
> +    }
> +#else
> +    qemu_build_not_reached();
> +#endif
> +    return true;
> +}

