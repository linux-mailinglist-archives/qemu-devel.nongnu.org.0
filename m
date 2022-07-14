Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEFF575578
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:56:13 +0200 (CEST)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC40S-00054N-HL
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC3q3-0002xU-21; Thu, 14 Jul 2022 14:45:29 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC3q1-0005sS-08; Thu, 14 Jul 2022 14:45:26 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so3481556fac.13; 
 Thu, 14 Jul 2022 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=swQEHZoJRQkOrbcbv9pVlVka0KryQJV2APDF4/rKhU0=;
 b=PBbaDCtn2WISfq13ybohkvpV+zvgJHIlomO4GFOhepxqXK/GWToOr72bCH8qcDekwp
 CU/upuFZqSltf90q3mg3C9coaQft1SAFBa+wVJ5GSoWTY5+rtrat/FzIZ0foS6fqoBKM
 XIEOUPrg4JOTRLYG4dsKnkL0CgTr7UYxKfbIkXtqojvL/L0OeVGgZOMMIvDtpjw7pcXO
 56tfSUFoAf4BjdEAbYCEBEkPMjcOyyeCrF+vHfaMxeR8wRQrq9YtPKaq0BrHZB2m4cJm
 ZU2tflij5gCfs8cTlnidef+uP+QDhhTRh0nZ4l6b2w6tT4ncgjkWg8AvI2rBkQ/7GE8P
 +clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=swQEHZoJRQkOrbcbv9pVlVka0KryQJV2APDF4/rKhU0=;
 b=15NbJQLjhQ6Z1dpkeG6UlrGLKXjzBoYvztWGHGboahxicjjsYvXdQGc7ct3ZvPkqhF
 i2OHhp/EPqMhpnQc9ZuaisjGSayI0wUrvJvzbPyErp9ES78MadJIUcRrtae/7pkOvISv
 veO4TZwpzeap/DWDFYzoEREYINDN8+HMVBZprSfy5Dgo9bcLB8iFiA85y6pSLOCkaRxM
 /OgsUaPZB5POe3sdbrg0m5oGiTRavmMrCLwquyzTYb2m/vq1fScPdRag4a8fkISd33NV
 LpMsDfdXhWI0YhpoPp8ypXtN/Uk98okoLMUpyE4dEtyzpa+JB3CABd5bp0anMoiJYL9S
 Acjg==
X-Gm-Message-State: AJIora/Y46OOndgEojuGZVBJ8f9alWsJDY5uKONsD0X87Ya7OW0qHkLr
 LjtDp6OQpXFcGcralsgj3NE=
X-Google-Smtp-Source: AGRyM1tbiBmqYZ8FdU7uzUsqKybCAooNXqRLEKhAhq2oSdFVEeg2U8LRX3viA+GIhRkW2yWjKXrcGg==
X-Received: by 2002:a05:6870:88a8:b0:101:6409:ae26 with SMTP id
 m40-20020a05687088a800b001016409ae26mr5224626oam.160.1657824323198; 
 Thu, 14 Jul 2022 11:45:23 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 188-20020aca06c5000000b0032f662af5d5sm944879oig.1.2022.07.14.11.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 11:45:22 -0700 (PDT)
Message-ID: <5bef219f-cfdd-f2bb-d2e9-f2ea6b4df213@gmail.com>
Date: Thu, 14 Jul 2022 15:45:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] target/ppc: Move tlbie[l] to decode tree
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, richard.henderson@linaro.org
References: <20220712193741.59134-1-leandro.lupori@eldorado.org.br>
 <20220712193741.59134-2-leandro.lupori@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220712193741.59134-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 7/12/22 16:37, Leandro Lupori wrote:
> Also decode RIC, PRS and R operands.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/cpu_init.c                        |  4 +-
>   target/ppc/insn32.decode                     |  8 ++
>   target/ppc/translate.c                       | 64 +-------------
>   target/ppc/translate/storage-ctrl-impl.c.inc | 87 ++++++++++++++++++++
>   4 files changed, 99 insertions(+), 64 deletions(-)
>   create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index c16cb8dbe7..8d7e77f778 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6368,7 +6368,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>                          PPC_FLOAT_EXT |
>                          PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_MEM_TLBSYNC |
> +                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>                          PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
>                          PPC_SEGMENT_64B | PPC_SLBI |
>                          PPC_POPCNTB | PPC_POPCNTWD |
> @@ -6585,7 +6585,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>                          PPC_FLOAT_EXT |
>                          PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>                          PPC_MEM_SYNC | PPC_MEM_EIEIO |
> -                       PPC_MEM_TLBSYNC |
> +                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>                          PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
>                          PPC_SEGMENT_64B | PPC_SLBI |
>                          PPC_POPCNTB | PPC_POPCNTWD |
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 6ea48d5163..2b985249b8 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -809,3 +809,11 @@ VMODSD          000100 ..... ..... ..... 11111001011    @VX
>   VMODUD          000100 ..... ..... ..... 11011001011    @VX
>   VMODSQ          000100 ..... ..... ..... 11100001011    @VX
>   VMODUQ          000100 ..... ..... ..... 11000001011    @VX
> +
> +## TLB Management Instructions
> +
> +&X_tlbie        rb rs ric prs:bool r:bool
> +@X_tlbie        ...... rs:5 - ric:2 prs:1 r:1 rb:5 .......... .     &X_tlbie

You're marking bit 11 as ignored but you're not marking 31 as ignored. The way
the argument patterns are made in this file seems to be either not mark the
ignored bits (e.g. most of args from the start of the file) or mark all ignore
bits (e.g. @XL_S from RFEBB).

I am being petty, yes. This makes no functional change in the instruction, but
I'd rather mark bit 31 as ignored in @X_tlbie as well.

