Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88455BCD1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 03:01:11 +0200 (CEST)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5z6B-00074O-Vm
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 20:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5z3p-0004fS-Oi
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 20:26:33 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:56194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5z3n-0005LC-Cu
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 20:26:33 -0400
Received: by mail-pj1-x102e.google.com with SMTP id w24so10936856pjg.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mvbVu4UNINwfvUxwoD+RsDOHbbIzCxPPtGurGM0KFNo=;
 b=EHr+fN4k5ArjcK2/3U9hLNtwyWGSV7Rbey02eHG6LXERYx7diyuu19Z3TdDpkCRVQC
 0OLpFrdRQ9j8xvZCK7hDewzWoDqX19tKWLzGKTbxPxy13mbvwYMit3zk++GBy0HkwHy4
 OgJSnW7kaZw9GfT72HGy95EZ4zhUNOLsnS1Zj6LTOmLef0IidqguC9eaR7AhFGBeRRUS
 MMCyZDGzRnBYl1qM12qVRGz9EDkysX+dSpbb3EOF2xxhonCEz0MtIPvip+Hs0NMUlKuY
 bh5Bwps9NDB0fSnzDd3W9cbJHUXhTB21623wm84eKtKGek8k0f/T7pJVAKS/hlV9mdOf
 cgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mvbVu4UNINwfvUxwoD+RsDOHbbIzCxPPtGurGM0KFNo=;
 b=r2Ba5+lvA8FOi6ZbaPDyCCAvAr7hVuFuJ//39tEiSSQ5dlP0l6OSpzkCMZ8iedLfok
 sm4qAzUzerlzf5XEhiKtAX2+tLhXZNp5GtGZc7Di/U5AM17IviDlNrvTkeaZp/cKwOB4
 66dlUrMrkK0v//eu+YoeLNsPZB25LfPX1/IUuTUg9D/LIOlOFVlhoKskEOUi3CU5lxP1
 wxXuztLew1imGvrPFP1NurOhwIxUaPRcuYZl2Dgf4k3DxXKAgmLsHCjRCeWkaHVBAP1B
 BOLYw3WvvcE91pKSXLHqmA9+9FrHR6UQo0UkmSueXbnPfuFwMuaYDo1z3Z46vMXik0XV
 Q12A==
X-Gm-Message-State: AJIora8WEQVJ+x9R3YCKvVVPURMCO9+thRddDnq/hHjJMc9MBNaLDWVJ
 m5yO3fZZc6Afu/T4Yrqjqab/eA==
X-Google-Smtp-Source: AGRyM1uHvxrukrWOxS5iBv+zinyIkrz7+NnPxsYptgkhsQxE/+Xxpm7VJQld2hFNPewLzI2GApgeZA==
X-Received: by 2002:a17:90b:3596:b0:1ec:f563:d64c with SMTP id
 mm22-20020a17090b359600b001ecf563d64cmr23508680pjb.88.1656375990136; 
 Mon, 27 Jun 2022 17:26:30 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a170903020a00b00168eab11f67sm7823812plh.94.2022.06.27.17.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 17:26:29 -0700 (PDT)
Message-ID: <564d8ebd-ad33-ce77-05e0-fe393a2e87e1@linaro.org>
Date: Tue, 28 Jun 2022 05:56:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] libvduse: Pass positive value to strerror()
Content-Language: en-US
To: Xie Yongji <xieyongji@bytedance.com>, kwolf@redhat.com,
 stefanha@redhat.com, armbru@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-4-xieyongji@bytedance.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220627090203.87-4-xieyongji@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/27/22 14:32, Xie Yongji wrote:
> The value passed to strerror() should be positive.
> So let's fix it.
> 
> Fixes: Coverity CID 1490226, 1490223
> Signed-off-by: Xie Yongji<xieyongji@bytedance.com>
> ---
>   subprojects/libvduse/libvduse.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

