Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F032DB37
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:31:56 +0100 (CET)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHudX-0005MS-AL
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuUm-0005w0-3T; Thu, 04 Mar 2021 15:22:52 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuUk-00080j-4U; Thu, 04 Mar 2021 15:22:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id k66so10928500wmf.1;
 Thu, 04 Mar 2021 12:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QLLUoZUDXAVz+xqcLApBhYjtsuVSgvIE9lsUXIfKtWM=;
 b=OJNAVsrYu81xM/eFu+er1GGHhjoSoYIPrEaRYNwds1Is1SpBUjPS5VBxGBJDO/YMTk
 vhIP9czvVUXkQpjB91mg3Wk+IqlTppEfE9QfJlyunWauqL1e+5WAAA5eKpAYvvDf9E/P
 g4Qj9Z207k1qmFubwJ6+0bT9hk78zMw0MJhLhuaDN+n/vSe+AZRJUpfTJ/ZUun35Kk84
 1EpY2D1+yD9WLx/Gm8ipdXKNHnYqCusWipqBo7J2CmBHj2izNPJMSBKh+8SqLDXMI5gS
 WxFrY95rMWWt+01g8GePP55nHvU18UKmQ8C5+lsWm0jpOEtOIWo+5c0jKVAIOsuZGXaP
 5cmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QLLUoZUDXAVz+xqcLApBhYjtsuVSgvIE9lsUXIfKtWM=;
 b=LYQc/ZcFY5TIS1dD/M8CgHrg6X4dru+nt38V9Qih4UpK85QcSjTFpDWISMxxyl++S9
 0w4aeXsUBGwBT9LUr5kT2DgprNcuV/rJ1V3JwYXzDL8jjMjDs/HEdRC1Yd1Ws+IF0kvZ
 HULK+sJ3oLlDgV/+DtaqRdmwDB0PyTx0qNUmji701kv00hMb0i9Et15mzFujoSQMVJBj
 SwnhAPcNeR/ys8E0DPHMBl2pFosv3kHRn9LsKBZ/gY+VfXXCnC/okRbbXH1S/Cgpdf+9
 cUrO6++ECznMo1A/3mt8etf+LAqQt2K6jiQ9H4fhYhDwmY+BgPYfS+pacG+Pp9USK8s0
 8pLw==
X-Gm-Message-State: AOAM533WYM1OnxJc4WZt43qes6QOFKAfDx8/dSKJaNZ6hWhPfUQ/3vYi
 e729VJXgpgjycUIX+C4wNzp2kGWFcQs=
X-Google-Smtp-Source: ABdhPJyiyAgSdruSYXGKiCInlw0oaRW4BIqLCcmQ1qCzB0foo3qiKWHcXBK5z7CoRloCN13U9iq/Cw==
X-Received: by 2002:a1c:a916:: with SMTP id s22mr5735355wme.82.1614889367574; 
 Thu, 04 Mar 2021 12:22:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m3sm768349wmc.48.2021.03.04.12.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:22:47 -0800 (PST)
Subject: Re: [PATCH 33/44] hw/arm/armsse: Add support for TYPE_SSE_TIMER in
 ARMSSEDeviceInfo
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-34-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <70537fcc-1d8b-eacc-890b-e010fb80ab86@amsat.org>
Date: Thu, 4 Mar 2021 21:22:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-34-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:46 PM, Peter Maydell wrote:
> The SSE-300 has four timers of type TYPE_SSE_TIMER; add support in
> the code for having these in an ARMSSEDeviceInfo array.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  2 ++
>  hw/arm/armsse.c         | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

