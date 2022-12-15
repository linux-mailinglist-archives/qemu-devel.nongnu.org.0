Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353264D764
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 08:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ivN-0008Ge-MI; Thu, 15 Dec 2022 02:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5ivK-0008GD-Si
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:44:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5ivJ-0006GS-CZ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 02:44:58 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so1081067wmb.2
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 23:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=46BGxRNovu6O1tUpqy5XKo192iHYYb2yRZn50QvZZ6o=;
 b=FOL9qSxLsyWH6mAMPHR/woj0/8yWjAZcePTVGxUAC7mDwSNbz5o6PYvY/ndC6ZmuKx
 QgHA58bFYCk01XB7wJSKyi43Qu0cdQG0Ea9VXQ625+5JuVIEb60OvCI7tPAzxjsEHb6/
 WY4gh276BIBqd4F+7e04xOejZW859nP4+qRZaQ0c8hnncIuwBTeO/XZXzEt6SpOplJQh
 Lcl0pPHjmtmiCGiQ1EpWgyhVgWDu+OWu8cucINXl93jN6l3x+VSgna+BiWzWRyI0oLlz
 +0qTmgLw7B6edKPK2Psx8ONHnEghc8bAXnFVz03Xc0JOK3UvTHb5RQRNguwWxXdMPMqx
 pWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46BGxRNovu6O1tUpqy5XKo192iHYYb2yRZn50QvZZ6o=;
 b=pIgEI9/DpFIbdVEDTVfrKXbuqQ1dxAp4oTSIQxjM9GElAyF4nCvJZBlnV8ZEyeuIs8
 +Rq/GMi5fSQJlYxuI/m3yIHQ4bhkS8SvAzZf8yInFVef6llX/qDTFzq7tU5PLKdzcqaW
 kzN1U8pstUlJT+YtwmRC71RIZQm84rDkEbMjWebMWbzPEtZXrmcUCzDXHMJe2ogy+/HS
 3WHRdu8rPVDOlhvxpmk2/IeRhKJJNe0Dsy/Ew0gGm+Ihl29/VkVs2ToAKew2dOHEMfLW
 2COzR3KMCWvVVWZWy2Z7ovF8mc1ypCnuINbhJvOOshCDJ9E68y9SAmA/m0fbx1QzCmIr
 8dgA==
X-Gm-Message-State: ANoB5pkqxyokjGUnQEZkb7Uspy5VY1iFa85P4GefQXThGvYL+VEfNMWy
 aLxftJC30e+DdqKMTyvr5wjwmQ==
X-Google-Smtp-Source: AA0mqf5eTcUrDnIbE4+Pom5KZZk+XGJixCgPtWOdxJVAUZmEOMaVYk+L1sqaSKeGk+gUe6ufYZEbFA==
X-Received: by 2002:a05:600c:42cb:b0:3d2:17db:d6e7 with SMTP id
 j11-20020a05600c42cb00b003d217dbd6e7mr14767198wme.20.1671090295906; 
 Wed, 14 Dec 2022 23:44:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003c7087f6c9asm5173497wmq.32.2022.12.14.23.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 23:44:55 -0800 (PST)
Message-ID: <4d127c74-e820-4923-d60c-95f125315e69@linaro.org>
Date: Thu, 15 Dec 2022 08:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/8] target/loongarch: Enable the disassembler for host tcg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221206044051.322543-1-richard.henderson@linaro.org>
 <20221206044051.322543-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206044051.322543-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/12/22 05:40, Richard Henderson wrote:
> Reuse the decodetree based disassembler from
> target/loongarch/ for tcg/loongarch64/.
> 
> The generation of decode-insns.c.inc into ./libcommon.fa.p/ could
> eventually result in conflict, if any other host requires the same
> trick, but this is good enough for now.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas.c                      | 2 ++
>   target/loongarch/meson.build | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


