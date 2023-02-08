Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4497068EA75
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:04:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgMp-0006Mb-9f; Wed, 08 Feb 2023 04:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPgMh-0006K3-Fs
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:03:47 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPgMf-00067e-Rl
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:03:43 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so913928wma.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3duNCNOwwNPLmjJo4BvpzifxnDZ43GW8gEZgBGVT/O0=;
 b=AdnLMko32hQSA1IfM3G3GH9hj9ETYU/UYUJSmiJzFy4Jj+NPJ6KvG5KNNMIhmfqrGR
 5bx1pP78hMHAhHY2wz9Yavi0MhAqXlSCwAPiHSh2iRW1fc2SDQZtmee2LKpz4wo3O8OW
 dnjSxGy7yC/S6eGS1JhqVE44sSyiel+8lCgJLg/uRtPwdYHX2wDq+dvuyJbNyFkqYGnL
 mZb/qT2zzwfQPLLupDAYaBNQgSXOvDqOcafZOFG9rLSybZIHo4B6x4qZa+vj1gS41ihI
 fuFMgJjj/Pyb+lod+e3ZrSI5CaJeDIazXfW9jOgjM5UPnOZ91szPYkWmjY73iyzroAUE
 aTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3duNCNOwwNPLmjJo4BvpzifxnDZ43GW8gEZgBGVT/O0=;
 b=yr4UEwbAW3fx6MMC1if41pRjusjfyVImR+cPRvog5keat14qLKUHBY0fV40C5Uit4O
 3cOTcHtSKr9Wn05T25Wm6wobgiuWKaObDKFFYHsZFWSRX/WjmP16KjyxqmE1FyEukZE7
 gN2odgK6r7Bjh9vyzN73MLwqyFjdMnGmgYIAjc33CL6qOxN8a4HAfsBw7Q9F62cBFE5y
 Oor0gihVHUWIw6uuood9ED9iwMLUaXjvLhwl4i5tQvGkKfLum6geB6cx8y64iHBJJ8Tl
 AS03YztB0/rFvlR3lMjybOehgTH2BxkY3Mp+muaj3zRVQ2LA9I02ZuDgtz/5f+y7Zf8H
 Enmw==
X-Gm-Message-State: AO0yUKWaLKaLNpshsev4/msxXnZGvT8iCmibf19HBPTdvKcqS2mr8ZGU
 xgR5Maer8ZlHru8A2E0gIk+MEw==
X-Google-Smtp-Source: AK7set+ZJEsRzS7YI5i3yq1IN4oj34AcGe+R23E4iCljnE3g/DoDw+Ibnw0CS5vcKUaEq4BDGBweKg==
X-Received: by 2002:a05:600c:16c8:b0:3e0:185:e935 with SMTP id
 l8-20020a05600c16c800b003e00185e935mr5752068wmn.36.1675847019499; 
 Wed, 08 Feb 2023 01:03:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c131-20020a1c3589000000b003dc433bb5e1sm1287408wma.9.2023.02.08.01.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 01:03:38 -0800 (PST)
Message-ID: <0b9c1ec2-88f6-414b-43e7-fc458fa048c0@linaro.org>
Date: Wed, 8 Feb 2023 10:03:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] tests/docker: Use binaries for debian-tricore-cross
Content-Language: en-US
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
References: <20230208084859.1195555-1-kbastian@mail.uni-paderborn.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208084859.1195555-1-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 8/2/23 09:48, Bastian Koppelmann wrote:
> since binutils is pretty old, it fails our CI repeatedly during the
> compilation of tricore-binutils. We created a precompiled version using
> the debian docker image and download it instead of building it ourself.
> 
> We also updated the package to include a newer version of binutils, gcc,
> and newlib. The default TriCore ISA version used by tricore-as changed
> from the old version, so we have to specify it now. If we don't
> 'test_fadd' fails with 'unknown opcode'.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
> v1 -> v2:
>      - Reverted package removal
>      - Use updated tricore toolchain that contains gcc and newlib as well
>      - updated LD/AS flags in tests/tcg/tricore, as the new binutils would fail
>        tests.
> 
>   tests/docker/dockerfiles/debian-tricore-cross.docker | 10 +++-------
>   tests/tcg/tricore/Makefile.softmmu-target            |  4 ++--
>   2 files changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


