Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719973D4F74
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 20:21:34 +0200 (CEST)
Received: from localhost ([::1]:38450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7ikn-0001pj-H9
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 14:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7iiM-0007NC-D8
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:19:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7iiK-0004Kv-UB
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:19:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so629801pjb.3
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 11:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fcGxg3u7OME4V3UwAAbRoowicgb3xl9Tm+EGtnBySVI=;
 b=c2Jca7WdEcyQQWuI5SmhyQq/DNXBIqXzKhp5TMcP+IlOaSVYFCgtfpIeE/w6/cgz/p
 11IxRVmbYSKRwjy2B4ACOpb3hEkl/gPRfT6OkqnerTMyrYFju1/dD43ly5D8zAcmrVdm
 8H0ky4X0Advh5lKXNHX55kvYz1KDZu3wmO21UHrjxsn0x4d+BA5hn7RX21NB1UeNfgzq
 hSMGfA/2VI/VWIDX/FHrIS22+8zdN2bhl/SiSNZy3Bg40USiy33Iuah+9kLRL6LlBjdY
 K3TdINWXziX/hQz1BUq8Y9rQ7rB/fFlUMRy2wO53jfgydMNZExeMvKuNh506zfZIClHk
 bgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fcGxg3u7OME4V3UwAAbRoowicgb3xl9Tm+EGtnBySVI=;
 b=H68kwGG3sF2AOFJfafbgoxK8ipK6Oc2Jycm/HwkXBeAIhq2hNVsbDdWXW6PSDQIMAz
 mqkWGq6Dpgje6m7PlhFjnbSXDFJpGkJqvoVqkVg/J7pS1XGMUFtS2dSnLUsX/jN7pmm2
 GCKMi9w3kljlxXwhOVNCg6PuVe1dKvAWFxjGSh7GOk0sGEtEXnCX0tPkhdTuKhyNvfUc
 ujK3HFKo4RjLykwmKEzpXDBv+4PIp9D5mn4C+G//Cxa555nBxx+FJDrV3mJA5OiUXR0b
 hyzcni0PpiKugNuD6ud/QKAXYthGspMHfpFmSKXPZB3Nh5nLYNFZEb2SwcD8zSATp0PG
 5kjw==
X-Gm-Message-State: AOAM531y+l5Lt0QqqsIHAqJEbRGVXmWZ1mxGaXQjXLr7LCPArcr2JEiy
 Iy6g8UBolhuDpuRQO0bIjhQe3vpRm2NoJg==
X-Google-Smtp-Source: ABdhPJwa3FZAgD1l2Y18OFrQMuUdFjZmmLHAc+iUpu4GTPo2ZXEhwoQ+/MeInVx9RsS5xDKjfwn+4Q==
X-Received: by 2002:a63:5802:: with SMTP id m2mr14500926pgb.171.1627237139667; 
 Sun, 25 Jul 2021 11:18:59 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k8sm30665163pfu.116.2021.07.25.11.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:18:59 -0700 (PDT)
Subject: Re: [PATCH for-6.1 5/6] hw/intc/armv7m_nvic: Correct size of
 ICSR.VECTPENDING
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9c84a86f-0e28-de6f-f770-65a0586b4738@linaro.org>
Date: Sun, 25 Jul 2021 08:18:56 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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

On 7/23/21 6:21 AM, Peter Maydell wrote:
> The VECTPENDING field in the ICSR is 9 bits wide, in bits [20:12] of
> the register.  We were incorrectly masking it to 8 bits, so it would
> report the wrong value if the pending exception was greater than 256.
> Fix the bug.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

