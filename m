Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE46A3DD0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZS5-0005ip-Lr; Mon, 27 Feb 2023 04:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZRR-0005YI-17
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:05:05 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWZRN-0001pn-SD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:05:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v16so2560940wrn.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nu4RwDw0Oymt1qIVGQ2x0XlzBIXgPTkD3uphi8GqEMc=;
 b=i+VzYy1Yq7ZrD6QkCn/QcJOzZQCmjqYw2ZsY4yJTCYTdO1S+lHlzlU/lJUR8quI8jQ
 NdnkSxrllotnmWVAyzcKDIPD/mTl0GKN+UXRq2XeYNKTQvW7Y46/q66LjHsM2MicTEco
 glIoHDetRTOSHWD8ffIyrd6Y4JmXKDetUJVtnDu0BF96PIN9nnJjrPPsdNXpkLcQf4J7
 oJhDdHItcoafx/ckg8DicNipjVRvEtU4QU35mqRnBX1847Av1d+DFrUn/fL2SAtuFlR6
 DKgBlfmVd4rcHz9hLI/XRmGIAoRO+CD3HcJBbL+fz/s+pRLRl9bqtFRhKNVdEatSk1cx
 /pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nu4RwDw0Oymt1qIVGQ2x0XlzBIXgPTkD3uphi8GqEMc=;
 b=m4f5eyvkLIOrpjhsMFX5chHtfZGfBZiUaMpN+A1oBl1ttHZ8CyyokkOqsePO+k2Bl8
 eb6Ex3KJobaoyTTapTXIT/YWp6w2fWUmTUilO7IhuGamPhty36UBUYfmeIGmzjOuy722
 n7EAszeXrFLVhU1Wxt8v/39xtcehQhwukhbU/Jy1RmMY3ntgE8WtzFFjwCVvImtmM3CH
 /FhmruYafK+og6xCRdOiA/+KILuBKL5PLAr8r51uZWfQQ/zfDKdh0yOu+f9ZsnUHEQRM
 /2wWjJ6e5zfTEdvaQ8vL053eCXua9HRfnycShU68rM0lRk/jPeRUuVposgmTqyjAf4Rm
 TVnQ==
X-Gm-Message-State: AO0yUKVma/82kXR9xZw4NIQS7sJRqCIgoBU8VrFX0UBSkMBTAI/6nPyy
 z0vtz9t/phTCjhju3INfcDKOVQ==
X-Google-Smtp-Source: AK7set9y8z1AMRxfbyGaZjeLW1K8HbNKiqEGufE/aPvVpruddz8YLxu5SVGMktquaVAV38jb5Ls6fA==
X-Received: by 2002:a5d:4ec9:0:b0:2c7:7b7:eed2 with SMTP id
 s9-20020a5d4ec9000000b002c707b7eed2mr16961186wrv.69.1677488694349; 
 Mon, 27 Feb 2023 01:04:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h8-20020adff188000000b002c54241b4fesm6449729wro.80.2023.02.27.01.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 01:04:53 -0800 (PST)
Message-ID: <cf0bf5d2-e2fd-aca2-392a-05368f194cef@linaro.org>
Date: Mon, 27 Feb 2023 10:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 22/70] target/i386: Simplify POPF
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 27/2/23 06:41, Richard Henderson wrote:
> Compute the eflags write mask separately, leaving one call
> to the helper.  Use tcg_constant_i32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 55 ++++++++-----------------------------
>   1 file changed, 11 insertions(+), 44 deletions(-)

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


