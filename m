Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C135B5B0F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:23:22 +0200 (CEST)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjPF-0006qz-3b
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXjLe-0001tM-Km
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:19:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXjLc-0006YK-0E
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 09:19:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id t7so15284769wrm.10
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=e+ocinocpvdUrinnZhsO5I3ZDyt8rujE9hEEGXhII9I=;
 b=c9mLWXeYwT87mvfj6xgro0ofa+iPvkFASSExImPrJ7bGnn7uptIoB21gAExS4HeAaT
 tBPXrp7EIsjp6WbeQ6l/SXzP+oBefuF/bhX2XEaMm0ufxaavUs6RPvyrrS04Qqp+Au3G
 WN/osYd6NjZvo2ZthpjiiRLPNE3lslSNheN9g2NG4sz+mLRhRqEbKuOgmbsV22DtY2F3
 HfUgZwXMxFciPjTD4DzWEgs9O8wwO+ojBrZJ0hT+5gyJQUcZWNcv+aFwZDR/knT4fy2y
 BR62+3SVEPBnQJUuAM/uIFsgLTih+odIbqkaiPTlhRys9cYk0NNpodzg7va7DwpGiFlp
 BVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=e+ocinocpvdUrinnZhsO5I3ZDyt8rujE9hEEGXhII9I=;
 b=gqeC2A+OSieN/rMsw9DH7iJJUod40SVG/Habm1LQUQ6c3xXss5z3gi+b7Movf84Kbf
 GUicKUHXuTY9NAHQSRHhpB0frDf0bXDUjGeZCUKTs4NFgBdnYWcbdvqZDSQU3NI7FB6T
 pvvy/H4gJcMhqAknwxOUcGx8MsWBSEty7uSY25iwWQDTTfr2UXp3z0ID1FVuoa3zTtvJ
 grm+wWg2m2Yxr33v/QZLicQZZBXF2d+jVhSmsd5rt4+ZnHuo19prQTDT2rvfXvBtVcyH
 kdbrRgRuikk5AaAp2N30iNQ4ojGuFcVX153pvV9CtSOzowfV2nE4/DpLvkuL0ZOQ6Ol2
 5MjA==
X-Gm-Message-State: ACgBeo0q2PZ+/4vgzbujdFFP9kjCr8O76Y/NibE7y5ZFsgiR1NGo/Q51
 sOrKg3yZ48sZPYrEt/q4DyQXYA==
X-Google-Smtp-Source: AA6agR7h7Nepi/8DsWE2OZw3Oaq/Za3S7FMVoxEMUH+qUf9sUoJrk/47egddmoKvoJ477A0OKgVBZA==
X-Received: by 2002:adf:cd90:0:b0:228:813e:bc26 with SMTP id
 q16-20020adfcd90000000b00228813ebc26mr15671457wrj.295.1662988774088; 
 Mon, 12 Sep 2022 06:19:34 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.69])
 by smtp.gmail.com with ESMTPSA id
 g7-20020adfa487000000b0022917d58603sm7466902wrb.32.2022.09.12.06.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 06:19:33 -0700 (PDT)
Message-ID: <cc21a9e1-679e-f89a-16f7-5a2ce5fa640d@linaro.org>
Date: Mon, 12 Sep 2022 14:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 21/37] target/i386: reimplement 0x0f 0xd8-0xdf, 0xe8-0xef, 
 0xf8-0xff, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-22-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-22-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> --- a/target/i386/tcg/emit.c.inc
> +++ b/target/i386/tcg/emit.c.inc
> @@ -290,6 +290,20 @@ BINARY_INT_MMX(PUNPCKHWD,  punpckhwd)
>   BINARY_INT_MMX(PUNPCKHDQ,  punpckhdq)
>   BINARY_INT_MMX(PACKSSDW,   packssdw)
>   
> +BINARY_INT_MMX(PSUBUSB, psubusb)
> +BINARY_INT_MMX(PSUBUSW, psubusw)

tcg_gen_gvec_ussub

> +BINARY_INT_MMX(PMINUB,  pminub)

tcg_gen_gvec_umin

> +BINARY_INT_MMX(PADDUSB, paddusb)
> +BINARY_INT_MMX(PADDUSW, paddusw)

tcg_gen_gvec_usadd

> +BINARY_INT_MMX(PMAXUB,  pmaxub)

tcg_gen_gvec_umax

> +BINARY_INT_MMX(PSUBSB, psubsb)
> +BINARY_INT_MMX(PSUBSW, psubsw)

tcg_gen_gvec_sssub

> +BINARY_INT_MMX(PMINSW, pminsw)

tcg_gen_gvec_smin

> +BINARY_INT_MMX(PADDSB, paddsb)
> +BINARY_INT_MMX(PADDSW, paddsw)

tcg_gen_gvec_ssadd

> +BINARY_INT_MMX(PMAXSW, pmaxsw)

tcg_gen_gvec_smax

> +static void gen_PADDB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
> +{
> +    int vec_len = sse_vec_len(s, decode);
> +
> +    tcg_gen_gvec_add(MO_8,
> +                     decode->op[0].offset, decode->op[1].offset,
> +                     decode->op[2].offset, vec_len, vec_len);
> +}

Worth the creation of a helper and/or macro to reduce duplication?


r~

