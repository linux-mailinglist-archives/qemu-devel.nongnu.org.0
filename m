Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4268C36A28D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:22:42 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMvR-0006ow-Bs
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMpJ-000364-EN
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:16:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMpD-0002Ru-On
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:16:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id v13so13209636ple.9
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i+1515lvCxSkePRa4CqS4hrxefLrcTOavYURme72oHs=;
 b=W3PEP9hKbKSN2gkHobaqh12c3ddTgYp74Z4FPWJFsrZ2muDqxQrLwbiLMvBN9Bcc2N
 WwVGcpqNC1jq5qy7zlvxM0Of7FLfcOT6HeGVJhamo95tB9b5i7SA9cm2eEbSAb5sbUwb
 6LVuGEyWs0UWstnuwUukXf2DfBVY5zmP03OXNotAWlcac4D5HxjqbU5I/9szm2DLMBbO
 FDDuMBsLDLkZk2K32YSOM/wCew9RVG81sTEILiRXriRcWY2HjMIYs1szMH5OguOZ4q57
 A/UlLJTu2vh3MFnOd/pqvb0KJsUqcJJNj9uvlrUh2+eU8thER9welZYEIiqev15NdYKr
 /Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i+1515lvCxSkePRa4CqS4hrxefLrcTOavYURme72oHs=;
 b=pj8Fo1Hy1/+n4aG4gers8lF6oTCKCJ9g/Dg9U0cmGm9I9fEzTLyqYo/MDck4iDyrLx
 lB412lM+RUCLawSyXY3i2fNFIXPvlVs6Ht7KsHW0Bg+zAx+Rem0pxa87m3lrqoX8QgsQ
 MqJ6JpPr9WMY3Y9KL/yDE/W/OM64VAFN/LNAaDUX3b9bl+O98Kj9wrM7sHh2kaYa/IG5
 NK7D55rTAoT48ObYLxZDtysr4TlpcEoAA91ujv3eQOw9V2PZS41Ob7m/Yui2Nwn4534h
 jd8BMk7W4pDKIqEvtCT7CS4KsCiiU2IvNfny+TzlqHdmCZDHokWlVZACwlap6mnEdRLu
 XoIg==
X-Gm-Message-State: AOAM530gxKdE7qDPXytio+1S3+1Y58hlKxuO8rLDMN1nQ+BjnmIYS6Px
 BLpV7RYeHg6U/OQrdQ/0v/GUnA==
X-Google-Smtp-Source: ABdhPJzTwmSB8KZw2OKDB5dO7qVjshOeSK1G15xaEoS0sUoF2eVRnU0ANBs3kT/V8H35zrXzqwvClw==
X-Received: by 2002:a17:90a:d488:: with SMTP id
 s8mr12598477pju.125.1619288174016; 
 Sat, 24 Apr 2021 11:16:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b7sm7497659pfi.42.2021.04.24.11.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:16:13 -0700 (PDT)
Subject: Re: [PATCH v2 39/48] bsd-user: style tweak: spaces around =, remove
 stray space
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-40-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6dbac32-45c4-b0dc-f064-846cab2d6ff6@linaro.org>
Date: Sat, 24 Apr 2021 11:16:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-40-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/strace.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


