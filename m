Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296973D1963
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:49:34 +0200 (CEST)
Received: from localhost ([::1]:37514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6K5t-0002hA-8o
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K2K-0007Is-3R
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:45:52 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6K2G-00025x-Go
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:45:50 -0400
Received: by mail-pj1-x1029.google.com with SMTP id j1so1543938pjj.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=cC5kdZvjngHHAKWeMEuLpnIjYkfjTzSsjHpLIpv9aTU=;
 b=sA6+jxiHntZCUReu9f4XmU7n7a2JvRk+MzDAkIx6j3q6wv2sdWh1Q3tG+wUsJcpRvk
 xLSjn4JeVXUCmRcCOHUc225DXoeFbzTEuQ7CcFzuxCxm94Ui2MKfLubJfBGaCzCNeCNx
 5TKo2mB1ffAc1KGtmr9RoS9w+fyNuE8YBheQawPaz5AorvrVL7EZf8mpEEsl8pj82QVK
 vnjV+T5wdN5S114W2jil12pdDqcVhWcOZMfu4Kk7blXXpqqQLJMG/hgE2B1WkMx6MPrM
 l0S6o2rEd0frgOG6YW/XEVLW2MAJ7/HHqB9lSLl1oAmGyoQ3MfUkihfM3bhxlCYNDwgD
 VptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cC5kdZvjngHHAKWeMEuLpnIjYkfjTzSsjHpLIpv9aTU=;
 b=iQ6TM8JzMxhX9IplBxHeQd4xMP6zbeGgI2zz12Bio6bI05eNX6ihoy4EpdzsSHvxYg
 ZbfrxE2LahLHCHgRyJ11e4CktnZIkRSdcl7/ubJch00PhEBtwXGD+FHdgfcyVzRfsEME
 o+RXq0bBLrE74HwrD0VMXcCgNQuDc44OaPPF+weZBvMXHS5oU0KOZs9Pg79AaeDR98iU
 2vab+nO3bz/00WjwUBforLfzXxkCvhJFyjhnmzxvf1/sJlawE1bLSnO98Z9xJJkNFsBX
 v35ysceUkER3NsRb+wj80umSPZW3f0Z7W5hFz06+g2o9Nmfec4gmxLNo8906/sspUVga
 a9Hg==
X-Gm-Message-State: AOAM530RE2Duaw0gCYMHB3URQOlas3i9CEZ1WhoLqqZ9Zskd+eWRfWki
 Ox08HNeU0qf0F7Cx88BO2+yrtUg8ZXLTkw==
X-Google-Smtp-Source: ABdhPJzIrjXB71ezFge5PMz6tIIuUjtWLLLECJ0dPlqP30r0hDHdfFlMFzvclbvvmcWrTaRBq5/B7A==
X-Received: by 2002:a63:4b20:: with SMTP id y32mr37787146pga.382.1626903947129; 
 Wed, 21 Jul 2021 14:45:47 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e3sm24009998pjw.20.2021.07.21.14.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 14:45:46 -0700 (PDT)
Subject: Re: [PATCH for-6.2 23/34] target/arm: Rename MVEGenDualAccOpFn to
 MVEGenLongDualAccOpFn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84ce2abd-080e-6190-939a-ba2895ec32c9@linaro.org>
Date: Wed, 21 Jul 2021 11:45:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
> The MVEGenDualAccOpFn is a bit misnamed, since it is used for
> the "long dual accumulate" operations that use a 64-bit
> accumulator. Rename it to MVEGenLongDualAccOpFn so we can
> use the former name for the 32-bit accumulator insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

