Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46D640110
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 08:35:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p10Z7-0004nB-Ds; Fri, 02 Dec 2022 02:34:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10Y7-0004m8-6Z
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:33:46 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p10Y5-0008C2-NL
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 02:33:30 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 i81-20020a1c3b54000000b003d070274a61so5400587wma.3
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 23:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fyX1X9hZvp5WnMdyW5kfKncQ/MiIUYRoIWXGADXIi68=;
 b=E3mEyFz3dMq+wyHiRLIG1EjNuQ9P7cVW+3NV0DpWUTtnuTwEL2sWuYzzM1oU/qXHdP
 J4ql/Xody3NxfUPsbWumfH3GARvAlIwImKtfv+7OgC7n/OOX/SinMcqbl6owqyFA9eEn
 N1alVpuMTqqBAuqC+04WXMmXNrbwz+uJxdAKUzyL4OXamLSKpckRaRtJsjfDb9wKlK/S
 8wf7RMVHY5ir65AXVJx3kUWWATr+6F4q1bbHXkmzfht9z82irmA3CQOlvw0WCTIZjidb
 A8/1l+eg/9LaUH13qybSBex4ykeKYonpT9MV+3peH0pxMlXas8m2zNlbzw4SPoxqmApQ
 0y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fyX1X9hZvp5WnMdyW5kfKncQ/MiIUYRoIWXGADXIi68=;
 b=PjR3MCN6DzELQ+b1NqDS48j89tWKBdQNHSpMJCGVytQB8NUeiu4eIhzlhGTUminN04
 YKP04AnzWy/3jNe3YQA7jsY9kIzDQP0DO0WBs00RawaH1cqmH2+As4zBtS5VLAGmWeMU
 Xj003LMu1Dotz/wzbTenFAUhcDug2q9N+TDfWWI4whpGVaOqX7P7Klvd+Mg5bBANaUKZ
 o2Nv1Gn9gJicEDNELtpgkkuFpErXxH441JMPm5NmfZ2Sd6sfzHa+05/+ynFdAyJzzdL+
 r+Wj+HV4xQEOxpma00k2vSsAdXBLEIEx7VBJO1qBeBeNAY42vbDXn67YPMlEVFY8ghZ7
 C9aA==
X-Gm-Message-State: ANoB5pnTYD44hTjdH1tB4k/54QNxr/hGTSg5q7vupaEl+RnY48HAPHRE
 1ioJV2Ja9x7GpcyqTMRxcOJvNA==
X-Google-Smtp-Source: AA0mqf6+pVboi87sDtGEwULb19+gVW74V+I7EhEWd+YIa7w1fMMv/3lks7dehRFKnn5+onRLsqw4mQ==
X-Received: by 2002:a05:600c:1f1b:b0:3c5:a867:e59f with SMTP id
 bd27-20020a05600c1f1b00b003c5a867e59fmr36091105wmb.146.1669966408119; 
 Thu, 01 Dec 2022 23:33:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003cfd58409desm10663180wmc.13.2022.12.01.23.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 23:33:27 -0800 (PST)
Message-ID: <186d8075-4940-7cdf-674d-919084d22351@linaro.org>
Date: Fri, 2 Dec 2022 08:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 04/34] tcg: Cleanup trailing whitespace
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221202053958.223890-1-richard.henderson@linaro.org>
 <20221202053958.223890-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202053958.223890-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 2/12/22 06:39, Richard Henderson wrote:
> Remove whitespace at end of line, plus one place this also
> highlights some missing braces.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                | 33 +++++++++++++++++----------------
>   tcg/ppc/tcg-target.c.inc |  2 +-
>   2 files changed, 18 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


