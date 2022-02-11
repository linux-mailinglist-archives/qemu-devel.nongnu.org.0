Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0BC4B1DEC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 06:32:01 +0100 (CET)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIOXI-0008AI-5H
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 00:32:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOV7-0004fk-QT
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:45 -0500
Received: from [2607:f8b0:4864:20::102e] (port=41844
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOV4-0007dN-Cf
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:44 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso7849298pjg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 21:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nmJnMNa/9CaitGvAvY4YWb8vjtdvTNnPcSPtRPKyFNo=;
 b=xFZFoz6LkiCwzoNMDTpQpoEsLuVoH+uY2fIjvAIUmxOk/mA+/B0yWzleyCE3y69zMz
 OZeT2kb7E4zmxXcX0mLx99SeaBEMrhJXLNiybleMC8sK08rKAtD84gMq0OodlwHvNo9D
 R71oA3XS8FEX9mAbNjOqmv5owDGKzbqywn/XicKG7L/UkEdqqieL2M6DX1iGptlvvPKn
 lY53Fz2la4jgzheQIgKtwOEd7Ridj4+h10D3HLSbfK4B+Xh95e+w3KWaVpoZ7S9bs73Y
 QMgk9+A17htul0EmKbSbOZH2+xdfwJVIjIfNiwm2c43KfeG1x3Fd6sF6Ilt5wUa962ai
 kVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nmJnMNa/9CaitGvAvY4YWb8vjtdvTNnPcSPtRPKyFNo=;
 b=W8DuDM3WedpZFDn10/1nzFC3q53zf58xgirFc6OVEVjmc3m4xJfj/uROjlfTG3K+VN
 yvKtzpryGL80LBAS1QIhW5DIH+Ds+QM5AaLb5iyY1EsaylKSBQ5WxII0G7rwjQUE0rU/
 ZqJ0eJZn48ICKHmCrxtOt7PodxKSvgZDSybh0XSyIPn4OzgR5x+KYLA+oHD/htIzqGTd
 vesBAMs6a30yfCMqdtFjAVCdchRgLL+aQ61NMbcLcjMARsWIT8+40GIWOXAgWOT/EY/O
 EbiDTwXzKcRSm74Wr+DzDe/iTpJeUI/VtUZSpek0cNUZrV/zmf2ca1pNB0WBuVwql1wK
 H7Ow==
X-Gm-Message-State: AOAM531lGJYASO/KnI8P8SqiQxwfOygR5Na3OIbQwuFf7gVjs183DxTm
 7X91vGrdcOXqX6jQuUcVmcuAr2KWFk4/jHiB
X-Google-Smtp-Source: ABdhPJwTvItgdvN/TRBuU1A5EE6EzuyjXO3YdNs15aJXVSZzkii1C7tAEyf3aIPTPlCJockWsT97pg==
X-Received: by 2002:a17:90b:4a48:: with SMTP id
 lb8mr969290pjb.246.1644557381026; 
 Thu, 10 Feb 2022 21:29:41 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id k16sm25522381pfu.140.2022.02.10.21.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 21:29:40 -0800 (PST)
Message-ID: <8d0fbe64-49c1-deba-1141-6bd6ca06c2cf@linaro.org>
Date: Fri, 11 Feb 2022 16:20:59 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 15/37] target/ppc: implement vclrlb
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-16-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-16-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/translate/vmx-impl.c.inc | 56 +++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index ea497ecd80..483651cf9c 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -501,6 +501,8 @@ VSTRIBR         000100 ..... 00001 ..... . 0000001101   @VX_tb_rc
>   VSTRIHL         000100 ..... 00010 ..... . 0000001101   @VX_tb_rc
>   VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
>   
> +VCLRLB          000100 ..... ..... ..... 00110001101    @VX
> +
>   # VSX Load/Store Instructions
>   
>   LXV             111101 ..... ..... ............ . 001   @DQ_TSX
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 8bcf637ff8..3fb4935bff 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1956,6 +1956,62 @@ TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
>   TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
>   TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
>   
> +static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
> +{
> +    TCGv_i64 hi, lo, rb;
> +    TCGLabel *l, *end;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VECTOR(ctx);
> +
> +    l = gen_new_label();
> +    end = gen_new_label();
> +
> +    hi = tcg_const_local_i64(0);
> +    lo = tcg_const_local_i64(0);
> +    rb = tcg_temp_local_new_i64();
> +
> +    tcg_gen_extu_tl_i64(rb, cpu_gpr[a->vrb]);
> +
> +    /* RB == 0: all zeros */
> +    tcg_gen_brcondi_i64(TCG_COND_EQ, rb, 0, end);
> +
> +    get_avr64(lo, a->vra, false);
> +
> +    /* RB <= 8 */
> +    tcg_gen_brcondi_i64(TCG_COND_LEU, rb, 8, l);
> +
> +    get_avr64(hi, a->vra, true);
> +
> +    /* RB >= 16: just copy VRA to VRB */
> +    tcg_gen_brcondi_i64(TCG_COND_GEU, rb, 16, end);
> +
> +    /* 8 < RB < 16: copy lo and partially clear hi */
> +    tcg_gen_subfi_i64(rb, 16, rb);
> +    tcg_gen_shli_i64(rb, rb, 3);
> +    tcg_gen_shl_i64(hi, hi, rb);
> +    tcg_gen_shr_i64(hi, hi, rb);
> +    tcg_gen_br(end);
> +
> +    /* 0 < RB <= 8: zeroes hi and partially clears lo */
> +    gen_set_label(l);
> +    tcg_gen_subfi_i64(rb, 8, rb);
> +    tcg_gen_shli_i64(rb, rb, 3);
> +    tcg_gen_shl_i64(lo, lo, rb);
> +    tcg_gen_shr_i64(lo, lo, rb);

There's a bit of redundancy here, and if we exploit that we can remove the branches.

Compute the mask modulo 8.  That result applies to either the first or second word, or 
neither.  Use 3 movcond to select among the cases:

    sh = (rb & 7) << 3;
    mask = ~(-1 << sh);
    ml = rb < 8 ? mask : 0;
    mh = rb < 8 ? 0 : mask;
    mh = rb < 16 ? mh : -1;
    lo &= ml;
    hi &= mh;


r~

