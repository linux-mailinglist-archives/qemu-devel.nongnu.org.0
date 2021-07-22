Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2393D2D17
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 22:04:09 +0200 (CEST)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6evP-0008By-Kd
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 16:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6euO-00077n-Ci
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 16:03:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6euM-0005Kk-S4
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 16:03:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bt15so7675001pjb.2
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 13:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MPb+UZPPToxxk24vH6DkoyxFhS0dCO5Qv5JFT6QuOzE=;
 b=J6Z9x6uO9CuAU4r1sU0AYyIf40Xhn3gYhryyzmOf8p5sLZkI4VojDcLZbIwST5Zst5
 Fs/U/WU1fsdXAIyFpkvwZP8epvJpcGdK8Zx8ZD4NsbwU9sFMVPE1WBquWhmMecBEhTEa
 Gb9FqkE4atj18t+FvDcv/9ErFIKAxjJe7GhjEBU/bZnMp7vMWqFuj/h8s0aAhB66W/bo
 EYRJu4i2BIqQpiAnZLlT4ARBXAcyhlWvn5g1m6+T9XGVBbSMHR0GB1Ms5rjy26xp/NyI
 pV1Pjh7G3AoCCGpm96mN4hoeR1XVLTHFGr0/r2RTxRo0TjVQ/fAgS2sE0iY91RlwFzSq
 ak9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MPb+UZPPToxxk24vH6DkoyxFhS0dCO5Qv5JFT6QuOzE=;
 b=NYSsH68fz+zDEvBR8RuaPNnScfMRzQbeXKEWRbM7cohb29EGdL/NMcx7v6ZL5lNiHj
 XcdxKL+W4yDAPkPwdtTFtR5yBHueF7zzlMdho5zJByKBFh6Y2M++35R0F2eyB5OOEMV5
 goK4xJdKBldG/DXlpR6f7qH+jgWjuyDCI2XbZ37hFtbbBen5ybs2scmawhhHyO2bdIYZ
 45+U7UF+cWGxtnHqkMXdz5Ugw/Kn3jNZnZm+JfDdqpe8y6d+SfOLFOoe+rDHeJsrubgC
 16WYldZBdthEsRQ3TuA/TLRaNRIqUTdsbJrDs8v5SC263J4ZZBuQLZwcYMF3mChTkU1t
 +5Iw==
X-Gm-Message-State: AOAM531Q88ZMi9owBS1ib5QVtEx0DZskZ5YLiJLc+zUXHk2qf4dR3our
 ychiXEU57jXwFLGfBYUAcOyISA==
X-Google-Smtp-Source: ABdhPJxRap54CD6DFvuGhYgI8WSiR47uElK/VRMk2sUyK1wGJJaYOqD3QYIzXUfIgUOl1KpxjA4M5w==
X-Received: by 2002:a63:470b:: with SMTP id u11mr1598798pga.340.1626984180999; 
 Thu, 22 Jul 2021 13:03:00 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id 202sm34128517pfy.198.2021.07.22.13.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 13:03:00 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Don't list Andrzej Zaborowski for various
 components
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210722180951.29802-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56d144c3-303c-318b-5622-919b220cc63e@linaro.org>
Date: Thu, 22 Jul 2021 10:02:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722180951.29802-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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

On 7/22/21 8:09 AM, Peter Maydell wrote:
> Andrzej Zaborowski is listed as an "Odd Fixes" maintainer for the
> nSeries, Palm and PXA2XX boards, as well as the "Maintained" status
> Arm 32-bit TCG backend.
> 
> Andrzej's last email to qemu-devel was back in 2017, and the email
> before that was all the way back in 2013.  We don't really need to
> fill his email up with CCs on QEMU patches any more...
> 
> Remove Andrzej from the various boards sections (leaving them still
> Odd Fixes with me as the backup patch reviewer).  Add Richard
> Henderson as the maintainer for the Arm TCG backend, since removing
> Andrzej would otherwise leave that section with no M: line at all.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Andrzej: if you're reading this, thanks for all the work you did
> on QEMU back in the day; and if you do want to still be CCd on
> patches let me know and I'll happily drop this MAINTAINERS update.
> 
> Richard: are you happy with (a) being listed for Arm TCG and
> (b) it being "Maintained" status?

Yep.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

