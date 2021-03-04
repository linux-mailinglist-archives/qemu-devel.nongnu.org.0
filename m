Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B508532DA1F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:14:05 +0100 (CET)
Received: from localhost ([::1]:45068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtQC-0005Tv-71
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtNc-0004Y2-Pk
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:11:25 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHtNa-0002P5-LP
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:11:24 -0500
Received: by mail-pj1-x102a.google.com with SMTP id kx1so1384348pjb.3
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xGwbO8W7Jb5U6Q/IsPx2xFYM7RKCivcfmD4FQ3b7Kbo=;
 b=jLfXGOUgmqV0yP2JydQGmGhB+NgVE+cnDD0pmH4ziuWASCfCaG9vYVn/gCm7di49jy
 xumArdfqmJoE1KOoHgQ52hSg2N+imDq4cL1+9iwVfuOMKBbsM15KomiTUPFKyr3k4fTN
 3RUQqiDyNeIXU2HESL5KCamSqPFRKp5hZx4B2xf6OVCgxNByvhswbrmkeVr7pJUNn/9S
 ReMVj+k+aFbSkp9ufR9YQXVcWZqnWj8Wn4oYKVWVAgmzgy4jsoZMoI5/forBI//dMPb5
 n0VX2iZY7Gv0fgDg0h4ZfxM2XrUXtG41k+E10IZxQOSInOPI/+3MhX9OeoH6V9Sthvvf
 sbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xGwbO8W7Jb5U6Q/IsPx2xFYM7RKCivcfmD4FQ3b7Kbo=;
 b=ForiCh6ZqwGbvtY1Df/4qW4WXeWLwIM6bXSqM7HtjwY/UAWlqqd1HNe7x2EtrmJcrA
 uDGKauzveDDUMIUQI46PZ5UZgG33rsis9mQHcU8IYrWry9POPfwE/0JySrV6IHUBJsOk
 4chgd5y9pq+iAe4lL4Bsb1ikiKX9NNK3aS7+8AyPHcJJXRisrVT54NHGhMl+mbKZtCL1
 4nhkLy+pd7xGi7h5L7azL0y8HmYVCBwg0exIkj5V/r7oEk/4Gothp81aaFHffG89n2bh
 lKlyg8i3VSrouI8yVpTTCJd4KTj9PeiLxpTVQ/zqA/yhzUQktZLpalxXbm0d1WhLYz1S
 CMsA==
X-Gm-Message-State: AOAM533lvJIjDPaOeBBiWCQig9FLm1jGQFNfNM3P7XMgtDLDn+ZiyFxb
 9Qc4xS9xFHTTP+DtCg4Zjp/CfqgUd9dFXQ==
X-Google-Smtp-Source: ABdhPJzDfASHmLhfm/DrBd3ESvNcrNtTqTzBJI0nzGa/tiXFibE4GcfxeqWBWuXWpSDXEOoXVgAEvQ==
X-Received: by 2002:a17:90a:e298:: with SMTP id
 d24mr5961751pjz.171.1614885080934; 
 Thu, 04 Mar 2021 11:11:20 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c22sm149438pfl.169.2021.03.04.11.11.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:11:20 -0800 (PST)
Subject: Re: [PATCH 12/44] hw/timer/sse-timer: Model the SSE Subsystem System
 Timer
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89898e8a-a43c-b2f0-91d3-c3337b960646@linaro.org>
Date: Thu, 4 Mar 2021 11:11:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
> The SSE-300 includes some timers which are a different kind to
> those in the SSE-200. Model them.
> 
> These timers are documented in the SSE-123 Example Subsystem
> Technical Reference Manual:
>   https://developer.arm.com/documentation/101370/latest/
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

