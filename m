Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81F31B25E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 21:14:21 +0100 (CET)
Received: from localhost ([::1]:42686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBNmd-000370-MS
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 15:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBNli-0002gs-2W
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 15:13:22 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBNlg-0004gl-9F
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 15:13:21 -0500
Received: by mail-pl1-x632.google.com with SMTP id z7so2566606plk.7
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 12:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U/e5bxaIyRPDsKQFtAXbCjCjtRM9Ht8q4mMv4t35Nb8=;
 b=jYlxUDexbtVJHaOChY04IQiwkHNYKK23NBMusFq+wS1Q+QFpU9Z1I0LTrC901VMfBF
 aw7IYaQChYSedQ8gJG+5kOvVFBKj/SWCbxE1DbC8bYfcSmukY50/zkWvWfSMcF46rFSi
 YT3X+GXieS+Z4FROpcWeNrry60E+h9QKKRUJgbBXsPuuD3FlDrVJznW44ZKYNI7kOa22
 b+nLDuVyDHx9YJyj/56jgATlQgwH6hqWBJepUpA4bEg25Q5LAMQoefF/x1tBpY0MtABM
 B73gnURmHEzBGec3rnS+ADOLIX0RDE5xoNezZ0f0nD6V/KOHH+Gjs4h4YM+nlUvZSVZK
 0W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U/e5bxaIyRPDsKQFtAXbCjCjtRM9Ht8q4mMv4t35Nb8=;
 b=kcTmgrNt7RoAJRgbioB8zSfxppiEPgJaiU4cza6kPvMKWPI03Wwo0NWyjnnWZA0XIj
 EK2wh5q9uz/yKQKdXQmOTjVppJC8uNNZ1UoCfUyLAtQY6msKjmErQzdN/JUVzGTkV21d
 eL67zmpu2PLE7+5rsokOuqmsimNjqIK6A6mEEGe+Szh093syOL59v7hJ09lYnOK41ZFY
 6saoPxmvynbiSCS5BCNWi3YAGSYp3VkObKAMv+R/B6GFfLv20hYOuE5UsSO7MCwaRvpC
 a7Ta2AMHy4P0e8rTzs1toew/S1kUMBf5p80eXJIFLqOotemR3tXe/bRuguSwut2a+2cQ
 dAXQ==
X-Gm-Message-State: AOAM531FpGB6/DT15+BCiGHpoOJC0pDz+gkMd5Eil2/nxG/NxSkNR9ah
 DT968T4ixGQG1wljODKLZpaA2A==
X-Google-Smtp-Source: ABdhPJzgRn4vbYCqF5TFY9iu5zJZqJ66kKa2MuUnnrNYYocJWQ8uk5vK4WIvNlVkS/p3STwIFrjWFg==
X-Received: by 2002:a17:90a:c84:: with SMTP id
 v4mr12983114pja.228.1613333598811; 
 Sun, 14 Feb 2021 12:13:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 g7sm15785335pgg.50.2021.02.14.12.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 12:13:18 -0800 (PST)
Subject: Re: [PATCH v8 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-16-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c036fc7-444f-6ea3-7b1c-2a42837fb5ac@linaro.org>
Date: Sun, 14 Feb 2021 12:13:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-16-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
> +uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c)
> +{
> +    uint64_t tmpa, tmpb, tmpc;
> +    tmpa = fGETUWORD(0, a);
> +    tmpb = fGETUWORD(0, b);
> +    tmpc = tmpa + tmpb + c;
> +    tmpa = fGETUWORD(1, a);
> +    tmpb = fGETUWORD(1, b);
> +    tmpc = tmpa + tmpb + fGETUWORD(1, tmpc);
> +    tmpc = fGETUWORD(1, tmpc);
> +    return tmpc;
> +}

I presume this is intended to compute carry-out from 64-bit addition with carry-in?

    uint64_t r = a + b;
    return c ? r <= a : r < a;

> +static const int softfloat_roundingmodes[] = {

FloatRoundMode

> +static float32 float32_mul_pow2(float32 a, uint32_t p, float_status *fp_status)
> +{
> +    float32 b = make_float32((SF_BIAS + p) << SF_MANTBITS);
> +    return float32_mul(a, b, fp_status);
> +}

This is float32_scalbn.


r~

