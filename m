Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930804C202F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 00:45:01 +0100 (CET)
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN1Jc-0001j3-HS
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 18:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN1I1-000052-0m
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:43:21 -0500
Received: from [2607:f8b0:4864:20::52c] (port=46022
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN1Hx-0003pB-EY
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:43:19 -0500
Received: by mail-pg1-x52c.google.com with SMTP id z4so200936pgh.12
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 15:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ITzSbX1aOnBcvgB0VbGF3DFKE8g3nYVHQpNspkEtIA4=;
 b=ktZaB+6k3Fw9RcP9nz89yXR0XT0G2QUfTfLIBsDhuLEcqnWbCccHWSK/Rb282JzD33
 MnvZFovzbY1YqYkJ43ZA0k16SDPL5LqkNsKaNgZPqbXSkZgOvfDEDcIjsUgoqINwOndG
 a4IsnEoYB2PoYm+oTbtxRJyOlqQQIgFtwvKRGpK8qHxQmjgPdhYNlu0vczf+SAHpf+5l
 V1BJayZfURPSxMybD9oS29LpNocJlMlYQb7/2aQlJuVtYUcoLRy2XsrArqtMCFxXka93
 UMmBT7ClrtzL1tUzltnUyBLpF/E0jMtiijFQuumD6tl3M+Yp6H22euqP5m5bE8nBzAsZ
 sShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ITzSbX1aOnBcvgB0VbGF3DFKE8g3nYVHQpNspkEtIA4=;
 b=yUM8HLRuL0i2R0uar6gu1JqYJYOYeS2WxHYiuDjGIJ4WjE3Uq2525qEgwkfzCgVSq9
 JDobLPsSA9vQzqvkL17bfCFW/8jy4/PufS1aD6sQLGrBGlOBY+MmiFBc8UKRAywfuV1T
 rQ17/45ACAny9ROZFIudc9XxE3LqlK1WUsQxM50QQAEpuvt11Zo2w8bgn+pWzcBUecXw
 P7NqjWo7aTEK1avIzHLmF7vVeK1Hg1IxN6Hf4lWaNrp1X9XP9U/+DWT62kWFVgcMfVCE
 RdsLm63CU5g+woxcbGjtxy4vRtpo3RY+I/sUsUfez470ZQVHLmtByaWo0kK13GXoF3JK
 TsnQ==
X-Gm-Message-State: AOAM5328L9zFDmo9fbHOvjyZ0HAhbkXewSGpiKfWkWjQUdfK9EGL9tmx
 t7V3GWMlZAEEapBDxhpu5QOXlQ==
X-Google-Smtp-Source: ABdhPJyd1Tqtm2R9C3jd223ppt+8UgbzkZMLyVmiOPWv6GNu5/YCvlJtgNw5nsFVHtVKisxgqfKcbA==
X-Received: by 2002:a05:6a00:1797:b0:4e1:935f:94b3 with SMTP id
 s23-20020a056a00179700b004e1935f94b3mr2111233pfg.75.1645659795746; 
 Wed, 23 Feb 2022 15:43:15 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id c23sm623088pfi.136.2022.02.23.15.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 15:43:15 -0800 (PST)
Message-ID: <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
Date: Wed, 23 Feb 2022 13:43:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220223223117.66660-4-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 2/23/22 12:31, David Miller wrote:
> +#define F_EPI "stg %%r0, %[res] " : [res] "+m" (res) : : "r0", "r2", "r3"
> +
> +#define F_PRO    asm ( \
> +    "llihf %%r0,801\n" \
> +    "lg %%r2, %[a]\n"  \
> +    "lg %%r3, %[b] "   \
> +    : : [a] "m" (a),   \
> +        [b] "m" (b)    \
> +    : "r2", "r3")
> +
> +#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
> +{ uint64_t res = 0; F_PRO; ASM; return res; }
> +
> +/* AND WITH COMPLEMENT */
> +FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))

Better written as

   asm("ncrk %0, %3, %2" : "=&r"(res) : "r"(a), "r"(b) : "cc");

and drop F_PRO and F_EPI.  Use the asm constraints properly to place the operands.

> +/* NAND */
> +FbinOp(_nnrk,  asm("nnrk  %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_nngrk, asm("nngrk %%r0, %%r3, %%r2\n" F_EPI))
> +
> +/* NOT XOR */
> +FbinOp(_nxrk,  asm("nxrk  %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_nxgrk, asm("nxgrk %%r0, %%r3, %%r2\n" F_EPI))
> +
> +/* NOR */
> +FbinOp(_nork,  asm("nork  %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_nogrk, asm("nogrk %%r0, %%r3, %%r2\n" F_EPI))
> +
> +/* OR WITH COMPLEMENT */
> +FbinOp(_ocrk,  asm("ocrk  %%r0, %%r3, %%r2\n" F_EPI))
> +FbinOp(_ocgrk, asm("ocgrk %%r0, %%r3, %%r2\n" F_EPI))

Similarly.

> +++ b/tests/tcg/s390x/mie3-sel.c
> @@ -0,0 +1,42 @@
> +#include <stdint.h>
> +
> +
> +#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> +{                       \
> +uint64_t res = 0;       \
> +asm (                   \
> +    "lg %%r2, %[a]\n"   \
> +    "lg %%r3, %[b]\n"   \
> +    "lg %%r0, %[c]\n"   \
> +    "ltgr %%r0, %%r0\n" \
> +    ASM                 \
> +    "stg %%r0, %[res] " \
> +    : [res] "=m" (res)  \
> +    : [a] "m" (a),      \
> +      [b] "m" (b),      \
> +      [c] "m" (c)       \
> +    : "r0", "r2",       \
> +      "r3", "r4"        \
> +    );                  \
> +    return res;         \
> +}
> +
> +
> +Fi3 (_selre,    "selre    %%r0, %%r3, %%r2\n")
> +Fi3 (_selgrz,   "selgrz   %%r0, %%r3, %%r2\n")
> +Fi3 (_selfhrnz, "selfhrnz %%r0, %%r3, %%r2\n")

Similarly:

   asm("ltgr %3, %3; selre %0, %2, %1"
       : "=&r"(res) : "r"(a), "r"(b), "r"(c) : "cc");

Although none of this is going to work with .insn.  We *ought* to be able to use the 
debian11 update plus a change to tests/tcg/configure.sh to detect host support for 
-march=z15 to drop that change.


r~

