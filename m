Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FCC3D198F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 00:08:55 +0200 (CEST)
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6KOc-0002zA-SN
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 18:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KMy-0001OF-RF
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:07:12 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6KMv-0000Re-Ux
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 18:07:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id p17so2196694plf.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 15:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=qdrR1F51yFw1flfN77ehLdgQ41HU5l8ZA1pNUBWG9bc=;
 b=quxUh9TfXjw5NtDb34q/yzHbtLZjRaBCcziAerg/ZXTH0lrJ+UwlImkOMebxdd8oxn
 2Xt3s4t0dfvXFx9h7dCbzpTGuRy7ej1pn19iOL2B83vBojzqWtLMypDoi41m+/hMXjrm
 hoeiF6W5Je53n5rngqJtUgmZmawYNte5AF6K9EmO5xVyDIYaOvwO8JLLqId9kby+ye1G
 Tkece8ty8wlNo63GXinPP2XySTeqtjVZ39reZnlaiO+HEoH8tKg+BmFJJxjTic+B6PGt
 +4EVr/2Un7CzDEXvXTkryAmjTzcfGr2I1Gsx6WnGnIyioHSX6MakU12/f0JqT1hqzi3m
 Nx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qdrR1F51yFw1flfN77ehLdgQ41HU5l8ZA1pNUBWG9bc=;
 b=dv06UEcgvYpX68mJGfi8L5td2lp0cqjojUfcJO1OzUwQ2lV8/rsB7WRqFB/2b8+P3B
 68YeWTkI27nR3unB5kUp6mq5svqNKE65gLdOSJpSvse3YObyMnqnGvdcoI+kvt0LhLFd
 IYIs5LBUV/6fWN43ZGINuq+/vyWuYHa1+IpUrQi14JDF5msFE9mQRoKtcO+j0uHU1clz
 ZnGfB850yhF/lhN3ACDCt3Fdmpe6KEpYdhFoRo/l9xuz+SUsd7L+RggKdmlvvNRL0BQQ
 s/NuIsmvwLhcGb9cb8yArfrz6j0/koGztJxo3BXBFCrw/Ujc/fuI7R8broLumM/uiGEI
 kccg==
X-Gm-Message-State: AOAM532/GphiLG0Cp+ILqfs+6c+Y0GFJ9+LKCuQvPLnZ/ANpri2JVK5O
 MKS5FrkllEAYj5N4mCoURcZFL5oajkB3AA==
X-Google-Smtp-Source: ABdhPJwFmFbc12TXojDvEJW9WcejrJWlLxdKV0I2mCoBiE2nma8giPFJsyuducRaY8m3ytdwMeiV/A==
X-Received: by 2002:a17:90a:7441:: with SMTP id
 o1mr36564159pjk.96.1626905228531; 
 Wed, 21 Jul 2021 15:07:08 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 10sm26509437pjc.41.2021.07.21.15.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 15:07:08 -0700 (PDT)
Subject: Re: [PATCH for-6.2 26/34] target/arm: Implement MVE saturating
 doubling multiply accumulates
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bcbdb1d-279f-73eb-80c7-052e14d51f93@linaro.org>
Date: Wed, 21 Jul 2021 12:07:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
> Implement the MVE saturating doubling multiply accumulate insns
> VQDMLAH, VQRDMLAH, VQDMLASH and VQRDMLASH.  These perform a multiply,
> double, add the accumulator shifted by the element size, possibly
> round, saturate to twice the element size, then take the high half of
> the result.  The *MLAH insns do vector * scalar + vector, and the
> *MLASH insns do vector * vector + scalar.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 16 +++++++
>   target/arm/mve.decode      |  5 ++
>   target/arm/mve_helper.c    | 95 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 ++
>   4 files changed, 120 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

