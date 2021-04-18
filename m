Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E650363789
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:26:01 +0200 (CEST)
Received: from localhost ([::1]:37502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYDzU-0006KN-0y
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDxS-00058y-Ki
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:23:54 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:34661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYDxQ-00030X-SZ
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:23:54 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so8180794pjb.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=swVxKOc/3C2GI8BU2/zgUUKJ8gInEx/3aBTmizWThT4=;
 b=H4UkGFWR5maDcJSzqcBzXjq+uKM8p4n/QxkjmcSyo7NKhmfcH6wpGpSs/shVC/+xYk
 Dx7seJeex/PToKrXWfkJd0zQfnfqlnNKvd2tqLnv436USwKCmL2Zjr9o4GlafbkhHqLp
 R+odY7JQjHEEUfD+bb8EZHRKr9VEGTO50vYehHrjprUVa/wjjiBrzF9tV+s19SSvngBA
 TjS2s6iwD+Wa6PbHzz26PL5Jz6QtktEhH7rcK367PbrbGrXQQ7LlrZQHDHcLPTTIXrgL
 zMjc76OU6ovSItX1BpyxDbH7UXwZ4NfO4NynvKZYwAOGF6Q2cmqGBW7+SnM2aWX0MoSl
 qN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=swVxKOc/3C2GI8BU2/zgUUKJ8gInEx/3aBTmizWThT4=;
 b=iLff1ifw1C7WPgUf/NnPNWipttciZvJTqUJHcLuaRp7S2VqRGAjgnlZjv3fJe2R2yS
 CFDSY64J8qb5lnbd1T4jYNtAoFF/JyCGlX59nlaHyXbOnSklpyIKH7jWhfOEynQMafiv
 XyO8v9rR3qIIIa6DK7Znn24D70iI6ugo794fDGM5yJSHjTHKJyHqdB58wRc7iBhVXZKU
 GgsacDoB7eoRhL0EDECeeSfKWf3xZN4j7f3keOycJVaEQg3iEpXL9pJ7pjPCehSUi5Lo
 eU1LZzL3cV8VdCoqkD91WoMipXImnm+oTZ7Oz+XGnM4pULsiRtAQGf9uCg+44vCVcR+w
 gw2w==
X-Gm-Message-State: AOAM533mMAFzru574dlzAcOxgiS6jfgwKOhoyR2grVsv3kTndfrKES2y
 1+M6Zf1i00t42Ckhf9BmIfW0dA==
X-Google-Smtp-Source: ABdhPJyTPhmzlLqv5EolP2zWNbaZdZi3tw85Xns5uGU7YfI2jOpB5/WQAdMfg4Z/W/Ic85XVPfMleg==
X-Received: by 2002:a17:90a:854b:: with SMTP id
 a11mr21426400pjw.17.1618777431364; 
 Sun, 18 Apr 2021 13:23:51 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id n25sm10373686pff.154.2021.04.18.13.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:23:51 -0700 (PDT)
Subject: Re: [PATCH 21/26] target/mips: Move exception management code to
 exception.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a72a285-8a9a-df36-55ea-a82c1b4ef6eb@linaro.org>
Date: Sun, 18 Apr 2021 13:23:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h         |  13 ---
>   target/mips/tcg/tcg-internal.h |  14 +++
>   target/mips/cpu.c              | 113 ----------------------
>   target/mips/exception.c        | 169 +++++++++++++++++++++++++++++++++
>   target/mips/op_helper.c        |  37 --------
>   target/mips/meson.build        |   1 +
>   6 files changed, 184 insertions(+), 163 deletions(-)
>   create mode 100644 target/mips/exception.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

