Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1FB49DC54
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:13:27 +0100 (CET)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzuI-0004ZY-A0
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzbs-0002CS-WD
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:54:25 -0500
Received: from [2607:f8b0:4864:20::1030] (port=43809
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzbj-0000SC-R4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:54:24 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so2127705pja.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oihACpgOP/5+YMyu5MBJJhXG7aRyscDF9JQXBQifPaQ=;
 b=UT5wMe9auh5GVBTy6tlx9RYGgv1RLWf57JwgJUhCV5f1vGx7OhjE/nGuAJFXFy0Fau
 NQAELYEyu2LOdXtWpaVb698JHNP9fuBz5DDliszroT8CpljvasAjOj4Gw4XMN59hFnXV
 lx4sPj06Az2vSlAFObzDSfdSRQTMBTCtV/qRI/QsmbPRYBjaclnZpZpfx4+8y/CvrU7r
 XyqROEIru0Kzt+kUSv4SRyK8A/9E0fbdSIhzD6Xa8RUJyN9+l8cwPBCRIX/EbLRIGFU/
 03tBdlCk4c6ZEQ40zKpwZ7K95lP8evhxRx3oifPtoi+930A3tUH5VepAixjfnY72wHS4
 sR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oihACpgOP/5+YMyu5MBJJhXG7aRyscDF9JQXBQifPaQ=;
 b=0vbVqUZysH+FoEkGdkeVrkXozbv2MSpA8NsbcZLmRZhfSC0TDsMLch918XZCABBCgR
 ggLxgKutsDNLAbmntMAH6b1l+iSLbqewvffkXllm8714W1SPS5otZjDQfhCcXSnVAztc
 Ujjj4ypY79KHinrU6mqZs4j5muA41hBykzm+0sSxjMRxAgACgtniR+UsXZtgN6jUT6oy
 EDgHZtCTlo/j/KOOgbLUJqaMRcbI6UtzJravYQ8f5YS/JiNN/F2RhahpOyYqft0ya6v2
 Dd6etNXxU8LggFjHRBiytlPluWmdvgHNgfqhqBSg5ejubEmVQXZN6KIBNQxyPeeg3g62
 5iRg==
X-Gm-Message-State: AOAM531+qNCLzU1P65wNmPK6lI4BmT6NNhhlupgle3amEWXwkNzEZxpo
 2yjAqh9RMSyuUg21VaM1DEW3nQ==
X-Google-Smtp-Source: ABdhPJziLn43y4+W9AWr5+PgCvvWeDINJpcU+DxEAJumqQ9Z2gaAAai+GRG4illJ28phMGyXMkX64w==
X-Received: by 2002:a17:90a:15cf:: with SMTP id
 w15mr2964899pjd.79.1643270050902; 
 Wed, 26 Jan 2022 23:54:10 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id b12sm4526918pfv.148.2022.01.26.23.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:54:10 -0800 (PST)
Message-ID: <46c3225c-db01-7fe3-bbba-735c35e307a8@linaro.org>
Date: Thu, 27 Jan 2022 18:54:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 34/40] bsd-user/signal.c: process_pending_signals
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-35-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-35-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Process the currently queued signals.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +         * us to take anothe rhost signal, which will set signal_pending again.

Typo around "another".


r~

