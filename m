Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5739407E8A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:21:47 +0200 (CEST)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSEk-0003dr-Ka
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSBi-0001kx-U0
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:18:38 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPSBh-0000XV-Bq
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:18:38 -0400
Received: by mail-pl1-x630.google.com with SMTP id v1so4272113plo.10
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KtYq/y00bN44nbBZIVk0SAMrvbIz4bHH9I1rCYljQpQ=;
 b=AE1PAa7g0CoobInOf5YI3SSmZvxmM3UpVR4xPq0Xu/1bZw/ssCdf8rv4O5vvD1xU80
 icqIfdvZgNL4DPdbA6haHXlpEAm+ZhvRNnT+8W+jaS1LU1Sm+OwjmCF+zTkXKQ+zwDvz
 th0qD3EFmUl+lJRvlfRIx6qMz4Dlj8rMujrJV11+LvePfaRG+sHdTlEWcoyO0PKYXHgg
 PIqV89h7/JkwSvgiR/9wU9PtqH2BXdTnC0n2TJNdiv2nVpKal2yiEPHMgzcLUHb99uyM
 Z6Kp/WBTRV9VEEnQ6ThB1eYtoZSj3k0YsASswu+BdbP9ON1wWLrzR5GcPvR3aWNQNx2L
 uqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KtYq/y00bN44nbBZIVk0SAMrvbIz4bHH9I1rCYljQpQ=;
 b=favMZ5xazmSQSkui0TFhAStkq9wD3okWrimTTkAUFfgSvWmliVG3zjaotsC1l5q/vv
 x4PckZAErVI6CW8391qzmmoZwHupKlwET0i6s1FJWg/SaJDHCOA7EpUmlZ7CRIhFPeOf
 M/SymwOkYoAA3GJlk0XEETh9KZPYxrQiXLA9h9enDBWZgSfNTk3oTADU8tif50o7TFwd
 bOWvx+MmyAUR3U15+soJcUz8gNHJqKXNKIll1VGYVSmM9blNlV930v/PrrVXJmjKg2ly
 cEn+AIqItPPdQ4Xr0XtTWMOHps9lb6gQvbprsw09chNR0gC9yPqWT+3r+/23afcQzJt6
 u91g==
X-Gm-Message-State: AOAM53190thhwu8KWZTK/RHCz+0OzjmsbX7SxY+BPdIbgSAZp19t9dFX
 bVsIAPEztOaeBgE/0eOo6qcBjw==
X-Google-Smtp-Source: ABdhPJzwJDVd5QxqeAfDCLdgXyyYRu90qb9C67fkdF4934znXPqhKYFdrDVGIjSGt3eq9ukAdYhEug==
X-Received: by 2002:a17:90a:4812:: with SMTP id
 a18mr8321210pjh.40.1631463515744; 
 Sun, 12 Sep 2021 09:18:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm4563538pfy.175.2021.09.12.09.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:18:35 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] linux-user: Split mmap prototypes into user-mmap.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3a060819-587e-5ea5-f016-a87ac9218fae@linaro.org>
Date: Sun, 12 Sep 2021 09:18:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:44 AM, Peter Maydell wrote:
> Split out the mmap prototypes into a new header user-mmap.h
> which we only include where required.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   linux-user/qemu.h          | 14 --------------
>   linux-user/user-mmap.h     | 34 ++++++++++++++++++++++++++++++++++
>   linux-user/elfload.c       |  1 +
>   linux-user/flatload.c      |  1 +
>   linux-user/i386/cpu_loop.c |  1 +
>   linux-user/main.c          |  1 +
>   linux-user/mmap.c          |  1 +
>   linux-user/syscall.c       |  1 +
>   8 files changed, 40 insertions(+), 14 deletions(-)
>   create mode 100644 linux-user/user-mmap.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

