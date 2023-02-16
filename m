Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2066698DA1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYSe-0001rf-4B; Thu, 16 Feb 2023 02:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYSc-0001r0-7K
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:13:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYSa-0005Nx-Ke
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:13:41 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso3411435wmp.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dYgXDB4F+kT12MMasLhZQChflXAb8MPayUU6Lvy/7lw=;
 b=VANCQheCUIztIosfg/Myf8Snb+hTml6JBN9y97IAB0v3lfYqtHDuSN18V56BSE8mf/
 rdjB6Gj219zGTuQWvMe6cRfizExtBgtkbQpY/D7l7mVnagwXzBgGXDXNsXtzxOQ1TBle
 b4V+74RLl1YO/i2weFUG3Zldm3CcN+9/2+ppO2rpMFCYULHLHUl93GUP5POXqhi2UlU8
 54f7bxgmsJ+wxQxkuo81JioRs5BsZmPceMZdyd7AMVSF9w9465uaH2TBI6Kxsh4hngpn
 JTxIALUkmSFx24U9RxumsX0FyZ7RJAJif+uCtvLsBuy03q4Uxycnex8gVYVlwR9whHYV
 /bIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dYgXDB4F+kT12MMasLhZQChflXAb8MPayUU6Lvy/7lw=;
 b=dlsViaGvrKfHNYaYsZXARJYhlwlDgT04O89moyDLHKcLXbslJKERWZDmqOwQdsSWow
 ushPiyr5LVFXbfu0IKNjUshb5l+bwQOa4lk29GU4Cd/QerRmtK4WpCX58UZ1UvBSgxWd
 MOFBWv283UYSZj4DxRU05xLlhukd/ZKGRBaBSxL1eqxdVJMbuVZwkOFzU4hhLtGZCYOw
 tt4LoZ0+auv1A0P6BuM1s6biNyUZx6N3tfXVQYzOrRNCoy6VsF3XfnVS0FhVsGrPw/fF
 RLWelMQl9ddMkgDyu6m3yls2902fpBZEpxSic/58ji6aZSYGnaVAhyhim9dgkwlFbhla
 k8QA==
X-Gm-Message-State: AO0yUKUDpoj/ptdVVK5F7f683i093ALMST0Ib6vMkYs9u6Qh8afwrAgG
 pXROy4qFtwxwnlDAONiNy7Oj0Q==
X-Google-Smtp-Source: AK7set++eGKmMSGOvsx6G3IxqMFhLwlqpt2nmDQ6azyuCLdWnFOPH2MnTjQn7era5qaEDrcsWZjCFw==
X-Received: by 2002:a05:600c:180a:b0:3e1:f8b3:6333 with SMTP id
 n10-20020a05600c180a00b003e1f8b36333mr3764573wmp.27.1676531618538; 
 Wed, 15 Feb 2023 23:13:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m8-20020a7bca48000000b003dd1b00bd9asm735589wml.32.2023.02.15.23.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:13:38 -0800 (PST)
Message-ID: <b798e045-aa3b-b3a6-6b3a-af2c71eb3764@linaro.org>
Date: Thu, 16 Feb 2023 08:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 21/27] target/i386: Don't use tcg_temp_local_new
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-23-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new is now identical, use that.
> In some cases we can avoid a copy from A0 or T0.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 27 +++++++++------------------
>   1 file changed, 9 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


