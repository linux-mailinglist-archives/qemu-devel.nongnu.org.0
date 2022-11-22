Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF263400F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:22:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxV5Z-0007WR-Fu; Tue, 22 Nov 2022 10:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV5W-0007UO-PR
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:21:30 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV5V-0004x4-46
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:21:30 -0500
Received: by mail-wr1-x436.google.com with SMTP id v1so25179294wrt.11
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VWN9S4AZ6AoXdk/bla+uGhm09AMa8jSmGkunFeawxsw=;
 b=x4yI7LSZ9hOguu5qdU3vHL2uu/r5tTK/YI/XbB4qLYWk/rA6ubEhho1/IUVWGWJAVt
 xrjENQ2MEwzvW2R7dENFxbnSH3M5GI3V9N0NHUMqhV1+9rlt+y7uoc6Z7SOql52umiK+
 RN2XrWGT8MMFp/IMFYaV0fAOVMyVMCC0TBdX8kg3NWQXNSTN5+oR2fTV4+shHnP+qKwz
 Z1h501OqozJVY2hF60hMC4NOhytIMdprxNx5MF4VhjA7N08D4RAqoPrH5afEVwt07WfR
 KRwxTyLDpkU732NrdwEWMMxerCTrkKatpL8S7j9GG9hGxLChf8Ofp9tBNKVU+fvcP5F/
 NJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VWN9S4AZ6AoXdk/bla+uGhm09AMa8jSmGkunFeawxsw=;
 b=GzTWxrpiJEUyc8ZTmMeRsQzlI56Yqgw/cCsEDUsSDZNFjzxkGBVpt1KD1H/uMfyzq3
 leO5g8TjAw7JJPMIPPmt2FzsQc46ii5KH7RJ14I5K2xqaJA3NlcrEhVsQ4BIdZDTtDCF
 tng7PO45T8QGqU18DIBsUkvytnBI20Xv9be70hghxrwszCRciayLoeGeYu+JwBtBa6p2
 9gY7jDC8Z8//l/uaqJQNhpXqqwSLxVbRUCXWGiJM4/iUHTIspmMCEzp1uX0E5wNwbdF5
 nHvXI5RPhzfJiJfqWZiw509YrWVQCOb18fC1HbZLrHhoKwW0yPcH3Sk9ICfSywfX7mkD
 09Mg==
X-Gm-Message-State: ANoB5pn6+0NekSIiBd8+5vsuRnFoPoje3L61SmdavTGb6t/hUdXqJEcy
 uXChJfXHBbg32RV8Thhudr+wNZjVDhoI+Q==
X-Google-Smtp-Source: AA0mqf5PWaXab6WyYfAyeRRA3EeEo4NpdjWwDPO5vmFI+n6dvBMtRGlDS3OdDduA8VlAhbAu8+nbrw==
X-Received: by 2002:adf:d842:0:b0:236:b24b:aaf9 with SMTP id
 k2-20020adfd842000000b00236b24baaf9mr14464060wrl.394.1669130487207; 
 Tue, 22 Nov 2022 07:21:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b0022e66749437sm14339090wru.93.2022.11.22.07.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:21:26 -0800 (PST)
Message-ID: <78522569-66e9-2ab6-09fd-80b971ca426b@linaro.org>
Date: Tue, 22 Nov 2022 16:21:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 20/45] accel/tcg/plugin: Avoid duplicate copy
 in copy_call
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111074101.2069454-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 11/11/22 08:40, Richard Henderson wrote:
> We copied all of the arguments in copy_op_nocheck.
> We only need to replace the one argument that we change.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


