Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C430D3AEAC1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:07:34 +0200 (CEST)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKaL-0005ED-7F
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKXa-0002YQ-PN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:04:42 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKXY-0007D1-Jm
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:04:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso48508pjp.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oBXRjnUv39Mvu8ln5DIDYCaprefyZdfdfQ2Lb+NsNEc=;
 b=apRhGRJh3Cji728GMNyCen7ql2y9wFr6SNxc1bGvBP/h4UogryvFWCaY00xTK6DDda
 mLIBLEczm0opjXuHFh0g2MdZhJPTh4oevB0LoBxjQfOa6i7JFBhUEnkXYMUnSL+I+tTU
 i9jYcsWir4nOFCiXaEfUsJcLAw/R9VyqNpiL2f5ToDwLhqHIBHvTCFsRh1n6qV26jII6
 SrmCbPYjg7HTfc11T0wpBI0Dkf3pCKa+6/k8n79qCz4z5qZ7IRSncSQ4DBwFEyEU5zyC
 fz6U0QPVBRrr/FxK9NnQW5VTeprcj7fKtlLettmDaPnbKjsECJo3UnWx0QCtsQ0XzJ0l
 UcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oBXRjnUv39Mvu8ln5DIDYCaprefyZdfdfQ2Lb+NsNEc=;
 b=BFIv285/vEkjP4eAuMFaXWajZpYsHqpL8wD1lNKMuLLpK4aivd4XUgp4ty/GhU2O10
 4TYgF1ZgBRTgCPgn5KhPW0ZNTuteiVfBy7am+1xtGoSWnSt66zTHn39p3TTwvL5Ycr6V
 0WpVqHxq7iai94wSH7lHFb8+Iy+D73wwxXf1K/8Ea7la6eXZp0KOFGMdKqL3FlHz3/Ec
 7AP0GZ4PtW46wErifMTQeJ/WEIH4xz5CTw/KwTUoT7K++XUenaUxSSBbm4EwzRO1k5HM
 W1mbw4byQS8kVj53lq5/hReSQviMF8QJTxSqnEnlekgNm6Mkv8WZCMvUHDgSHR6apLfG
 gCkA==
X-Gm-Message-State: AOAM531SnmcNK3MOE7KC2V2/ASSfdwKwirszKa1qCuK8dU2iY7We7ZsQ
 3cw1roAyXBs/tmkOXjzRwc/cDxdc+ChHhg==
X-Google-Smtp-Source: ABdhPJzmNK6eIaiE8YDFC2FvFEHckNEnTo30keTTzbpEjTIYaO9Pql/nb8V+KlrBrJY+RdVoW0tViQ==
X-Received: by 2002:a17:903:31d1:b029:120:2863:cba2 with SMTP id
 v17-20020a17090331d1b02901202863cba2mr18321402ple.28.1624284279095; 
 Mon, 21 Jun 2021 07:04:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s24sm19035927pju.9.2021.06.21.07.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 07:04:38 -0700 (PDT)
Subject: Re: [PATCH 03/28] tcg/aarch64: Support bswap flags
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-4-richard.henderson@linaro.org>
 <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f57a5f35-b263-20d9-b122-4a7083d5ac20@linaro.org>
Date: Mon, 21 Jun 2021 07:04:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 7:01 AM, Peter Maydell wrote:
> On Mon, 14 Jun 2021 at 09:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
>> index 27cde314a9..f72218b036 100644
>> --- a/tcg/aarch64/tcg-target.c.inc
>> +++ b/tcg/aarch64/tcg-target.c.inc
>> @@ -2187,12 +2187,24 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>>           tcg_out_rev64(s, a0, a1);
>>           break;
>>       case INDEX_op_bswap32_i64:
>> +        tcg_out_rev32(s, a0, a1);
>> +        if (a2 & TCG_BSWAP_OS) {
>> +            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
>> +        }
> 
> Side note: it's rather confusing that tcg_out_rev32() doesn't
> emit a REV32 insn (it emits REV with sf==0).

Mm, yes.  I'll tidy that up in a separate patch.


r~

