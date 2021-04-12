Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2C135D082
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 20:42:02 +0200 (CEST)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW1VY-0007in-Nw
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 14:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lW1TB-00075r-VZ
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:39:33 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lW1TA-0003cR-Cs
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:39:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so2373457pjb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 11:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WXziLO3S5n8+rckARIQmh9FSj8oigDz1AM5WvNFYgfo=;
 b=h4RN/gei0tO9HB4DXhK2J9QINopt+0zMaVYxhiawfmiHjISak3z3dgnAsjel+Smzu1
 G/9y8X7/4Jf1koFyiA9RY4PS6ua3kFXqr404M8BO97jaJOa2LIC/hNLgCWI1IsmH3k7l
 okPRMia51BehCa/EyqxeA8p02j1SEfl0GMYffNn55lChUUxKCOH0O0vdS5Igah/4eivj
 GdRiPwgMPNSDNO/LxugfWWsNI7Rk4DEAOukIVDnlXx+KmlQcQWF41lGCdTJPtOUSvNA4
 XQooebH6Dk4rMw0SeXGpJ3ahYUiTS+vGCrcs9yT3Ko7hc2/1NRMHKjBzYMALmoWZfffq
 ZQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WXziLO3S5n8+rckARIQmh9FSj8oigDz1AM5WvNFYgfo=;
 b=bFvwHplrP3NRK89xOCC676wrhY3nJtZ0l/U2tJFu2yZ65AVO3DYL4G9IGgIOxaJIsv
 gzdG/G2wRLr1bd2wfiviMv6WuO0vZmwwKSHCDn2gdiZ9hZQVAtWBcIFNaLT9ESAsWBow
 ODzZgquYfMQldAG0qm+wTcTwp+weobIVCB1im+2niUnbmLZeYuLno9UNwm/mvJ4Os4fA
 9o6otC3xvAfsSuRikeqTlQ41cKFc4uJSE6dIoaiHSGslySvR6Uk6R4Mjhm1grRmESCFW
 xMxsR4vDj5BEALaaMLF/5KtJjDoXWaAUXrJwQ/Joql5F5eptcSqwsdUBdqT43jyj9NJ2
 jEYg==
X-Gm-Message-State: AOAM531i6OPTh4Pp7NmUh1fmmJoD51BPSo3CAyC1tG7fx8AoSbHBfPE9
 ugYvdG+5IoS/vH0wH2NzX+pwEg==
X-Google-Smtp-Source: ABdhPJwBXpecpoqYzk/VozRlj7S0f8KtGS7UvwwL8Onc/w7BzogrCm0LOK/ckY4r1ThZ6e8X45s8hg==
X-Received: by 2002:a17:90a:bb0c:: with SMTP id
 u12mr584006pjr.234.1618252769770; 
 Mon, 12 Apr 2021 11:39:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y3sm10544202pfg.145.2021.04.12.11.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 11:39:29 -0700 (PDT)
Subject: Re: [PATCH 0/3] mps3-an524: support memory remapping
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210412134317.12501-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8243495-e357-c80a-ef7d-30ae74ac05b5@linaro.org>
Date: Mon, 12 Apr 2021 11:39:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412134317.12501-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/21 6:43 AM, Peter Maydell wrote:
> Peter Maydell (3):
>    hw/misc/mps2-scc: Add "QEMU interface" comment
>    hw/misc/mps2-scc: Support using CFG0 bit 0 for remapping
>    hw/arm/mps2-tz: Implement AN524 memory remapping via machine property

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

