Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8232D8AC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:37:25 +0100 (CET)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrue-0007xk-Me
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrsx-00077M-Fd
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:35:39 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrsv-0001Yw-Sz
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:35:39 -0500
Received: by mail-pg1-x536.google.com with SMTP id a23so9536174pga.8
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Odd3Twk1/OSSMurMclfYk/doOXPVWkIaQf2I3pNKJFs=;
 b=rSJ1cfKdqdU9cdJ4wNv2lVv+gUqim6uT3gA2upmADH+fyIe+aYuWyvFrkWEiWkRnJI
 BfuyZOdPeuPTXjcaEpqeENLjJa++ZyCmYUqHH5ZTGWuwlW1tdml2Z9nEnMMykrvf7+Rw
 uQeOvinhl8Y9GywYhotpvD53w+xtbrm+7SoBy7g4063aLkueY87x+5PvMSybnOBBWBP9
 dj4y+3ygXgNenjHJ2ZzK3CO9N/hppEnFHSDSM+WN1CaSwT5eOz5Z1Z5Kytr1FA1kQkGh
 rIgBe6vm+uYbYw37b1caR3N5mcaXEAW+YJMcEgRskD5y+9P6RfIeCJi3hviJEpGY0MSU
 55WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Odd3Twk1/OSSMurMclfYk/doOXPVWkIaQf2I3pNKJFs=;
 b=Cjg8DpMTk1kEOMpm9mMzFbD+w4XQYYe9GVNoqOeYV/+XHEWiUNtkYqdEi0oAUGNk3D
 Nfame6Q3bgIbpZsbLQcfCgTDAf1G3HirsrGfzJrehqs0tlJurUWsvpcuKUSPSmvrKJWI
 L64AHLydlBsnaUyyy3fjnrwR7McY/OF0JrSR3+mMAlqLBuW3MEjfzeqQiWzI6nEAyNKB
 7J7u4nIQr5rW2KGPN/UJ8l4KAqwgk3xXnVdcRgT/lWZpwAnx+KpspwAROP7eVWgudxoZ
 uhkak2aNhWieg0BZymN0iagpE490pBODmAvW8GBCT9k5F7eFPmqm0/hdGSflShvqdvlG
 PcXw==
X-Gm-Message-State: AOAM531n33XLftplWE7PDN4Ehw4I8D43QY1jhk0Ls2Wqj4rVk1iVQhxw
 6i0FoqFk8y+nMQOPTqqmUgt+/spR7zcecQ==
X-Google-Smtp-Source: ABdhPJyf1MpJfrbc0yoptgehdB5KpzhmpjUCTBFNjxVFtq+ban0kFN8ZgFRyzit59ghkRYlpSdhCVA==
X-Received: by 2002:a63:792:: with SMTP id 140mr2861660pgh.200.1614879336416; 
 Thu, 04 Mar 2021 09:35:36 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b26sm49937pfo.1.2021.03.04.09.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:35:35 -0800 (PST)
Subject: Re: [PATCH 08/44] hw/misc/iotkit-sysinfo.c: Implement SSE-300 PID
 register values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a5250d6-a982-486f-074d-0ed39c863042@linaro.org>
Date: Thu, 4 Mar 2021 09:35:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The version of the SYSINFO Register Block in the SSE-300 has
> different CIDR/PIDR register values to the SSE-200; pass in
> the sse-version property and use it to select the correct
> ID register values.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/iotkit-sysinfo.h |  1 +
>   hw/arm/armsse.c                  |  2 ++
>   hw/misc/iotkit-sysinfo.c         | 29 +++++++++++++++++++++++++++--
>   3 files changed, 30 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

