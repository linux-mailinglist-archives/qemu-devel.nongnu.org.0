Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D5360A4CA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:16:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omw1Q-000872-Rt; Mon, 24 Oct 2022 07:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omw0h-00081S-7w
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:52:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omw0Z-0006tr-C0
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 07:52:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id l32so6414832wms.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sa4TjcSOfYG09omt4EDadCpwUIzFavZpnJ1UBNIkmC0=;
 b=FETtA3BuVoNUsyOAjAhhxlTzSbx0omyl401DaB2gkcKLdor9/p5B6MpjHFcK4Uf1u/
 U7FVGQJ1TdTe59TMEW9aPHPsdLg1vFS2Cfq7DjAaWY+zzOhi/oswWG90rDxpwiNVw/uB
 pCqGyrrazKRzpJDSEWH4mFVrHZNv76f73fI5odtVGDQqamiWfZ4Q299rVWG32PxUcLTR
 qU+CcIt+T6F7KAv26pk1ELPRfTYA0ZeRden7aEX8xQaY1H0r48NLASaSjNN0ggfp3zOi
 NnKorgGpYAeeJKvAgoVWGFxk2s01aqNC74lbhYymFFzIAyVFtRQ/yTOxiKf4WT+Idx4B
 SCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sa4TjcSOfYG09omt4EDadCpwUIzFavZpnJ1UBNIkmC0=;
 b=6/mdvw6wI4iIkUg45eK7UgqT/oIYQi2fexfScUC1VQoLE2y4oJi83/Rhwe7LgGFscA
 voBUosgJg6VJFmFXnSGU+es12bdgLDWstv8XPe1nhm8Xz9B/83HpR2Gstn1Di708NJj4
 5cLDfE/3SPp5OcOrIr3+2fjMl6BATRMs3izMVrNXGZbz0ag/5KuNHU84FlaQaMUtzELH
 OzP5tGrOG8hRwjAzcw3EhAwCQlU7Of2Q+aK6LY0qP9ac5Cb3jqwY67V6uSW0Yp6fE4+R
 SN3QDnhmvoATcn1iL/MFM2YVw7bS7C/AEvVLTGqn/ybwQbOqy8uVMNRIktFwHro2sDd+
 hHLA==
X-Gm-Message-State: ACrzQf23QTCvVAc1ryJUsMQhoymONlBQyKRypDW5ZIfceDYUhPGXw5L/
 cjlqd4gE3HZ1GEEwhMP2Iul1pg==
X-Google-Smtp-Source: AMsMyM6kWE9PfKOieBSakyIPgUgyN2IHvS4yHW+cR4KqkRSwu2Vs/PqWISZGOJhkkZYKVSWL+ciK+g==
X-Received: by 2002:a05:600c:474a:b0:3c6:ff98:624c with SMTP id
 w10-20020a05600c474a00b003c6ff98624cmr21746235wmo.26.1666612360805; 
 Mon, 24 Oct 2022 04:52:40 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 f186-20020a1c38c3000000b003c6d21a19a0sm10402639wma.29.2022.10.24.04.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 04:52:40 -0700 (PDT)
Message-ID: <a023cb61-c020-bee9-123a-d8cd44292a63@linaro.org>
Date: Mon, 24 Oct 2022 13:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v6 09/14] target/arm: Don't shift attrs in
 get_phys_addr_lpae
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024051851.3074715-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 07:18, Richard Henderson wrote:
> Leave the upper and lower attributes in the place they originate
> from in the descriptor.  Shifting them around is confusing, since
> one cannot read the bit numbers out of the manual.  Also, new
> attributes have been added which would alter the shifts.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 31 +++++++++++++++----------------
>   1 file changed, 15 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


