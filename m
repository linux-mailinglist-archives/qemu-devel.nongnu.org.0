Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9A4D07DB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:46:37 +0100 (CET)
Received: from localhost ([::1]:54118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJJT-00072u-Sr
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:46:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRJBW-00006o-3D
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:38:22 -0500
Received: from [2607:f8b0:4864:20::1029] (port=52943
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRJBU-0000lg-1V
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 14:38:21 -0500
Received: by mail-pj1-x1029.google.com with SMTP id v4so14997487pjh.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 11:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3Ggrf2R5r14ISB7SCfdyW+LSoF8+N1N2bQ3MPuew7jU=;
 b=QCGbpCO5hnFiEEA17n/YOhQJsDP9wZscKDVtc6MqDWYqyfHMylmFIlu/hmf5Gzl4fo
 bm6uC1er6O1lom9VCQ+Dr3sJl1F7iJgr/NfCfjPDtWLv0gxQpRlDya5HiJlcqJlbTZWD
 kTSvqMJravU1Y+XNsEcFlMaTNHiQe2kazx0W2SxS5/119VeJQb1WmaG1uibrubtVdwZu
 4zFFnMRFndqi+SBz4hdquWvhrUUGlBPQZzTRP4r6PhyiP1G85kAL5SXqZdpi+D00hc/2
 JkR1fyT3QJQkIzo+h+7dH1jOkyTBWokxY/T8wSRkiwhCl1dalYdM2oXXOxUrUkrq0UvY
 eWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Ggrf2R5r14ISB7SCfdyW+LSoF8+N1N2bQ3MPuew7jU=;
 b=Xh4TWzJPs1MYk1trRZAv9mY6p9NqV4PxHNtWDWB5Q4ZvouC3emLC5WnLWfW6o8gHZd
 iIZlA3hqLPGSipMCB2aqlWdlFUPX1c2mzZ1lp2Bk4PUptggAdd2lPmZ3n9/KmkAfRNxP
 gxTYvGxD2U0dgvibIBDr6FQaV2CdjyAQnqI+V2Za4Vs6cNeVU0hCmetoxk+DjlU0fXWa
 RDorHjU5ya+Q+CjPbDq505U70BgyqB8BcGNYwRshQm7NP0kTSb6eCewn1xICPbzNPAjJ
 OqIdxK/B8SqCy7Eu7yP7ZmqN7Bj31Nzvpgh42iJZ9Aq4yAjsiCbXcYelXijssa3duNAS
 pS9w==
X-Gm-Message-State: AOAM532imvnvWR4BuU/qgZMHFFssFbJMDjVo4pPeJ+TwO7xntA7wipx0
 Rie6E2/Ta38p52DOrA7wWCdiTw==
X-Google-Smtp-Source: ABdhPJy5maBTnB+TgvNXy31ogHu8/GH1WB6XXI5UMMhY6fj2Qx/aVHonj1aM+eFeNkbt4Uz1EJVd7Q==
X-Received: by 2002:a17:902:cec8:b0:151:cac8:f0a2 with SMTP id
 d8-20020a170902cec800b00151cac8f0a2mr13439045plg.12.1646681898405; 
 Mon, 07 Mar 2022 11:38:18 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s7-20020a056a00178700b004e1a15e7928sm18627576pfg.145.2022.03.07.11.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 11:38:17 -0800 (PST)
Message-ID: <c87c046b-b307-1573-3835-60ddfdd503eb@linaro.org>
Date: Mon, 7 Mar 2022 09:38:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/7] target/s390x: vxeh2: vector shift {double by bit, 
 left, right {logical,arithmetic}}
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307020327.3003-1-dmiller423@gmail.com>
 <20220307020327.3003-4-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307020327.3003-4-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
>   }
> +/**
> + * deposit8:
> + * @value: initial value to insert bit field into
> + * @start: the lowest bit in the bit field (numbered from 0)
> + * @length: the length of the bit field
> + * @fieldval: the value to insert into the bit field
> + *
> + * Deposit @fieldval into the 8 bit @value at the bit field specified
> + * by the @start and @length parameters, and return the modified
> + * @value. Bits of @value outside the bit field are not modified.
> + * Bits of @fieldval above the least significant @length bits are
> + * ignored. The bit field must lie entirely within the 8 bit byte.
> + * It is valid to request that all 8 bits are modified (ie @length
> + * 8 and @start 0).
> + *
> + * Returns: the modified @value.
> + */
> +static inline uint8_t deposit8(uint8_t value, int start, int length,
> +                               uint8_t fieldval)
> +{
> +    uint8_t mask;
> +    assert(start >= 0 && length > 0 && length <= 8 - start);
> +    mask = (~0ULL >> (8 - length)) << start;
> +    return (value & ~mask) | ((fieldval << start) & mask);
> +}
>   

