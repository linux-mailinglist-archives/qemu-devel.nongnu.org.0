Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B995869F1FB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:40:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUlbc-00081w-4Z; Wed, 22 Feb 2023 04:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlbX-00081O-SC
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:40:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUlbW-0006mF-Af
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:40:03 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bt28so403220wrb.8
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GafCA2BVZGZyDc8jMSxRCynXmGgPbwedSbXCngEo7qM=;
 b=sCdM19Iu7p39yTCgSTEbg1T3pHfyvo5ePS91G4hGCW72W9JUdRxQaBe13ChHRNM76I
 PxtLzTLzJBIMQMRgeGBlFLSkgeJocF5BCHXloNtDvhwVzw2IzyUs2TlrZTIv2x/kG5NZ
 ehH0oiCrD03vaw9LVZvS0eZTtKtqzyN7TzG8rklOzJgrJQnCwFOClKalR/ecCev54a+U
 J66eoSspRMxRez2GpWyI0KR21i6DpYOSco9QlG6g3KifGE0tl81KphSoAZOlI2UZ5FW6
 nZ3SVBH6NUphX/6yn38XeHztpMMau+IkHfHsAXv3+WPwLpu2y0L1OO4uLom93dxrWWY1
 /2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GafCA2BVZGZyDc8jMSxRCynXmGgPbwedSbXCngEo7qM=;
 b=Q+yzCrwWXH9zdClqckVJGv0G7XpSE7iY9cFXioQdAsJQvPeZJk7mxS4ch0RnCN9Hv0
 U3TPd/gbdigZ3D4vNl45dArAEwIqF3Ijvblaob8/zBdxMyGFrSv+AmOzOZyRQQ0NwyIO
 pdBx8soaPFfJknGCEgiPOIgbovtnzJ86S8F5Ss2GCBhVYrxQorKgheUFV5V4MB62sHnv
 /FoLDmaatPpFdWyEO2deLoYP+YADaPkfY4ycKVfOLjTlUMICNOJ6Wh41ssTS1CbPudRg
 vfOQ64iK/h7hR/4bS6bq0YI1mDG2Da4HRM+xr8n9nmb6m6vc3bIUrQz44OWT78zYa07I
 CCHg==
X-Gm-Message-State: AO0yUKX7AzyxHxMa0e9UHqNerJ8zkQgYa0ZE7L8xypbJfheDy/2lN+gy
 tH/zfKIWmrckfvgYNC/85OSRuw==
X-Google-Smtp-Source: AK7set8mTYsN43CRNuUp08OPUZCWTo5+XdnqN4lllEj3kLPDJb+KnuXsJ8IQ9wDMel6QwhurIk+4PA==
X-Received: by 2002:a5d:67c8:0:b0:2c6:75be:f2d7 with SMTP id
 n8-20020a5d67c8000000b002c675bef2d7mr5470833wrw.51.1677058800656; 
 Wed, 22 Feb 2023 01:40:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d6802000000b002c55efa9cbesm6962912wru.39.2023.02.22.01.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:40:00 -0800 (PST)
Message-ID: <f0fdd2ad-6a12-318e-59e5-97893668427b@linaro.org>
Date: Wed, 22 Feb 2023 10:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 03/25] target/arm: Diagnose incorrect usage of
 arm_is_secure subroutines
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/2/23 03:33, Richard Henderson wrote:
> In several places we use arm_is_secure_below_el3 and
> arm_is_el3_or_mon separately from arm_is_secure.
> These functions make no sense for m-profile, and
> would indicate prior incorrect feature testing.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


