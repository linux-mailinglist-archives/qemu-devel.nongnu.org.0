Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE523D198D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:06:24 +0200 (CEST)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6KMB-0000W2-Sg
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KJc-0006gh-Dc
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:03:45 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KJY-0006U1-Kn
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:03:44 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so1369323pjb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ww7NfVvzyw5mks53Ap5neu35R3I5MURSY8TKjy4qTCU=;
 b=A2zCxwZ2FvdcVn3CG+CnaiTNwpoIDstDDmh0X0NfJZieSE6AQQCzPFLZxV6JpNtg1R
 l/B861jUJn2UZKMqXvIbaVdb/SCf+i/6cn+I/WQ24K2xgkV2k/XkyCbxcrbdYKzSHhvw
 KGIMsH2O+uo7GkJSdm9sHFw4eh1r2Yeh+5n3O8aYKVbwelGQv5CqS0FUKek+LsfyX7XI
 rdF3rq9czJLJOX6ZoArTg/EqQ9IxIjmbQA2PZ+g38Km++1J8zI/MWOKsELK9LTJogP0n
 U+zW36Y4mmvRzJ54tWjHBkTkARG1EJhNqPjXRjB1IzrgaAD9go85tMHsU4RWx5GU55Dp
 mgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ww7NfVvzyw5mks53Ap5neu35R3I5MURSY8TKjy4qTCU=;
 b=jjL7rgscsHwGdwxiRSmakgMb75c6RbHVQOQ+tTm7Jx0v9lkwSPAt2uPQIrRd1NnD0o
 /Aew0lFoVGBeVbsQw4zQTi4t5e8Dy29+fcNR0sAB2CUMs+zAfv79Qxrwl/rUSBaQ0x/2
 m3GaSXgCVcuGA9DsIxucNViyhwXrTUlcPQB6tMdPpwUdsn2LABDNUclukgOyWJySgpVf
 hxrfr23VHFWZCmL5RwfUyTck9tydc70/16xCruR9J889UUstIaGTZDh2HmlUH9pp3Lno
 28QKfOK4XXSNfJuen5wh+yhEeKLcQ4y16At0r60pWWNBmeGJJnsLvK12fdOfif3o+4GJ
 aLlA==
X-Gm-Message-State: AOAM532/+oZCorQHfV+6zhbJDHqE22mzho7ge59Jx9yZyv9oaOtoxb6V
 AWiaGB8CnQtE4a8tdi+XXc7PU0HqIftO2w==
X-Google-Smtp-Source: ABdhPJwiZLppFjconOXXRFoLyKBnxJmSTsPdzV1PQvW5vyJ5IWRIDTWfnIBhvVIZOC5YfqYtAXHQwQ==
X-Received: by 2002:a17:903:31d1:b029:120:2863:cba2 with SMTP id
 v17-20020a17090331d1b02901202863cba2mr29753634ple.28.1626905019132; 
 Wed, 21 Jul 2021 15:03:39 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm31170157pga.48.2021.07.21.15.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:03:38 -0700 (PDT)
Subject: Re: [PATCH for-6.2 25/34] target/arm: Implement MVE VMLA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e0cfeaa-7125-b5dc-71db-43689b933cc0@linaro.org>
Date: Wed, 21 Jul 2021 12:03:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 3:37 AM, Peter Maydell wrote:
> Implement the MVE VMLA insn, which multiplies a vector by a scalar
> and accumulates into another vector.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 8 ++++++++
>   target/arm/mve.decode      | 3 +++
>   target/arm/mve_helper.c    | 6 ++++++
>   target/arm/translate-mve.c | 2 ++
>   4 files changed, 19 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

