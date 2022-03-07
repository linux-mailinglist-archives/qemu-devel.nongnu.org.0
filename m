Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FC4D06EE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:52:42 +0100 (CET)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRITJ-00022x-4d
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRIRv-0007u8-27
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:51:15 -0500
Received: from [2607:f8b0:4864:20::102b] (port=55243
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRIRr-0001xY-Uf
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:51:14 -0500
Received: by mail-pj1-x102b.google.com with SMTP id b8so14781884pjb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=U3UOTF+n8BcoptQKZ39lI05ZS6FXs2TCO/xjoN6tmYg=;
 b=IpIdvfO6o0Li+a6eeLEjecGwiO8n72vamCZd5va3ExDobLcqnEy+yekOKjti+qk6JE
 Wvi5Yx30kt3puLwYfVwQN/B42XBQJIn4QW8IfAyD/w0Hodg6dMWKExHkKHwBFUv+j6yg
 ZQWlnFzNvKs2/YNytZZVJ34KfQl+53HMtDzMrhv9m0xnL4I1z4huv5RUtp7qUfHcSXLa
 79YY5qmQ28AQ84whc+Q3qRX5WTiE1GD0tka8d1II08VY7q3Z3jbmlBWp7Ye8VoMHM/XZ
 cLcMCTvm39Pwpg+8XHQdm542DErJpHWxfUajo+nAQl3TBnOpmcyDiSofLhe3O0tgIqAh
 jDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U3UOTF+n8BcoptQKZ39lI05ZS6FXs2TCO/xjoN6tmYg=;
 b=BFbPKCY1tcDCNEt8hevL/djKsnyc5OVoTS5WZKBcDc4ndx6wYyFLpYAZduTlEjKQCY
 rnKaLiD01N/oiMLQcCsqvpg5KvGksGGrrMjafE//2CPw07pKhe6DOBhNc9nKV6dZNlCi
 j97WHBhZOLhlqdbrWBPoaF7f+nRhsGN0GC9ADH2nKW4ghJEvixrXlftxAnOPUcnEBCPd
 j2F4wwM/Y1jwZfXYu4l43NPVyzbNgFN+sKvFVYvF2p7S86oT96D/F+MSvIMLpNpkDR9J
 XooY4EhBguVEcW5pykcBqfPyoF9zBAwFRarGg9I+cPYCGThbpzsadjWo0er2D/AiMygO
 g9Lw==
X-Gm-Message-State: AOAM532qxbxWnH3/41ESeiysCzBRJZxCVloNnMPZkZrMGX31tCff1O30
 AcuYUHVVfO5z36s7ZJT3FT/CXQ==
X-Google-Smtp-Source: ABdhPJz+gH8slxRgMd4w4eh3Tev5I63V7ajL0HWRie707PpkIdn87zoUJQ9oxCNnQx71WdaKrS6beQ==
X-Received: by 2002:a17:903:32cf:b0:151:ef2a:2eff with SMTP id
 i15-20020a17090332cf00b00151ef2a2effmr5059074plr.40.1646679060321; 
 Mon, 07 Mar 2022 10:51:00 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 o5-20020a056a00214500b004bd7036b50asm16654073pfk.172.2022.03.07.10.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 10:50:59 -0800 (PST)
Message-ID: <5993be52-bcda-c6ea-c1f6-954247b93bfb@linaro.org>
Date: Mon, 7 Mar 2022 08:50:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/7] target/s390x: vxeh2: vector string search
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307020327.3003-1-dmiller423@gmail.com>
 <20220307020327.3003-3-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307020327.3003-3-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/6/22 16:03, David Miller wrote:
> +static DisasJumpType op_vstrs(DisasContext *s, DisasOps *o)
> +{
> +    const uint8_t es = get_field(s, m5);
> +    const uint32_t D = get_field(s, m6);
> +
> +    if (es > ES_32) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }

Missed a check for bits of m6 other than zs must be zero.

> +    gen_gvec_4_ptr(get_field(s, v1), get_field(s, v2),
> +                   get_field(s, v3), get_field(s, v4),
> +                   cpu_env, (D << 16) | es, gen_helper_vstrs);

Why << 16?

> +void HELPER(vstrs)(void *v1, const void *v2, const void *v3, void *v4,
> +                   CPUS390XState *env, uint32_t desc) {
> +    const bool zs = (desc >> 16);

If this is meant to recover D, it won't.  The value that you passed above is had via 
simd_data(desc).  After that, you could get D via >> 16.

> +    const uint8_t es = desc & 16;

I think you clearly meant & 15 here.  Or maybe & 3, since ES <= 2?
However!

I think you shouldn't actually pass these values via simd_data().  I think you should have 
6 helper functions, which call this as an inline function passing ES and ZS as immediate 
arguments.  This will allow the compiler to fold away all of the multiple checks vs ES and ZS.


> +    uint32_t str_len = 0, eos = 0;
> +    uint32_t i = 0, j = 0, k = 0, cc = 0;
> +    uint32_t substr_len = ((uint8_t *)v4)[H1(7)] & 31;
> +
> +    for (i = 0; i < 16; i += char_size) {
> +        if (0 == es && !((uint8_t  *)v3)[H1(i >> es)]) { break; }
> +        if (1 == es && !((uint16_t *)v3)[H2(i >> es)]) { break; }
> +        if (2 == es && !((uint32_t *)v3)[H4(i >> es)]) { break; }

Instead of iterating to 16 by char_size and dividing by es, you should iterate to 
element_count by 1.  You should use s390_vec_read_element here, and elsewhere.

> +    }
> +    if (i < substr_len) {
> +        substr_len = i;
> +    }

This bounding of substr_len is only done when ZS is true.

> +    ((uint64_t *)v1)[0] = ((uint64_t *)v1)[1] = 0;
> +    ((uint8_t *)v1)[H1(7)] = k;

s390_vec_write_element64(v1, 0, k);
s390_vec_write_element64(v1, 1, 0);


r~

