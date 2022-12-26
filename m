Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7908B656279
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 13:15:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9mN7-000185-ER; Mon, 26 Dec 2022 07:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p9mN0-00017g-Ed
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 07:14:19 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p9mMy-0002mf-UZ
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 07:14:18 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso7628505wmb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Dec 2022 04:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qYEpGlbC2AXrVyyqi+8UnwfM9njvxHeQAhdlbADdGNo=;
 b=mxq8q9AZMPi70020RHpyxpi1vIG2Qy6VCCEPw5mg5tSQi+T+qSAED6R5BcIBUs0C9P
 j+5Y7z59YPP/71dnRYdTPPYBxbnY7sIqsbbhBypItEWToIzAH24PyJHEtjYuUtSrQeXZ
 e+SNkFlJl5aPuNvxZ6ujP+/zRb2fMbrK3OKtXetiTSrsFE/EcvtHUsMq8FByDUA7bONe
 Xcm1p0bQK79PuYe4IIXzsPs3SoqG+Yd+1EJ7HeS13hM5ZnDUbZ6XflrPOLRtwMobi8zP
 yJYqGZKVNy9DwE0ntypZcAvJWLfKZduUdBHIPxWpA8VQVYJqSdg8qOGQCjHTmde/K0Es
 94dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qYEpGlbC2AXrVyyqi+8UnwfM9njvxHeQAhdlbADdGNo=;
 b=ssCSz57sLS3ehiH95/C8kLQx6N8yg2mhOq5RJBFoZDE+X+roxe/Fc2s6cV9Ey8IOS+
 vQi4fqZZXNVo1Sqi0Tcwo0+V84Uwk+L/MFAFHlgJp1sem5K2uZdiSdxPkbwMEOrAjZ+e
 7E0FO84o/hhPmRWIg+eYEvOGpAA5uUbv92OtNx+opxMaAL4+vrz5OE7nhMz0B/Vf1pWt
 JQgJKjrzN/0I0ib+piq1izy+GxS+QFeEwtypUKwsXyk1tfrlgLxxIKuBGkJjFJW2q7Hr
 L3HvwhY7xjdZxMikFYArx7OJiItBlIPish+C1HWZMjCnigP99Qp5SJIjzcp5Fq2Kc5yE
 9GJg==
X-Gm-Message-State: AFqh2kojWBTJ5PzltkODUU/rMEC5jkMz2btrYFTuojCMNN3Axykcs3Ke
 0Fhl+XDiSqm1btWXgpX0Z2hO8g==
X-Google-Smtp-Source: AMrXdXvjZL5rhqDCFIQ+aDCafHa1p4qcOhCs4JR4rbkGstD2dWS6OzESedSCYj90+Ubpi/8atZ2/Xw==
X-Received: by 2002:a05:600c:12c6:b0:3cf:6926:2abb with SMTP id
 v6-20020a05600c12c600b003cf69262abbmr13478726wmd.7.1672056853240; 
 Mon, 26 Dec 2022 04:14:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c10-20020a5d414a000000b0024242111a27sm10269911wrq.75.2022.12.26.04.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 04:14:12 -0800 (PST)
Message-ID: <d8960bac-64b2-799e-59f4-6f1a168017d7@linaro.org>
Date: Mon, 26 Dec 2022 13:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 35/43] tcg: Pass number of arguments to tcg_emit_op() /
 tcg_op_insert_*()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20221224235720.842093-1-richard.henderson@linaro.org>
 <20221224235720.842093-36-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221224235720.842093-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 25/12/22 00:57, Richard Henderson wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> In order to have variable size allocated TCGOp, pass the number
> of arguments we use (and would allocate) up to tcg_op_alloc().
> 
> This alters tcg_emit_op(), tcg_op_insert_before() and
> tcg_op_insert_after() prototypes.
> 
> In tcg_op_alloc() ensure the number of arguments is in range.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Message-Id: <20221218211832.73312-2-philmd@linaro.org>
> ---
>   include/tcg/tcg-op.h   |  2 +-
>   include/tcg/tcg.h      |  8 +++++---
>   accel/tcg/plugin-gen.c |  5 ++++-
>   tcg/optimize.c         |  4 ++--
>   tcg/tcg-op-vec.c       |  8 ++++----
>   tcg/tcg-op.c           | 12 ++++++------
>   tcg/tcg.c              | 30 +++++++++++++++++-------------
>   7 files changed, 39 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


