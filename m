Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99739CB18
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 22:58:17 +0200 (CEST)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpdN2-0002jh-6a
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 16:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdM2-0001qU-Hi
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:57:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpdLz-0006ow-L0
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 16:57:14 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso2919284pjb.0
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pr/vMfXyPKX+6j0tYREdC+SOKczhluNN+TKa74jBLUs=;
 b=GJADl6pY+SZIT7WxpG1osUjzJu45ixv3178nl++DmBQeFN/ozp/yyR2bLQ9VJOWGIF
 fVFTMyGGtUSWGuU2PSqtgXY31zIRd9D/Ah84TSzzG63Rf+eBvceEQmMC057kJ3rXf55U
 f4YVuk9RNM1ts6Hv4SXtPR+33tMx8+lVmBwCSWSo6j7W5hl7KyEj0+9QynrG6Hm4YbT/
 kKEobNB6xtCzl7Jeg008phnITZnzoYs8NqW+q3J5giEcupXeZUQNixHW5BwMRZq4OF8F
 eTl+g3iaCQSdknPwHl0Cvk9qy9COsOqZLFfIzSohXK8jFwTvVAkCwa2IyAY4cSjsf3Cz
 BXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pr/vMfXyPKX+6j0tYREdC+SOKczhluNN+TKa74jBLUs=;
 b=iGMubTpVwa6NDIPUlcp9Vpqp8kp4CIzHUCEmbq9QId6U4JAqI2Vo/StvFHlEioSE4v
 Z9t0qtCndg9lj2rlASs5f8GII86/T/MLZ2uv0aqEeyUBNWntKr4hP3AwDocqe949bnUY
 PcS9+5hDsWnRDHehJZyQrriDUW3nw5RtDJKbj9cA6+vrFQ9p23etJxOzc6tW+fi5ulmf
 VMKvfBByiEiAJt4hvs614fvCgSvRIWjDwWtYj3RPbxbU4HlOJzXr+MVdDPpTahihDUU3
 mo5QqCrGWHqh7buomxD4lKql86GUA7AcwZZd2B4t0EzA31t5BH0YYOLMgWemvSWHdvs1
 lvZQ==
X-Gm-Message-State: AOAM531tFlrmAWXTB8qImyS2oQFnLRgy6/RYW5G3PEwIq7MRXVvtSF8C
 WQ0sbgSeVsbhLpcVUTmrBNbkfQ==
X-Google-Smtp-Source: ABdhPJwv+EKaLPSOGc0rfWUuf2oiacJ4qu5X7h76pUpUHC7qQt9JOgsFMyg0jZhQHKdCqZZEWGu88A==
X-Received: by 2002:a17:903:2281:b029:10f:89f:1860 with SMTP id
 b1-20020a1709032281b029010f089f1860mr10386862plh.55.1622926629615; 
 Sat, 05 Jun 2021 13:57:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o20sm7819919pjq.4.2021.06.05.13.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 13:57:09 -0700 (PDT)
Subject: Re: [PATCH v16 78/99] target/arm: cpu-exceptions,
 cpu-exceptions-aa64: new modules
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-79-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <787a3dff-1cc2-51f2-ce13-ddf84f6ddb97@linaro.org>
Date: Sat, 5 Jun 2021 13:57:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-79-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> after restricting AArch64-specific code to TARGET_AARCH64 builds,
> we can now extract the exception handling code from cpu-sysemu,
> and split its AArch64-specific part into its own module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu-exceptions-aa64.h |  28 ++
>   target/arm/cpu-exceptions-aa64.c | 276 +++++++++++++
>   target/arm/cpu-exceptions.c      | 445 ++++++++++++++++++++

Oh, splitting stuff out of cpu-sysemu.c is fine, but back to the single binary 
theory, do we gain anything with two files?

> diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
> index 6a1a1fa273..a8e6f28ec6 100644
> --- a/target/arm/cpu-user.c
> +++ b/target/arm/cpu-user.c
> @@ -12,6 +12,7 @@
>   #include "qapi/qapi-commands-machine-target.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> +#include "cpu-exceptions-aa64.h"

Please point to what requires this include.


r~

