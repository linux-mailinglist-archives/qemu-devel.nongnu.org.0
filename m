Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C614A7E22
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:59:40 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFSLS-0006sC-Op
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:59:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFSKB-0005zJ-UD
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:58:19 -0500
Received: from [2607:f8b0:4864:20::1030] (port=40566
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFSKA-0001d6-05
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:58:19 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so8686418pjt.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 18:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OwMiNcFpEV9TQ18cpTwtoblYfWItwdN8HP6ecwJ3UBY=;
 b=PXHAOfN1bYQBdBKpPx16vywgyPQxyum4QCSmXGIIl8XaRFoqcSoJxAWZyMdc2WhGPX
 vfaT+36xeb1sW8/oEZFQyhtHHhH9IpXKzcGKx7fy/V/DKdtUKW+SSM67kwpteHLCPpQI
 lpZcCJasJ3LNGc97xjRcFHsTCUzvgabXO3SuoOounJpdUlLSsk1Wq290103iaBBghjn1
 QRMSAdRjvaCyOwyobQMx4jbpckES4vhZTeqMHwMXTCrz0Q0xg5a1WGHQBNJ/u49FI73G
 zCx3WHx1luTgrc2ysiI7MH7/NL2we1qlt20obsv87/ivUa4vzQID0IXifhKbHubkVm/a
 x9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OwMiNcFpEV9TQ18cpTwtoblYfWItwdN8HP6ecwJ3UBY=;
 b=OGVJmYIfjWBem+o456083Ry0Se7Leko3pZ0zwrhpHhXai7hwKALdCCX/Ga0gtfL6Af
 Q7wAuwPhzMUM8YG+Alxp1mlhwrXNffRIJ4YksBZy8XhGbxcpt/HI7vCoYO3VudFp3hz3
 VzZRszWbdx3uq/q34JBIou2ULMNFACV+jJIWgGjUBwglds91Z6OdNuLWV9WagaQ0oOc5
 KaaEeMyB4s9zCl9Km7iP0LR/nzxY85+FNKsRQ3pu7mRARdZRThABuknvprfHaWJQPBMX
 2vXIOd80D99yypS2TitiFl37gvWYTTSvyT30xHoZgx5vxgSXPdbIVdb0TOAyfuVyZg7a
 mTvg==
X-Gm-Message-State: AOAM530w/8kWVVIc3Wa/Qkt0cF3BpWGKWQgkeIQ+LHbJ53RQ/nqHAIHX
 aMEfR4MJv6iq+TLiwI3kp3fpvQ==
X-Google-Smtp-Source: ABdhPJwm/rLJsgReeusNU8lvOtCtpGbCXhiOVKkZ0xEWHpxFZwP51/Hu9KqNalk1K7rcUEm+TF16+A==
X-Received: by 2002:a17:90a:df0e:: with SMTP id
 gp14mr11596392pjb.57.1643857096540; 
 Wed, 02 Feb 2022 18:58:16 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id na5sm8872752pjb.23.2022.02.02.18.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 18:58:16 -0800 (PST)
Message-ID: <36c9ebd7-69d9-f64d-4612-b519c1c40204@linaro.org>
Date: Thu, 3 Feb 2022 13:58:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/13] hw/intc/arm_gicv3_its: Keep CTEs as a struct, not a
 raw uint64_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-5-peter.maydell@linaro.org>
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

On 2/2/22 06:31, Peter Maydell wrote:
> In the ITS, a CTE is an entry in the collection table, which contains
> multiple fields. Currently the function get_cte() which reads one
> entry from the device table returns a success/failure boolean and
> passes back the raw 64-bit integer CTE value via a pointer argument.
> We then extract fields from the CTE as we need them.
> 
> Create a real C struct with the same fields as the CTE, and
> populate it in get_cte(), so that that function and update_cte()
> are the only ones which need to care about the in-guest-memory
> format of the CTE.
> 
> This brings get_cte()'s API into line with get_dte().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 96 ++++++++++++++++++++++-------------------
>   1 file changed, 52 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

