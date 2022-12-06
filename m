Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4AF643DA2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:30:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SOv-0000Al-5Y; Tue, 06 Dec 2022 02:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SOr-00009K-9g
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:29:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SOp-0004g3-6H
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:29:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o7-20020a05600c510700b003cffc0b3374so12041941wms.0
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PJqMeVcanIFW+xlWPUuiE1IB/IJL2ef2DhsF8WUfqEg=;
 b=hdbcYzIvczDo41+N4Y5tv+/KRfvpVWVXlMhlpZr1clqamt2Dir3ajM0bXJEy2ZhiQS
 PnS0iFN6boSGMjBOlhVxuCicI6h1f75yWXkYc43kNMFginpLu6lyR6I5GkoJlNo6Fspw
 LIZuHogAngJULBIbotAxryTOVA0C/6mjmSEmt29ke1C3sOk/RBSb+N1pRw5OPysO4lbr
 YDbgeYKlwl82zCC9UItEo/cD5DpWjGTQ4aY9O/6bmO/LXETpRLb07gV1/dS7LQTkh9DW
 VqBlggcnYsHnOEajQAWb9gySUj8fuvlnwLlhg5WuwG4rOK3DmxvTtlv8RYu68zqLa+rV
 Ly4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PJqMeVcanIFW+xlWPUuiE1IB/IJL2ef2DhsF8WUfqEg=;
 b=R7UZlNv1dlmPon9egJlrj8JrmK5seXFz47LAHOVjPrCqOMuOR+U2MXbxjYssuJEXR1
 VAvoxoJG6uVn8HPTX5O6KSREhug2km+vo+aJxfbewlk4hhC1kxasxU0v49luIpxFH6Wf
 /xqAtLYVVIWHi9+Z3R9y0YUptwS/WvDTJ1NQpQE6jeCSfekebc7K8eU92EEt5mpNXpw0
 9HlCZjUGThIX7rz7RmEND58MHeTBfeG+UKqSM+SvyhCT+7uBcid9C70keC+1ZPRBaLhF
 FaGE3d6jgNDtiYbxjdtUvvpNSPa8HFetn03qhONNw2PwBUVJEFx13DITPJjzgcr/rcH1
 kRLg==
X-Gm-Message-State: ANoB5pk08J2OWqV8kT+tYmlx65KAbFHY5bRagI+/Xa12zPdJUJ0cqz9c
 SLWIhAA8spqFafldJ+MTTiKHgg==
X-Google-Smtp-Source: AA0mqf4OJ+mLaaKYZhxTi7lxOolkZukg2AU7GkXaNFOYnNZ9vY88kHbLcy77egKmzX6oFBkd2CJ3yw==
X-Received: by 2002:a05:600c:654e:b0:3d0:8a5e:e8d1 with SMTP id
 dn14-20020a05600c654e00b003d08a5ee8d1mr11362595wmb.82.1670311793244; 
 Mon, 05 Dec 2022 23:29:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c2cc900b003cf9bf5208esm23680233wmc.19.2022.12.05.23.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:29:52 -0800 (PST)
Message-ID: <4bb4ac6b-fbfe-a32b-5876-db7394d3de79@linaro.org>
Date: Tue, 6 Dec 2022 08:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 07/22] tcg: Introduce get_jmp_target_addr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 05:17, Richard Henderson wrote:
> Similar to the existing set_jmp_reset_offset.  Include the
> rw->rx address space coversion done by arm and s390x, and

Typo "conversion".

> forgotten by mips and riscv.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                  | 9 +++++++++
>   tcg/arm/tcg-target.c.inc   | 2 +-
>   tcg/mips/tcg-target.c.inc  | 2 +-
>   tcg/riscv/tcg-target.c.inc | 2 +-
>   tcg/s390x/tcg-target.c.inc | 2 +-
>   tcg/tci/tcg-target.c.inc   | 2 +-
>   6 files changed, 14 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


