Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED4D531136
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:51:49 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8TK-0005rS-1G
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nt8Qk-00057Z-LD; Mon, 23 May 2022 09:49:06 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:46380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nt8Qg-0002tj-Fy; Mon, 23 May 2022 09:49:06 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-d39f741ba0so18458680fac.13; 
 Mon, 23 May 2022 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NRiuj0JNEt5g2A5nOkBEp8pZFr+dMFxbjPXPsl10Id4=;
 b=X6cz/7rnqC+eO+6cB1XQUEJ2VSBOocHSji0BSCsTe7Q3dpwf6m8DSTQau5xhx5y0sh
 va052ZPAdW76aF3x+QCtnLlTxgJW1BWlAxsCoZApZ6jQWSnz53lLYFGnMAMnPNDD1+U2
 PnVycxGavhLhpA40ZDseyXB76yhNXvTiGNKpDZ4mmOkXccptL0iWuOe0GkoCymHaTTAt
 SjUVw7GjNvPpgBwqxknKnmA4j6sk25UrUtvQU0ApKtsPtTH+H/P18Bsj8nRQJXZu6P4D
 VCzNLPseyin/lI0X6qjdXHPWDJfxB0Ip2MikUcP9KVMVuRdJzYKrEDmZUwNMWrrtEhYT
 T+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NRiuj0JNEt5g2A5nOkBEp8pZFr+dMFxbjPXPsl10Id4=;
 b=hDrGNgldUc9bIdiMgLTy2ejUxEFiOTgMxWwvNp3a/2wFYGV1hamHQylqh2m2afrk28
 W1fT9tykXsPtHy1PxufxIpE0kVlYIP2pihc5vOJbeN6GC6iWx9VARWRwtbkfQ1QUIjkI
 uKKhps7rQv226R8ClDfmFLmks5pSHDqGXxcLeE7ZEgvYRyluHhhM4mNyKKjp9lS58RyI
 ClOFNN/uuRrWnpG8vvi9iMZdVuA5r8YSlHJ+qvFceBwKXgpWdQZLzGaPt8rW3XEfhjEC
 XjXfR25F3UwjAy/omXlrSgzULtLyYKVtmSzwBvF1ODHEQXRo1fmvt9Mly175+bWElq+I
 5dRQ==
X-Gm-Message-State: AOAM532as2cQ1iI5Yb5y7Rwr8c7mnA8DVmQjfmCi+A9g7awZihON2FSr
 i0Ncw/vnQ2sIfGH0bxpwJTk=
X-Google-Smtp-Source: ABdhPJwA8Fetl+d9Jox+6/n/ZrFVVMuuL4RarudElt2F+7Mj5pEE4cYKwfT4Mo12bpwohaJaSoc4rw==
X-Received: by 2002:a05:6870:63a5:b0:f1:9c31:7d8b with SMTP id
 t37-20020a05687063a500b000f19c317d8bmr12822575oap.38.1653313725688; 
 Mon, 23 May 2022 06:48:45 -0700 (PDT)
Received: from [192.168.10.102] (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 t21-20020a056870e75500b000e92d5a54ffsm3787997oak.26.2022.05.23.06.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 06:48:45 -0700 (PDT)
Message-ID: <137135f0-c764-bce3-6c18-da7478de6788@gmail.com>
Date: Mon, 23 May 2022 10:48:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/12] target/ppc: implement xscvspdpn with
 helper_todouble
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
 <20220519201822.465229-7-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220519201822.465229-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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

./scripts/checkpatch.pl is complaining about something that I don't
agree with:


