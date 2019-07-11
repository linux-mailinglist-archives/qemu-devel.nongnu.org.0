Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DB65428
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 11:52:15 +0200 (CEST)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlVkL-0004D0-Rn
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 05:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hlVjk-0003lW-6X
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:51:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hlVjj-0006Du-1d
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:51:36 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55517)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hlVji-00066c-QG
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:51:34 -0400
Received: by mail-wm1-x341.google.com with SMTP id a15so5006423wmj.5
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 02:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gAVGaU2EukknbVz3LSnjZp6iwEIEBAJJTIj+DEAIuGA=;
 b=hL1f+CP1d1r1rCTc4Mh4G/HBYQOTVazEk02NzfndEkGBM7GTGwMFSutQwL89DfP9xx
 rO80l9S3LAFzmNQXxfVsAKmAslTpO3XL4pzLrSL5HL1JD3eZCA0Hz8RXaHzbQWwMOJ5t
 5oMqIszRtjXUZytr3XDvEoVkQDluxM7DTMlb6tbkzQtv2TWRV4pKlLQDkXQ1xt5wWs6w
 FGaebiNqbrGdTfCaYj9dkpoa63FxRotjOgm7gVxZSty4oJQ+O8ixs4528jsX3RSbKijg
 66yR461+5MZHQWIu7FDesye0kWU8o9kgm5lgwnn6Vf8dJBnc7eg84RVO1N1pvSAkS8Rn
 pVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAVGaU2EukknbVz3LSnjZp6iwEIEBAJJTIj+DEAIuGA=;
 b=DGd5d/a9GmMcTkRUNyVvPrUXmH384jjWs1JiE2QYFuhXd1XFpdNPl8QWSltsqhaeXa
 VVlyDNCnoc9jSJdEdeazX4K2wh4tx9EYxHMEdlVCTViuIYV8qYss6+J5RNAmITvywbSc
 1LWFUGnQxg10MrBh5Gfku594/n545zjxn7Fe6xFtQifbfDtFgitePjMaO4C0nr6VP7wf
 e+drCw5Z7zYsSTwBsrKubs5rvQuGQbqKXwU25B9Ryewi/kxdWBUHMSI6Vw6Xp4mipQSe
 hv/KstTLcaWeRwxN8bOKxvRpWHXrPXQKcsQVj08ynlI1FqMUK+VCdadgS5jzwLo4lKxL
 oIBg==
X-Gm-Message-State: APjAAAUERh8sCC7rZwaegCO/IwOoqNR5WDmoLJnyNdY7pyqCV/VfmKPQ
 WmRJoOzL6XJOy0u2dVVq+oWOhA==
X-Google-Smtp-Source: APXvYqzI4Qq0waYStIaqE86ndu7D18y7if+Ng8n5LfJrim4ezQyG64Kz9Hssm22fUfnjmY/HlKdRnQ==
X-Received: by 2002:a1c:2e09:: with SMTP id u9mr3325599wmu.137.1562838692706; 
 Thu, 11 Jul 2019 02:51:32 -0700 (PDT)
Received: from [172.16.96.70] (mob-31-157-172-216.net.vodafone.it.
 [31.157.172.216])
 by smtp.gmail.com with ESMTPSA id g11sm5481552wrq.92.2019.07.11.02.51.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 02:51:31 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190710172437.628-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f85b75f3-f903-7bad-d43e-a545cafdb57d@linaro.org>
Date: Thu, 11 Jul 2019 11:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190710172437.628-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for 4.1] target/arm: report ARMv8.2 FP16
 for ARM -cpu max
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 1836078@bugs.launchpad.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/19 7:24 PM, Alex Bennée wrote:
> When we converted to using feature bits in 602f6e42cfbf we missed out
> the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
> -cpu max configurations. This caused a regression in the GCC test
> suite. Fix this by setting the appropriate FP16 bits in mvfr1.FPHP.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e75a64a25a..0a0a202fe3 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
>              t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
>              cpu->isar.id_isar6 = t;
>  
> +            t = cpu->isar.mvfr1;
> +            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.2 FP16 */

The comment is wrong.  This is not full v8.2 FP16 support (which would be value
3, plus a change to SIMDHP), but v8.0 support for double<->half conversions.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

