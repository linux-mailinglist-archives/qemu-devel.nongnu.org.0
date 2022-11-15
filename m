Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF4629B8D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:08:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwbq-0005H6-3K; Tue, 15 Nov 2022 09:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouwbU-00058t-St
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:07:58 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouwbT-00026q-4K
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:07:56 -0500
Received: by mail-ej1-x631.google.com with SMTP id ud5so36329874ejc.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sJnLV3FvNumSx4N5K4rsKrGuRHQJWalwl0PilSi6WTY=;
 b=BojG+kqmZcPKjlW0pRI7se/J9vJveiUsOHUMFBnye3yaY6ZZHjMEhU0T4XjJxr9ztZ
 LadWH+hOig8vDQ8IpnXJFB1tIBa/qnc6MciDrdMi98F9MJt5pxOEnizlyZHOK0QXDy7w
 tAVPapXGgj2Pz1pySYJqpUX7Un/Wfk1v/prG/RgP7aAI6aoc8OfcO8Q32qiNovs8Xm9t
 UfrQ1W+2JVQj2VlI9I4FaFk00KNrk1byYcdJCWzrlaGlExlc6JCBX8YqhEZfKd9F+LIq
 npGVgEHAzZuRM8PJEFxl3/QBNVqJLMvlup5MNQKk/a/4jktMmpQyZbJMnkKq4ERoswHT
 Syjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJnLV3FvNumSx4N5K4rsKrGuRHQJWalwl0PilSi6WTY=;
 b=KeomPuF+BIYYR0+FtBSuBdBBhS98mAVs/AyvAa/c84Qhs0tPO5UP1AAH/ZXS3br7mg
 2KbXITlr292EPHHcqdW1ASTIlUPKfXNFNyvL929I1AVgmeocQlNTHC/SpK/wM5bQ47zx
 a9E2P30jhmE5ZLsaLFs3/wJgcMpKUrxuNfPZgUhY8fibVhyFvs88yw4PzkQ/069xS6Dt
 ikmRmoMNTqCj6fKh5pImz0KZiiyCGT7ZNru9ZUa8uRBMiD2S8Ar0Dcv5EBK0R+fV0DlH
 T17rHKAIIJ7fZIQWcy0j/wdoZo2sxGlXGCFHVn7FtB153oTdG+tfher7pYCEJRU7sJQv
 EI3A==
X-Gm-Message-State: ANoB5pnp6ahkBwokjkw2cHb0pZeWqm7h984I9Qd/TuUxJliJEqoVpr4i
 VyLaiQvDwiyB3ZD5UQ8qX8bmXjKbyeOzIQ==
X-Google-Smtp-Source: AA0mqf6t+Xz50DXBlavFpJRBRZ/feoWT/SIpD+w/Z/n3oJQ1kM3mKck0uhUMVGg4krtGq4gCHpQzCw==
X-Received: by 2002:a17:906:b45:b0:78d:b65a:aabe with SMTP id
 v5-20020a1709060b4500b0078db65aaabemr14258669ejg.5.1668521273725; 
 Tue, 15 Nov 2022 06:07:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a056402516c00b004589da5e5cesm6205071ede.41.2022.11.15.06.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 06:07:53 -0800 (PST)
Message-ID: <d5c53f34-d470-461a-2918-dddf313284f7@linaro.org>
Date: Tue, 15 Nov 2022 15:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/2] hw/intc: clean-up access to GIC multi-byte
 registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20221115134048.2352715-1-alex.bennee@linaro.org>
 <20221115134048.2352715-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221115134048.2352715-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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

On 15/11/22 14:40, Alex Bennée wrote:
> gic_dist_readb was returning a word value which just happened to work
> as a result of the way we OR the data together. Lets fix it so only
> the explicit byte is returned for each part of GICD_TYPER. I've
> changed the return type to uint8_t although the overflow is only
> detected with an explicit -Wconversion.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gic.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


