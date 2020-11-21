Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384872BC1EB
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:08:10 +0100 (CET)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZB3-0001Jn-9D
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ9M-0000FX-9w
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:06:24 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZ9K-0003ry-Ql
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:06:24 -0500
Received: by mail-pl1-x642.google.com with SMTP id 5so6745206plj.8
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7s/7vXML9GxuVW2WLbo5TcIECOicwJD/bCTeBYGwXEc=;
 b=Ob/kfjHJWLyxIItkSfSJvrXwHy4udvBuicL1aU64XBZ1EPUBit0yksIATIpyFl1hMM
 1aOqIIHH+2bMItv8mcgc/41+oxNeYnn6qYH4Rot3mrvgvPvGR85khfOEqNxZZqaNMUew
 /Bf957I9Aff4mf4RAWdXcv7VvKc76uz39xJy4OqSv93vYcMS2heN6RelQOgXkqBw6N7V
 m0wfylSZmEIqZTjFtYcsYxg5IuhpSLrOvFjAIW3cxnUeKlST59W+CTAG6p0KFUcvKpEW
 +bhuw1EawNQBJ4qxJ8EgUaLLvCz5CgG2YLHI61sdV8lnSg/BMq899+VHoOVyMwulz4Ud
 hdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7s/7vXML9GxuVW2WLbo5TcIECOicwJD/bCTeBYGwXEc=;
 b=Wizn6DPnWPr4SOj1axNSMPjsxXf7IWxcV94ATITKLWxHQlKHsmQUpA1WQ4Z33KH4ah
 21dqco26WpBQYubtutoeRgagkGGzliT//xNTOgX9k76dXiZPtLwmkk17Zhn2olD8eFy0
 vCL+4aXMVPzMochOxStbYWNW8cSwMzP5QSUcCf7+kWhJGw7ag5bsH9QYUfW3OeZwZcIs
 /Fc7Lnya0dDaUapnLpZslyTdds9c9xo2VtGn7QV60oUXNh9FENR8qC6GpEHhksPqoOwl
 e/V8hnD3XgSZLnzCliisOvd9KtYQAMjUQIURCuHvzF96iLO5qUl9N2QxC5QrgSrB9b+1
 rSww==
X-Gm-Message-State: AOAM530200OT8NEtebnh+QU/0q+8jE4NU/TSatbYzPnmwRwKnoPC+xxf
 whp98pVZIvV9jZW4AyI+ye2mNw==
X-Google-Smtp-Source: ABdhPJyCD83bIMYqNsocQCdvh3G6KVezlhUVXNbDB9BixVIYvoJ2WxD0dZfLn7fuMRuGGiqGfUhv6w==
X-Received: by 2002:a17:902:8c84:b029:d9:471:f0da with SMTP id
 t4-20020a1709028c84b02900d90471f0damr17623980plo.84.1605989181263; 
 Sat, 21 Nov 2020 12:06:21 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 198sm5460015pgd.31.2020.11.21.12.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:06:20 -0800 (PST)
Subject: Re: [PATCH 14/26] target/mips: Extract NEC Vr54xx helper definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e9e02b8-bc39-85f7-63a6-4d0eefe533f0@linaro.org>
Date: Sat, 21 Nov 2020 12:06:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Extract the NEC Vr54xx helper definitions to
> 'vendor-vr54xx_helper.h'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.h                   | 17 ++---------------
>  target/mips/vendor-vr54xx_helper.h.inc | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 15 deletions(-)
>  create mode 100644 target/mips/vendor-vr54xx_helper.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


