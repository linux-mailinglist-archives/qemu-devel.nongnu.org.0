Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844D4B1DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 06:31:36 +0100 (CET)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIOWt-0006xX-0Y
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 00:31:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUd-00043Q-8E
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:16 -0500
Received: from [2607:f8b0:4864:20::1035] (port=54062
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIOUb-0007a6-3L
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 00:29:14 -0500
Received: by mail-pj1-x1035.google.com with SMTP id qe15so7133391pjb.3
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 21:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jiGsEPX+XLB260r51WD8PqyV8KIs/lSqEV6JAzaIaCI=;
 b=YkYdYvHIv0NLUJ86v9K9Ys9ekvkKXwoBTeNc7nLpL7UX8v0Bo9cZpXIiQjrg6gUEP/
 D5QaFfyw0xuOTOyrVx0+XRcpNDiMV4UIgXr70D6QHPnI4NVhAEv/AgwxCKUznXgWdyXo
 1QSJJNPaNW9kAKc/YOzeAJJnfsBuu8uCyKdEks0KV/ZEdIpY8HEgdErecjfZr54TGRrC
 cXbVlzDXc4+U+is8PjVT+H5pQ6gj9GsrjWwiM350lDFrRWpESRJKP8W1gULzzbYmR2fl
 WmuRSkXIJCVjHl2CQfRruDrEA2VHGcYwFF/klnpM73iXOHejSeiVsimafau9cXstDmtC
 Pxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jiGsEPX+XLB260r51WD8PqyV8KIs/lSqEV6JAzaIaCI=;
 b=PkDA3e7d7NiAP07+2wLV50/5EqDNI5VtJskp05n+FDfjQHUAxiTen35n+pTJB1GJgm
 JnOTFRQvE8yMm4pS9RZk/GWsui6/BmsZx8pL/Mn419ylZHbNam0WWT7cds295iiXugxF
 eUHohQPABxKtDpVbI26ZLVcyODFLwjxDPKJO+UTM1evvG4Yc28K9FtRgDH2naHtaEqx1
 pA0BuaViTrBt/g+eSMGVNaPtKxYr+wIr0FLqvKrq1UHkjBOwmTJzkg6Qf7h5UybqqKp4
 MFBrSqDx/aor2fZzqOlQszlG1f+k9DBXrq7SjY7p9W86tXzR5vCJ2YFLw5fsysJaErAv
 5usQ==
X-Gm-Message-State: AOAM530GnrFCOeeL9WsF8REy3Drzi9MDZe01zAVGbTp6gRDurRQXODKw
 V4TwB/5xakt2FjFOrlfBiZVwHw==
X-Google-Smtp-Source: ABdhPJwfEm7vw6A6dridhH1uq3r2c28/wREnlOcevGbafU5/LGKGE5uAB6CcujJ+nTSfxPrLqvkZ+w==
X-Received: by 2002:a17:903:1210:: with SMTP id
 l16mr10848607plh.63.1644557351859; 
 Thu, 10 Feb 2022 21:29:11 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id b2sm18142477pgg.59.2022.02.10.21.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 21:29:11 -0800 (PST)
Message-ID: <89b611db-cfe3-a6dd-1a15-9d6a60ef23dd@linaro.org>
Date: Fri, 11 Feb 2022 15:51:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 11/37] target/ppc: Implement Vector Compare Equal
 Quadword
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-12-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-12-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
> Implement the following PowerISA v3.1 instructions:
> vcmpequq Vector Compare Equal Quadword
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 43 +++++++++++++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index a0adf18671..39730df32d 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -382,6 +382,7 @@ VCMPEQUB        000100 ..... ..... ..... . 0000000110   @VC
>   VCMPEQUH        000100 ..... ..... ..... . 0001000110   @VC
>   VCMPEQUW        000100 ..... ..... ..... . 0010000110   @VC
>   VCMPEQUD        000100 ..... ..... ..... . 0011000111   @VC
> +VCMPEQUQ        000100 ..... ..... ..... . 0111000111   @VC
>   
>   VCMPGTSB        000100 ..... ..... ..... . 1100000110   @VC
>   VCMPGTSH        000100 ..... ..... ..... . 1101000110   @VC
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 67059ed9b2..bdb0b4370b 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1112,6 +1112,49 @@ TRANS(VCMPNEZB, do_vcmpnez, MO_8)
>   TRANS(VCMPNEZH, do_vcmpnez, MO_16)
>   TRANS(VCMPNEZW, do_vcmpnez, MO_32)
>   
> +static bool trans_VCMPEQUQ(DisasContext *ctx, arg_VC *a)
> +{
> +    TCGv_i64 t0, t1;
> +    TCGLabel *l1, *l2;
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VECTOR(ctx);
> +
> +    t0 = tcg_temp_new_i64();
> +    t1 = tcg_temp_new_i64();
> +    l1 = gen_new_label();
> +    l2 = gen_new_label();
> +
> +    get_avr64(t0, a->vra, true);
> +    get_avr64(t1, a->vrb, true);
> +    tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, l1);
> +
> +    get_avr64(t0, a->vra, false);
> +    get_avr64(t1, a->vrb, false);
> +    tcg_gen_brcond_i64(TCG_COND_NE, t0, t1, l1);

It would be much better to not use a branch.
E.g.

     get_avr64(t0, a->vra, true);
     get_avr64(t1, a->vrb, true);
     tcg_gen_xor_i64(c0, t0, t1);

     get_avr64(t0, a->vra, false);
     get_avr64(t1, a->vrb, false);
     tcg_gen_xor_i64(c1, t0, t1);

     tcg_gen_or_i64(c0, c0, c1);
     tcg_gen_setcondi_i64(TCG_COND_EQ, c0, c0, 0);
     tcg_gen_neg_i64(c0, c0);

     set_avr64(a->vrt, c0, true);
     set_avr64(a->vrt, c0, false);

     tcg_gen_extrl_i64_i32(crf, c0);
     tcg_gen_andi_i32(crf, crf, 0xa);
     tcg_gen_xori_i32(crf, crf, 0x2);


r~

