Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF9849DA55
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 06:50:54 +0100 (CET)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCxgL-00051T-6B
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 00:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxax-0002gE-Vu
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:45:20 -0500
Received: from [2607:f8b0:4864:20::42b] (port=34386
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCxaw-00076O-GY
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 00:45:19 -0500
Received: by mail-pf1-x42b.google.com with SMTP id v74so1714936pfc.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 21:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gCd6p4KyEVxo+JhlJigxcyU27+A4zQo9vqd0xtL+MTQ=;
 b=fERN10X++PXID2UF9ZtsNI5ZrvR6lN1RjfZGgpkcPFch7tcUmmM1BdTSZPNTwrFg0A
 4OucTBAo4xugV6zNQc8srpW+WBswYiyoCk42XZMQMTgvIY7543ug+Rt1HW7W7m5nDna/
 Nb+woc/CXt47zxOswrnfg2HAHvmFTzxc8liSkMq14y0w7xcXdSfrM4acdHSCzt4rgmi2
 5rLoVLWHlKqoFmoC4YnqOWXTVDPRyRpqbLdDOgNm9/lXhWhVGI4OFT5P965G9xAyZHtb
 swAjdoFNABCQO+9eDrkdCQ9YO7LKE0WULnh0xVJbk7fTbpuqN82NtW4fLR1uY66ou8cp
 PpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gCd6p4KyEVxo+JhlJigxcyU27+A4zQo9vqd0xtL+MTQ=;
 b=lMmIknt83JdMJwDuqd0gCZpzaF1+vD26hbjGCqCw+7VJOmZU2DtHtP13GL0G9BWY0D
 QdSTG79S+C8hXxUAfvV5W4A9XCbA2TobLQoanotTAbUke7CH9+bGT/IoZlovITaeC0Il
 X5hmMtpKl33xVK/NrzPwE8zxCa91JiVepdwvzRsTWvUm4xLB+q3+r9lBzGbc+j/sAKcE
 FMnKSfV5U+41dhg0tDx7YxhqFm4T4keBQIESMw5mPDCetOGKpDS4E30TM9r/HV19zgqM
 KM8SlgIGDIDW1k5vVs5vP8pw6VQ8a/yZANnmF5fBsBe6Ap3jBabQIy5sfdY0WK8ABW2f
 wkKA==
X-Gm-Message-State: AOAM531p+bTImBPcRl4Upd+03PPeOb2TU9GXo5cvPebos5zjU8bKG8aG
 8qTlHWydoWABsCT+PSTTB6O73Q==
X-Google-Smtp-Source: ABdhPJwvvN5C9hHa8/n19X/Tn81tGouDAzyXI6edCsrLty9BNwOCFFxHRFTtYoCFfoyY5qXY0Mg90g==
X-Received: by 2002:a05:6a00:228c:: with SMTP id
 f12mr2095167pfe.34.1643262317070; 
 Wed, 26 Jan 2022 21:45:17 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id 190sm3746785pfg.181.2022.01.26.21.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 21:45:16 -0800 (PST)
Message-ID: <a3054a34-6953-291b-0d04-a776f75365e3@linaro.org>
Date: Thu, 27 Jan 2022 16:45:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/40] bsd-user: Create setup_sigframe_arch to setup
 sigframe context
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Define setup_sigframe_arch whose job it is to setup the mcontext for the
> sigframe. Implement for x86 to just call mcontext.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/target_os_signal.h |  3 +++
>   bsd-user/i386/signal.c              | 13 +++++++++++++
>   bsd-user/x86_64/signal.c            | 13 +++++++++++++
>   3 files changed, 29 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



