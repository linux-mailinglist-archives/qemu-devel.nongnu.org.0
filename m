Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19436A277
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:57:38 +0200 (CEST)
Received: from localhost ([::1]:46708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMXB-0002by-P6
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMVc-00026q-In
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:56:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMVW-0004LH-N1
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:56:00 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 g1-20020a17090adac1b0290150d07f9402so2834466pjx.5
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I9r2SGFAkf9dI7PeII0caP1ZF3bABlYEKfgoMlLfCYE=;
 b=CnJqP1FgEG4xRvt4msgWs0W+fh3mxc/fL8aD5kOQhHr1U/KOtLYwU5gcbjDyFffkMc
 ve6+/mY3zl7xf37XH9G006rA+z+7HGCOEtrXYiGH1h+4MX4/XN+62LnAWOvM9D1x+MqN
 CSaTiPa0RNDVZzsjfERnkk52WNoJ/bK4LsIit2sEof+sgvmYX5Hceg7kjSjtL+vzwmRj
 DqCVzFD3631GKGMaXmpR/I+tCslBG+q1l4UOYhfQiGUxWxroBqf2X+Q4GXPYdrrrFjHY
 PnrkONZWBN5WNdMlni89+7fZJta49ArzT5P9eLqyasfc8YHLlxn3FnAK4Z0TKEZ1wSvs
 wOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I9r2SGFAkf9dI7PeII0caP1ZF3bABlYEKfgoMlLfCYE=;
 b=EWh/cWmQvJkqnanurkAnDtPDpY7P26rFQB1K/SbPpnNt7DgpV6jkCpqVRVxAehRpyi
 dcLiDhdnp1tX2/XsSHzgcMhmKZKOhKSBvL2acbGAe00hsSqQlEgzqTeE5Cb0zqbvqWJP
 LB9xxmax/8GMJONZuJeVbTz9OWBJR/xQhmSuxMBHOWWkYd+Led7p3mwotOtPqR+h/P3c
 sUZDRnkuafOe/eSWmYnBGt76CGF274UnAeWj44fwfQjLYp3HMJLUL8JtjZyZFD8yYAtd
 5jkD449hR6hTzsiSaticKttueuByGOvQs13OLhsGie4s403Epu2C9kg+BM7bymJEfYwc
 beSA==
X-Gm-Message-State: AOAM533heRXMcD5xc6Eb6r6hqzBe/UzHOt396epzw5GAPZRWs7oSO8pI
 6R2hMocPKe55KjMFYNtWmWNIFg==
X-Google-Smtp-Source: ABdhPJzaM3RHjcHB5PmflHDrAmn8o2nT6jyUUJBczfLS/zOQgC05ppGg6iiqNKCmoqOGRYv9wFtvqQ==
X-Received: by 2002:a17:90a:5d17:: with SMTP id
 s23mr10623738pji.44.1619286952818; 
 Sat, 24 Apr 2021 10:55:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id l10sm7302010pfc.125.2021.04.24.10.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:55:52 -0700 (PDT)
Subject: Re: [PATCH v2 29/48] bsd-user: style tweak: use {} correctly
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-30-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <389432a7-c6b3-45c4-c745-aabc24bc40dd@linaro.org>
Date: Sat, 24 Apr 2021 10:55:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-30-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Format if/for/while statements with {} always, on a separate line
> and fix a couple indentations issues for singletons.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 147 ++++++++++++++++++++++++++++-----------------
>   1 file changed, 92 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> -    start_data =n 0;
> +    start_data = 0;

Ah, I see it got fixed.  Anyway, squashing this back into the previous is the 
right thing to do.


r~

