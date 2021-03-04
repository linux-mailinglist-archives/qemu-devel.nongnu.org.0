Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB51032D869
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:14:32 +0100 (CET)
Received: from localhost ([::1]:34012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrYV-0005ve-Px
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrXG-0004oj-Am
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:13:14 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHrXA-0007yr-Dt
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:13:13 -0500
Received: by mail-pf1-x436.google.com with SMTP id a188so1969186pfb.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UTM8r/yF+JYECnPc5aEAPc157zPtTHvqVNPDoOG9R44=;
 b=rqMfY6uzO03mEhIzNa0HxmSxtb3i9ST/4bYp2kRbjqpFA9m9+YtntROB0cAVZSP49S
 aI3bQoNKmJfZMP5Geo+lVb2yl9Sn9XMErSGlcl99vuq7/7ZZV6Ff+OK6I5tnhBoijN10
 EcPtWm4x+TyyIGnqEzIVfSUwz2hEx0oSjfZ5B3hXStXfx9qF/WE0T90efdh6nHtVzf60
 8PJgip64vX//YyvlLVBsKnl8Sg9l8ysT2zAP4jLbNfy+XSn4gdM24UHT4tqv8qjkW0ju
 hf3mh5ZLRdEAugZkHbkO+eerlLG70A3+yjG8o7DVt9fRNqTBhY3kLuJBGZfS8HFg53+v
 kijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UTM8r/yF+JYECnPc5aEAPc157zPtTHvqVNPDoOG9R44=;
 b=JQCTrjab3PkhkUHXtqpOojiNceT5xstvMCN46JoAkVGv67u/3a9Ef33POoDMrIhgB+
 WqWWGVRLZcm/5hkrpo/kUPn3Ioo6n4L/cX/IBAynE7hrWislT2r3hMEWSF1Xp+rhFPx9
 +WMW4qEeq8NJz8Sqggj0MAtwSsD+peRwL4/U0DuwFHQZA68pOfq/iGZWKADvMAlIwUWG
 s4K8osnJUTBi/qQkb9/NMFmaH1sFqe+i0c3+Xtu3dCVYtHBf2BE7BJ2LKuwa9flO2PCs
 vIAiQ2Qs79hOrdWhXGTOjCopFpE4FZNBbEzSi7SzEQP89xrnuB0wbDn9y8U6Jxb2rZ0w
 0f8w==
X-Gm-Message-State: AOAM531lfvp7z685T9ZAsBP+e/QgbjTHzj258/bf8CjhmSlJh82kkEIP
 qecSPPMDuFFh3Ri0wluaLR//tiMxuP2jkQ==
X-Google-Smtp-Source: ABdhPJwkxnVUQKv/pxSQTE2rKyBEAYCd/erlJmR3ySeOzXR4ihu6hChXJT+8qq/P2gl++uvZjBOg3w==
X-Received: by 2002:a63:4513:: with SMTP id s19mr4339816pga.229.1614877986778; 
 Thu, 04 Mar 2021 09:13:06 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t22sm5632100pjw.54.2021.03.04.09.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:13:06 -0800 (PST)
Subject: Re: [PATCH 06/44] hw/misc/iotkit-sysctl: Remove is_sse200 flag
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0bf69e3-d9a1-6a97-a23f-8a23bbe4e2ac@linaro.org>
Date: Thu, 4 Mar 2021 09:13:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> Remove the is_sse200 flag in favour of just directly testing the new
> sse_version field.
> 
> Since some of these registers exist in the SSE-300 but some do not or
> have different behaviour, we expand out the if() statements in the
> read and write functions into switch()es, so we have an easy place to
> put SSE-300 specific behaviour.
> 
> (Until we do add the SSE-300 behaviour, the thing preventing us
> reaching the "unreachable" default cases is that armsse.c doesn't
> yet pass us an ARMSSE_SSE300 version.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/iotkit-sysctl.h |   2 -
>   hw/misc/iotkit-sysctl.c         | 256 +++++++++++++++++++++++---------
>   2 files changed, 187 insertions(+), 71 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



