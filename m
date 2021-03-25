Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157723496BD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:26:31 +0100 (CET)
Received: from localhost ([::1]:57190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSoX-0001G9-FY
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSmu-0000LI-FB
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:24:48 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPSms-0007jS-NS
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:24:48 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso2447757ott.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sjl4tzdD2t7G6udr+RxeIUxkw8LIlh56KxUb2wcenpU=;
 b=AN4IzG8ZmnTNrXBZ4Xga21FxuV3kJyarWo7ZDITgxXjdkddJMhks++4cE0AY01qnkP
 aBPIH2lZ38T2MdmOrbYJcyOYZG9OVSh8OPY3F62VkQnc/1OJMMfcl0HNLX0urdkZ0q8a
 6J0tWHqwmdTagwrdmELWH72YnzcsC/SUeIgMlOeNmE20P74Ov8LQanTK27KWk+YzYxbs
 h9qtz6lEw/XHeeLFPUfwPFy5ZIpkChr7MALTefxUMpy+SBzUHTojFc1GUPx5ZoFgnJq9
 P1u3uIadOLrLP5xqrbWcgS5EgpByG0otTBDSwWnwpl1QFomvd3xqs3book6ULTU6TAQU
 c5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sjl4tzdD2t7G6udr+RxeIUxkw8LIlh56KxUb2wcenpU=;
 b=WG1ohhFjcTDNGmmIgKVAj0TauEaws50PofDKW4p+1t7QBvplfKXTBGdaz+z1T4ujPJ
 6oKSOoz9MQ9H8eQbk17FyGWzib8bkjdULf1kNiB8Ak6q3t7E2PDKoiIOJPViloaMYB1I
 qz9hOQzOcljParQJhWNczVDR3UrzPVSQsb6PirBYmRg7HB+AsOVWlJsF5vlZnKycZEyT
 ysA/NEagNMU5BWMoKresOI0wnbPucP7o5mMzUMLZGlRqtucOvjI+mWnSCwT6eUAtKxym
 NY1ZROaPs3z3hx5683XU4RoDBdQ9r+9zYHIyByutT0hTIRy4ODWv4WrcB7+iyf8xbUGM
 gqNQ==
X-Gm-Message-State: AOAM530m73lQtzEdMB0CBA4RX6gtZdXUCCfytlTvsPf5RzaihHr6ByBy
 m5AyRjO7Jw/AqEOAEhSOkxzIYQ==
X-Google-Smtp-Source: ABdhPJwXrvLDNCF4xZIEWRUpSESwbo48FRNS3h6l0tCOlleTxcE4qnhZ0ACmexfKfNW3wIcLdCZ8+w==
X-Received: by 2002:a9d:7513:: with SMTP id r19mr8068150otk.85.1616689482331; 
 Thu, 25 Mar 2021 09:24:42 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a73sm1185103oii.26.2021.03.25.09.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:24:41 -0700 (PDT)
Subject: Re: [PATCH 10/15] Hexagon (target/hexagon) instructions with multiple
 definitions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-11-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7ac0015-5e44-28b6-9ee2-a1ce0307354f@linaro.org>
Date: Thu, 25 Mar 2021 10:24:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-11-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> Instructions with multiple definitions require special handling
> because the generator wants to create a helper, but helpers can
> only return a single result.  Therefore, we must override the
> generated code.
> 
> The following instructions are added
>      A4_addp_c        Rdd32 = add(Rss32, Rtt32, Px4):carry
>                           Add with carry
>      A4_subp_c        Rdd32 = sub(Rss32, Rtt32, Px4):carry
>                           Sub with carry
>      A5_ACS           Rxx32,Pe4 = vacsh(Rss32, Rtt32)
>                           Add compare and select elements of two vectors
>      A6_vminub_RdP    Rdd32,Pe4 = vminub(Rtt32, Rss32)
>                           Vector min of bytes
>      F2_invsqrta      Rd32,Pe4 = sfinvsqrta(Rs32)
>                           Square root approx
>      F2_sfrecipa      Rd32,Pe4 = sfrecipa(Rs32, Rt32)
>                           Recripocal approx

One thing at a time.  This is no longer port bring-up where large patches are 
unavoidable.


> +int arch_recip_lookup(int index)
> +{
> +    index &= 0x7f;
> +    unsigned const int roundrom[128] = {

static const uint16_t?  or is it in fact all 8-bit data?

> +int arch_invsqrt_lookup(int index)
> +{
> +    index &= 0x7f;
> +    unsigned const int roundrom[128] = {

Likewise.

> +/*
> + * Add or subtract with carry.
> + * Predicate register is used as an extra input and output.
> + * r5:4 = add(r1:0, r3:2, p1):carry
> + */
> +#define fGEN_TCG_A4_addp_c(SHORTCODE) \
> +    do { \
> +        TCGv LSB = tcg_temp_new(); \
> +        TCGv_i64 LSB_i64 = tcg_temp_new_i64(); \
> +        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
> +        TCGv tmp = tcg_temp_new(); \
> +        tcg_gen_add_i64(RddV, RssV, RttV); \
> +        fLSBOLD(PxV); \
> +        tcg_gen_extu_i32_i64(LSB_i64, LSB); \
> +        tcg_gen_add_i64(RddV, RddV, LSB_i64); \
> +        gen_carry_from_add64(tmp_i64, RssV, RttV, LSB_i64); \
> +        tcg_gen_extrl_i64_i32(tmp, tmp_i64); \
> +        f8BITSOF(PxV, tmp); \
> +        tcg_temp_free(LSB); \
> +        tcg_temp_free_i64(LSB_i64); \
> +        tcg_temp_free_i64(tmp_i64); \
> +        tcg_temp_free(tmp); \
> +    } while (0)

You might as well implement this properly with tcg_gen_add2_i64.

> +
> +/* r5:4 = sub(r1:0, r3:2, p1):carry */
> +#define fGEN_TCG_A4_subp_c(SHORTCODE) \
> +    do { \
> +        TCGv LSB = tcg_temp_new(); \
> +        TCGv_i64 LSB_i64 = tcg_temp_new_i64(); \
> +        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
> +        TCGv tmp = tcg_temp_new(); \
> +        tcg_gen_not_i64(tmp_i64, RttV); \
> +        tcg_gen_add_i64(RddV, RssV, tmp_i64); \
> +        fLSBOLD(PxV); \
> +        tcg_gen_extu_i32_i64(LSB_i64, LSB); \
> +        tcg_gen_add_i64(RddV, RddV, LSB_i64); \
> +        gen_carry_from_add64(tmp_i64, RssV, tmp_i64, LSB_i64); \

Likewise.

Ignoring the rest.  Too large.

r~

