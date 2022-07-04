Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445EC565008
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:50:19 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Hmb-0007cw-U1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Hki-0006iW-In
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:48:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Hkg-0006dq-UM
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:48:20 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so4368240pjf.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wsx0yeJJxFYXWH+ozDvqjHpTMXCAhvYk5pn29Di5Tms=;
 b=SLRbiviofkiQGKpgJao1JSydMU6hz4Nr6m0cyInxMMxLb7BWOojgFgFmd0yDzg3LDI
 LtET8IOEoiRXdSFssd9T1pRVt2gfqmoVET4X+la1XsMrH60GUtV/NH45CdRq5a/6rwGB
 3u+E4gnsljAqgQbM2ZtZ3X1RO0maiewSjYT/q//8dMWnuTbS6QpnUqLeicRteFSq5nhz
 pDCBbJROoJFUR3odi+526qX2zzJq6rCnND6dmx37VnVB5L3Yonkyn2gwKkcxw9OtUoGk
 dUo/DjbkazcIy98d/24/KkqDPnpTfZpFZhYj11M8O9jdEU3tipd8MlbodYQ2Z4Mj0+lS
 ve5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wsx0yeJJxFYXWH+ozDvqjHpTMXCAhvYk5pn29Di5Tms=;
 b=fr8ZQfBYN232JiQVkEztb/qP2Ul+LFYOQ8RUh5X2a4mz/dWr1Cfawu8N9uA1CeXrNt
 pvKFf6WJJYL4Tq63XIoPnu/tSsk7zHdwtXacvsOD8kTFdZYwmoRcqWka72ku8XTfGGfJ
 Byh4SUM/TxnfpIiBtzY6nREFyRaZKh8hcsB8z4jtyWiQQT36PyA16z4Ccb4sDCY2qnQG
 O9T+h2IL3eq57FKHooxB6o7ETyoij/P1c+rvJk/tP8zE5o2/uyDA08BKgiyZcfyEGdqb
 sxjYKT9Mi2XbeKrRdfDs7LBpnfE7UcmhSR/M5ctL8iDr+e9FY0YbY3qDbfdEOOY/7xEO
 WZaQ==
X-Gm-Message-State: AJIora9cNo/MMwpcTx5gshGEfw/NVo2KC49sAqL740kmTK1Y6/2+akz3
 n82rg6B8m0B5cdqR4SdsJmtpbg==
X-Google-Smtp-Source: AGRyM1t4QtuVXrnmsG28HxdUAHy/KRRnQ2NwMopAiJgFuF/D10/JqutefThPa3i5tCmbz3smRcCFMw==
X-Received: by 2002:a17:90b:4a4f:b0:1ef:90fb:35a5 with SMTP id
 lb15-20020a17090b4a4f00b001ef90fb35a5mr58745pjb.161.1656924497445; 
 Mon, 04 Jul 2022 01:48:17 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a056a00234f00b0052542cbff9dsm21414852pfj.99.2022.07.04.01.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:48:16 -0700 (PDT)
Message-ID: <8a96f7c2-3d7d-619b-a1d3-452fc22cf494@linaro.org>
Date: Mon, 4 Jul 2022 14:18:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 07/45] target/arm: Mark PMULL, FMMLA as non-streaming
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-8-richard.henderson@linaro.org>
 <CAFEAcA9DrujnB==AXU3udYv_sfCcWT_sUxyqsYoMJDAoyOb+vw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9DrujnB==AXU3udYv_sfCcWT_sUxyqsYoMJDAoyOb+vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/22 17:48, Peter Maydell wrote:
> On Tue, 28 Jun 2022 at 05:28, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Mark these as a non-streaming instructions, which should trap
>> if full a64 support is not enabled in streaming mode.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/sme-fa64.decode |  2 --
>>   target/arm/translate-sve.c | 18 ++++++++++--------
>>   2 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
>> index c25bad5ee5..c75a94e0fc 100644
>> --- a/target/arm/sme-fa64.decode
>> +++ b/target/arm/sme-fa64.decode
>> @@ -58,8 +58,6 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
>>   #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
>>   #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
>>
>> -FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
> 
> This encoding pattern (as the comment says) covers only the esize = 128 case...
> 
>> -TRANS_FEAT(PMULLB, aa64_sve2, do_trans_pmull, a, false)
>> -TRANS_FEAT(PMULLT, aa64_sve2, do_trans_pmull, a, true)
>> +TRANS_FEAT_NONSTREAMING(PMULLB, aa64_sve2, do_trans_pmull, a, false)
>> +TRANS_FEAT_NONSTREAMING(PMULLT, aa64_sve2, do_trans_pmull, a, true)
> 
> ..but these trans functions cover all the esize values.
> 
> In the pseudocode for PMULLB/PMULLT it explicitly does
>   if esize < 128 then CheckSVEEnabled(); else CheckNonStreamingSVEEnabled();
> so it is definitely intended to distinguish the 128 bit case
> from the 16 and 64 bit ones.

Whoops, too right.


r~

