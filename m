Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AA4C047B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:22:39 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdYM-0007Vr-9s
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdQT-0005Dh-Pl
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:14:30 -0500
Received: from [2607:f8b0:4864:20::632] (port=35825
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdQR-0006Lp-Ts
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:14:29 -0500
Received: by mail-pl1-x632.google.com with SMTP id i1so3097248plr.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=se/MgFSwP/fkdBstYRq5fnMmVpmPa/GIydSh7eDTSsg=;
 b=ynzlpAu+DsOGIXCw6T1P5ag4wCdjPXcFVxhkj3s/q5aZx6PpeBHy+t0P3fjuGt8rD0
 KDU4s3Ut6cgaMf8amdfUoP4Abl94E8ykinhsvU6RFZMrCs0xomLx7uCXEWficNrW8odn
 YWwbdM3sfjDdEPs/Z3ELrJtnkUzru3IRKRUvfeZfiApehvGE1dxvlpIsvd8T27rPxA3k
 /aO+tahDKpSX/moZQSvC44YDG1y3KmNaoDafztjTN8UDdjARSBGUID7QCDcLYLZhYL2Y
 Z1sW036s3UeXgVmSBO4NZpn82APXG8b/4JaaE+PeT/iGkygvHgNCM/iIJw+91SO9nvu1
 Wo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=se/MgFSwP/fkdBstYRq5fnMmVpmPa/GIydSh7eDTSsg=;
 b=uocvO1KasK8rUDP1RFs7e6MevDVQiE5G8KfX+AUUPQazlO6NESGnqI3FvzCktMDleg
 2fj9X7InGAFk6FLvcI6hhl0X7o3rO3CA55/kFG8lsDT/DRlcSyB/w32cA9gr4vPD69Iz
 YaVzdeWAaezDyYeN2XowfxX9f2SObVDQgksnhHxDEy/CkVCFjlRCgLW/q3LzVeU7bY8m
 zTvuC2skK6LMY5S81OnPkHxhkl9aeRy/5l/Y8uYIDL80Mm/yqe5dsAT/cl05RkuHWts5
 p5UXmYoEvUmhQU6b7oLCaGfJtiYO/dtRF1DycyaIXkXFhJaMP9DwegJetM/zQf8EzVsw
 IEwA==
X-Gm-Message-State: AOAM5307M4d/w3aYCikHDOoocfyRBV9+fAsYGf6l6mso7dk+Z4H8+jxu
 DQehP8FjaSpDLfDu4p5VlpBWeQ==
X-Google-Smtp-Source: ABdhPJw0LhmmkoCu04m10pCWaVUG9cWdqALgfBUeAAYnPfgW6wWeK4oMFeIml7ParVjSOXedcCtPjQ==
X-Received: by 2002:a17:902:f549:b0:14f:a0c5:ced3 with SMTP id
 h9-20020a170902f54900b0014fa0c5ced3mr14326368plf.57.1645568066458; 
 Tue, 22 Feb 2022 14:14:26 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bg20-20020a17090b0d9400b001bc8815b787sm602240pjb.12.2022.02.22.14.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:14:22 -0800 (PST)
Message-ID: <42d348af-e15c-00e4-8670-a2a17902b9e8@linaro.org>
Date: Tue, 22 Feb 2022 12:14:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 20/47] target/ppc: implement vslq
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-21-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-21-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v4:
>   -  New in v4.
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 88baebe35e..3799065508 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -473,6 +473,7 @@ VSLB            000100 ..... ..... ..... 00100000100    @VX
>   VSLH            000100 ..... ..... ..... 00101000100    @VX
>   VSLW            000100 ..... ..... ..... 00110000100    @VX
>   VSLD            000100 ..... ..... ..... 10111000100    @VX
> +VSLQ            000100 ..... ..... ..... 00100000101    @VX
>   
>   VSRB            000100 ..... ..... ..... 01000000100    @VX
>   VSRH            000100 ..... ..... ..... 01001000100    @VX
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index ec4f0e7654..ca98a545ef 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -834,6 +834,46 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv);
>   TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
>   TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
>   
> +static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
> +{
> +    TCGv_i64 hi, lo, tmp, n, sf = tcg_constant_i64(64);
> +
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    REQUIRE_VECTOR(ctx);
> +
> +    n = tcg_temp_new_i64();
> +    hi = tcg_temp_new_i64();
> +    lo = tcg_temp_new_i64();
> +    tmp = tcg_const_i64(0);
> +
> +    get_avr64(lo, a->vra, false);
> +    get_avr64(hi, a->vra, true);
> +
> +    get_avr64(n, a->vrb, true);
> +    tcg_gen_andi_i64(n, n, 0x7F);
> +
> +    tcg_gen_movcond_i64(TCG_COND_GE, hi, n, sf, lo, hi);
> +    tcg_gen_movcond_i64(TCG_COND_GE, lo, n, sf, tmp, lo);

Since you have to mask twice anyway, better use (n & 64) != 0.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

