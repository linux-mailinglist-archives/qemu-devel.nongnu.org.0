Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25D698E26
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:56:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSZ7T-0006Vo-VK; Thu, 16 Feb 2023 02:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZ7R-0006QC-4K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:55:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSZ7P-0001he-A9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:55:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a2so957264wrd.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oO/dkV+rqeGXn2xOtXyisdYYi3nTTUUanUGKdwsjLjA=;
 b=Wi7wxB7uF+dS6K4Wae0MSFeVO6zLDOSfnXkjIhJlUAEupQqRzWiAkOQ4VKDncTD/co
 AO7CeXMFHIKNbvwLolx+sBXzD+9DClAojlNyb9LuezC7MYDgRX8dJ9IXtCnmZBcGsgZU
 8AmsGHqh/MT/EKSgJQg1/jPwtcb8hmblz02SWnygNethzkl0hKHBD1bnhz3RT7sZUQX7
 KWiX1L9M7jpKthvds2fwC56nRj7Lx3nPu4aNhveTV/yzDMV1VaywM6H5i69KRGX2q4EP
 yj12xsCdgyVCqLUnVzO+04n/ONP99FySGkjc0xx+Lu6aOS3KHmDjCBiH5IJxj3zSKQKN
 3OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oO/dkV+rqeGXn2xOtXyisdYYi3nTTUUanUGKdwsjLjA=;
 b=2rSCqUQzvbjJI2mCrz9VQ1EHlIasiIBO+rJyCrDQ2WN51ywc9gGbe8M2VaH7dK9LbF
 S19c4A/o/CVdob7QLMgMPYGL6gi2JqdvoUbgA2v4VGTlQ35hWdW91+C6v1C6w9aRXlBg
 FcXJmIS2Mdbum6oqn2+FN2JPM3xfkUV10ZlBi+tYFlJ2r1pY4qMIleB8YVCw9QVhGH/X
 hNRXZcL+jr7DLusdWWm36mlNvSfZpnXynS6W5RcWP8GQJY9CPpyYneCWC07ysNHB6VFY
 VxmMYyPv6ncABj2DIcKAOx/jZe5+kuD4UP1DUOPLdh1SdnjrWlt0ArQyc55RVnZ1lFSn
 d5ww==
X-Gm-Message-State: AO0yUKXgJf2h6grBMzVwstoVG3PdlURHnJSbRlvB5uDFycZrWtMCbF/a
 bKXoST3o3ypu7QI7PU0cgEanrA==
X-Google-Smtp-Source: AK7set9C7pkq9GEYzjAWomED5liZY7FlzoEIsam15pCCaZwynp3nOK0F3c8jJuj9yWrLBiGgb4BfMw==
X-Received: by 2002:a5d:6a06:0:b0:2c5:4ea7:a8e2 with SMTP id
 m6-20020a5d6a06000000b002c54ea7a8e2mr4132530wru.33.1676534149462; 
 Wed, 15 Feb 2023 23:55:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b003e1fee8baacsm4398536wmb.25.2023.02.15.23.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:55:49 -0800 (PST)
Message-ID: <a5a5ec1d-52cb-083f-2b27-60afa9a761e0@linaro.org>
Date: Thu, 16 Feb 2023 08:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 05/15] linux-user/sparc: Tidy window spill/fill traps
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
 <20230216054516.1267305-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216054516.1267305-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 16/2/23 06:45, Richard Henderson wrote:
> Add some macros to localize the hw difference between v9 and pre-v9.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/sparc/cpu_loop.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


