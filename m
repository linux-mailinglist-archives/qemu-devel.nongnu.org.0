Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB143E4F9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:22:11 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7EI-0003GW-L7
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg78B-000471-5e
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:15:52 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg789-0000gE-M9
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:15:50 -0400
Received: by mail-pf1-x42c.google.com with SMTP id v193so6277733pfc.4
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zwRST2ZRmnANfCTLGADUg0tH4Oio4ixVsqvhuocNFCk=;
 b=QZe8HJ45u+XwutC8HAzmPzVFYSP+KchPvNjhhVtkeVLdoiBUQTvg+P3K7llWC6srBB
 LxLZxOJjCPY0A1Zlw+WQTntinkG75zAmEM6qiBUHMoh2D8XIB/GqvXyWagRgC1m7cGyY
 HuWIWJeAMnUkFzpdtcKcMl5PBs0+l1bj/0w1FzRw8TijgmtgsEWc5KLM8fVXhwyvtMZv
 6BTgXywLa8aSRQ9E3a9nPHJTHGmrFw3fO60S5ic9TXEiWNKlRI1kOKuREQQJ9CFyF2fz
 YzXTcz1Ar80C4rbafPZReoOskjULpKfa9HNJByEnJxQpp0kSjoE0F/6cHnLU7tPaaI0i
 zmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zwRST2ZRmnANfCTLGADUg0tH4Oio4ixVsqvhuocNFCk=;
 b=evmMgQAWtUSRYuTjeFOar06xzPBxotQpvRvOmfCNbpQWZtNNxxy0t3rM4BIp5ymUTN
 tr79cvb8+CZuB6f+yateVBNiCUlYtiLB/OSUMEe+CjOHQFjEC8jfdS41tHyg4/xDafaH
 SoMeBvlm9PWzSMDtqsvaRQfb5uV9PjlHtHQ4coAuFq3hEh+V/hYp1gT+uvjz1pg6npmt
 gMH/N9ZNbg1YBUxfI165FVL6B+a45L7BVSEmmUZN6Q7RcLMAjF40yaRD1AoFPTWae7ql
 duqih0pz3NqMOCANycjrCAl0GY5yh/W5kNKd1wnu0fsBWsii1v+28hkoZMRV7MEQSmGb
 Bsow==
X-Gm-Message-State: AOAM530Gj7iXFIXWi/9azoYuSkZGD05nTkjxM1GwJZSoSiej12IAH0r0
 xDW+iTM36cHJhpc13MUzurWluA==
X-Google-Smtp-Source: ABdhPJw4UwyhyEVF5cpnVFI476BMrPfwFfpYpprcovUzdPR9u9TkVIO/PM1hrXZotz6uHd9yoWZ9eA==
X-Received: by 2002:a63:cd0a:: with SMTP id i10mr2983772pgg.429.1635434147331; 
 Thu, 28 Oct 2021 08:15:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id me3sm8732616pjb.3.2021.10.28.08.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 08:15:46 -0700 (PDT)
Subject: Re: [PATCH 06/24] bsd-user/arm/target_arch_cpu.h: Dummy
 target_cpu_loop implementation
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f97a53c1-af35-2ef3-a442-0003b0df81d5@linaro.org>
Date: Thu, 28 Oct 2021 08:15:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019164447.16359-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Sean Bruno <sbruno@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 9:44 AM, Warner Losh wrote:
> Add a boiler plate CPU loop that does nothing except return an error for
> all traps.
> 
> Signed-off-by: Sean Bruno<sbruno@FreeBSD.org>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

