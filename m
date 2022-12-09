Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D978647E5B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 08:14:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Xa7-0005us-Ii; Fri, 09 Dec 2022 02:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Xa1-0005se-Me
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:13:57 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XZz-0003c6-M3
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:13:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso5093445wme.5
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 23:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mz8ndFYXElqfqWETuKwHgyAhHPnueSPCduxcSmLv964=;
 b=oEkU+LLIDqK0O4tYKweUopavvRnSQ6TMYy0eD306q3pUChllmbxALDAgA7iPMgfkXg
 OlpRCeJaa+TGMkjh9/uXZUb3ch+kmK51bMdpW4F+1TK+HTqYiHF11dEOkx4DO7dHoTmA
 ro+wcJHSfGcwdezsFTXvPTEOGeSnmsWuBkoCSUksVdHGHHkhQZc/wy81oRvhv59SL5Xl
 q4t5swoQ4qCJaCoYLlEIAoprUbGOHYWgakrYHDteEkO+kGry/CbUoCAF48NNUt3Ma8pp
 Wdq+0DN6gJTIVfUdiPQ8fXaBVzM6yduZnnJSKCchwk4L0fZB8aEE9S+X6gL/rWBqIOx2
 VD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mz8ndFYXElqfqWETuKwHgyAhHPnueSPCduxcSmLv964=;
 b=aYFTZL3niZIjC4YXbQBmVQJKLya3Vvg8KGxNAsk3uX6cy4FeygXFm9pLUNE6RuSMVU
 dNSnPDSFRwgMMCQfDIs0sPYzVa4Wv3UcfeudHd+VphbDdf9Qi+AXFvlSaZoCcj9FvWUG
 03ZoB6+5q75TGLiZd+tKi8l3Foj1Eiz7+SHIiIOqJz0V0ocQ8lOtzXw4XuRI3WgueZ+a
 wnG1eq6dClAF7La/eXqHHRi7QMC7MaNU9Nz/If7oUxkAuTHVgOK7OlXLd6gfE47ky1Vi
 Bq698kg9t/7r6a4yVghv81O+FQvALzp/rLL+th7z96YC9tiDWjJOk94S+aeK0/Z170aZ
 8jwQ==
X-Gm-Message-State: ANoB5pn8ydaAmws7vDU3ndyNmFjSm51li886xwbavN/WEGagCcRAIv4T
 csiJm6yzLm4HDew6vnsQHog7kA==
X-Google-Smtp-Source: AA0mqf5+98eZP9w3WlOrdq/XExLVifvb63xm7JMuUgtoDTfso3Gksy3ZBiCxHWkbLaVEoRmyNov5Kw==
X-Received: by 2002:a05:600c:3782:b0:3cf:894d:2cd1 with SMTP id
 o2-20020a05600c378200b003cf894d2cd1mr5022280wmr.24.1670570032329; 
 Thu, 08 Dec 2022 23:13:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5951000000b0024278304ef6sm630417wri.13.2022.12.08.23.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 23:13:51 -0800 (PST)
Message-ID: <4f500afe-cd29-b949-fae9-228733e167a5@linaro.org>
Date: Fri, 9 Dec 2022 08:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 5/8] accel/tcg: Move page_{get,set}_flags to user-exec.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, laurent@vivier.eu
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209051914.398215-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 9/12/22 06:19, Richard Henderson wrote:
> This page tracking implementation is specific to user-only,
> since the system softmmu version is in cputlb.c.  Move it
> out of translate-all.c to user-exec.c.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/internal.h      |  17 ++
>   accel/tcg/translate-all.c | 350 --------------------------------------
>   accel/tcg/user-exec.c     | 346 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 363 insertions(+), 350 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