I did that in my tree and it seems to work fine. If you're ok with this change,



Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



> +
> +TLBIE           011111 ..... - .. . . ..... 0100110010 -            @X_tlbie
> +TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 1d6daa4608..4fcb311c2d 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5424,64 +5424,6 @@ static void gen_tlbia(DisasContext *ctx)
>   #endif  /* defined(CONFIG_USER_ONLY) */
>   }
>   
> -/* tlbiel */
> -static void gen_tlbiel(DisasContext *ctx)
> -{
> -#if defined(CONFIG_USER_ONLY)
> -    GEN_PRIV;
> -#else
> -    bool psr = (ctx->opcode >> 17) & 0x1;
> -
> -    if (ctx->pr || (!ctx->hv && !psr && ctx->hr)) {
> -        /*
> -         * tlbiel is privileged except when PSR=0 and HR=1, making it
> -         * hypervisor privileged.
> -         */
> -        GEN_PRIV;
> -    }
> -
> -    gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
> -#endif /* defined(CONFIG_USER_ONLY) */
> -}
> -
> -/* tlbie */
> -static void gen_tlbie(DisasContext *ctx)
> -{
> -#if defined(CONFIG_USER_ONLY)
> -    GEN_PRIV;
> -#else
> -    bool psr = (ctx->opcode >> 17) & 0x1;
> -    TCGv_i32 t1;
> -
> -    if (ctx->pr) {
> -        /* tlbie is privileged... */
> -        GEN_PRIV;
> -    } else if (!ctx->hv) {
> -        if (!ctx->gtse || (!psr && ctx->hr)) {
> -            /*
> -             * ... except when GTSE=0 or when PSR=0 and HR=1, making it
> -             * hypervisor privileged.
> -             */
> -            GEN_PRIV;
> -        }
> -    }
> -
> -    if (NARROW_MODE(ctx)) {
> -        TCGv t0 = tcg_temp_new();
> -        tcg_gen_ext32u_tl(t0, cpu_gpr[rB(ctx->opcode)]);
> -        gen_helper_tlbie(cpu_env, t0);
> -        tcg_temp_free(t0);
> -    } else {
> -        gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
> -    }
> -    t1 = tcg_temp_new_i32();
> -    tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
> -    tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
> -    tcg_gen_st_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
> -    tcg_temp_free_i32(t1);
> -#endif /* defined(CONFIG_USER_ONLY) */
> -}
> -
>   /* tlbsync */
>   static void gen_tlbsync(DisasContext *ctx)
>   {
> @@ -6699,6 +6641,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
>   
>   #include "translate/branch-impl.c.inc"
>   
> +#include "translate/storage-ctrl-impl.c.inc"
> +
>   /* Handles lfdp */
>   static void gen_dform39(DisasContext *ctx)
>   {
> @@ -6937,10 +6881,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
>    * XXX Those instructions will need to be handled differently for
>    * different ISA versions
>    */
> -GEN_HANDLER(tlbiel, 0x1F, 0x12, 0x08, 0x001F0001, PPC_MEM_TLBIE),
> -GEN_HANDLER(tlbie, 0x1F, 0x12, 0x09, 0x001F0001, PPC_MEM_TLBIE),
> -GEN_HANDLER_E(tlbiel, 0x1F, 0x12, 0x08, 0x00100001, PPC_NONE, PPC2_ISA300),
> -GEN_HANDLER_E(tlbie, 0x1F, 0x12, 0x09, 0x00100001, PPC_NONE, PPC2_ISA300),
>   GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
>   #if defined(TARGET_PPC64)
>   GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
> diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
> new file mode 100644
> index 0000000000..7793297dd4
> --- /dev/null
> +++ b/target/ppc/translate/storage-ctrl-impl.c.inc
> @@ -0,0 +1,87 @@
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
> + * Store Control Instructions
> + */
> +
> +static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
> +{
> +#if defined(CONFIG_USER_ONLY)
> +    gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
> +    return true;
> +#else
> +    TCGv_i32 t1;
> +    int rb;
> +
> +    rb = a->rb;
> +
> +    if ((ctx->insns_flags2 & PPC2_ISA300) == 0) {
> +        /*
> +         * Before Power ISA 3.0, the corresponding bits of RIC, PRS, and R
> +         * (and RS for tlbiel) were reserved fields and should be ignored.
> +         */
> +        a->ric = 0;
> +        a->prs = false;
> +        a->r = false;
> +        if (local) {
> +            a->rs = 0;
> +        }
> +    }
> +
> +    if (ctx->pr) {
> +        /* tlbie[l] is privileged... */
> +        gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
> +        return true;
> +    } else if (!ctx->hv) {
> +        if ((!a->prs && ctx->hr) || (!local && !ctx->gtse)) {
> +            /*
> +             * ... except when PRS=0 and HR=1, or when GTSE=0 for tlbie,
> +             * making it hypervisor privileged.
> +             */
> +            gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
> +            return true;
> +        }
> +    }
> +
> +    if (!local && NARROW_MODE(ctx)) {
> +        TCGv t0 = tcg_temp_new();
> +        tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
> +        gen_helper_tlbie(cpu_env, t0);
> +        tcg_temp_free(t0);
> +    } else {
> +        gen_helper_tlbie(cpu_env, cpu_gpr[rb]);
> +    }
> +
> +    if (local) {
> +        return true;
> +    }
> +
> +    t1 = tcg_temp_new_i32();
> +    tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
> +    tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
> +    tcg_gen_st_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
> +    tcg_temp_free_i32(t1);
> +
> +    return true;
> +#endif
> +}
> +
> +TRANS_FLAGS(MEM_TLBIE, TLBIE, do_tlbie, false)
> +TRANS_FLAGS(MEM_TLBIE, TLBIEL, do_tlbie, true)

