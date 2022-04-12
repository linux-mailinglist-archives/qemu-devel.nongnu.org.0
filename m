Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A74FCC07
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 03:57:26 +0200 (CEST)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne5mX-0007z8-AD
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 21:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne5le-00077V-Uj
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:56:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne5ld-00073Z-61
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 21:56:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id n8so15453400plh.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 18:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OiHO7AZsnP3YoyDsEoccbadXUEwvuSTq62g+u6qLwWs=;
 b=xDYsQta2z14IJSy4tGstjiZCTJExub4xuoqGr1KVPwTHbFzbs84jGyMD3JtLCYFXB0
 z1LOg6UUxvSS3Vw4cGxezvCGZs8i7WNszlnMu+EIZhax57B/p016VAzF5j9NajW7R5JZ
 bWpNylEU7GttzqYsfKPM4HA4KMhcoz5qvU7EjBLVaoRQlixGXj5EksVYGML8r2/Mk5q5
 ew6LvTq5j0twD061/h/e2TXT9K9VZAHpcUQIGrIDqdoltyThvkv/Vb9JGiuVIaWGne50
 AomvKSRYBjmqiP+ZmTso0dp5+n7V+qFTVS6wip0LPSR1/f2y+96B35yTb+Y4lKrDxHEN
 XksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OiHO7AZsnP3YoyDsEoccbadXUEwvuSTq62g+u6qLwWs=;
 b=QZsyL17qHe6/PBmFd/ZEIntAzPkS05khDU20pRf//M+RUTAKpF9uB1FnIOietpmPgs
 ULk/HCii9S37yYKwSjXOJyEzRHWfeJIK9hoLf+mLGchRWqFHrM8hvjQ6/rUA4GVwAczk
 67zNvA83TzxS0Jto/FRhA2jqNv9UmCAwzZRLdYoNlF2cNY40E/Pk9UYfJSjgjGW131Wa
 Sw0XtfbuA61mBQn9kymF7gFQ64C7t0dGcIAdHRL9zUXtT4NybpnQT27sJ3/ecNnmKtmq
 Sn/dyAYWJeoe+ALDSMU7QeW1Kyw276Y0vAbPhMkaMENHOYobom+PdbMokwY4URXeua0L
 di7A==
X-Gm-Message-State: AOAM530ylKkse2+UOiQUv3oKGHSTLzwOavemR80GMRCcd9qQWTpgidZZ
 hCsxHQ6qxJ/ELCv02VSAYKU1RQ==
X-Google-Smtp-Source: ABdhPJxvMNROX73nFGqnTpOVpyID/FC3xQrHVn9ASjqbKkRmlKfL0Sn5rHiZAHZ6fiSf5KNoF7U8vQ==
X-Received: by 2002:a17:90b:352:b0:1c6:77e:a4f7 with SMTP id
 fh18-20020a17090b035200b001c6077ea4f7mr2285741pjb.77.1649728587630; 
 Mon, 11 Apr 2022 18:56:27 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090aaa9600b001ca7a005620sm702004pjq.49.2022.04.11.18.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 18:56:27 -0700 (PDT)
Message-ID: <29213fe8-840f-7f55-df77-68b7b7999420@linaro.org>
Date: Mon, 11 Apr 2022 18:56:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/9] target/ppc: Implemented vector divide extended word
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-5-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-5-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vdivesw: Vector Divide Extended Signed Word
> vdiveuw: Vector Divide Extended Unsigned Word
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  3 ++
>   target/ppc/translate/vmx-impl.c.inc | 48 +++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)
> 
> diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> index 3a88a0b5bc..8c115c9c60 100644
> --- a/target/ppc/insn32.decode
> +++ b/target/ppc/insn32.decode
> @@ -712,3 +712,6 @@ VDIVSD          000100 ..... ..... ..... 00111001011    @VX
>   VDIVUD          000100 ..... ..... ..... 00011001011    @VX
>   VDIVSQ          000100 ..... ..... ..... 00100001011    @VX
>   VDIVUQ          000100 ..... ..... ..... 00000001011    @VX
> +
> +VDIVESW         000100 ..... ..... ..... 01110001011    @VX
> +VDIVEUW         000100 ..... ..... ..... 01010001011    @VX
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index bac0db7128..8799e945bd 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -3295,6 +3295,54 @@ TRANS_VDIV_VMOD(ISA310, VDIVUD, MO_64, NULL, do_divud)
>   TRANS_FLAGS2(ISA310, VDIVSQ, do_vx_helper, gen_helper_VDIVSQ)
>   TRANS_FLAGS2(ISA310, VDIVUQ, do_vx_helper, gen_helper_VDIVUQ)
>   
> +static void do_dives_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> +{
> +    TCGv_i64 val1, val2;
> +
> +    val1 = tcg_temp_new_i64();
> +    val2 = tcg_temp_new_i64();
> +
> +    tcg_gen_ext_i32_i64(val1, a);
> +    tcg_gen_ext_i32_i64(val2, b);
> +
> +    /* (a << 32)/b */
> +    tcg_gen_shli_i64(val1, val1, 32);
> +    tcg_gen_div_i64(val1, val1, val2);
> +
> +    /* if quotient doesn't fit in 32 bits the result is undefined */
> +    tcg_gen_extrl_i64_i32(t, val1);
> +
> +    tcg_temp_free_i64(val1);
> +    tcg_temp_free_i64(val2);
> +}
> +
> +static void do_diveu_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
> +{
> +    TCGv_i64 val1, val2;
> +
> +    val1 = tcg_temp_new_i64();
> +    val2 = tcg_temp_new_i64();
> +
> +    tcg_gen_extu_i32_i64(val1, a);
> +    tcg_gen_extu_i32_i64(val2, b);
> +
> +    /* (a << 32)/b */
> +    tcg_gen_shli_i64(val1, val1, 32);
> +    tcg_gen_divu_i64(val1, val1, val2);
> +
> +    /* if quotient doesn't fit in 32 bits the result is undefined */
> +    tcg_gen_extrl_i64_i32(t, val1);
> +
> +    tcg_temp_free_i64(val1);
> +    tcg_temp_free_i64(val2);
> +}
> +
> +DO_VDIV_VMOD(do_divesw, 32, do_dives_i32, true)
> +DO_VDIV_VMOD(do_diveuw, 32, do_diveu_i32, false)

Oh, I see, you do have one more use for the full min/-1 treatment.
It would still be nice if the macro were minimal and you use a callback.


r~

