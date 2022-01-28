Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6433349F1B8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:16:29 +0100 (CET)
Received: from localhost ([::1]:51192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHkS-0003YX-FV
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHhg-0001br-5H
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:13:36 -0500
Received: from [2607:f8b0:4864:20::1030] (port=41833
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHhe-0006rM-NK
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:13:35 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so5215795pjp.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3K+4lle4h7ZxfhRPe2bNcHfgVN9W4HgPpRjtuWY5m/g=;
 b=yuw4CZHYj5L84H5+lAsZaa1upvgDD8wQhKdXG7rdm2LqWdzfDGdzxqRsIWLwcCQObu
 JB7q/fGNzlfD3zPlsAiJcUqRcsy7ItM5+ZpAsRevcp2KEhCkm7V3e18U+b47F1BE+9Yc
 KcBiWIOre9XEddRLvbW+QuU4JZadUIRDA7QtPpGH6naMl37i5D6SzgqUHzXujdX+jEPv
 XUAW/TaqZLhIR0XcBPRZV+s6C7WoUGL8k0TcOmUFTapcsMxzLECPkeHebPn+0OUKb139
 virHpXllQf1R4QO/x7ApKjOlp7SeQT2aFZIeDu9nu5PevYUTBLOShqVkKPDwj1bEOhhM
 iD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3K+4lle4h7ZxfhRPe2bNcHfgVN9W4HgPpRjtuWY5m/g=;
 b=Io9bkaSmYZBIkzcEdBPdcZ6iPHTw0ZYfiql+nS8bQ7hmxcf1UIDQ4nES49oKdJHOYG
 BZ01te00pxNYlNs/i1d408VdwcWt/hC52K27i0RRKpOELDZwTiAMzJFpHFo9KY7mck+s
 C6VCXx+1A1Zw0dRfdl9WTPXT0O1nbA8kFF9tUCWt6PmcUt1EFCZ+hUlct3kDjDc2mTcM
 oC/Pf43yaLmLiVHgDbKeCCmjvWms1Ph5odVISoTMRb99MBSAj8LagH9InN4KMbzSJcOr
 lRuXwTDN8fOgKLZcH2S0W4jZ2OongjHC9QohYEKrs7RE2o+AE0ikhTiNMj0Roj8iuRJa
 JLzw==
X-Gm-Message-State: AOAM531ka5jIFx6BZ6R0krEJ3c1phjohpIHOp+qG+OsZX64hEIOnKRra
 ulBrnM/ZXiCYvgcuM3pfL2cXIg==
X-Google-Smtp-Source: ABdhPJw+QHzaoGGNKl6zYWX4uQCr5+j+5NFw1Jk6YbL9xyWhl+lvwGDB1DtHxLEbzZVEwulebSXgaw==
X-Received: by 2002:a17:902:7618:: with SMTP id
 k24mr6397991pll.169.1643339613466; 
 Thu, 27 Jan 2022 19:13:33 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id g9sm4348757pgi.84.2022.01.27.19.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:13:33 -0800 (PST)
Message-ID: <f80fd5e1-ccd7-29fb-5a5c-ada7f593214e@linaro.org>
Date: Fri, 28 Jan 2022 14:13:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/14] hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on
 writes to GITS_CBASER
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-6-peter.maydell@linaro.org>
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The ITS specification says that when the guest writes to GITS_CBASER
> this causes GITS_CREADR to be cleared.  However it does not have an
> equivalent clause for GITS_CWRITER.  (This is because GITS_CREADR is
> read-only, but GITS_CWRITER is writable and the guest can initialize
> it.) Remove the code that clears GITS_CWRITER on GITS_CBASER writes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

