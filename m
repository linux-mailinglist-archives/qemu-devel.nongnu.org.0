Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AA4ECE90
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:09:38 +0200 (CEST)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfZR-0003DX-Kf
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:09:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZfWY-0007rv-LR
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:06:39 -0400
Received: from [2001:4860:4864:20::31] (port=34295
 helo=mail-oa1-x31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZfWX-0003pn-7T
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:06:38 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-df26ea5bfbso5739715fac.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eXanVmIDHF2f73BArQJmdbUzxVJxmzB+bHHPoqaarIk=;
 b=s8M4hI13OYbMqvwIaEnc7yTha8wMX9DJO1PzJw2jZHTVvDo5mrXqczdj1HYUNQdGu3
 RCHMVh8osf+OFqEPx7rO6Z2bGS31CJvi4oUYlly+qm2Z89sYLSmeMgB2gYHXsszETQqm
 Svuw02+bNQevEYVbKlmAoyEJrIrzlN2nY4fwA0/4KO3DXLHyDeSkejQoG8DqoPVbBRoa
 /0iIKyq6K/bMg4+4AWzLxnjELdShIMjIGhREs++/V034ZegvPxqVq7K11eSAqWEPx2fH
 sL35ibD7WP5DEmn1bGs26iw9RS+PlFv3NDKTbvPASgc8X6BEaB4t9VO3edYlvcSAOQzU
 SOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eXanVmIDHF2f73BArQJmdbUzxVJxmzB+bHHPoqaarIk=;
 b=wHMpB/hCPHhUDvr/yNFN7DvToeMEQtqcZlv0fRXqpVQSB81n0Z54/5BncloZ44yW8c
 a3br1xx1WM+Bzt40oB5JT6IIhRS1muBnTG5oqwA1olMwBqsUdSrvtB/d0aD6AjW59/uN
 giq1mYl5mOrkX7P6DtCZm4DtNVcZVmazod/cS5ffJNHxs/4Ke0xM9Nuv057Bd6MZbvqW
 sRwEkWEXBvdyXJy5CbvpGPi81XScCDIRqjVRhhfYpqQ5a2PdtDH+XU6J6+awhkL0hrXg
 GnABOaKKAXKfsaQSz32xVK1NFmKDTc1d0IpDVBSGISAWNbeyBa52Bn+46ARVt6CSEDxU
 c49g==
X-Gm-Message-State: AOAM531JhotLGdxEwIXk4XD1jTsJTGogfxoj6Bmmlv5P5Lf+7zJEDK7H
 NWQVCXxaVQm4fS/2aZ/AZa1R1A==
X-Google-Smtp-Source: ABdhPJywKW2YiWp0y7HdU02Eq+9M7TMYM8qkvF7WdBuYsiPI5TDgKkr+QpfTGy6vFNtN+31L9LQZHw==
X-Received: by 2002:a05:6871:b22:b0:dd:9eeb:4292 with SMTP id
 fq34-20020a0568710b2200b000dd9eeb4292mr903993oab.223.1648674395298; 
 Wed, 30 Mar 2022 14:06:35 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 i28-20020a9d4a9c000000b005ce06a77de2sm1760716otf.48.2022.03.30.14.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:06:34 -0700 (PDT)
Message-ID: <cffe9d6a-b268-81ad-bccb-ffe0c7bde8bd@linaro.org>
Date: Wed, 30 Mar 2022 15:06:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/10] target/ppc: Implemented vector divide instructions
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
 <20220330202515.66554-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330202515.66554-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::31
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 14:25, Lucas Mateus Castro(alqotel) wrote:
> +#define TRANS_VDIV_VMOD(FLAGS, NAME, VECE, FNI4_FUNC, FNI8_FUNC)        \
> +static bool trans_##NAME(DisasContext *ctx, arg_VX *a)                  \
> +{                                                                       \
> +    static const GVecGen3 op[2] = {                                     \
> +        {                                                               \
> +            .fni4 = FNI4_FUNC,                                          \
> +            .fni8 = FNI8_FUNC,                                          \
> +            .vece = MO_32                                               \
> +        },                                                              \
> +        {                                                               \
> +            .fni4 = FNI4_FUNC,                                          \
> +            .fni8 = FNI8_FUNC,                                          \
> +            .vece = MO_64                                               \
> +        },                                                              \
> +    };                                                                  \

There is zero point in having a two element array here:
(1) VECE is a constant
(2) The unused array element is actively wrong.

> +#define DIV_VEC(NAME, SZ, DIV)                                          \
> +static void do_vx_##NAME(TCGv_##SZ t, TCGv_##SZ a, TCGv_##SZ b)         \
> +{                                                                       \
> +    TCGv_##SZ zero = tcg_constant_##SZ(0), one = tcg_constant_##SZ(1);  \
> +    /*                                                                  \
> +     *  If N/0 the instruction used by the backend might deliver        \
> +     *  a signal to the process and the hardware returns 0 when         \
> +     *  N/0, so if b = 0 return 0/1                                     \
> +     */                                                                 \
> +    tcg_gen_movcond_##SZ(TCG_COND_EQ, a, b, zero, zero, a);             \
> +    tcg_gen_movcond_##SZ(TCG_COND_EQ, b, b, zero, one, b);              \
> +    DIV(t, a, b);                                                       \
> +}

The manual says N/0 = undefined.  I don't think it's important to require 0.

The signed versions still need to check for int_min / -1, which will fault on x86. 
Compare vs gen_op_arith_div{w,d}.


r~

