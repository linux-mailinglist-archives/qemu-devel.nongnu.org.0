Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8324B1AD3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 01:59:32 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKHb-0001oj-PN
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 19:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKCf-0007zj-1a
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:54:25 -0500
Received: from [2607:f8b0:4864:20::1032] (port=52012
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKCc-0007cQ-ED
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 19:54:24 -0500
Received: by mail-pj1-x1032.google.com with SMTP id y9so6697711pjf.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 16:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VM7K36twrhbVLIHbKLCvj/V4ptkqUftieAfaSqhlDKc=;
 b=bbDMabPX0acpgXw0xxZQBxAEbj1Awa61Avxjx/vJoR9i+bRx4v8p5g+/h4z/d6uW8q
 I1fW05U56LI2Njjpn2d30UOIYC9maYDWQQ5jKY63VwhAN3QsBTHGP1CbI1xRRkiQD+V+
 pKMvKGdfjeMQQSPFDmnbPZQxW91YZRM5VsYs3axzUQbxeEmG/MpDlbUmUA3cq2C36NY3
 wvHMQckCwV//5OZtq9wg6DKQHqYhLQ5mTiRGlmbeyLqahI8Zi4BURdpc2Itrd2pN2xVd
 W/WIgjtm1nn59HpUFRD1/x2TEdzTnXFXjMkhL7WGsxMyWQbnhZiqIKvMoPdQ6y+6WX3s
 vUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VM7K36twrhbVLIHbKLCvj/V4ptkqUftieAfaSqhlDKc=;
 b=bE+kbKyZLmlMtd1pEzQR9RlwwqbFVyjqYnYkzldKNNZyj2Xmmlg64/V6XE6ooV00v8
 hNm8T4yZ43AYZIz3KFbnVqe/C2s2uLJaOclITeWmitsHOAxtrkjTFep3ngBf0TsK7Q6q
 2Tr4MLHa09pzs5lHxzXP96jYGO6X6GHAhuK0/gUBeKDiHgohxtzztKyNLuM93ovP2FT3
 jc9Cr5NSiYg5pK5emcog6kKRMXri9FPYRFTpwDzLkJXm34OfVU/e7LFvp+nuDYocUDyt
 r+AQP49lEU77KUeinODWzPEEk8DmlAOMHhnage5QpMUmQnLJTX9rPZUGTb0WbXQxzfJA
 tvig==
X-Gm-Message-State: AOAM532vn6fRIvuK6tUx1pwdz+5GJARnsK/DVsY8IrLsKjT/EDj7iZ3u
 RtCXAapzT5HWrswuUbAQU3pn0w==
X-Google-Smtp-Source: ABdhPJwif8ec+fwFMmvDc+8IoT2qhTumxItqG+1IWS2BvXdooBmi/IDmFIdm/uDTqcgOADgrKN/dlg==
X-Received: by 2002:a17:903:244e:: with SMTP id
 l14mr9905222pls.148.1644540860585; 
 Thu, 10 Feb 2022 16:54:20 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id p1sm26518750pfh.98.2022.02.10.16.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 16:54:20 -0800 (PST)
Message-ID: <4ef1a174-58bb-ffab-f9ff-0da56f6f047f@linaro.org>
Date: Fri, 11 Feb 2022 11:54:14 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/12] Hexagon (target/hexagon) properly handle denorm
 in arch_sf_recip_common
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-6-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-6-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 13:15, Taylor Simpson wrote:
> The arch_sf_recip_common function was calling float32_getexp which
> adjusts for denorm, but the we actually need the raw exponent bits.
> 
> This function is called from 3 instructions
>      sfrecipa
>      sffixupn
>      sffixupd
> 
> Test cases added to tests/tcg/hexagon/fpstuff.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/fma_emu.h    |  6 ++++-
>   target/hexagon/arch.c       |  6 ++---
>   tests/tcg/hexagon/fpstuff.c | 44 ++++++++++++++++++++++++++++++++++---
>   3 files changed, 49 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

