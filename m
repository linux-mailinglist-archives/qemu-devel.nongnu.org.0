Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02618557E09
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:45:41 +0200 (CEST)
Received: from localhost ([::1]:53028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4O5U-0007gu-2r
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4O4D-0006oT-Am
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:44:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4O4A-0001ys-QQ
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:44:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id r1so18333693plo.10
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WAYlGURz1ImDMSr4/9X8JnApIuOiPyTPttYWz1fPiiI=;
 b=QMdBwGn7znQBWkz4555GQWr+audo/oO5LJZ8gnOJ4cspAUfx1972q/BLl3TUokQtvj
 Dkdtr3YDaE2qeKZnxUTCqsEAXB29Jq4wGogwWPmSijesrNZU0fmLm2aH49sL1/UHnzGJ
 AttwgHjWxQJCLRV5XM27f/H+ZHsK2nbKst3I5bSIuqH8aZP3untiinfbINdm7exWITk/
 pRdCsEek21DxVIn8AvINsvhmV2gy81xkmneYTF1JErjPX6G2vCKThhRCIrAR1wpP2rfw
 JslRRbdNkDZe3vF8xJxGVTCjWLHFRwRKn3fn47SL8Jst4n4OYCuMr1LMksxm3yFX4Nqc
 xCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WAYlGURz1ImDMSr4/9X8JnApIuOiPyTPttYWz1fPiiI=;
 b=OCmu/SBnS3q1rFbwSZm0bm1mEd/e4YnKcU9LylXGrSxQWKzVZmozvrK5u3K/7c/nHv
 82WtiwMoT2yLVUm5zaH/iLvRsxBoGJ3m7Z+/dtn4HDX/G/ueFbGufGkYjKjGjSr0L/5j
 t13e95c7rj20Y6bu3305SR3ZVHf547bVjQM5NhFGn9p/mBSJd0JhXeEQld6Dv80WQwuZ
 b+/ZX83q9YWSI1sZX/QZRWmwY6nrPiacivNLg18AVwpK1igMR0buc2o40DBnCpSqS+8p
 WOXNcdD9CSijHfHx1vf3Ho1IC0NyPNLBZaEwQJe2BjwqITCIRGff2KT/FC3fpBjVhMds
 A7Ag==
X-Gm-Message-State: AJIora9FbFd9zT/xpmugeJUNnOP+z4sdlP3kyEv+KkZ8lPQdw8N49WZC
 +cN7uQBoaKPtRjyFKifvoLNO3g==
X-Google-Smtp-Source: AGRyM1vwmYgJsgIvYlq6Db1OfRPnChVNhpUI8AN4QS5UXB3usJoeFLGNpNKTmTaE1386PPG0CnH6eQ==
X-Received: by 2002:a17:902:e5c9:b0:166:34ff:72a3 with SMTP id
 u9-20020a170902e5c900b0016634ff72a3mr39381327plf.80.1655995457187; 
 Thu, 23 Jun 2022 07:44:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a17090302cd00b0016a5f1722absm1289720plk.75.2022.06.23.07.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 07:44:16 -0700 (PDT)
Message-ID: <28c72d0c-05fe-a8f5-9a60-bdf3675a9d53@linaro.org>
Date: Thu, 23 Jun 2022 07:44:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 25/51] target/arm: Implement SME MOVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-26-richard.henderson@linaro.org>
 <CAFEAcA-_Cof12Oe=4HTJx_4Nmtfq1Oj7BRdFmzv989H13kUVTg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-_Cof12Oe=4HTJx_4Nmtfq1Oj7BRdFmzv989H13kUVTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 6/23/22 04:24, Peter Maydell wrote:
> On Mon, 20 Jun 2022 at 19:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We can reuse the SVE functions for implementing moves to/from
>> horizontal tile slices, but we need new ones for moves to/from
>> vertical tile slices.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper-sme.h    |  11 ++++
>>   target/arm/helper-sve.h    |   2 +
>>   target/arm/translate-a64.h |   9 +++
>>   target/arm/translate.h     |   5 ++
>>   target/arm/sme.decode      |  15 +++++
>>   target/arm/sme_helper.c    | 110 ++++++++++++++++++++++++++++++++++++-
>>   target/arm/sve_helper.c    |  12 ++++
>>   target/arm/translate-a64.c |  19 +++++++
>>   target/arm/translate-sme.c | 105 +++++++++++++++++++++++++++++++++++
>>   9 files changed, 287 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
>> index c4ee1f09e4..600346e08c 100644
>> --- a/target/arm/helper-sme.h
>> +++ b/target/arm/helper-sme.h
>> @@ -21,3 +21,14 @@ DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
>>   DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
>>
>>   DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
>> +
>> +DEF_HELPER_FLAGS_4(sme_mova_avz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_4(sme_mova_zav_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> 
> What do the 'avz' and 'zav' stand for here? I thought that
> 'zav' might mean "from the ZA storage to a Vector", but
> then what is 'avz' ?

It was supposed to be z <- av and av <- z.

I've used "z", "p", "w", "x" single letter argument indicators for sve.  I think "av" was 
supposed to indicate "array vertical", but it's definitely non-obvious.  I'll fix this up 
and add some commentary.

> This is too confusing -- I spent half an hour looking at it and
> couldn't figure out if it was correct or not. I can see roughly
> what it's supposed to be doing but I don't really want to try
> to reverse engineer the details from the sequence of operations.

Ok.

> Perhaps (a) more commentary and (b) separating out the
> horizontal and vertical cases would help ?

Ok.


r~