(1) must be a separate patch.
(2) watch the whitespace at the top.

Given we have extract8 already, this is indeed missing.
But I'm surprised you'd need this...

Also, this is still doing too much.
Changes to existing instructions should not be mixed with new instructions.


>  static DisasJumpType op_vsl(DisasContext *s, DisasOps *o)
>  {
> -    TCGv_i64 shift = tcg_temp_new_i64();
> -
> -    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
> -    if (s->fields.op2 == 0x74) {
> -        tcg_gen_andi_i64(shift, shift, 0x7);
> +    const bool B = 0x75 == s->fields.op2;

I really don't like testing opcodes after the fact.  This is the job for insn-data.def. 
Either pass in data with the DATA element of F(), or use a helper function.

> +static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
>  {
> -    const uint8_t i4 = get_field(s, i4) & 0xf;
> -    const int left_shift = (i4 & 7) * 8;
> -    const int right_shift = 64 - left_shift;
> +    const uint8_t mask = (0x86 == s->fields.op2) ? 7 : 15;
> +    const uint8_t mul  = (0x86 == s->fields.op2) ? 1 : 8;
> +    const uint8_t i4   = get_field(s, i4);
> +    const int shift = 64 - (i4 & 7) * mul;
> +
> +    if (i4 & ~mask) {
> +        gen_program_exception(s, PGM_SPECIFICATION);
> +        return DISAS_NORETURN;
> +    }
>      TCGv_i64 t0 = tcg_temp_new_i64();
>      TCGv_i64 t1 = tcg_temp_new_i64();
>      TCGv_i64 t2 = tcg_temp_new_i64();
> @@ -2053,8 +2060,8 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
>          read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
>          read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
>      }
> -    tcg_gen_extract2_i64(t0, t1, t0, right_shift);
> -    tcg_gen_extract2_i64(t1, t2, t1, right_shift);
> +    tcg_gen_extract2_i64(t0, t1, t0, shift);
> +    tcg_gen_extract2_i64(t1, t2, t1, shift);

The renaming of right_shift to shift is probably misleading, since extract2 *always* 
performs a right-shift.

> +    tcg_gen_extract2_i64(t0, t1, t0, left_shift);
> +    tcg_gen_extract2_i64(t1, t2, t1, left_shift);

Which makes this bit from op_vsrd actively misleading (though the code appears to be 
correct, its just the variable name that's wrong).

> +void HELPER(gvec_vsl_ve2)(void *v1, const void *v2, const void *v3,
> +                          uint32_t desc)
> +{
> +    uint8_t i, v;
> +    S390Vector tmp = {};
> +    for (i = 0; i < 16; i++) {
> +        const uint8_t shift = s390_vec_read_element8(v3, i) & 7;
> +        v = s390_vec_read_element8(v2, i);
> +
> +        if (shift) {
> +            v <<= shift;
> +            if (i < 15) {
> +                v |= extract8(s390_vec_read_element8(v2, i + 1),
> +                              8 - shift, shift);
> +            }

Possibly better as

     if (shift) {
         uint16_t tmp = (uint16_t)v << 8;
         if (i < 15) {
             tmp |= s390_vec_read_element8(v2, i + 1);
         }
         tmp <<= shift;
         v = tmp >> 8;
     }

Similarly for the right shifts.

I wonder if it's worth checking that the values are identical, so that we can use the 
original vsl implementation, using double-word shifts.  E.g.

     uint64_t v3_0 = s390_vec_read_element64(v3, 0);
     uint64_t v3_1 = s390_vec_read_element64(v3, 1);
     uint64_t sh_0 = dup_const(MO_8, v3_0 & 7);
     uint64_t sh_m = dup_const(MO_8, 7);

     if ((v3_0 & sh_m) == sh_0 && (v3_1 & sh_m) == sh_0) {
         helper_gvec_vsrl(v1, v2, v3, desc);
         return;
     }


r~

