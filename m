Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C474F4A92ED
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 05:09:39 +0100 (CET)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFpuk-0004JW-C0
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 23:09:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFpsc-0003cD-3b
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 23:07:26 -0500
Received: from [2607:f8b0:4864:20::1031] (port=52024
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFpsZ-0005tX-6M
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 23:07:25 -0500
Received: by mail-pj1-x1031.google.com with SMTP id q63so4357863pja.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 20:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NtXdSiO1A3BVUJVcVPqTcogj1meFE0v+0t5zpQ5nrJw=;
 b=RIP5h19ihQ+XO/bV8214S7E+RkNQd1ULNXNZaqJRF3DrHwxL/htHJGNLufUNzhHmEN
 cT0a4LTTbLogbMjEQMjNba4FMbOsy1KqBh61aXg89hyZuvzqBI/x/FEa2J7lWLIwbU8l
 1oj1jzzDH+4NMRhdlsvRckSOGxQlKgAEDChyL/Z/6GgEmtFn6FkS2O72LGYKCPbwBs7B
 LKXxEiQoTNk1rgPLBb0ZmSMYBTdP/0U4czzpn/LwfYo6xL6URglks70IOsd1RErt33eB
 lVc03GZJuy8MSLxXrVyzD+kpEWo/ldchof1bpp79Uhu4oi6lu4LMZOXTxBk0nD4eWn9p
 C0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NtXdSiO1A3BVUJVcVPqTcogj1meFE0v+0t5zpQ5nrJw=;
 b=bCay8/G8y+1wOX5w1kifo/ru/eEQNJ6UWCzaLAUaj43ZM1DmMW/4blljNeD1Qe3mXQ
 9fsRSoxOrmYTWK4KXhvQ0Oq3sli84FaWdgG8akmbS7yRYOy5L08JfYNGplNKxCc4acdq
 Dll0Oi51aKYU5zkCjxcqIqieYPSwjLZRzp0kVvbhqK2/+KO0x1rLI+tqlZoHEs6W8xjK
 SfRi0aqS5IIeh4gFdu2mOyKn1p499QyEFI73F/xn4In6wQ2C3aC+pGK/Y9dKvSQRNpU3
 QTbeAm0B7NnUO3kC4Xy8drHuInzWOlOFewymtwgZGADU3Q1Y0ki2W5km5jQrU6RXb0pT
 DdsQ==
X-Gm-Message-State: AOAM530SceAKf+C5CLFR8sj9JLb8xXrS8YPdK1x179Wi07eSAPwI1NzK
 IfhZHnCtklCU7IijIPiyNyHkjg==
X-Google-Smtp-Source: ABdhPJxw0LH5Vjs9tPJWV/Ghmf71yDF/gWzd0oeHp56J5Zlocu2Ogy9fidltOjsnjOvWwduoyVwbtQ==
X-Received: by 2002:a17:90b:1a92:: with SMTP id
 ng18mr1046873pjb.139.1643947641166; 
 Thu, 03 Feb 2022 20:07:21 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:40f3:c91a:302f:9154?
 ([2001:8003:3a49:fd00:40f3:c91a:302f:9154])
 by smtp.gmail.com with ESMTPSA id s11sm551557pfu.58.2022.02.03.20.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 20:07:20 -0800 (PST)
Message-ID: <22d85c0b-5afe-62e4-ff53-59882aa8e0ec@linaro.org>
Date: Fri, 4 Feb 2022 15:07:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/27] configure, meson: move AVX tests to meson
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203173359.292068-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 04:33, Paolo Bonzini wrote:
> For consistency with other tests, --enable-avx2 and --enable-avx512f
> fail to compile on x86 systems if cpuid.h is not available.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                     | 103 ----------------------------------
>   meson.build                   |  50 ++++++++++++++++-
>   meson_options.txt             |   4 ++
>   scripts/meson-buildoptions.sh |   6 ++
>   4 files changed, 58 insertions(+), 105 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

