Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23C4C0580
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 00:45:36 +0100 (CET)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMeqd-0004bm-CT
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 18:45:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMepF-0003l9-Qu
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:44:09 -0500
Received: from [2607:f8b0:4864:20::436] (port=38737
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMepC-0003Mg-I8
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:44:09 -0500
Received: by mail-pf1-x436.google.com with SMTP id x18so13650086pfh.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 15:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ouPWHxmmd0e7tXDWxOYhV3NPGB6VPAXh5IvkyATDUkg=;
 b=nQLxD6oR1rWhDBaHEXgtpiYudW1ogruwogDrqF0IWgHObaXy/WzN7ZxBtsq0rscM07
 RPQubcZneBm2YxhR1o8S5fuNqlqV2kO6/qBhozkpgGC58FYPnQTfmiuZsAvj1P8uMw8x
 +hwGQFFzQJng3fVX0VgMfm1Dt/mMld/LmRm/Xz/KQqhpW9AbEVfP1NH5EEW+Z6M0rLYw
 0eAwZLY6FEXIJPBmEFYMF/GjXG1hKI18sW4mPmagxVok87SDNKRBf8Y+OWUrrW2EsQCu
 hs/k23FP1FMHBmabGrFTNZQEy0baDNLVZdGR4MJ+A+cd8bSJc3cDhKGUbGS9qjOfszrP
 ok3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ouPWHxmmd0e7tXDWxOYhV3NPGB6VPAXh5IvkyATDUkg=;
 b=St0Tjwe7IJmBRPk09tikKUeoG6uAbpA7xEl+STGh1n6p9szPnZg71ieUv3GbFSLplO
 5bdUiAIBbNYKD5bhrKvITDsynXCMWf1i2loWasCi6nSXDQBYwXwNcBNFM2C4V150RA2K
 yIeM0lUKGmlX9Xj/uvwrCyvyIAO5Ft039+51CP/S2kPsFgL2fnwQKbimCVBhmjT0lYbl
 R+/Ktx28avCNtsibRlZLQ2NHn7hJH/62Z/wUpcW7mKoHuOxDdtA0/+2lAyLghHo5QB3R
 4a4USg+65CzC2sXYPhgfADVfHy60Ekvf8HnSQgvBSIctkVMgvYHObGx1GGkpgzxB+fHx
 UzmA==
X-Gm-Message-State: AOAM532wxUdK6gd7jlmoi1bQ/L0szTynwPBwLVD8YCmHhAPlQVTpjrSh
 V/q6GW5E6kG87x7f9QCZGCb8gA==
X-Google-Smtp-Source: ABdhPJxBzwfJDVh1eelfT9nRzEksgPzBGajPUO13Sy1Y9TRCnnvgvFryk+m/dp/RZYNfxrjpnDMAEA==
X-Received: by 2002:a63:130a:0:b0:372:e02a:5010 with SMTP id
 i10-20020a63130a000000b00372e02a5010mr21259374pgl.144.1645573430197; 
 Tue, 22 Feb 2022 15:43:50 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id ck20sm711141pjb.27.2022.02.22.15.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 15:43:49 -0800 (PST)
Message-ID: <338d0236-8ced-6a15-a3d3-d1a7993fff3f@linaro.org>
Date: Tue, 22 Feb 2022 13:43:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 32/47] target/ppc: Implement xxeval
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-33-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-33-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> +    tcg_gen_movi_i64(disj, 0);

The init here means there's one more OR generated than necessary.  Though perhaps it gets 
folded away...

> +
> +    /* Iterate over set bits from the least to the most significant bit */
> +    while (imm) {
> +        /*
> +         * Get the next bit to be processed with ctz64. Invert the result of
> +         * ctz64 to match the indexing used by PowerISA.
> +         */
> +        bit = 7 - ctz64(imm);
> +        if (bit & 0x4) {
> +            tcg_gen_mov_i64(conj, a);
> +        } else {
> +            tcg_gen_not_i64(conj, a);
> +        }
> +        if (bit & 0x2) {
> +            tcg_gen_and_i64(conj, conj, b);
> +        } else {
> +            tcg_gen_andc_i64(conj, conj, b);
> +        }
> +        if (bit & 0x1) {
> +            tcg_gen_and_i64(conj, conj, c);
> +        } else {
> +            tcg_gen_andc_i64(conj, conj, c);
> +        }
> +        tcg_gen_or_i64(disj, disj, conj);
> +
> +        /* Unset the least significant bit that is set */
> +        imm &= imm - 1;

I guess this works, though it's not nearly optimal.
It's certainly a good fallback for the out-of-line function.

Table 145 has the folded equivalent functions.  Implementing all 256 of them as is, twice, 
for both i64 and vec could be tedious.  But we could cherry-pick the easiest, or most 
commonly used, or something, and let all other imm values go through to out-of-line function.


r~

