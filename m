Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE033D4F78
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 20:24:36 +0200 (CEST)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7inj-0004u4-UG
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 14:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7imp-0003z4-TG
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:23:39 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7imo-0007O6-D9
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 14:23:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso3713781pjo.1
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yrgP8hpFovMvTAiM5rAavk6XcbfLVZt6q/yQhP8CQDE=;
 b=XKtYWBv2EfIWUBqvSiG/HU23o2gUy0OO/R9HbqbwKIfdmiRQ8y0jiZcqrHd4RMo4lM
 AlOmjywDBRO5MiOnwDHreSsDG2O5o36bJUcRUh+CJFnXNhuI6K4nXYvSJMbp14B5+8lV
 XtekBDOtJ4iGzCckFb4w/wrHIR7UNVQlF3ZvXx8gGYpAsghns4Av0boTTrrMGbyDuJSo
 AeB+L5trDc2Cfk3jQt+TmRt0/+ybRpc6KwwTuiBPO5O40NEnjUk4KtLK2+0nREY3tGLR
 N05ntOmRvhXFsoYD1DNfbqzSkYYzOCSLELswaCs0g7TlLTU3sNeEa9dGykkaGJUSToAb
 5dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yrgP8hpFovMvTAiM5rAavk6XcbfLVZt6q/yQhP8CQDE=;
 b=dNWr0Hajbyh6AWDYCNL8cjDqVK+bqyAECaN1qQbPNHKVBJBbJ0MSpkxyX9n0XvLTPB
 PffsSkULMpKfCsNZqzTLcuwld7FRM7UDu8LSZEzqExB3dcbpc7W5Xar0U1KSBoTIyXNc
 1lxirJjpRLTK1Q/7Ia47b4pm4035pDXPw3mDG6Jrf/QlSWyqc1bgmZY2S6MIouWMAnNu
 2RBQR87CBElLan14t6s/86P6BoyyIrYGixWAeerwy5QfHAEkXWPW7DUA+pwz84sxOJEK
 kjHFDpctIFC1EZ7s4H8RKBiiCpP5NkVq51HRuQA9RXrues/Ctj2Ffh9GpscCgpMPL/AD
 iTCg==
X-Gm-Message-State: AOAM532jdUtnj3r1HwZUuXhSEaEumHv+zkaoK8yLJjjl3EiJdVWJrbD6
 zyy1HK6850M5FFupWzHGYmVee06V1+sV5A==
X-Google-Smtp-Source: ABdhPJxR5YfuYvPBb3Hm4pk+s4DKypqj726O8htaTh6ITKM9ZX9NvwkZx2w/c0D0nw/YQxIMg3ICXg==
X-Received: by 2002:a17:903:404d:b029:129:b048:528b with SMTP id
 n13-20020a170903404db0290129b048528bmr11463542pla.65.1627237416908; 
 Sun, 25 Jul 2021 11:23:36 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k198sm42521587pfd.148.2021.07.25.11.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 11:23:36 -0700 (PDT)
Subject: Re: [PATCH for-6.1 6/6] hw/intc/armv7m_nvic: for v8.1M VECTPENDING
 hides S exceptions from NS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210723162146.5167-1-peter.maydell@linaro.org>
 <20210723162146.5167-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c014563-12b7-af0a-a03d-d7e4c2a7a54a@linaro.org>
Date: Sun, 25 Jul 2021 08:23:33 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723162146.5167-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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

On 7/23/21 6:21 AM, Peter Maydell wrote:
> In Arm v8.1M the VECTPENDING field in the ICSR has new behaviour: if
> the register is accessed NonSecure and the highest priority pending
> enabled exception (that would be returned in the VECTPENDING field)
> targets Secure, then the VECTPENDING field must read 1 rather than
> the exception number of the pending exception. Implement this.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 31 ++++++++++++++++++++++++-------
>   1 file changed, 24 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

