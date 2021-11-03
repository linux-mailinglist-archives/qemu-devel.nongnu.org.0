Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F16A443BE5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:36:31 +0100 (CET)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi74g-0000GE-KA
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi726-0005uL-SA
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:33:50 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi71z-00069n-Em
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:33:48 -0400
Received: by mail-qv1-xf31.google.com with SMTP id g25so1386121qvf.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4XgbTWcu8tV3eWnpSGX2UU7M18TFEwpLwmaorcMMMGM=;
 b=Ay9TWLXRGyVlWKM8TvNjp4uhBffAAvSXYHHzPW2z/r2qKA79IIKG7a8SSNJHn0tWOb
 HDnrT482UME/IBqfv8mlLzedeSvP9dExwvYaKHnmsxJvVAAM+r1Ui+gS0l3a6rPNWtaC
 KSCwyGz1hcvcWg4MblQcWCwFFg2swTduCKWQoGUWd2sKbPyrnWYt+jdZjbOrWpJHf9UJ
 KSN7QY6ZU6/Zb290jovM0x4VENA97ZLzN+2cJiaaK0L+aDEwMfnKVI+gU+LhPfq6MirL
 MR6fUmdoQDo/rfn9RSs5bv6mXKiLFcy44I6NhK6br3bqANprurGPyw1XycEBXq2XfvVi
 nCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4XgbTWcu8tV3eWnpSGX2UU7M18TFEwpLwmaorcMMMGM=;
 b=lAU5EnaGvNeDYcUa9uxy6skdF3yZF04tI6KqeOOHFaIJE6NnCoE2xde2JyS/oR2G99
 yG+7B8xK+uAKHlQLk21WP4nRPxEtI1kyaivnZSbkfm4MGeYWHmn4+rv/rwzH5+mLrB+i
 22j1Teb27JGfEBjndv9V3EbXLB6zLOJHnjOWTPAUdWyXSfBGTFow+bFZFmcnzBprkItz
 MhcvQrA4nDcm0dkj7vDHas/fKeLDiIlvBVsbU8I1mxLxK5YavP8DOTKqHhhN07X5lgef
 FLlYiXmFQ/J8M5PZ6rOYjy1BLMYD1msiSUt9v6hw+D1GX5bST+WQTntSDRv/jsIiZe3s
 miZQ==
X-Gm-Message-State: AOAM533s2QXU/bGj2NSXgGGY/wp/UJbcNXpdWM+b33WLnDnMN/r/N9ks
 6TrRHJuzjJS8RymXfsEilq67Pg==
X-Google-Smtp-Source: ABdhPJyUUKAFXguSNY3l+ZBFYI9A1khdeVFpmNtDNso4V+sKyOmjy1Y9zaKMganXs5opYsqutn/LuQ==
X-Received: by 2002:a05:6214:5195:: with SMTP id
 kl21mr13820775qvb.42.1635910422406; 
 Tue, 02 Nov 2021 20:33:42 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h17sm714301qtx.64.2021.11.02.20.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:33:42 -0700 (PDT)
Subject: Re: [PATCH v2 20/30] bsd-user/arm/target_arch_signal.h: arm machine
 context for signals
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-21-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <268e46e1-3023-7214-abc3-46bb3d195152@linaro.org>
Date: Tue, 2 Nov 2021 23:33:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-21-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