On 5/19/22 17:18, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Move xscvspdpn to decodetree, drop helper_xscvspdpn and use
> helper_todouble directly.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             |  5 -----
>   target/ppc/helper.h                 |  1 -
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vsx-impl.c.inc | 26 +++++++++++++++++++++++++-
>   target/ppc/translate/vsx-ops.c.inc  |  1 -
>   5 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index b4d6f6ed4c..9bde333006 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2875,11 +2875,6 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
>       return (result << 32) | result;
>   }
>   
> -uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
> -{
> -    return helper_todouble(xb >> 32);
> -}
> -
>   /*
>    * VSX_CVT_FP_TO_INT - VSX floating point to integer conversion
>    *   op    - instruction mnemonic
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 4a7cbdf922..5cee55176b 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -395,7 +395,6 @@ DEF_HELPER_3(XSCVSQQP, void, env, vsr, vsr)
>   DEF_HELPER_3(xscvhpdp, void, env, vsr, vsr)
>   DEF_HELPER_4(xscvsdqp, void, env, i32, vsr, vsr)
>   DEF_HELPER_3(xscvspdp, void, env, vsr, vsr)
> -DEF_HELPER_2(xscvspdpn, i64, env, i64)
>   DEF_HELPER_3(xscvdpsxds, void, env, vsr, vsr)
>   DEF_HELPER_3(xscvdpsxws, void, env, vsr, vsr)
>   DEF_HELPER_3(xscvdpuxds, void, env, vsr, vsr)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 1d0b55bde3..d4c2615b1a 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -708,6 +708,7 @@ XSCVUQQP        111111 ..... 00011 ..... 1101000100 -   @X_tb
>   XSCVSQQP        111111 ..... 01011 ..... 1101000100 -   @X_tb
>   XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
>   XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
> +XSCVSPDPN       111100 ..... ----- ..... 101001011 ..   @XX2
>   
>   ## VSX Vector Test Least-Significant Bit by Byte Instruction
>   
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
> index 3692740736..cc0601a14e 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -1045,7 +1045,31 @@ GEN_VSX_HELPER_R2(xscvqpuwz, 0x04, 0x1A, 0x01, PPC2_ISA300)
>   GEN_VSX_HELPER_X2(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300)
>   GEN_VSX_HELPER_R2(xscvsdqp, 0x04, 0x1A, 0x0A, PPC2_ISA300)
>   GEN_VSX_HELPER_X2(xscvspdp, 0x12, 0x14, 0, PPC2_VSX)
> -GEN_VSX_HELPER_XT_XB_ENV(xscvspdpn, 0x16, 0x14, 0, PPC2_VSX207)
> +
> +bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
> +{

^ here


Checking 0006-target-ppc-declare-xscvspdpn-helper-with-call-flags.patch...
ERROR: spaces required around that '*' (ctx:WxV)
#69: FILE: target/ppc/translate/vsx-impl.c.inc:1049:
+bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
                                                  ^

My guess is that since the var 'arg_XX2' ends with a numeral the script
thinks that the following '*' is an arithmetic operation. Problem is that
we have other examples of this kind of declaration in the same file, e.g.:


static bool trans_XVCVBF16SPN(DisasContext *ctx, arg_XX2 *a)



Is there a way to convince checkpatch.pl that this is an okay format?



Thanks,


Daniel




> +    TCGv_i64 t;
> +    TCGv_i32 b;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, VSX207);
> +    REQUIRE_VSX(ctx);
> +
> +    t = tcg_temp_new_i64();
> +    b = tcg_temp_new_i32();
> +
> +    tcg_gen_ld_i32(b, cpu_env, offsetof(CPUPPCState, vsr[a->xb].VsrW(0)));
> +
> +    gen_helper_todouble(t, b);
> +
> +    set_cpu_vsr(a->xt, t, true);
> +    set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
> +
> +    tcg_temp_free_i64(t);
> +    tcg_temp_free_i32(b);
> +
> +    return true;
> +}
> +
>   GEN_VSX_HELPER_X2(xscvdpsxds, 0x10, 0x15, 0, PPC2_VSX)
>   GEN_VSX_HELPER_X2(xscvdpsxws, 0x10, 0x05, 0, PPC2_VSX)
>   GEN_VSX_HELPER_X2(xscvdpuxds, 0x10, 0x14, 0, PPC2_VSX)
> diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
> index b8fd116728..52d7ab30cd 100644
> --- a/target/ppc/translate/vsx-ops.c.inc
> +++ b/target/ppc/translate/vsx-ops.c.inc
> @@ -200,7 +200,6 @@ GEN_XX2FORM(xscvdpspn, 0x16, 0x10, PPC2_VSX207),
>   GEN_XX2FORM_EO(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300),
>   GEN_VSX_XFORM_300_EO(xscvsdqp, 0x04, 0x1A, 0x0A, 0x00000001),
>   GEN_XX2FORM(xscvspdp, 0x12, 0x14, PPC2_VSX),
> -GEN_XX2FORM(xscvspdpn, 0x16, 0x14, PPC2_VSX207),
>   GEN_XX2FORM(xscvdpsxds, 0x10, 0x15, PPC2_VSX),
>   GEN_XX2FORM(xscvdpsxws, 0x10, 0x05, PPC2_VSX),
>   GEN_XX2FORM(xscvdpuxds, 0x10, 0x14, PPC2_VSX),

