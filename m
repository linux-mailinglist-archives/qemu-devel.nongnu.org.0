Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA93C16E1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:11:54 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Wcz-0000ze-7R
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W2S-00010A-L5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:34:08 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W2Q-0004YG-Q5
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:34:08 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b12so269872plh.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AJPZkbzDGKuE0Ycc2YcySgy0R9L+0shhfPZmysPC3j8=;
 b=ldb5pnZpwgg6vuukWDgkwKnuQKl1M57bGag663YqVZRIJObTlIk31E6cnDcVMnxarn
 Ru/HLbGFmhsxZmxpcJUUr+O9uJR2/bGRWtIg4dy2RozFbNzCGSm5t7/3Qjkd9Wwp9Cnc
 xGlUhr+FaM7xWvQRvOYgKTrkBSP0QGWKCcXxxJOMChz5aF0wY/q5SCeAcatjiVfbudUe
 cvnWhcdT6ciOKiI+Ffm6XNI+Tci88PT048tY3fa+dS/PM9csccQ6fOVHAN4+iXJOY/kv
 /nTba/hxHfbSAllhtvR8Bjp0pvi2nzuxqj3B3k+jD5tCdDf8oxouVqqYPGaqR4rHee2M
 +i4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AJPZkbzDGKuE0Ycc2YcySgy0R9L+0shhfPZmysPC3j8=;
 b=DhDaw9omEYzcNvuZq+2sydeBSs6kQ8YI5YqMEp0vQHVT50FjQIWaU1rrEnQ3SBCp3I
 vvCgPhbtCiUxO/ahn4k8xaThiTM0auOo4nV0T9/aFvaMQy8SsWV3addrtPZ51ABKyHG1
 I143+5CAfx+SU9XmRzfw2q6YcHj7DqgH9gWljlXXxtYleoxKPBd/OZmnFoUrRTjCUUGs
 2B3Fiobh+lfLXnnUe0uikRgZpffQgdOV+3URXpmiHhnzfhNBhU1Lh8UqW7m923LheFKr
 mG8BfsVRDiNCfNXYQAt8Rf4CK4+IwM/0gF4wv9YNqB5t3b/M4ujb95LmPF8kK6k1CgUd
 1OZA==
X-Gm-Message-State: AOAM5321agKXFKKQjrs/+0ZiqnDGgQ66nflpTm4Nm4YO0eDjcVHToNKw
 hlo0B9gUugeJhQestm6QtIBDMtLagij9gg==
X-Google-Smtp-Source: ABdhPJwVtDhB85R0V84QmvXw52FPJm23y1XBLxRcRffTBXW0Zo3IQVm/h7IrnNE8RWzLApJaZopwqw==
X-Received: by 2002:a17:90b:4c41:: with SMTP id
 np1mr33562440pjb.69.1625758445177; 
 Thu, 08 Jul 2021 08:34:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm3758843pgh.34.2021.07.08.08.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:34:04 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] linux-user/sparc: Rename target_errno.h ->
 target_errno_defs.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5af9cba7-3d30-64f4-9a31-403cee9d2862@linaro.org>
Date: Thu, 8 Jul 2021 08:34:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 7:11 AM, Philippe Mathieu-Daudé wrote:
> We want to have one generic target_errno.h (API to access target
> errno), and will add target errno definitions in target_errno_defs.h.
> The sparc target already have its errnos in an header, simply rename
> it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/sparc/{target_errno.h => target_errno_defs.h} | 4 ++--
>   linux-user/sparc/target_syscall.h                        | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename linux-user/sparc/{target_errno.h => target_errno_defs.h} (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

