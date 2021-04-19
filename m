Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17157364AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:54:23 +0200 (CEST)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZyQ-0000FE-5A
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZTp-0002KX-2Z
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:22:45 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYZTm-0002v8-2q
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:22:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so51924pjb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AnHVTircYNv0nv/kOCogKbuZUez6N0+f6ykDCi+N81M=;
 b=pVL+ytD/jovvZPtVTOUXwZY89gdlFZyoMJ89LoDTqNlxJKq4IvT6XbWWTCYtLcOw6H
 LCsqLwat6kEfPAf/cLqfQ0YN/Fpp+LV15JjknKNldkpushh4NW9tOlcKQ1CxywWTmAfQ
 QR6/+PTFqzzUIVpmTqNnWdyPCvct8Kiq2r6b2afgHBDRM/Y/lIGobxPO8ggfZafXtTvT
 D85JJ12uTbtEikkw9pfe+uA/LQAQs7oeosYWXhqSq52nqLR3HIvRiNXjRiWmBPHL3qXM
 c4j3GlpQ/smRnCWYDJ9nffhcFKi4w+RKnmeajtaspmY295plDJdeeYbZO81WNIR8tAPh
 0nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AnHVTircYNv0nv/kOCogKbuZUez6N0+f6ykDCi+N81M=;
 b=eePYQIJr3yWNscztRqh49oSfBcWMWIcKumfka3FvstVnPYz1X+GTaZ7yif5BTZ7diI
 JYnUILzRkfdNX4z1tPxF4ZaFWC4diCY6jNwMRQ4XBBHiMUeorkJ5YGJtbHIVmgEtUDUr
 6gOluMVZm46Nbx5vQTxh3AMC4YdAICITbpVexe9rMnl4ggTNoeO7P+sEMLyq6SKEZv9m
 fu/WJPw/Hbm/0ciDE4tmhSOy0l6CtJvlpmf8aQDQM6YVcdD5btNodPWFNbKIAHYdiM7P
 qgwi27TcHglmnUFER4HwETNDWQSfOdBaCT14bJj4uQsPumu7IeEmeeRLAOumDYQKgkd4
 NckQ==
X-Gm-Message-State: AOAM533k+whJY5d+6m/GnOShPWSObVAg7aSc2Dew3N1WspzdNcbZTBqA
 SHpH3mqGXyg4kqJwAY42siYk0w==
X-Google-Smtp-Source: ABdhPJyzI/QGpENm7co5sPPjfGr1OFhYY7Q4BFImhWLTT2mYsYG3X2Uw5SS2Uzglni/8q8hfTlpJNw==
X-Received: by 2002:a17:903:4106:b029:e9:244f:9aca with SMTP id
 r6-20020a1709034106b02900e9244f9acamr25211999pld.58.1618860157838; 
 Mon, 19 Apr 2021 12:22:37 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c7:aba4:3594:91a:8889:c77a?
 ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id a6sm13702134pfc.61.2021.04.19.12.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 12:22:37 -0700 (PDT)
Subject: Re: [PATCH v3 05/30] target/mips: Optimize CPU/FPU regnames[] arrays
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419191823.1555482-1-f4bug@amsat.org>
 <20210419191823.1555482-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b9e4fd13-544e-de66-77eb-39c80c4c6356@linaro.org>
Date: Mon, 19 Apr 2021 12:22:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419191823.1555482-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 12:17 PM, Philippe Mathieu-Daudé wrote:
> Since all entries are no more than 4 bytes (including nul
> terminator), can save space and pie runtime relocations by
> declaring regnames[] as array of 4 const char.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h | 4 ++--
>   target/mips/cpu.c      | 2 +-
>   target/mips/fpu.c      | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

