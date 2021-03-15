Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D101133C6B9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:22:49 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsng-0008NZ-Qk
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsKx-0008Kk-S1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:53:08 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsKl-0004Yl-Pf
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:53:04 -0400
Received: by mail-oi1-x229.google.com with SMTP id o22so25797290oic.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YDckSO5G7/hUCKzGqr8bQZKVflDEk8kuTEEBXwXnQ3I=;
 b=y4bAmrhcy2GEBhw43qPN8I2NQ9wEHO8aEgTkfc5GUGcKaH5iCsm4fEno7so3fNgjfZ
 a9YvNpROV5Zlpbl3F4badWiGMu42pXpNkpMiEhrV56vkPyHVk4HIVgXZXwXQC3VPOewv
 B0UgjyLUfZvtdY5DeRUzVEjGwAk3MjmK6KFD2eCeigoAtmWTb7pcDc7jQYDeVta0y88V
 rrtPV0q9Jn3Bo8EvlateS3xsS7WQJd3VFysAMQJ1NQAZ62U3J60pNtc85A86BJMh3oSI
 NNB6rM+lIjaqHyzP1BOz5YNSMFeZWQQ7gHHnBojo/QFt4FaGlIRM0yxZ+llzxg9J8x7g
 w0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YDckSO5G7/hUCKzGqr8bQZKVflDEk8kuTEEBXwXnQ3I=;
 b=pIjjD0W1C00WLl7SzGENIcrna0KtVBJItH3FLlgz8esQKIxYhxaaPWgHwHm+RS8xOs
 N285Zw1Sf27+lNWVTIFvTq9b6HmF+Kfd7DMzWUkyaFERNpclAx0ek8r50pvRvmmvxEzG
 d1axeEw+N7lMov9StHUvRRbkNWc9E1KQx6zATrKdhVmpDUa7TBuQdAaufjgd8bGUvSN2
 1fw0d2V0iLZybTvbh+HMNtzOm0y4Nr0ColOu1q4wZ20Rg68+zQxZltfWTZuOLD6G1fER
 XRytmEr6LH4snIm4zG8i3wBgooEBbZnllC4axbptSI/yOlhmf7g0gT4DOq7OUO6Al0Kb
 y2dw==
X-Gm-Message-State: AOAM531ZtcQvCrLMfJkI9O5PHh1iZK2RgJPZizBpgZcJSakspoaHJQyV
 6j8ODmsefZ8oBo5A5gvTEwAvXVKNTBJPqwFY
X-Google-Smtp-Source: ABdhPJxXUINnPOzEUxzX/hBsx8Go7Ojkm0RjgcRlwgupcTkNGnX8De/53qZ+kuFVtmKL/blMnhMXPg==
X-Received: by 2002:aca:1305:: with SMTP id e5mr364707oii.39.1615834374516;
 Mon, 15 Mar 2021 11:52:54 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 109sm7238075otg.75.2021.03.15.11.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 11:52:54 -0700 (PDT)
Subject: Re: [PULL 0/1] Fix qemu_strtosz regression
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210315185056.1986167-1-richard.henderson@linaro.org>
Message-ID: <3bfde6d6-f4d3-cb7d-772b-98cfb75923f9@linaro.org>
Date: Mon, 15 Mar 2021 12:52:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315185056.1986167-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 12:50 PM, Richard Henderson wrote:
> The following changes since commit 51204c2f188ec1e2a38f14718d38a3772f850a4b:
> 
>    Merge remote-tracking branch 'remotes/bkoppelmann2/tags/pull-tricore-20210314' into staging (2021-03-15 15:34:27 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-misc-20210315
> 
> for you to fetch changes up to 7625a1ed013a042748753750c9d9b1a33c9cd8e0:
> 
>    utils: Use fixed-point arithmetic in qemu_strtosz (2021-03-15 12:47:08 -0600)
> 
> ----------------------------------------------------------------
> Fix qemu_strtosz testsuite failures for i686.
> 
> ----------------------------------------------------------------
> Richard Henderson (1):
>        utils: Use fixed-point arithmetic in qemu_strtosz
> 
>   tests/unit/test-cutils.c |  2 +-
>   util/cutils.c            | 50 +++++++++++++++++++++++++++++++++---------------
>   2 files changed, 36 insertions(+), 16 deletions(-)
> 

Sorry for the duplicate.  Misfire on the git send-email.

r~

