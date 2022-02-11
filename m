Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D04B1D4C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 05:17:31 +0100 (CET)
Received: from localhost ([::1]:51800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nINNB-00025d-WC
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 23:17:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINLC-0001D5-SP
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:15:26 -0500
Received: from [2607:f8b0:4864:20::42d] (port=45052
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINLA-0001nf-QO
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:15:26 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y8so11327644pfa.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 20:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tUtcbxhT/cxsjGZlfFLOSblZQC24y1fbEZRiwUF1uK0=;
 b=Gt3WF6eCB7+89vDCRKYso9KMrFLy2xiHYAKS3uiedy2+oapW4wOK4AM6GTn6ki1wOm
 OGB7vhrjvWAPODAZyv0ccuPPfDLHFwj+faz0+Yrrp5lbrSGzKn9Zy1DIuWCkN8D3jHoc
 osVItNr8WH+n9rHGfxoVTPug0Mtz1G+BjhC7SpTtc4fcK77SH68ZK8TqcA3i4xtLKN7I
 D0PQLCLKUvoWcvSZOO3nWWndhhEXeMo5/pRcWYdeJOPp6BeEJ0T54oIOE/poqPEp9Sea
 P3ta62IhvCymNSL38z/rV7nwhBBIQn3bb4r8yng1slbsArLVI92i3cfCprAaYYn1L5NP
 LMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tUtcbxhT/cxsjGZlfFLOSblZQC24y1fbEZRiwUF1uK0=;
 b=HhWGcOGxRCrJdoAYnYuN33YOP8FB6b7T30zs/BfTyptOZq8rco5i7xvLawqHtEdbPD
 ow4jjGBUHUZ8EIfOTB/1Cogi0SVdx2LACTO49T2ar9TiSsuepMCcYHiDsddqqhouQb8O
 bEdNXupBVbKIQGg2RUb+fGWCYKwO3rv55UFHLG2atbFC2jlah4KZi8zq88KsQ2VUgLCS
 02ZXi5iAL61/tZagpcMf/z3KZLUVJYG7dImHT4A4DPJlQ9DuL4hP+ry8rxFHuwZ9RY2y
 cY4sghZs3Rvngx+8Hxkh9hxv78iJ0MhcKwLPeO0lRVNkgazdSEZSLybV8tbFbjDk2EvB
 y6jw==
X-Gm-Message-State: AOAM531HSVGQPAXmyenxxOR0i/tK0H7+jyiXrsXIonpBBeC8rdAlE3qI
 1WgmhDxrWcNEk+MWkBFZks5fkA==
X-Google-Smtp-Source: ABdhPJw9Wn+5aE5OYRZfgRwpFz5fg36roDzoxsTtv/n7bDN/6l+xxOibnvMJNmwBfxk5jugnmJhQZQ==
X-Received: by 2002:a63:8ac1:: with SMTP id y184mr448202pgd.590.1644552923155; 
 Thu, 10 Feb 2022 20:15:23 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id pf4sm4200177pjb.35.2022.02.10.20.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 20:15:22 -0800 (PST)
Message-ID: <d6e854de-d675-a5e3-406c-b3b56e0b0a6d@linaro.org>
Date: Fri, 11 Feb 2022 15:14:33 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 07/37] target/ppc: Move vexts[bhw]2[wd] to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-8-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-8-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, groug@kaod.org,
 danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
> 
> Move the following instructions to decodetree:
> vextsb2w: Vector Extend Sign Byte To Word
> vextsh2w: Vector Extend Sign Halfword To Word
> vextsb2d: Vector Extend Sign Byte To Doubleword
> vextsh2d: Vector Extend Sign Halfword To Doubleword
> vextsw2d: Vector Extend Sign Word To Doubleword
> 
> Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  5 -----
>   target/ppc/insn32.decode            |  8 ++++++++
>   target/ppc/int_helper.c             | 15 ---------------
>   target/ppc/translate/vmx-impl.c.inc | 25 ++++++++++++++++++++-----
>   target/ppc/translate/vmx-ops.c.inc  |  5 -----
>   5 files changed, 28 insertions(+), 30 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 92595a42df..0084080fad 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -249,11 +249,6 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
>   DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
>   DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
>   DEF_HELPER_4(VINSDLX, void, env, avr, i64, tl)
> -DEF_HELPER_2(vextsb2w, void, avr, avr)
> -DEF_HELPER_2(vextsh2w, void, avr, avr)
> -DEF_HELPER_2(vextsb2d, void, avr, avr)
> -DEF_HELPER_2(vextsh2d, void, avr, avr)
> -DEF_HELPER_2(vextsw2d, void, avr, avr)
>   DEF_HELPER_2(vnegw, void, avr, avr)
>   DEF_HELPER_2(vnegd, void, avr, avr)
>   DEF_HELPER_2(vupkhpx, void, avr, avr)
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index c4796260b6..757791f0ac 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -419,6 +419,14 @@ VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
>   VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
>   VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
>   
> +## Vector Integer Arithmetic Instructions
> +
> +VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
> +VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
> +VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
> +VEXTSH2D        000100 ..... 11001 ..... 11000000010    @VX_tb
> +VEXTSW2D        000100 ..... 11010 ..... 11000000010    @VX_tb
> +
>   ## Vector Mask Manipulation Instructions
>   
>   MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
> index 79cde68f19..630fbc579a 100644
> --- a/target/ppc/int_helper.c
> +++ b/target/ppc/int_helper.c
> @@ -1768,21 +1768,6 @@ XXBLEND(W, 32)
>   XXBLEND(D, 64)
>   #undef XXBLEND
>   
> -#define VEXT_SIGNED(name, element, cast)                            \
> -void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
> -{                                                                   \
> -    int i;                                                          \
> -    for (i = 0; i < ARRAY_SIZE(r->element); i++) {                  \
> -        r->element[i] = (cast)b->element[i];                        \
> -    }                                                               \
> -}
> -VEXT_SIGNED(vextsb2w, s32, int8_t)
> -VEXT_SIGNED(vextsb2d, s64, int8_t)
> -VEXT_SIGNED(vextsh2w, s32, int16_t)
> -VEXT_SIGNED(vextsh2d, s64, int16_t)
> -VEXT_SIGNED(vextsw2d, s64, int32_t)
> -#undef VEXT_SIGNED
> -
>   #define VNEG(name, element)                                         \
>   void helper_##name(ppc_avr_t *r, ppc_avr_t *b)                      \
>   {                                                                   \
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index b7559cf94c..ec782c47ff 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -1772,11 +1772,26 @@ GEN_VXFORM_TRANS(vclzw, 1, 30)
>   GEN_VXFORM_TRANS(vclzd, 1, 31)
>   GEN_VXFORM_NOA_2(vnegw, 1, 24, 6)
>   GEN_VXFORM_NOA_2(vnegd, 1, 24, 7)
> -GEN_VXFORM_NOA_2(vextsb2w, 1, 24, 16)
> -GEN_VXFORM_NOA_2(vextsh2w, 1, 24, 17)
> -GEN_VXFORM_NOA_2(vextsb2d, 1, 24, 24)
> -GEN_VXFORM_NOA_2(vextsh2d, 1, 24, 25)
> -GEN_VXFORM_NOA_2(vextsw2d, 1, 24, 26)
> +
> +static bool do_vexts(DisasContext *ctx, arg_VX_tb *a, int vece, int s)
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> +    REQUIRE_VECTOR(ctx);
> +
> +    tcg_gen_gvec_shli(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrb),
> +                      s, 16, 16);
> +    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrt),
> +                      s, 16, 16);

It would be better to collect this into a single composite gvec operation (x86 is 
especially bad with unsupported vector operation sizes).

Use GVecGen3, provide the relevant .fni4/.fni8/.fniv functions and the vecop_list.  We 
have elsewhere relied on 4 integer operations being expanded, when the vector op itself 
isn't supported, so you should be able to drop the .fnio out-of-line helper.


r~

