Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC274439D9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:37:29 +0100 (CET)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3LM-0007PV-OE
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi3Je-0005lM-PZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:35:42 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:36490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi3Ja-0002cO-E0
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:35:42 -0400
Received: by mail-qk1-x72d.google.com with SMTP id i9so680119qki.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Nsqcl4l3KHwgFBY506jG5UfVddHyp7gdgvjCb3K1fW4=;
 b=hbd20D76cUNB0oaY5ALdYO52Va7yiIJuorSqGXM5gZBr+ADcZexla+YH3C5Yw9iTko
 CvIL1oO2yFZWSmA8JHrC4bMZqLbfI5K+Og+26vIxk8BrHSmz+I3WKF7YfPRBTk+KJFZP
 ZCgNcgqfbRVT/IEE6dTFxgr9CKlrIpeTRXbyWH50ZH6mIO9hKOVjzdo8pQ7exISMoSM9
 FfELtxYWPDJZfYxCBRcHYMWcbRxsJULH2n59qdIXZ6yVOb6oXmpAGQDvLQC74hioUY9S
 la7ZBUBnnVyFRvR0dsy1oUgX9hmHIFDRHi5frAKVYC/kGnrsqiQdTQkm2zZ4BR9W5UEC
 Xa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nsqcl4l3KHwgFBY506jG5UfVddHyp7gdgvjCb3K1fW4=;
 b=ldQa0pq2/cI9QlUPHIhVp2ZXQdMtrhbNpTd4l2SphYegmYlnOn3YVmtmc/0o/TT5C5
 J/TNmcL4JkUZIq92C1yf21dFBAqDZ5WFu1s+zvpAkp0h/jBMAE9NaJIQCJ3t9bBM1jEJ
 ppFUfokT/1uBDoRgqdDisFKChiQtFckjD0eZhH+JFOBlgZPxrfXzFwGMk2ysH62ESa2H
 NgscVgZq48KH7TkdZrpFKfmotImYz2J6T1C3SToDwjCW/H4YSvA0osFaW6oTVhqBqy8V
 FG1/536G43WXvhnKgeKV9g+ycAtO+2PDXKgZnfWC3zCIyHyfizuyE4lcJF2B3gxQbsr1
 mKRg==
X-Gm-Message-State: AOAM530En+aRvpciidY9jB59oBzkdo/Q63RX1w/p9H3I1E4c5FpuUeAa
 3A1epqJgbA5Jh/GmXqm5CI2YksJtxsD/Tw==
X-Google-Smtp-Source: ABdhPJwAsCc9Dc7YzKyTtB/oFf4oTNG6UXZWtATTbk6dWPFx+3tSiV6p0vzYkf3wiAXGIYzjCxjlgQ==
X-Received: by 2002:a05:620a:298a:: with SMTP id
 r10mr31325705qkp.84.1635896136870; 
 Tue, 02 Nov 2021 16:35:36 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id v3sm321960qkd.20.2021.11.02.16.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 16:35:36 -0700 (PDT)
Subject: Re: [PULL 00/60] accel/tcg patch queue
To: Warner Losh <imp@bsdimp.com>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
 <a155ebce-e2ec-974f-355c-6bca26b22c80@linaro.org>
 <B2EB83EC-D491-4C42-91A4-CA95BF50E63B@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2838fdfb-017d-504b-d98d-aefd50efbf00@linaro.org>
Date: Tue, 2 Nov 2021 19:35:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <B2EB83EC-D491-4C42-91A4-CA95BF50E63B@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 7:27 PM, Warner Losh wrote:
> This breaks bsd-user building. That’s OK, imho, for two reasons: First it only runs ‘hello world’. Second, I’ve updated my patch train which will fix this (message-id 20211019164447.16359-1-imp@bsdimp.com).
> 
> If there’s urgency to this, I can pull patch 1 out and submit it.

Dangit.  I shouldn't have broken the build, even with signals still disabled in bsd-user. 
  I let my guard down because the cirrus bsd build has gone wonky, and the shared machine 
I'm doing other cross-testing on has got some temporary resource conflict.

Let's fix the build asap.


r~

