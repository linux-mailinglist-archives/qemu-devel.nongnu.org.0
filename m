Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB699387C19
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 17:10:56 +0200 (CEST)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj1N1-0001Mo-Me
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 11:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj10k-0005ft-Lv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:47:54 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:45624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj10g-0004QB-Am
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:47:54 -0400
Received: by mail-ua1-x92f.google.com with SMTP id 20so3305037uaf.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XOnY3p1R2+ocbA+FlRdz8pr6+rkik4VqTVqjvSrhmfw=;
 b=hzQgMDxBfSBBM3d6mOcVLUGTLukugnW972pq+ir1fW6LHxumkBRg2dcJuUTHsZSX4+
 p7eqh1OBPjATl9ProFtsMv4gyNDHjTiK7KYABz6Zezy4GVJWasglqneqSdTxHKDFOPqq
 zfdyRLgP0qMXzJy16RsvLtWhlKyNBg+aNPOLIy7oFgBjBNYbcBpTH3klNqryj9cAnQ4K
 ZmXzbNCVIl6usC9CWRufltZ0FdVuhOoyHnZeGU82De00K2XH9exF15B8Rka1JnWs+0EY
 yrGOOjDejWlebXtzZoOLoZZk5TAhXrsYQbkiYTh5yWARsYj9xGVu5HJTyl4aDafTILfm
 lK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XOnY3p1R2+ocbA+FlRdz8pr6+rkik4VqTVqjvSrhmfw=;
 b=b21d4GPoX167tgU5V8NY7jwsP4iAx9zNxGaa1dQJUvoA5YXM8NKPkIn51+TF+UF3kr
 CeFkU0os7gv862Uy1aI7zO7MGPVJVzLxGuQ2DcRa5qaXViJ1uangP0N6vKBrKnB0Oipm
 2io5Kczf9hZY4XcyJI6RtYN25Ltxu5f2Tx9/dGIehyWtctrjyqNvz1UTY/VQ731pz/iN
 fhuneTJwMcBnxeNciXG9pJdis+dbfLgUQ5mghimIRRl+lLAVyadLO726cVaUIMms4KYh
 jMOIHBdhrKZi4uS4x33qMxKzUjdjL+5sNzuBSv/4yWPe9CLt82W+JVNQB6gXfT/7pJgY
 kshQ==
X-Gm-Message-State: AOAM53041SUdb2heC5AnQjlWKIBsVvzHWG3citTxuybKedeMNveUb2DZ
 Ybv1jUYx0h9BixRNEYODHgKBa+7HaTLy+BWW
X-Google-Smtp-Source: ABdhPJyyF0zbFqC2mQFu2KWE2JaZWl1retD4MZQ28qvjLOoEm5ryFQI+Q6JcOi/T6qqvciRzprk7hg==
X-Received: by 2002:ab0:3b06:: with SMTP id n6mr6891758uaw.6.1621349269385;
 Tue, 18 May 2021 07:47:49 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id r12sm2871439uao.6.2021.05.18.07.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:47:49 -0700 (PDT)
Subject: Re: [PATCH v1 11/11] target/arm: Enable BFloat16 extensions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-12-richard.henderson@linaro.org>
 <CAFEAcA_YZe6xMfMFek-KEh8j3zO-AiquM3epyFET3R6XPDAjkQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0882a45d-8c02-93fb-2dff-abdc7f7c6b95@linaro.org>
Date: Tue, 18 May 2021 09:47:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YZe6xMfMFek-KEh8j3zO-AiquM3epyFET3R6XPDAjkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ua1-x92f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 7:47 AM, Peter Maydell wrote:
>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>> index 046e476f65..b2463cf109 100644
>> --- a/target/arm/cpu_tcg.c
>> +++ b/target/arm/cpu_tcg.c
>> @@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
>>           t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
>>           t = FIELD_DP32(t, ID_ISAR6, SB, 1);
>>           t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>> +        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
>>           cpu->isar.id_isar6 = t;
>>
>>           t = cpu->isar.mvfr1;
> 
> Same query as with SVE: do we need to clear these in the "!has_vfp"
> and "!has_neon" handling code in arm_cpu_realizefn() ?

I *think* we want to clear ID_ISAR6 only when !has_vfp && !has_neon, as 
FEAT_AA32BF16 should still be usable to the other one.  Which also means adding 
the NEON/VFP check you suggested.


r~

