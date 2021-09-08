Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBBA403452
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:38:02 +0200 (CEST)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrDd-0004e9-Gf
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNrB2-0003mI-V7
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:35:21 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNrB0-0004Ha-Tk
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:35:20 -0400
Received: by mail-ed1-x529.google.com with SMTP id q3so1401839edt.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 23:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DQE9izP/YlAJPhAtANxQzwxdMTygYWlVDayqKtbcuPs=;
 b=UD7p9r3Q5ByIicJiVMtD4jcW76x7bvLv/wxwPt5RUX7Cr+N2E8Bky47MSwaaby1xwK
 OWiSrHaIn6ad/5ndQS/Pru7MJDPAMftu3Ax5TycER2dGxN64cFd2XaTqAxKppSR7nfXS
 MdpUgwlZmzh7hSvPft2Dsl8MQ+IOlQOMvEN14q4D1hejPt5bQ/tJOewzjkPESfHDGv3N
 izWq1d2pQZklbU182pRajYlHFsIAenmwyxkCUSh2xkyCkTaJTaGonoi57+xmtz7a8AlD
 QCXaJSlji5hEk3+sPeUCn6T4ApHggJEVLmH8R2jsSta0gPRBCa6FihSEPIiId059lMuk
 HHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DQE9izP/YlAJPhAtANxQzwxdMTygYWlVDayqKtbcuPs=;
 b=WlBxHHfAIsrGEV//CUwFYMhAbamhWW2OGE/gnBp36pH/63iiCwhAMAxD8J0/eVDmL5
 Zc+/vCdTIs4bcVkIBdoObAS6PPatS/xuVWooIAWgK/by92F4U/hOyaUaPYqTessa5dHY
 ZtBHHcNKxiz+SQrBwU5ew5adMFhK7OT5NNtf7jVCtdTKrpKsBxwInURP0K7KFj6ZswxE
 BqxrQQ3zaUPq/l5W3rSvfXcTtZLQkuEClBp21JiOx9ek5L4xei+1knw0sNvbnZXzOHTB
 +8XYhIHbs/PNmucxA3kaUWU3rLmKLznsJtiMrLPebOXuVlSAS9SazBjtXrCQNShY+4rU
 7tXw==
X-Gm-Message-State: AOAM531rwfz1Yf+U7TCoZ2fSvMgc7cHD4b+dkktQxXX/wVNiASFliaVO
 /JwMeUypgCa7UGsKpGnDlRzOMg==
X-Google-Smtp-Source: ABdhPJxKNaY++qPnIXrc3re3P3RVaUESpVMdD40QmP1Sd6Pmr32CpAejk+s0Nsxx1+cet+JE7mTZCg==
X-Received: by 2002:a50:9e0f:: with SMTP id z15mr2287283ede.40.1631082915961; 
 Tue, 07 Sep 2021 23:35:15 -0700 (PDT)
Received: from [192.168.127.34] ([185.81.138.20])
 by smtp.gmail.com with ESMTPSA id i9sm566536edx.38.2021.09.07.23.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:35:14 -0700 (PDT)
Subject: Re: [PATCH v6 09/12] target/hexagon: import parser for idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-10-ale.qemu@rev.ng>
 <BYAPR02MB48868558D54556AE4C145626DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a32683e0-9c32-bd0a-281f-61e87670d648@linaro.org>
Date: Wed, 8 Sep 2021 08:35:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48868558D54556AE4C145626DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 8:08 PM, Taylor Simpson wrote:
>> diff --git a/target/hexagon/idef-parser/parser-helpers.h
>> b/target/hexagon/idef-parser/parser-helpers.h
>> +#define OUT_IMPL(c, locp, x)                    \
>> +    _Generic(*x,                                \
>> +        char:      str_print,                   \
>> +        uint8_t:   uint8_print,                 \
>> +        uint64_t:  uint64_print,                \
>> +        int:       int_print,                   \
>> +        unsigned:  uint_print,                  \
>> +        HexValue:  rvalue_out,                  \
>> +        default:   out_assert                   \
>> +    )(c, locp, x);
> 
> Unless something has changed, qemu requires building with GCC 4.8 which is old enough that it doesn't support C11 _Generic.

Something has changed.  The minimum is now 7.5, and we use -std=gnu11 now.
We also use _Generic in several other places.


r~

