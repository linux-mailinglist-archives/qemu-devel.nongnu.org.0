Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B943D4D42
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:01:59 +0200 (CEST)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7cpR-0003wk-9T
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7cnl-00034T-MV
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:00:14 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7cnk-0004yC-3x
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:00:13 -0400
Received: by mail-pl1-x634.google.com with SMTP id e21so3870485pla.5
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9Vw/DUs1I5vDt+7yH369LVsicju3+vcK2Pyk6lJhA/o=;
 b=Sq+Wb/NL+2300uv0c3tcxwuwmtLFjYGK0nhOXH8vuRQleS7mqEjlOVgYNdT2mWaY+a
 c1Z/FofslNX3ImpjamfLjwuhFxUrNrZs0gC8VmoCXe4H5JKwnWS9909iOGgzucZIUYOE
 VBFvfTcgHd2Ly24NszzRZMnMfOm4ekk1L1h0rBGPpPs7PsxMYnzLY6Qdc4QfvW9kEJI5
 rPCkgDcz9COlPrv4fv42+IkIhpsC+CVi9rEiRfowTPQM3gNjnatoz+zcB2aG89ujQz6P
 K8r32BIGo0ymebHXKnMh+t2tFXm3vwGWvmxanglztCS1/bMzjMK6V3kjXvJbetixxHGb
 3HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Vw/DUs1I5vDt+7yH369LVsicju3+vcK2Pyk6lJhA/o=;
 b=ErTOunIqGVZRXHVjH7OfiomD7GYwQ2YKEDGIXb++iasruFY8BBDFCwHIH1/NMaqGsA
 sYXrB32WEQKgVh6t5qIqiY3jRpeBulWItcNiQ6ccvl2IqytFabcyWvjnOeE4a1/87nhz
 DlE1fw5Rct21EC1luYaOT9fqYjTCiTNeLKByMvI2pgWECb/wRCZhZL8sCwMtVzbpB2se
 NbjalNQv4bVLg3s4cjUNktRCuUI2ZO/pTWojRLoONxJddIZb3Cpqbzg6PN7sE1cu+Tw1
 r9774HqWF1vGEoSUzrEnj8gBuyVN5PuGuHpms6ZDFmbsE4NuQUO1RjIFcC4OMgZKWUmZ
 nj0A==
X-Gm-Message-State: AOAM533ij98abvITCtTAAQbfpksZzSqq6NjemTL4FomZ18SA2QclnA8m
 G3pqyyynoRVlrERYGB6I9fYMVw==
X-Google-Smtp-Source: ABdhPJyssVup1090XT/epv/Pj2DTuJY01V0whxFF2gESZNRh92usVaDnhE2EhshsxolvF6t34bjGoQ==
X-Received: by 2002:aa7:8593:0:b029:32b:c173:cd96 with SMTP id
 w19-20020aa785930000b029032bc173cd96mr12981299pfn.63.1627214410599; 
 Sun, 25 Jul 2021 05:00:10 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id l2sm38488443pfc.157.2021.07.25.05.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 05:00:10 -0700 (PDT)
Subject: Re: [PATCH for-6.1?] bitops.h: revert db1ffc32dd ("qemu/bitops.h: add
 bitrev8 implementation")
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, f4bug@amsat.org, laurent@vivier.eu
References: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc272e65-2e15-f783-3d34-161c5e12ce20@linaro.org>
Date: Sun, 25 Jul 2021 01:59:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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

On 7/25/21 1:05 AM, Mark Cave-Ayland wrote:
> Commit db1ffc32dd ("qemu/bitops.h: add bitrev8 implementation") introduced a
> bitrev8() function to reverse the bit ordering required for storing the MAC
> address in the q800 PROM.
> 
> This function is not required since QEMU implements its own revbit8() function
> which does exactly the same thing. Remove the extraneous bitrev8() function and
> switch its only caller in hw/m68k/q800.c to use revbit8() instead.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   hw/m68k/q800.c        |  2 +-
>   include/qemu/bitops.h | 22 ----------------------
>   2 files changed, 1 insertion(+), 23 deletions(-)
> 
> ---
> I picked this up reading the loongarch thread where I realised that QEMU
> already has a revbit8() function - I was searching for bitrev8() before
> deciding that this needed to be added since this was the name of the equivalent
> function in Linux.
> 
> I think this is a good candidate for 6.1 still because a) it only has 1 caller
> which is easy for me to test and b) it prevents anyone else coming along and
> accidentally using it later.
> 
> MCA.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

