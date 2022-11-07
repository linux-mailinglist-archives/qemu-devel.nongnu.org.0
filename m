Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904236203CA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:31:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBRR-0006mR-Im; Mon, 07 Nov 2022 18:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBRP-0006ji-LZ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:22:07 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBRN-0002Et-H7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:22:06 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 i203-20020a1c3bd4000000b003cfa97c05cdso142518wma.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6RPROgLkkUyForOR22QV8mtzIj/4ym+YaGT3QpJKNWU=;
 b=Rf5ryzLiVcrOTvtNEHwQA1HzwOAPepQDYxC8pZXm3cHT7W52LJTGa4mFGGxh6mVmsO
 BKtHESF13IGGd1RrRH+C3b60quIZiIPin+DdAAzDv+7mbrosak7XpR+fbt8XrNAeyXCt
 mm45rkfWmsuYSNAX/c1jEAClzpNqhXfgD9WVaxVLvxfw4l1haMh5tbp+OJRTTzp9a1BD
 89dKY+OqcTQW82EgrXM6t+bm58wO80WeXMHggdxcHXH7O3tpu3I8p12dlAQa9GO+xVZc
 RYLhVVRLWLcxWhGbT4PeAuXkWzhdYG4WKtLrmaGy8c+FsD9pgEYjp7FGHCg+DNj+xXX5
 GwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6RPROgLkkUyForOR22QV8mtzIj/4ym+YaGT3QpJKNWU=;
 b=IA2x7RXQ60zmcM2HXw5pmnhiKotiX4QG6iJerhL5Vi1MpNojNghVflmkz/PRWk0zev
 vA9HDurGAMwkIzCL96559mSjp7z1vZ+V9WWCfutBEn+yDzPtVmGWQrKRnDe+PkH3sTbU
 xcNOC0SR70a13mL9257S15MXU6ocjMdg3jESGgOQ6GwugI//duMaofHO/CZN8jeHN0wS
 G4t1l4yaWSkjL6VFqtTTU9d5NwjEB3KsLYGVEJ4IC7v9p01Jppl+I7aBDcTxkwY84O6p
 WpxOeDXUOrOdvMolViyAbIWrqlrkJpsN0KHgZV4zftB3BE71oEx2QHNiogFwN3wyS2/A
 lmhA==
X-Gm-Message-State: ACrzQf3WuPrPNzr6Kl/2xwNcnjj5yhr82GUn1mTAHzMlEwmMK07wqDUf
 YSSW7n77CJlzQ21HFfM8Pyd4sg==
X-Google-Smtp-Source: AMsMyM6YJUqDAaQ6HYYPMkOebCkIiHsJhgx3eM27s1CojzBtoW3NZzT+T2TWwcDxvSHo9Cb+KpygXQ==
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr44493403wmr.27.1667863324171; 
 Mon, 07 Nov 2022 15:22:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm10225695wrn.27.2022.11.07.15.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:22:03 -0800 (PST)
Message-ID: <3f011b1c-572c-dd4e-4574-9d90dee36116@linaro.org>
Date: Tue, 8 Nov 2022 00:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] target/mips: enable LBX/LWX/* instructions for Octeon
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, jiaxun.yang@flygoat.com
References: <166728058455.229236.13834649461181619195.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166728058455.229236.13834649461181619195.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 1/11/22 06:29, Pavel Dovgalyuk wrote:
> This patch changes condition and function name for enabling
> indexed load instructions for Octeon vCPUs. Octeons do not
> have DSP extension, but implement LBX-and-others.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   target/mips/tcg/translate.c |   10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Queued to mips-fixes, thanks.

