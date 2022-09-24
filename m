Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F8E5E8FB4
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 22:39:21 +0200 (CEST)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocBvk-0002Zj-NJ
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 16:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBuc-00013G-W8
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:38:11 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocBub-0004Ib-GG
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 16:38:10 -0400
Received: by mail-qv1-xf35.google.com with SMTP id z9so2103703qvn.9
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Kds6mDwh9Zfxe59KOh6/TVoTIMiYZ5R7XOUjezjbXCc=;
 b=umvkinkZ12pNkeD+u9K9oKuxJNfd6lWzntbZKQbHNybJ7uRUVp4mYD5gpVqZp9sz+Y
 eBUWL6Xwb9+oma9G3juaZL46+xt9fhuZZsc/FKLGuNh0MgNoWqOYJusuDl6ZNpka5Kl7
 v+GpmzU/tS5m3N0LofCRysQuAeAGOrpT9CbgvlnJPM3/HOXcVc2vFVktpsxnykLHNglT
 XtOq7yKd5+D3/JGO92GeitpJkpCMFYpNTYTiTJ9zj+WuwsmLtFCmPB3Y+j7mUcoD5FdI
 7pCzjQNedZje9nxHlIUlaPWJlbk0F0rEHWmEI/9I3Gl/oMb4Ne6E1a2f92FZ2JE3RAt3
 hO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Kds6mDwh9Zfxe59KOh6/TVoTIMiYZ5R7XOUjezjbXCc=;
 b=lTwHMsWAk+6oqU7jeER+lj/a9LWdvJND+DFSi79Td5OgCg6fDJhYm9HP/Dc85/rV2G
 trcbMPWB+eEYUKZfYBVxgFNGZMJ9Xmvg8qZ8bZQ6dVDJaK+DIagf+xIK5V670PlnYtUI
 xn+SfK41rfoCtk4e3kR7ZUEKff1/4MZx8loc/N3E3mhI+XNDTF37KOCXZ+5jKjbtEQMu
 ns4p16GyG+hYSoyWbqnZr71e+Ioo3O+2p6sLEiCf4rhjkZcc8d6H4TzK+C+ep19Y/OSA
 95ybcmR1B9iPrmL6+u/9tc7qEvuv279gufzXqpmxKkyHH/i6tc1cMHHdVSzZZR62EJvg
 RilQ==
X-Gm-Message-State: ACrzQf2bvs0gQvHblNjR2kDWy8H6HzAlGXRjjNgIXXg7Kpakk5ixoGmP
 OSRLW+50zGO6eLA3e0RGIl2h7X6Vy2lGnENi
X-Google-Smtp-Source: AMsMyM4Kr8gOJxmeUR10jzvfRobKshKuEl9Jz/NHl8QSwknSVoW8vSjF/y1HIRarZvqnXVrQQDOQ6A==
X-Received: by 2002:ad4:5e87:0:b0:4ac:9e61:f0f7 with SMTP id
 jl7-20020ad45e87000000b004ac9e61f0f7mr11950744qvb.120.1664051888467; 
 Sat, 24 Sep 2022 13:38:08 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 ay43-20020a05620a17ab00b006ce76811a07sm8537978qkb.75.2022.09.24.13.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 13:38:07 -0700 (PDT)
Message-ID: <0248f837-c814-9a39-8132-6b9c5584b974@linaro.org>
Date: Sat, 24 Sep 2022 20:37:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 21/37] target/i386: reimplement 0x0f 0x50-0x5f, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-22-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-22-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 17:24, Paolo Bonzini wrote:
> These are mostly floating-point SSE operations.  The odd ones out
> are MOVMSK and CVTxx2yy, the others are straightforward.
> 
> Unary operations are a bit special in AVX because they have 2 operands
> for PD/PS operands (VEX.vvvv must be 1111b), and 3 operands for SD/SS.
> They are handled using X86_OP_GROUP3 for compactness.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc |  43 ++++++++
>   target/i386/tcg/emit.c.inc       | 166 +++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |   2 +-
>   3 files changed, 210 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

