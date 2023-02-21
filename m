Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D245469DB96
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:00:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNZM-0005EJ-GM; Tue, 21 Feb 2023 03:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNZB-0005DM-6r
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:00:01 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNZ8-00027c-Nc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:59:59 -0500
Received: by mail-wr1-x429.google.com with SMTP id z8so3113552wrm.8
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aancp5GJpNTL5BTLh6p4JsWkR1o6GJuIzTQ9vqpf/NA=;
 b=E/bx1gxEgpd2FkwwEj17y23v2HEZApqugQPk21iRaJWDD/vPKXVKvYFfW5ifw8pocv
 mT0aMIAiAa5F128MufNy18aj8tSA3TSpXAy6vEJOsd5NNONjuK+aqMCe1ZLM47Hobtpn
 K76abZZq2T+YBpIIqQ/6G8N70KnoQhq9vt7bGfCINl/GRRstTLDvi6vZtPa2OcFpsV3O
 MCe+QLq7PIqxyCyoCzC2ILAAnvguUszJbm0AOXtnP9Na0r+oFRosZGeEXPUE9ipp/DP+
 I80k7Se2BwugB1m7c2TSVuddSw2e3eDF6/b/+6HLKQPIGDQyRgeEQttEO1oalP0S0ZH2
 3PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aancp5GJpNTL5BTLh6p4JsWkR1o6GJuIzTQ9vqpf/NA=;
 b=l9fX9x7V2gY9r3zzJhQaTTlbB2WA9Ok61534o3tGYGY4hBf0ZHvzg+IwClf5d7fyTj
 wrOHx8kJKyc+ZUQ440UJ7/1auHNFyvg6YYWn9DVCr7vkq88keGN40vd4MzyR2d9+fHDu
 5MxqHnIS8cgBZKhm4HbastlNgScfXW9F30oMLoW8xRfgFPBCunc7spvfwtJPRVnDhOPO
 0MXBJ+tHZQZ5JYZ7AvUDckGmmjUkjtWjG/Jg/Ba1Avn6uMjO7A6KVG172OvMDPv/Z+QJ
 GBf5Racj8mjWPywg/BpkdWbq8KvTksI0ImlVIXu9tnguYjDp0x2v/d//T5JHQLkCBIrs
 WmtA==
X-Gm-Message-State: AO0yUKXn+gVRd2PFUEzuEnaddtBP99ibQGm3Qmfojoq9ht5jBRi4d09z
 5NMGMJSShs5vi17Ad+t84vM6lg==
X-Google-Smtp-Source: AK7set+CpczOEpE4Zvr3AT5TBkSvZbk6LRJfNxg+Us4OjgzuL6/0NR0fd0SILY2kOe3ccbHQbfKc9A==
X-Received: by 2002:adf:fd92:0:b0:2c7:73c:8ffb with SMTP id
 d18-20020adffd92000000b002c7073c8ffbmr11447wrr.36.1676966397096; 
 Mon, 20 Feb 2023 23:59:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y16-20020a5d4710000000b002c553509db7sm8006112wrq.52.2023.02.20.23.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:59:56 -0800 (PST)
Message-ID: <5b859961-8e41-5c5d-9453-41f174155bc4@linaro.org>
Date: Tue, 21 Feb 2023 08:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] Revert "target/arm: Merge regime_is_secure into
 get_phys_addr"
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230221034122.471707-1-richard.henderson@linaro.org>
 <20230221034122.471707-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221034122.471707-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/2/23 04:41, Richard Henderson wrote:
> This reverts commit 03bea66e7fa3af42976ceafb20512c59abf2e699,
> but restore into ptw.c instead of internals.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


