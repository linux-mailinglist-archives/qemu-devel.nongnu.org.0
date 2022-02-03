Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80EC4A7E8E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:04:27 +0100 (CET)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTMB-0004Ey-0k
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:04:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTJ5-0002OB-5F
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:01:15 -0500
Received: from [2607:f8b0:4864:20::1030] (port=40836
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTJ3-0002fh-HQ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:01:14 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so8802879pjt.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 20:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m5TUnOTjXqAXeMM1rZbgqSEAcyF635xpYbmeqW1M5oc=;
 b=pqG6hkXt3MVsEIBsDuB7FCcC1NX3jmEhiH2PakGymJGFDcKt7dt3Tpr1aGv3JNleIe
 5/E5h7IXvxbqb97ID+mPS9zdazX5uiaou8/Nft7rkPcaX6qW9RYphCAVdUWKghRnrghP
 gCBufcHlDQMTa4B/7mjmMYkIYLjYbn80sOCBBsO9ZFum9RrgjiUTjH+2rJQmIyf+jsYo
 hngMwXNp6NrgLy18qCxOdRw7euL68XX1Rdq0R8rvCCyYqnswhBTd0caeavmp45wHhg3z
 VFkWx2UKLuZtwNbRceEmzZ6+4RhKiGaAPd3sQrKLYTcq6vtnnf/s5CoKu92/6DSoe/K4
 PKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m5TUnOTjXqAXeMM1rZbgqSEAcyF635xpYbmeqW1M5oc=;
 b=hrwQApux5etAlMSKowvZyFjjc8zHg2YhzSu7jyp/KDrqYA37p8Ypvln73eJPSqLTBy
 rHhvCHFqlpvbtDV6kwLpArZ0VNYAIdZtel7UGe8DK8nR0Epk0j4n+x3p1kEhYscDdeq1
 NPSKG6Q8nmySLOlNuhOxL+TuXSnChRwAMpth1c3Fgt1TC00+Wc2GfZ8MLi2M0UjNj+nn
 yR/tV+k/CUT94y4ezvQP99+ve2wnbqXQyl0hc/AukFkwNLqN31d6MtJHere4KsR33+Xz
 u8vD6Id6qdjq/if8KUbcZ0J4fC1C+s2drbmOiBesDqj3bElPUmeQLhaTWo4QCJbQXNPy
 wfbA==
X-Gm-Message-State: AOAM532IGq6Z2w5gCX4TriCvYK76RyTfSs2daK2OWvIEu0qwksrzBGlK
 MBi13EIXc7EOHK/fUw4IqLhKrA==
X-Google-Smtp-Source: ABdhPJytoZuHtF2/MwO9uJrwFa6wjc0sTGqpvtpR5y63Lb6pfuHzBKJV8Hz8h50uoIEpIV8vo+QxbQ==
X-Received: by 2002:a17:903:22ce:: with SMTP id
 y14mr33295714plg.37.1643860871830; 
 Wed, 02 Feb 2022 20:01:11 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id m1sm27606215pfk.202.2022.02.02.20.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 20:01:11 -0800 (PST)
Message-ID: <1b28ad76-f980-1bd1-4a73-7e4198c72cd7@linaro.org>
Date: Thu, 3 Feb 2022 15:01:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/13] hw/intc/arm_gicv3_its: Avoid nested ifs in get_ite()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> The get_ite() code has some awkward nested if statements; clean
> them up by returning early if the memory accesses fail.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 26 ++++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

