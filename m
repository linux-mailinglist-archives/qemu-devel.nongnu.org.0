Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C330B3DDFDD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:11:26 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdLH-0007UZ-QX
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdK5-0006Kw-2x
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:10:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAdK2-0004Bg-JZ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 15:10:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so1456253pjd.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OAu2jo/jhJxGEJlkv0S1bxwccG88i/pCFs0pL635PGE=;
 b=oWHzm+P9/MOHxRxqBFGMmm8h9wEYIuzFAtVbDBToqcjoCurWG4coo2DtA7/qrGw5Po
 Yc6bA7ROBZNC9fJqzOaXgGCfrjqDJuQO/UqmmiVVjKEP6yzAT8AOlt8x1SmS2K5ULlF6
 QvfmaeJdZ99y2jSDEseymio+DopP8FxH6WASUaNUSEVhseUC4gCUEuVqndbDByNIBMvT
 1Bg76devk3+08X1tFfYV2v6XA4xP9BjTJVZKOnZo2C6mODVkuoLkIeOOqHmhOiCfC9ez
 ROtZUl4FUAJ5YU7RLQhOQcuJsVkl1WKaj/xFhdKiHYTi3i0eMy+hvJmt8IA6/sXG0h+n
 Zvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OAu2jo/jhJxGEJlkv0S1bxwccG88i/pCFs0pL635PGE=;
 b=b23cRK6CH8kVds/UzWc88J0XCzoHxjm3eR7S+OosdAiKOjk1wGDKrLPKU3cSqbUXBR
 ja9HK81PXcipygb+aCjVjdP1NC3EVX/5O/57dpAZLIqs791SR62u2BicXnEWd1etAxcd
 tpzdVKREKmiUXaOYig+eaYhuxE4ZZ78S9+MF7RtKsQ9OLBzut7EOAX9a/cNw1iDx/SIE
 AbYe5f6FHdhSZd4RG9gSh79tczt2f2ATBcgRc6QJBK4ihChWG0sy5DoYakNuJGI43NcK
 kjMda3ZkqQAVxiQ4jS1/18EfkJVzV5mTGqBcoQCgjExM8Jy/H4hhYjcUtKKFvnezQzPm
 DguQ==
X-Gm-Message-State: AOAM530hZ4maNoZYdklTKRlQzUywh7hZ9Ibm72Aek09FPyRHv601tLtH
 3MvujGQWZaXHDEsJecrx3d/a6A==
X-Google-Smtp-Source: ABdhPJwTWutUxq6YAoLVUqtL2ApoB6AVtlBn6I8z9BV8Nka9LAFhXVffbnioo+lJ50s/84uTMgq2Wg==
X-Received: by 2002:aa7:98c2:0:b029:3c2:fd63:2759 with SMTP id
 e2-20020aa798c20000b02903c2fd632759mr2031394pfm.58.1627931397027; 
 Mon, 02 Aug 2021 12:09:57 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id i18sm14073266pgb.83.2021.08.02.12.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:09:56 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 3/4] target/mips: Merge 32-bit/64-bit release6
 decodetree definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210801234202.3167676-1-f4bug@amsat.org>
 <20210801234202.3167676-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9ab10017-4576-21c0-c1fb-a3f0ff1ea26b@linaro.org>
Date: Mon, 2 Aug 2021 09:09:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801234202.3167676-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/1/21 1:42 PM, Philippe Mathieu-Daudé wrote:
> We don't need to maintain 2 sets of decodetree definitions.
> Merge them into a single file.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/mips64r6.decode               | 27 -------------------
>   .../mips/tcg/{mips32r6.decode => rel6.decode} | 13 +++++++++
>   target/mips/tcg/rel6_translate.c              | 16 ++++-------
>   target/mips/tcg/meson.build                   |  3 +--
>   4 files changed, 19 insertions(+), 40 deletions(-)
>   delete mode 100644 target/mips/tcg/mips64r6.decode
>   rename target/mips/tcg/{mips32r6.decode => rel6.decode} (69%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

