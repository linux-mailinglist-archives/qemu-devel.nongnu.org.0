Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D352ED13ED
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 18:23:05 +0200 (CEST)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIEjw-0001XX-EZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 12:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tY-0001lf-On
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1Fb-0004kC-GG
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:58:52 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:44497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1Fb-0004jM-9q
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:58:51 -0400
Received: by mail-yw1-xc41.google.com with SMTP id m13so222203ywa.11
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 18:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m6ugJ2CZVH3J/yxuQHIew2ym1NF3mlhKzBBNImuLAzM=;
 b=tc/9D3/1Waw7a/DQCYges8gHFq5M9FxWxJJJYz5yyiywasadyMbwzmUyvYWkyxcZGJ
 f5XEcU5vaB11xao3hGp5hLWcBg9sHRsN49YlWKSlVvqXoUu2W9kW4usmnersGr8B/3u+
 aQ8K+xhOADdqqgAp6a6A76mKx/CO7lgw1ULaQe2F+wOiEAn9IvvEcTIymcBafNGzPSdl
 zzyOI9JrvqmZLW2nRst3uaFEEyEVDbB/05uzuMwsiz5A4xiEEsJJB28WoZU9exBRwQKe
 vIpqL7q45U+QNpEXdlMHsJhi0YWC+V8EN+aZDZHEdsCq5D6FwSTIrTw8rk1lM/ahfLqO
 UrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m6ugJ2CZVH3J/yxuQHIew2ym1NF3mlhKzBBNImuLAzM=;
 b=LBBFlEBrPu/Vf3H1X7eYxluykxu2xFnMGYMZp5rxyIC8GtfWdlIlYyjLyImII/q1sc
 QtU0gTml7zumhCzj4olmIuZ3vkdy2ULSB7sEaTQ3RHrL5LWe7mG5zk/Nex0GGOWc/8US
 ms4vssX3TWGLogZvOFCA1nNsOm0SX3cddXf8ZgigkhJKeGC01cEng5leTqUbDe4Q+vqf
 PcHVvmspv2fCs2xbuAOYUw8CXnGX71sbpTpxGpyGvdLp9WcKzwNAiK5wXT4FBt3Pt+Ef
 FmQehSWt3Dt6bhW5Wq93k0XNFqym737eDdL2RT+59aTGVngas5togFXZIMrmKXNXXcVN
 4RGw==
X-Gm-Message-State: APjAAAWjz2Ej8cbgwXGCByBLUHGzkQLt7l5Urv4YF6w3QCilj5+rhyjn
 +CI1Zy/hRIVj+EbyLE1d/O9R94X/Afw=
X-Google-Smtp-Source: APXvYqxxhfPUj9cKWLHabQBYrh3F7+dPPA7eHhjKZraqNXWbzkMcJ0WSNanZJgx5R8Tbo7M98ZiabQ==
X-Received: by 2002:a81:a9c1:: with SMTP id g184mr1045929ywh.320.1570586330754; 
 Tue, 08 Oct 2019 18:58:50 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id x188sm231682ywb.94.2019.10.08.18.58.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:58:50 -0700 (PDT)
Subject: Re: [PATCH v2 11/21] hw/timer/exynos4210_mct.c: Switch GFRC to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6095be3c-921d-e6a7-16f8-78c652726a4c@linaro.org>
Date: Tue, 8 Oct 2019 21:58:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/19 1:17 PM, Peter Maydell wrote:
> We want to switch the exynos MCT code away from bottom-half based ptimers to
> the new transaction-based ptimer API. The MCT is complicated
> and uses multiple different ptimers, so it's clearer to switch
> it a piece at a time. Here we change over only the GFRC.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_mct.c | 48 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

