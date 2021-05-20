Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9B38B419
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 18:17:06 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljlM8-0006U0-Vr
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 12:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljlL8-0005ZI-6j
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:16:02 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljlL6-0005fe-DE
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:16:01 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id o24so1505743vkf.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zHfsYXxeVroGA/mPajEpsznSbwa752tyGVWLbE5686o=;
 b=Y6qz4Qo9yfV/c1GFBtwtLBbvRKeyd3SwNp4bMxWnB0fzuG4Ub5XRFYz4HLyDD1zYCp
 ri4H5IxBIWrLhvmlXXmHLFs8amRNhhoJWYZALSvWNFld+Cd9ZDte9NL2pjqetntAtykk
 ztj8z07q66sJVafvW0NsfF7yZSkjSn7GsubW6cX80JqZmppE4On+nxxMbihdfJsVvpRr
 z51ibHDXfH7dEGuY9I3CcDUwgEUCX17D/YB3cPlQeFoOKb7GFek2Vhd0UZNaLhEQXKAH
 ooOh+cpXUm9tjmEAGGRjZPrsW+ix7lMPuwM7mlSSTdAueiAUeq8DzcVDtwFw235Ii4Bz
 j8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zHfsYXxeVroGA/mPajEpsznSbwa752tyGVWLbE5686o=;
 b=ePV0Nh8Sp9uKf9WXQrfCpISTt2vGFavm2WcwTm6DAAVI6UM7c/Zbq8rF0ghK2E+5zK
 TRDSTCJ6UMGRsrgzXlWmcxmgJZ5csXm2nRfplgQJgELxAIF4MRn0GpjCb1T1/aCw4vu1
 fN3rMJUpaF7kPviqMKCyQKlSic3RvkOMfpUHGZ5jJSnJMSHTmilEuRwDR3mhperfFZ9U
 C1qPQx4y/i3ytMN5qWduZDATmG0xNZHZ9axlj7Qi1/1VW+J2SRrtnGnR+WGM087kn5rX
 57C7CEGM8HNvYVi79jS8+8lb82DG3tcKL7GD5ReXC/gH6iUwoc/MuWgeEgx8wHO2EPyB
 Sm7Q==
X-Gm-Message-State: AOAM530Uqm1gpGHQhyAqFjHgdNra2QRt+ryriZLeEQ4ZlkOdy5e0YBbl
 zm6jWkTAUo0jEeAykq2bJTAH8A==
X-Google-Smtp-Source: ABdhPJzPRdviLuTh5XsRtqXl6Fy/K3t5MIEILZsM8KKXMQdvHLgWKs4PXFBvswovGrmd2flx4Nn7lg==
X-Received: by 2002:a1f:9352:: with SMTP id v79mr5180389vkd.4.1621527358606;
 Thu, 20 May 2021 09:15:58 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id d25sm517978vsh.5.2021.05.20.09.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 09:15:58 -0700 (PDT)
Subject: Re: [PULL 42/46] softfloat: Move div_floats to softfloat-parts.c.inc
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
 <20210516123431.718318-43-richard.henderson@linaro.org>
 <CAFEAcA_qmHQr8C_xGqixqNEiU_c6P37=ZEEo07k0X7_=EJWY-g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <218865da-9748-6820-7749-1fc6f905e3a9@linaro.org>
Date: Thu, 20 May 2021 11:15:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_qmHQr8C_xGqixqNEiU_c6P37=ZEEo07k0X7_=EJWY-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2f.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 8:40 AM, Peter Maydell wrote:
> On Sun, 16 May 2021 at 13:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Rename to parts$N_div.
>> Implement float128_div with FloatParts128.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> +static bool frac64_div(FloatParts64 *a, FloatParts64 *b)
>> +{
>> +    uint64_t n1, n0, r, q;
>> +    bool ret;
>> +
>> +    /*
>> +     * We want a 2*N / N-bit division to produce exactly an N-bit
>> +     * result, so that we do not lose any precision and so that we
>> +     * do not have to renormalize afterward.  If A.frac < B.frac,
>> +     * then division would produce an (N-1)-bit result; shift A left
>> +     * by one to produce the an N-bit result, and return true to
>> +     * decrement the exponent to match.
>> +     *
>> +     * The udiv_qrnnd algorithm that we're using requires normalization,
>> +     * i.e. the msb of the denominator must be set, which is already true.
>> +     */
>> +    ret = a->frac < b->frac;
>> +    if (ret) {
>> +        n0 = a->frac;
>> +        n1 = 0;
>> +    } else {
>> +        n0 = a->frac >> 1;
>> +        n1 = a->frac << 63;
>> +    }
>> +    q = udiv_qrnnd(&r, n0, n1, b->frac);
> 
> Hi -- Coverity is suspicious about this line (CID 1453209),
> because udiv_qrrnd()'s prototype is
> static inline uint64_t udiv_qrnnd(uint64_t *r, uint64_t n1,
>                                    uint64_t n0, uint64_t d)
> 
> but here we pass n0, n1 rather than n1, n0...
> 
> Bug, or false positive ?

I think it's a false positive.

Different naming schemes between gcc (from whence qrrnd came, 0 as least 
significant element) and the Berkeley softfloat code (0 as most significant 
element).


r~

