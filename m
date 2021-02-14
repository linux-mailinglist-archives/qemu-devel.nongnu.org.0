Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9706631B361
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:29:05 +0100 (CET)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQp6-00007a-Ko
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQbd-00041z-8d
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:15:09 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBQbb-0004xu-9F
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 18:15:08 -0500
Received: by mail-pf1-x432.google.com with SMTP id z15so3125209pfc.3
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 15:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cLluezcyBxHum0y4xkiMGYlT0RROM31F4g6Q4tjaKR4=;
 b=EoO3SAXLIB5w10zVscz9McO9j4nkedNMYxWYNCgJLo8ew0fEMsS4+8NbDAyKPer9N5
 nERObiQfufxhwG7/YTAIDvEYXhbCyLdh1cNWbbYmID0X96ywtQsKbgDmY8cWG6nhsCvW
 noq6wXg9i+9cMrYsXw3pEgfHJKsJtkH/j3BSQ0n4chuo3gAh2mBG5PFl74mCf0nyQm30
 nTxofMJ5cv0uEIzODe7jytNgVsOotxFGSrIjRunm5iIWCmAkyMvARNaeGs5c8q0LF2ki
 vqF70c3RHO96qSnY8WXcCd+ipXvpjy5+kIH0/3w7QyzrjAL07TVPrY3RHKL8H7vYl39J
 Ttpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cLluezcyBxHum0y4xkiMGYlT0RROM31F4g6Q4tjaKR4=;
 b=BBiMmKA6sF9xm6e3543VNXEyuisWyVie1CU7+S5sJlFiEaRR85Ubitvtf3tE4huLN4
 qEr2sDuQ7gfctE0K2eKsYR1PUAoL2cugwr9fy8jeGUCE4FEnbP6n/8X2ZL7KAOoAwxMI
 41STWDIFQpvaRxe8L5BiDez6BsCuYU0/I7G5yFNIjueB2N+SeVtZE9cNTZ7YktnDuXTW
 35WOXyZMyOs92oAmuuaz5mf2D5JSyz3nKiyY5oB3RoQNCR7aX8TldNC9mogD+gttpBf1
 MyrSwQ7+GGdCe8CDiC9ANvVTnD/OefICKJ0J1UGuuK94IlldwpCWb8r+Y39M37zCaXSy
 AtrQ==
X-Gm-Message-State: AOAM533DhLHawmLftKFiOhBkiYXrx0NOEwPx8fSqrDvxiZhr+5aEYQXX
 z5RBGm2zoWMpWQ6gq0KYijYG5Q==
X-Google-Smtp-Source: ABdhPJz5VUycwD5NWnMq8z9DQR+YHC3TdhxLTMXXfcWEuGJH2ocAtIyOrNYhoRFDI584yK5sGw8hlw==
X-Received: by 2002:a05:6a00:1756:b029:1de:b761:92ae with SMTP id
 j22-20020a056a001756b02901deb76192aemr12907731pfc.29.1613344502027; 
 Sun, 14 Feb 2021 15:15:02 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 f18sm14522549pjq.53.2021.02.14.15.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 15:15:01 -0800 (PST)
Subject: Re: [PATCH v8 17/35] Hexagon (target/hexagon/fma_emu.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-18-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd233aee-e185-e9e5-2ad0-0493c93f1ad5@linaro.org>
Date: Sun, 14 Feb 2021 15:14:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-18-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> +#define DF_NAN         0xffffffffffffffffULL
> +#define DF_INF         0x7ff0000000000000ULL
> +#define DF_MINUS_INF   0xfff0000000000000ULL
> +#define DF_MAXF        0x7fefffffffffffffULL
> +#define DF_MINUS_MAXF  0xffefffffffffffffULL
...
> +#define SF_INF         0x7f800000
> +#define SF_MINUS_INF   0xff800000
> +#define SF_MAXF        0x7f7fffff
> +#define SF_MINUS_MAXF  0xff7fffff

Redundant with softfloat.  Is the default nan really -1?  I suppose then that
hexagon does not distinguish QNaN from SNaN?

You'll want to patch fpu/softfloat-specialize.c.inc for both of these choices:
no_signaling_nans and parts_default_nan.

> +typedef union {
> +    double f;
> +    uint64_t i;
> +    struct {
> +        uint64_t mant:52;
> +        uint64_t exp:11;
> +        uint64_t sign:1;
> +    };
> +} Double;

You cannot use a union with bitfields portably.  This will fail on a big-endian
host.  Anyway, extracting these bits of a float are already present via softfloat.

> +static inline Int128 int128_mul_6464(uint64_t ai, uint64_t bi)
> +{
> +    Int128 a, b;
> +    uint64_t pp0, pp1a, pp1b, pp1s, pp2;
> +
> +    a = int128_make64(ai);
> +    b = int128_make64(bi);
> +    pp0 = (uint64_t)int128_getw0(a) * (uint64_t)int128_getw0(b);
> +    pp1a = (uint64_t)int128_getw1(a) * (uint64_t)int128_getw0(b);
> +    pp1b = (uint64_t)int128_getw1(b) * (uint64_t)int128_getw0(a);
> +    pp2 = (uint64_t)int128_getw1(a) * (uint64_t)int128_getw1(b);
> +
> +    pp1s = pp1a + pp1b;
> +    if ((pp1s < pp1a) || (pp1s < pp1b)) {
> +        pp2 += (1ULL << 32);
> +    }
> +    uint64_t ret_low = pp0 + (pp1s << 32);
> +    if ((ret_low < pp0) || (ret_low < (pp1s << 32))) {
> +        pp2 += 1;
> +    }
> +
> +    return int128_make128(ret_low, pp2 + (pp1s >> 32));
> +}

This is duplicating code from include/fpu/softfloat-macros.h, except for the
wrapping to Int128.  That said, I don't think you should actually need this,
or, frankly, the vast majority of the rest of your fp code.

> +typedef struct {
> +    Int128 mant;
> +    int32_t exp;
> +    uint8_t sign;
> +    uint8_t guard;
> +    uint8_t round;
> +    uint8_t sticky;
> +} Accum;

Um.. what?  Why in the world would you split the 3 guard bits away from the
rest of mant?

> +/* Return an infinity with requested sign */
> +static inline float64 infinite_float64(uint8_t sign)
> +{
> +    if (sign) {
> +        return make_float64(DF_MINUS_INF);
> +    } else {
> +        return make_float64(DF_INF);
> +    }
> +}

Surely just float64_set_sign(float64_infinity, sign).


> +static bool is_inf_prod(float64 a, float64 b)
> +{
> +    return ((float64_is_infinity(a) && float64_is_infinity(b)) ||
> +            (float64_is_infinity(a) && is_finite(b) && (!float64_is_zero(b))) ||

This is always false, because is_finite excludes infinity.


> +float32 internal_fmafx(float32 a, float32 b, float32 c, int scale,
> +                       float_status *fp_status)
> +{

Right.  So, best I can figure, all of this support code that's re-implementing
softfloat stuff is just so you can add "int scale" to floatXX_muladd.

Currently, we have a single bit to affect scaling of muladd (2**-1), for Arm.
It would be easy to adjust the softfloat implementation to handle arbitrary
scaling.

I would vastly prefer to do that than do this.

> +float64 internal_mpyhh(float64 a, float64 b,
> +                      unsigned long long int accumulated,
> +                      float_status *fp_status)

I really don't understand what this is doing.  Sadly, the hexagon manual
doesn't bother to define some of its pseudocode functions, and this (dfmpyhh)
is one of them.


r~

