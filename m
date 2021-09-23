Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E09417193
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:14:21 +0200 (CEST)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTk5s-00021k-KX
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsT-0006xG-Eu
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:29 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsL-00033R-Ad
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:28 -0400
Received: by mail-qt1-x834.google.com with SMTP id t2so2609776qtx.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S0S0yPDhoGhJADWDnLuHpe0rhKINYSjmQqBSRA58SO0=;
 b=Z4Tc82PwKYdqhgphd9IqH5e6OOOjm6UfMBTIFOF2UbyT/N6qiNzv2gLG85hrEU6rnS
 jqeCxeqIvN5aEiVm7sNUsvdrtdJnhltGugYCfUtzu4/Iihlr/qOq0BCpGZq/9khpEnF5
 m6zv3iY8QcQ/kZtfLLc1K52qvIpmfbnDxqqGX7bpSeS1EHELgM6FmECyF7ouVQ5nBvd7
 HhnyWXfgLO0uD5cOqcQ/c5nvzbQuE6Hci0F8gm5wrAzD/kkwmcJKOmP+gJAfQ4YMK8vZ
 BK3K46ikCYd0MvhL1CbgHT6/GSKiZJiN3Clsv9WAD6AfNohsIDtKUBvkgg9OYYxjutSG
 iOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S0S0yPDhoGhJADWDnLuHpe0rhKINYSjmQqBSRA58SO0=;
 b=Ae2gfreLRnD42wanml0YZbQLJqOwLd1/wJzzsfqXeBs9paEPTDeStM1H0kRP9PfMLu
 apxVyXrd3kwTF7LAiiRuoWJF/GU2fUXy7mmoSfkyJVdtIagcGSdB7N3YFpgO2BDzYgbD
 21jOGabfpkqEkDvL6St6KvJHRlwYeCfs3fZcaTjD8L1AqCfKXLHhUy0iJnO/LTQtc5Na
 hi6k15mGb/Hcj7IfBNCFyGh0jyWvRR5Kf4RLO3A3k33fRtehJWr1m/4FBoXQo1/cBbTf
 wiZvRRvRGrnsvYhTvj4OK0iMYitQSaPGC8nmqT1s4ekMfbcPr5miAawozxdW8bp/2G07
 5H7Q==
X-Gm-Message-State: AOAM532xDntVtCSqBMKrzrtDLt8m31aQWy6yhwb/va4ebxWGg31Mhpa4
 xozkTqaezufvg3S8TJrkdXXizg==
X-Google-Smtp-Source: ABdhPJzTnrZKcZCPMnAtkZ9HAZxmNYhsij9zAoj1NDX5/vzgdj3bhSYG6Q1pMi59vGXn1WqpGYGD9w==
X-Received: by 2002:ac8:5b04:: with SMTP id m4mr3666633qtw.344.1632484815472; 
 Fri, 24 Sep 2021 05:00:15 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id u13sm5867873qki.38.2021.09.24.05.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:14 -0700 (PDT)
Subject: Re: [PATCH 05/14] bsd-user/errno_defs.h: Add internal error numbers
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e359095-524e-75ba-9ff0-76c47b10382e@linaro.org>
Date: Thu, 23 Sep 2021 10:59:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> From: Stacey Son<sson@FreeBSD.org>
> 
> To emulate signals and interrupted system calls, we need to have the
> same mechanisms we have in the kernel, including these errno values.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/errno_defs.h | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

